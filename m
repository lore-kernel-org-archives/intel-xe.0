Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0A5EA4FBF
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E1810E3B6;
	Mon, 23 Feb 2026 13:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oTEXT5aJ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9186B10E3B2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 13:40:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6A10D44081;
 Mon, 23 Feb 2026 13:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E66C116C6;
 Mon, 23 Feb 2026 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771854000;
 bh=q4GPTAsy19VuzybidodS7xjYwLsGreVbTNCJmOvzRPg=;
 h=Date:From:To:Cc:Subject:From;
 b=oTEXT5aJFwOciLUwqrHmO+FAKK+xQ6pQrdxVcQuiJRFouQCNTz+j1MnPDc1IAdM5/
 mUMKV5k/hAEeTg4VP7+mjGZ4QgBQpXd3V766oVo0LQNxZGL8oAX7fcXImkHARY9pYd
 TU7wu6cqMIx+FV2EvfpC+q3CnyJOipRNbhwM0MccErmT1vfeoHqFEFB0pIwNFUmps1
 U90HZtOx8BQNFY3pvbmkFDfz36IrCFYLdKkIWPhgq3TqOkDXkvpsl+gCGS5KfuJPfO
 JFUrJPvp99q7AcX3zZz5ohTaYYPKv2O23rHcpzsQbvKchuzNA3OLKGL+t15N2d0Lvb
 W379lFnIhrrBg==
Date: Mon, 23 Feb 2026 13:39:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Kees Cook <kees@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <aZxYq5neAWCi6NUN@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VRcgmX3Swi8+r40y"
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


--VRcgmX3Swi8+r40y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_bb.c

between commits:

  69050f8d6d075 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar=
 types")
  bf4afc53b77ae ("Convert 'alloc_obj' family to use the new default GFP_KER=
NEL argument")

=66rom the origin tree and commit:

  bcd768d787e7b ("drm/xe/vf: Fix fs_reclaim warning with CCS save/restore B=
B allocation")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_bb.c
index 4749aa7f94660,b0aceaec2685e..0000000000000
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@@ -59,12 -59,18 +59,18 @@@ err
  	return ERR_PTR(err);
  }
 =20
- struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
- 			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
+ /**
+  * xe_bb_alloc() - Allocate a new batch buffer structure
+  * @gt: the &xe_gt
+  *
+  * Allocates and initializes a new xe_bb structure with an associated
+  * uninitialized suballoc object.
+  *
+  * Returns: Batch buffer structure or an ERR_PTR(-ENOMEM).
+  */
+ struct xe_bb *xe_bb_alloc(struct xe_gt *gt)
  {
 -	struct xe_bb *bb =3D kmalloc(sizeof(*bb), GFP_KERNEL);
 +	struct xe_bb *bb =3D kmalloc_obj(*bb);
- 	struct xe_device *xe =3D gt_to_xe(gt);
- 	struct xe_sa_manager *bb_pool;
  	int err;
 =20
  	if (!bb)

--VRcgmX3Swi8+r40y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmcWKsACgkQJNaLcl1U
h9BeuQf7B6fIJ9WvL51pF87bUdkhlk2zXk5MARMWmkN/HnQDaPhHex4nTwSd0tqK
rnABE8SeiBc/h+7MnCmjuHpdhaqGtUKWza+Tx49eMUKivtHjcQo2Oi3fb5O42nxc
8jzFhD7mGvGvW4Q8/MZ0NogJd549Z6HJy+dyCo4sNvuFiiPW7TOJFY9Z6CGrrNdW
mxeqMO8zQUwx6JO6n5Mtn9wFq5x6LaD7wv5quD1TIvFVSzVz5fK0YmyGOFTjpUu7
4EoztWoiAuwm6v+GKl6sBXs97UuqmuDyhPiBtQS9b8OqSpCDEVgAlL0FtxZ0+Q0T
ribcpoeLv+N2ayiLedhN+ZkPPutM+Q==
=Lkpt
-----END PGP SIGNATURE-----

--VRcgmX3Swi8+r40y--
