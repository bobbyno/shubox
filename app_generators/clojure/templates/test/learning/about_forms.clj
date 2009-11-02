(ns learning.about-forms
  (:use clojure.test))

(deftest division
  (are [desc expression expected] (= expression expected)
    "do some simple division" (/ 6 2)   3
    "show that ratio is a built-in type"  (/ 1 2)   1/2
    "use a floating-point literal for the dividend for decimal division" (/ 1 2.0)   0.5
    "obtain the integer quotient"  (quot 22 7)   3
    "obtain the remainder" (rem 23 7)  2
   ))

(deftest strings
  (are [desc expression expected] (= expression expected)
    "convert a lowercase string to uppercase"  (.toUpperCase  "str")  "STR"   
    "append several strings - show that nil is ignored" (str 1 nil "two") "1two"
  ))

