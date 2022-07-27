(* ::Package:: *)

(*parameters*)


stdparams={Subscript[k, D]->0.065,Subscript[k, dD]->0.098,Subscript[k, dE]->0.126,Subscript[k, de]->0.34,Subscript[D, D]->60,Subscript[D, E]->60,Subscript[D, d]->0.013,Subscript[D, de]->0.013,\[Lambda]->6,cD->665,cE->410,L->500,h->50}; 


(*variables*)


startval={RandomComplex[{0+.01I,2+1I},8],100+.1I,50+.5I,5+10I}//Flatten;startval={0+.01I,2+1I,10+.5I}//Flatten;


vars=Table[Subscript[u, i],{i,{DD,DT,E,d,de}}]; 


(*volume and surface of slice geometry*)


vol=L h;


surf=L;


(*reaction term (p denotes the bulk-surface coupling term)*)


reactions={Subscript[f, DD]=Subscript[k, de] Subscript[u, de]-p Subscript[u, DD],Subscript[f, DT]=p Subscript[u, DD]-Subscript[u, DT](Subscript[k, D]+Subscript[k, dD] Subscript[u, d]),Subscript[f, E]=Subscript[k, de] Subscript[u, de]-Subscript[k, dE] Subscript[u, E] Subscript[u, d],Subscript[f, d]=Subscript[u, DT](Subscript[k, D]+Subscript[k, dD] Subscript[u, d])-Subscript[k, dE] Subscript[u, E] Subscript[u, d],
Subscript[f, de]=Subscript[k, dE] Subscript[u, E] Subscript[u, d]-Subscript[k, de] Subscript[u, de]};


(*mass conservation*)


constr={vol cD==vol(Subscript[u, DD]+Subscript[u, DT])+surf(Subscript[u, d]+Subscript[u, de]),vol cE==vol Subscript[u, E]+surf Subscript[u, de]};


(*homogeneous steady state*)


stateq=Function[react,Thread[0==react]/.p->Sqrt[Subscript[D, D]\[Lambda]]Tanh[Sqrt[\[Lambda]/Subscript[D, D]]h]];


sol=Function[{react,param},Cases[NSolve[{stateq[react],constr}/.param//Flatten,vars],HoldPattern[{_->_Real?NonNegative,_->_Real?NonNegative,_->_Real?NonNegative,_->_Real?NonNegative,_->_Real?NonNegative}]]];


(*dispersion relation*)


diffsys=Function[q,DiagonalMatrix[{-Subscript[D, D]Sqrt[(\[Sigma]+\[Lambda])/Subscript[D, D]+q^2]Tanh[Sqrt[(\[Sigma]+\[Lambda])/Subscript[D, D]+q^2]h],-Subscript[D, D]Sqrt[\[Sigma]/Subscript[D, D]+q^2]Tanh[Sqrt[\[Sigma]/Subscript[D, D]+q^2]h],-Subscript[D, E]Sqrt[\[Sigma]/Subscript[D, E]+q^2]Tanh[Sqrt[\[Sigma]/Subscript[D, E]+q^2]h],-\[Sigma]-Subscript[D, d]q^2,-\[Sigma]-Subscript[D, de]q^2}]+Normal[SparseArray[{{2,1}->(-Subscript[D, D]Sqrt[\[Sigma]/Subscript[D, D]+q^2]Tanh[Sqrt[\[Sigma]/Subscript[D, D]+q^2]h]+Subscript[D, D]Sqrt[(\[Sigma]+\[Lambda])/Subscript[D, D]+q^2]Tanh[Sqrt[(\[Sigma]+\[Lambda])/Subscript[D, D]+q^2]h])},{5,5}]]];


(*linearize the reaction terms \[Equal] Jacobian!*)


lin=D[reactions,{vars}];


(*the whole linearized system is the sum of lin + diffsys. P must be set equal to 0. The Determinant gives the characteristic equation for the eigenvalues*)


chareq=Det[lin+diffsys[q]]/.p->0;


(*eigenvalues are the roots of the characteristic polynomial*)


eqsol=Function[{param,k},FindRoot[chareq/.param/.#/.q->k,{\[Sigma],startval}]&/@sol[reactions,param]];


Max@Re@((\[Sigma]/.eqsol[{Subscript[k, D]->0.065,Subscript[k, dD]->0.098,Subscript[k, dE]->0.45,Subscript[k, de]->0.5,Subscript[D, D]->60,Subscript[D, E]->60,Subscript[D, d]->0.013,Subscript[D, de]->0.013,\[Lambda]->6,cD->600,cE->400, L->500,h->1},1])[[1]])


\[Sigma]/.eqsol[{Subscript[k, D]->0.065,Subscript[k, dD]->0.098,Subscript[k, dE]->0.45,Subscript[k, de]->0.5,Subscript[D, D]->60,Subscript[D, E]->60,Subscript[D, d]->0.013,Subscript[D, de]->0.013,\[Lambda]->6,cD->600,cE->400, L->500,h->1},1]
