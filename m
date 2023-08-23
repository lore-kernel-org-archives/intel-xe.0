Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90121EE49AF
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 00:33:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4928B10E0A6;
	Wed, 23 Aug 2023 00:33:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF0310E0A6
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 00:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692750803; x=1724286803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yw8pL+UPtu1boOvRpshhNvMSoMY3iEVpBGhDk3YfBew=;
 b=Oo6U3Y1P3QHx3iTtmbyCwKHm5fAKW/xr2fEC1Ppv8RC6VWpna2iiwxkh
 kbeqHjiUF8MvbKGV2tZYoQK2Vmf5ZMKwUDAXvYS3QsL3UoxXI98QMQxFq
 iMnNh+ZdNChUim6DAcUEpSxxah4Wmv9BE7vTC5ILUE2S7T9pGrsnZi6ma
 /PYI+Jca7ZkoNEDbDPCeRcdYJVQ0qU0yUOjGzkGA+bGJDT04V2OP8Zv3J
 CPy1VaIathxHgpqzkb618bJylK/Vmr73Pbml/z3ZyteDJ336pI/mj8ijb
 TXiyRr7GLAl15xeQmECMaTDJg4+hSzR7Np0LdDwHiQDUC5Az3TybSp+ok w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372915053"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="372915053"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 17:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880182478"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 17:33:27 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 22 Aug 2023 17:33:13 -0700
Message-ID: <20230823003312.1356779-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/2] drm/xe: Avoid 64-bit register reads
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
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

v2:
 - Move function from xe_mmio.h to xe_mmio.c.  (Lucas)
 - Convert comment to kerneldoc and note that it shouldn't be used on
   registers where reads may trigger side effects.  (Lucas)

Bspec: 60027
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c           | 56 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_mmio.h           | 12 +-----
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  6 +--
 3 files changed, 58 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index bb6823db14d4..c2ec52eefb2e 100644
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
@@ -526,3 +526,53 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 
 	return ret;
 }
+
+/**
+ * xe_mmio_read64_2x32() - Read a 64-bit register as two 32-bit reads
+ * @gt: MMIO target GT
+ * @reg: register to read value from
+ *
+ * Although Intel GPUs have some 64-bit registers, the hardware officially
+ * only supports GTTMMADR register reads of 32 bits or smaller.  Even if
+ * a readq operation may return a reasonable value, that violation of the
+ * spec shouldn't be relied upon and all 64-bit register reads should be
+ * performed as two 32-bit reads of the upper and lower dwords.
+ *
+ * When reading registers that may be changing (such as
+ * counters), a rollover of the lower dword between the two 32-bit reads
+ * can be problematic.  This function attempts to ensure the upper dword has
+ * stabilized before returning the 64-bit value.
+ *
+ * Note that because this function may re-read the register multiple times
+ * while waiting for the value to stabilize it should not be used to read
+ * any registers where read operations have side effects.
+ *
+ * Returns the value of the 64-bit register.
+ */
+u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_reg reg_udw = { .addr = reg.addr + 0x4 };
+	u32 ldw, udw, oldudw, retries;
+
+	if (reg.addr < gt->mmio.adj_limit) {
+		reg.addr += gt->mmio.adj_offset;
+		reg_udw.addr += gt->mmio.adj_offset;
+	}
+
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
+}
+
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index d24badca8677..f72c34c7d1d0 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -11,6 +11,7 @@
 
 #include "regs/xe_reg_defs.h"
 #include "xe_device_types.h"
+#include "xe_gt_printk.h"
 #include "xe_gt_types.h"
 
 struct drm_device;
@@ -85,16 +86,6 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
 	writeq(val, tile->mmio.regs + reg.addr);
 }
 
-static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
-{
-	struct xe_tile *tile = gt_to_tile(gt);
-
-	if (reg.addr < gt->mmio.adj_limit)
-		reg.addr += gt->mmio.adj_offset;
-
-	return readq(tile->mmio.regs + reg.addr);
-}
-
 static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
 					     struct xe_reg reg, u32 val,
 					     u32 mask, u32 eval)
@@ -155,5 +146,6 @@ static inline bool xe_mmio_in_range(const struct xe_mmio_range *range,
 
 int xe_mmio_probe_vram(struct xe_device *xe);
 int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size, u64 *tile_base);
+u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
 
 #endif
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

