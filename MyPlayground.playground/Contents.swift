import UIKit

var greeting = "Hello, playground "
let title = "오징어 게임"
let channel = "넷플릭스"
let release = 2021
var episode = "9부작"
var rating = 8.0
var popullarity = 56

var somethingg:[Float] = [1.0,2.0,3.0]
var coool: [String: Float] = ["a" : 2.0, "b" : 3.0]
print(somethingg[1] + coool["b"]!)

popullarity = 48
rating = 8.2
episode = "2시즌 18부작"
print(greeting + title+"은 " + channel + "에서 \(release)년에 만들어진 " + episode + "의 평점 \(rating)인 드라마야! " + "\(popullarity)의 순위를 가지고 있지" )
