Real(dp) :: mV,FV, FVT, BRVToEE, Y, Qq, BR

Complex(dp) :: VCDL,VCDR,VCVL,VCVR,VCTL,VCTR,VALL,VBLL,VCLL,VDLL

Integer :: i1,i2, gt1, gt2

! ---------------------------------------------------------------- 
! Psi(1s,2s)->ll
! Observable implemented by Ke-sheng Sun
! Based on D.E.Hazard,A.A.Petrov,Phys.Rev.D94(2016)7,074023[hep-ph/1607.00815v1]
! ---------------------------------------------------------------- 
 

Do i1=1,3 
If (i1.eq.1) Then         ! Psi -> e mu
 gt1 = 2
 gt2 = 1
Elseif (i1.eq.2) Then     ! Psi -> e tau
 gt1 = 3
 gt2 = 1
Else                      ! Psi -> mu tau
 gt1 = 3
 gt2 = 2
End if

Do i2=1,3 
If (i2.eq.1) Then
mV=3.09692_dp            ! Psi1s mass in GeV 
FV=0.418_dp              ! Psi1s decay constant in GeV 
FVT=0.410_dp             ! Psi1s decay constant in GeV 
BRVToEE=5.971e-2_dp      ! BR(Psi1s->ee)
Else                      
mV=3.686097_dp           ! Psi2s mass in GeV 
FV=0.294_dp              ! Psi2s decay constant in GeV 
FVT=0.294_dp             ! Psi2s decay constant in GeV 
BRVToEE=7.93e-3_dp       ! BR(Psi2s->ee)
End if

Y=mf_l(gt1)/mV
Qq=2._dp/3._dp


VCDL=sqrt(4._dp*Pi*Alpha)/2._dp*K2R(gt1,gt2)
VCDR=sqrt(4._dp*Pi*Alpha)/2._dp*K2L(gt1,gt2)
VCVL=OPsillVLL(gt1,gt2,2,2)+OPsillVLR(gt1,gt2,2,2)
VCVR=OPsillVRR(gt1,gt2,2,2)+OPsillVRL(gt1,gt2,2,2)
VCTL=(OPsillTRR(gt1,gt2,2,2)+OPsillTRL(gt1,gt2,2,2))/(mf_l(gt1)*mf_u(2)*G_F)
VCTR=(OPsillTLL(gt1,gt2,2,2)+OPsillTLR(gt1,gt2,2,2))/(mf_l(gt1)*mf_u(2)*G_F)

VALL=FV*mV*(sqrt(4._dp*Pi*Alpha)*Qq*Y**2*(VCDL+VCDR)+ 0.5_dp*(VCVL+VCVR) &
      & + Y**2*FVT/FV*G_F*mV*mf_u(2)*(VCTL+VCTR)+sqrt(4._dp*Pi*Alpha)    &
      & * (K1L(gt1,gt2)+K1R(gt1,gt2)))
VBLL=FV*mV*(-sqrt(4._dp*Pi*Alpha)*Qq*Y**2*(VCDL-VCDR)- 0.5_dp*(VCVL-VCVR)&
      & - Y**2*FVT/FV*G_F*mV*mf_u(2)*(VCTL-VCTR)+sqrt(4._dp*Pi*Alpha)    &
      & * (K1R(gt1,gt2)-K1L(gt1,gt2)))
VCLL=FV*mV*Y*(sqrt(4._dp*Pi*Alpha)*Qq*(VCDL+VCDR) &
      & + FVT/FV*G_F*mV*mf_u(2)*(VCTL+VCTR))
VDLL=(0._dp,1._dp)*FV*mV*Y*(-sqrt(4._dp*Pi*Alpha)*Qq*(VCDL-VCDR) &
      & - FVT/FV*G_F*mV*mf_u(2)*(VCTL-VCTR))

BR=BRVToEE*(mV*(1._dp-Y**2)/(4._dp*Pi*Alpha*FV*Qq))**2*(abs(VALL)**2&
         &+abs(VBLL)**2+0.5_dp*(1._dp-2._dp*Y**2)*(abs(VCLL)**2+abs(VDLL)**2)&
         &+Y*Real(VALL*conjg(VCLL)+(0._dp,1._dp)*VBLL*conjg(VDLL)))

If (i1.eq.1) Then
   If (i2.eq.1) Then
      BRPsi1stoEMu=BR      ! BR(Psi1s->e mu) 
   Else 
      BRPsi2stoEMu=BR      ! BR(Psi2s->e mu)
   End if
Elseif (i1.eq.2) Then 
   If (i2.eq.1) Then
      BRPsi1stoETau=BR     ! BR(Psi1s->e tau) 
   Else 
      BRPsi2stoETau=BR     ! BR(Psi2s->e tau)
   End if  
Else
   If (i2.eq.1) Then
      BRPsi1stoMuTau=BR    ! BR(Psi1s->mu tau) 
   Else 
      BRPsi2stoMuTau=BR    ! BR(Psi2s->mu tau)
   End if
End if



End do
End do
