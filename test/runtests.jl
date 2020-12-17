using PooksoftBase
using Test

# default test = returns true
function default_package_test()
    return true
end

@testset "default_test_set" begin
    default_package_test() == true
end