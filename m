Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C9DCCD18C
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D52410E886;
	Wed,  8 Oct 2025 18:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZWeIHeNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F1510E88C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946709; x=1791482709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YzjgD9BFcODZjHB2ZfAv0Dj62RMGi5VOoG8F1d190YM=;
 b=ZWeIHeNVlb/R33rS4KCt2385b8ENZpuKEMvnhRRi4GSZ7tXkvZwPZVyY
 Syx1Yi+rCGhOkPhSmExTF3EfgbNAzo3HkSdSkco8VQ4JWHM+Cw8td/xUh
 MN+cnO96vZ+7V1JD42qaE9yprGyfiyTef2dyAMYvdUR0/egUvQvDtFvvh
 wyyP+33mDXl0hOY2qsH8pJ18vDyHimVmOiwOXLHUF0kFY86gL2c/VPxrm
 W9LX3ElnuBWLhh2joyty8dq0u9TIwkYfzS146NIBTanV+ehu0d4xBW5Mh
 0qvQbnV6rteK7vtkcNerw19xFNHRi19i+anYNV9aodRxilxKMeu+ewwU5 w==;
X-CSE-ConnectionGUID: 9VckEU5lRWCOXijJ02qZhw==
X-CSE-MsgGUID: HGYTudtIR9K7LWSI6a1jHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067524"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067524"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: H4C7vlEpTDCImXZRfG/2jg==
X-CSE-MsgGUID: ckSdkLY5Qlqu/hKA0yx+kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593731"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 14/34] drm/xe/vf: Close multi-GT GGTT shift race
Date: Wed,  8 Oct 2025 11:04:40 -0700
Message-Id: <20251008180500.3261209-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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

As multi-GT VF post-migration recovery can run in parallel on different
workqueues, but both GTs point to the same GGTT, only one GT needs to
shift the GGTT. However, both GTs need to know when this step has
completed. To coordinate this, perform the GGTT shift under the GGTT
lock. With shift being done under the lock, storing the shift value
becomes unnecessary.

In addition to above, move the GGTT VF config from the GT to the tile.

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
v9:
 - Break LMEM changes into different patch (Michal)
 - Fix layering (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 112 ++++++--------------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   3 -
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |   6 --
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       |  81 ++++++++++++--
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   7 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |   4 +
 6 files changed, 116 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 6f3d9bc5ed22..aeadeb29d5ea 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -438,13 +438,17 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 
 static int vf_get_ggtt_info(struct xe_gt *gt)
 {
-	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	struct xe_guc *guc = &gt->uc.guc;
-	u64 start, size;
+	u64 start, size, ggtt_size;
+	s64 shift;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	guard(mutex)(&ggtt->lock);
+
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
 	if (unlikely(err))
 		return err;
@@ -453,20 +457,28 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	if (unlikely(err))
 		return err;
 
-	if (config->ggtt_size && config->ggtt_size != size) {
+	ggtt_size = xe_tile_sriov_vf_ggtt(tile);
+	if (ggtt_size && ggtt_size != size) {
 		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
-				size / SZ_1K, config->ggtt_size / SZ_1K);
+				size / SZ_1K, ggtt_size / SZ_1K);
 		return -EREMCHG;
 	}
 
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
 				start, start + size - 1, size / SZ_1K);
 
-	config->ggtt_shift = start - (s64)config->ggtt_base;
-	config->ggtt_base = start;
-	config->ggtt_size = size;
+	shift = start - (s64)xe_tile_sriov_vf_ggtt_base(tile);
+	xe_tile_sriov_vf_ggtt_base_store(tile, start);
+	xe_tile_sriov_vf_ggtt_store(tile, size);
 
-	return config->ggtt_size ? 0 : -ENODATA;
+	err = size ? 0 : -ENODATA;
+	if (!err && shift && shift != start) {
+		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
+				 shift, start);
+		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
+	}
+
+	return err;
 }
 
 static int vf_get_lmem_info(struct xe_gt *gt)
@@ -546,7 +558,9 @@ static void vf_cache_gmdid(struct xe_gt *gt)
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
@@ -592,58 +606,6 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.num_ctxs;
 }
 
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
-
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
-	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
-	xe_gt_assert(gt, gt->sriov.vf.self_config.ggtt_size);
-
-	return gt->sriov.vf.self_config.ggtt_base;
-}
-
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
-}
-
 static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
 {
 	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
@@ -1048,14 +1010,15 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
-		   config->ggtt_base,
-		   config->ggtt_base + config->ggtt_size - 1);
-
-	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
-	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
+	if (xe_gt_is_main_type(gt)) {
+		u64 ggtt_size = xe_tile_sriov_vf_ggtt(gt_to_tile(gt));
+		u64 ggtt_base = xe_tile_sriov_vf_ggtt_base(gt_to_tile(gt));
 
-	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
+		drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
+			   ggtt_base, ggtt_base + ggtt_size - 1);
+		string_get_size(ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		drm_printf(p, "GGTT size:\t%llu (%s)\n", ggtt_size, buf);
+	}
 
 	lmem_size = xe_tile_sriov_vf_lmem(gt_to_tile(gt));
 	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
@@ -1147,21 +1110,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
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
index aff76051c9bb..0d9e217989af 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -14,12 +14,6 @@
  * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
  */
 struct xe_gt_sriov_vf_selfconfig {
-	/** @ggtt_base: assigned base offset of the GGTT region. */
-	u64 ggtt_base;
-	/** @ggtt_size: assigned size of the GGTT region. */
-	u64 ggtt_size;
-	/** @ggtt_shift: difference in ggtt_base on last migration */
-	s64 ggtt_shift;
 	/** @num_ctxs: assigned number of GuC submission context IDs. */
 	u16 num_ctxs;
 	/** @num_dbs: assigned number of GuC doorbells IDs. */
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
index 02430a53da9f..043d93844a32 100644
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
@@ -240,17 +239,15 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
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
-
-	mutex_unlock(&ggtt->lock);
 }
 
 /**
@@ -285,3 +282,69 @@ void xe_tile_sriov_vf_lmem_store(struct xe_tile *tile, u64 lmem_size)
 
 	config->lmem_size = lmem_size;
 }
+
+/**
+ * xe_tile_sriov_vf_ggtt - VF GGTT configuration.
+ * @tile: the &xe_tile
+ *
+ * This function is for VF use only.
+ *
+ * Return: size of the GGTT assigned to VF.
+ */
+u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile)
+{
+	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
+
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+
+	return config->ggtt_size;
+}
+
+/**
+ * xe_tile_sriov_vf_ggtt_store - Store VF GGTT configuration
+ * @tile: the &xe_tile
+ * @ggtt_size: VF GGTT size to store
+ *
+ * This function is for VF use only.
+ */
+void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size)
+{
+	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
+
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+
+	config->ggtt_size = ggtt_size;
+}
+
+/**
+ * xe_tile_sriov_vf_ggtt_base - VF GGTT base configuration.
+ * @tile: the &xe_tile
+ *
+ * This function is for VF use only.
+ *
+ * Return: base of the GGTT assigned to VF.
+ */
+u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile)
+{
+	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
+
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+
+	return config->ggtt_base;
+}
+
+/**
+ * xe_tile_sriov_vf_ggtt_base_store - Store VF GGTT base configuration
+ * @tile: the &xe_tile
+ * @ggtt_size: VF GGTT base to store
+ *
+ * This function is for VF use only.
+ */
+void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_base)
+{
+	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
+
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+
+	config->ggtt_base = ggtt_base;
+}
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
index 86d750a57530..749f41504883 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
@@ -11,9 +11,12 @@
 struct xe_tile;
 
 int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
-int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
 void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
-void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
+void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
+u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile);
+void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size);
+u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile);
+void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_size);
 u64 xe_tile_sriov_vf_lmem(struct xe_tile *tile);
 void xe_tile_sriov_vf_lmem_store(struct xe_tile *tile, u64 lmem_size);
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
index f49afa8338f1..140717f81d8f 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
@@ -12,6 +12,10 @@
  * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
  */
 struct xe_tile_sriov_vf_selfconfig {
+	/** @ggtt_base: assigned base offset of the GGTT region. */
+	u64 ggtt_base;
+	/** @ggtt_size: assigned size of the GGTT region. */
+	u64 ggtt_size;
 	/** @lmem_size: assigned size of the LMEM. */
 	u64 lmem_size;
 };
-- 
2.34.1

