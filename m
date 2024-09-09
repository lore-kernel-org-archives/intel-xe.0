Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B08EECE57B
	for <intel-xe@archiver.kernel.org>; Mon,  9 Sep 2024 09:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A9410E364;
	Mon,  9 Sep 2024 09:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TfFswYtU";
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734B910E362
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Sep 2024 09:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1725875980;
 bh=Yj0ed46tsvdzgqrgty6WnxjpOflU7XY0odRrgln/Q0M=;
 h=Date:From:To:Cc:Subject:From;
 b=TfFswYtUC71gAOk6xpyLPIneelV8OQ8wOZJJzQMFP/XLfZng9V+FdELSeX7d1yDqu
 qxb1hdtzk6IMiu4Dv8B7/uA+DoKXEZ0D30VPeo86np+huYHaAZsJwu2Sb6UxqjgQS/
 bMqzX9tqfiDTBo/GtD0RWrEmcFYkgUxVJbZ7beLXjACW22Je26SnK/GZNopOeolw6F
 eDSZ08lqtKSDDIpMnNwXv3zzZA4qA16xW6imwiDIYQdVwwHoOTqQNZhuzqNbdj1it+
 JkAhM0pUriuhj9yenEoOLK9iHkjwoUFdTxebpJjMMiQtqdcRYYh0cC9BfiYWV1ho8x
 zHV70VhHf4Pqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2Mkh09X1z4wcl;
 Mon,  9 Sep 2024 19:59:40 +1000 (AEST)
Date: Mon, 9 Sep 2024 19:59:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 DRM XE List <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kspp tree
Message-ID: <20240909195939.067c1c13@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ix6NSMvjqjGtk=XWkZda_/x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/Ix6NSMvjqjGtk=XWkZda_/x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kspp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/xe/xe_gt_idle.c:56:27: error: redefinition of 'str_up_down'
   56 | static inline const char *str_up_down(bool v)
      |                           ^~~~~~~~~~~
In file included from include/linux/string_helpers.h:7,
                 from drivers/gpu/drm/xe/xe_assert.h:9,
                 from drivers/gpu/drm/xe/xe_force_wake.h:9,
                 from drivers/gpu/drm/xe/xe_gt_idle.c:8:
include/linux/string_choices.h:62:27: note: previous definition of 'str_up_=
down' with type 'const char *(bool)' {aka 'const char *(_Bool)'}
   62 | static inline const char *str_up_down(bool v)
      |                           ^~~~~~~~~~~

Caused by commit

  a98ae7f045b2 ("lib/string_choices: Add str_up_down() helper")

interacting with commit

  0914c1e45d3a ("drm/xe/xe_gt_idle: add debugfs entry for powergating info")

from the drm-xe tree.

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 9 Sep 2024 19:40:17 +1000
Subject: [PATCH] fix up for "lib/string_choices: Add str_up_down() helper"

interacting wit commit "drm/xe/xe_gt_idle: add debugfs entry for
powergating info" from the drm-xe tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idl=
e.c
index 85a35ed153a3..0f98c1539c64 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -53,11 +53,6 @@ pc_to_xe(struct xe_guc_pc *pc)
 	return gt_to_xe(gt);
 }
=20
-static inline const char *str_up_down(bool v)
-{
-	return v ? "up" : "down";
-}
-
 static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
 {
 	switch (state) {
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/Ix6NSMvjqjGtk=XWkZda_/x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbexwsACgkQAVBC80lX
0GxNogf/fhjVLMYEVJncKhoKQTh+bbbygsbiNCT+zU1kAQ80Z7BXoCmS/A9ygNZ6
sHfIhwsZaUup9JLKEtE5zds3E7nFqrFzPO6sLo0Pfmvq7berzLjoP4nKcb960WGa
czyefDKobG6B72m3XpSQt7sBghPWKphSIlzLa/Lbbw2jWXO19qbekbnteRttjNiR
/FpfQz+BiQ4cTgjlw6p/Ay+grYQwaXA3MIiF4AObI22A+bcgMQYEJTQ1qySfESIv
I53Ky2SRN1CzZStp7C+rN73zvpqyU2wDbx9KPduQZ3x7MdP3cE5i/jMZg16Pi1f0
5KANPJt2btORBrFlLs+2JNESRa353g==
=PgpG
-----END PGP SIGNATURE-----

--Sig_/Ix6NSMvjqjGtk=XWkZda_/x--
