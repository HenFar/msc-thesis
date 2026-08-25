THIS DOCUMENT IS A COMPILATION OF ALL REVIEWS TO THE THESIS TEXT, PROF PIRES 
SENT IN FULL.

Chapter 1 - Introduction:
"High-energy collider experiments have, in recent years, provided ever-increasing precision in measurements of processes governed by the strong interaction."
=> Que collider experiments estás a referir? Acrescenta mais contexto, por exemplo:
High-energy collider experiments, such as those studying proton-proton collisions at the Large Hadron Collider (LHC) at CERN, have in recent years provided ever-increasing precision in measurements of processes governed by the strong interaction.
To fully exploit these measurements, theoretical predictions must achieve comparable levels of precision. At high energy scales, the strong coupling constant α​s becomes sufficiently small for QCD predictions to be organised as a perturbative expansion in 
powers of αs.


"Achieving higher orders of perturbation is not simply a matter of calculating additional Feynman diagrams." -> Obtaining higher-order perturbative predictions is not simple a matter…

"or collinear (in trajectory) partons" -> remove trajectory (trajectória não é uma boa descrição de colinear).

"These individual contributions are divergent and must be arranged before they can be evaluated reliably," -> o que significa must be arranged? Como está escritoire fica vago. Sugiro o seguinte:  
->
These individual contributions are divergent, and their infrared singularities must be extracted and cancelled before numerical integration can be performed. For infrared-safe observables, such as the hadronic R-ratio, the singularities cancel between the real and virtual contributions, leaving a finite physical result.

"The antenna subtraction formalism provides the framework for this rearrangement."
->
The antenna subtraction formalism provides a framework for extracting and cancelling these infrared singularities, rendering the individual contributions suitable for numerical integration.


"Their systematic construction and integration are therefore central ingredients in higher-order QCD calculations." ; central ingredients não é a palavra certa. Outras pessoas usam outros métodos e não precisam de antenas por exemplo. Sugiro reescreveres
->
Their systematic construction and integration are therefore central to higher-order QCD calculations within the antenna subtraction framework.

"The resulting implementation is tested both through the calculation of the NNLO massless hadronic R-ratio" -> sugiro definires já o que é o R-ratio e R-ratio pode ficar melhor com o R-ratio em itálico:
->
The resulting implementation is tested globally through the calculation of the NNLO massless hadronic R-ratio, a well-known inclusive observable in e+e- annihilation that provides a benchmark for the complete implementation. 
Locally, individual antenna functions are tested, where appropriate, by verifying that they reproduce the expected eikonal factors and Altarelli-Parisi (AP) splitting functions in the relevant unresolved limits.


"The remainder of the text is organised as follows."
-> sugiro melhores a descrição da estrutura da tese:  (ainda não definiste a notação que explica o que é A21, B40, A30. O que são T-objects ? Isso ainda não foi definido em lado nenhum, o revisor que está a ler a tese não faz ideia do que são. 

The remainder of the thesis is organised as follows. Chapter 2 introduces the theoretical foundations required throughout this work, including perturbative QCD, infrared singularities, dimensional regularisation, and the antenna subtraction formalism. It defines the massless antenna functions and discusses their colour structure, phase-space factorisation, and role in fixed-order calculations. Chapter 3 describes the AntCalc framework, including its architecture, antenna construction and integration workflows, reduction procedures, and the conventions and validation tools used to obtain the results. Chapter 4 presents the antenna functions obtained using AntCalc, beginning with the master integrals required for their integration. The A30 antenna is discussed in detail, from its unintegrated construction to its integrated form and the validation of its soft and collinear limits. Selected NLO and NNLO antenna results are then presented more concisely. The chapter concludes with an exploratory extension of the A30 antenna to the massive case. Chapter 5 provides a global validation of the framework through the calculation of the massless hadronic R-ratio through NNLO. The relevant antenna contributions are combined, demonstrating the cancellation of infrared poles and agreement with the known finite result.

Em relação ao capítulo 2 estou a deparar-me com algo que tínhamos falado na ultima reunião.
No global acho que o capítulo está muito extenso e demasiado técnico. Em algumas partes simplificaste demasiado a discussão o que leva a que o texto perca algum rigor. Noutras vezes como vou indicar mais a baixo acontece o contrário: as formulas tem indicies a mais e o texto fica confuso. O objectivo e a motivação do trabalho começam a ficar diluídos e não totalmente perceptíveis para o avaliador que vai ler a tese. Parece que estás a tentar explicar todos os detalhes tecnicos com demasiado detalhe e assim o texto fica longo de mais. Devias simplificar bastante este capítulo. Por exemplo criar tabelas, ou listas ou figuras que ajudam a perceber quantos tipos de antenna existem, etc.  Em baixo seguem algumas sugestões de revisão:


Secção 2.1.1:
Por exemplo aqui neste secção tentaste ser mais sintético (o que é bom) e apresentas apenas o Lagrangiano “clássico” da QCD. Mas esta parte do Lagraniano é a base de tudo o que fazes na tese. Como sabes no procedimento de quantização da QCD tens que acrescentar o Lagrangiano de gauge-fixing, e já agora devias referir que gauge vais usar na tese para os gluões.

Apenas escreveste a frase, "After gauge fixing, it supplies the gluon propagator." Não descreveste a parte de gauge fixing. No caso de usares a gauge de feynman para definires o propagador é necessário ainda adicionar à QCD um Lagrangiano para os ghosts para obteres o resultado final correcto para gluões só com polarização transversa que é o caso. Queres tentar modificar esta parte com esse esclarecimento? Verifiquei agora que colocaste uma footnote. Tens que ver se será suficiente para o examinador da tese ou se ele pode questionar esta parte do trabalho. De resto não alterava aqui muito do que já tens que está bom e o texto está claro e bem escrito.


Secção 2.1.2:
Pagina 10:
"The interaction terms in L𝑞 and L𝑔 generate Feynman rules which we can use to compute process amplitudes" -> Sugiro reescreveres:
The interaction terms in L𝑞 and L𝑔  determine the interaction vertices of QCD, which, together with the corresponding propagators, form the Feynman rules used to compute scattering amplitudes perturbatively. Feynman diagrams provide a graphical representation of the individual contributions to the perturbative expansion of an amplitude. At a given perturbative order, the complete amplitude is obtained by summing over all contributing diagrams.
Equação (2.9) o que são os símbolos D e D’ debaixo do sumatório? Tens que dizer o que representam.


Secção 2.2.1:
Eu começaria esta secção a definir o que é correção real e correção virtual:
Beyond leading order in perturbation theory, QCD predictions receive contributions from both real and virtual corrections. Real corrections correspond to processes involving additional parton emission in the final state, while virtual corrections arise from loop contributions to the amplitude. Both are required at a given perturbative order and can develop infrared singularities, which must ultimately cancel in infrared-safe physical observables.

Depois tens aqui uma ligeira inconsistência na discussão dos limites soft e collinear:
Se a amplitude por causa do propagador depende de 1/P^2; Então a amplitude ao quadrado deve depender em 1/P^4; E por causa disto tu escreveste 1/s_ij^2 -> infinity . Faz sentido.
Mas, na verdade, a factorização completa nestes limites derivada formalmente e com mais rigor (como fazes mais tardes nos testes do factor eikonal e das  AP spliting functions) envolve também a estrutura do numerador e do spin logo, por exemplo o termo mais divergente no limite collinear começa em 1/s_ij não 1/sij_^2 como tu escreveste. Também devias esclarecer que o soft limit no caso de ser um quark não causa nenhuma divergência, só no caso de ser um gluão soft (pelo menos até NLO. A NNLO podes ter um par quark anti-quark que são soft ao mesmo tempo e isso já gera uma divergência). Se calhar tens que rever aqui esta descrição, mais uma vez, para prevenir que o revisor da tese implique com esta descrição e acrescentar estes esclarecimentos de forma sintética.

Na foonote 2 esqueceste de escrever o que p_k^2 é. Sugiro colocares: but as p_k^2=0 for any 𝑘, in the massless regime, then the Mandelstam invariant reduces to s_ij= 2 p_i. p_j ;

Seguidamente:
A intuição para a descrição do cancelamento das singularidades está correcta, mas ainda assim aqui ficou simplista.
"Note here that in terms of detection, a real emission that is either soft or collinear is experimentally indistinguishable from the corresponding 𝑛-particle…" Sugiro alterares toda esta parte para,
->
From an experimental point of view, a real emission that becomes soft or collinear may be unresolved, meaning that it cannot be distinguished from a configuration in which that emission is absent. For an infrared-safe observable, the two configurations yield the same value of the observable in the corresponding limit.
The virtual corrections contain infrared singularities related to those arising from unresolved real radiation. According to the Kinoshita–Lee–Nauenberg (KLN) theorem (Adiciona a referência bibliográfica aqui também), these singularities cancel when all degenerate contributions to an infrared-safe physical observable are appropriately combined [3,4]. The resulting observable is therefore finite, despite the presence of infrared divergences in the individual real and virtual contributions.

In practice, this cancellation cannot be performed directly at the integrand level because the real and virtual contributions are separately divergent and are defined on phase spaces with different particle multiplicities. At NLO, the real contribution contains one additional final-state parton and is integrated over the ((n+1))-particle phase space, whereas the virtual contribution is integrated over the (n)-particle phase space. A subtraction method resolves this mismatch by introducing a local counterterm (d\sigma^S) that reproduces the singular behaviour of the real contribution (d\sigma^R) in all unresolved limits. The counterterm can then be subtracted from the real contribution, rendering their difference finite and suitable for numerical integration. The same counterterm is analytically integrated over the unresolved one-particle phase space and added to the virtual contribution, where its explicit infrared poles cancel those of the virtual correction. Schematically, at NLO, … (equação (2.11)) (esta equação é só para NLO).

Tenta acrescentar aqui uma parte da motivação do trabalho da tese:
At NNLO, the same principle applies, but additional real and virtual contributions and configurations with up to two unresolved partons make the subtraction structure more involved. The antenna subtraction formalism, described later in this chapter, provides a systematic construction of the required local counterterms (d\sigma^S) in terms of antenna functions, which capture the unresolved radiation between pairs of hard colour-connected partons. A central objective of this thesis is the construction of quark–antiquark antenna functions entering the subtraction terms at NLO and NNLO, both in their unintegrated form, required for local subtraction of real-radiation singularities, and in their analytically integrated form over the unresolved phase space, required for the cancellation of infrared poles against the corresponding virtual contributions. These ingredients are necessary for the calculation of finite differential cross sections at NLO and NNLO.



Seção 2.2.2:
A descrição onde dizes que "The soft and collinear limits on 𝑙 behave exactly as described above for the outgoing momenta”, não é verdade. Simplifica aqui esta introdução, por exemplo:

Infrared divergences are not the only divergences encountered in perturbative QCD. In loop diagrams, the loop momentum l is integrated over all momentum space. Regions in which the loop momentum becomes soft or collinear to an external massless momentum can give rise to infrared singularities, which contribute to the singular structure of dσV. In addition, loop integrals may become divergent when the magnitude of the loop momentum becomes arbitrarily large, | L | →∞. These divergences are referred to as ultraviolet (UV) divergences.


“This limit presents two distinct but pressing problems. Firstly, the unbounded domain risks the integral diverging. This is due to, in 𝑑-dimensions, the loop measure expanding to” -> sugiro alterar para:
The UV behaviour of a loop integral can be understood through simple power counting. In (d) dimensions, the loop integration measure can be written in spherical coordinates as (equação 2.12).

“Secondly, this limit tells us that any perturbative series “ -> também podes reescrever esta parte de uma forma mais clara:
The presence of UV divergences means that loop corrections expressed in terms of the bare parameters of the QCD Lagrangian are not finite. These divergences are removed through renormalisation, in which the bare parameters are related to finite renormalised quantities. In particular, the bare strong coupling (\alpha_s^0) is replaced by a renormalised coupling (\alpha_s(\mu)), defined at a renormalisation scale (\mu). Perturbative predictions can then be expressed as an expansion in the renormalised coupling. Podes até acrescentar que vais para o caso explicito das antenas que pretendes calcular discutir a renormalização mais à frente na tese. (Por exemplo para o caso da antenna A31hat.)


Secção 2.3:
Podes tornar mais clara a discussão do uso da regularização dimensional. Por exemplo o primeiro paragrafo:

The subtraction procedure introduced in Eq. (2.11) separates the NLO cross-section into contributions that can ultimately be evaluated numerically. The difference dσR−dσS is finite in the unresolved regions and can therefore be integrated numerically in four dimensions. However, the subtraction term dσS must also be integrated analytically over the unresolved one-parton phase space, while the virtual contribution contains infrared divergences originating from the loop integration. These divergent contributions are regulated using dimensional regularisation, in which the number of space-time dimensions is continued from four to d=4−2ϵ. Infrared divergences then appear as explicit poles in ϵ. After analytic integration over the unresolved phase space, ∫_1dσS produces poles that cancel the infrared poles of the UV-renormalised virtual contribution dσV according to the KLN theorem.
The combination int_n [dσV +∫1 dσS] is therefore finite as ϵ→0, allowing the remaining phase-space integration to be performed numerically in four dimensions.



Seguidamente falas em métodos de regularização dimensional. Devias alterar para esquemas de regularização dimensional. É a terminologia mais correcta:
Although the underlying principle is the same, dimensional regularisation can be implemented using different schemes. Common choices include the ’t Hooft–Veltman (HV) scheme [7], the Four-Dimensional Helicity (FDH) scheme [8], and Conventional Dimensional Regularisation (CDR) [1]. In this work, CDR is adopted throughout to ensure consistency with the antenna subtraction framework of Ref. [9], on which the AntCalc implementation is based.
Também podes ser mais específico e dizer em que consiste o esquema CDR:
In CDR, all momenta and polarization states are treated in d=4−2ϵ dimensions.



O parágrafo seguinte está confuso pois está ao mesmo tempo a misturar CDR com o esquema de renormalização MSbar com a normalização que é escolhida para ser aplicada às antenas integradas. Artefactos geometricos a contaminar resultados também não é um terminologia clara e adequada. Sugiro reescreveres:
The use of dimensional regularisation introduces characteristic factors arising from integration in (d=4-2\epsilon) dimensions, including powers of (4\pi), Euler’s constant (\gamma_E), and Gamma functions. These factors are a consequence of performing the angular and radial integrations away from four dimensions and depend on the conventions adopted for dimensional regularisation. To express the integrated antennae in the (MSbar)-compatible convention used throughout this work, the raw (d)-dimensional integrals are multiplied by the normalization factor
[
S_\epsilon=(4\pi)^{-\epsilon}e^{\epsilon\gamma_E}.
]
This convention removes the ubiquitous (4\pi) and (\gamma_E) factors associated with dimensional integration from the coefficients of the perturbative expansion and ensures consistency with the conventions adopted in the antenna framework used here.


A separate normalization arises from the convention used to express the perturbative expansion in the strong coupling. Following the convention adopted in this work, the expansion is written in powers of (alpha_s/(2pi)). Since
[g_s^2=4\pi\alpha_s =8\pi^2\left(\frac{\alpha_s}{2\pi}\right),]
each power of (g_s^2) introduces an accompanying factor of (8\pi^2). It is therefore convenient to define the coupling normalization factor
[
G_k=(8\pi^2)^k,
]
where (k) counts the corresponding powers of (g_s^2) that are factored from the antenna contribution. For an antenna function with (n) final-state partons and (l) loops, the convention used here gives
[
k=(n-2)+l.
]
The normalization can consequently be separated into multiplicity- and loop-dependent factors,
[
G_k=(8\pi^2)^{n-2}\Lambda_l,
\qquad
\Lambda_l\equiv(8\pi^2)^l,
]
where (\Lambda_l) denotes the normalization factor associated with the loop order.
Combining the dimensional-regularisation and coupling normalization factors, we define
C(epsilon,k)=(8\pi^2)^k(4\pi)^{-\epsilon}e^{\epsilon\gamma_E}.´
]
where k denotes the perturbative order of the antenna relative to the two-parton Born configuration, with k=1 at NLO, k=2 at NNLO, and so on.  This combined factor defines the normalization convention applied to the integrated antennae throughout this work and ensures consistency between the AntCalc implementation and the antenna conventions on which it is based.


Seguidamente mudas de assunto bruscamente para o espaço de fases. Escreveste: Since multi-particle phase spaces recursively factorise, we must also normalise our phase-space integral by the 𝑑-dimensional two-body phase space volume Φ2
Para o avaliador da tese não é de todo claro porque motivo tens que normalisar o integral do espaço de fases por Phi_2 ?? Da maneira que escreveste a frase o examinador vai-te pedir imediatamente para justificares essa normalização. Ou fazes a demostração matematica aqui para justificar essa normalização ou então não devias começar a frase assim. Sugiro pores:

In the antenna subtraction formalism, the integrated antenna functions are conventionally normalised to the d-dimensional two-particle phase-space volume Φ_2. Combining this phase-space normalization with the factors introduced above, we define the overall normalization used throughout this work as,
(equação 2.20).

Depois introduz finalmente a renormalização que vais aplicar:
Having established the dimensional-regularisation and normalization conventions, we now return to the ultraviolet divergences discussed in Subsection 2.2.2. The bare strong coupling αs0 appearing in the QCD Lagrangian is related to the finite renormalised coupling αs​(μ) through coupling renormalisation. In the MSbar  scheme, and following the conventions adopted above, this relation is written as (2.21)

Here, μ0  is the mass scale introduced in dimensional regularisation to keep the coupling constant dimensionless away from four dimensions, while μ is the renormalisation scale associated with αs​(μ). The coefficient β0 (adiciona referencias bibliograficas) is the leading coefficient of the QCD beta function and governs the leading dependence of the renormalised strong coupling on μ. For QCD, N=3, denotes the number of colors, while Nf denotes the number of active quark flavours. In practical calculations, μ is commonly chosen to be of the order of the characteristic hard scale of the process, although physical predictions are independent of this arbitrary scale when evaluated to all perturbative orders.


Secção 2.4:
A seção 2.4 está demasiado confusa. Está a tentar ser genérico de mais e as formula estão cheias de indicies e vai ser muito difícil para o avaliador da tese conseguir seguir o texto (atenção isso é um dos parâmetros para a nota final. Neste caso pode puxar a nota para baixo, mesmo que os resultados estejam muito bons (e estão) e a apresentação da defesa corra muito bem.) Por exemplo a equação (2.27) está cheia de símbolos. Tens 3 footnotes na mesma página?? Não haverá maneira mais fácil de descrever esta parte do trabalho?
Vê por exemplo o artigo referência hep-ph/0505111 . Explica a subtração das antenas a NLO em poucas páginas na secção 2.1. usando a Figura 3 como ilustração. Podes tentar basear-te no que aqui está. No mesmo artigo a secção 3 tem a notação e estrutra das antennas estabelecida em poucas páginas. Por exemplo na tabela 1 do mesmo artigo estão organizadas de forma compacta e clara todos os tipos de antenna que existem com a letra respectiva, A,B,C,D e com as partículas que as definem q,g,qb ; q,qb,q,qb; etc… Tenta ver se consegues basear no que aqui está para simplificar a escrita da secções 2.4, 2.4.1 e 2.4.2.  

Ok, como te disse ontem, a secção 2.4 precisa de ser reescrita pois está confusa, precisa de mais rigor em algumas partes e a ordem das secções também não me parece melhor.

Por exemplo,

A secção 2.4.5 é a que talvez devesse aparecer primeiro. Depois tens muitas equações com o sinal de proportional (por exemplo 2.44; 2.42). Porque não colocas as expressões exactas? Não aparece uma equação geral que define o termo de subtracação dsigma^S. Se aparecer algures essa equação podes explicar logo porque é que a NLO só tens antennas do tipo X_3^0. Se mostrares a equação equivalente para dsigma^S a NNLO podes logo explicar no texto porque precisas de antenas do tipo X_4^0 e X_3^1, de uma forma mais simples e clara. Também não falas dos mappings, que é um ingrediente essencial para que a subtração funcione em todo o espaço de fases, e não só nas regiões singular e colinear. 

Em relação aos T-objects quem está a ler a tese não percebe porque falas em T-objects nesta parte da tese. Se isso é util para apresentar o calculo do R-ratio move toda essa discussão para o capitulo do R-ratio. Fica muito melhor assim do que aparecer aqui neste capitulo introdutório que precisa de ser substancialmente reduzido. 

Secção 2.5:
Rescrever os dois primeiros parágrafos de forma mais clara. Sugiro:

In the previous sections, antenna functions were introduced together with their role in the local subtraction of infrared singularities. Equation (2.45) defined their integration over the unresolved phase space, leading from an unintegrated antenna X_n^l to its integrated counterpart calX_n^l. For loop-level antennae (l≥1), the loop momenta must additionally be integrated.

Both the unintegrated and integrated forms are required in a subtraction calculation, but they play different roles. The unintegrated antenna functions provide local counterterms for real-radiation matrix elements and are therefore required in numerical Monte Carlo phase-space integration. They must retain the dependence on the local kinematics of each phase-space point, which can be expressed in terms of Mandlestam invariants s_ij.
This allows the subtraction term to reproduce the singular behaviour of the real-emission matrix element point by point in the unresolved limits. For loop-level antennae, the term “unintegrated” refers here to the unresolved phase space: the loop-momentum integration is first performed analytically, leaving an antenna function that depends on the external kinematic invariants and can be evaluated locally within the phase-space integration. The subsequent analytic integration over the unresolved phase space then produces the corresponding integrated antenna function, whose explicit infrared poles enter the cancellation against virtual contributions.

Na Equação (2.54) tenta resolver o seguinte:
- tens o sinal de proporcional em vez de dares a equação exacta
- no parágrafo anterior dizes que a antena depende em s_ij, mas na equação colocas momento p_a. Alguma coisa não está coerente e tens que reescrever/explicar ou no parágrafo anterior ou a equação conforme de ter mais jeito.

=> Seria util para a fluidez do texto como vou indicar mais em baixo trazeres a equação (2.60) para perto desta equação (2.54). Já que falas aqui em denominators D_j e no espaço de fases. Podes logo aqui esclarecer como vais tratar as particulas reais externas no processo de integração das antennas.

“and the set 𝑝𝑎 consists of a fixed mapped hard-radiator momenta” -> “and the set 𝑝𝑎 consists of hard-radiator momenta” uma vez que não está fixed nem mapped.
“, the latter of which are integrated through Φ𝑋” -> “which are integrated over Φ𝑋” . A integração sobre o espaço de fases é o integral sobre os momentos hard e o momentum unresolved. Em várias partes desta secção dizes que o hard-radiator momenta está fixed. Não está certo tens que corrigir.
“𝐷𝑗 are propagator or invariant denominators” -> “𝐷𝑗 are propagator or Mandelstam invariants s_ij’s.

“An algebraic expansion of the integrand of a single amplitude can generate multiple integrals with the same kinematic structure but different numerator and denominator powers.” (Substituir amplitude por antena fica melhor)
-> “An algebraic expansion of the integrand of an antenna function can generate multiple integrals with the same kinematic structure but different numerator and denominator powers. “

Debaixo de (2.56) sugiro reescrever de forma mais clara:

"To reduce these families’ terms, denoted as 𝐼’shere, is to write them in terms of a finite basis as,"
->
The integrals within each family are not independent. Through integral reduction, they can be expressed in terms of a finite and substantially smaller set of master integrals,
(eq 2.57).
where Mk are the master integrals and ck are coefficients that depend on the integral indices, the dimensional regulator ϵ, and the relevant kinematic invariants. The original integration problem is therefore separated into two tasks:
determining the reduction coefficients ck and evaluating the much smaller set of master integrals Mk. Once these are known, every required integral in the family can be reconstructed from the same master-integral basis.

Remove a footnote 17.

Acho que o texto aqui está bom porque estás a preparar a escrita para discutir a redução IBP que é extremamente importante para o core do trabalho.
No entanto, o parágrafo seguinte muda para redução Passarino-Veltman e depois aparece uma secção inteira a discuti-la com o exemplo mais simples da Bolha de rank1. Acho que aparecer isto aqui estraga a fluidez do texto. Sugiro mover totalmente a parte de redução Passarino Veltman para o apêndice. Para que precisas dela? Só para calcular as antenas X_3^1 não integradas. Então na parte do texto onde vais discutir o calculo da antena X_3^1 não integrada (por exemplo na nova secção 2.4 por reescrever), podes dizer aí que usaste redução Passarino-Veltman para as obter e referes a discussão disso para o apêndice.  Assim depois da equação (2.57) podes continuar para o paragrafo que diz: To finally reach the integrated antenna functions X𝑙
𝑛 we do require integrating over the phase-space e secção 2.5.1 desaparece completamente para o apêndice. Mais uma vez isto vai-te beneficiar porque reduz bastante o tamanho do capitulo 2.

Sugiro remover a secção 2.6 ou muda-la para o apêndice para não tornar a discussão do capitulo 2 demasiado extensa.
No fim do capítulo falta algo importante. Descreveste os master integrals a redução com IBP, mas onde está a ligação disso tudo ao trabalho da tese? Tens que acrescentar algo que ligue este capitulo aos restantes capítulos da tese para o examinador conseguir seguir o texto. Por exemplo acrescentar,

The reduction techniques introduced in this chapter provide the computational tools required for the analytic integration of the antenna functions considered in this work. In particular, the IBP identities are systematically solved through the Laporta algorithm, reducing the phase-space and loop integrals to a finite set of master integrals. As described in Chapter 3, this reduction procedure is implemented within the AntCalc workflow and is subsequently applied in Chapter 4 to obtain the integrated antenna functions in dimensional regularisation. The resulting Laurent expansions in ϵ provide the explicit infrared pole structure required for their use in higher-order subtraction at NLO and NNLO.
