//
// Created by Satish Boggarapu on 9/24/18.
// Copyright (c) 2018 SatishBoggarapu. All rights reserved.
//

import Foundation

extension String {
    var decimalToBinary: String { return String(Int(self) ?? 0, radix: 2) }
    var decimalToHex: String { return String(Int(self) ?? 0, radix: 16) }
    var decimalToOct: String { return String(Int(self) ?? 0, radix: 8) }

    var binaryToInt: Int { return Int(strtoul(self, nil, 2)) }
    var binaryToDecimal: String { return String(Double(strtoul(self, nil, 2))) }
    var binaryToHex: String { return String(binaryToInt, radix: 16) }
    var binaryToOct: String { return String(binaryToInt, radix: 8) }

    var hexToInt: Int { return Int(strtoul(self, nil, 16)) }
    var hexToDecimal: String { return String(Double(strtoul(self, nil, 16))) }
    var hexToBinary: String { return String(hexToInt, radix: 2) }
    var hexToOct: String { return String(hexToInt, radix: 8) }

    var octToInt: Int { return Int(strtoul(self, nil, 8)) }
    var octToDecimal: String { return String(Double(strtoul(self, nil, 8))) }
    var octToBinary: String { return String(octToInt, radix: 2) }
    var octToHex: String { return String(octToInt, radix: 16) }
}