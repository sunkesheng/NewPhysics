NameProcess = "Psill";
NameObservables = {{BRPsi1stoEMu, 3000, "BR(Psi(1s)->e mu)"}, 
                   {BRPsi1stoETau, 3001, "BR(Psi(1s)->e tau)"}, 
                   {BRPsi1stoMuTau, 3002, "BR(Psi(1s)->mu tau)"},
                   {BRPsi2stoEMu, 3003, "BR(Psi(2s)->e mu)"}, 
                   {BRPsi2stoETau, 3004, "BR(Psi(2s)->e tau)"}, 
                   {BRPsi2stoMuTau, 3005, "BR(Psi(2s)->mu tau)"}
                  };

NeededOperators = {K1L, K1R,K2L, K2R, OPsillVRR, OPsillVLL,
  OPsillVRL, OPsillVLR, OPsillTLL, OPsillTLR, OPsillTRL, OPsillTRR
};

Body = "Psill.f90"; 

