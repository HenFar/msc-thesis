"""Independent checks for Appendix C (Section 'Massive Integrals of the A_3^{0,(m_q)} Antenna').

1. Derives I_1, I_2 from the massive three-particle phase space (u, c parametrisation) and
   compares them with the closed forms of Ref. [GehrmannDeRidder:2009fz].
2. Checks the LiteRed2 basis change I_2 = a J_1 + b J_2, with J_2 = -d/dm_1^2 J_1(m_1, m_q).
3. Checks the q^2 exponent of the four-particle phase space against P_4 of hep-ph/0311276 (d = 4).
Units: q^2 = 1. Requires mpmath and numpy.
"""
from mpmath import mp, mpf, gamma, pi, hyp2f1, quad, sqrt, beta, diff
import numpy as np, math
mp.dps = 25

def Om(n): return 2*pi**(n/2)/gamma(n/2)

def I_closed(r, eps, k):
    if k == 1:
        return r**(2-2*eps)*2**(-2*eps)*pi**(-2+eps)*gamma(2-2*eps)*gamma(3-3*eps)/gamma(6-6*eps)*hyp2f1(mpf(1)/2, 2-2*eps, mpf(7)/2-3*eps, r)
    return r**(3-2*eps)*2**(1-2*eps)*pi**(-2+eps)*gamma(3-2*eps)*gamma(4-3*eps)/gamma(8-6*eps)*hyp2f1(mpf(1)/2, 3-2*eps, mpf(9)/2-3*eps, r)

def prefactors(eps, r):
    d = 4-2*eps
    pre3 = (2*pi)**(3-2*d)*2**(-1-d)*Om(d-1)*Om(d-2)
    phi2 = (2*pi)**(2-d)*Om(d-1)*2**(1-d)*r**((d-3)/2)
    return pre3, phi2

def I_derived(r, eps, k):
    pre3, phi2 = prefactors(eps, r)
    Cc = sqrt(pi)*gamma(1-eps)/gamma(mpf(3)/2-eps)
    a = 1-2*eps if k == 1 else 2-2*eps
    U = quad(lambda u: u**a*(r-u)**(mpf(1)/2-eps)*(1-u)**(-mpf(1)/2), [0, r])
    w = 1 if k == 1 else mpf(1)/2
    return pre3*mpf(1)/2*4**eps*Cc*U*w/phi2

def J1_unequal(m1s, m2s, eps, mref):
    pre3, phi2 = prefactors(eps, 1-4*mref)
    Q = 1-m1s-m2s
    def inner(y):
        A = y+m2s; B = y*(Q-y); C = m1s*y*y
        disc = B*B-4*A*C
        if disc <= 0: return mpf(0)
        return A**(-eps)*(sqrt(disc)/A)**(1-2*eps)*beta(1-eps, 1-eps)
    ymax = (1-sqrt(m1s))**2-m2s
    return pre3*quad(inner, [0, ymax/2, ymax])/phi2

if __name__ == "__main__":
    print("1. derived / closed form (I1, I2)")
    for r in [mpf('0.3'), mpf('0.8'), mpf('0.99')]:
        for eps in [mpf(0), mpf('0.13'), mpf('-0.21')]:
            print("  r =", r, "eps =", eps, [mp.nstr(I_derived(r, eps, k)/I_closed(r, eps, k), 15) for k in (1, 2)])
    print("2. basis change (J1/I1, (a J1 + b J2)/I2)")
    for ms in [mpf('0.05'), mpf('0.15')]:
        for eps in [mpf(0), mpf('-0.2')]:
            r = 1-4*ms
            J1 = J1_unequal(ms, ms, eps, ms)
            J2 = -diff(lambda x: J1_unequal(x, ms, eps, ms), ms)
            a = ((1-2*eps)*ms+(1-eps))/(3*(1-eps)); b = ms*(4*ms-1)/(3*(1-eps))
            print("  m^2 =", ms, "eps =", eps, mp.nstr(J1/I_closed(r, eps, 1), 12), mp.nstr((a*J1+b*J2)/I_closed(r, eps, 2), 12))
    print("3. d=4 four-particle measure: simplex integral of (-Delta4)^(-1/2) vs pi/12")
    rng = np.random.default_rng(1); tot = 0; N = 0
    for _ in range(40):
        s = rng.dirichlet(np.ones(6), size=2_000_000)
        x = s[:, 0]*s[:, 5]; y = s[:, 1]*s[:, 4]; z = s[:, 2]*s[:, 3]
        D = x*x+y*y+z*z-2*(x*y+x*z+y*z)
        tot += np.where(D < 0, 1/np.sqrt(np.abs(D)), 0.).sum(); N += len(D)
    print("  MC =", tot/N/120, " pi/12 =", math.pi/12)
