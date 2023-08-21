Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF16EE4996
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 23:43:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B673E10E122;
	Mon, 21 Aug 2023 23:43:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A50B10E122
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 23:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692661410; x=1724197410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6oy3/6dF/l2/EsRX2bLc92bAsrQ4drAdiU6+JSzc7vg=;
 b=kXM0RUTMim5/8eG7pSi6VjNZHOw8YORZg89oFSH2roIr7KSMpL2u48gm
 wZNiVz3Q3eAZh0qmUOCi2gctjUeuvcfPeUCUZrSQrD9bj32kYEq0Ma0aW
 Q9800preGiP6fqJ9no1XsoJIEOgoN1QXLqRZgyzVnmuiqTAOYAzOw9s40
 p+Ai4bkuIy0SN6sfQyminOsrzowAUW6Mwm+vusV175uz+NhAHxdKi/e8H
 2rdqmkimD/4qcFstivOd3feFs6wG635OdVbwKLvH9y75Xxsnw6a2i/J/w
 fwr2nHLO9jL5xYiI42nKd4H+Dm8jkQ/2Zx7FefIeDftBDI7n3mRWX0X4T g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376467005"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; d="scan'208";a="376467005"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 16:43:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826118342"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; d="scan'208";a="826118342"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 16:43:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 21 Aug 2023 16:43:23 -0700
Message-ID: <20230821234322.758689-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Avoid 64-bit register reads
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Intel hardware officially only supports GTTMMADR register accesses of
32-bits or less (although 64-bit accesses to device memory and PTEs in
the GSM are fine).  Even though we do usually seem to get back
reasonable values when performing readq() operations on registers in
BAR0, we shouldn't rely on this violation of the spec working
consistently.  It's likely that even when we do get proper register
values back the hardware is internally satisfying the request via a
non-atomic sequence of two 32-bit reads, which can be problematic for
timestamps and counters if rollover of the lower bits is not considered.

Replace xe_mmio_read64() with xe_mmio_read64_2x32() that implements
64-bit register reads as two 32-bit reads and attempts to ensure that
the upper dword has stabilized to avoid problematic rollovers for
counter and timestamp registers.

Bspec: 60027
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c           |  6 ++---
 drivers/gpu/drm/xe/xe_mmio.h           | 37 +++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  6 ++---
 3 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index bb6823db14d4..932aa4ca59c8 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -228,7 +228,7 @@ int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size,
 		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
 		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
 	} else {
-		offset = xe_mmio_read64(gt, GSMBASE);
+		offset = xe_mmio_read64_2x32(gt, GSMBASE);
 	}
 
 	/* remove the tile offset so we have just the available size */
@@ -326,7 +326,7 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	if (xe->info.tile_count == 1)
 		return;
 
-	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
+	mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
 	adj_tile_count = xe->info.tile_count =
 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
 
@@ -509,7 +509,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 			args->value = xe_mmio_read32(gt, reg);
 			break;
 		case DRM_XE_MMIO_64BIT:
-			args->value = xe_mmio_read64(gt, reg);
+			args->value = xe_mmio_read64_2x32(gt, reg);
 			break;
 		default:
 			drm_dbg(&xe->drm, "Invalid MMIO bit size");
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index d24badca8677..892e96e50463 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -11,6 +11,7 @@
 
 #include "regs/xe_reg_defs.h"
 #include "xe_device_types.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 
 struct drm_device;
@@ -85,14 +86,42 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
 	writeq(val, tile->mmio.regs + reg.addr);
 }
 
-static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
+/*
+ * Intel hardware officially only supports GTTMMADR register reads of 32 bits
+ * or smaller.  Although we often seem to get reasonable values back from a
+ * readq of a register address, we shouldn't rely on this violation of the
+ * spec.  Furthermore, when reading registers that may be changing (such as
+ * counters), the hardware may not perform the read atomically, leading to
+ * problems if the read happens while the lower dword is rolling over.
+ *
+ * Implement 64-bit register reads as a pair of 32-bit reads and ensure the
+ * upper dword has stabilized before returning a value.
+ */
+static inline u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
 {
-	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
+	u32 ldw, udw, oldudw, retries;
 
-	if (reg.addr < gt->mmio.adj_limit)
+	if (reg.addr < gt->mmio.adj_limit) {
 		reg.addr += gt->mmio.adj_offset;
+		reg_udw.addr += gt->mmio.adj_offset;
+	}
 
-	return readq(tile->mmio.regs + reg.addr);
+	oldudw = xe_mmio_read32(gt, reg_udw);
+	for (retries = 5; retries; --retries) {
+		ldw = xe_mmio_read32(gt, reg);
+		udw = xe_mmio_read32(gt, reg_udw);
+
+		if (udw == oldudw)
+			break;
+
+		oldudw = udw;
+	}
+
+	xe_gt_WARN(gt, retries == 0,
+		   "64-bit read of %#x did not stabilize\n", reg.addr);
+
+	return (u64)udw << 32 | ldw;
 }
 
 static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index be0a25e23929..6ba6b1b7f34b 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -67,7 +67,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	}
 
 	/* Use DSM base address instead for stolen memory */
-	mgr->stolen_base = (xe_mmio_read64(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
+	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
 	if (drm_WARN_ON(&xe->drm, tile_size < mgr->stolen_base))
 		return 0;
 
@@ -126,8 +126,8 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
 
 	/* Carve out the top of DSM as it contains the reserved WOPCM region */
 	wopcm_size = REG_FIELD_GET64(WOPCM_SIZE_MASK,
-				     xe_mmio_read64(xe_root_mmio_gt(xe),
-						    STOLEN_RESERVED));
+				     xe_mmio_read64_2x32(xe_root_mmio_gt(xe),
+							 STOLEN_RESERVED));
 	stolen_size -= (1U << wopcm_size) * SZ_1M;
 
 	if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(pdev, 2)))
-- 
2.41.0

