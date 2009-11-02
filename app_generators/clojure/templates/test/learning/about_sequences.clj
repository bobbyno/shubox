(ns learning.about-sequences
  (:use clojure.test))

(deftest seq-functions-work-for-lists
  (are [x expected] (= x expected)
    ; first, rest, cons on lists
    (first '(1 2 3))  1
    (rest '(1 2 3)) '(2 3)
    (cons 0 '(1 2 3)) '(0 1 2 3)
   ))

(deftest seq-functions-work-on-vectors
  (are [x expected] (= x expected)
    ; first, rest, cons on vectors
    (first [1 2 3])  1
    (rest [1 2 3]) [2 3]
    (cons 0 [1 2 3]) [0 1 2 3]
   ))

(deftest rest-and-cons-returns-a-seq-not-a-vector
  (are [x expected] (= x expected)
    ; call class on rest to prove that lists and vectors are seqs
    (class (rest [1 2 3])) clojure.lang.LazilyPersistentVector$ChunkedSeq
    ))