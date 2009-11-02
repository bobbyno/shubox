(ns test-runner
  (:use clojure.test))

(defn load-test-namespaces [directory]
  (let [test-files
        (for [f (file-seq (java.io.File. directory)) :when (re-find #".clj$" (.getPath f))]
          (re-find #"[^.]+" (.getPath f)))]
    (doseq [file test-files] (load file))))

(defn run-learning-tests
  "Finds, loads, and runs all tests."
  []
  (try
   (load-test-namespaces "learning")
   (run-all-tests #"^learning.*")
   (finally
    (shutdown-agents))))

(run-learning-tests)