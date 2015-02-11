-- Find a right triangle that fits these conditions:
-- 1. The lengths of the three sides are all integers.
-- 2. The length of each side is less than or equal to 10.
-- 3. The triangle’s perimeter (the sum of the side lengths) is equal to 24.
--
-- A Triangle is a right triangle:
-- 1. If one of its angles is 90 degrees.
-- 2. If you square the lengths of the sides forming the right triangle,
-- the sum of those sides is equal to the square of the length of the
-- hypotenuse.
--
-- Let's generate all possible triples with elements that are <= 10
-- (10 * 10 * 10 = 1000 permutations)
let triples = [ (a,b,c) | c <- [1..10], a <- [1..10], b <- [1..10] ]

-- Next, filter out triples that don't represent right triangles by adding
-- a predicagte that checks using the Pythagorean theorem.
-- Also, we'll check to make sure side 'b' isn't larger than the hypotenuse
-- and side 'a' isn't larger than side 'b'.
let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]

-- Next, We need to modify to only output triangles whose perimeter == 24
let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24]

-- You now have your solution!
--
-- This is a common pattern in functional pro- gramming: you start with a
-- certain set of candidate solutions, and succes- sively apply transformations
-- and filters to them until you’ve narrowed the possibilities down to the one
-- solution (or several solutions) that you’re after.
