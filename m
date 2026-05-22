Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653CCCD5BB4
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2868A10F5D7;
	Fri, 22 May 2026 14:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnotUuZy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C4910E60E
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779460291; x=1810996291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=waAIQb1yDhDAUqAjQq9zmyiGqUA8vrdpp0ZEpo7m62M=;
 b=HnotUuZy2JXlvptAwVD1StTzm+qlIbpuPO71ekAqgjgm/vlMggFprLco
 bAx75H/X0ZC0HGunnMd9BjzMRXjPzzzblgmsO4tOil7jBEGVoUuKmP+ne
 w6xwYJargFysUMesCE5pMeath2N7P2FBXA9kfUeLBiNH6odUbVjELEaNi
 V4QEzsjFftqNYY5VdLEjMAuAUBHjiMO91NaB9sG0AxEBUR3XKkVpR8fLe
 LBtxK7j9cgCV7P2qMwO4i/FHWRg24zEPKc/fvJrVXaqwMWya1UloCO8Or
 f30bZI5T0mwe3R0+iFP1yPSiriaYXyMZhAsuMjwW0poDwWdEK4dQ2bJxU A==;
X-CSE-ConnectionGUID: Og/wPD8IT0CIPd4Sxbp0Lg==
X-CSE-MsgGUID: 5LQgdWNTQFm66BolfaRzWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91861638"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91861638"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:31 -0700
X-CSE-ConnectionGUID: 5L1P3YdjR5WE7bY+4N+tYQ==
X-CSE-MsgGUID: mkA/XkQGRW2K00ZvhxkpFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240795117"
Received: from dmitriyo-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.81])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:31:28 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/4] drm/xe/mmio: Check MMIO BAR size when initializing tiles
Date: Fri, 22 May 2026 16:31:12 +0200
Message-ID: <20260522143112.10643-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522143112.10643-1-michal.wajdeczko@intel.com>
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
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
---
 drivers/gpu/drm/xe/xe_mmio.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7043289a0eb9..9a7d7fb4a334 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -47,21 +47,35 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
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
+		xe_err(xe, "GTTMMADR_BAR is too small for %d tiles: %zd\n",
+		       xe->info.tile_count, xe->mmio.size);
+		return -EIO;
+	}
+
 	mmio_multi_tile_setup(xe, tile_mmio_size);
 	return 0;
 }
-- 
2.47.1

