import Foundation

// chess pieces
typealias Coordinate = (Character, Int)

enum Colors: String {
    case white = "белый"
    case black = "черный"
}

class Piece {
    
    let type: Types
    let color: Colors
    let coordinate: Coordinate

    enum Types: String {
        case pawn = "Пешка"
        case rook  = "Ладья"
        case knight = "Конь"
        case bishop = "Слон"
        case queen = "Ферзь"
        case king = "Король"
    }

    init(color: Colors, coordinate: Coordinate, type: Types) {
        self.color = color
        self.type = type
        self.coordinate = coordinate
    }
    
    func description() -> String {
        return "\(coordinate.0)\(coordinate.1): \(type.rawValue), цвет: \(color.rawValue)"
    }
    
    func hasMove(to: Coordinate) -> Bool {
        return true
    }
}

class Pawn: Piece {
    
    init(_ color: Colors, _ coordinate: Coordinate) {
        super.init(color: color, coordinate: coordinate, type: .pawn)
    }
    
    override func hasMove(to: Coordinate) -> Bool {
        if (coordinate.1 + 1) == to.1 {
            return true
        }
        return false
    }
}

class Rook: Piece {
    
    init(_ color: Colors, _ coordinate: Coordinate) {
       super.init(color: color, coordinate: coordinate, type: .rook)
    }
    
    override func hasMove(to: Coordinate) -> Bool {
        return false // ToDo
    }
}

class Knight: Piece {
    
    init(_ color: Colors, _ coordinate: Coordinate) {
        super.init(color: color, coordinate: coordinate, type: .knight)
    }
    
    override func hasMove(to: Coordinate) -> Bool {
        return false // ToDo
    }
}

class Bishop: Piece {
    
    init(_ color: Colors, _ coordinate: Coordinate) {
       super.init(color: color, coordinate: coordinate, type: .bishop)
    }
    
    override func hasMove(to: Coordinate) -> Bool {
        return false // ToDo
    }
}

class Queen: Piece {
    
    init(_ color: Colors, _ coordinate: Coordinate) {
        super.init(color: color, coordinate: coordinate, type: .queen)
    }
    
    override func hasMove(to: Coordinate) -> Bool {
        return false // ToDo
    }
}

class King: Piece {
    
    init(_ color: Colors, _ coordinate: Coordinate) {
        super.init(color: color, coordinate: coordinate, type: .king)
    }
    
    override func hasMove(to: Coordinate) -> Bool {
        return false // ToDo
    }
}



var allPieces = [Piece]()

allPieces.append(Pawn(.black, ("A", 1)))
allPieces.append(King(.white, ("B", 2)))
allPieces.append(Queen(.black, ("D", 3)))

print(allPieces[0].hasMove(to: ("A", 2)))
print(allPieces[0].hasMove(to: ("A", 3)))

allPieces.forEach { piece in
    print(piece.description())
}
