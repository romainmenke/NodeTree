//: Playground - noun: a place where people can play

import UIKit
import NodeTree

var str = "Hello, playground"


func atTest(string:String) -> Bool {
    
    return string.containsString("@")
    
}

let atLeaf = Leaf(id: 0, premise: atTest, value: "romain-menke@gmail.com")

func dotTest(string:String) -> Bool {
    
    return string.containsString(".")
    
}

let dotLeaf = Leaf(id: 1, premise: dotTest, value: "romain-menke@gmail.com")

func hyphenTest(string:String) -> Bool {
    
    return string.containsString("-")
    
}
let hyphenLeaf = Leaf(id: 2, premise: hyphenTest, value: "romain-menke@gmail.com")


func usTest(string:String) -> Bool {
    
    return string.containsString("_")
    
}
let usLeaf = Leaf(id: 3, premise: usTest, value: "romain-menke@gmail.com")

func spaceTest(string:String) -> Bool {
    
    return string.containsString(" ")
    
}
var spaceLeaf : Leaf! = Leaf(id: 4, premise: spaceTest, value: "romain-menke@gmail.com")


func dashTest(string:String) -> Bool {
    
    return string.containsString("/")
    
}
let dashLeaf = Leaf(id: 5, premise: dashTest, value: "romain-menke@gmail.com")

func numericTest(int:Int) -> Bool {
    
    return int > 2
    
}
let numericLeaf = Leaf(id: 5, premise: numericTest, value: 5)


var emailBranch = Branch(id: 0, leafs: [atLeaf,hyphenLeaf,dotLeaf,numericLeaf])

var webBranch = Branch(id: 1, leafs: [hyphenLeaf,dashLeaf,dotLeaf,spaceLeaf])

var tree = Tree(branches: [emailBranch,webBranch])

tree.bloom()


for branch in tree.branches {
    
    if !branch.broken {
        print(branch.id)
    }
}
