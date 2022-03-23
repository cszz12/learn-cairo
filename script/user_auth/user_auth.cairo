# Declare this file as a StarkNet contract.
%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

# A map from user (represented by account contract address)
# to their balance.
@storage_var
func balance(user : felt) -> (res : felt):
end

# func read{
#         syscall_ptr : felt*, range_check_ptr,
#         pedersen_ptr : HashBuiltin*}(
#     user : felt) -> (res : felt)

# func write{
#         syscall_ptr : felt*, range_check_ptr,
#         pedersen_ptr : HashBuiltin*}(
#     user : felt, value : felt)
        
from starkware.cairo.common.math import assert_nn
from starkware.starknet.common.syscalls import get_caller_address

# Increases the balance of the user by the given amount.
@external
func increase_balance{
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*,
        range_check_ptr}(amount : felt):
    # Verify that the amount is positive.
    with_attr error_message(
            "Amount must be positive. Got: {amount}."):
        assert_nn(amount)
    end

    # Obtain the address of the account contract.
    let (user) = get_caller_address()

    # Read and update its balance.
    let (res) = balance.read(user=user)
    balance.write(user, res + amount)
    return ()
end

# Returns the balance of the given user.
@view
func get_balance{
        syscall_ptr : felt*, pedersen_ptr : HashBuiltin*,
        range_check_ptr}(user : felt) -> (res : felt):
    let (res) = balance.read(user=user)
    return (res)
end
