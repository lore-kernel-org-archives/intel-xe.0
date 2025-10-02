Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB5FCAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8D310E7A6;
	Thu,  2 Oct 2025 05:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieXFKWvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B215F10E788
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384448; x=1790920448;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UvxQYdreCP4QQf6qpRcxn95VgFUOjea9JX5rpVNFUMg=;
 b=ieXFKWvTx3I89AImiu46lVX/epQ3DCVXTjg5Dez2d5ndawG9tczt5MMX
 oKV9u4Ucn6nTVntBdSt/M578p4g27ZL/AJWhKrh7TvGQEvpA8BECFq+7g
 +uH6xTLaeOeRoqrAfzt8QEfN4nHMa1/N5f8q+dDXFK31O63raJz37sqJ7
 aHScixPTejp/1gO5d0awKKv5FYPj/4Bb7COgYLUjIt4atYXoTvPL8jUbB
 ubr5PZZDj79DuD4EmUVTFIwFAkjYyFtTdd7YylAacznY5CxI3Vy9SV9Vf
 QJjaV/h5wjqoPL8Is0XnC/xbvcaqBbtfVpRydMsluUrUDH1A1AVtAiOKN A==;
X-CSE-ConnectionGUID: HHmYbXsCQNShf6RWTGC6Pw==
X-CSE-MsgGUID: trPTq2xKSZmrHGsIH6xRIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304508"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304508"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: 1u8mcQB+RHO93KjcPolVEQ==
X-CSE-MsgGUID: RmADEhQ+RSe/4IZ0gB5lmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083539"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 15/34] drm/xe/vf: Close multi-GT GGTT shift race
Date: Wed,  1 Oct 2025 22:53:43 -0700
Message-Id: <20251002055402.1865880-16-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h        |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         | 166 +++++++-------------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h         |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h   |   7 +-
 drivers/gpu/drm/xe/xe_guc.c                 |   2 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       |  30 +++-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   2 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |  23 +++
 drivers/gpu/drm/xe/xe_vram.c                |   6 +-
 9 files changed, 117 insertions(+), 127 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a6c361db11d9..c27414d4e856 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -27,6 +27,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_tile_sriov_vf_types.h"
 #include "xe_validation.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
@@ -185,6 +186,8 @@ struct xe_tile {
 		struct {
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
 			struct xe_ggtt_node *ggtt_balloon[2];
+			/** @sriov.vf.self_config: VF configuration data */
+			struct xe_tile_sriov_vf_selfconfig self_config;
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index dc2516be590b..768c192eb662 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -436,42 +436,57 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 	return value;
 }
 
-static int vf_get_ggtt_info(struct xe_gt *gt)
+static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
 {
-	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	struct xe_tile_sriov_vf_selfconfig *config =
+		&gt_to_tile(gt)->sriov.vf.self_config;
+	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
 	struct xe_guc *guc = &gt->uc.guc;
 	u64 start, size;
+	s64 shift;
 	int err;
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
+	mutex_lock(&ggtt->lock);
+
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_SIZE_KEY, &size);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	if (config->ggtt_size && config->ggtt_size != size) {
 		xe_gt_sriov_err(gt, "Unexpected GGTT reassignment: %lluK != %lluK\n",
 				size / SZ_1K, config->ggtt_size / SZ_1K);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
 				start, start + size - 1, size / SZ_1K);
 
-	config->ggtt_shift = start - (s64)config->ggtt_base;
+	shift = start - (s64)config->ggtt_base;
 	config->ggtt_base = start;
 	config->ggtt_size = size;
+	err = config->ggtt_size ? 0 : -ENODATA;
 
-	return config->ggtt_size ? 0 : -ENODATA;
+	if (!err && shift && recovery) {
+		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\\n",
+				 shift, config->ggtt_base);
+		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
+	}
+out:
+	mutex_unlock(&ggtt->lock);
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
@@ -481,20 +496,23 @@ static int vf_get_lmem_info(struct xe_gt *gt)
 
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_LMEM_SIZE_KEY, &size);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	if (config->lmem_size && config->lmem_size != size) {
 		xe_gt_sriov_err(gt, "Unexpected LMEM reassignment: %lluM != %lluM\n",
 				size / SZ_1M, config->lmem_size / SZ_1M);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 
 	string_get_size(size, 1, STRING_UNITS_2, size_str, sizeof(size_str));
 	xe_gt_sriov_dbg_verbose(gt, "LMEM %lluM %s\n", size / SZ_1M, size_str);
 
 	config->lmem_size = size;
+	err = config->lmem_size ? 0 : -ENODATA;
 
-	return config->lmem_size ? 0 : -ENODATA;
+out:
+	return err;
 }
 
 static int vf_get_submission_cfg(struct xe_gt *gt)
@@ -508,21 +526,23 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 
 	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, &num_ctxs);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	err = guc_action_query_single_klv32(guc, GUC_KLV_VF_CFG_NUM_DOORBELLS_KEY, &num_dbs);
 	if (unlikely(err))
-		return err;
+		goto out;
 
 	if (config->num_ctxs && config->num_ctxs != num_ctxs) {
 		xe_gt_sriov_err(gt, "Unexpected CTXs reassignment: %u != %u\n",
 				num_ctxs, config->num_ctxs);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 	if (config->num_dbs && config->num_dbs != num_dbs) {
 		xe_gt_sriov_err(gt, "Unexpected DBs reassignment: %u != %u\n",
 				num_dbs, config->num_dbs);
-		return -EREMCHG;
+		err = -EREMCHG;
+		goto out;
 	}
 
 	xe_gt_sriov_dbg_verbose(gt, "CTXs %u DBs %u\n", num_ctxs, num_dbs);
@@ -530,7 +550,10 @@ static int vf_get_submission_cfg(struct xe_gt *gt)
 	config->num_ctxs = num_ctxs;
 	config->num_dbs = num_dbs;
 
-	return config->num_ctxs ? 0 : -ENODATA;
+	err = config->num_ctxs ? 0 : -ENODATA;
+
+out:
+	return err;
 }
 
 static void vf_cache_gmdid(struct xe_gt *gt)
@@ -544,17 +567,18 @@ static void vf_cache_gmdid(struct xe_gt *gt)
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
 
@@ -584,80 +608,16 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
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
@@ -1057,6 +1017,8 @@ void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val)
  */
 void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 {
+	struct xe_tile_sriov_vf_selfconfig *tconfig =
+		&gt_to_tile(gt)->sriov.vf.self_config;
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
 	struct xe_device *xe = gt_to_xe(gt);
 	char buf[10];
@@ -1064,17 +1026,15 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
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
@@ -1161,21 +1121,16 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
 	void *buf = gt->sriov.vf.migration.scratch;
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
@@ -1274,7 +1229,6 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 		return -ENOMEM;
 
 	gt->sriov.vf.migration.scratch = buf;
-	init_rwsem(&gt->sriov.vf.self_config.lock);
 	spin_lock_init(&gt->sriov.vf.migration.lock);
 	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 0b0f2a30e67c..08568e68447d 100644
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
@@ -29,9 +29,6 @@ bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
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
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index d5adbbb013ec..c016a11b6ab1 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -713,7 +713,7 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
 	if (err)
 		return err;
 
-	err = xe_gt_sriov_vf_query_config(gt);
+	err = xe_gt_sriov_vf_query_config(gt, false);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
index f221dbed16f0..074981e2ef07 100644
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
@@ -244,11 +243,30 @@ void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift)
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
index 93eb043171e8..54e7f2a5c4e4 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
@@ -11,8 +11,8 @@
 struct xe_tile;
 
 int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
-int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile);
 void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
 void xe_tile_sriov_vf_fixup_ggtt_nodes(struct xe_tile *tile, s64 shift);
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
index b44ebf50fedb..bc471e3dd494 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -16,10 +16,10 @@
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
@@ -237,9 +237,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
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

