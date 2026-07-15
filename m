Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2311C44508
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 11:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A42910EFD7;
	Wed, 15 Jul 2026 11:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C5XGlB/8";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD49F10EFD7
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 11:11:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 60DF9600BB;
 Wed, 15 Jul 2026 11:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197F51F000E9;
 Wed, 15 Jul 2026 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1784113881;
 bh=xGDf2JzSdnPyIx0dIe/FJobZnBwEWo1eSayca2itrxw=;
 h=Date:From:To:Cc:Subject;
 b=C5XGlB/8ZG2nMJ02+MVFoPpsvilgQ9pWOGqLNGHNJvL4xgQdrE7xzSYjjbsqGBxlz
 A5C+Cr5GgpSiusCbQzwVWygX1gQ8Jp/ukxocQQYlPLhym33usrxwJm+Py81xpsaZyC
 o6/0K1QYLsDKSAiedQe1TEHZ58uCeM3D5bxS/+awwkk+ecO84e9Wzi3Gxr5R5Fhdpy
 uZWNXo1GtY1RaogSf24UBaYXpwXM1aY/p7IAZOLhqD0nNgFqxP+/JFicYw4n/zYGmk
 HmHU5gRYoqHlgOYM0wA8b9Yzq8JK8ayE357ziZDhrDym/M8WzrZYVEzlkDKdO1SmQy
 qvutMzwQbhiig==
Date: Wed, 15 Jul 2026 12:11:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-xe tree
Message-ID: <aldq1bH-I9hhdc7q@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="okL4/NK2qmDPvsRA"
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


--okL4/NK2qmDPvsRA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--okL4/NK2qmDPvsRA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXatQACgkQJNaLcl1U
h9Dr8wf/UptrswXu+tzqvZFjGQrVDgbycA8LdPdinnFYGtpVqmDSBPV1lx+P+AJE
uVaV3+UquqY4CiYz5Yu8H3LVSqpdr+2lszJrSCSJc43TjEs8UNFEGAy2pAYrYIMs
rSZLGfVnxOTozgUzvSq/lNbKg7rG3WwFqckWMEyche/KOILV6z0b+OK2CDiEzprc
mtF3/SE908462swkOMayH6t8aBgnppChBJkMJFbzQ39NHptN/m6yue8kiuAFT/Qz
cq/9mFY15o47zUf4yNM1f3NvEaX1WT/5JLzxWhl7Vb/JULFAVQIFr1umgl1FTWVt
jbh1Jbwqgmf9Ux0j2pZ0jgUjRUaNtA==
=aryh
-----END PGP SIGNATURE-----

--okL4/NK2qmDPvsRA--
