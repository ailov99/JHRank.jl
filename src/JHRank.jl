module JHRank

__precompile__(true)

include("ModuleIncludes.jl")

using .UtilityFunctionsModule:
    getIntDigits, 
    getDigitAt,
    reverseInt,
    readMatrixFromFile,
    readMatrixWithMetadataFromFile,
    writeMatrixToFile,
    writeMatrixAndMetadataToFile,
    isPrime,
    findPrimesUpTo
export getIntDigits, getDigitAt, reverseInt,
    readMatrixFromFile, readMatrixWithMetadataFromFile,
    writeMatrixToFile, writeMatrixAndMetadataToFile,
    isPrime, findPrimesUpTo

using .EasyModule:
    beautifulDays,
    findDigits,
    cutTheSticks,
    circularArrayRotation,
    viralAdvertising,
    libraryFine,
    maximizingXor,
    appendAndDelete,
    equalizeArray,
    repeatedString
export beautifulDays, findDigits, cutTheSticks,
    circularArrayRotation, viralAdvertising,
    libraryFine, maximizingXor, appendAndDelete,
    equalizeArray, repeatedString

using .MediumModule:
    formingMagicSquare,
    nonDivisibleSubset,
    countSort
export formingMagicSquare, nonDivisibleSubset,
    countSort

using .HardModule:
    matrixRotation
export matrixRotation

end
