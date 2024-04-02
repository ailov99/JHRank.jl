module maximumDraws_test

    using JHRank
    using JHRank.MathematicsEasyModule
    using Test

    function test()
        for i = 1:9999:10^6
            @test maximumDraws(i) == i+1
        end
    end

end # module maximumDraws_test

using .maximumDraws_test
maximumDraws_test.test()

module lowestTriangle_test

    using JHRank
    using JHRank.MathematicsEasyModule
    using Test

    function test()
        # HR
        @test lowestTriangle(4, 6) == 3
        @test lowestTriangle(2, 2) == 2
        @test lowestTriangle(17, 100) == 12
    end

end # module lowestTriangle_test

using .lowestTriangle_test
lowestTriangle_test.test()

module gameWithCells_test

    using JHRank
    using JHRank.MathematicsEasyModule
    using Test

    function test()
        # HR
        @test gameWithCells(2, 3) == 2
        @test gameWithCells(2, 2) == 1
        @test gameWithCells(1, 1) == 1
        @test gameWithCells(25, 25) == 169
    end

end # module gameWithCells_test

using .gameWithCells_test
gameWithCells_test.test()