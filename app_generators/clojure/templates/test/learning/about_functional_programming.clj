(ns learning.about-functional-programming
  (:use clojure.test))

; An example of breaking down existing code as learning tests, 
; as well as setting up a learning test that you can practice.

; From Stu Halloway's Programming Clojure

(defn fibo []
  (map first (iterate (fn [[a b]] [b (+ a b)]) [0 1])))

(deftest fibo-is-an-infinite-sequence
  (are [x expected] (= x expected)
    (take 7 (fibo)) '(0 1 1 2 3 5 8)
    (nth (fibo) 5) 5
    (rem (nth (fibo) 10000) 100000) 66875
    (rem (nth (fibo) 100000) 100000) 46875
; This one takes a few seconds
;    (rem (nth (fibo) 1000000) 1000000) 546875   
    ))

; This is succinct, but not exactly intuitive if you're new to Clojure.
; Let's break it down.

; Basic forms: (+ a b)
(deftest addition-as-basic-form
  (is (= 5 (+ 2 3))))

; Vectors: [b (+ a b)]
(defn next-pair [[a b]]
    [b (+ a b)])

(deftest seq-functions-work-on-vectors
  (are [x expected] (= x expected)
    (next-pair [1 2]) [2 3]
    (next-pair [3 5]) [5 8]))

; Now we can start seeing the logic of considering each fib
; as a pair.

; Replace additive-vector with the fn special form: (fn [[a b]] [b (+ a b)])
(deftest fn-creates-anonymous-functions
  (let [next-pair-fn (fn [[a b]] [b (+ a b)])]
  (are [x expected] (= x expected)
    (next-pair-fn [1 2]) [2 3]
    (next-pair-fn [3 5]) [5 8])))

; we see from page 118: You can think of iterate as the inﬁnite extension of range
; Let's experiment:
(deftest range-is-finite
  (are [x expected] (= x expected)
    (range 1 10 2) '(1 3 5 7 9)
    (range 0 20 5) '(0 5 10 15)))

; iterate and lazy sequences
; Given that this will introduce an infinite sequence, we'll need to
; heed the advice about creating a finite view onto the infinite collection.
; There are a few examples of such methods in our original unit test, and
; this is a good opportunity to start experimenting with them.
(deftest iterate-over-infinite-sequences-with-lazy-seqs
  (let [fib (iterate (fn [[a b]] [b (+ a b)]) [0 1])]
  (are [desc x expected] (= x expected)
    "" (first fib) [0 1]
    "" (take 3 fib) '([0 1] [1 1] [1 2])
    "nth returns the value at the index" (nth fib 3) [2 3]
    )))

; So we can now produce pairs of fibonacci numbers. 
; But we only want the first values of each pair.
; (doc map) at the REPL tells us why we need map:
; Returns a lazy sequence consisting of the result of applying f to the
; set of first items of each coll...
; let's do some simple experiments
(deftest using-map
  (are [desc x expected] (= x expected)
  "double the values in a range" (map (fn [n] (* 2 n)) (range 0 6)) '(0 2 4 6 8 10)
 ))

; seeing that map takes a function and applies it to each member of a sequence, it's
; now easy to see what our original fibo function is doing.
; Let's recap:
; We define an anonymous function that takes two arguments, a and b, and returns b and the sum of a and b as a vector.
; Iterate begins with the values 0 and 1 and continues forever, applying the function to each value to calculate the next.
; This produces pairs of Fibonacci numbers.
; Since we only want the first values of each pair, we transform the result using map by applying first to each of the pairs
; in the sequence. This result is itself a lazy sequence, so we must use functions like take and nth to realize the sequence
; and retrieve the values in which we're interested.
; Given the terseness of the code and the verbiage of the English translation, we begin to see why people say Clojure is
; so expressive! 

; In the style of Ruby koans, here's a way to start reviewing the implementation so you can practice.

; Let's give ourselves a utility method to make the tests more readable.
(defn ? []
    0)

; What would you write to get the following learning tests to pass?
(deftest review-session
  (are [desc x expected] (= x expected)
    "addition as basic form" (?) 5
    "generate the sequence of odd integers from 1 to 10" (?) '(1 3 5 7 9)
    "generate the factors of five less than 20" (?) '(0 5 10 15)
      ))

; Having just seen these, you probably saw right away that we need to replace our (?)'s with
; (+ 3 2), (range 1 10 2), and (range 0 20 5). How about the definition of the fibo function? Can you write it from
; memory? Go ahead, try...I'll wait.
; Did you get it?
; Now how about if you saw these tomorrow? After a week from now? A month?
; By answering these (?)'s, you're forced to retrieve the information you've just seen.
; It turns out that this retrieval step is a powerful learning tool.

