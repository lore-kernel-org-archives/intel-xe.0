Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B819CCD18F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:26:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A5110E67E;
	Tue,  7 Oct 2025 11:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTibx7EL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E3A10E671
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759836409; x=1791372409;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KM6EpHk0PlzQx3ZaX52HmuJaEnCbYZ49tOIuckabhN0=;
 b=hTibx7EL7L5GXgBJXxfEBUT7xeRysr8uGBRNYN1AonRc1SiLTz+qSWVH
 iJeuLMGqZqZa71W0EGAZOZX+aBoZCzbeKeJ6WrFMQ3HjzpsR/EN4J9jiW
 rttdXXOGNmAgp9ROqWjjTHsflvlPTauiKrl9iFbSiVkwuMCLIe9T6RJU9
 TDEw92adMiQLthGKCVTNKhr+z7sHv7RTnRqjGaHIuueVCAH2y6aW45jF/
 HtziRT9EYlxXdfM81NL3/VpYqWVu2deEM18gXftSxuLPR1UxOC2hJ3k3r
 cuynXbWGXHqRQXQgzOVEsf0E4dZnrNXZ0+UGRa6DpHwxwgTe0w+cS6LJ9 A==;
X-CSE-ConnectionGUID: 3ie742tqSl+wQkajg7deOg==
X-CSE-MsgGUID: WN/Ttna1S+S9bQSeD5rktA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="65660681"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="65660681"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:49 -0700
X-CSE-ConnectionGUID: mHawmvKBSd2ek5miS9I9HQ==
X-CSE-MsgGUID: vcNYhJhkTj2S35ijuuBgTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180923999"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 04:26:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 12/32] drm/xe/vf: Close multi-GT GGTT shift race
Date: Tue,  7 Oct 2025 04:26:21 -0700
Message-Id: <20251007112641.2669655-13-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
References: <20251007112641.2669655-1-matthew.brost@intel.com>
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

As multi-GT VF post-migration recovery can run in parallel on different
workqueues, but both GTs point to the same GGTT, only one GT needs to
shift the GGTT. However, both GTs need to know when this step has
completed. To coordinate this, perform the GGTT shift under the GGTT
lock. With shift being done under the lock, storing the shift value
becomes unnecessary.

v3:
 - Update commmit message (Tomasz)
v4:
 - Move GGTT values to tile state (Michal)
 - Use GGTT lock (Michal)
v5:
 - Only take GGTT lock during recovery (CI)
 - Drop goto in vf_get_submission_cfg (Michal)
 - Add kernel doc around recovery in xe_gt_sriov_vf_query_config (Michal)
v7:
 - Drop recovery variable (Michal)
 - Use _locked naming (Michal)
 - Use guard (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h        |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 128 ++++++--------------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   3 -
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |   7 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       |  34 ++++--
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   4 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |  23 ++++
 drivers/gpu/drm/xe/xe_vram.c                |   6 +-
 8 files changed, 95 insertions(+), 113 deletions(-)
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
index 31a80d77da36..6f0bc6225fd3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -438,13 +438,18 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 
 static int vf_get_ggtt_info(struct xe_gt *gt)
 {
-	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	struct xe_guc *guc = &gt->uc.guc;
 	u64 start, size;
+	s64 shift;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	guard(mutex)(&ggtt->lock);
+
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
 	if (unlikely(err))
 		return err;
@@ -462,16 +467,24 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
 				start, start + size - 1, size / SZ_1K);
 
-	config->ggtt_shift = start - (s64)config->ggtt_base;
+	shift = start - (s64)config->ggtt_base;
 	config->ggtt_base = start;
 	config->ggtt_size = size;
+	err = config->ggtt_size ? 0 : -ENODATA;
+
+	if (!err && shift && shift != start) {
+		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
+				 shift, config->ggtt_base);
+		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
+	}
 
-	return config->ggtt_size ? 0 : -ENODATA;
+	return err;
 }
 
 static int vf_get_lmem_info(struct xe_gt *gt)
 {
-	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	struct xe_tile_sriov_vf_selfconfig *config =
+		&gt_to_tile(gt)->sriov.vf.self_config;
 	struct xe_guc *guc = &gt->uc.guc;
 	char size_str[10];
 	u64 size;
@@ -545,7 +558,9 @@ static void vf_cache_gmdid(struct xe_gt *gt)
  * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
  * @gt: the &xe_gt
  *
- * This function is for VF use only.
+ * This function is for VF use only. This function may shift the GGTT and is
+ * performed under GGTT lock, making this step visible to all GTs that share a
+ * GGTT.
  *
  * Return: 0 on success or a negative error code on failure.
  */
@@ -584,80 +599,16 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
  */
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 {
-	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
-
-	return gt->sriov.vf.self_config.num_ctxs;
-}
-
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
-/**
- * xe_gt_sriov_vf_ggtt - VF GGTT configuration.
- * @gt: the &xe_gt
- *
- * This function is for VF use only.
- *
- * Return: size of the GGTT assigned to VF.
- */
-u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
-{
-	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
-
-	return gt->sriov.vf.self_config.ggtt_size;
-}
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	u16 val;
 
-/**
- * xe_gt_sriov_vf_ggtt_base - VF GGTT base offset.
- * @gt: the &xe_gt
- *
- * This function is for VF use only.
- *
- * Return: base offset of the GGTT assigned to VF.
- */
-u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
-{
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
 
-	return gt->sriov.vf.self_config.ggtt_base;
-}
+	xe_gt_assert(gt, config->num_ctxs);
+	val = config->num_ctxs;
 
-/**
- * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
- * @gt: the &xe_gt struct instance
- *
- * This function is for VF use only.
- *
- * Return: The shift value; could be negative
- */
-s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
-{
-	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
-
-	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, xe_gt_is_main_type(gt));
-
-	return config->ggtt_shift;
+	return val;
 }
 
 static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
@@ -1057,6 +1008,8 @@ void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
  */
 void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 {
+	struct xe_tile_sriov_vf_selfconfig *tconfig =
+		&gt_to_tile(gt)->sriov.vf.self_config;
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
 	struct xe_device *xe = gt_to_xe(gt);
 	char buf[10];
@@ -1064,17 +1017,15 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
 	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
-		   config->ggtt_base,
-		   config->ggtt_base + config->ggtt_size - 1);
-
-	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
-	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
+		   tconfig->ggtt_base,
+		   tconfig->ggtt_base + tconfig->ggtt_size - 1);
 
-	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
+	string_get_size(tconfig->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
+	drm_printf(p, "GGTT size:\t%llu (%s)\n", tconfig->ggtt_size, buf);
 
 	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
-		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
+		string_get_size(tconfig->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		drm_printf(p, "LMEM size:\t%llu (%s)\n", tconfig->lmem_size, buf);
 	}
 
 	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
@@ -1161,21 +1112,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
 	void *buf = gt->sriov.vf.migration.scratch;
-	s64 shift;
 	int err;
 
 	err = xe_gt_sriov_vf_query_config(gt);
 	if (err)
 		return err;
 
-	shift = xe_gt_sriov_vf_ggtt_shift(gt);
-	if (shift) {
-		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
-		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
-		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
-		if (err)
-			return err;
-	}
+	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
+	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
+	if (err)
+		return err;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 0adebf8aa419..2eb793a2d8ba 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -29,9 +29,6 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
 u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
 u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
-u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
-u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
-s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index e753646debc4..1796d4caf62f 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_GT_SRIOV_VF_TYPES_H_
 #define _XE_GT_SRIOV_VF_TYPES_H_
 
+#include <linux/rwsem.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 #include "xe_uc_fw_types.h"
@@ -14,12 +15,6 @@
  * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
  */
 struct xe_gt_sriov_vf_selfconfig {
-	/** @ggtt_base: assigned base offset of the GGTT region. */
-	u64 ggtt_base;
-	/** @ggtt_size: assigned size of the GGTT region. */
-	u64 ggtt_size;
-	/** @ggtt_shift: difference in ggtt_base on last migration */
-	s64 ggtt_shift;
 	/** @lmem_size: assigned size of the LMEM. */
 	u64 lmem_size;
 	/** @num_ctxs: assigned number of GuC submission context IDs. */
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
index f221dbed16f0..7417a3aa7f9b 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
@@ -9,7 +9,6 @@
 
 #include "xe_assert.h"
 #include "xe_ggtt.h"
-#include "xe_gt_sriov_vf.h"
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
 #include "xe_tile_sriov_vf.h"
@@ -40,10 +39,10 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
+static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
 {
-	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
-	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
+	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
+	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
 	struct xe_device *xe = tile_to_xe(tile);
 	u64 wopcm = xe_wopcm_size(xe);
 	u64 start, end;
@@ -232,7 +231,7 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
  */
 
 /**
- * xe_tile_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
+ * xe_tile_sriov_vf_fixup_ggtt_nodes_locked - Shift GGTT allocations to match assigned range.
  * @tile: the &xe_tile struct instance
  * @shift: the shift value
  *
@@ -240,15 +239,34 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
  * within the global space. This range might have changed during migration,
  * which requires all memory addresses pointing to GGTT to be shifted.
  */
-void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
+void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift)
 {
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
-	mutex_lock(&ggtt->lock);
+	lockdep_assert_held(&ggtt->lock);
 
 	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
 	xe_ggtt_shift_nodes_locked(ggtt, shift);
 	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
+}
 
-	mutex_unlock(&ggtt->lock);
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
+	u64 val;
+
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+
+	xe_tile_assert(tile, config->lmem_size);
+	val = config->lmem_size;
+
+	return val;
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
index 93eb043171e8..dd6d3b315095 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
@@ -11,8 +11,8 @@
 struct xe_tile;
 
 int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
-int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
 void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
-void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
+void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
+u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
new file mode 100644
index 000000000000..140717f81d8f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
@@ -0,0 +1,23 @@
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
+	/** @ggtt_base: assigned base offset of the GGTT region. */
+	u64 ggtt_base;
+	/** @ggtt_size: assigned size of the GGTT region. */
+	u64 ggtt_size;
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

