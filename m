Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F372FC83F34
	for <intel-xe@archiver.kernel.org>; Sat, 19 Jul 2025 07:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B848910E1E1;
	Sat, 19 Jul 2025 07:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kut9M652";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13C210E1E3
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Jul 2025 07:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752910672; x=1784446672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C8UHkVwJ4DfccYfIZ8wWqGk6E++qb/+QVMu6sWwAkcg=;
 b=kut9M652k4n+7JQ9z/QbyT5xQIlu2dgN/0ytfUDjLbnYZRlLb2o9K7QQ
 wVbj+QG0GcB7d3addCrKwOwguOE8vhr/9RehxnBCUGC3GIifUSbgbLgUg
 Mh5DR8JLTd9nlPfAZ3TxiG9TknKarH6VcusjXF1wDt9lvVI7WnU7X5f1Y
 KyzFTmmAwQNO7lOqAgPkedN1CMaAwv6wklrzQkGD7j6P2nZM4Xp5a4wU+
 6tvcqYXFAdRDYC4YBuz2ntvUnExhJfrU9a6Og/gcjSB1fO0rrRhBzCf6L
 UomnBe0BwHEhY4D7ozsTKGhr6XNNwX2vHY9p3TqR97SKbwfMLX+gQMfDx g==;
X-CSE-ConnectionGUID: j7H7k8avTlel7VPQQb+Utg==
X-CSE-MsgGUID: FefPsUS/RUausryMYufdCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="55159707"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="55159707"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2025 00:37:52 -0700
X-CSE-ConnectionGUID: FmLq1y4FTAulSOOzqRfzAA==
X-CSE-MsgGUID: ub5o3qnhQBespz2BbfjRZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; d="scan'208";a="158844441"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa008.jf.intel.com with ESMTP; 19 Jul 2025 00:37:44 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v7 5/9] drm/xe/vf: Rebase HWSP of all contexts after migration
Date: Sat, 19 Jul 2025 09:37:41 +0200
Message-Id: <20250719073745.74251-6-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250719073745.74251-1-tomasz.lis@intel.com>
References: <20250719073745.74251-1-tomasz.lis@intel.com>
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

All contexts require an update due to GGTT range shift, as that
affects their HWSP.

The HW status page of a context contains GGTT references, which
need to be shifted to a new range (or re-computed using the
previously updated vma nodes). The references include ring start
address and indirect state address.

v2: move some functions to better matched files
v3: Add missing kerneldocs
v4: Style fix

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Reviewed-by: Michal Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 drivers/gpu/drm/xe/xe_lrc.c        | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf.c   |  1 +
 7 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 8991b4aed440..3f37ecd5c443 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1028,3 +1028,16 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
 
 	return err;
 }
+
+/**
+ * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
+ * within all LRCs of a queue.
+ * @q: the &xe_exec_queue struct instance containing target LRCs
+ */
+void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
+{
+	int i;
+
+	for (i = 0; i < q->width; ++i)
+		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
+}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 17bc50a7f05a..1d399a33c5c0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -90,4 +90,6 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
 				      struct xe_vm *vm);
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
+void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f7b3cc8c0c5c..f5bd7f0cde7f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2469,3 +2469,19 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
 		guc_exec_queue_print(q, p);
 	mutex_unlock(&guc->submission_state.lock);
 }
+
+/**
+ * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
+ * exec queues registered to given GuC.
+ * @guc: the &xe_guc struct instance
+ */
+void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		xe_exec_queue_contexts_hwsp_rebase(q);
+	mutex_unlock(&guc->submission_state.lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 45b978b047c9..5b43e6639f52 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -45,4 +45,6 @@ void
 xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
 void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
 
+void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 6d38411bdeba..45184626b7fa 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1374,6 +1374,23 @@ void xe_lrc_destroy(struct kref *ref)
 	kfree(lrc);
 }
 
+/**
+ * xe_lrc_update_hwctx_regs_with_address - Re-compute GGTT references within given LRC.
+ * @lrc: the &xe_lrc struct instance
+ */
+void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc)
+{
+	if (xe_lrc_has_indirect_ring_state(lrc)) {
+		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
+				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
+
+		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
+					      __xe_lrc_ring_ggtt_addr(lrc));
+	} else {
+		xe_lrc_write_ctx_reg(lrc, CTX_RING_START, __xe_lrc_ring_ggtt_addr(lrc));
+	}
+}
+
 void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
 {
 	if (xe_lrc_has_indirect_ring_state(lrc))
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index b6c8053c581b..cc231bec709c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -88,6 +88,7 @@ bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
 u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
 u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
 u32 *xe_lrc_regs(struct xe_lrc *lrc);
+void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
 
 u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
 void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 71d28b30de43..54a6218e48b0 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -269,6 +269,7 @@ static int gt_vf_post_migration_fixups(struct xe_gt *gt)
 	shift = xe_gt_sriov_vf_ggtt_shift(gt);
 	if (shift) {
 		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
+		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
 		/* FIXME: add the recovery steps */
 		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
 	}
-- 
2.25.1

