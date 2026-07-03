Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3E4C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 15:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBC810E62C;
	Fri,  3 Jul 2026 15:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QGt3SH6+";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DA010E62C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 15:44:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C97AE43510;
 Fri,  3 Jul 2026 15:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326E71F000E9;
 Fri,  3 Jul 2026 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783093467;
 bh=KjeXheL0Yxw0NammbJBbx74Ze3TdrnBR0YRwD+xO4dw=;
 h=Date:From:To:Cc:Subject;
 b=QGt3SH6+ZgsC3+eO8a11BKtLmdKD47IusZn7ulS5y8CQCY+t4QA7+iczjIwNS4jFi
 H0RA7dsWOpwMa+SPSsJjHt+RyKxwrXGyAQvPPtDqMIIo3X2g9lRTQqZd0HDpUxXaIE
 n4TjMKigosvdw6Tzav2uf+va8MN070dqMQw5fX1L1owGRc27NMGZpEIb8k79Rr045M
 tJ1yKkoZ0hEsCk1PTXfCWV3OgQhwdwfFU9eQrFeiFlvM/UCM82qjLUh7mW/1sSQ7D8
 xT5L+V/8Jmm971+C7/Ic/4BA7Sku387JdzN/4wi1sPYldssJ5RbUQHpf8LwRh1nyyn
 UTp5ZGQXOvRtQ==
Date: Fri, 3 Jul 2026 16:44:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matt Roper <matthew.d.roper@intel.com>,
 Violet Monti <violet.monti@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <akfY11JiVCUS-gMM@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7oZ2AZx8v1eFDAXR"
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


--7oZ2AZx8v1eFDAXR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_tuning.c

between commit:

  e23fafb8594ea ("drm/xe/rtp: Add struct types for RTP tables")

=66rom the drm-fixes tree and commits:

  5ff004fdc7377 ("drm/xe/rtp: Add struct types for RTP tables")
  e9845449e37f5 ("drm/xe/rtp: Ensure gt_was doesn't evaluate rules with eng=
ine types")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_tuning.c
index bf3fad9cdbef4,bcec40ca2d35f..0000000000000
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@@ -20,7 -20,7 +20,7 @@@
  #undef XE_REG_MCR
  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr =3D 1)
 =20
- static const struct xe_rtp_table_sr gt_tunings =3D XE_RTP_TABLE_SR(
+ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_tunings =3D XE_RTP_TABLE=
_SR(
  	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
  	  XE_RTP_RULES(PLATFORM(DG2)),
  	  XE_RTP_ACTIONS(SET(XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS))
@@@ -101,6 -101,7 +101,7 @@@
  				   BANK_HASH_4KB_MODE))
  	},
  );
+ EXPORT_SYMBOL_IF_KUNIT(gt_tunings);
 =20
  static const struct xe_rtp_table_sr engine_tunings =3D XE_RTP_TABLE_SR(
  	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),

--7oZ2AZx8v1eFDAXR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH2NYACgkQJNaLcl1U
h9BOaQf/UU1N7XXRhDcU0SckYD7P38s8JQYt8mnj7IqCPX+SC2/1Ut/jbqVxBHFr
us53llVyzpmj7stz8BZ63c8VrCg0hQ/GQPWYwmjgDzP6KgfbUhyjWmLnluS3GnVF
Heo2vLtlQ7KvoKeSLUtbDCd6QdCQLLJ5f40koLi4xN+zlgRk42EKIFODqr+Mkg9u
Zejmi245pFLwov3hMDqeHtm94CC6STkxHjyjaDXYv7i+9IAAvkhQhJzV8EoV5Hco
V1MgWxWhddrjmW2caTp8vfVXUwSx7vo/mAmHWzkeERgugsrwBTjg56yipqK9DYfP
MuCcRM1arjzZ8DaSV15QRM8bAxVh+g==
=Q4zt
-----END PGP SIGNATURE-----

--7oZ2AZx8v1eFDAXR--
