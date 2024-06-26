"""
    AlgorithmsEasyModule

Module containing "easy" tier algorithms questions from HackerRank
"""

module AlgorithmsEasyModule
    
    __precompile__(true)
    
    using ..UtilityFunctionsModule: getIntDigits, getDigitAt, reverseInt
    
    """
        beautifulDays(
            i::Int32, 
            j::Int32, 
            k::Int32
        )::Int32
    
    'Beautiful Days at the movies'
    Lily likes to play games with integers. She has created a new game where she determines the difference between a number and its reverse. For instance, 
    given the number 12, its reverse is 21. Their difference is 9. The number 120 reversed is 21, and their difference is 99.
    She decides to apply her game to decision making. She will look at a numbered range of days and will only go to a movie on a beautiful day.
    Given a range of numbered days, [i..j] and a number k, determine the number of days in the range that are beautiful. Beautiful numbers are defined as 
    numbers where |i - reverse(i)| is evenly divisible by k. If a day's value is a beautiful number, it is a beautiful day. Return the number of beautiful 
    days in the range.
    
    # Arguments
    - `i` = the starting day number
    - `j` = the ending day number
    - `k` = divisor
    
    # Output
    The number of beautiful days in the range
    """
    function beautifulDays(
        i::Int32, 
        j::Int32, 
        k::Int32
    )::Int32
        # n - permutation(n) is always divisible by 9
        (k == 9) || (k == 3) && return (j - i + 1)
    
        # n - reverse(n) is always dibisible by 99 if n has odd number of digits
        i_digits = getIntDigits(i)
        j_digits = getIntDigits(j)
        (i_digits % 2 != 0) && (i_digits == j_digits) && (k == 99 || k == 33 || k == 11) && return (j - i + 1)
    
        # Count beautiful day
        n_beautiful_days::Int32 = 0
        for day = i:j
            reversed_day = reverseInt(day)
            if abs(day - reversed_day) % k == 0
                n_beautiful_days += 1
            end
        end
    
        return n_beautiful_days
    end
    
    """
        findDigits(n::Int32)::Int32
    
    Given an integer, for each digit that makes up the integer determine 
    whether it is a divisor. Count the number of divisors occurring within the integer.
    
    # Arguments
    - `n` = The integer to scan.
    
    # Output
    The number of digits in n that are divisors of n.
    """
    function findDigits(n::Int32)::Int32
        count::Int32 = 0
        digit_count = getIntDigits(n)
        for i = 1:digit_count
            ith_digit = getDigitAt(n, i)
            if ith_digit != 0 && n % ith_digit == 0
                count += 1
            end
        end
        
        return count
    end
    
    """
        cutTheSticks(arr::Array{Int32})::Array{Int32}
    
    You are given a number of sticks of varying lengths. You will iteratively cut 
    the sticks into smaller sticks, discarding the shortest pieces until there are none left. 
    At each iteration you will determine the length of the shortest stick remaining, cut that 
    length from each of the longer sticks and then discard all the pieces of that shortest length. 
    When all the remaining sticks are the same length, they cannot be shortened so discard them.
    Given the lengths of n sticks, print the number of sticks that are left before each iteration 
    until there are none left.
    
    # Arguments
    - `arr` = List of stick lengths
    
    # Output
    List containing the number of sticks before each iteration of "cutting"
    """
    function cutTheSticks(arr::Array{Int32})::Array{Int32}
        ret_arr = Int[]
        # Sort it in desc order first
        sort!(arr, rev=true)
        
        # While we have elements to pop
        while length(arr) > 0
            # Record current length
            push!(ret_arr, length(arr))
            
            # Pop smallest and cut
            smallest = pop!(arr)
            for i = 1:length(arr)
                arr[i] -= smallest
            end
            # Pop sticks that got cut out completely
            while !isempty(arr) && last(arr) < 1
                pop!(arr)
            end    
        end
        
        return ret_arr
    end
    
    """
        circularArrayRotation(
            a::Array{Int32}, 
            k::Int32, 
            queries::Array{Int32}
        )::Array{Int32}
    
    John Watson knows of an operation called a right circular rotation on an array of integers. 
    One rotation operation moves the last array element to the first position and shifts all 
    remaining elements right one. To test Sherlock's abilities, Watson provides Sherlock with 
    an array of integers. Sherlock is to perform the rotation operation a number of times then 
    determine the value of the element at a given position.
    For each array, perform a number of right circular rotations and return the values of the 
    elements at the given indices.
    
    # Arguments
    - `a` = The array to rotate
    - `k` = Number of rotation to perform on a
    - `queries` = Indeces of the rotated array to report (Note: 0-based indeces)
    
    # Output
    List of values in the rotated array a, as specified by the indices given in array queries 
    """
    function circularArrayRotation(
        a::Array{Int32}, 
        k::Int32, 
        queries::Array{Int32}
    )::Array{Int32}
        res = Int32[]
        new_array_start = ((length(a) - (k%length(a)) ) % length(a))
        for q in queries
            new_array_q = (q + new_array_start) % length(a)
            push!(res, a[new_array_q+1]) # Julia indexing
        end
        return res
    end
    
    """
        viralAdvertising(n::Int)::Int
    
    HackerLand Enterprise is adopting a new viral advertising strategy. When they launch a new product, they 
    advertise it to exactly 5 people on social media.
    On the first day, half of those 5 people (i.e., floor(5/2)=2) like the advertisement and each shares it with 3 of 
    their friends. At the beginning of the second day, floor(5/2)*3 = 2*3 = 6 people receive the advertisement.
    Each day, floor(recipients/2) of the recipients like the advertisement and will share it with 3 friends on the 
    following day. Assuming nobody receives the advertisement twice, determine how many people have liked the ad by the 
    end of a given day, beginning with launch day as day 1.
    
    # Arguments
    - `n` = Number of days to count cumulative likes for
        
    # Output
    The number of cumulative likes by day `n`
    """
    function viralAdvertising(n::Int)::Int
        shared_with = 5
        all_likes_by_day_n = 0
    
        for day = 1:n
            likes_today = floor(Int, shared_with/2)
            all_likes_by_day_n += likes_today
        
            shared_with = likes_today * 3
        end
    
        return all_likes_by_day_n
    end
    
    """
        libraryFine(
            d1::Int,
            m1::Int,
            y1::Int,
            d2::Int,
            m2::Int,
            y2::Int
        )
    
    Your local library needs your help! Given the expected and actual return dates for a library book, create a program that 
    calculates the fine (if any). The fee structure is as follows:
    - If the book is returned on or before the expected return date, no fine will be charged (i.e.: fine = 0).
    - If the book is returned after the expected return day but still within the same calendar month and year as the expected 
      return date, fine = 15 Hackos x (the number of days late).
    - If the book is returned after the expected return month but still within the same calendar year as the expected 
      return date, the fine = 500 Hackos x (the number of months late).
    - If the book is returned after the calendar year in which it was expected, there is a fixed fine of  10_000 Hackos.
    Charges are based only on the least precise measure of lateness. For example, whether a book is due January 1, 2017 or December 31, 2017, 
    if it is returned January 1, 2018, that is a year late and the fine would be 10_000 Hackos.
    
    # Arguments
    - `d1` = returned day
    - `m1` = returned month
    - `y1` = returned year
    - `d2` = due day
    - `m2` = due month
    - `y2` = due year
    
    # Output
    The fine
    """
    function libraryFine(
        d1::Int,
        m1::Int,
        y1::Int,
        d2::Int,
        m2::Int,
        y2::Int
    )
        # Late or early by year/s
        (y1 > y2) && return 10_000
        (y1 < y2) && return 0
    
        # Late or early by month/s
        (m1 > m2) && return ((m1 - m2) * 500)
        (m1 < m2) && return 0
    
        # Late by day/s
        (d1 > d2) && return ((d1 - d2) * 15)
    
        return 0
    end
    
    """
        maximizingXor(l::Int, r::Int)
    
    Given two integers, l and r, find the maximal value of a xor b, where l <= a <= b <= r
    
    # Arguments
    - `l` = lower bound
    - `r` = upper bound
    
    # Output
    The max value of a xor b, where a & b are within the range l to r
    """
    function maximizingXor(l::Int, r::Int)
        max_xor = 0
        for i = l:(r-1)
            for j = (i+1):r
                xored = i ⊻ j
                if xored > max_xor
                    max_xor = xored
                end
            end
        end
        return max_xor
    end
    
    """
        appendAndDelete(s::String, t::String, k::Int)
    
    You have two strings of lowercase English letters. You can perform two types of operations on the first string:
    1. Append a lowercase English letter to the end of the string.
    2. Delete the last character of the string. Performing this operation on an empty string results in an empty string.
    Given an integer, k, and two strings, s and t, determine whether or not you can convert s to t by performing exactly k of the 
    above operations on s.
    
    # Arguments
    - `s` = first string
    - `t` = second string
    - `k` = number of deletions and additions to perform on t to make it == s
    
    # Output
    If the opperation is possible given the 2 strings and number of operations k
    """
    function appendAndDelete(
        s::String,
        t::String,
        k::Int
    )
        # First find the overlap between s and t, from left to right
        overlap_length = 0
        for i = 1:min(length(s), length(t))
            if s[i] == t[i]
                overlap_length += 1
            else
                break
            end
        end
    
        # Special case where t needs to be fully deleted
        if 2*length(t) < k
            return true
        end
    
        # How many chars to trim
        to_delete = length(t) - overlap_length
        # How many chars to append once trimmed
        to_append = length(s) - overlap_length
    
        # Check if it's even feasible
        operations_to_make = to_delete + to_append
        (operations_to_make > k) && return false
    
        # to_delete + to_append == k + x*2 
        # (a multiple of 2 signifies `empty` operations e.g. add a char and delete repeatedly)
        return ((to_delete + to_append - k) % 2 == 0)
    end
    
    """
        equalizeArray(arr::Vector{Int})
    
    Given an array of integers, determine the minimum number of elements to delete to leave only elements of equal value.
    
    # Arguments
    - `arr` = input array of integers
    
    # Output
    Min number of elements to delete from `arr` to leavy only elements of equal size
    """
    function equalizeArray(arr::Vector{Int})
        # Keep track of occurrences for each integer
        freqs = Dict{Int, Int}()
        # And the max occurency (frequency) so we can do everything in 1 pass (0(n) + dict access)
        max_freq = 0
    
        # Scan the array
        for i in arr
            # Update dict record
            if haskey(freqs, i)
                freqs[i] += 1
            else
                freqs[i] = 1
            end
            # Update max
            if freqs[i] > max_freq
                max_freq = freqs[i]
            end
        end
    
        return (length(arr) - max_freq)
    end
    
    """
        repeatedString(s::String, n::Int)
    
    There is a string s of lowercase English letters that is repeated infinitely many times. 
    Given an integer n find and return the number of letter 'a's in the first n letters of the infinite string.
    
    # Arguments
    - `s` = input string
    - `n` = number of characters to scan, in s, for 'a's
    
    # Output
    The number of 'a' letters found in the first n letters of s repeated infinitely
    """
    function repeatedString(s::String, n::Int)
        # First find how many a's in s and how many full s's we have
        s_repeated = div(n, length(s))
        a_in_s = sum([1 for x in s if x == 'a'])
    
        # Then take care of the remainder
        counter = a_in_s * s_repeated
        for i = 1:(n % length(s))
            (s[i] == 'a') && (counter += 1)
        end
    
        return counter
    end
    
    """
        serviceLane(widths::Vector{Int}, cases::Vector{Vector{Int}})
    
    A driver is driving on the freeway. The check engine light of his vehicle is on, and the driver wants to get service immediately. 
    Luckily, a service lane runs parallel to the highway. It varies in width along its length.
    You will be given an array of widths at points along the road (indices), then a list of the indices of entry and exit points. 
    Considering each entry and exit point pair, calculate the maximum size vehicle that can travel that segment of the service lane safely.
    
    # Arguments
    - `n` = widths of the service lane along the road
    - `cases` = each element contains the entry and exit indices for a segment of the road/service lane to consider, inclusive
    
    # Output
    The maximum width vehicle that can pass through each segment of the service lane, as described in `cases`
    """
    function serviceLane(widths::Vector{Int}, cases::Vector{Vector{Int}})
        vehicles = []
        
        for case in cases
            segment_start = case[1] + 1 # Julia indexing
            segment_end = case[2] + 1 # Julia indexing
            push!(vehicles, minimum(widths[segment_start:segment_end]))
        end
    
        return vehicles
    end
    
    """
        jumpingOnClouds(c::Vector{Int})
    
    There is a new mobile game that starts with consecutively numbered clouds. Some of the clouds are thunderheads and 
    others are cumulus. The player can jump on any cumulus cloud having a number that is equal to the number of the current cloud 
    plus 1 or 2. The player must avoid the thunderheads. Determine the minimum number of jumps it will take to jump from the starting 
    postion to the last cloud. It is always possible to win the game.
    For each game, you will get an array of clouds numbered 0 if they are safe or 1 if they must be avoided.
    
    # Arguments
    - `c` = list of clouds, where 1 signifies thunderheads
    
    # Output
    The minimum number of jumps of length 1 or 2 needed to reach the last cloud
    """
    function jumpingOnClouds(c::Vector{Int})
        pos = 1
        jumps = 0
        
        while pos != length(c)
            # First try to jump by 2 (minding jump-past-end)
            if ((pos+2) <= length(c)) && (c[pos+2] == 0)
                jumps += 1
                pos += 2
            elseif c[pos+1] == 0
                jumps += 1
                pos += 1
            else
                # Problem doesn't specify what to do here so just return
                # (ie destination unreachable)
                return jumps
            end
        end
        
        return jumps
    end
    
    """
        taumBday(b, w, bc, wc, z)
    
    Taum is planning to celebrate the birthday of his friend, Diksha. There are two types of gifts that Diksha 
    wants from Taum: one is black and the other is white. To make her happy, Taum has to buy  black gifts and  white gifts.
    - The cost of each black gift is  units.
    - The cost of every white gift is  units.
    - The cost to convert a black gift into white gift or vice versa is  units.
    Determine the minimum cost of Diksha's gifts.
    
    # Arguments
    - `b` = Number of black gifts Diksha wants
    - `w` = Number of white gifts Diksha wants
    - `bc` = Cost of a black gift
    - `wc` = Cost of a white gift
    - `z` = Cost to convert a gift black<->white
    
    # Output
    The minimum cost of Diksha's black + white gifts
    """
    function taumBday(b, w, bc, wc, z)
        min_price_b = Int64(min(bc, wc+z))
        min_price_w = Int64(min(wc, bc+z))
        return (b*min_price_b + w*min_price_w)
    end
    
    """
        kaprekarNumbers(p, q)
    
    A modified Kaprekar number is a positive whole number with a special property. If you square it, then split 
    the number into two integers and sum those integers, you have the same value you started with.
    Consider a positive whole number `n` with `d` digits. We square `n` to arrive at a number that is either `2*d` digits 
    long or `2*d - 1` digits long. Split the string representation of the square into two parts, `l` and `r`. 
    The right hand part, `r` must be `d` digits long. The left is the remaining substring. Convert those two 
    substrings back to integers, add them and see if you get .
    
    # Arguments
    - `p` = lower limit of range to scan for Kaprekar numbers (incl) 
    - `q` = upper limit of range to scan for Kaprekar numbers (incl)
    
    # Output
    A list of Kaprekar numbers in the range p-q
    """
    function kaprekarNumbers(p, q)
        kaprekar_nums = []
        
        for n = p:q
            digits_in_n = getIntDigits(n)
            n_squared = n*n
            
            # Build `l` and `r`
            digits_in_n_squared = getIntDigits(n_squared)
            digits_in_r = digits_in_n
            digits_in_l = digits_in_n_squared - digits_in_r
        
            r = 0
            l = 0
            # Just scan `n_squared` left-right to derive `l` and `r`
            multiplier_l = 10^(max(digits_in_l,1) - 1)
            multiplier_r = 10^(max(digits_in_r,1) - 1)
            for i = 1:digits_in_n_squared
                # Note: getDigitAt indexes left to right
                digit = getDigitAt(n_squared, i)
                if i <= digits_in_l
                    l += multiplier_l*digit
                    multiplier_l = div(multiplier_l, 10)
                else
                    r += multiplier_r*digit
                    multiplier_r = div(multiplier_r, 10)
                end
            end
        
            # It's a Kaprekar num if the 2 parts sum up to n
            if (r+l) == n
                push!(kaprekar_nums, n)
            end
        end
        
        return kaprekar_nums
    end
    
    """
        squares(a, b)
    
    Watson likes to challenge Sherlock's math ability. He will provide a starting and ending value that describe 
    a range of integers, inclusive of the endpoints. Sherlock must determine the number of square integers within 
    that range.
    Note: A square integer is an integer which is the square of an integer, e.g. 1, 4, 9, 16, 25.
    
    # Arguments
    - `a` = starting value of the range
    - `b` = ending value of the range
    
    # Output
    The number of square integers within the range a-b inclusive
    """
    function squares(a, b)
        lower_bound = ceil(sqrt(a))
        upper_bound = floor(sqrt(b))
        return Int(upper_bound - lower_bound + 1)
    end
    
    """
        chocolateFeast(n, c, m)
    
    Little Bobby loves chocolate. He frequently goes to his favorite  store, Penny Auntie, to buy them. They are 
    having a promotion at Penny Auntie. If Bobby saves enough wrappers, he can turn them in for a free chocolate.
    
    # Arguments
    - `n` = money Bobby has
    - `c` = monetary cost of a chocolate
    - `m` = wrapper cost of a chocolate (turn-in)
    
    # Output
    The number of chocolates Bobby can eat after taking full advantage of the promotion
    Note: Little Bobby will always turn in his wrappers if he has enough to get a free chocolate.
    """
    function chocolateFeast(n, c, m)
        eaten = 0
        
        # Buy as much as possible and eat
        can_buy = div(n, c)
        eaten += can_buy
        
        # Turn in and keep eating
        wrappers = can_buy
        while div(wrappers, m) > 0
            bought = div(wrappers, m)
            extra_wrappers = wrappers - bought*m
            eaten += bought
            wrappers = bought + extra_wrappers
        end
        
        eaten
    end
    
    """
        beautifulTriplets(d, arr)
    
    Given a sequence of integers a, a triplet (a[i], a[j], a[k]) is beautiful if:
    - i < j < k
    - a[j] - a[i] = a[k] - a[j] = d
    
    Given an increasing sequence of integers and the value of d, count the number of beautiful triplets in the sequence.
    
    # Arguments
    - `d` = difference between triplets
    - `arr` = array of triplets
    
    # Output
    The number of "beautiful triplets" in the array, as per the description.
    """
    function beautifulTriplets(d, arr)
        triplet_count = 0
        
        # Optimise with a lookup table
        lookup = fill(0, maximum(arr) + 1) # Need an extra spot for 0 (julia is 1-indexed)
    
        # left triplet < mid triplet < right triplet
        # Scan array where the current element is a potential right triplet
        for i = 1:length(arr)
            right_triplet = arr[i]
            mid_triplet = right_triplet - d
            left_triplet = mid_triplet - d
            
            # Record current triplet in lookup
            lookup[right_triplet + 1] += 1
            
            # Now check if other 2 triplets are known
            (mid_triplet >= 0 && left_triplet >= 0) || continue
            mid_triplet_count = lookup[mid_triplet + 1]
            left_triplet_count = lookup[left_triplet + 1]
            (mid_triplet_count != 0 && left_triplet_count != 0) || continue
            # Make sure we count duped triplets (they will be at different indeces)
            triplet_count += max(mid_triplet_count, left_triplet_count)
        end 
        
        triplet_count
    end
    
    """
        minimumDistance(a)
    
    The distance between two array values is the number of indices between them. Given an array `a`, find the 
    minimum distance between any pair of equal elements in the array. If no such value exists, return -1.
    
    # Arguments
    - `a` = array of numbers to scan
    
    # Output
    The shortest distance between any pair of the same numbers, found in a.
    """
    function minimumDistance(a)
        # Want to do this in 1 pass to avoid O(n^2) 
        # We will use 2 lookup tables:
        # `last_index` keeps track of where (index) in `a` we last saw a number
        # `shortest_distance` keeps track of the shortest distance between any number 
        # and that same number, present in a
        # Note: We will be indexing these as [n+1] foreach n due to Julia's 1-indexing
        lookup_size = maximum(a) + 1
        last_index = fill(0, lookup_size)
        shortest_distance = fill(typemax(Int), lookup_size)
        
        for (i, n) in enumerate(a)
            n_as_index = n + 1
            if last_index[n_as_index] == 0
                # First time n is seen
                last_index[n_as_index] = i
            else
                # Have seen n before => record this occurrence
                distance_from_last_n_seen = i - last_index[n_as_index]
                last_index[n_as_index] = i
                shortest_distance[n_as_index] = min(shortest_distance[n_as_index], distance_from_last_n_seen)
            end
        end
        
        # Return shortest_distance or -1 if no number was seen twice
        (minimum(shortest_distance) == typemax(Int)) && return -1
        minimum(shortest_distance)
    end
    
    """
        howManyGames(p, d, m, s)
    
    You wish to buy video games from the famous online video game store Mist.
    Usually, all games are sold at the same price, `p` dollars. However, they are planning to have the seasonal 
    Halloween Sale next month in which you can buy games at a cheaper price. Specifically, the first game will cost `p` dollars, 
    and every subsequent game will cost `d` dollars less than the previous one. This continues until the cost becomes less 
    than or equal to `m` dollars, after which every game will cost `m` dollars. How many games can you buy during the Halloween Sale?
    
    # Arguments
    - `p` = price of the 1st game
    - `d` = the discount from the previous game price
    - `m` = the minimum cost of a game
    - `s` = the starting budget
    
    # Output
    How many games can be bought, given the rules above and the input parameters
    """
    function howManyGames(p, d, m, s)
        cost = p
        money = s
        
        # No money for games
        (money < cost) && (return 0)
        
        # Buy first game
        money -= cost
        cost -= d
        games_bought = 1
        
        
        # Buy subsequent games until cost <= m
        while money >= cost > m
            money -= cost
            cost -= d
            games_bought += 1
        end
        
        # No money left for games
        (money < cost) && (return games_bought)
        
        # Buy the rest at cost == m
        cost = m
        (money >= cost) && (games_bought += div(money, cost))
        
        games_bought
    end
    
    """
        fairRations(B)
    
    You are the benevolent ruler of Rankhacker Castle, and today you're distributing bread. Your subjects are 
    in a line, and some of them already have some loaves. Times are hard and your castle's food stocks are 
    dwindling, so you must distribute as few loaves as possible according to the following rules:
    1. Every time you give a loaf of bread to some person `i`, you must also give a loaf of bread to the 
    person immediately in front of or behind them in the line (i.e., persons `i+1` or `i-1`).
    2. After all the bread is distributed, each person must have an even number of loaves.
    Given the number of loaves already held by each citizen, find and return the minimum number of loaves you 
    must distribute to satisfy the two rules above. If this is not possible, return "NO".
    
    # Arguments
    - `B` = numbers of loaves each subjects in the queue already has, in queue order
    
    # Output
    The number of loaves (as a String) distributed to achieve every subject getting an even number.
    "NO" if the task is impossible.
    """
    function fairRations(B)
        # We distribute 2 loaves at a time so the eventual sum can never 
        # be even if the starting sum was odd
        (sum(B) % 2 != 0) && return "NO"
        
        # Now distribute left -> right
        # Note: Direction doesn't matter as we have no restriction on how many loaves
        # each subject gets as long as it's an even number
        loaves_handed_out = 0
        for (i,n) in enumerate(B)
            if n % 2 != 0
                B[i+1] += 1
                loaves_handed_out += 2
            end
        end
        
        string(loaves_handed_out)
    end
    
    """
        bigSorting(unsorted)
    
    Consider an array of numeric strings where each string is a positive number with anywhere 
    from `1` to `10^6` digits. 
    Sort the array's elements in non-decreasing, or ascending order of their integer values and 
    return the sorted array.
    
    # Arguments
    - `unsorted` = the unsorted array of numbers, as strings.
    
    # Output
    The sorted array of numbers, as strings.
    """
    function bigSorting(unsorted)
        # Convert to BigInt -> sort -> convert back to String
        string.(sort((x -> parse(BigInt, x)).(unsorted)))
    end

end # module AlgorithmsEasyModule