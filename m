Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9201C369A2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 17:00:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EA210E2E5;
	Mon, 14 Apr 2025 17:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.b="wKnOfUxi";
	dkim-atps=neutral
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E5810E401
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Apr 2025 22:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1744495647; x=1744754847;
 bh=h0kymwDINze0C82sFqV8gjWjfvf0igrTLxrupoR8ca8=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
 List-Unsubscribe:List-Unsubscribe-Post;
 b=wKnOfUxiXTiNQpabD47wlRVmGjnuBDskNjbKqjRAmAmDiYzkT4N8+ellWcFvbC2E6
 KHQX/rd8PXg2yuu7FRAsnRor3x2iz8j+wdWoog9soa8aY1ojyWCVj5Imp35Aw/qxP5
 EnNyH1Jt+JJl8tl12OFP56LWGxJRc3UV89sn1Jiri6NBsIadWj3K5JIeahhdYs5ciz
 pu/NjtDARoGQScPJ8oN9EYMcF+kuph6kcaIFTlWCKcYsZtw9b5SUavxsmUxWYWIM7u
 IbuZqNNIFKQz5EK/YCixgMU6uMNjwzyQb5qVf8mkTtxZNHq9okFGsS8II75VCc2oUq
 t3HQTZQZklkEQ==
Date: Sat, 12 Apr 2025 22:07:21 +0000
To: intel-xe@lists.freedesktop.org
From: Harry Austen <hpausten@protonmail.com>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 Harry Austen <hpausten@protonmail.com>
Subject: [PATCH] drm/xe: Allow building as kernel built-in
Message-ID: <20250412220137.3892-2-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 459aaba2722dbb5025b6b49e88ba12b82021aa8b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 14 Apr 2025 17:00:23 +0000
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

Fix Kconfig symbol dependency on KUNIT, which isn't actually required
for XE to be built-in. However, if KUNIT is enabled, it must be built-in
too.

Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=3Dm")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Signed-off-by: Harry Austen <hpausten@protonmail.com>
---
 drivers/gpu/drm/xe/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 9bce047901b22..b65bd6b9e65d4 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_XE
 =09tristate "Intel Xe Graphics"
-=09depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
+=09depends on DRM && PCI && MMU && (m || (y && KUNIT!=3Dm))
 =09select INTERVAL_TREE
 =09# we need shmfs for the swappable backing store, and in particular
 =09# the shmem_readpage() which depends upon tmpfs
@@ -51,7 +51,7 @@ config DRM_XE
=20
 config DRM_XE_DISPLAY
 =09bool "Enable display support"
-=09depends on DRM_XE && DRM_XE=3Dm && HAS_IOPORT
+=09depends on DRM_XE && HAS_IOPORT
 =09select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 =09select I2C
 =09select I2C_ALGOBIT
--=20
2.49.0


