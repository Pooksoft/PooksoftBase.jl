"""
    checkresult(result::PSResult; 
        logger::Union{Nothing, SimpleLogger} = nothing)->(Union{Nothing,T} where T<:Any)

Checks the value of the argument `result` which is of type PSResult for a value or an error. 
Returns the value stored in result, or throws the error if the value stored in `result` is an Exception type.
If the optional argument `logger` is not Nothing, the error message is written to a log file. 
"""
function checkresult(result::PSResult; 
    logger::Union{Nothing, SimpleLogger} = nothing)::(Union{Nothing,T} where T<:Any)

    # ok, so check, do we have an error object?
    # Yes: log the error if we have a logger, then throw the error. 
    # No: return the result.value

    # Error case -
    if (isa(result.value, Exception) == true)
        
        # get the error object -
        error_object = result.value

        # get the error message as a String -
        error_message = sprint(showerror, error_object)
    
        # log -
        if (isnothing(logger) == false)
            with_logger(logger) do
                @error(error_message)
            end
        end

        # throw -
        throw(result.value)
    end

    # default -
    return result.value
end