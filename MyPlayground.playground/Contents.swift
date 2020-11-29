import Foundation

typealias Coordinate = (Int, Int)

enum Colors {
    case white, black
}

protocol Piece: CustomStringConvertible {
    var color: Colors { get set }
    var pic: (Character, Character) { get set }
    func hasMove(from: Coordinate, to: Coordinate) -> Bool
}

extension Piece {
    var description: String {
        return "\(color == .white ? pic.0 : pic.1)"
    }
}

class Board: CustomStringConvertible {
    var cells: [[Piece?]]
    var description: String{
        var string = ""
        for y in 0...7 {
            for x in 0...7 {
                if let piece = cells[x][7 - y] {
                    string += piece.description
                } else {
                    string += "_"
                }
            }
            string += "\n"
        }
        return string
        //    Вывод:
        //    ♖♘♗♔♕♗♘♖
        //    ♙♙♙♙♙♙♙♙
        //    ________
        //    ________
        //    ________
        //    ________
        //    ♟♟♟♟♟♟♟♟
        //    ♜♞♝♚♛♝♞♜
    }
    init() {
        cells = Array(repeating: [], count: 8)
        for i in 0..<8 {
            cells[i] = Array(repeating: nil, count: 8)
        }
        for i in 0..<8 {
            cells[i][1] = Pawn(color: .white)
            cells[i][6] = Pawn(color: .black)
        }
        for i in [0, 7] {
            cells[i][0] = Rook(color: .white)
            cells[i][7] = Rook(color: .black)
        }
        for i in [1, 6] {
            cells[i][0] = Knight(color: .white)
            cells[i][7] = Knight(color: .black)
        }
        for i in [2, 5] {
            cells[i][0] = Bishop(color: .white)
            cells[i][7] = Bishop(color: .black)
        }
        for i in [3] {
            cells[i][0] = King(color: .white)
            cells[i][7] = King(color: .black)
        }
        for i in [4] {
            cells[i][0] = Queen(color: .white)
            cells[i][7] = Queen(color: .black)
        }
  }
    func move(from: String, to: String) {
        let x = str2Coordinate(str: from)
        let y = str2Coordinate(str: to)
        if let piece = cells[x.0][x.1] {
            if piece.hasMove(from: x, to: y) {
                cells[y.0][y.1] = piece
                cells[x.0][x.1] = nil
            }
        }
    }
    func str2Coordinate(str: String) -> Coordinate {
        let dictionary: [Character: Int] = [
            "a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6, "h": 7,
            "A": 0, "B": 1, "C": 2, "D": 3, "E": 4, "F": 5, "G": 6, "H": 7,
            "1": 0, "2": 1, "3": 2, "4": 3, "5": 4, "6": 5, "7": 6, "8": 7
        ]
        let xy = Array(str)
        if let x = dictionary[xy[0]], let y = dictionary[xy[1]] {
            return (x, y)
        }
        return (0, 0)
    }
}

class Pawn: Piece {
    var pic: (Character, Character)
    var color: Colors
    init(color: Colors) {
        self.color = color
        self.pic = ("♟", "♙")
    }
    func hasMove(from: Coordinate, to: Coordinate) -> Bool {
        return true
    }
}

class Rook: Piece {
    var pic: (Character, Character)
    var color: Colors
    init(color: Colors) {
        self.color = color
        self.pic = ("♜", "♖")
    }
    func hasMove(from: Coordinate, to: Coordinate) -> Bool {
        return true
    }
}

class Knight: Piece {
    var pic: (Character, Character)
    var color: Colors
    init(color: Colors) {
        self.color = color
        self.pic = ("♞", "♘")
    }
    func hasMove(from: Coordinate, to: Coordinate) -> Bool {
        return true
    }
}

class Bishop: Piece {
    var pic: (Character, Character)
    var color: Colors
    init(color: Colors) {
        self.color = color
        self.pic = ("♝", "♗")
    }
    func hasMove(from: Coordinate, to: Coordinate) -> Bool {
        return true
    }
}

class Queen: Piece {
    var pic: (Character, Character)
    var color: Colors
    init(color: Colors) {
        self.color = color
        self.pic = ("♛", "♕")
    }
    func hasMove(from: Coordinate, to: Coordinate) -> Bool {
        return true
    }
}

class King: Piece {
    var pic: (Character, Character)
    var color: Colors
    init(color: Colors) {
        self.color = color
        self.pic = ("♚", "♔")
    }
    func hasMove(from: Coordinate, to: Coordinate) -> Bool {
        return true
    }
}

let board = Board()
print(board)
board.move(from: "E2", to: "e4")
print(board)
