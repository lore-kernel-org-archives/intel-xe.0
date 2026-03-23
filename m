Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDDEF483C1
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:11:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A019D10E02E;
	Mon, 23 Mar 2026 16:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GcOE6xw/";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22BD10E02E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 16:11:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2193560141;
 Mon, 23 Mar 2026 16:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731C7C4CEF7;
 Mon, 23 Mar 2026 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774282270;
 bh=BcDYyj49bw4n/hc4XnOoc/hEdS+K+t7CoHp7vPgOvQ0=;
 h=Date:From:To:Cc:Subject:From;
 b=GcOE6xw/4F+xKbxUTpT+vsNSIXR+EmttUIhmkuhMnAE2yPZOe0tb2ttUNZZaF+ZjY
 MOabgFz/rLQzk3IbcvE57bj8opGYN0JF+DY2PorHkAvyI37aOrxgpYFdqi3vkmoPQa
 HaNRLyUuQ3+FDRDb3k071DAIIYgM0ckX7qyHZt/9VE/MhfJBqTPOq4I2jVdxc6spxz
 8odF+m1z7ixytEx26qnN2NZ8fOcn44sQN3p21Q//vXw+CoU8gNfYwPSTFFWwuXohgj
 YIVILUrEx+vfYnW8UhhMme80BKCPoz/bX6x5aWCn4feK5Sy0+8CUOlAFwBj8zJl5hS
 6LkgOSImj+E9A==
Date: Mon, 23 Mar 2026 16:11:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <acFmGjCJdAZ26Zw9@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x4w9fyO9O0Hv+qc4"
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


--x4w9fyO9O0Hv+qc4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_submit.c

between commit:

  e0f82655df6fb ("drm/xe: Trigger queue cleanup if not in wedged mode 2")

=66rom the origin tree and commits:

  e25ba41c8227c ("drm/xe: Trigger queue cleanup if not in wedged mode 2")
  a7f607610da72 ("drm/xe: Use XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET enum in=
stead of magic number")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_guc_submit.c
index cb32053d57ecd,a145234f662b5..0000000000000
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@@ -1334,12 -1334,13 +1334,13 @@@ void xe_guc_submit_wedge(struct xe_guc=
=20
  	if (!guc->submission_state.initialized)
  		return;
 =20
- 	if (xe->wedged.mode =3D=3D 2) {
+ 	if (xe->wedged.mode =3D=3D XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
  		err =3D devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
  					       guc_submit_wedged_fini, guc);
  		if (err) {
- 			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=3D2; "
- 				  "Although device is wedged.\n");
+ 			xe_gt_err(gt, "Failed to register clean-up on wedged.mode=3D%s; "
+ 				  "Although device is wedged.\n",
+ 				  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
  			return;
  		}
 =20

--x4w9fyO9O0Hv+qc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBZhoACgkQJNaLcl1U
h9AwYQf4yiwz8BPXaNwYn2lhzwpfcNviHcRIPottkR80+U0yKg+sbkjARSr2br0C
2ci7tHbQutaBh4BNiWRmYk9m6j+/bhG//kuGzRq5UWHNpcXu+BoqtjXc59Mm6nt0
uOmdyfYcNW0i7QRlAKDhU2aiGucprKYslLOByoJo0Sv9lFd4+y9pyMd1G3tPpqmR
TApNT52hJh1x2DTaiqDbIOFsuI6Bv8dusR5qV/t29cjz7egN8zfu+mc4ZcV9LZzS
y51EWePQRgPedz9DfVP26YENKEOcsM0Gzg5p0NoitYhJ6tmo1rNe5TpF7jLA44lD
a+z7hZsskeIFWFoZTONbG0hst7bj
=sM9S
-----END PGP SIGNATURE-----

--x4w9fyO9O0Hv+qc4--
