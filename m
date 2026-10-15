Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE7ACC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 13:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C5910EBBA;
	Thu, 15 Oct 2026 13:03:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A77410EBAE
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 13:03:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B24274341D;
 Thu, 15 Oct 2026 13:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6171B1F000C4;
 Thu, 15 Oct 2026 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792069424;
 bh=bunlwajOetrmnYf9ny1hT1imCQsIXnS2QyI1vpqiq1w=;
 h=Date:From:To:Cc:Subject;
 b=Tqsdf07X9753O1QUzh+kv8KBS/cPQyZDV2pjmmXigiYrQmHsa1oTnwuFimJNJ/5BF
 j0+vvjn9txn9d1T5AMY/Mkd3BQEb6obFayftHXamtcrHbJvh1SFaSx/H/Bx60GBPev
 pUhEXU/RHvMh8ulQkgA3bFnIk+4QooEmWkRSCxTD6zM0MDn3Y2uKuVxKcbVFbFlU4e
 +IxSLb5Bn/Gqut6i9rXEVuPzXn06LF5FqXrJVxFgUZjcEp1eleY/2/ne5oXpQghCBL
 5VBl3UJR43uWQ5TtAq4CriH4lVAvyAqI59Xa2Yo1WhSZzfaKrgsZG1k5w7VMVYwDEz
 OQ+glv61gXNBQ==
Date: Thu, 15 Oct 2026 14:03:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Daniel Gomez <da.gomez@samsung.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: linux-next: manual merge of the modules tree with the drm-xe tree
Message-ID: <atDPK3Tz7cNWdtDA@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="voOosfS5jhpgDEb8"
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


--voOosfS5jhpgDEb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the modules tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_log.c

between commit:

  149f81d8a73ea ("drm/xe/guc: Compress GuC log and CTB dump with zstd")

=66rom the drm-xe tree and commit:

  291a8fe5d999c ("drm/xe: Include error-injection.h for ALLOW_ERROR_INJECTI=
ON()")

=66rom the modules tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_guc_log.c
index 90aeaccea596c,6f0739204d9e2..0000000000000
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@@ -5,10 -5,7 +5,10 @@@
 =20
  #include "xe_guc_log.h"
 =20
- #include <linux/fault-inject.h>
+ #include <linux/error-injection.h>
 +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
 +#include <linux/zstd.h>
 +#endif
 =20
  #include <linux/utsname.h>
  #include <drm/drm_managed.h>

--voOosfS5jhpgDEb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrQzysACgkQJNaLcl1U
h9DZfggAg7Qc6hNRbd/owvc1n0nx24w/nGSMUKsrBni0a6RCgAdP7z1V0+IjxjgL
++LsePYhSEXNyvDEpn716iICad5GVLklF2hF5Ir/bE60bk+VjhEzBZLfvjLTmHem
cupuSVKNh9+vqO/du+5oARnslXvb8DeSEYB3AMwJwL1tplAFUPq0Ze5fIWp8V3+M
avQZF8+s0nHanCAHxW4ETsA/oZd63VUqULma7bM+fboezhxxFEkliNY5rJg+VlcB
8CPvAOz/cj5K9gxItDTBZBaX3PQkj/zeGP/iKDomxJ/axyRJSbLriTCsQbYZSJDZ
MdrBTa+gX61fVSdzS3deh2ftEGApCw==
=gwOq
-----END PGP SIGNATURE-----

--voOosfS5jhpgDEb8--
