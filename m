Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D059BC43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 16:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0C110E63D;
	Fri,  3 Jul 2026 16:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TuyFT1vC";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C01F10E63D
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 16:20:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E566A4379A;
 Fri,  3 Jul 2026 16:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517EC1F000E9;
 Fri,  3 Jul 2026 16:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783095625;
 bh=tYe2vcNc9zjCVZORiBcZ/Xy0DnzmgnoWMrPruVXwotk=;
 h=Date:From:To:Cc:Subject;
 b=TuyFT1vCyWKfONVc6oYQlpQjP3s3vpCcT8Qbfaa7xCWnS3ln3juKFoxyFWr/c3j/8
 c/W2dEg/IosB7I2ItH4FhthIWoQ8bT3kWwRpE5VKQ12biWDP37w547SZjv5F5Yl9aA
 /R+gq4Iu/BNKtbyoLpl+oum2l0wgdUuI1nN9uBB1Uz+/0KMDPwzCAYR4aTmVuGoVY7
 e1dVIsHgierQTSKCzv+uyXvmexIRZ1FHO+mjcJhoycHAohymrK2IrsEy/rg5QN+o2k
 JojS6GbvlB4FIEeI8JS/ZYSFrblKn/cApIIGTMmi2LmH7OKe8oxe0aLnr6t0BDbQes
 i0pFcEJVvNZnQ==
Date: Fri, 3 Jul 2026 17:20:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matt Roper <matthew.d.roper@intel.com>,
 Violet Monti <violet.monti@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <akfhRWRrbOXxMKd0@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tYyKyYj4ZgZXN21v"
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


--tYyKyYj4ZgZXN21v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_wa.c

between commit:

  e23fafb8594ea ("drm/xe/rtp: Add struct types for RTP tables")

=66rom the drm-fixes tree and commits:

  5ff004fdc7377 ("drm/xe/rtp: Add struct types for RTP tables")
  e9845449e37f5 ("drm/xe/rtp: Ensure gt_was doesn't evaluate rules with eng=
ine types")
  e2cfc5bc0c3ff ("drm/xe/rtp: Ensure oob_was does not evaluate engine type =
rules")
  94e15e89f491e ("drm/xe/rtp: Ensure device_oob_was only evaluates correct =
rules")
  02b41333f4874 ("drm/xe/xe3p_lpg: Add missing references to workarounds")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_wa.c
index b9d9fe0801aad,139434946f8f8..0000000000000
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@@ -130,7 -130,7 +130,7 @@@
  __diag_push();
  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 =20
- static const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_SR(
+ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_SR(
  	/* Workarounds applying over a range of IPs */
 =20
  	{ XE_RTP_NAME("14011060649"),
@@@ -293,7 -293,7 +293,7 @@@
  	  XE_RTP_ACTIONS(SET(MMIOATSREQLIMIT_GAM_WALK_3D,
  			     DIS_ATS_WRONLY_PG))
  	},
- 	{ XE_RTP_NAME("14026144927, 16029437861"),
+ 	{ XE_RTP_NAME("14026144927, 16029437861, 14026127056"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
  	  XE_RTP_ACTIONS(SET(L3SQCREG2, L3_SQ_DISABLE_COAMA_2WAY_COH |
  			     L3_SQ_DISABLE_COAMA))
@@@ -307,6 -307,7 +307,7 @@@
  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
  	},
  );
+ EXPORT_SYMBOL_IF_KUNIT(gt_was);
 =20
  static const struct xe_rtp_table_sr engine_was =3D XE_RTP_TABLE_SR(
  	/* Workarounds applying over a range of IPs */
@@@ -586,12 -587,12 +587,12 @@@
 =20
  	/* Xe3p_LPG*/
 =20
- 	{ XE_RTP_NAME("22021149932"),
+ 	{ XE_RTP_NAME("22021149932, 14026290593"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
  		       FUNC(xe_rtp_match_first_render_or_compute)),
  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, SAMPLER_LD_LSC_DISABLE))
  	},
- 	{ XE_RTP_NAME("14025676848"),
+ 	{ XE_RTP_NAME("14025676848, 14026270459"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
  		       FUNC(xe_rtp_match_first_render_or_compute)),
  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, LSCFE_SAME_ADDRESS_ATOMICS_C=
OALESCING_DISABLE))
@@@ -802,10 -803,11 +803,11 @@@ static const struct xe_rtp_entry oob_wa
 =20
  static_assert(ARRAY_SIZE(oob_was_entries)  =3D=3D _XE_WA_OOB_COUNT);
 =20
- static __maybe_unused const struct xe_rtp_table oob_was =3D {
+ VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table oob_was =3D {
  	.entries =3D oob_was_entries,
  	.n_entries =3D ARRAY_SIZE(oob_was_entries),
  };
+ EXPORT_SYMBOL_IF_KUNIT(oob_was);
 =20
  static const struct xe_rtp_entry device_oob_was_entries[] =3D {
  #include <generated/xe_device_wa_oob.c>
@@@ -813,10 -815,11 +815,11 @@@
 =20
  static_assert(ARRAY_SIZE(device_oob_was_entries) =3D=3D _XE_DEVICE_WA_OOB=
_COUNT);
 =20
- static __maybe_unused const struct xe_rtp_table device_oob_was =3D {
+ VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table device_oob_was =
=3D {
  	.entries =3D device_oob_was_entries,
  	.n_entries =3D ARRAY_SIZE(device_oob_was_entries),
  };
+ EXPORT_SYMBOL_IF_KUNIT(device_oob_was);
 =20
  __diag_pop();
 =20

--tYyKyYj4ZgZXN21v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH4UQACgkQJNaLcl1U
h9DiGgf+MnGs4imANWfQxL5Uh352QrVy+Z1xlylAQ193+fjHgs3iUkwxpgaooWhc
1ayxH437REu3CAIxhj7lhOACxzs7ldpEWeay8NNwrTKAi+BccAlzmeVg06i7r/FJ
E6iV8yOqYgo1wij0OiboYPEeCkmqBkvBWC1riZDysazXADTTKakNZ3grLPgYxspl
hBbmyslbkAm7KPP+vAidPQoA0cnmXGJHJlw0Q2bLmO0QmiOy17NGiwkAk0vkH0mn
efIFDtsezBhgTnpEdSJHi53O5hfVmkzjDDG23eoNZkhVBvE5q6ilJec9aTbOwQCw
N8R5t0Ift4wpAXlHXHK+Zc9rgkn3fQ==
=48tb
-----END PGP SIGNATURE-----

--tYyKyYj4ZgZXN21v--
