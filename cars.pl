(deftemplate Money   (slot amount))
(deftemplate Fuel (slot type))
(deftemplate Car (slot make))


(defrule Money
   =>
   (printout t "How much do you want to spend ?  ")
   (bind ?response (read))
   (assert (Money (amount ?response))))


(defrule Fuel
   =>
   (printout t "What do you want to drive ? Diesel or Benzine ")
   (bind ?response (read))
   (assert (Fuel (type ?response))))



(defrule Mercedes-Diesel
   (Money (amount ?t))
   (test (>= ?t 10000))
   (Fuel (type Diesel))
   =>
   (assert (Car (make Mercedes)))
   (printout t "You want to buy Mercedes CLK with 2 or 3 litres engine or S-class with 5 litres engine" crlf))


(defrule Mercedes-Benzine
   (Money (amount ?t))
   (test (>= ?t 10000))
   (Fuel (type Benzine))
   =>
   (assert (Car (make Mercedes)))
   (printout t "You want to buy Mercedes E-class with 2.8 or 4.2 litres engine or C-class with 6.5 litres engine" crlf))

(defrule BMW-Benzine
   (Money (amount ?t))
   (test (<= ?t 10000))
   (Fuel (type Benzine))
   =>
   (assert (Car (make BMW )))
   (printout t "You want to buy BMW 328 Coupe , 530 Sedan or 330 Coupe" crlf))

   (defrule Audi-Diesel
   (Money (amount ?t))
   (test (<= ?t 10000))
   (Fuel (type Diesel))
   =>
   (assert (Car (make Audi )))
   (printout t "You want to buy  AUDI A3 1.9 TDI , A4 2.0 TDI , A5 3.0 TDI" crlf))


;(watch all)
(reset)
(run)
;(facts)

