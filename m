Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C01D778B1
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 23:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E8E10E2F0;
	Fri, 23 Jan 2026 23:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ppuSAcuU";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B3710EC0F
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 23:21:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DE4036011E;
 Fri, 23 Jan 2026 23:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77667C116D0;
 Fri, 23 Jan 2026 23:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769210480;
 bh=LkzcoGeDBfBgFxa/0vzN0Wd0gngQs6b43wHsK+jfaS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ppuSAcuUVnIXmFKaf/QKGmVrIrcvoCLW0qlPdAXL8NQofhPC7X2fH3UaCyKiEdwcN
 GHq36qvwOmwFbElx46GGR5mMBkEMdUn2XHtac8+TOqaAay2OdBs4KgUDWt46Yclzpr
 zgSIglhH+ggDdTHutxonHJtPdPne/9H27adh40Ey15D/cTrM8Hn441fLq3T0fRNkLV
 8Jwf/VwLYg77GEj0f0QuDCUneb7//xP/J/Q8cHpS1Oo1p6sTDXRgEshrOrQLM3X8yG
 Fx/SdHsk2O7nTqHGoXkJwyDiQ80V+QmsugR8E+mFzr7ieEILaZkl40AVIGH/Lzi6+n
 9DWt9Li2nr9AA==
Date: Fri, 23 Jan 2026 23:21:16 +0000
From: Mark Brown <broonie@kernel.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: Mail problems for Lucas De Marchi?
Message-ID: <5568f3ac-8b1b-46c3-8c37-61a61d62babd@sirena.org.uk>
References: <3135e2fd-fdac-469c-be2e-6c1cb024883f@sirena.org.uk>
 <8542127c23736029c476033bc933e12503bc3fd3.camel@intel.com>
 <CYYPR11MB8430903D2AE8BDD782B59B128B94A@CYYPR11MB8430.namprd11.prod.outlook.com>
 <2919dcfb-68ec-46e4-858a-08a0d42c27ff@sirena.org.uk>
 <ca24e8a12732720302823d1571e217017e5744c4.camel@intel.com>
 <585d9e41-8627-48cc-aa3e-efb1ab9cbb90@sirena.org.uk>
 <0952430293e438fc76bfd1a8d080716583edc41a.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="z5Auc8WcnZko6xCp"
Content-Disposition: inline
In-Reply-To: <0952430293e438fc76bfd1a8d080716583edc41a.camel@intel.com>
X-Cookie: HAIR TONICS, please!!
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


--z5Auc8WcnZko6xCp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2026 at 10:37:42PM +0000, Vivi, Rodrigo wrote:

> Sorry, I thought your scripts were getting this already from the
> MAINTAINERS file.

> I was wonder here if we could make the intel-next feeding branch as
> part of the MAINTAINERS file in a more broader fashion I mean. But
> I can imagine that it would cause other different kinds of issues
> for you... so feel free to just ignore me...

It'd probably be possible to convince the scripting to put a redirection
in to a specific MAINTAINERS entry...  I'll have a think but might take
a while to come up with something usable so I wouldn't hold your breath.
I worry about fragility with whatever key gets used to look up.

--z5Auc8WcnZko6xCp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml0AmwACgkQJNaLcl1U
h9ApbQf7BfztG1LH1QxjjO1kTk42ZTQYzjmjRdvKDDsCxtHWG32FumFTKZgHYLl9
v242tbAe6wDK/+rD41/anKCnNBGaWaDURiXRjD4j5lccTlRzFSWoYHrobr+MGSs+
Ub6B/V99KoVYI3OAmIXuYwylxvBzNV2e/n0hBp8Oxs98FrMRxnTw6mN0lG5qtOKR
9tlZ+JuNFoytdFHvOmfg6hNQ3yy9uK0kMS0y6RQJh6Lm18vF+K+bE4VGy8Zy5BNa
B8gIe4WYEIdIrZ6FecYKz2ZBm/W2nJOgucsWuYmTY13OxGNmCrdSTMinc6QG7eB1
F3bmv3lGf5oiz3BW6agJbqFpV2oOZA==
=D3vJ
-----END PGP SIGNATURE-----

--z5Auc8WcnZko6xCp--
