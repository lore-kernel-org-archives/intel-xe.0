Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961FBCFD641
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 14:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB5410E5F9;
	Wed,  7 Jan 2026 14:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="syINP3jC";
	dkim-atps=neutral
Received: from sonic321-26.consmr.mail.bf2.yahoo.com
 (sonic321-26.consmr.mail.bf2.yahoo.com [74.6.133.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E44D10E15A
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 15:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1766503729; bh=LwvYDYaktTk8lXo8IkTorI+EErZp158qmx9KmCPBgCY=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=syINP3jCE6tTrC8UGQsq4XDoCq/re/OMlf9WdEp2P+cDRwI9vunlTZO5iQpra0LGMdi1LBZMlozg7TIwqF5Zke6iEduU2q3f6cFK4EIGv+ooXL8ZaB/A4IxqxLn2pVsmanuHbywNkjabh74zvhMnj5ALncPu0HNlbZUStucV+0p4jYaTdw0F9Z1sjyh7Wy3WcUJU9I8xiJblHxecjH1jAiCIs/nOm6KZ8+6L27YED+B37oZTFEwlVzZVfxCsDwCPafC6dhl7tPy8nbjQzj4d755yaLjQd2Ot5Jubxv02EJkYs7SNPqUgUOLrPFvU4+0GF1c16fHUlvo7yukcg7uDAA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1766503729; bh=Qq4tIwqcZHVkWs5e5HFMDJ3lc7XM1TfnSvv75bm//br=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=KYtWWAZg6H8jw3ESwQRR1ZEMpNsffIDMA1O7a4BE6GGiG7q0i/A2iUtmu0LkfZW3KEZ9N7iJisS6S4dp7iqDpH2ZAHkbpx1hyyuN9Q0ynwkpnOJdKZ5KuzS9kCL8nv1darUQLP9nEqL+8DwdvZK1hzp1T3JX/OvqxKECvirLX0sznTD2cRYQOl7rl0Mt6bTRDWGRYcE0KFH0W/pEyAEO5jFVDc7TRhE5aJuovornzO1grf49li2X42PeljxV2AVb+tQLsOfHp+z0GDsrJbG2/hxCYVK7LLdYWXcsXuLkDtqkBCz1Pw+xMCff/qufSdQ+h+rZ/pPooX7MWzqjrt13MQ==
X-YMail-OSG: 9.bcxMYVM1mKRDRhKZSrbwO3oQuViIto6D8IOa.V0jpA0FH6d8C61o1QQMQ67pe
 QV2yREeuKtRZAWsVF9eF5JVzEIsOyim6yXy8Vwf43VXDFqU_3sNGBrmpSWUilqBFzyJA21Nn_Zab
 9o0GsuTj7LLrw_NaS7YDapQ_ihY2I2DV3VqFWHZaznZiadXxBTwSrWavXV7wsR8Nt6fHEjTRQFdR
 GhWNCm2XmypF10lHcsfbPKTyw7W8lCyFboMdPB2sltSfeYrmDQ6Mcs3fgznhf0IpjVjg1FKdLThv
 XdxDKVizPLLGtO4HXyZwsOUH_.rbyqA9Pn4jM69JFzltKBagPC6HjM52Zbdbwp7dhaMd_BFoFGFt
 EG6tKxE8C3pEyVbVIjhelklurpfeOhUDYdmTxEj4PG76hubT1QKzKohYwGDqfxyY9UzZDT5jr3cI
 QSivmYzzqtTmh7lEzWP8_q2ElGcfrO9mI4MFwhDCEstAAzptvUhM3bBYFq_oZyDvP3L6h2DldR8e
 ovx46nEvr0YN5rnMaB82LokGtTN7hDpzEBk16lA9fQmuan1cTi40amyUu4ciwn0iH8h8su6fDMFl
 MOYLSSs63usceojZ6evrFSFfzWRjJ7OuSsSUsdeZkUVobkcM9qw2MIYClYRbZNbeoWBPQjfd8FmY
 xLaPT8tKOPB2gpAgoTj0krC9n9n4Zsvu54leJScguh6WQKKVvYkj1jf5Qw2DBgpxTxX95JomZxI1
 x2626WOzZkEEdQXwc8JlkeRe8_VEcm4R24B8iIqZJxgsjOarSHCnIZNXAeeNBiM7JPE.hPzRFKuF
 wQAgpNFNzHPvSBMc2u4j61RETcpPlaLUpqWnDypopyonxV11d9M8kBvzF7Ep4o1u_BOvuHhwlQen
 LHfdZCLciWmrd4OCUMgpJpHcG9r9GyKwdNJO1AjC06RAauqomcGwqIoEGA3LM9vS7mxHxKIyH_.4
 JEIKJDkEzwtLs4lifm4W_xR2tc5BygxBz5rIx69RWiqQI4l5laHHesdIXrPaimWMhKl38vfGhfBd
 2arDkncVdC4ud9S.aIAHtw_dmSB_J7CJ5NP3O1MB1zcVLUOP91AktAlMFTXf7TKSZ4SuTiinm7gl
 AEjgJgwKBrVJ5bQyIAhhLyjFdPHl6PVHiDplr3zIGAnWTP.6dCYYRrrb_XW0yg5mmyZDP4AuYmrG
 4VYGDDr18zuKUR_8e.9bQ1sOGB01M_Xfx9kfB77iLWAl2mZImabwcsI0SCyQQuSA5.DyIXNc.q7h
 w07lgJWXLhqSVIogdgBbbt9zGN.eGNnxi.fFMBtHp5vlOPOR_nCSEN1ldCZW60D13ID1N_fJZwai
 xQJ8ooSCc0sBIqaUYg4agSiFdDFJs4sIh7vSp0cdPBfiRs7_McTiaEnunNPs4r9n1Db4iJbRrw32
 JxNAE1VAbniBuMHe4R8IQQKbteTzVS5ed6ADmlkB2w4aJoQMFe1XlRhi3KOXssrvReynkZFSob9S
 6nvj5_Bry2cQTJ1FUgm1ZI7unAa3nItAo.7MCOpqFXDuqTI9G_6MScDgGCaN4jeqCKeAJhgGjQTA
 .xoGRg0gEvZ0uVVGT5KyYVWkWrGGMZmyLy2nDcdnI8MCuaoHiFEOfNfgjXgsGkxzaSxADj_V9V6G
 ckmqX_JaN8nwX952ensVpqF0nZn01uoBayX5yfT9BaoDPL0MT_IE9wxVPmw9qLWutiHWuoxMU0K.
 vaTNF8ZcdqErPl14XkNPME4F7FRlxch7z3xkqffwwbFWKTVD5kVTQ_kXF1nQ2sbyhxH5C5oHBLfP
 H4GNiYxcwihM8XLLJYGvTzKzL71ldzhTNbGBcgGgtaKIqCkpbvUBZAIFSlZfKj2pvr1wuQxQZPFg
 qi41w6x6htlyi2prvdVpTU0km9.cnGXPkPg7c13OZnDBHqHWpzoBX5cCrtkTUtRVZZL4FwW_EkK0
 5JlI9FGBQPVFOy6QOPksOuIIwUWA2KMfgExdoe0iYNeWA6eyoGvmqWT4SPZAvL8Ro6Vg6hrFzXyz
 iGzpWsRh4822YK3CY_uxuoLvYdmLAwh8z_uDDP2i5sBfOyZ8BU4kdUeLXTfsNfzySSPUpoLbCxhV
 JXcSIlFIwZBL_ZLLByrkZUVzhlSlApUR2exAs.thunC9c_pfVcqJPknU1MqC47XBLXxczfagovuI
 Nybwc5ncKdpme0PxpuR3mTkgmViGAu5UCpMbdPsyjgqo7OH0flFjz_aaYwXhbFSl4eq4faZVLuQ1
 XXIHcv7US7a_IVM0ZViFz7qE7e3Iu4dw66tAZQpjtwg--
X-Sonic-MF: <russomch@aol.com>
X-Sonic-ID: 5e079aa0-f50e-42e9-a405-4eea7ac4a35d
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic321.consmr.mail.bf2.yahoo.com with HTTP; Tue, 23 Dec 2025 15:28:49 +0000
Date: Tue, 23 Dec 2025 15:28:37 +0000 (UTC)
From: Chris <russomch@aol.com>
To: Ping-Ke Shih <pkshih@realtek.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Message-ID: <2033055489.1974567.1766503717295@mail.yahoo.com>
In-Reply-To: <3dcf5e11aa284daa9d3733141ccdc17f@realtek.com>
References: <AB8446D8-708B-4971-8852-87353112E60F.ref@aol.com>
 <AB8446D8-708B-4971-8852-87353112E60F@aol.com>
 <3dcf5e11aa284daa9d3733141ccdc17f@realtek.com>
Subject: Re: [BUG] Intel B580 (e20b) HDMI Flicker & Realtek RTL8922AE 6GHz
 missing - Mint 22.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.24866 AolMailNorrin
X-Mailman-Approved-At: Wed, 07 Jan 2026 14:19:14 +0000
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

On Tuesday, December 23, 2025 at 02:48:01 AM EST, Ping-Ke Shih <pkshih@real=
tek.com> wrote:=20




Chris Russomanno <russomch@aol.com> wrote:

> Hello,
>=20
> I am reporting two issues encountered on brand-new hardware using Linux M=
int 22.3 with Kernel 6.14.0-generic.
>=20
> Hardware Environment:
> - GPU: Intel Arc B580 (Battlemage), PCI ID: [8086:e20b]
> - WiFi: Realtek RTL8922AE (rtw89), Firmware: rtw8922a_fw-3.bin
> - Display: Samsung 4K Monitor connected via HDMI (No DisplayPort availabl=
e)
>=20
> Issue 1: Intel Xe HDMI Flickering
> The Samsung monitor experiences intermittent black-screen flickering (1-2=
 seconds) at both 4K and 1080p
> resolutions. This behavior is not present on Windows 11.
> Troubleshooting attempted:
> - Added kernel parameters: quiet splash i915.enable_psr=3D0 xe.force_prob=
e=3De20b i915.enable_dc=3D0
> intel_iommu=3Digfx_off intel_idle.max_cstate=3D2
> - Forced "TearFree" and "TripleBuffer" in xorg.conf.
> - Frequency remains at 60Hz.
>=20
> Issue 2: Realtek RTL8922AE 6GHz/WiFi 7 Missing
> The card functions on 5GHz (1200 Mb/s) but does not scan or see 6GHz freq=
uencies.
> Troubleshooting attempted:
> - Set regdom to US (iw reg set US).
> - Driver options: rtw89_pci disable_aspm=3Dy, rtw89_core disable_6g=3DN.
> - 'iw list' does not return any 6GHz/6105 MHz frequencies.


Please share output of 'iw list' before/after setting US.=20

In my side (expected) frequencies of band 4 are:

[Before]
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Frequencies:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5955.0 MHz [1] (disabled)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5975.0 MHz [5] (disabled)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5995.0 MHz [9] (disabled)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 6015.0 MHz [13] (disabled)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 6035.0 MHz [17] (disabled)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 6055.0 MHz [21] (disabled)

[After]
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Frequencies:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5955.0 MHz [1] (12.0 dBm) (no IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5975.0 MHz [5] (12.0 dBm) (no IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 5995.0 MHz [9] (12.0 dBm) (no IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 6015.0 MHz [13] (12.0 dBm) (no IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 * 6035.0 MHz [17] (12.0 dBm) (no IR)


=C2=A0
________________________




Hello Ping-Ke,

Here is the output from my RTL8922AE on Linux Mint 22.3 (Kernel 6.x):

[Before iw reg set US]=C2=A0

Frequencies:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5955.0 MHz [1] (12.0 dBm) (no I=
R)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5975.0 MHz [5] (12.0 dBm) (no I=
R)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5995.0 MHz [9] (12.0 dBm) (no I=
R)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6015.0 MHz [13] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6035.0 MHz [17] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6055.0 MHz [21] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6075.0 MHz [25] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6095.0 MHz [29] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6115.0 MHz [33] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6135.0 MHz [37] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6155.0 MHz [41] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6175.0 MHz [45] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6195.0 MHz [49] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6215.0 MHz [53] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6235.0 MHz [57] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6255.0 MHz [61] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6275.0 MHz [65] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6295.0 MHz [69] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6315.0 MHz [73] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6335.0 MHz [77] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6355.0 MHz [81] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6375.0 MHz [85] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6395.0 MHz [89] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6415.0 MHz [93] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6435.0 MHz [97] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6455.0 MHz [101] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6475.0 MHz [105] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6495.0 MHz [109] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6515.0 MHz [113] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6535.0 MHz [117] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6555.0 MHz [121] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6575.0 MHz [125] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6595.0 MHz [129] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6615.0 MHz [133] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6635.0 MHz [137] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6655.0 MHz [141] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6675.0 MHz [145] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6695.0 MHz [149] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6715.0 MHz [153] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6735.0 MHz [157] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6755.0 MHz [161] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6775.0 MHz [165] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6795.0 MHz [169] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6815.0 MHz [173] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6835.0 MHz [177] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6855.0 MHz [181] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6875.0 MHz [185] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6895.0 MHz [189] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6915.0 MHz [193] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6935.0 MHz [197] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6955.0 MHz [201] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6975.0 MHz [205] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6995.0 MHz [209] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7015.0 MHz [213] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7035.0 MHz [217] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7055.0 MHz [221] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7075.0 MHz [225] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7095.0 MHz [229] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7115.0 MHz [233] (12.0 dBm) (no=
 IR)


[After iw reg set US]

Frequencies:
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5955.0 MHz [1] (12.0 dBm) (no I=
R)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5975.0 MHz [5] (12.0 dBm) (no I=
R)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 5995.0 MHz [9] (12.0 dBm) (no I=
R)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6015.0 MHz [13] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6035.0 MHz [17] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6055.0 MHz [21] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6075.0 MHz [25] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6095.0 MHz [29] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6115.0 MHz [33] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6135.0 MHz [37] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6155.0 MHz [41] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6175.0 MHz [45] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6195.0 MHz [49] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6215.0 MHz [53] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6235.0 MHz [57] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6255.0 MHz [61] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6275.0 MHz [65] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6295.0 MHz [69] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6315.0 MHz [73] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6335.0 MHz [77] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6355.0 MHz [81] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6375.0 MHz [85] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6395.0 MHz [89] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6415.0 MHz [93] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6435.0 MHz [97] (12.0 dBm) (no =
IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6455.0 MHz [101] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6475.0 MHz [105] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6495.0 MHz [109] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6515.0 MHz [113] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6535.0 MHz [117] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6555.0 MHz [121] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6575.0 MHz [125] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6595.0 MHz [129] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6615.0 MHz [133] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6635.0 MHz [137] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6655.0 MHz [141] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6675.0 MHz [145] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6695.0 MHz [149] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6715.0 MHz [153] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6735.0 MHz [157] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6755.0 MHz [161] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6775.0 MHz [165] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6795.0 MHz [169] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6815.0 MHz [173] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6835.0 MHz [177] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6855.0 MHz [181] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6875.0 MHz [185] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6895.0 MHz [189] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6915.0 MHz [193] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6935.0 MHz [197] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6955.0 MHz [201] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6975.0 MHz [205] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 6995.0 MHz [209] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7015.0 MHz [213] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7035.0 MHz [217] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7055.0 MHz [221] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7075.0 MHz [225] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7095.0 MHz [229] (12.0 dBm) (no=
 IR)
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7115.0 MHz [233] (12.0 dBm) (no=
 IR)


I have tested the iw list command before and after setting the region to US=
.

The Result: The frequencies in Band 4 remain identical. Both "Before" and "=
After" already show (no IR) for all 6GHz frequencies. There was no change f=
rom (disabled) to (no IR), as they were already set to (no IR).

Even with the status at (no IR), the card is unable to see or connect to my=
 6GHz SSID, which is confirmed working on other devices and even with Windo=
ws 11. It appears the card remains in a passive-only state regardless of th=
e regulatory setting.

Please let me know if you need specific dmesg logs or if I should test a sp=
ecific patch.

Thank you for your help!

- Chris
