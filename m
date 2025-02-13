Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8193C021A4
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 09:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CC510E2B3;
	Thu, 13 Feb 2025 09:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8CVZjMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEFF10E2B3
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 09:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739439369; x=1770975369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u0vw+11oyJBKYGFfWZsVG2nnDQZ/QCYl/DciNbBn6Tw=;
 b=N8CVZjMjjUirXbcl46vfo4NPMrwxGNuZ75nYtbbvFLgFK4HRgSZP3oUG
 SNPOmEEjtg2YZ2VESoVw0zXpdgcW3f4hRWo7/sn5Tw30v2o8iSvr87EcH
 PJCL5ubvy0/hN0cy0ilmBvhDqiSfEwPmsjd3eRFFA5G3xkmpIqPhJn4Gh
 VMEBX9ib8Wo5AbzG57fHasxkeQGHkowkSMoN2tywW56ZJeqQ9EDbymMim
 6EtL2wTZ30rWvN5ZLdUwUJzzDqCh674HBJuMa8CCSXf5upygL55NYezCg
 yIgAPZLc5XbtfENEl44bXYfAGAyckZjHmNPb8bdfaa3DjYbwM+ABUWxRL g==;
X-CSE-ConnectionGUID: 8gEFHZmOQVukTAdcjLhJ3A==
X-CSE-MsgGUID: vDkN9jD9TkGVnplzfxG3qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51527052"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="51527052"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 01:36:09 -0800
X-CSE-ConnectionGUID: cAT4L0ZeRnSepllTuedxjA==
X-CSE-MsgGUID: aPKh4oa3QoK1wNTaosrJpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113618906"
Received: from ilevi-mobl.ger.corp.intel.com (HELO ilevi-mobl.intel.com)
 ([10.245.180.66])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 01:36:06 -0800
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: [PATCH v4 2/2] drm/xe: Add xe_mmio_init() initialization function
Date: Thu, 13 Feb 2025 11:35:59 +0200
Message-Id: <20250213093559.204652-1-ilia.levi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4ac54f6e-eed7-4f77-ad13-68ef6c078180@intel.com>
References: <4ac54f6e-eed7-4f77-ad13-68ef6c078180@intel.com>
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
This function also validates that the entirety of the provided mmio region
is usable with struct xe_reg.

v2: Modify commit message, add kernel doc, refactor assert (Michal)
v3: Fix off-by-one bug, add clarifying macro (Michal)
v4: Derive bitfield width from size (Michal)

Signed-off-by: Ilia Levi <ilia.levi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 14 +++++++++++-
 drivers/gpu/drm/xe/xe_gt.c            |  7 +++---
 drivers/gpu/drm/xe/xe_mmio.c          | 32 ++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_mmio.h          |  2 ++
 4 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index 89716172fbb8..c39aab843e35 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -7,9 +7,21 @@
 #define _XE_REG_DEFS_H_
 
 #include <linux/build_bug.h>
+#include <linux/log2.h>
+#include <linux/sizes.h>
 
 #include "compat-i915-headers/i915_reg_defs.h"
 
+/**
+ * XE_REG_ADDR_MAX - The upper limit on MMIO register address
+ *
+ * This macro specifies the upper limit (not inclusive) on MMIO register offset
+ * supported by struct xe_reg and functions based on struct xe_mmio.
+ *
+ * Currently this is defined as 4 MiB.
+ */
+#define XE_REG_ADDR_MAX	SZ_4M
+
 /**
  * struct xe_reg - Register definition
  *
@@ -21,7 +33,7 @@ struct xe_reg {
 	union {
 		struct {
 			/** @addr: address */
-			u32 addr:22;
+			u32 addr:const_ilog2(XE_REG_ADDR_MAX);
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
index 3aed849a128b..70a36e777546 100644
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
@@ -140,13 +134,29 @@ int xe_mmio_probe_early(struct xe_device *xe)
 	}
 
 	/* Setup first tile; other tiles (if present) will be setup later. */
-	root_tile->mmio.regs_size = SZ_4M;
-	root_tile->mmio.regs = xe->mmio.regs;
-	root_tile->mmio.tile = root_tile;
+	xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
 
 	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
 }
 
+/**
+ * xe_mmio_init() - Initialize an MMIO instance
+ * @mmio: Pointer to the MMIO instance to initialize
+ * @tile: The tile to which the MMIO region belongs
+ * @ptr: Pointer to the start of the MMIO region
+ * @size: The size of the MMIO region in bytes
+ *
+ * This is a convenience function for minimal initialization of struct xe_mmio.
+ */
+void xe_mmio_init(struct xe_mmio *mmio, struct xe_tile *tile, void __iomem *ptr, u32 size)
+{
+	xe_tile_assert(tile, size <= XE_REG_ADDR_MAX);
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

