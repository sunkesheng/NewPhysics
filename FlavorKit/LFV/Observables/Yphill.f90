Real(dp) :: mV,FV, FVT, BRVToEE, Y, Qq, BR

Complex(dp) :: VCDL,VCDR,VCVL,VCVR,VCTL,VCTR,VALL,VBLL,VCLL,VDLL

Integer :: i1, i2, gt1, gt2

! ---------------------------------------------------------------- 
! Phi->ll,Y(1s,2s,3s)->ll
! Observable implemented by Ke-sheng Sun
! Based on D.E.Hazard,A.A.Petrov,Phys.Rev.D94(2016)7,074023[hep-ph/1607.00815v1]
! ---------------------------------------------------------------- 

mV=1.01946_dp! Phi mass in GeV 
FV=0.241_dp! Phi decay constant in GeV 
FVT=0.241_dp! Phi decay constant in GeV 
BRVToEE=2.973e-4_dp! BR(Phi->ee) 

! Phi -> e mu
 gt1 = 2
 gt2 = 1

Y=mf_l(gt1)/mV
Qq=-1._dp/3._dp

VCDL=sqrt(4._dp*Pi*Alpha)/2._dp*K2R(gt1,gt2)
VCDR=sqrt(4._dp*Pi*Alpha)/2._dp*K2L(gt1,gt2)
VCVL=OYphillVLL(gt1,gt2,2,2)+OYphillVLR(gt1,gt2,2,2)
VCVR=OYphillVRR(gt1,gt2,2,2)+OYphillVRL(gt1,gt2,2,2)
VCTL=(OYphillTRR(gt1,gt2,2,2)+OYphillTRL(gt1,gt2,2,2))/(mf_l(gt1)*mf_d(2)*G_F)
VCTR=(OYphillTLL(gt1,gt2,2,2)+OYphillTLR(gt1,gt2,2,2))/(mf_l(gt1)*mf_d(2)*G_F)

VALL=FV*mV*(sqrt(4._dp*Pi*Alpha)*Qq*Y**2*(VCDL+VCDR)+ 0.5_dp*(VCVL+VCVR) &
      & + Y**2*FVT/FV*G_F*mV*mf_d(2)*(VCTL+VCTR)+sqrt(4._dp*Pi*Alpha)    &
      & * (K1L(gt1,gt2)+K1R(gt1,gt2)))
VBLL=FV*mV*(-sqrt(4._dp*Pi*Alpha)*Qq*Y**2*(VCDL-VCDR)- 0.5_dp*(VCVL-VCVR)&
      & - Y**2*FVT/FV*G_F*mV*mf_d(2)*(VCTL-VCTR)+sqrt(4._dp*Pi*Alpha)    &
      & * (K1R(gt1,gt2)-K1L(gt1,gt2)))
VCLL=FV*mV*Y*(sqrt(4._dp*Pi*Alpha)*Qq*(VCDL+VCDR) &
      & + FVT/FV*G_F*mV*mf_d(2)*(VCTL+VCTR))
VDLL=(0._dp,1._dp)*FV*mV*Y*(-sqrt(4._dp*Pi*Alpha)*Qq*(VCDL-VCDR) &
      & - FVT/FV*G_F*mV*mf_d(2)*(VCTL-VCTR))

BR=BRVToEE*(mV*(1._dp-Y**2)/(4._dp*Pi*Alpha*FV*Qq))**2*(abs(VALL)**2&
         &+abs(VBLL)**2+0.5_dp*(1._dp-2._dp*Y**2)*(abs(VCLL)**2+abs(VDLL)**2)&
         &+Y*Real(VALL*conjg(VCLL)+(0._dp,1._dp)*VBLL*conjg(VDLL)))

BRPhitoEMu=BR

! Y -> ll

Do i1=1,3 

If (i1.eq.1) Then         ! Y -> e mu
 gt1 = 2
 gt2 = 1
Elseif (i1.eq.2) Then     ! Y -> e tau
 gt1 = 3
 gt2 = 1
Else                      ! Y -> mu tau
 gt1 = 3
 gt2 = 2
End if

Do i2=1,3 

If (i2.eq.1) Then
mV=9.4603_dp! Y1s mass in GeV 
FV=0.649_dp! Y1s decay constant in GeV 
FVT=0.649_dp! Y1s decay constant in GeV 
BRVToEE=2.38e-2_dp! BR(Y1s->ee)  
Elseif (i2.eq.2) Then
mV=10.023_dp! Y2s mass in GeV 
FV=0.481_dp! Y2s decay constant in GeV 
FVT=0.481_dp! Y2s decay constant in GeV 
BRVToEE=1.91e-2_dp! BR(Y2s->ee) 
Else                      
mV=10.3552_dp! Y3s mass in GeV 
FV=0.539_dp! Y3s decay constant in GeV 
FVT=0.539_dp! Y3s decay constant in GeV 
BRVToEE=2.18e-2_dp! BR(Y3s->ee) 
End if

Y=mf_l(gt1)/mV
Qq=-1._dp/3._dp

VCDL=sqrt(4._dp*Pi*Alpha)/2*K2R(gt1,gt2)
VCDR=sqrt(4._dp*Pi*Alpha)/2*K2L(gt1,gt2)
VCVL=OYphillVLL(gt1,gt2,3,3)+OYphillVLR(gt1,gt2,3,3)
VCVR=OYphillVRR(gt1,gt2,3,3)+OYphillVRL(gt1,gt2,3,3)
VCTL=(OYphillTRR(gt1,gt2,3,3)+OYphillTRL(gt1,gt2,3,3))/(mf_l(gt1)*mf_d(3)*G_F)
VCTR=(OYphillTLL(gt1,gt2,3,3)+OYphillTLR(gt1,gt2,3,3))/(mf_l(gt1)*mf_d(3)*G_F)

VALL=FV*mV*(sqrt(4._dp*Pi*Alpha)*Qq*Y**2*(VCDL+VCDR)+ 0.5_dp*(VCVL+VCVR) &
      & + Y**2*FVT/FV*G_F*mV*mf_d(3)*(VCTL+VCTR)+sqrt(4._dp*Pi*Alpha)    &
      & * (K1R(gt1,gt2)+K1L(gt1,gt2)))
VBLL=FV*mV*(-sqrt(4._dp*Pi*Alpha)*Qq*Y**2*(VCDL-VCDR)- 0.5_dp*(VCVL-VCVR)&
      & - Y**2*FVT/FV*G_F*mV*mf_d(3)*(VCTL-VCTR)+sqrt(4._dp*Pi*Alpha)    &
      & * (K1R(gt1,gt2)-K1L(gt1,gt2)))
VCLL=FV*mV*Y*(sqrt(4._dp*Pi*Alpha)*Qq*(VCDL+VCDR) &
      & + FVT/FV*G_F*mV*mf_d(3)*(VCTL+VCTR))
VDLL=(0._dp,1._dp)*FV*mV*Y*(-sqrt(4._dp*Pi*Alpha)*Qq*(VCDL-VCDR) &
      & - FVT/FV*G_F*mV*mf_d(3)*(VCTL-VCTR))

BR=BRVToEE*(mV*(1._dp-Y**2)/(4._dp*Pi*Alpha*FV*Qq))**2*(abs(VALL)**2&
         &+abs(VBLL)**2+0.5_dp*(1._dp-2._dp*Y**2)*(abs(VCLL)**2+abs(VDLL)**2)&
         &+Y*Real(VALL*conjg(VCLL)+(0._dp,1._dp)*VBLL*conjg(VDLL)))

If (i1.eq.1) Then      !e mu
   If (i2.eq.1) Then
      BRY1stoEMu=BR    ! BR(Y1s->e mu) 
   Elseif (i2.eq.2) Then
      BRY2stoEMu=BR    ! BR(Y2s->e mu)
   Else 
      BRY3stoEMu=BR    ! BR(Y3s->e mu)
   End if
Elseif (i1.eq.2) Then  !e tau
   If (i2.eq.1) Then
      BRY1stoETau=BR   ! BR(Y1s->e tau) 
   Elseif (i2.eq.2) Then
      BRY2stoETau=BR   ! BR(Y2s->e tau)
   Else 
      BRY3stoETau=BR   ! BR(Y3s->e tau)
   End if
Else                   !mu tau
   If (i2.eq.1) Then
      BRY1stoMuTau=BR  ! BR(Y1s->mu tau) 
   Elseif (i2.eq.2) Then
      BRY2stoMuTau=BR  ! BR(Y2s->mu tau)
   Else 
      BRY3stoMuTau=BR  ! BR(Y3s->mu tau)
   End if
End if


End do
End do
