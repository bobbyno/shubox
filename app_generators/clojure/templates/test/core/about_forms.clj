(ns core.about_forms
  (:use clojure.test))

(deftest division-in-clojure-is-surprising
  (are [expression expected] (= expression expected)
    (/ 6 3)   2
    ; Ratio is a built-in type
    (/ 3 6)   1/2
    ; use a floating-point literal for the dividend for decimal division
    (/ 3.0 6)   0.5
    ; integer quotient
    (quot 22 7)  3
    ; remainder
    (rem 22 7)   1
    ))

(deftest strings
  (are [expression expected] (= expression expected)
    (.toUpperCase "str")  "STR"
    (str 1 2 nil 3)       "123"
  ))

