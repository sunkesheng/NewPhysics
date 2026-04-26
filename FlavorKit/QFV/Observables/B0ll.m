NameProcess = "B0toLL";
NameObservables = {{BrB0dEE, 4000, "BR(B^0_d->e e)"}, 
                   {ratioB0dEE, 4001, "BR(B^0_d->e e)/BR(B^0_d->e e)_SM"},  
                   {BrB0sEE, 4002, "BR(B^0_s->e e)"}, 
                   {ratioB0sEE, 4003, "BR(B^0_s->e e)/BR(B^0_s->e e)_SM"}, 
                   {BrB0dMuMu, 4004, "BR(B^0_d->mu mu)"}, 
                   {ratioB0dMuMu, 4005, "BR(B^0_d->mu mu)/BR(B^0_d->mu mu)_SM"}, 
                   {BrB0sMuMu, 4006, "BR(B^0_s->mu mu)"}, 
                   {ratioB0sMuMu, 4007, "BR(B^0_s->mu mu)/BR(B^0_s->mu mu)_SM"}, 
                   {BrB0dTauTau, 4008, "BR(B^0_d->tau tau)"}, 
                   {ratioB0dTauTau, 4009, "BR(B^0_d->tau tau)/BR(B^0_d->tau tau)_SM"}, 
                   {BrB0sTauTau, 4010, "BR(B^0_s->tau tau)"}, 
                   {ratioB0sTauTau, 4011, "BR(B^0_s->tau tau)/BR(B^0_s->tau tau)_SM"},
                   {BrB0dEMu, 4012, "BR(B^0_d->e mu)"},
                   {BrB0dETau, 4013, "BR(B^0_d->e tau)"},
                   {BrB0dMuTau, 4014, "BR(B^0_d->mu tau)"},
                   {BrB0sEMu, 4015, "BR(B^0_s->e mu)"},
                   {BrB0sETau, 4016, "BR(B^0_s->e tau)"},
                   {BrB0sMuTau, 4017, "BR(B^0_s->mu tau)"}};


NeededOperators = {OddllSLL, OddllSRR, OddllSRL, OddllSLR,
                   OddllVRR, OddllVLL, OddllVRL, OddllVLR,
                   OddllSLLSM, OddllSRRSM, OddllSRLSM, OddllSLRSM,
                   OddllVRRSM, OddllVLLSM, OddllVRLSM, OddllVLRSM};

Body = "B0ll.f90"; 

