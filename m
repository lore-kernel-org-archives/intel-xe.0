Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFA2D74EEC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 15:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CA110E2CB;
	Fri, 23 Jan 2026 15:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lVVi9+st";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B3810E2CB
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 15:37:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CC89D60018;
 Fri, 23 Jan 2026 15:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C41C4CEF1;
 Fri, 23 Jan 2026 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769182647;
 bh=qqe5UxT+hYCQ7fJjMt89xetAm7oISEdQveKxmp6GzvM=;
 h=Date:From:To:Cc:Subject:From;
 b=lVVi9+stZm1bZyDG3qH0cDWGink3mLuK04kV860FPRKN5rSHCmN8/CJL3lS1seIXQ
 j6QGY7SeufSKJ16qzJwIiLc9VWDqDKT07oZBmJYB8JvhDBXKN2MPsLdvc0TOdxySbn
 hofKO6/7M6xFWDVurjY1Q6E6DX8gOZ0JHY5OPsnFusUBFE1xvqYvu+JhGQm+eB7HsP
 TT0bwJjFSEt4R9FM/CSzBnVg1I3F0sHEq6tpAdK6k/s10f+rWX75XKpvYL1o4BSBIT
 4tSimlA2GfdC3Z0AVWfiG4wFbelwW75es8xXYBaxmddrzRIZmVuW+VOZdxgUo9vCFQ
 k89jL4fhAZUdg==
Date: Fri, 23 Jan 2026 15:37:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Mail problems for Lucas De Marchi?
Message-ID: <3135e2fd-fdac-469c-be2e-6c1cb024883f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0QhBzn9s5f7AP0Ke"
Content-Disposition: inline
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


--0QhBzn9s5f7AP0Ke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

When attempting to report an issue in -next I got:

<lucas.demarchi@intel.com>: host mgamail.eglb.intel.com[192.198.163.16] said:
    550 #5.1.0 Address rejected. (in reply to RCPT TO command)

That appears to be a current address in MAINTAINERS, and is a contact
listed for the drm-xe tree in -next.  Are there any updates needed?

Thanks,
Mark

--0QhBzn9s5f7AP0Ke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzlbMACgkQJNaLcl1U
h9BJzQf/a/mst1iL9ei4BkR+Pm2EmNAxF048sHYiVvfLw6DJVMOfKcBxkWv7MZuH
tpSK0HVuZPvcD1E9GzgjkQ/WCU3orJ23WEpdAUWgmkv55TdQfGB+zHzRw9GkFyZt
URzWxnlZvwV3hCqqnR4g1iXh4CJVFyumyiNOZDGSevq0mpSYUc4kHCwe4sboLf47
uvc6evBERWBpK44dSWg9s3xUkB+5PnFIWWPDeHvZzyFd28ny6/C0kG4x31p3LGPR
0y/2RNHLqE2LfcLBiW3omaXbj+muhDAUNzpswsu/7xj1u1eA9ekkCqNpAEBH2AVD
JYUkf9RPBLzrog6fZZHlu8HAd32KJQ==
=X8my
-----END PGP SIGNATURE-----

--0QhBzn9s5f7AP0Ke--
