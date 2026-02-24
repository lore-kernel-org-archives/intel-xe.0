Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31813F3C99B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 15:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E6010E5AE;
	Tue, 24 Feb 2026 15:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="oVE6/5Xw";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="t6nf7Rig";
	dkim-atps=neutral
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFDA10E5AE
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 15:31:14 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.stl.internal (Postfix) with ESMTP id DE7611D00115;
 Tue, 24 Feb 2026 10:31:13 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Tue, 24 Feb 2026 10:31:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1771947073;
 x=1772033473; bh=lKRkqd72j0u5hpzvO3/RwcP4EA2Ot8NNWLi4+dgfm6A=; b=
 oVE6/5Xwe5jNM8GPeWL6Kdoq7dqLzVIdBK8gxe1TG/Cak6kQfI/KsxhXIQ3k1hkC
 7oYgRLq/qVIzoBKyKcPTRR7u/FEmTVyk1m1Kvv9M4NOL1zQKk+gXY2FxquWFtbkb
 816fpnfPYltnTcnFOzavB8kdYpf0XjGhHGLBi3L59OYOtG+pzN0WVNx2BKxJydr2
 4F4owH+ZJgf9oKEdSfpHLfrbslANMJFVY3AltWpiM7RPXzwU3nqpCNAR5me47Ivc
 Ozjyeh7I7q6lQ8Mrt356tSxIWYXaRwZwyhWb5TrfEiUWFdebreausDozLyVZEsro
 aRs1MH9/7PaSR+ztsYsIpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1771947073; x=1772033473; bh=lKRkqd72j0u5hpzvO3/RwcP4EA2Ot8NNWLi
 4+dgfm6A=; b=t6nf7Righ/qRfsAMjNNlJGXsqFpzfZv+3Gtdc605yaclLYrzJyx
 Bduswn8ipx2XP2R6F0v/34T0QIBwXJ2BRpQ2Lr6cfDwAiL77a0uvg9DDDSPZSSlO
 d18XJyatU1GwejGtBhmv78Bt9+OxM8z8DYnowUDsl4AoY6JI7r9hl+9FTRh6xfC6
 PPvOwYGkTRoQ8F22tpBPNpyy6xo+g6gfTaBbQ8Ifh75nIo3yzelIZ8C01qx3krY5
 yzQAaqJw1Gwm+3mCjG5fRQsEQho1E04gQek9nBzgsmfyARrVcYO1tIm4r+57eqWf
 4mDbyXQwnGpFqHhSxIH/OhjKm22sg7H8rTQ==
X-ME-Sender: <xms:QcSdadl5eIIQyFKkMomFMhZ2tLRkYlSjRSrKpZoSUECrub2zJJAozw>
 <xme:QcSdaWrl8CXG5C0HysU0-8PGFkArd4evE-iuFGs4xrbrPbqlqOHsCExc6ANkwYUDg
 0h83q6RgQjnc5vzKthcXzD8g0YlqNdvs0z57w0PSR5jPUn_VQ>
X-ME-Received: <xmr:QcSdaeEfqKz0_zuDY8XtXvdPrg5CUr4SQioaGcVS6FRYV6iRNeRUvX7KFP4p3mf3oLF82OYgolKDHPBLJy__ZJ-VOC61z0xpYvU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedtheefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
 feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
 nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
 houggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvmhhiohgsvghnohhurhesghhmrghi
 lhdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprh
 gtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhr
 ghdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggvshhkthhoph
 drohhrgh
X-ME-Proxy: <xmx:QcSdaawGPGD10mkm8wjsnc0O6am0DqaJ3w4DYx2i424Znjrjc6onjw>
 <xmx:QcSdabpyCL4UwwqjaMnxxDzA_4XYOnkA0lpHcrMKuTZQ4Fgm389nOQ>
 <xmx:QcSdacjbUKshq0O37aWG_yFxkXHduLVfOul0SDeGFidGP4FlPe4C0w>
 <xmx:QcSdaQjXVUa19R39aTFcNlhal6X3NwsnWGZ1cSaHD6EBsVKSpb7vEQ>
 <xmx:QcSdadWzjAt3Mi_yT-Bns2wXYky6v8b99gL8ZD2aonCZg04bxhunkgT->
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 10:31:12 -0500 (EST)
Date: Tue, 24 Feb 2026 16:31:10 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aZ3EPnJD_KunoQh-@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl> <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY58-gyarcVoBS2a@mail-itl>
 <a41a15ca-b26e-482a-9084-fc61645fb24e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Hjkw3E9BoIh06IIo"
Content-Disposition: inline
In-Reply-To: <a41a15ca-b26e-482a-9084-fc61645fb24e@gmail.com>
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


--Hjkw3E9BoIh06IIo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Feb 2026 16:31:10 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Fri, Feb 13, 2026 at 12:31:47AM -0500, Demi Marie Obenour wrote:
> On 2/12/26 20:23, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> >> On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=C3=B3re=
cki wrote:
> >>> Hi,
> >>>
> >>> Recently I started testing compatibility with Intel Lunar Lake. This =
is
> >>> the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> >>> I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> >>> Linux 6.17.9 in this test.
> >>
> >> Not sure it's going to help a lot, but does using a PVH dom0 make any
> >> difference?
> >=20
> > Ok, now with the correct Xen version, it's better with PVH dom0. At
> > least on the login screen and few applications (from both dom0 and domU)
> > I don't see the glitches anymore. I can't do a full test, because PCI
> > passthrough doesn't seem to work with PVH dom0 on Xen 4.19 - and I need
> > it to start most VMs.
> >=20
> > So, if the above test is representative, it's only about PV dom0.
>=20
> This reminds me of a problem that I helped debug a while back,
> and which also affected Qubes OS.  That one was due to some part
> of Linux core MM clobbering the high bit of the PAT part of PTEs.
> As a result, a PTE that should have referenced entry X in the PAT
> wound up referencing entry (X & 3).
>=20
> On native Linux, the bug was mostly harmless, which is why nobody
> found it earlier.  However, on Xen PV, the different PAT caused memory
> to be cached that should not be.  The resulting symptoms were very
> similar to what Marek described, though a bit less dramatic.
>=20
> Can you try removing the Qubes downstream patch that changes the PAT?

I'd assume removing such patch would make things only worse (it either
shouldn't matter, or if the driver assumes Linux version, changing it
would actually break stuff).
Anyway, removing the patch didn't change anything.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Hjkw3E9BoIh06IIo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmdxD4ACgkQ24/THMrX
1yzNKwf8D5XRQrqlh3kLHY4RnTkKDpzpidlSTt0P3ifmwdqFCR42vBkbdX7qE1+5
l0f6EjapaDSAj/Yx3+4yUztyiXLW+zsu6ashquVN6CzTJU9Q0mrRKqC229TYgi6k
SGyy0glmFlOfBYLklhF51jFO2r1NKp9ok736zecSYjg1KdwNHgpQgITnEEQxhCcw
/b4ajkkKZ6of0ulhxoEIHA5P7m/kg7I63jQapborsL0PHwdzEgTLqjpwBV0CqZ+W
9uZgRdUVfU0urRblL6/tFKj8/seQTBSiYoUT6bP0u3cIeIfF5r9bYaWC2xOFPfBh
sFX4fVag7XkIoeAwH/szlikJ4qdI8w==
=4qyA
-----END PGP SIGNATURE-----

--Hjkw3E9BoIh06IIo--
