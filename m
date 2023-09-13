Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3524EE0213
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 23:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B18F10E08A;
	Wed, 13 Sep 2023 23:28:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C921C10E08A
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 23:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694647728; x=1726183728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LRcCPMCNLVA3zztWsOhoWPxS7dOPgwnHIug0FDY4rfc=;
 b=EJxvKVHRESr0nLfpkBhC5WlW+S9kTrMhm19npYPPPXz61p2xA5zRDqA3
 uF2Idc9lB3XKiZFP/0/OChf281RSVVIGFtmy6umXIjWDLwQutB4JsAmYx
 Sm1a25FyPlMBowGSTfbtOEFR29nWtm8TBNlgdYyyJE8Q+wSgZlzchty2v
 X45dRGEWQKrXvKR0keFKH7UDJwtUcBqfvwhnC82SLC7tTOdRJ/KnraCRW
 2tjx7tYWSzNhPAkvnMuBqd9Zyq1QYFa7LeFbbe3/DXbW7llcAwDlIOW4I
 VQXfz/koAdRexIWrAczyHYCQB+b8HSW5i6Mmena+nU/Ty+GC/yg+TmHsh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="381492679"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="381492679"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:28:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814448383"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="814448383"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:28:45 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 16:28:35 -0700
Message-ID: <20230913232837.2811049-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230913232837.2811049-1-daniele.ceraolospurio@intel.com>
References: <20230913232837.2811049-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 1/3] drm/xe/uc: Rename
 guc_submission_enabled() to uc_enabled()
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

The guc_submission_enabled() function is being used as a boolean toggle
for all firmwares and all related features, not just GuC submission. We
could add additional flags/functions to distinguish and allow different
use-cases (e.g. loading HuC but not using GuC submission), but given
that not using GuC is a debug-only scenario having a global switch for
all FWs is enough. However, we want to make it clear that this switch
turns off everything, so rename it to uc_enabled().

v2: rebase on s/XE_WARN_ON/xe_assert

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h     |  2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c   |  6 +++---
 drivers/gpu/drm/xe/xe_ggtt.c       |  2 +-
 drivers/gpu/drm/xe/xe_gt.c         |  4 ++--
 drivers/gpu/drm/xe/xe_guc_pc.c     |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c |  4 ++--
 drivers/gpu/drm/xe/xe_hw_engine.c  |  4 ++--
 drivers/gpu/drm/xe/xe_irq.c        |  2 +-
 drivers/gpu/drm/xe/xe_uc.c         | 16 ++++++++--------
 10 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 71582094834c..c4232de40ae0 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -114,7 +114,7 @@ static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
 	return xe_device_get_root_tile(xe)->primary_gt;
 }
 
-static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
+static inline bool xe_device_uc_enabled(struct xe_device *xe)
 {
 	return !xe->info.force_execlist;
 }
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6725157d8c1d..744be293fe37 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -585,7 +585,7 @@ static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 	u16 gt_id;
 	u32 return_mask = 0, prev_mask;
 
-	if (XE_IOCTL_DBG(xe, !xe_device_guc_submission_enabled(xe) &&
+	if (XE_IOCTL_DBG(xe, !xe_device_uc_enabled(xe) &&
 			 len > 1))
 		return 0;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index ec33d57c60aa..5be7f53f023a 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -322,7 +322,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	struct xe_device *xe = gt_to_xe(q->gt);
 	int err;
 
-	xe_assert(xe, !xe_device_guc_submission_enabled(xe));
+	xe_assert(xe, !xe_device_uc_enabled(xe));
 
 	drm_info(&xe->drm, "Enabling execlist submission (GuC submission disabled)\n");
 
@@ -373,7 +373,7 @@ static void execlist_exec_queue_fini_async(struct work_struct *w)
 	struct xe_device *xe = gt_to_xe(q->gt);
 	unsigned long flags;
 
-	xe_assert(xe, !xe_device_guc_submission_enabled(xe));
+	xe_assert(xe, !xe_device_uc_enabled(xe));
 
 	spin_lock_irqsave(&exl->port->lock, flags);
 	if (WARN_ON(exl->active_priority != DRM_SCHED_PRIORITY_UNSET))
@@ -460,7 +460,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
 int xe_execlist_init(struct xe_gt *gt)
 {
 	/* GuC submission enabled, nothing to do */
-	if (xe_device_guc_submission_enabled(gt_to_xe(gt)))
+	if (xe_device_uc_enabled(gt_to_xe(gt)))
 		return 0;
 
 	gt->exec_queue_ops = &execlist_exec_queue_ops;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2f81aede1156..54baaffc7235 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -233,7 +233,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 		xe_gt_assert(gt, seqno > 0);
 		if (seqno > 0)
 			xe_gt_tlb_invalidation_wait(gt, seqno);
-	} else if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
+	} else if (xe_device_uc_enabled(gt_to_xe(gt))) {
 		struct xe_device *xe = gt_to_xe(gt);
 
 		if (xe->info.platform == XE_PVC) {
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5d86bb2bb94d..28b9a73d25e1 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -549,7 +549,7 @@ static int gt_reset(struct xe_gt *gt)
 	int err;
 
 	/* We only support GT resets with GuC submission */
-	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
+	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		return -ENODEV;
 
 	xe_gt_info(gt, "reset started\n");
@@ -642,7 +642,7 @@ int xe_gt_suspend(struct xe_gt *gt)
 	int err;
 
 	/* For now suspend/resume is only allowed with GuC */
-	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
+	if (!xe_device_uc_enabled(gt_to_xe(gt)))
 		return -ENODEV;
 
 	xe_gt_sanitize(gt);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 99d855680894..8a4d299d6cb0 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -816,7 +816,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int ret;
 
-	xe_gt_assert(gt, xe_device_guc_submission_enabled(xe));
+	xe_gt_assert(gt, xe_device_uc_enabled(xe));
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e928a20ba0cb..ac5fc2c797a7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1135,7 +1135,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	long timeout;
 	int err;
 
-	xe_assert(xe, xe_device_guc_submission_enabled(guc_to_xe(guc)));
+	xe_assert(xe, xe_device_uc_enabled(guc_to_xe(guc)));
 
 	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
 	if (!ge)
@@ -1905,7 +1905,7 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
 	struct xe_exec_queue *q;
 	unsigned long index;
 
-	if (!xe_device_guc_submission_enabled(guc_to_xe(guc)))
+	if (!xe_device_uc_enabled(guc_to_xe(guc)))
 		return;
 
 	mutex_lock(&guc->submission_state.lock);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 9c2e212fa4cf..a8681089fb60 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -434,7 +434,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	if (err)
 		goto err_hwsp;
 
-	if (!xe_device_guc_submission_enabled(xe)) {
+	if (!xe_device_uc_enabled(xe)) {
 		hwe->exl_port = xe_execlist_port_create(xe, hwe);
 		if (IS_ERR(hwe->exl_port)) {
 			err = PTR_ERR(hwe->exl_port);
@@ -442,7 +442,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 		}
 	}
 
-	if (xe_device_guc_submission_enabled(xe))
+	if (xe_device_uc_enabled(xe))
 		xe_hw_engine_enable_ring(hwe);
 
 	/* We reserve the highest BCS instance for USM */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 1dee3e832eb5..ca98150a7dd1 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -129,7 +129,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
 	u32 ccs_mask, bcs_mask;
 	u32 irqs, dmask, smask;
 
-	if (xe_device_guc_submission_enabled(xe)) {
+	if (xe_device_uc_enabled(xe)) {
 		irqs = GT_RENDER_USER_INTERRUPT |
 			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index a8ecb5c6e01a..5b7d6177c1c2 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -32,7 +32,7 @@ int xe_uc_init(struct xe_uc *uc)
 	int ret;
 
 	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
 	ret = xe_guc_init(&uc->guc);
@@ -66,7 +66,7 @@ int xe_uc_init(struct xe_uc *uc)
 int xe_uc_init_post_hwconfig(struct xe_uc *uc)
 {
 	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
 	return xe_guc_init_post_hwconfig(&uc->guc);
@@ -110,7 +110,7 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
 	int ret;
 
 	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
 	ret = xe_guc_min_load_for_hwconfig(&uc->guc);
@@ -129,7 +129,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	int ret;
 
 	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
 	ret = xe_uc_sanitize_reset(uc);
@@ -175,7 +175,7 @@ int xe_uc_fini_hw(struct xe_uc *uc)
 int xe_uc_reset_prepare(struct xe_uc *uc)
 {
 	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
 	return xe_guc_reset_prepare(&uc->guc);
@@ -194,7 +194,7 @@ void xe_uc_stop_prepare(struct xe_uc *uc)
 int xe_uc_stop(struct xe_uc *uc)
 {
 	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
 	return xe_guc_stop(&uc->guc);
@@ -203,7 +203,7 @@ int xe_uc_stop(struct xe_uc *uc)
 int xe_uc_start(struct xe_uc *uc)
 {
 	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
 	return xe_guc_start(&uc->guc);
@@ -226,7 +226,7 @@ int xe_uc_suspend(struct xe_uc *uc)
 	int ret;
 
 	/* GuC submission not enabled, nothing to do */
-	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
 		return 0;
 
 	uc_reset_wait(uc);
-- 
2.41.0

