Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A108DC61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 10:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5E310E7D9;
	Thu, 12 Jun 2025 10:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wl2WJfQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292DF10E7C8
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 10:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749723901; x=1781259901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=79g6PARCXIJcWAQX5AhlG3bkMGruTIkSLzYUWgBmntA=;
 b=Wl2WJfQNITr2bc8aQTCt57njg0TLgmjpOMhsZ2y/9fxegKThsM+qJXUs
 73/81RRfGBKLDZ4xvTjokJfJ5YI+VLkxNfLI9DVi5kott+NBCzBSo+ERl
 p8ShEXmvhRJ7gY3ikjYhbgdiHhHmbRk3U9/YCnxilNEScVKehIGvP9BnW
 39qMMPAaESZ/PMsL/hwuZ/6AhirafTRgPCMNicXq0olTPTYTJ+U43tGQt
 RZ0z5i/XK520iU/HpOU/k9fJHYq/8gchXduk+x7CfiiGDyOEV2rcSQMtv
 QCJ2gb33xd9AO32Yd1+x/WnpZBw6Ndj9m9cKH9ld7xPa4ZM35j9NorkPh A==;
X-CSE-ConnectionGUID: 4VkZP85bSkyOXkzetvnyJg==
X-CSE-MsgGUID: k1cYnWhZSya4k6qWEAn/zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51608610"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51608610"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:25:01 -0700
X-CSE-ConnectionGUID: OhA5KftQRrmxkgL7BzI9lw==
X-CSE-MsgGUID: bwfSDD2iTi2iKRpD283Grg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152382785"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 12 Jun 2025 03:24:59 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 5/8] drm/xe/vf: Rebase HWSP of all contexts after migration
Date: Thu, 12 Jun 2025 12:24:46 +0200
Message-Id: <20250612102449.1412058-6-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250612102449.1412058-1-tomasz.lis@intel.com>
References: <20250612102449.1412058-1-tomasz.lis@intel.com>
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
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
 drivers/gpu/drm/xe/xe_lrc.c        | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_lrc.h        |  1 +
 drivers/gpu/drm/xe/xe_sriov_vf.c   | 17 +++++++++++++++--
 7 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fee22358cc09..c44a523ba906 100644
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
index 0d6d9e07fc48..89b4c09e733a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2449,3 +2449,19 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
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
index 529c6a972a55..b2f8eadc776d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1238,6 +1238,23 @@ void xe_lrc_destroy(struct kref *ref)
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
index eb6e8de8c939..e7a99cfd0abe 100644
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
index a4175a2b185b..a559a1f961a4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -7,12 +7,14 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_exec_queue_types.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_submit.h"
 #include "xe_irq.h"
+#include "xe_lrc.h"
 #include "xe_pm.h"
 #include "xe_sriov.h"
 #include "xe_sriov_printk.h"
@@ -224,6 +226,15 @@ static int vf_post_migration_requery_guc(struct xe_device *xe)
 	return ret;
 }
 
+static void vf_post_migration_fixup_contexts(struct xe_device *xe)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+
+	for_each_gt(gt, xe, id)
+		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
+}
+
 static void vf_post_migration_fixup_ctb(struct xe_device *xe)
 {
 	struct xe_gt *gt;
@@ -309,9 +320,11 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	}
 
 	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
-	/* FIXME: add the recovery steps */
-	if (need_fixups)
+	if (need_fixups) {
+		vf_post_migration_fixup_contexts(xe);
+		/* FIXME: add the recovery steps */
 		vf_post_migration_fixup_ctb(xe);
+	}
 
 	vf_post_migration_kickstart(xe);
 	vf_post_migration_notify_resfix_done(xe);
-- 
2.25.1

