struct PSResult{T}
    value::T
end

struct PSError <: Exception
    message::String
end

# Abstract types used in other PS packages -
abstract type PSAbstractAsset end
abstract type PSAbstractAssetReturnModel end
abstract type PSAbstractAssetTreeNode end
abstract type PSAbstractAssetTree end
abstract type PSAbstractProblemModel end