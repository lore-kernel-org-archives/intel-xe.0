Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBF1CAC5AE
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 03:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01F510E721;
	Wed, 17 Sep 2025 03:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zji41v97";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176CD10E63D
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 03:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758080782; x=1789616782;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VHRt41xW8zeI5KNrBY3iRwAPk8EdF0yOszcND3QV+mA=;
 b=Zji41v97+RxQ9txNtvD3wJDYDXS30yhoZC9eTAB24znd5nRMnu8DaZEQ
 dvRS2mMQ2nGFh2BfJLsb8Bci/TFsJE3chN3R+LvI98fbb4wlvw2nw+Enr
 I5VBw/BCcwkTgF1tWsBWlXdH0m31D6zSZwDyiII1plCeuiUfANGUgeEah
 26LHa0bq9V4hVQzTfX7QmMtT1moHIbJZKekIl5nlsB8+rd87SW6hZ2rej
 bm1D4ZJCsByhP1RWGKrNsfu1RBIy1EZPReS49cCBwcgZmZUMGmjqJ7ZG/
 kms6rCOCf/cHrC91RCeoMWMyTSVZh86MJ4rGrSdWL2RBSJYVlMMiJruN7 g==;
X-CSE-ConnectionGUID: ROPFQ+rpTB6uqZJAUWj65Q==
X-CSE-MsgGUID: I4QVghL9TQ2ecwnT+ZUESw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71060796"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="71060796"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
X-CSE-ConnectionGUID: CVVIInJFS2CZxIfT97YyUw==
X-CSE-MsgGUID: TJt89jaeTkKuf+AvT/F9dw==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 20:46:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 14/28] drm/xe/vf: Close multi-GT GGTT shift race
Date: Tue, 16 Sep 2025 20:46:01 -0700
Message-Id: <20250917034615.3977603-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917034615.3977603-1-matthew.brost@intel.com>
References: <20250917034615.3977603-1-matthew.brost@intel.com>
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
workqueues,  but both GTs point to the same GGTT, only one GT needs to
shift the GGTT. However,  both GTs need to know when this step has
completed. To coordinate this, share the VF  config lock among all GTs
that share a GGTT, and perform the GGTT shift under this lock.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 95 +++++++++--------------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 11 ++-
 drivers/gpu/drm/xe/xe_guc.c               |  2 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c     |  6 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h     |  1 -
 6 files changed, 51 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 6c158e753cdd..5bebc38bcb83 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -436,16 +436,19 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 	return value;
 }
 
-static int vf_get_ggtt_info(struct xe_gt *gt)
+static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	struct xe_gt_sriov_vf_selfconfig *primary_config =
+		&gt_to_tile(gt)->primary_gt->sriov.vf.self_config;
 	struct xe_guc *guc = &gt->uc.guc;
 	u64 start, size;
+	s64 shift;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	down_write(&config->lock);
+	down_write(config->lock);
 
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
 	if (unlikely(err))
@@ -465,13 +468,17 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
 				start, start + size - 1, size / SZ_1K);
 
-	config->ggtt_shift = start - (s64)config->ggtt_base;
+	shift = start - (s64)primary_config->ggtt_base;
 	config->ggtt_base = start;
 	config->ggtt_size = size;
+	if (recovery)
+		primary_config->ggtt_base = start;
 	err = config->ggtt_size ? 0 : -ENODATA;
 
+	if (!err && shift && recovery)
+		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
 out:
-	up_write(&config->lock);
+	up_write(config->lock);
 	return err;
 }
 
@@ -485,7 +492,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	down_write(&config->lock);
+	down_write(config->lock);
 
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
 	if (unlikely(err))
@@ -505,7 +512,7 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 	err = config->lmem_size ? 0 : -ENODATA;
 
 out:
-	up_write(&config->lock);
+	up_write(config->lock);
 	return err;
 }
 
@@ -518,7 +525,7 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	down_write(&config->lock);
+	down_write(config->lock);
 
 	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
 	if (unlikely(err))
@@ -549,7 +556,7 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 	err = config->num_ctxs ? 0 : -ENODATA;
 
 out:
-	up_write(&config->lock);
+	up_write(config->lock);
 	return err;
 }
 
@@ -564,17 +571,18 @@ static void vf_cache_gmdid(struct xe_gt *gt)
 /**
  * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
  * @gt: the &xe_gt
+ * @recovery: VF post migration recovery path
  *
  * This function is for VF use only.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
+int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
-	err = vf_get_ggtt_info(gt);
+	err = vf_get_ggtt_info(gt, recovery);
 	if (unlikely(err))
 		return err;
 
@@ -610,10 +618,10 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
 
-	down_read(&config->lock);
+	down_read(config->lock);
 	xe_gt_assert(gt, config->num_ctxs);
 	val = config->num_ctxs;
-	up_read(&config->lock);
+	up_read(config->lock);
 
 	return val;
 }
@@ -634,10 +642,10 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
 
-	down_read(&config->lock);
+	down_read(config->lock);
 	xe_gt_assert(gt, config->lmem_size);
 	val = config->lmem_size;
-	up_read(&config->lock);
+	up_read(config->lock);
 
 	return val;
 }
@@ -656,11 +664,9 @@ u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt)
 	u64 val;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
+	lockdep_assert_held(config->lock);
 
-	down_read(&config->lock);
 	val = config->ggtt_size;
-	up_read(&config->lock);
 
 	return val;
 }
@@ -680,34 +686,10 @@ u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
-
-	down_read(&config->lock);
 	xe_gt_assert(gt, config->ggtt_size);
-	val = config->ggtt_base;
-	up_read(&config->lock);
-
-	return val;
-}
+	lockdep_assert_held(config->lock);
 
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
-	s64 val;
-
-	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
-	xe_gt_assert(gt, xe_gt_is_main_type(gt));
-
-	down_read(&config->lock);
-	val = config->ggtt_shift;
-	up_read(&config->lock);
+	val = config->ggtt_base;
 
 	return val;
 }
@@ -1115,7 +1097,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	down_read(&config->lock);
+	down_read(config->lock);
 	drm_printf(p, "GGTT range:\t%#llx-%#llx\n",
 		   config->ggtt_base,
 		   config->ggtt_base + config->ggtt_size - 1);
@@ -1123,8 +1105,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
 	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
 
-	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
-
 	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
 		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
 		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
@@ -1132,7 +1112,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 
 	drm_printf(p, "GuC contexts:\t%u\n", config->num_ctxs);
 	drm_printf(p, "GuC doorbells:\t%u\n", config->num_dbs);
-	up_read(&config->lock);
+	up_read(config->lock);
 }
 
 /**
@@ -1224,21 +1204,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
 	void *buf = gt->sriov.vf.migration.lrc_wa_bb;
-	s64 shift;
 	int err;
 
-	err = xe_gt_sriov_vf_query_config(gt);
+	err = xe_gt_sriov_vf_query_config(gt, true);
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
@@ -1322,6 +1297,7 @@ static void migration_worker_func(struct work_struct *w)
  */
 int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
 {
+	struct xe_tile *tile = gt_to_tile(gt);
 	void *buf;
 
 	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
@@ -1331,7 +1307,10 @@ int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
 		return -ENOMEM;
 
 	gt->sriov.vf.migration.lrc_wa_bb = buf;
-	init_rwsem(&gt->sriov.vf.self_config.lock);
+	if (xe_gt_is_main_type(gt))
+		init_rwsem(&gt->sriov.vf.self_config.__lock);
+	gt->sriov.vf.self_config.lock =
+		&tile->primary_gt->sriov.vf.self_config.__lock;
 	spin_lock_init(&gt->sriov.vf.migration.lock);
 	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 195dbebe941e..535237003915 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -18,7 +18,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
 void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
 				 struct xe_uc_fw_version *wanted,
 				 struct xe_uc_fw_version *found);
-int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
+int xe_gt_sriov_vf_query_config(struct xe_gt *gt, bool recovery);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
@@ -31,7 +31,6 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_ggtt(struct xe_gt *gt);
 u64 xe_gt_sriov_vf_ggtt_base(struct xe_gt *gt);
-s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
 
 u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
 void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 496b657119de..61484c7c9a36 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -19,16 +19,19 @@ struct xe_gt_sriov_vf_selfconfig {
 	u64 ggtt_base;
 	/** @ggtt_size: assigned size of the GGTT region. */
 	u64 ggtt_size;
-	/** @ggtt_shift: difference in ggtt_base on last migration */
-	s64 ggtt_shift;
 	/** @lmem_size: assigned size of the LMEM. */
 	u64 lmem_size;
 	/** @num_ctxs: assigned number of GuC submission context IDs. */
 	u16 num_ctxs;
 	/** @num_dbs: assigned number of GuC doorbells IDs. */
 	u16 num_dbs;
-	/** @lock: lock for protecting access to all selfconfig fields. */
-	struct rw_semaphore lock;
+	/** @__lock: lock for protecting access to all selfconfig fields. */
+	struct rw_semaphore __lock;
+	/**
+	 * @lock: pointer to lock for protecting access to all selfconfig
+	 * fields, all GTs point to primary GT.
+	 */
+	struct rw_semaphore *lock;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 00789844ea4d..ac60da51da2c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -712,7 +712,7 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
 	if (err)
 		return err;
 
-	err = xe_gt_sriov_vf_query_config(gt);
+	err = xe_gt_sriov_vf_query_config(gt, false);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
index f221dbed16f0..dc6221fc0520 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
@@ -40,7 +40,7 @@ static int vf_init_ggtt_balloons(struct xe_tile *tile)
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
+static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
 {
 	u64 ggtt_base = xe_gt_sriov_vf_ggtt_base(tile->primary_gt);
 	u64 ggtt_size = xe_gt_sriov_vf_ggtt(tile->primary_gt);
@@ -100,12 +100,16 @@ int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
 
 static int vf_balloon_ggtt(struct xe_tile *tile)
 {
+	struct xe_gt_sriov_vf_selfconfig *config =
+		&tile->primary_gt->sriov.vf.self_config;
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	int err;
 
+	down_read(config->lock);
 	mutex_lock(&ggtt->lock);
 	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
 	mutex_unlock(&ggtt->lock);
+	up_read(config->lock);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
index 93eb043171e8..4ee68d1fb28e 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
@@ -11,7 +11,6 @@
 struct xe_tile;
 
 int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
-int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
 void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
 void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
 
-- 
2.34.1

