use cached::proc_macro::cached;

pub fn fibonacci_recursive(n: u128) -> u128 {
    match n {
        0 => 0,
        1 => 1,
        _ => fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2),
    }
}

#[cached]
pub fn fibonacci_recursive_dp(n: u128) -> u128 {
    match n {
        0 => 0,
        1 => 1,
        _ => fibonacci_recursive_dp(n - 1) + fibonacci_recursive_dp(n - 2),
    }
}
