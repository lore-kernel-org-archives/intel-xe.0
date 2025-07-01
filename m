Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EE2C83F05
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 20:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6252A10E655;
	Tue,  1 Jul 2025 20:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2cDbj/W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC2310E616
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751400812; x=1782936812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EjXVqx9/0vDQO1MF3bMyhGhh7kHAuHxdqmflhfzgb1g=;
 b=n2cDbj/W6t6T42JrSOSkEg3OgaJnCpHH1Lf7rEUGjna2js/KfTeePrHT
 Bwfb0UWkr2leVpBBwmd9hZTz9qQ7dIL2UmTemHmQyYBrihqWQCJhMAxjy
 55oQSfIxBVo8GpCh9m+jpoAG3O0HVlqFvGb0/DZ1F15dvgmrZnoGs8UqS
 nDO711MLbZcw+Rd8GZ3M/RP2rUaLmpwAFxZSyb8vJ8+cfOb2NJUqywUTy
 HFfwWQKypv99oSsQXTf5tQjAScA2vYOMb1ZWpGbQPgScgn+MDMDJBCXC2
 uxm68ARs7DsLAxpvwVEIPLQByqz8j9wry4ZmjmGfQrOvRyjxq23wg0klr A==;
X-CSE-ConnectionGUID: x+vv2WgGRpyouL4TFfaB5g==
X-CSE-MsgGUID: 39FcIRHkRuSe9T3Fd1qWkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53545996"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53545996"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:32 -0700
X-CSE-ConnectionGUID: nq+MSdmLQHqKJDT8jrUWJg==
X-CSE-MsgGUID: gXMe08dvShmk4t6Qyn2zMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177539680"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Subject: [PATCH v4 5/7] drm/xe: Assign GT IDs properly on multi-tile +
 multi-GT platforms
Date: Tue,  1 Jul 2025 13:13:26 -0700
Message-ID: <20250701201320.2514369-14-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201320.2514369-9-matthew.d.roper@intel.com>
References: <20250701201320.2514369-9-matthew.d.roper@intel.com>
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

Although "multi-tile" and "multiple GTs per tile" are mutually-exclusive
characteristics on all of our platforms today, this may not always be
true.  Assign GT IDs according to xe->info.max_gt_per_tile in a way that
should work even if future platforms have different configurations.

This patch should not change the behavior of current platforms; it only
future-proofs for potential future designs.

v2:
 - Re-calculate gt_count if tile count gets reduced by MTCFG.  (PVC CI)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Ravi Kumar Vodapalli<ravi.kumar.vodapalli@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 16 ++++++++++------
 drivers/gpu/drm/xe/xe_pci.c  | 14 ++++----------
 2 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 7357458bc0d2..751586d6806a 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -55,6 +55,7 @@ static void tiles_fini(void *arg)
 static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 {
 	struct xe_tile *tile;
+	struct xe_gt *gt;
 	u8 id;
 
 	/*
@@ -67,7 +68,7 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 	/* Possibly override number of tile based on configuration register */
 	if (!xe->info.skip_mtcfg) {
 		struct xe_mmio *mmio = xe_root_tile_mmio(xe);
-		u8 tile_count;
+		u8 tile_count, gt_count;
 		u32 mtcfg;
 
 		/*
@@ -84,12 +85,15 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 			xe->info.tile_count = tile_count;
 
 			/*
-			 * FIXME: Needs some work for standalone media, but
-			 * should be impossible with multi-tile for now:
-			 * multi-tile platform with standalone media doesn't
-			 * exist
+			 * We've already setup gt_count according to the full
+			 * tile count.  Re-calculate it to only include the GTs
+			 * that belong to the remaining tile(s).
 			 */
-			xe->info.gt_count = xe->info.tile_count;
+			gt_count = 0;
+			for_each_gt(gt, xe, id)
+				if (gt->info.id < tile_count * xe->info.max_gt_per_tile)
+					gt_count++;
+			xe->info.gt_count = gt_count;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 658bfbddf9a8..bccd81e19bb0 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -694,10 +694,11 @@ static int xe_info_init(struct xe_device *xe,
 	 */
 	for_each_tile(tile, xe, id) {
 		gt = tile->primary_gt;
-		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
+		gt->info.id = tile->id * xe->info.max_gt_per_tile;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
+		xe->info.gt_count++;
 
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
@@ -715,17 +716,10 @@ static int xe_info_init(struct xe_device *xe,
 
 		gt = tile->media_gt;
 		gt->info.type = XE_GT_TYPE_MEDIA;
+		gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
 		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
 		gt->info.engine_mask = media_desc->hw_engine_mask;
-
-		/*
-		 * FIXME: At the moment multi-tile and standalone media are
-		 * mutually exclusive on current platforms.  We'll need to
-		 * come up with a better way to number GTs if we ever wind
-		 * up with platforms that support both together.
-		 */
-		drm_WARN_ON(&xe->drm, id != 0);
-		gt->info.id = xe->info.gt_count++;
+		xe->info.gt_count++;
 	}
 
 	return 0;
-- 
2.49.0

