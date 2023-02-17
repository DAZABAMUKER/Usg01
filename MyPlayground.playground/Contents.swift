import UIKit

var arr: [String] = ["a", "b", "c", "d", "e"]
arr.append("f")
arr.insert(contentsOf: ["x", "y", "z"], at: 1)
print(arr)
arr.remove(at: 2)
print(arr)

print(arr.map({$0 + " 입니다"}))

