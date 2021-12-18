//
//  Movies.swift
//  ios-movies-card
//
//  Created by Santiago Mattiauda on 16/12/21.
//

import Foundation

struct Movie{
    var id: UUID = UUID()
    var name: String
    var image: String
}

var movies: [Movie] = [
    Movie(name: "Prueba", image: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg"),
    Movie(name: "Prueba", image: "/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg"),
    Movie(name: "Prueba", image: "/uaEIEIw9Y7DsvbWWMbG9ySjNF73.jpg"),
    Movie(name: "Prueba", image: "/wdE6ewaKZHr62bLqCn7A2DiGShm.jpg"),
    Movie(name: "Prueba", image: "/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg"),
    Movie(name: "Prueba", image: "/4j0PNHkMr5ax3IA8tjtxcmPU3QT.jpg"),
    Movie(name: "Prueba", image: "/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg"),
    Movie(name: "Prueba", image: "/4q2NNj4S5dG2RLF9CpXsej7yXl.jpg"),
    Movie(name: "Prueba", image: "/fSbqPbqXa7ePo8bcnZYN9AHv6zA.jpg"),
    Movie(name: "Prueba", image: "/ygPTrycbMSFDc5zUpy4K5ZZtQSC.jpg"),
]
