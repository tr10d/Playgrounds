import Foundation

typealias Coordinate = (Int, Int)
typealias Cells = [[Piece?]]

enum Colors {
    case white, black
}

protocol Piece: CustomStringConvertible {
    var color: Colors { get set }
    var pic: (Character, Character) { get set }
    func canMove(from: Coordinate, to: Coordinate, cells: Cells) -> Bool
    func canCross(from: Coordinate, to: Coordinate, cells: Cells) -> Bool
}

extension Piece {
    var description: String {
        return "\(color == .white ? pic.0 : pic.1)"
    }
    
    func isEmpty(_ coordinate: Coordinate, _ cells: Cells) -> Bool {
        if let piece = cells[coordinate.0][coordinate.1] {
            return piece.color != color
        }
        return true
    }
    
    func hasMove(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
        return isEmpty(to, cells)
            && canMove(from: from, to: to, cells: cells)
            && canCross(from: from, to: to, cells: cells)
    }
}

class Board: CustomStringConvertible {
    var cells: Cells
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
    
    func move(_ from: String, _ to: String) {
        if let x = str2Coordinate(string: from),
           let y = str2Coordinate(string: to),
           let piece = cells[x.0][x.1] {
            if piece.hasMove(from: x, to: y, cells: cells) {
                cells[y.0][y.1] = piece
                cells[x.0][x.1] = nil
            }
        }
    }
    
    func str2Coordinate(string: String) -> Coordinate? {
        let dictionary: [Character: Int] = [
            "a": 0, "b": 1, "c": 2, "d": 3, "e": 4, "f": 5, "g": 6, "h": 7,
            "1": 0, "2": 1, "3": 2, "4": 3, "5": 4, "6": 5, "7": 6, "8": 7
        ]
        let array = Array(string.lowercased())
        if array.count == 2, let x = dictionary[array[0]], let y = dictionary[array[1]] {
            return (x, y)
        }
        return nil
    }
}

class Pawn: Piece {
    var pic: (Character, Character)
    var color: Colors
    
    init(color: Colors) {
        self.color = color
        self.pic = ("♟", "♙")
    }
    
    func canMove(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
        return true
        let k = (color == .white ? 1 : -1)
        var kk = 1
        switch (color, from.1) {
        case (.white, 1), (.black, 6):
           kk = 2
        default:
           kk = 1
        }
        return abs(from.0 - to.0) == 1 && abs(to.1 - from.1) <= kk * k
    }

    func canCross(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
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
    
    func canMove(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
        return true
    }

    func canCross(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
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
    
    func canMove(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
        return true
    }

    func canCross(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
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
    func canMove(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
        return true
    }

    func canCross(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
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
    
    func canMove(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
        return true
    }

    func canCross(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
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
    
    func canMove(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
        return abs(from.0 - to.0) == 1 && abs(from.1 - to.1) == 1
    }

    func canCross(from: Coordinate, to: Coordinate, cells: Cells) -> Bool {
        return true
    }
}

let board = Board()
print(board)
board.move("E2", "e4")
print(board)
board.move("e7", "e5")
print(board)
board.move("e19", "e5")
print(board)
