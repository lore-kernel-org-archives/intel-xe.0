Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9D8CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 12:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7877E10E9B0;
	Fri, 19 Sep 2025 12:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QtjANoUg";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C478F10E9B0
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 12:45:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 141FE60146;
 Fri, 19 Sep 2025 12:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C30C4CEF0;
 Fri, 19 Sep 2025 12:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758285925;
 bh=YO/PpUN1H9lGCId6mv1uFegodo8YwlKrwL4f6jJ7I4g=;
 h=Date:From:To:Cc:Subject:From;
 b=QtjANoUgWKd2AUI3kKQ9lu1wPHPjrYd0IKiD2sxDBumQNclkcwCcCG7l1qOd2zMlY
 7WCK0U8FoReSlX5tpc1Vbq5pays1s7sPfopSwPTBRE2h/q/TTf0Mv4WJ12o+4CndOK
 hWV1Zj8P/fDzqsZru6HNzejjZItUKkmsjNVxBxiZfB0mSDCzrUzeDb0wm+vlTI/52d
 YVwGMtdJuUHm9h9bDCEGEVKP2GyALcOH0YvXQYuRro3flpvVN5pAlBsR8Weyt/BH2M
 u0wEfc0OTz4huxEc6tFGIIAxVbj8cC83iR7EbWvKDywxVtTHa+NEg2SdBUs06DeE/d
 jB2HzzIT1UG/A==
Date: Fri, 19 Sep 2025 13:45:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zongyao Bai <zongyao.bai@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <aM1QX4eEaSRQX6Dl@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZcZx3cHxvDMD4Pma"
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


--ZcZx3cHxvDMD4Pma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_submit.c

between commit:

  ff89a4d285c82 ("drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init")

=66rom the drm-fixes tree and commit:

  fb3c27a69c473 ("drm/xe/sysfs: Simplify sysfs registration")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_device_sysfs.c
index b7f8fcfed8d86,c5151c86a98ae..0000000000000
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@@ -308,19 -290,15 +290,15 @@@ int xe_device_sysfs_init(struct xe_devi
  			return ret;
  	}
 =20
- 	if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
- 		ret =3D sysfs_create_files(&dev->kobj, auto_link_downgrade_attrs);
+ 	if (xe->info.platform =3D=3D XE_BATTLEMAGE && !IS_SRIOV_VF(xe)) {
+ 		ret =3D devm_device_add_group(dev, &auto_link_downgrade_attr_group);
  		if (ret)
 -			return ret;
 +			goto cleanup;
 =20
- 		ret =3D late_bind_create_files(dev);
+ 		ret =3D devm_device_add_group(dev, &late_bind_attr_group);
  		if (ret)
 -			return ret;
 +			goto cleanup;
  	}
 =20
- 	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
-=20
- cleanup:
- 	xe_device_sysfs_fini(xe);
- 	return ret;
+ 	return 0;
  }

--ZcZx3cHxvDMD4Pma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNUF4ACgkQJNaLcl1U
h9Cbvwf/ehYsDsj+lqJUPJnYu4QYQoPrMKO3HTREiByZRp9P/dWFgJPRRtHuG0el
nWoOnNrSYmPgHnjSE76GUro5pG+UjUqwZ3Uz5Uey/aYFqYswjE2vP6DVxe3N2NoD
hTuhme5II1XxM2dn0nLlaA2helIANuqS0Yx+UaduHqxfNedsqrtlvJqrFohkUYb7
KPXPUm6yQdAP8apC4pbl4UV3avE6ftfQha7HZRSAM3KnjOWerZdlUonublE0BVti
u3sHwl1w7I8gFqlT7m17tdkiXrpSXY9K5Yec6+yo6RRxwl71W+K0VEkyDCOJFpj/
V5YjVnltLzTi1YYUqs/osg3Un19ORg==
=IMY4
-----END PGP SIGNATURE-----

--ZcZx3cHxvDMD4Pma--
