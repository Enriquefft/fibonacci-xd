use criterion::{criterion_group, criterion_main, Criterion, BenchmarkId};

use fibonacci::simple;


fn bench_fibs(c: &mut Criterion) {
    let mut group = c.benchmark_group("Fibonacci");
    for i in [20u128, 21u128].iter() {
        group.bench_with_input(BenchmarkId::new("Recursive", i), i,
            |b, i| b.iter(|| simple::fibonacci_recursive(*i)));
        group.bench_with_input(BenchmarkId::new("Iterative", i), i,
            |b, i| b.iter(|| simple::fibonacci_recursive_dp(*i)));
    }
    group.finish();
}

criterion_group!(benches, bench_fibs);
criterion_main!(benches);
