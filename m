Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6C4C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 06:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DF310E331;
	Tue, 16 Jul 2024 06:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jWuCnJSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AB310E331
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 06:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721111898; x=1752647898;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5n2Hj/lH+5TDcfSGgBMWE6my4umhfzn2GEHLadbg4Fg=;
 b=jWuCnJSXUVUrbZCdsTo36TbAI9pAYOvAOBOVMRxvbAHczrs4tFfPx+Kc
 JWYUoHHUfUV1c4yyv2EAhZe49OyrlLekNLJXXc09S746Am4pnvJoxLmDk
 wVNjKdsE3vDyf2ssXnP9sjik1UvqhA75fTaAf/+zrBRFR56tURjXY5f4T
 vtjPwSkAKoduGVFRiKWX+OrOHgYIVXlFFCRNWW/OSjVsCQHjZMX6XP7xT
 sT5EGHLtlGULjUDW60+HL4oDoKevO1DQaWFQ49CUbZtbCRByD8ElfLTdB
 li7Am/vOXzKFfrU5EVVl2GVlAakLL3MyZcqvM7Lmxq8N0LCne9iEzEJu9 Q==;
X-CSE-ConnectionGUID: vtV2y9AvS9WpEV7l5AR9Dg==
X-CSE-MsgGUID: ACicHEofRK+TWTXSjdI3cA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="12565118"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="12565118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 23:38:17 -0700
X-CSE-ConnectionGUID: Uy3UbBglTH+xUttzIs+oVQ==
X-CSE-MsgGUID: Z8/IKJeETKe+tXu5OYqm5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="80960615"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 23:38:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
Subject: [PATCH v3 1/2] drm/xe: Wedge the entire device
Date: Mon, 15 Jul 2024 23:39:01 -0700
Message-Id: <20240716063902.1390130-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Wedge the entire device, not just GT which may have triggered the wedge.
To implement this, cleanup the layering so xe_device_declare_wedged()
calls into the lower layers (GT) to ensure entire device is wedged.

While we are here, also signal any pending GT TLB invalidations upon
wedging device.

Lastly, short circuit reset wait if device is wedged.

v2:
 - Short circuit reset wait if device is wedged (Local testing)

Fixes: 8ed9aaae39f3 ("drm/xe: Force wedged state and block GT reset upon any GPU hang")
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     |  6 +++++
 drivers/gpu/drm/xe/xe_gt.c         | 15 ++++++++++++
 drivers/gpu/drm/xe/xe_gt.h         |  1 +
 drivers/gpu/drm/xe/xe_guc.c        | 16 +++++++++++++
 drivers/gpu/drm/xe/xe_guc.h        |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 38 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
 drivers/gpu/drm/xe/xe_uc.c         | 14 +++++++++++
 drivers/gpu/drm/xe/xe_uc.h         |  1 +
 9 files changed, 80 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 64aea962afd5..1e3d3a7e74d5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -909,6 +909,9 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
  */
 void xe_device_declare_wedged(struct xe_device *xe)
 {
+	struct xe_gt *gt;
+	u8 id;
+
 	if (xe->wedged.mode == 0) {
 		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
 		return;
@@ -922,4 +925,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
 			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
 			dev_name(xe->drm.dev));
 	}
+
+	for_each_gt(gt, xe, id)
+		xe_gt_declare_wedged(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b04e47186f5b..a4fd3665c1b8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -957,3 +957,18 @@ struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
 
 	return NULL;
 }
+
+/**
+ * xe_gt_declare_wedged() - Declare GT wedged
+ * @gt: the GT object
+ *
+ * Wedge the GT which stops all submission, saves desired debug state, and
+ * cleans up anything which could timeout.
+ */
+void xe_gt_declare_wedged(struct xe_gt *gt)
+{
+	xe_gt_assert(gt, gt_to_xe(gt)->wedged.mode);
+
+	xe_uc_declare_wedged(&gt->uc);
+	xe_gt_tlb_invalidation_reset(gt);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 1123fdfc4ebc..8b1a5027dcf2 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -37,6 +37,7 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_hwconfig(struct xe_gt *gt);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
+void xe_gt_declare_wedged(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index eb655cee19f7..de0fe9e65746 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1178,3 +1178,19 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	xe_guc_ct_print(&guc->ct, p, false);
 	xe_guc_submit_print(guc, p);
 }
+
+/**
+ * xe_guc_declare_wedged() - Declare GuC wedged
+ * @guc: the GuC object
+ *
+ * Wedge the GuC which stops all submission, saves desired debug state, and
+ * cleans up anything which could timeout.
+ */
+void xe_guc_declare_wedged(struct xe_guc *guc)
+{
+	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
+
+	xe_guc_reset_prepare(guc);
+	xe_guc_ct_stop(&guc->ct);
+	xe_guc_submit_wedge(guc);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index af59c9545753..e0bbf98f849d 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -37,6 +37,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
+void xe_guc_declare_wedged(struct xe_guc *guc);
 
 static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 6392381e8e69..f69bd7317a5e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -861,29 +861,27 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 		xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
-static bool guc_submit_hint_wedged(struct xe_guc *guc)
+/**
+ * xe_guc_submit_wedge() - Wedge GuC submission
+ * @guc: the GuC object
+ *
+ * Save exec queue's registered with GuC state by taking a ref to each queue.
+ * Register a DRMM handler to drop refs upon driver unload.
+ */
+void xe_guc_submit_wedge(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_exec_queue *q;
 	unsigned long index;
 	int err;
 
-	if (xe->wedged.mode != 2)
-		return false;
-
-	if (xe_device_wedged(xe))
-		return true;
-
-	xe_device_declare_wedged(xe);
-
-	xe_guc_submit_reset_prepare(guc);
-	xe_guc_ct_stop(&guc->ct);
+	xe_gt_assert(guc_to_gt(guc), guc_to_xe(guc)->wedged.mode);
 
 	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
 				       guc_submit_wedged_fini, guc);
 	if (err) {
 		drm_err(&xe->drm, "Failed to register xe_guc_submit clean-up on wedged.mode=2. Although device is wedged.\n");
-		return true; /* Device is wedged anyway */
+		return;
 	}
 
 	mutex_lock(&guc->submission_state.lock);
@@ -891,6 +889,19 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 		if (xe_exec_queue_get_unless_zero(q))
 			set_exec_queue_wedged(q);
 	mutex_unlock(&guc->submission_state.lock);
+}
+
+static bool guc_submit_hint_wedged(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+
+	if (xe->wedged.mode != 2)
+		return false;
+
+	if (xe_device_wedged(xe))
+		return true;
+
+	xe_device_declare_wedged(xe);
 
 	return true;
 }
@@ -1704,7 +1715,8 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 
 void xe_guc_submit_reset_wait(struct xe_guc *guc)
 {
-	wait_event(guc->ct.wq, !guc_read_stopped(guc));
+	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
+		   !guc_read_stopped(guc));
 }
 
 void xe_guc_submit_stop(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 4ad5f4c1b084..bdf8c9f3d24a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -18,6 +18,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
+void xe_guc_submit_wedge(struct xe_guc *guc);
 
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0f240534fb72..0d073a9987c2 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -300,3 +300,17 @@ void xe_uc_remove(struct xe_uc *uc)
 {
 	xe_gsc_remove(&uc->gsc);
 }
+
+/**
+ * xe_uc_declare_wedged() - Declare UC wedged
+ * @uc: the UC object
+ *
+ * Wedge the UC which stops all submission, saves desired debug state, and
+ * cleans up anything which could timeout.
+ */
+void xe_uc_declare_wedged(struct xe_uc *uc)
+{
+	xe_gt_assert(uc_to_gt(uc), uc_to_xe(uc)->wedged.mode);
+
+	xe_guc_declare_wedged(&uc->guc);
+}
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 11856f24e6f9..506517c11333 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -21,5 +21,6 @@ int xe_uc_start(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
 int xe_uc_sanitize_reset(struct xe_uc *uc);
 void xe_uc_remove(struct xe_uc *uc);
+void xe_uc_declare_wedged(struct xe_uc *uc);
 
 #endif
-- 
2.34.1

