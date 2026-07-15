Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079E7C44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 11:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B617910EFD7;
	Wed, 15 Jul 2026 11:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f480LjhS";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1956F10EFD7
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 11:10:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6A734600BB;
 Wed, 15 Jul 2026 11:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA331F000E9;
 Wed, 15 Jul 2026 11:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1784113845;
 bh=cK3MwnBNjofUBjqsB9sbNjafrm07KoBRdLWH5WVQpF0=;
 h=Date:From:To:Cc:Subject;
 b=f480LjhSUqY0sbta9A4cf0BtNvSMt8bkMusTwIPM3xFVGyi/741q1Hn46cDmOscr/
 bTJdC+9ZKlYTaL0Dp0IAXhHMJ9IjNaG87JZf5J/6WLCpv9F45DpdguOjm8DxsY52KJ
 GgarVa4ybFG69Y/OTEIK72REZS44rylBvIv0YKMyuwCJLF0EBHKoMgikpcWLDZvWLj
 ft9K24VCxEDV+6DGhn9PFGmsTheKTueJ3rH6TGx6X7iS8YcFvsw1IzMWZzSD02pSP5
 1M/KTPHF7kQDnQwA15EJc/zmaEk0RKI/pvwpNJEBfD7MneifnWCX3pXSY0AuXhnKXQ
 eP34/iGMGajqw==
Date: Wed, 15 Jul 2026 12:10:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-xe tree
Message-ID: <aldqsddPPF4VaFCU@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VKNhRRXc79BXDuXw"
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


--VKNhRRXc79BXDuXw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3b1f4d5e47b36 ("drm/amd/display: Fix dangling pointer in connector reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--VKNhRRXc79BXDuXw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXarAACgkQJNaLcl1U
h9AyKAf+LUY9g+MrGE0B3sk05UH5SHwWrS9nPp2KNOqPFn7HucwmLrRT8F2SMEkU
+yeNBUQ4gRhhqt0YFVAfkszrmc3YVD06FbsKpTiMXQ7N7wSXFX2gBD+6WKP0jbnw
kwA58x7qwtZ2aV+qD/bkXl46SbKUEPrBKPlbHiaPhowCk0OTudIjcYmg2h6EHhEv
MSRyBG3B2f/LoQMmycru7BlcIkLkCIhbRdJbaxmxK0nFYQSikEqDZc9Hn5NpL9sC
D3l39Cf3n0413x3XGdxQllrN/3NSo5i4/b9XIw8LErWySKVktbmQf+wWG0dEbWQN
AAztBjKbgMiPTKAcHjmyLoPuS9Ewsw==
=V4bN
-----END PGP SIGNATURE-----

--VKNhRRXc79BXDuXw--
