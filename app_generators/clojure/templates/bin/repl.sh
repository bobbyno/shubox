#!/usr/bin/env bash

java -cp src:test:lib/jline-0.9.94.jar:lib/clojure.jar:lib/clojure-contrib.jar jline.ConsoleRunner clojure.main -i src/repl.clj -r