Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C6CCCD197
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD3010E89D;
	Wed,  8 Oct 2025 18:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7s3/R6t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027B410E886
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946709; x=1791482709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=03R6LRzCNHm1gkMOeiFHz6zck15DVjwmeeXkpG2a0/Q=;
 b=A7s3/R6tQMxPsQfzLATqpxZCVb4+gC+CIi9qBG2H2qSO5cTypULkNs7J
 MtwEm+TnH9FEw9j/WanKY6UqPXr2Bc0/UICKdrtl6SFlfe1RVj7412zeE
 AAvdR5UG621w0+HNVC5KE6lAN9idI/6O338WxLHwKhcU2H/Y0OSM53M26
 ni+uw4Zzbc12HfAkcVZWV++oyxq/Lv2OscluD0ydcOZV7AbmpG5K4V7Gb
 xXkamemTl48SOedTb+YrDjjTqeAYikAK1BfVi2W0ito65AX1a6H16r9Td
 YeUODJMei0ylL2AUxZOxbeWNV1lnjAMvPOcOUYXa4i/9Zs6j6ujbvEwJ3 A==;
X-CSE-ConnectionGUID: pR0go3wjRJuCDOcaFBYrDA==
X-CSE-MsgGUID: bw/1SFvFT9WDOdZICc5XVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067523"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067523"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: O2p708/XQOaiF9oqADfQvg==
X-CSE-MsgGUID: eo3afgrTQyS1+6mn2Q3GMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593730"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 13/34] drm/xe/vf: Move LMEM config to tile layer
Date: Wed,  8 Oct 2025 11:04:39 -0700
Message-Id: <20251008180500.3261209-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

The LMEM VF provision is tile-layer-specific information. Move the LMEM
configuration to the tile layer accordingly.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h        |  3 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 36 +++++++--------------
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |  2 --
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 33 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |  2 ++
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h | 19 +++++++++++
 drivers/gpu/drm/xe/xe_vram.c                |  6 ++--
 7 files changed, 71 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1d2718b70a5c..c66523bf4bf0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -27,6 +27,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_tile_sriov_vf_types.h"
 #include "xe_validation.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
@@ -193,6 +194,8 @@ struct xe_tile {
 		struct {
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
 			struct xe_ggtt_node *ggtt_balloon[2];
+			/** @sriov.vf.self_config: VF configuration data */
+			struct xe_tile_sriov_vf_selfconfig self_config;
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 31a80d77da36..6f3d9bc5ed22 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -471,10 +471,10 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 
 static int vf_get_lmem_info(struct xe_gt *gt)
 {
-	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_guc *guc = &gt->uc.guc;
 	char size_str[10];
-	u64 size;
+	u64 size, lmem_size;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
@@ -483,18 +483,19 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
-	if (config->lmem_size && config->lmem_size != size) {
+	lmem_size = xe_tile_sriov_vf_lmem(tile);
+	if (lmem_size && lmem_size != size) {
 		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
-				size / SZ_1M, config->lmem_size / SZ_1M);
+				size / SZ_1M, lmem_size / SZ_1M);
 		return -EREMCHG;
 	}
 
 	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
 	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
 
-	config->lmem_size = size;
+	xe_tile_sriov_vf_lmem_store(tile, size);
 
-	return config->lmem_size ? 0 : -ENODATA;
+	return size ? 0 : -ENODATA;
 }
 
 static int vf_get_submission_cfg(struct xe_gt *gt)
@@ -591,23 +592,6 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.num_ctxs;
 }
 
-/**
- * xe_gt_sriov_vf_lmem - VF LMEM configuration.
- * @gt: the &xe_gt
- *
- * This function is for VF use only.
- *
- * Return: size of the LMEM assigned to VF.
- */
-u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
-{
-	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt->sriov.vf.self_config.lmem_size);
-
-	return gt->sriov.vf.self_config.lmem_size;
-}
-
 /**
  * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
  * @gt: the &xe_gt
@@ -1059,6 +1043,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
 	struct xe_device *xe = gt_to_xe(gt);
+	u64 lmem_size;
 	char buf[10];
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
@@ -1072,9 +1057,10 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
 	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
 
+	lmem_size = xe_tile_sriov_vf_lmem(gt_to_tile(gt));
 	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
-		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
+		string_get_size(lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		drm_printf(p, "LMEM size:\t%llu (%s)\n", lmem_size, buf);
 	}
 
 	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index e753646debc4..aff76051c9bb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -20,8 +20,6 @@ struct xe_gt_sriov_vf_selfconfig {
 	u64 ggtt_size;
 	/** @ggtt_shift: difference in ggtt_base on last migration */
 	s64 ggtt_shift;
-	/** @lmem_size: assigned size of the LMEM. */
-	u64 lmem_size;
 	/** @num_ctxs: assigned number of GuC submission context IDs. */
 	u16 num_ctxs;
 	/** @num_dbs: assigned number of GuC doorbells IDs. */
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
index f221dbed16f0..02430a53da9f 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
@@ -252,3 +252,36 @@ void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
 
 	mutex_unlock(&ggtt->lock);
 }
+
+/**
+ * xe_tile_sriov_vf_lmem - VF LMEM configuration.
+ * @tile: the &xe_tile
+ *
+ * This function is for VF use only.
+ *
+ * Return: size of the LMEM assigned to VF.
+ */
+u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile)
+{
+	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
+
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+
+	return config->lmem_size;
+}
+
+/**
+ * xe_tile_sriov_vf_lmem_store - Store VF LMEM configuration
+ * @tile: the &xe_tile
+ * @lmem_size: VF LMEM size to store
+ *
+ * This function is for VF use only.
+ */
+void xe_tile_sriov_vf_lmem_store(struct xe_tile *tile, u64 lmem_size)
+{
+	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
+
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+
+	config->lmem_size = lmem_size;
+}
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
index 93eb043171e8..86d750a57530 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
@@ -14,5 +14,7 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
 int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
 void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
 void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
+u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile);
+void xe_tile_sriov_vf_lmem_store(struct xe_tile *tile, u64 lmem_size);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
new file mode 100644
index 000000000000..f49afa8338f1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_TILE_SRIOV_VF_TYPES_H_
+#define _XE_TILE_SRIOV_VF_TYPES_H_
+
+#include <linux/mutex.h>
+
+/**
+ * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
+ */
+struct xe_tile_sriov_vf_selfconfig {
+	/** @lmem_size: assigned size of the LMEM. */
+	u64 lmem_size;
+};
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 7adfccf68e4c..70bcbb188867 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -17,10 +17,10 @@
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
-#include "xe_gt_sriov_vf.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_tile_sriov_vf.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
@@ -238,9 +238,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
 		offset = 0;
 		for_each_tile(t, xe, id)
 			for_each_if(t->id < tile->id)
-				offset += xe_gt_sriov_vf_lmem(t->primary_gt);
+				offset += xe_tile_sriov_vf_lmem(t);
 
-		*tile_size = xe_gt_sriov_vf_lmem(gt);
+		*tile_size = xe_tile_sriov_vf_lmem(tile);
 		*vram_size = *tile_size;
 		*tile_offset = offset;
 
-- 
2.34.1

