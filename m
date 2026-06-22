Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90281CDB46F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 13:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28EF110E6DC;
	Mon, 22 Jun 2026 13:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZ5MhyIm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A644510E6DB
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 13:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782134644; x=1813670644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kimZPrOQvXn+1YFzqjVpL+Le6RRJX+dCHa838rwXdg0=;
 b=NZ5MhyIms+iZpzaDqRv6+pmWT18QRLg+8160R1dswHx31Ybp3gFe8ahB
 QLADq92PGdeuwHTYqTilDtEjIJDS7+eMVFr6Dmm/OG1deOqXyJDFbyPgC
 uhbCwgFwf0iu6GurnSduznkWmzqtZrijwZlK0a94xK8sjgWD5URaZ1nWD
 p7ebzEdn+gntUJcZ4QWtckiWoK1HuKrfzRNrE3Avym7pIeu38AqrNUm7T
 F79KqrBd9R3bOr2+4wlGA2pqweV6G3JtIYLgH8OtZ6qVEDLC9gXLUr9BS
 DIBKpesgLZcPmGiorCMicnUnytlUFWccZ+wuapiV4v3cqt572pzzxXBQT w==;
X-CSE-ConnectionGUID: FbKD5gtPRU6bz9ES/fBdBw==
X-CSE-MsgGUID: Fd1iqavFRCez2j4GLy2wZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="93228695"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="93228695"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:24:04 -0700
X-CSE-ConnectionGUID: U+ETkDq1Qdeev0A1qZRbdA==
X-CSE-MsgGUID: X1gSwmuxQCyB+lELfimacA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="279407187"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 06:24:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 5/6] drm/xe/mmio: Check MMIO BAR size when initializing
 tiles
Date: Mon, 22 Jun 2026 15:23:41 +0200
Message-ID: <20260622132342.19600-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622132342.19600-1-michal.wajdeczko@intel.com>
References: <20260622132342.19600-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

We initialized all remote tiles' xe_mmio structures with a new size
of 4MiB and offsets of 16MiB without sanity checks to see if mapped
GTTMMADR_BAR was actually at least that size.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
v1: https://patchwork.freedesktop.org/patch/727341/?series=167104&rev=1
v2: use %zu (sashiko)
---
 drivers/gpu/drm/xe/xe_mmio.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 58226cd8b399..41e6b753634f 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -48,21 +48,35 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 	struct xe_tile *tile;
 	u8 id;
 
-	/*
-	 * Nothing to be done as tile 0 has already been setup earlier with the
-	 * entire BAR mapped - see xe_mmio_probe_early()
-	 */
-	if (xe->info.tile_count == 1)
-		return;
-
 	for_each_remote_tile(tile, xe, id)
 		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);
 }
 
+/**
+ * xe_mmio_probe_tiles() - Initialize all tiles' MMIO
+ * @xe: the &xe_device
+ *
+ * Initialize the remaining tiles' MMIO instances.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_mmio_probe_tiles(struct xe_device *xe)
 {
 	size_t tile_mmio_size = SZ_16M;
 
+	/*
+	 * Nothing to be done as tile 0 has already been setup earlier with the
+	 * entire BAR mapped - see xe_mmio_probe_early()
+	 */
+	if (xe->info.tile_count == 1)
+		return 0;
+
+	if (xe->mmio.size < xe->info.tile_count * tile_mmio_size) {
+		xe_err(xe, "GTTMMADR_BAR is too small for %d tiles: %zu\n",
+		       xe->info.tile_count, xe->mmio.size);
+		return -EIO;
+	}
+
 	mmio_multi_tile_setup(xe, tile_mmio_size);
 	return 0;
 }
-- 
2.47.1

