import Foundation

class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

class Queue<T> {
    var lenght: Int = 0
    var head: Node<T>?
    var tail: Node<T>?
    
    func enqueue(_ value: T) {
        lenght += 1
        
        let newNode = Node(value: value)
        
        if (head == nil) {
            head = newNode
            tail = newNode
            
            return
        }
        
        tail?.next = newNode
        tail = newNode
        
    }
    
    func dequeue() -> T? {
        if (lenght > 0) {
            lenght -= 1
            
            let oldHead = head
            head = head?.next
            
            return oldHead?.value
        }
        
        return nil
    }
    
    func peek() -> T? {
        head?.value
    }
}

let myQueue = Queue<Int>()

myQueue.enqueue(4)
myQueue.enqueue(5)
myQueue.enqueue(6)

print("Peek: \(myQueue.peek()!)")
print("Lenght: \(myQueue.lenght)")

myQueue.dequeue()

print("Peek: \(myQueue.peek()!)")
print("Lenght: \(myQueue.lenght)")

myQueue.dequeue()
myQueue.dequeue()
myQueue.dequeue()
myQueue.dequeue()

print("Peek: \(myQueue.peek())")
print("Lenght: \(myQueue.lenght)")
