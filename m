Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC83CFD64B
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 14:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D512E10E61A;
	Wed,  7 Jan 2026 14:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="lUHp1lQa";
	dkim-atps=neutral
Received: from sonic307-1.consmr.mail.bf2.yahoo.com
 (sonic307-1.consmr.mail.bf2.yahoo.com [74.6.134.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522E010E847
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Dec 2025 07:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1767079324; bh=UZoziehOBYBIDO87WpuLbqvjd8/LmHpfO4VLi6ecOiA=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=lUHp1lQaZkMzqr/iOj4QozP3V/5+CFLiZjJMKJMHeUYutbVtDodZ85P2mVXgOF15zeOA2nNuISaGFwbkncgbA4qwWEoPDzSGd8NTyls5Z+fsfz5Wtpy18206k1gaC5fCjEMKbM7xoB0Y3sUh1Zh6wcwU4G2DBEVuL3razmlKkNFlMmIinCWsUe6D0ETFRPo19kbliI1xz2x1ZDwquzVNVdpm1lU7DaDSYEknHWcojfjaytzmrq5eNFqJnrXB5xjJYglU95f2ZRNULCLvwlDEIB+CBdpgBJwf3757lBHQRfF7Kjuc9PBxSDYL4zdFEe90J+rgtKAD4MAtJ+YSGDIfKA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1767079324; bh=OdxxqtlQrtNs1kNHxloUhl4bSGJf8aEY87hsghy+Bkf=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=EMKR1HT+2WaXyHY3MDKesXJb6/sRn8fMlkgOmU8D2T1nI/V+yPYGxjjtAfJWSGaivO111peDVSUdEknUxfmwR0cxIUAo2ttWE5jYPjOM1jHiyW1F1Tjl6O5oFojqCuPOrHXXcjrBzLnsqTUzP6W2j8Y21N5DqPSO9hBpEB1mW3T9htCRxCk+fjlhU9Ft7OXN7q1oMprpfXfpjeVVZo3yjRz05lxoqSwFD0v13XEbB7x4mK2iDeEN2fWyR0H69oHcAfx4yIqYhP/L6RZ3MYGbPf3h74uEg6PnGqlEQJdnyXx2+KJsV2JdjbfThdYOTA7DmBUaqbzPHVoNBSBptRHEYg==
X-YMail-OSG: Ws5q_p8VM1k8LGBLumsuVXpjBBIBL2qlyOd27w_jYOgNyE6h.ONT7JI28ERE8Sh
 bQgwy25KEWjTeOY_u0IhCSyeNM1486JaSw.DVVai3XAtHdEmdvvGNHR8VKxZoI3HrGDtpBbvAU5g
 3JdhO4FI9joPT2OC_Fmsfhwy7FIKCwbGb_EXFwhDygAtQTJNLF_DLh0.o_heV1IoD1vObthhnVWT
 k0fJf3bD6c9bJc2Yft_jIkiQLXh7KaQ1PL2T07HeIdgufoX1DqjLoS.O5KFbb3sEHqQmhWvpOypA
 ffNA5IB9j8FAw9ZIeLLJ8wmfa6PSmVPZzAGuOkAUBGm35UvtIM4_F6DH6uNwtwvqQImJ.ew9zWFw
 gVCTllZGL3drE9can5lORduv97GkRtENfkdmcB3xnSnXWckV6HV6Tg4ePralOUgKx4FeWQZac9.R
 vGXvTnDGabBbaZZF1Ve75rX2._uMlHTU7L9Cfbf0Jj7RH81oQx7SK5T39vayr1aZswP3DexJ_JpZ
 8pCKThRPWETQkqzJUYvt3YmDXj0wXH0tbBWifi40GwKXzisgu_GH0FU3XbnRIAnxINWB1RmZMmRg
 uSlqCr0FoeezPaJzdsHQ.X.BLaDylebjMDOBQ5vqKHWg9wSgyw6kdBB7Es_0Fer0UKdORgrZp13j
 zdX6rQUnM1NWz1DcdkY.2A.ZkG4_3VoN33RXubK4_NgQrxTK1HKfYR9D5jkkDSpAiy7Jf7VZtjnu
 p91aOWitt1t6W22JwpteYHK9kpdYXIXgZqsBr5B_PBPN8E1LDcDmMtWzDuc.to93cy6e8xVdgE75
 YXOpcmS0Msl5csSjqL5m4ymY6ox4wd0uqdDboJhXleWxfQYIYhy7FvKT1t4_fBP7k0NtGmbSzjoS
 KUzgVMgg5rJgKymLKO0yEz3MFuhtMiRBd4nsUvDCKfIoL1oZy8K48fru4IyIlwthORbAg9osCr88
 yaJstn3.Z6pg_CWta8GUilQbLHlAiriwyB1VWjSZKdtRRMfqEBFlJAwfdSWY.72t5qZ3Yq0dXRJ9
 PW78ROVDosGcO.qCVxs7Txm.fCYDI5q2rlEVNWTsCKOSYDG2SSQTVeiqbQ3QvwucZmOs__dCXg0g
 tAdkhhc.r8hxEUNG26Cx0v0OLdZBrhVreznTnEQvCSjTN_eVszbF2Cz.NJV.jcmthlt4tNikbJdX
 CeJoVFofaLgif5kZ.2S5X1HNIZc38dgFwWjaepdv8cq0TgoXRpO1Sc_ER_BnO_75DSw032NmgHlP
 BfN86ZJ_7kmqILIAXUomOar3o9r7np_ImHXbIWaFGaAokCcN4n.0027sB8pobgd6ud_QdQ8Jsxgi
 aqVHC_r2ItNJIFBY531R9ZOPoNr_IVBs2Abep68hYvh48ow.XWdQl4z4GffC4TRoJMNCLs7I.Es4
 oYxytGpb9ShKlmeI.Ld1dzIJ.bnrZNuhmsTNK0DR2YGVHRQtImkzbcgjDcc_0cF9xi2zuNgwcbM2
 oiMG3OfkA7ObTBaYTn6NOeztkwghUrFz7djnaDWPyvQkx7ug0g1eFo4kHN.Q3dMovzKCpvmXW5PH
 fVyZ16zAgEmyoNwHBBrXosiwur3MSyc7ygUS7SiJUjR1sB7ngKloSzZWrslBkd1.W9HhE1iGPHJ.
 X2mDnmOrpw9ssqollVAr.4jquONwgmk2J.I0jR3BbOv3a8CUJoR3W6xkrofanNiq_1wYnoL0Xabh
 i0xZLP.XGduIZBw8vfsC2dGnDPnbk5w3x5qsvMfCN8X3o3socj6b3hKhcSAySk_Alm80ShG1ZT8R
 O9cw3.rE5.oHZ10But9MPoNBqp6qonXyn4FqV64ZUSt2RRrE_iqGR4OZb9mxcHXfMD_eniULQxKK
 9kXkR.sYqsKCA.Z5KsZ2BK_XZn0SP2E_.HHqsDzGrPuUf1ulx6hOx0R8QawBxdfrJ8NugwniKX8P
 oJyGgZdvnTVkNjJKqfnegJ2fn9a8ZupqEfX.oa_nL0gM9jV2RSYWkd4Qgf8EkNW21RQ5QUFpneI3
 jusG.4xN2TsK4fHyoucvL5dbN1yDdhRVo0XAfQHbHMGG1aM.82GvSbF8sWeihFMrsfBmH85G6st3
 QrtLltxZaa0zjs39TFcMgBS19wKGtgyhYKhAcm2TmziODA50EUdpPJK9B84Fus1PlqbVBNSFzUqM
 Qzsq22bp46ZpgZvRa5Pi80h09HZYD0RNlyxMN.WlgXrxOlRn3GcQxZ7VBIcAxHv26Cf4oqKnOSNS
 Sv6wQztp1v9ecx4TYlqos2YCLMef4OSm5ZaTADu3tgw--
X-Sonic-MF: <russomch@aol.com>
X-Sonic-ID: a065007e-60f1-42f0-a06a-04eeb4172ad0
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.bf2.yahoo.com with HTTP; Tue, 30 Dec 2025 07:22:04 +0000
Date: Tue, 30 Dec 2025 07:22:03 +0000 (UTC)
From: Chris <russomch@aol.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 Ping-Ke Shih <pkshih@realtek.com>
Message-ID: <1479901080.2777015.1767079323435@mail.yahoo.com>
In-Reply-To: <32dc6dcfa8a34ded8b8d8669e91e8b47@realtek.com>
References: <AB8446D8-708B-4971-8852-87353112E60F.ref@aol.com>
 <AB8446D8-708B-4971-8852-87353112E60F@aol.com>
 <3dcf5e11aa284daa9d3733141ccdc17f@realtek.com>
 <2033055489.1974567.1766503717295@mail.yahoo.com>
 <dae24a713d354c27ac3814c02822099d@realtek.com>
 <1619250700.2388478.1766812873221@mail.yahoo.com>
 <32dc6dcfa8a34ded8b8d8669e91e8b47@realtek.com>
Subject: Re: [BUG] Intel B580 (e20b) HDMI Flicker & Realtek RTL8922AE 6GHz
 missing - Mint 22.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.24866 AolMailNorrin
X-Mailman-Approved-At: Wed, 07 Jan 2026 14:19:15 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sunday, December 28, 2025 at 07:54:35 PM EST, Ping-Ke Shih <pkshih@realt=
ek.com> wrote:=20




Hi Chris,

Chris <russomch@aol.com> wrote:
> On Tuesday, December 23, 2025 at 09:12:32 PM EST, Ping-Ke Shih <pkshih@re=
altek.com> wrote:
>=20
>=20
>=20
>=20
> Chris <russomch@aol.com> wrote:
> > On Tuesday, December 23, 2025 at 02:48:01 AM EST, Ping-Ke Shih <pkshih@=
realtek.com> wrote:
> >
> >
> >
> >
> > Chris Russomanno <russomch@aol.com> wrote:
> >
> > > Hello,
> > >
> > > I am reporting two issues encountered on brand-new hardware using Lin=
ux Mint 22.3 with Kernel
> > 6.14.0-generic.
> > >
> > > Hardware Environment:
> > > - GPU: Intel Arc B580 (Battlemage), PCI ID: [8086:e20b]
> > > - WiFi: Realtek RTL8922AE (rtw89), Firmware: rtw8922a_fw-3.bin
> > > - Display: Samsung 4K Monitor connected via HDMI (No DisplayPort avai=
lable)
> > >
> > > Issue 1: Intel Xe HDMI Flickering
> > > The Samsung monitor experiences intermittent black-screen flickering =
(1-2 seconds) at both 4K and 1080p
> > > resolutions. This behavior is not present on Windows 11.
> > > Troubleshooting attempted:
> > > - Added kernel parameters: quiet splash i915.enable_psr=3D0 xe.force_=
probe=3De20b i915.enable_dc=3D0
> > > intel_iommu=3Digfx_off intel_idle.max_cstate=3D2
> > > - Forced "TearFree" and "TripleBuffer" in xorg.conf.
> > > - Frequency remains at 60Hz.
> > >
> > > Issue 2: Realtek RTL8922AE 6GHz/WiFi 7 Missing
> > > The card functions on 5GHz (1200 Mb/s) but does not scan or see 6GHz =
frequencies.
> > > Troubleshooting attempted:
> > > - Set regdom to US (iw reg set US).
> > > - Driver options: rtw89_pci disable_aspm=3Dy, rtw89_core disable_6g=
=3DN.
> > > - 'iw list' does not return any 6GHz/6105 MHz frequencies.
> >
> >
> > Please share output of 'iw list' before/after setting US.
> >
> > In my side (expected) frequencies of band 4 are:
> >
> > [Before]
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Frequencies:
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5955.0 MHz [1] (disabled)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5975.0 MHz [5] (disabled)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5995.0 MHz [9] (disabled)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 6015.0 MHz [13] (disabled)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 6035.0 MHz [17] (disabled)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 6055.0 MHz [21] (disabled)
> >
> > [After]
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Frequencies:
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5955.0 MHz [1] (12.0 dBm) (no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5975.0 MHz [5] (12.0 dBm) (no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5995.0 MHz [9] (12.0 dBm) (no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 6015.0 MHz [13] (12.0 dBm) (no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 6035.0 MHz [17] (12.0 dBm) (no IR)
> >
> >
> >
> > ________________________
> >
> >
> >
> >
> > Hello Ping-Ke,
> >
> > Here is the output from my RTL8922AE on Linux Mint 22.3 (Kernel 6.x):
> >
> > [Before iw reg set US]
> >
> > Frequencies:
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5955.0 MHz [1] (12.0 dBm) (no=
 IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5975.0 MHz [5] (12.0 dBm) (no=
 IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5995.0 MHz [9] (12.0 dBm) (no=
 IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6015.0 MHz [13] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6035.0 MHz [17] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6055.0 MHz [21] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6075.0 MHz [25] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6095.0 MHz [29] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6115.0 MHz [33] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6135.0 MHz [37] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6155.0 MHz [41] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6175.0 MHz [45] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6195.0 MHz [49] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6215.0 MHz [53] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6235.0 MHz [57] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6255.0 MHz [61] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6275.0 MHz [65] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6295.0 MHz [69] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6315.0 MHz [73] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6335.0 MHz [77] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6355.0 MHz [81] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6375.0 MHz [85] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6395.0 MHz [89] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6415.0 MHz [93] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6435.0 MHz [97] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6455.0 MHz [101] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6475.0 MHz [105] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6495.0 MHz [109] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6515.0 MHz [113] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6535.0 MHz [117] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6555.0 MHz [121] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6575.0 MHz [125] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6595.0 MHz [129] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6615.0 MHz [133] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6635.0 MHz [137] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6655.0 MHz [141] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6675.0 MHz [145] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6695.0 MHz [149] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6715.0 MHz [153] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6735.0 MHz [157] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6755.0 MHz [161] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6775.0 MHz [165] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6795.0 MHz [169] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6815.0 MHz [173] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6835.0 MHz [177] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6855.0 MHz [181] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6875.0 MHz [185] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6895.0 MHz [189] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6915.0 MHz [193] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6935.0 MHz [197] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6955.0 MHz [201] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6975.0 MHz [205] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6995.0 MHz [209] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7015.0 MHz [213] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7035.0 MHz [217] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7055.0 MHz [221] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7075.0 MHz [225] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7095.0 MHz [229] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7115.0 MHz [233] (12.0 dBm) (=
no IR)
> >
> >
> > [After iw reg set US]
> >
> > Frequencies:
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5955.0 MHz [1] (12.0 dBm) (no=
 IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5975.0 MHz [5] (12.0 dBm) (no=
 IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5995.0 MHz [9] (12.0 dBm) (no=
 IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6015.0 MHz [13] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6035.0 MHz [17] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6055.0 MHz [21] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6075.0 MHz [25] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6095.0 MHz [29] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6115.0 MHz [33] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6135.0 MHz [37] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6155.0 MHz [41] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6175.0 MHz [45] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6195.0 MHz [49] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6215.0 MHz [53] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6235.0 MHz [57] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6255.0 MHz [61] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6275.0 MHz [65] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6295.0 MHz [69] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6315.0 MHz [73] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6335.0 MHz [77] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6355.0 MHz [81] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6375.0 MHz [85] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6395.0 MHz [89] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6415.0 MHz [93] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6435.0 MHz [97] (12.0 dBm) (n=
o IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6455.0 MHz [101] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6475.0 MHz [105] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6495.0 MHz [109] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6515.0 MHz [113] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6535.0 MHz [117] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6555.0 MHz [121] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6575.0 MHz [125] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6595.0 MHz [129] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6615.0 MHz [133] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6635.0 MHz [137] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6655.0 MHz [141] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6675.0 MHz [145] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6695.0 MHz [149] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6715.0 MHz [153] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6735.0 MHz [157] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6755.0 MHz [161] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6775.0 MHz [165] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6795.0 MHz [169] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6815.0 MHz [173] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6835.0 MHz [177] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6855.0 MHz [181] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6875.0 MHz [185] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6895.0 MHz [189] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6915.0 MHz [193] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6935.0 MHz [197] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6955.0 MHz [201] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6975.0 MHz [205] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6995.0 MHz [209] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7015.0 MHz [213] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7035.0 MHz [217] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7055.0 MHz [221] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7075.0 MHz [225] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7095.0 MHz [229] (12.0 dBm) (=
no IR)
> >=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7115.0 MHz [233] (12.0 dBm) (=
no IR)
> >
> >
> > I have tested the iw list command before and after setting the region t=
o US.
> >
> > The Result: The frequencies in Band 4 remain identical. Both "Before" a=
nd "After" already show (no IR)
> for
> > all 6GHz frequencies. There was no change from (disabled) to (no IR), a=
s they were already set to (no
> IR).
> >
> > Even with the status at (no IR), the card is unable to see or connect t=
o my 6GHz SSID, which is confirmed
> > working on other devices and even with Windows 11. It appears the card =
remains in a passive-only state
> > regardless of the regulatory setting.
>=20
> At 6GHz channels, it should be passive scan.
>=20
> With "no IR", I suppose it can find AP operating on 6GHz channels, so let=
's
> clarify scan first. Setup a trace-cmd before doing scan at another termin=
al.
>=20
>=C2=A0 sudo trace-cmd record=C2=A0 -e mac80211 -e cfg80211
>=20
> Then, do scan by
>=20
>=C2=A0 sudo iw wlan1 scan | grep "\(SSID\|freq\):"
>=20
> Stop trace-cmd by ctrl-C, and check report by
>=20
>=C2=A0 trace-cmd report
>=20
> If you can see something like below, AP on 6GHz channels is found:
>=20
>=C2=A0 (trace-cmd report)
>=C2=A0 cfg80211_return_bss:=C2=A0 aa:bb:cc:dd:ee:ff, band: 3, freq: 6135.0=
00
>=20
>=C2=A0 (iw scan result)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 freq: 6135.0
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 SSID: abc_6G
>=20
>=20
> Ping-Ke
>=20
>=20
> __________
>=20
>=20
> Hello Ping-Ke,
>=20
> I have completed the trace-cmd recording and analyzed the full report.
>=20
> A search of the entire report shows zero entries for band: 3 and zero ent=
ries for any frequencies in the
> 6xxx.000 range.
>=20
> The trace successfully captured scanning on Band 1 (5GHz), with many entr=
ies for freq: 5500.000 and 5530.000.
>=20
> The manual iw scan also returned no results for 6GHz.

Can you change the operating channel of AP on PSC channels?
and try more times to see it can be successful.

>=20
> So we know the card appears to be successfully scanning 2.4GHz and 5GHz, =
but is completely silent on 6GHz.
> Even though iw list shows the channels as (no IR), the driver/firmware do=
es not seem to be initiating a
> passive scan on those frequencies.
>=20
> I have the trace.dat file ready if you would like me to provide it.

No need since you have checked the result.=20


To align testing kernel and firmware, I used Ubuntu prebuilt kernel 6.18.1 =
[1]
with firmware 0.35.71.0, which can successfully find AP on 6GHz channels.

Please try this combination to see we can see the same scan results.

[1] https://kernel.ubuntu.com/mainline/v6.18.1/


Ping-Ke



__________


Hi Ping-Ke,

I am reporting a successful resolution for the RTW8922A (WiFi 7) on Linux M=
int 22.3 (Kernel 6.18.1).

After manually updating to firmware v0.35.80.3, the device is now fully ope=
rational.

6GHz connectivity: Fully stable.

Performance: Achieving link speeds of ~1900 Mb/s via WPA3 (although Mint 22=
.3 only shows it as WPA2)

Logs: dmesg is now clean with no RF calibration timeouts or command failure=
s.

Thank you for your work on the driver.=C2=A0 Happy New Year to you and your=
s.

Best regards,

Chris









