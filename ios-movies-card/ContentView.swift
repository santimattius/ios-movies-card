//
//  ContentView.swift
//  ios-movies-card
//
//  Created by Santiago Mattiauda on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    
    private let threshold: CGFloat = 100
    
    @GestureState private var dragState = DragState.none
    
    @State private var lastCardIdx = 1
    
    @State var deck : [CardView] = {
        
        var cards = [CardView]()
        
        for idx in 0..<2{
            cards.append(CardView(movie: movies[idx]))
        }
        
        return cards
    }()
    
    @State private var removalTransition = AnyTransition.leadingBottomAtRemoval
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    ForEach(deck) { card in
                        card
                            .zIndex(self.isTopCard(card: card) ? 1 : 0)
                            .overlay(
                                ZStack{
                                    
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 80))
                                        .opacity(self.dragState.translation.width < -self.threshold && self.isTopCard(card: card) ? 1 : 0)
                                    
                                    Image(systemName: "heart.circle.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size:80))
                                        .opacity(self.dragState.translation.width > self.threshold && self.isTopCard(card: card) ? 1 : 0)
                                    
                                }
                            )
                            .offset(x: self.isTopCard(card: card) ? self.dragState.translation.width : 0,
                                    y: self.isTopCard(card: card) ? self.dragState.translation.height : 0)
                            .scaleEffect(self.dragState.isDragging && self.isTopCard(card: card) ? 0.9 : 1.0)
                            .rotationEffect(Angle(degrees: Double(self.isTopCard(card: card) ? self.dragState.translation.width/10 : 0)))
                            .animation(.interpolatingSpring(stiffness: 200, damping: 100))
                            .transition(self.removalTransition)
                            .gesture(LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { (value, state, transaction) in
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                })
                                .onChanged{ (value) in
                                    guard case .second(true, let drag?) = value else{
                                        return
                                    }
                                    
                                    self.removalTransition = drag.translation.width > 0 ? .trailingBottomAtRemoval : .leadingBottomAtRemoval
                                }
                                .onEnded{ (value) in
                                    guard case .second(true, let drag?) = value else{
                                        return
                                    }
                                    
                                    if drag.translation.width > self.threshold ||
                                        drag.translation.width < -self.threshold{
                                        //TODO: marcar el curso como X o como coraz??n
                                        self.updateDeck()
                                    }
                                }
                            )
                    }
                }
                BottomBarView()
                    .padding()
                    .opacity(self.dragState.isDragging ? 0.1 : 1.0)
                    .animation(.linear)
            }.navigationTitle("Movies")
        }
    }
    
     private func isTopCard(card: CardView) -> Bool {
         guard let idx = deck.firstIndex(where: {$0.id == card.id}) else{
             return false
         }
         
         //Si llegamos aqu??, est?? en el mazo
         return idx == 0
         
     }
     
     
     private func updateDeck(){
         deck.removeFirst()
         self.lastCardIdx += 1
         
         let newMovie = movies[self.lastCardIdx % movies.count]
         let newCardView = CardView(movie: newMovie)
         
         deck.append(newCardView)
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
