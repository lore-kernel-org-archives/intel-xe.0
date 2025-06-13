Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6888C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 19:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5410D10E5F9;
	Fri, 13 Jun 2025 19:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKU+wZNi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13DA10E5F9
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 19:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749842094; x=1781378094;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bBgdlz/tomdlu9R9nd61v2VixFYWnrLEgk2GW0+Mg+M=;
 b=PKU+wZNitWkA26Qvp2WgmkHs4B1h7ukhOEzis0Wpl6y2HveVIYSg1MJz
 NqEI+6xeyfEoveUS6Wb3Fqb7oxUV+vrDju/N+TEeT4Aco5knpUZRnmwhU
 bWqofIestTFWZ5GAHTcZsGyzEWtATww/hmnjlcSul0NYLk+0eSPZyrrJ8
 kEOxXVgt0gGCJ+Ggqi6ys+g4crrhqk5ky/W8e0YP4aWjiDN1krgbwQC1x
 f9Rrmd8Gv9YnRV8xdKw/pZVhS6uwpbKKi4SA/4s8VxJiOxyXODzQi4Vfi
 iiQRcay9zUCDLPnBvR33Sxjl9LJt+xuXlI8/MK080BJ4CLkvE0T86mJ+X Q==;
X-CSE-ConnectionGUID: 3kcIlWbZRAGPDqJNccElTw==
X-CSE-MsgGUID: FS3ffo/fTwiaiLsy+btNRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63477128"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="63477128"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 12:14:54 -0700
X-CSE-ConnectionGUID: Y8N2M/UYQdavAOmF0ZlehQ==
X-CSE-MsgGUID: FAGX68kWT92+MI3w/KiidQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="153189414"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa005.jf.intel.com with ESMTP; 13 Jun 2025 12:14:52 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v1] drm/xe/vf: Make multi-GT migration less error prone
Date: Fri, 13 Jun 2025 21:14:50 +0200
Message-Id: <20250613191450.1955691-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
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

There is a remote chance that after migration,  some GTs will not
send the MIGRATED interrupt, or due to current VF KMD state the
interrupt will not lead to marking the GT for recovery.

Requiring IRQs from all GTs before starting migration introduces
the possibility that the process will get stalled due to one GuC.

One could argue it is also waste of time to wait for all IRQs,
but we should get them all IRQs as soon as VGPU starts, so that's
not really an implactful argument.

Still, not waiting for all GTs makes it easier to handle situations:
* where one GuC IRQ missing
* where state before probe is unclean - getting MIGRATED IRQ as soon
  as interrupts are enabled
* where multiple migrations happen close to each other

To help with these cases, this patch alters the post-migration
recovery so thar recovery task is started as soon as one GuC IRQ
is handled, and other GTs are included in recovery later as the
subrequent IRQs are services.

The post-migration recovery can now be called for any selection of
GTs, and it will perform recovery on all GTs for which IRQs have
arrived, even multiple times if necessary.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 167 ++++++++++++++-----------------
 1 file changed, 76 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 6526fe450e55..aef1d256e871 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -147,127 +147,111 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
 		xe_sriov_info(xe, "migration not supported by this module version\n");
 }
 
-/**
- * vf_post_migration_requery_guc - Re-query GuC for current VF provisioning.
- * @xe: the &xe_device struct instance
- *
- * After migration, we need to re-query all VF configuration to make sure
- * they match previous provisioning. Note that most of VF provisioning
- * shall be the same, except GGTT range, since GGTT is not virtualized per-VF.
- *
- * Returns: 0 if the operation completed successfully, or a negative error
- * code otherwise.
+static bool gt_vf_post_migration_needed(struct xe_gt *gt)
+{
+	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
+}
+
+/*
+ * Notify GuCs marked in flags about resource fixups apply finished.
  */
-static int vf_post_migration_requery_guc(struct xe_device *xe)
+static int vf_post_migration_notify_resfix_done(struct xe_device *xe, unsigned long *gt_flags)
 {
 	struct xe_gt *gt;
 	unsigned int id;
-	int err, ret = 0;
+	int err = 0;
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_sriov_vf_query_config(gt);
-		ret = ret ?: err;
+		if (!test_bit(id, gt_flags))
+			continue;
+		/* skip asking GuC for RESFIX exit if new recovery request arrived */
+		if (gt_vf_post_migration_needed(gt))
+			continue;
+		err = xe_gt_sriov_vf_notify_resfix_done(gt);
+		if (err)
+			break;
+		clear_bit(id, gt_flags);
 	}
 
-	return ret;
+	if (*gt_flags && !err)
+		drm_dbg(&xe->drm, "another recovery imminent, skipped some notifications\n");
+	return err;
 }
 
-static void vf_post_migration_fixup_ctb(struct xe_device *xe)
+static int vf_get_next_migrated_gt_id(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	unsigned int id;
 
-	xe_assert(xe, IS_SRIOV_VF(xe));
-
 	for_each_gt(gt, xe, id) {
-		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
-
-		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
+		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
+			return id;
 	}
+	return -1;
 }
 
-/*
- * vf_post_migration_imminent - Check if post-restore recovery is coming.
- * @xe: the &xe_device struct instance
+/**
+ * Perform post-migration fixups on a single GT.
  *
- * Return: True if migration recovery worker will soon be running. Any worker currently
- * executing does not affect the result.
+ * After migration, GuC needs to be re-queried for VF configuration to check
+ * if it matches previous provisioning. Most of VF provisioning shall be the
+ * same, except GGTT range, since GGTT is not virtualized per-VF. If GGTT
+ * range has changed, we have to perform fixups - shift all GGTT references
+ * used anywhere within the driver. After the fixups in this function succeed,
+ * it is allowed to ask the GuC bound to this GT to continue normal operation.
+ *
+ * Returns: 0 if the operation completed successfully, or a negative error
+ * code otherwise.
  */
-static bool vf_post_migration_imminent(struct xe_device *xe)
+static int gt_vf_post_migration_fixups(struct xe_gt *gt)
 {
-	return xe->sriov.vf.migration.gt_flags != 0 ||
-	work_pending(&xe->sriov.vf.migration.worker);
-}
-
-static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
-{
-	bool need_fixups = false;
-	struct xe_tile *tile;
-	unsigned int id;
-
-	for_each_tile(tile, xe, id) {
-		struct xe_gt *gt = tile->primary_gt;
-		s64 shift;
-
-		shift = xe_gt_sriov_vf_ggtt_shift(gt);
-		if (shift) {
-			need_fixups = true;
-			xe_tile_sriov_vf_fixup_ggtt_nodes(tile, shift);
-		}
-	}
-	return need_fixups;
-}
+	s64 shift;
+	int err;
 
-/*
- * Notify all GuCs about resource fixups apply finished.
- */
-static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
-{
-	struct xe_gt *gt;
-	unsigned int id;
+	err = xe_gt_sriov_vf_query_config(gt);
+	if (err)
+		return err;
 
-	for_each_gt(gt, xe, id) {
-		if (vf_post_migration_imminent(xe))
-			goto skip;
-		xe_gt_sriov_vf_notify_resfix_done(gt);
+	shift = xe_gt_sriov_vf_ggtt_shift(gt);
+	if (shift) {
+		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
+		/* FIXME: add the recovery steps */
+		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
 	}
-	return;
-
-skip:
-	drm_dbg(&xe->drm, "another recovery imminent, skipping notifications\n");
+	return 0;
 }
 
 static void vf_post_migration_recovery(struct xe_device *xe)
 {
-	bool need_fixups;
-	int err;
+	int id, err;
+	unsigned long fixed_gts = 0;
 
 	drm_dbg(&xe->drm, "migration recovery in progress\n");
 	xe_pm_runtime_get(xe);
-	err = vf_post_migration_requery_guc(xe);
-	if (vf_post_migration_imminent(xe))
-		goto defer;
-	if (unlikely(err))
-		goto fail;
+
 	if (!vf_migration_supported(xe)) {
 		xe_sriov_err(xe, "migration not supported by this module version\n");
 		err = -ENOTRECOVERABLE;
 		goto fail;
 	}
 
-	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
-	/* FIXME: add the recovery steps */
-	if (need_fixups)
-		vf_post_migration_fixup_ctb(xe);
+	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
+		struct xe_gt *gt = xe_device_get_gt(xe, id);
+
+		err = gt_vf_post_migration_fixups(gt);
+		if (err)
+			goto fail;
+
+		set_bit(id, &fixed_gts);
+	}
+
+	err = vf_post_migration_notify_resfix_done(xe, &fixed_gts);
+	if (err)
+		goto fail;
 
-	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
 	drm_notice(&xe->drm, "migration recovery ended\n");
 	return;
-defer:
-	xe_pm_runtime_put(xe);
-	drm_dbg(&xe->drm, "migration recovery deferred\n");
-	return;
 fail:
 	xe_pm_runtime_put(xe);
 	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
@@ -282,18 +266,23 @@ static void migration_worker_func(struct work_struct *w)
 	vf_post_migration_recovery(xe);
 }
 
-static bool vf_ready_to_recovery_on_all_gts(struct xe_device *xe)
+/*
+ * Check if post-restore recovery is coming on any of GTs.
+ * @xe: the &xe_device struct instance
+ *
+ * Return: True if migration recovery worker will soon be running. Any worker currently
+ * executing does not affect the result.
+ */
+static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
 {
 	struct xe_gt *gt;
 	unsigned int id;
 
 	for_each_gt(gt, xe, id) {
-		if (!test_bit(id, &xe->sriov.vf.migration.gt_flags)) {
-			xe_gt_sriov_dbg_verbose(gt, "still not ready to recover\n");
-			return false;
-		}
+		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
+			return true;
 	}
-	return true;
+	return false;
 }
 
 /**
@@ -308,13 +297,9 @@ void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
 
 	xe_assert(xe, IS_SRIOV_VF(xe));
 
-	if (!vf_ready_to_recovery_on_all_gts(xe))
+	if (!vf_ready_to_recovery_on_any_gts(xe))
 		return;
 
-	WRITE_ONCE(xe->sriov.vf.migration.gt_flags, 0);
-	/* Ensure other threads see that no flags are set now. */
-	smp_mb();
-
 	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
 	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
 		 "scheduled" : "already in progress");
-- 
2.25.1

