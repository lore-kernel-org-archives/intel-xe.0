Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AF4D77888
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 17:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B48510E2D2;
	Fri, 23 Jan 2026 17:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vx43L7KN";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773FD10E2D2
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 17:03:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7CC1B600C3;
 Fri, 23 Jan 2026 17:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9F3C4CEF1;
 Fri, 23 Jan 2026 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769187814;
 bh=iRCsBjag6pBBLZwR9paVOZmST4GiEOnV0O9NEX5FZCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vx43L7KNO+vMtKhJWU9sxIA/4Vboto2nXTlAsF5eJqpSllPd3hx++LHvHmXUuhQQV
 Xmy76ZwaM+wB1XpQPwJePAB3iG3f3E+8jmps+fMBrJm9Uj061qFSf90wjJ35STB7aU
 76SDYdK10a3b0EFBNbus78d6CXC0N3b7MHQYPh5oPcBYa83CRRboGyd1/qdnn+m0C7
 kQhG3rLzVa8/ZGXICDN8T5I8p1Q3TjjS5Aq2Q2SUoRmx8d60ld5CWl76/Qv1u3U+ro
 TwXrrUUf5boWy9Lau5A8robmKoGJPv5v0JfYJp1yv+vD62rkd7lPaGoETqY+dHD1Jf
 NLhdVL2EH/pnQ==
Date: Fri, 23 Jan 2026 17:03:30 +0000
From: Mark Brown <broonie@kernel.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "Souza, Jose" <jose.souza@intel.com>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: Mail problems for Lucas De Marchi?
Message-ID: <2919dcfb-68ec-46e4-858a-08a0d42c27ff@sirena.org.uk>
References: <3135e2fd-fdac-469c-be2e-6c1cb024883f@sirena.org.uk>
 <8542127c23736029c476033bc933e12503bc3fd3.camel@intel.com>
 <CYYPR11MB8430903D2AE8BDD782B59B128B94A@CYYPR11MB8430.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yjbCkbwBDuMzfioe"
Content-Disposition: inline
In-Reply-To: <CYYPR11MB8430903D2AE8BDD782B59B128B94A@CYYPR11MB8430.namprd11.prod.outlook.com>
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


--yjbCkbwBDuMzfioe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2026 at 05:01:28PM +0000, Vivi, Rodrigo wrote:

> Commit aa8225d4ee87 ("MAINTAINERS: Remove myself from xe maintainers") address that

If this happens in future please remember to also update linux-next,
we've got a separate list of contacts for the various trees we merge.

--yjbCkbwBDuMzfioe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzqeEACgkQJNaLcl1U
h9AlQgf9FqSkodhD0SLzUqUBPFoLRV3fwPMAORrzl23nJmcgqJ6pbhYAVFx9VKNH
RaOw8PLP4gt9PEiJ/hOjd7xZYDgJtpd5gAh5DYUOfhLsySQbP7eAAI2mgFbU7jsu
FbjnIl/7fRPOroK+I9P90u3K4iyxou3eWGuErbpot5LCtVkTSZjejgS/KyatQHIt
wuxuB26R8FPP/2xewyMY0Apll9chhikaAIiINB3SFH5JOeEZWgoNu/cljHerhsSK
12uh6Vo+8acAlhOGCDGOj9VsGKRJlFvuHq1ZP4WWZsiONwsbAxIwd5jf7U73ZMn/
7oymHfeRi3Y4FLj1opiNx1XMB1+sKw==
=jH2R
-----END PGP SIGNATURE-----

--yjbCkbwBDuMzfioe--
