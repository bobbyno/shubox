(ns core.about_clojure_testing
  (:use clojure.test))

; Define a simple "Hello, World" function to test
(defn hello [name] 
  (str "Hello, " name "!"))

; use 'is' for single condition assertions
(deftest hello-world
  (is (= "Hello, World!" (hello "World"))))

(deftest simple-addition
  (is (= 4 (+ 2 2))))

; use 'are' for a set of data to pass in with similar conditions
(deftest squares-using-are
  (are [expected x] (= (* x x))
      1 1
      4 2
      4 -2
      9 3))
