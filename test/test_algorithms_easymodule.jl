module beautifulDays_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    # i32 'macro' is needed as we only implement this function for Int32 (HR requirements)
    struct i32 end
    (*)(n, ::Type{i32}) = Int32(n)

    function test()
        # HR
        @test beautifulDays(20i32, 23i32, 6i32) == 2
        # Invalid input (end before start)
        @test beautifulDays(23i32, 20i32, 6i32) == 0
        # All days
        @test beautifulDays(1i32, 9i32, 33i32) == 9
        # Other
        @test beautifulDays(56i32, 58i32, 3i32) == 3
        @test beautifulDays(10i32, 99i32, 9i32) == 90
        @test beautifulDays(100i32, 999i32, 99i32) == 900
        @test beautifulDays(100i32, 999i32, 11i32) == 900
        @test beautifulDays(100i32, 999i32, 9i32) == 900
        @test beautifulDays(100i32, 999i32, 3i32) == 900
        @test beautifulDays(1000i32, 9999i32, 9i32) == 9000
        @test beautifulDays(1000i32, 9999i32, 3i32) == 9000
        @test beautifulDays(998i32, 1001i32, 99i32) == 3
    end

end # module beautifulDays_test

using .beautifulDays_test
beautifulDays_test.test()

module findDigits_test 

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    # i32 'macro' is needed as we only implement this function for Int32 (HR requirements)
    struct i32 end
    (*)(n, ::Type{i32}) = Int32(n)

    function test()
        # HR
        @test findDigits(12i32) == 2
        @test findDigits(1012i32) == 3
        # Other
        @test findDigits(64523526i32) == 5
        @test findDigits(222222222i32) == 9
        @test findDigits(typemax(Int32)) == 1
        @test findDigits(typemin(Int32)) == 7
    end

end # module findDigits_test

using .findDigits_test
findDigits_test.test()

module cutTheSticks_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        # HR
        # Test Case 8
        # sticks-length        length-of-cut   sticks-cut
        # 5 4 4 2 2 8             2               6
        # 3 2 2 _ _ 6             2               4
        # 1 _ _ _ _ 4             1               2
        # _ _ _ _ _ 3             3               1
        # _ _ _ _ _ _           DONE            DONE
        test_case_8::Array{Int32} = [5, 4, 4, 2, 2, 8]
        @test cutTheSticks(test_case_8) == [6, 4, 2, 1]

        # Test Case 9
        # sticks-length         length-of-cut   sticks-cut
        # 1 2 3 4 3 3 2 1         1               8
        # _ 1 2 3 2 2 1 _         1               6
        # _ _ 1 2 1 1 _ _         1               4
        # _ _ _ 1 _ _ _ _         1               1
        # _ _ _ _ _ _ _ _       DONE            DONE
        test_case_9::Array{Int32} = [1, 2, 3, 4, 3, 3, 2, 1]
        @test cutTheSticks(test_case_9) == [8, 6, 4, 1]
    end

end # module cutTheSticks_test

using .cutTheSticks_test
cutTheSticks_test.test()


module circularArrayRotation_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    # i32 'macro' is needed as we only implement this function for Int32 (HR requirements)
    struct i32 end
    (*)(n, ::Type{i32}) = Int32(n)

    function test()
        # HR
        array_to_rotate::Array{Int32} = [1, 2, 3]
        indeces_to_report::Array{Int32} = [0, 1, 2]
        @test circularArrayRotation(array_to_rotate, 2i32, indeces_to_report) == [2, 3, 1]

        # Other
        @test circularArrayRotation(array_to_rotate, 0i32, indeces_to_report) == array_to_rotate
        @test circularArrayRotation(array_to_rotate, 3i32, indeces_to_report) == array_to_rotate

        array_to_rotate = [4, 6, 1, 2, 3, 5, 8, 9, 1]
        indeces_to_report = [0]
        @test circularArrayRotation(array_to_rotate, 5i32, indeces_to_report) == [3]

        indeces_to_report = [2, 4, 5, 8]
        @test circularArrayRotation(array_to_rotate, 5i32, indeces_to_report) == [8, 1, 4, 2]
    end

end # module circularArrayRotation_test

using .circularArrayRotation_test
circularArrayRotation_test.test()

module viralAdvertising_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        # HR
        @test viralAdvertising(5) == 24
        @test viralAdvertising(3) == 9
    end

end # module viralAdvertising_test

using .viralAdvertising_test
viralAdvertising_test.test()

module libraryFine_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test libraryFine(
            9, 6, 2015, 
            6, 6, 2015
        ) == 45
        @test libraryFine(
            1, 1, 2013,
            31, 12, 2012
        ) == 10_000
        @test libraryFine(
            31, 4, 2013,
            31, 3, 2013
        ) == 500
        @test libraryFine(
            1, 4, 2013,
            31, 3, 2013
        ) == 500
        @test libraryFine(
            31, 3, 2013,
            1, 3, 2013
        ) == 450
        @test libraryFine(
            15, 5, 2013,
            16, 5, 2013
        ) == 0
        @test libraryFine(
            31, 4, 2010,
            1, 6, 2010
        ) == 0
        @test libraryFine(
            31, 12, 2010,
            1, 1, 20011
        ) == 0
    end

end # module libraryFine_test

using .libraryFine_test
libraryFine_test.test()

module maximizingXor_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test maximizingXor(5, 5) == 0
        @test maximizingXor(1, 2) == 3
        @test maximizingXor(10, 15) == 7
        @test maximizingXor(11, 100) == 127
    end

end # module maximizingXor_test

using .maximizingXor_test
maximizingXor_test.test()

module appendAndDelete_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test appendAndDelete("abc", "def", 6) == true
        @test appendAndDelete("rollercoaster", "rollercoaster", 0) == true
        @test appendAndDelete("rollercoaster", "rollerrcoaster", 0) == false
        @test appendAndDelete("rollercoaster", "rollerrcoaster", 14) == false
        @test appendAndDelete("rollercoaster", "rollerrcoaster", 15) == true
        @test appendAndDelete("hackerhappy", "hackerrank", 9) == true
        @test appendAndDelete("aba", "aba", 7) == true
        @test appendAndDelete("a", "a", 200) == true
        @test appendAndDelete("ashley", "ash", 2) == false
        @test appendAndDelete("qwerasdf", "qwerbsdf", 6) == false
    end

end # module appendAndDelete_test

using .appendAndDelete_test
appendAndDelete_test.test()

module equalizeArray_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test equalizeArray([1,2,2,3]) == 2
        @test equalizeArray([3,3,2,1,3]) == 2
        @test equalizeArray([1,2,3,4,5,6,7,8,9,10]) == 9
        @test equalizeArray([1,1,1,534,64537,4,645,234,45,1,1,1,57453]) == 7
        @test equalizeArray([1 for i = 1:500]) == 0
        @test equalizeArray([1,2,3,1,2,3,3,3]) == 4
    end

end # module equalizeArray_test

using .equalizeArray_test
equalizeArray_test.test()

module repeatedString_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test repeatedString("abcac", 10) == 4
        @test repeatedString("aba", 10) == 7
        @test repeatedString("a", 9999) == 9999
        @test repeatedString("a", 1000000000000) == 1000000000000
    end

end # module repeatedString_test

using .repeatedString_test
repeatedString_test.test()

module serviceLane_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test serviceLane(
            [2, 3, 1, 2, 3, 2, 3, 3], 
            [[0,3], [4,6], [6,7], [3,5], [0,7]]
        ) == [1, 2, 3, 2, 1]
        @test serviceLane(
            [1, 2, 2, 2, 1],
            [[2,3], [1,4], [2,4], [2,4], [2,3]]
        ) == [2, 1, 1, 1, 2]
    end

end # module serviceLane_test

using .serviceLane_test
serviceLane_test.test()

module jumpingOnClouds_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test jumpingOnClouds([0, 1, 0, 0, 0, 1, 0]) == 3
        @test jumpingOnClouds([0, 0, 1, 0, 0, 1, 0]) == 4
        @test jumpingOnClouds([0, 0, 0, 0, 1, 0]) == 3
        @test jumpingOnClouds([0, 0, 0, 1, 0, 0]) == 3
    end

end # module jumpingOnClouds_test

using .jumpingOnClouds_test
jumpingOnClouds_test.test()

module taumBday_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test taumBday(3, 5, 3, 4, 1) == 29
        @test taumBday(10, 10, 1, 1, 1) == 20
        @test taumBday(5, 5, 2, 3, 4) == 25
        @test taumBday(3, 6, 9, 1, 1) == 12
        @test taumBday(7, 7, 4, 2, 1) == 35
        @test taumBday(3, 3, 1, 9, 2) == 12
        @test taumBday(27_984, 1_402,  619_246, 615_589, 247_954) == 18_192_035_842
        @test taumBday(95_677, 39_394, 86_983,  311_224, 588_538) == 20_582_630_747
        @test taumBday(68_406, 12_718, 532_909, 315_341, 201_009) == 39_331_944_938
        @test taumBday(15_242, 95_521, 712_721, 628_729, 396_706) == 70_920_116_291
        @test taumBday(21_988, 67_781, 645_748, 353_796, 333_199) == 38_179_353_700
        @test taumBday(22_952, 80_129, 502_975, 175_136, 340_236) == 25_577_754_744
        @test taumBday(38_577, 3_120,  541_637, 657_823, 735_060) == 22_947_138_309
        @test taumBday(5_943,  69_851, 674_453, 392_925, 381_074) == 31_454_478_354
        @test taumBday(62_990, 61_330, 310_144, 312_251, 93_023)  == 38_686_324_390
        @test taumBday(11_152, 43_844, 788_543, 223_872, 972_572) == 18_609_275_504
    end

end # module taumBday_test

using .taumBday_test
taumBday_test.test()


module kaprekarNumbers_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test kaprekarNumbers(1, 100) == [1, 9, 45, 55, 99]
        @test kaprekarNumbers(5,5) == []
        @test kaprekarNumbers(45, 45) == [45]
        @test kaprekarNumbers(100, 300) == [297]
        @test kaprekarNumbers(1, 99_999) == [
            1, 9, 45, 55, 99, 297, 703, 999,
            2_223, 2_728, 4_950, 5_050, 7_272,
            7_777, 9_999, 17_344, 22_222, 77_778,
            82_656, 95_121, 99_999
        ]
    end

end # module kaprekarNumbers_test

using .kaprekarNumbers_test
kaprekarNumbers_test.test()

module squares_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test squares(3, 9) == 2
        @test squares(17, 24) == 0
        @test squares(35, 70) == 3
        @test squares(100, 1_000) == 22
    end

end # module squares_test

using .squares_test
squares_test.test()

module chocolateFeast_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test chocolateFeast(15, 3, 2) == 9
        @test chocolateFeast(10, 2, 5) == 6
        @test chocolateFeast(12, 4, 4) == 3
        @test chocolateFeast(6, 2, 2) == 5
        @test chocolateFeast(7, 3, 2) == 3
    end

end # module chocolateFeast_test

using .chocolateFeast_test
chocolateFeast_test.test()

module beautifulTriplets_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test beautifulTriplets(1, [2,2,3,4,5]) == 3
        @test beautifulTriplets(3, [1,2,4,5,7,8,10]) == 3
        @test beautifulTriplets(3, [1,6,7,7,8,10,12,13,14,19]) == 2
    end

end # module beautifulTriplets_test

using .beautifulTriplets_test
beautifulTriplets_test.test()

module minimumDistance_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test minimumDistance([3, 2, 1, 2, 3]) == 2
        @test minimumDistance([7, 1, 3, 4, 1, 7]) == 3
        @test minimumDistance([1, 2, 3, 4, 10]) == -1
    end

end # module minimumDistance_test
using .minimumDistance_test
minimumDistance_test.test()

module howManyGames_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test howManyGames(20, 3, 6, 70) == 5
        @test howManyGames(20, 3, 6, 80) == 6
        @test howManyGames(20, 3, 6, 85) == 7
    end

end # module howManyGames_test
using .howManyGames_test
howManyGames_test.test()

module fairRations_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test

    function test()
        @test fairRations([4, 5, 6, 7]) == "4"
        @test fairRations([2, 3, 4, 5, 6]) == "4"
        @test fairRations([1, 2]) == "NO"
    end

end # module fairRations_test
using .fairRations_test
fairRations_test.test()

module bigSorting_test

    using JHRank
    using JHRank.AlgorithmsEasyModule
    using Test
    
    function test()
        @test bigSorting(["1", "200", "150", "3"]) == ["1", "3", "150", "200"]
        @test bigSorting(
            ["31415926535897932384626433832795", "1", "3", "10", "3", "5"]
        ) == ["1", "3", "3", "5", "10", "31415926535897932384626433832795"]
        @test bigSorting(
            ["1", "2", "100", "12303479849857341718340192371", "3084193741082937",
            "3084193741082938", "111", "200"]
        ) == ["1", "2", "100", "111", "200", "3084193741082937", "3084193741082938",
        "12303479849857341718340192371"]
    end

end # module bigSorting_test
using .bigSorting_test
bigSorting_test.test()