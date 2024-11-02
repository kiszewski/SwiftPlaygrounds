import Foundation

class Node<T> {
    let value: T
    var previous: Node<T>?
    
    init(value: T, previous: Node<T>? = nil) {
        self.value = value
        self.previous = previous
    }
}

class Stack<T> {
    private var head: Node<T>?
    var length = 0
    
    func peek() -> T? {
        head?.value
    }
    
    func push(_ value: T) {
        let node = Node(value: value)
        
        if length == 0 {
            head = node
        } else {
            node.previous = head
            head = node
        }
        
        length += 1
    }
    
    func pop() -> T? {
        if length > 0 {
            let oldHead = head
            
            if length == 1 {
                head = nil
            } else {
                head = head?.previous
            }
            
            length -= 1
            
            return oldHead?.value
        } else {
            return nil
        }
    }
}

let stack = Stack<Int>()

stack.push(5)
stack.push(7)
stack.push(9)

print(stack.pop() == 9)
print(stack.length == 2)

stack.push(11)

print(stack.pop() == 11)
print(stack.pop() == 7)
print(stack.peek() == 5)
print(stack.pop() == 5)
print(stack.pop() == nil)

// just wanted to make sure that I could not blow up myself when I remove everything
stack.push(69)
print(stack.peek() == 69)
print(stack.length == 1)
