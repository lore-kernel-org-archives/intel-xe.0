Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56413E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 23:17:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CF810E642;
	Wed, 18 Feb 2026 23:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5w+hK1B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B4510E642
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 23:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771456650; x=1802992650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FrnNA+b1A/An+tV5KW7OtOW51cG+0BenGpfaYl7L/9I=;
 b=c5w+hK1BjGjUvHIbQmOl811Tq3dVPpm0xvDFAb3dYOQ31z0hbnuG3Knn
 WVDVlrlCZOUS+sf1XJ9ZmHkw0GUWjv1SoV8uuRwQA8FpFlVRvj4ZbIHul
 6t083ogabMHRiw9fa/N/VJbrbKRLc5kmCTVaUcspNtXflpaV/RVFbz9eG
 UoeVglAJJiClGYNAITVd0ncfBIyg260h2x+gsH+vvlkdD5Tc1mwR2giir
 IKs/XBG8n0ALjTGVemNInGEk+E7aRJWqap9iyiaDyTtzCI7Mk5QzUYYKh
 Ybamx08bvfd9Li7Ir6LwvXD53JICTl+GnjO+sKk7HvlaAE+3+NjJt7OWK w==;
X-CSE-ConnectionGUID: VQBR3ngyRnqDyOU2oqzPQA==
X-CSE-MsgGUID: NqdKWu/PQce1mIC4dbeQmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83260863"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83260863"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 15:17:30 -0800
X-CSE-ConnectionGUID: 3nnShvRyTg+iRSxb0lYaXA==
X-CSE-MsgGUID: mMrUBwe5RkW+qtAElBGFSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="214200251"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa009.jf.intel.com with ESMTP; 18 Feb 2026 15:17:31 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 3/5] drm/xe/vf: Wait for default LRCs fixups before using
Date: Thu, 19 Feb 2026 00:21:56 +0100
Message-Id: <20260218232159.1726873-4-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260218232159.1726873-1-tomasz.lis@intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
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

When a context is being created during save/restore, the LRC creation
needs to wait for GGTT address space to be shifted. But it also needs
to have fixed default LRCs. This is mandatory to avoid the situation
where LRC will be created based on data from before the fixups, but
reference within exec queue will be set too late for fixups.

This fixes an issue where contexts created during save/restore have
a large chance of having one unfixed LRC, due to the xe_lrc_create()
being synced for equal start to race with default LRC fixups.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c        |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 24 +++++++++++------------
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++--
 4 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index e9396ad3390a..6eb561086e1c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -309,7 +309,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	for (i = 0; i < q->width; ++i) {
 		struct xe_lrc *lrc;
 
-		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
+		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
 		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
 				    xe_lrc_ring_size(), q->msix_vec, flags);
 		if (IS_ERR(lrc)) {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 527ded3c9c22..5ce06031018d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -536,12 +536,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	 */
 	xe_ggtt_shift_nodes(tile->mem.ggtt, start);
 
-	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
-		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
-		smp_wmb();	/* Ensure above write visible before wake */
-		wake_up_all(&gt->sriov.vf.migration.wq);
-	}
-
 	return 0;
 }
 
@@ -844,6 +838,10 @@ static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
 
 	for_each_hw_engine(hwe, gt, id)
 		xe_default_lrc_update_memirq_regs_with_address(hwe);
+
+	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
+	smp_wmb();	/* Ensure above write visible before wake */
+	wake_up_all(&gt->sriov.vf.migration.wq);
 }
 
 static void vf_start_migration_recovery(struct xe_gt *gt)
@@ -858,7 +856,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
-		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
+		WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, true);
 		smp_wmb();	/* Ensure above writes visible before wake */
 
 		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
@@ -1303,7 +1301,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
 {
 	spin_lock_irq(&gt->sriov.vf.migration.lock);
 	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
-	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
+	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
 	wake_up_all(&gt->sriov.vf.migration.wq);
@@ -1499,7 +1497,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
 	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
 }
 
-static bool vf_valid_ggtt(struct xe_gt *gt)
+static bool vf_valid_default_lrc(struct xe_gt *gt)
 {
 	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
 	bool irq_pending = xe_device_uses_memirq(gt_to_xe(gt)) &&
@@ -1507,17 +1505,17 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
+	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes))
 		return false;
 
 	return true;
 }
 
 /**
- * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
+ * xe_gt_sriov_vf_wait_valid_default_lrc() - wait for valid GGTT refs in default LRCs
  * @gt: the &xe_gt
  */
-void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
+void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt)
 {
 	int ret;
 
@@ -1526,7 +1524,7 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
 		return;
 
 	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
-					       vf_valid_ggtt(gt),
+					       vf_valid_default_lrc(gt),
 					       HZ * 5);
 	xe_gt_WARN_ON(gt, !ret);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 7d97189c2d3d..70232dc38f9a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -39,6 +39,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
 
-void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
+void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 4ef881b9b662..8be181bf3cf3 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -73,8 +73,8 @@ struct xe_gt_sriov_vf_migration {
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
 	bool recovery_inprogress;
-	/** @ggtt_need_fixes: VF GGTT needs fixes */
-	bool ggtt_need_fixes;
+	/** @default_lrcs_need_fixes: GGTT refs within default LRCs need fixes */
+	bool default_lrcs_need_fixes;
 };
 
 /**
-- 
2.25.1

