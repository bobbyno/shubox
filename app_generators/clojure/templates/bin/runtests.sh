#!/usr/bin/env bash

java -Xmx1G -cp test:src:lib/clojure.jar:lib/clojure-contrib.jar:lib/hsqldb.jar:lib/ant.jar:lib/ant-launcher.jar clojure.lang.Script test/tests.clj