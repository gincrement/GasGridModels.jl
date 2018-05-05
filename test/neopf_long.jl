
#Check the qp gas and power flow model, this is contrived to make sure something is built on both sides

@testset "test qp ne opf" begin

    @testset "36 Bus Ilic 1.1 Northeast 1.0" begin
        result = GasGridModels.run_ne_opf("../data/36bus_ilic_expansion_1.1.json", "../data/TC_PennToNortheast_wValves_expansion_1.0.json", SOCWRPowerModel, MISOCPGasModel, misocp_solver; power_opf_weight=365, gas_price_weight=365)
        @test result["status"] == :LocalOptimal || result["status"] == :Optimal
        @test isapprox(result["objective"], 4.926397139595786e9; atol = 1e5) 
    end
   

    @testset "36 Bus Ilic 1.1 Northeast 2.25" begin
        result = GasGridModels.run_ne_opf("../data/36bus_ilic_expansion_1.1.json", "../data/TC_PennToNortheast_wValves_expansion_2.25.json", SOCWRPowerModel, MISOCPGasModel, misocp_solver; power_opf_weight=365, gas_price_weight=365)
        @test result["status"] == :LocalOptimal || result["status"] == :Optimal
        @test isapprox(result["objective"], 5.127290418071447e9; atol = 1e6) 
    end



    @testset "36 Bus Ilic 1.0 Northeast 1.0" begin
        result = GasGridModels.run_ne_opf("../data/36bus_ilic_expansion_1.0.json", "../data/TC_PennToNortheast_wValves_expansion_1.0.json", SOCWRPowerModel, MISOCPGasModel, misocp_solver; power_opf_weight=365, gas_price_weight=365)
        @test result["status"] == :LocalOptimal || result["status"] == :Optimal
        @test isapprox(result["objective"], 4.0269404390948544e9; atol = 1e5) 
    end
    
    @testset "36 Bus Ilic 1.0 Northeast 2.25" begin
        result = GasGridModels.run_ne_opf("../data/36bus_ilic_expansion_1.0.json", "../data/TC_PennToNortheast_wValves_expansion_2.25.json", SOCWRPowerModel, MISOCPGasModel, misocp_solver; power_opf_weight=365, gas_price_weight=365)
        @test result["status"] == :LocalOptimal || result["status"] == :Optimal
        @test isapprox(result["objective"], 4.1859768708376384e9; atol = 1e5) 
    end
    

    
    
    
    # Really long running
   # @testset "36 Bus Ilic 1.0 Northeast 4.0" begin
    #    result = GasGridModels.run_ne_opf("../data/36bus_ilic_expansion_1.0.json", "../data/TC_PennToNortheast_wValves_expansion_4.0.json", SOCWRPowerModel, MISOCPGasModel, misocp_solver; power_opf_weight=365, gas_price_weight=365)
     #   @test result["status"] == :LocalOptimal || result["status"] == :Optimal
      #  @test isapprox(result["objective"], 4.389485957629279e9; atol = 1e5) 
    #end
          
end

