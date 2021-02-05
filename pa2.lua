--FNAM: pa2.lua
--DESC: A Lua module. The module contains functions dealing with tables, strings, and numbers. One of the functions returns an iterator. Another is a coroutine.
--AUTH: Timothy Albert Kline
--CRSE: CS F331 - Programming Languages
--PROF: Glenn G. Chappell
--STRT: 04 February 2021
--UPDT: 05 February 2021
--VERS: 1.0

local pa2 = {}

--Function filterArray.
--[[This takes a function p and an array t.
Function p can be assumed to be a one-parameter function that will accept any value in array t.
filterArray returns an array containing every value v in t for which p(v) is truthy,
in the same order as they appear in t. No other key-value pairs should appear.]]
function pa2.filterArray(p, t)
    local newArray = {}
    local index = 1

    for i = 1, #t do
        if p(t[i]) then
            newArray[index] = t[i]
            index = index + 1
        end
    end
    return newArray
end
---EX. USE/TEST
--[==[
function isBig(n)
    return n > 6
end

arr = { 1, 7, 9, 3, 10, 6, 2, 7, 0 }

arr2 = filterArray(isBig, arr)
for i=1, #arr2 do
    print(arr2[i])
end
-- arr2 should be the array { 7, 9, 10, 7 }.
--]==]


--Function concatMax.
--[[This function takes a string and an integer. 
It returns a string, which is the concatenation of as many copies of the given string as possible,
without the length exceeding the given integer.
If the given integer is less than the length of the given string, then it returns the empty string.]]
function pa2.concatMax(str, int)
    local length = str:len() --length of string
    local s = "" --string
    
    --the number of copies is the rounded-down result of int/length
    for i = 1, math.floor(int / length) do
        s = s .. str
    end

    return s
end
--EX. USE/TEST
--[==[
print(concatMax("abcd", 5))
print(concatMax("abcd", 9))
print(concatMax("abcd", 3))
--]==]


--Function collatz.
--[[This takes an integer parameter k and returns an iterator that produces one or more integers;
these are the entries in the Collatz sequence starting at k, as explained below.
By “returns an iterator” I mean that function collatz should be usable as follows.

  for i in collatz(n) do
      ff(i)  -- Do something with i
  end
  
The Collatz function [L. Collatz 1937] is the following function c, defined on the positive integers.
  
  c(n) = {3n+1, if n is odd | n/2, if n is even. 
  
The Collatz sequence starting at a positive integer k is

  k, c(k), c(c(k)), c(c(c(k))), ..., 1.

]]
function pa2.collatz(k)
    local function iter(dumm1, dumm2)
        if k < 1 then
            return nil
        end

        local currNum = k --save k before changing the value
        if currNum == 1 then
            k = 0 --to end iteration
        elseif k % 2 == 0 then
            k = k / 2
        else
            k = 3 * k + 1
        end

        return currNum
    end
    return iter, nil, nil
end
---EX. USE/TEST
--[==[
for i in collatz(3) do
    io.write(i.." ")
end
io.write("\n")
--]==]


--Coroutine substrings.
--[[This takes a single parameter s, which must be a string.
It yields all substrings of s:
  first the unique length-zero substring,
  then all length-one substrings,
  and so on,
  ending with s itself.]]
function pa2.substrings(s)
    local length = #s
    local tbl = {}
    
    --store each char of the string into the table
    for c in s:gmatch "." do
        table.insert(tbl, c)
    end

    for i = 0, length do
        for j = 0, length do
            if (i + j) > length then --to prevent going out of range
                break
            else
              --range always starts from 1. End depends on what "i" is
              --Ex. (...,1,1); (...,2,2); ... (...,1,3); (...,2,4); ... (...,1,4)
                coroutine.yield(table.concat(tbl, "", j + 1, i + j))
            end

            if i == 0 then --for the singular empty string
                break
            end
        end
    end
end
---EX. USE/TEST
--[==[
cw = coroutine.wrap(substrings)
f = cw("abcd")
while f ~= nil do
    io.write(f .. "\n")
    f = cw()
end
--]==]

return pa2
