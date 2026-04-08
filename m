Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C5B10F9964
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 17:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF3810E6AD;
	Wed,  8 Apr 2026 17:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r1K5KfvY";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0198310E6AD
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 17:15:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C7233438FA;
 Wed,  8 Apr 2026 17:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD486C19421;
 Wed,  8 Apr 2026 17:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775668530;
 bh=Ea8kuzJDBy+2PpeYJETg1n/P0QgRtuMEkZSbPxG9h7I=;
 h=Date:From:To:Cc:Subject:From;
 b=r1K5KfvYTEFH0URBfsswpv3hc9T5utpFzHN6WNi2VeSIld92hH5X9tN5LihfuXEeK
 +NO6wJytMZDmXqD/MQlsV++h4lN66hK3kv0dot6XDt/ohtOVIZjL2ErLx2yPlhNLNE
 Dj5k2OXqJcM16jV2seku1FQatO+gxNyh7tYg0G5QdeG0EvRn34BH/OBaOEPASUrhcN
 /sk58Gu7Jt7R3u7bKOpbLQ1P1Av8WdpaIrEaUAqIZwhAgH1+PjTyodvaGfD4oiJkpe
 93XJumrAUoajWOgbnnv+NY5ytXPLaSmSB2CeObnKYISTVFcG2UnPmFrf9tsGRnsSR1
 yU2PyuQ6b2HHA==
Date: Wed, 8 Apr 2026 18:15:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: htmldocs failure in the drm-xe tree
Message-ID: <adaNL_cT7wtfn7FK@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CIsY5O2H6CB3aCUS"
Content-Disposition: inline
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


--CIsY5O2H6CB3aCUS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In today's linux-next I'm seeing a htmldocs error in the drm-xe tree:

/tmp/next/build/Documentation/gpu/xe/xe_mm:22: ./drivers/gpu/drm/xe/xe_ggtt.c:124: ERROR: Unexpected indentation. [docutils]

--CIsY5O2H6CB3aCUS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWjS4ACgkQJNaLcl1U
h9AK3Af+I+eQPIbd4tGR7zxI44sxa1o7YknQfdDrYglBGDE2UGhl54+876S0TAoT
3PpbjP5lngZ7MF0+Qz5AEQ2fYg0ahcfIRV2sbJashkytYa8NzxhkeVuTISNbw99c
3uD/+RwJY+y7FoRZnlop759PxAuIEnrXO3YsDRCEAxxwsp0s3vyImje2conpX/t+
t6T9UEYrFWY3bj407+Hm8OIFwOlNekdqVrF4zreLrKYp7frdD+b6O0ahLlXX216k
riENzBjVyPWne08X+mLMiI32v4KcO6A83p1S+KRR1vz/rq/66Em5PDKgK5lanfKQ
yAg86cZavR7PLXHPqiIG5bAZfTsGuQ==
=UlYs
-----END PGP SIGNATURE-----

--CIsY5O2H6CB3aCUS--
