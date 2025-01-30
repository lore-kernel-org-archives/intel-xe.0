Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C73FC02190
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 10:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D9810E931;
	Thu, 30 Jan 2025 10:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfxJauLI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDC810E92E
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738234269; x=1769770269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rpa0AP7peFneGXDtQSdfpB37GRaM14W/RiFk1fIQor8=;
 b=dfxJauLIbIRDng6o72YKek7dsTKNQu1dNBc+x3mcmQfoPka9AzcRxrdF
 /vVdFOTaTVaZfil3aisLdReICh/KG+TdugBfQGOg0SnX3g3Vz69PDsA6q
 CLeGElsG5Lker0+jKx6x4oEouogsXNfBeCWmIKp27eNabIbfucmISLTB2
 UoWME2jWV2FY5MPZU/P02YPcPR8TlrgiorPZEBIuehvTN9P1D5OD1055h
 WTDBdWaFQlwC4r894LpN5BkCXh8KB0RpFsTgrj13Kd4jCY/XtqbFmjXxl
 1FPcxrFjjREAf2fphBL74+sxxzo8P4d8PID3ZQDK9Gy34PEXbZ3XcMVHz A==;
X-CSE-ConnectionGUID: lDoxBQYLRWicz6JN3wy3+Q==
X-CSE-MsgGUID: PTuYCe5RTsC6MD+ITjDTHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="42525840"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="42525840"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:51:08 -0800
X-CSE-ConnectionGUID: JI2uevbXRnuCfloP1HcBnw==
X-CSE-MsgGUID: j+2LU7kHQwmhvhCUoYML5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109887850"
Received: from unknown (HELO ilevi-mobl.intel.com) ([10.13.220.96])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 02:51:06 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, matthew.d.roper@intel.com, lucas.demarchi@intel.com,
 koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH 2/2] drm/xe: Add xe_mmio_init() initialization function
Date: Thu, 30 Jan 2025 12:50:57 +0200
Message-Id: <20250130105057.136586-2-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130105057.136586-1-ilia.levi@intel.com>
References: <20250130105057.136586-1-ilia.levi@intel.com>
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

Add a convenience function for minimal initialization of struct xe_mmio.
This function also validates that the space referred by this xe_mmio is
small enough to be accessed with struct xe_reg.

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h |  4 +++-
 drivers/gpu/drm/xe/xe_gt.c            |  7 +++----
 drivers/gpu/drm/xe/xe_mmio.c          | 24 +++++++++++++-----------
 drivers/gpu/drm/xe/xe_mmio.h          |  2 ++
 4 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 89716172fbb8..26d00d825454 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -10,6 +10,8 @@
 
 #include "compat-i915-headers/i915_reg_defs.h"
 
+#define XE_REG_ADDR_WIDTH	22
+
 /**
  * struct xe_reg - Register definition
  *
@@ -21,7 +23,7 @@ struct xe_reg {
 	union {
 		struct {
 			/** @addr: address */
-			u32 addr:22;
+			u32 addr:XE_REG_ADDR_WIDTH;
 			/**
 			 * @masked: register is "masked", with upper 16bits used
 			 * to identify the bits that are updated on the lower
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 01a4a852b8f4..f10c1f5fbbe1 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -637,10 +637,9 @@ int xe_gt_init(struct xe_gt *gt)
 void xe_gt_mmio_init(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = tile_to_xe(tile);
 
-	gt->mmio.regs = tile->mmio.regs;
-	gt->mmio.regs_size = tile->mmio.regs_size;
-	gt->mmio.tile = tile;
+	xe_mmio_init(&gt->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
 
 	if (gt->info.type == XE_GT_TYPE_MEDIA) {
 		gt->mmio.adj_offset = MEDIA_GT_GSI_OFFSET;
@@ -650,7 +649,7 @@ void xe_gt_mmio_init(struct xe_gt *gt)
 		gt->mmio.adj_limit = 0;
 	}
 
-	if (IS_SRIOV_VF(gt_to_xe(gt)))
+	if (IS_SRIOV_VF(xe))
 		gt->mmio.sriov_vf_gt = gt;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3aed849a128b..8cee986947bc 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -55,7 +55,6 @@ static void tiles_fini(void *arg)
 static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 {
 	struct xe_tile *tile;
-	void __iomem *regs;
 	u8 id;
 
 	/*
@@ -94,13 +93,8 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
 		}
 	}
 
-	regs = xe->mmio.regs;
-	for_each_tile(tile, xe, id) {
-		tile->mmio.regs_size = SZ_4M;
-		tile->mmio.regs = regs;
-		tile->mmio.tile = tile;
-		regs += tile_mmio_size;
-	}
+	for_each_remote_tile(tile, xe, id)
+		xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * tile_mmio_size, SZ_4M);
 }
 
 int xe_mmio_probe_tiles(struct xe_device *xe)
@@ -140,13 +134,21 @@ int xe_mmio_probe_early(struct xe_device *xe)
 	}
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
-	root_tile->mmio.regs_size = SZ_4M;
-	root_tile->mmio.regs = xe->mmio.regs;
-	root_tile->mmio.tile = root_tile;
+	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
 
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
 
+void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size)
+{
+	/* Validate that we can use XE_REG macro with this xe_mmio later */
+	xe_assert(tile_to_xe(tile), size <= (1 << (XE_REG_ADDR_WIDTH + 1)));
+
+	mmio->regs = ptr;
+	mmio->regs_size = size;
+	mmio->tile = tile;
+}
+
 static void mmio_flush_pending_writes(struct xe_mmio *mmio)
 {
 #define DUMMY_REG_OFFSET	0x130030
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index b32e7ee4b23e..c151ba569003 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -14,6 +14,8 @@ struct xe_reg;
 int xe_mmio_probe_early(struct xe_device *xe);
 int xe_mmio_probe_tiles(struct xe_device *xe);
 
+void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size);
+
 u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg);
 u16 xe_mmio_read16(struct xe_mmio *mmio, struct xe_reg reg);
 void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val);
-- 
2.43.2

