
class Node {
	var next: Node? 
    var previous: Node? 
    var text: String
    
    init(t: String) {
    	self.text = t
        self.next = nil
        self.previous = nil
    }
}

class LinkedList  {
	var head: Node? = nil

    init(){
    
    }
    
    func addNodeAfter(pos: Int, node: Node ) -> Int {
    	let beyondTail = ((pos + 1) > count())
    	if (beyondTail) {
			return -1;
        }
		var p: Node? = head
		var i: Int = 0;
		while (i < pos) {
			p = p?.next        
 			i++
 		}
		var tmpNode: Node? = p?.next
		p?.next = node
		node.next = tmpNode
        node.previous = p
        p?.previous = node
		return 1;
	}
    
    func count() -> Int {
    	// step through list
        var p: Node? = head
        var i: Int = 0
        while (p? != nil) {
			i++
			p = p?.next        
        }
        return i
    }
    
    func tail()->Node? {

        var p: Node? = head
        while (p? != nil) {
			p = p?.next        
        }
        return p
    }
    
    func enqueueTail(node: Node) {
    	var t: Node? = self.tail()
        t?.next = node
        node.previous = t
        node.next = nil
    }

    func enqueueHead(node: Node) {
        node.next = head
        node.previous = nil
		head = node
    }
    
    func printList(){
		println("Count = \(count())")
		var p: Node? = head
		var i: Int = 0
		while (p? != nil) {
        	if let nn = p {
            	println("Node \(i): \(nn.text)")
            }
			p = p?.next        
			i++
		}
    }
    

}

let linkedList = LinkedList()
let node1 = Node(t:"node1")
linkedList.enqueueHead(node1)
let node2 = Node(t:"node2") 
linkedList.enqueueHead(node2)
let node3 = Node(t:"node3") 
var res: Int = linkedList.addNodeAfter(0, node:node3)
println(res)
linkedList.printList()

println("Hello")
