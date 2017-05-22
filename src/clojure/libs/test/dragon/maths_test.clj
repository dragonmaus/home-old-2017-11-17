(ns dragon.maths-test
  (:refer-clojure)
  (:require [clojure.test :refer :all]
            [dragon.maths :refer :all])
  (:import java.lang.Math))

(deftest maths-test
  (testing "nullary functions (constants)"
    (testing "e"
      (is (= 2.718281828459045 (double e))))
    (testing "π"
      (is (= 3.141592653589793 (double π))))
    (testing "τ"
      (is (= 6.283185307179586 (double τ)))))
  (testing "unary functions"
    (testing "factorial"
      (is (= 1 (factorial 0)))
      (is (= 6 (factorial 3)))
      (is (= 5040 (factorial 7)))
      (is (= 1307674368000 (factorial 15)))))
  (testing "binary functions"
    (testing "greatest common divisor"
      (is (= 4 (gcd 128 828)))
      (is (= 10 (gcd 100 30)))))
  (testing "variadic functions"
    (testing "average"
      (is (= 3 (average 3)))
      (is (= 6 (average 3 9)))
      (is (= 8 (average 3 9 12)))
      (is (= 11 (average 3 9 12 20)))
      (is (= 13 (average 3 9 12 20 21)))
      (is (= 4.047686596409474 (average e π τ))))))
