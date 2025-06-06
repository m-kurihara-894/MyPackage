using Test
import MyPackage: timeprop

@testset "timeprop" begin
    # 等加速度運動
    @test isapprox(timeprop((x, t) -> 1, 1.0, 0.0, 0.0, 0.1)[1], 0.500; atol=1e-1)
    # F ∝ t の場合
    @test isapprox(timeprop((x, t) -> t, 1.0, 0.0, 0.0, 0.1)[1], 0.167; atol=1e-1)
    # x(t) = exp(t)になるはず。
    @test isapprox(timeprop((x, t) -> x, 1.0, 1.0, 1.0, 0.01)[1], 2.781; atol=1e-1)
    # x(t) = sin(t)になるはず。
    @test isapprox(timeprop((x, t) -> -x, π/2, 0.0, 1.0, 0.01)[1], 1.000; atol=1e-1)
end

nothing