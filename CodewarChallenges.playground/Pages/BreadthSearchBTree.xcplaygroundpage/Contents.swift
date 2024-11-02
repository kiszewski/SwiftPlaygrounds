import Foundation

class TreeNode<T> {
    let value: T
    var left: TreeNode<T>?
    var right: TreeNode<T>?
    
    init(_ value: T, _ left: TreeNode<T>? = nil, _ right: TreeNode<T>? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

func breadthSearch<T>(_ node: TreeNode<T>) {
    let queue = Queue<TreeNode<T>>()
    queue.enqueue(node)
    
    walk(node, queue)
}

func walk<T>(_ node: TreeNode<T>, _ queue: Queue<TreeNode<T>>) {
    if node.left != nil { queue.enqueue(node.left!) }
    if node.right != nil { queue.enqueue(node.right!) }
    
    print(node.value)
    
    queue.dequeue()
    
    if queue.peek() != nil { walk(queue.peek()!, queue) }
}

var root = TreeNode<Int>(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(5, TreeNode(6), TreeNode(7)))

breadthSearch(root)








//Can't import, so have to copy & past

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
