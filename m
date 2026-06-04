Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BC8CD6E6D
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 14:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C675611282C;
	Thu,  4 Jun 2026 14:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ikUHqzvM";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDCF11282C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 14:50:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B209B43CAE;
 Thu,  4 Jun 2026 14:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F3E1F00893;
 Thu,  4 Jun 2026 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780584630;
 bh=1td/sgaYlpj7VVpnPq0zz027w0HQznec8R0iN182gLo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ikUHqzvMuAC5yvxsJyOPds7SqVA9zZxcf8/0q5FKcUZ6pXbxIcNwPUxM1N5a2qiYz
 t6+y8+kmymMYO4IbI6g+Nvvfr8gU3j5b76cobwPOWcS5ybbLNQBT7z3I8hXfQ0S12B
 mHlpzNsXflzJVEfxWlm7t68XZcjUI8l5jw6DVpeSnKh2TLH95NPAnjAIk2+qEP83Le
 0rwSqZL+x7l4ylAEX7j/mH57VeT1WnG8NwpvVvgek8X/MmJFDQqrwjRPVaIeWfhoxz
 yHT2NCfYcKQ23emRpzYMdP7qKxdn114MzzeCMbW1qtUIBFqok5Ts/eyjCc4cgf07RN
 Y+0TUmaD30TsQ==
Date: Thu, 4 Jun 2026 15:50:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: DRM XE List <intel-xe@lists.freedesktop.org>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Violet Monti <violet.monti@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-xe tree
Message-ID: <551d384f-d151-4d1e-bcb8-a1cde0860a30@sirena.org.uk>
References: <aiAz4DmtngY0r6Cx@sirena.org.uk>
 <bfb0dee8-b243-47ba-a89d-71472b0d51c5@sirena.org.uk>
 <f9094757b2aab617feb8fc3f8a66f46595e0ae27.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6MiZsoqq4HKfrECh"
Content-Disposition: inline
In-Reply-To: <f9094757b2aab617feb8fc3f8a66f46595e0ae27.camel@linux.intel.com>
X-Cookie: Q:	Are we not men?
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


--6MiZsoqq4HKfrECh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2026 at 04:43:17PM +0200, Thomas Hellstr=F6m wrote:
> On Thu, 2026-06-04 at 15:35 +0100, Mark Brown wrote:

> > /tmp/next/build/include/linux/compiler.h:200:84: note: expanded from
> > macro '__BUILD_BUG_ON_ZERO_MSG'
> > =A0 200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...)
> > ((int)sizeof(struct {_Static_assert(!(e), msg);}))

> Funny, I see no build errors with drm-xe-next allmodconfig. What
> compiler is being used? Any sha1 of the drm-xe-next top commit you're
> testing?

This is after merging the tree into -next, that'd be on top of
09b893db4d9e68c2679e76624d420f438f8d3e98 for today (not published yet).
It's possible it's some interaction with other trees (like the main drm
tree) and works as a standalone thing, it wasn't obviously that from a
quick investigation.  The toolchain is gcc from Debian stable.

--6MiZsoqq4HKfrECh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmohkLAACgkQJNaLcl1U
h9CQiAf6A5ddfaJ9zDsPntLJpT3kooA5vvLtLjTnRrqBGtzmMDxVIQQoVEtWnpUv
19zvl3tezsj4yJ0Cnmxd/RLxYCvpS/57KHdw0RW/b5C6MkgFHiSAxUsHzuy6xRTe
wkxglTifLMFTVT3HDW8EOh3S1yoKAIBLc7j0wnW8r5n1LbpfFMXiYLsn4BMDrf8b
I8ippFu9MggVdygFvzhdA32lTiDnlMs1xGG9co1iLK8bcyNwwjLq4xPveIUkMhXG
BDX41cNDPjsNejVLPv3FYBeOECglaM4HyiepHSuZmYr9/aIo2GGNy9FwzyKpgZAm
O5dWdMyaikt1BLzatWTnMCn9QtYlvw==
=VG1p
-----END PGP SIGNATURE-----

--6MiZsoqq4HKfrECh--
