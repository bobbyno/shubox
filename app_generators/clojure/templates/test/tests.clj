(ns test
  (:use clojure.test))

(def tests
     ['core.about_clojure_testing 'core.about_forms])

(doseq [test tests] (require test))

(apply run-tests tests)

(shutdown-agents)