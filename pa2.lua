local pa2 = {}

--Function filterArray.
--[==[This takes a function p and an array t.
Function p can be assumed to be a one-parameter function that will accept any value in array t.
filterArray returns an array containing every value v in t for which p(v) is truthy,
in the same order as they appear in t. No other key-value pairs should appear.]==]
function filterArray(p, t)
  
end


--Function concatMax.
--[==[This function takes a string and an integer. 
It returns a string, which is the concatenation of as many copies of the given string as possible,
without the length exceeding the given integer.
If the given integer is less than the length of the given string, then it returns the empty string.]==]
function concatMax(str, int)
  local length = str:len()  --length of string
  
  for i=1,math.floor(int/length) do io.stdout:write(str) end
end


--Function collatz.
--[==[This takes an integer parameter k and returns an iterator that produces one or more integers;
these are the entries in the Collatz sequence starting at k, as explained below.
By “returns an iterator” I mean that function collatz should be usable as follows.

  for i in collatz(n) do
      ff(i)  -- Do something with i
  end
  
The Collatz function [L. Collatz 1937] is the following function c, defined on the positive integers.
  
  c(n) = {3n+1, if nis odd | n/2, if n is even. 
  
The Collatz sequence starting at a positive integer k is

  k, c(k), c(c(k)), c(c(c(k))), ..., 1.

]==]
function collatz(k)
  
  --if the number is even
  if n%2 == 0 then 
    n = n/2
  --otherwise (if odd)
  else
    n = 3*n+1
  end

end


--Coroutine substrings.
--[==[This takes a single parameter s, which must be a string.
It yields all substrings of s:
  first the unique length-zero substring,
  then all length-one substrings,
  and so on,
  ending with s itself.]==]
function substrings(s)
  
  coroutine.yield()
  
end


return pa2