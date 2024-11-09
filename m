Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16A3D64099
	for <intel-xe@archiver.kernel.org>; Sat,  9 Nov 2024 01:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE0B10E33F;
	Sat,  9 Nov 2024 01:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jt1sb53A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A90A10E33A
 for <Intel-Xe@lists.freedesktop.org>; Sat,  9 Nov 2024 01:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731117577; x=1762653577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ssjwmYueGuuJJZJU5/6DipDcB3HDo9yrpGRo8tLvKKI=;
 b=jt1sb53ALDldyE8e3fjEJvMli60WuG8/FCVwhzFbZqYK21B5P5xXQuX5
 3B6+nlSOaWmRICFyZLv4qk11aSFbLMwZe5ge62PnXQGe/KGxbphaazSJk
 IMqX+q6vW87aWaQyN8TAYsJnR1pW52WZD4Hi2q8DvELZWfz6GQhNg92Xb
 2cZA3tJoBxK9TH6/xULSlb7/pe73AOdXi0d40cfxPnMDjVKNj3xkx1B4R
 ibGgZCmNZ6Ojo1RsTsXoEkvFTMOrJ1fS6jKnCNzuNQUGJtaCzEp25xiZE
 9REy8kAdmY5x4ctCtRzZXwzJUJNBxBrkvd4KPYiwH9HUergAE8gml7Z5X w==;
X-CSE-ConnectionGUID: SCGtdrZlS8Cpu9/HABNfOg==
X-CSE-MsgGUID: +gNZoHCkRAe/kHBuVo8WOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34799514"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="34799514"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 17:59:36 -0800
X-CSE-ConnectionGUID: OfBzBwEvQ+W3Qy7UTKXAtQ==
X-CSE-MsgGUID: kYHmAgH0Q5aBJ+l3t5i/xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; d="scan'208";a="90369017"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 17:59:35 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [RFC 5/5] drm/xe: Support devcoredump capture from dead CT handler
Date: Fri,  8 Nov 2024 17:59:34 -0800
Message-ID: <20241109015934.2203462-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
References: <20241109015934.2203462-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

The dead CT handler was doing a locally rolled fake devcoredump
capture and print. Replace that with support for calling the genuine
devcoredump code to do the capture and print instead.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c  |  8 +++-
 drivers/gpu/drm/xe/xe_devcoredump.h  |  2 +
 drivers/gpu/drm/xe/xe_guc_ct.c       | 57 +++++++++++++---------------
 drivers/gpu/drm/xe/xe_guc_ct_types.h |  6 +--
 4 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 146b5cd4fbe6..d3a5cb82bf72 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -223,7 +223,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	return byte_copied;
 }
 
-static void xe_devcoredump_free(void *data)
+void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
 
@@ -376,6 +376,12 @@ static void devcoredump_snapshot_for_thing(struct xe_devcoredump *coredump,
 	dma_fence_end_signalling(cookie);
 }
 
+void xe_devcoredump_snapshot_gt(struct xe_devcoredump *coredump, struct xe_gt *gt)
+{
+	coredump->xe = gt_to_xe(gt);
+	devcoredump_snapshot_for_thing(coredump, gt, NULL, false);
+}
+
 static void devcoredump_for_thing(struct xe_device *_xe, struct xe_gt *gt,
 				  struct xe_sched_job *job, bool want_work)
 {
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
index 1d2f9bbd4ebe..91337432bf78 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.h
+++ b/drivers/gpu/drm/xe/xe_devcoredump.h
@@ -31,6 +31,8 @@ static inline int xe_devcoredump_init(struct xe_device *xe)
 #endif
 
 void xe_devcoredump_print(struct drm_printer *p, struct xe_devcoredump *coredump);
+void xe_devcoredump_snapshot_gt(struct xe_devcoredump *coredump, struct xe_gt *gt);
+void xe_devcoredump_free(void *data);
 void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
 			   const void *blob, size_t offset, size_t size);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2eeadcdf7bc3..a738dcf90aa9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1800,11 +1800,10 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reason_code)
 {
-	struct xe_guc_log_snapshot *snapshot_log;
-	struct xe_guc_ct_snapshot *snapshot_ct;
-	struct xe_guc *guc = ct_to_guc(ct);
+	struct xe_devcoredump *coredump;
 	unsigned long flags;
 	bool have_capture;
+	struct xe_gt *gt = ct_to_gt(ct);
 
 	if (ctb)
 		ctb->info.broken = true;
@@ -1825,29 +1824,36 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
 	if (have_capture)
 		return;
 
-	snapshot_log = xe_guc_log_snapshot_capture(&guc->log, true);
-	snapshot_ct = xe_guc_ct_snapshot_capture((ct));
+	coredump = kzalloc(sizeof(*coredump), GFP_ATOMIC);
+	if (!coredump) {
+		xe_gt_err(gt, "Failed to allocate coredump for dead CT capture!\n");
+		return;
+	}
+
+	xe_devcoredump_snapshot_gt(coredump, gt);
 
 	spin_lock_irqsave(&ct->dead.lock, flags);
 
-	if (ct->dead.snapshot_log || ct->dead.snapshot_ct) {
-		xe_gt_err(ct_to_gt(ct), "Got unexpected dead CT capture!\n");
-		xe_guc_log_snapshot_free(snapshot_log);
-		xe_guc_ct_snapshot_free(snapshot_ct);
+	if (ct->dead.coredump) {
+		xe_gt_err(gt, "Got unexpected dead CT capture!\n");
 	} else {
-		ct->dead.snapshot_log = snapshot_log;
-		ct->dead.snapshot_ct = snapshot_ct;
+		ct->dead.coredump = coredump;
+		coredump = NULL;
 	}
 
 	spin_unlock_irqrestore(&ct->dead.lock, flags);
 
-	queue_work(system_unbound_wq, &(ct)->dead.worker);
+	queue_work(system_unbound_wq, &ct->dead.worker);
+
+	if (coredump) {
+		xe_devcoredump_free(coredump);
+		kfree(coredump);
+	}
 }
 
 static void ct_dead_print(struct xe_dead_ct *dead)
 {
 	struct xe_guc_ct *ct = container_of(dead, struct xe_guc_ct, dead);
-	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
 	static int g_count;
 	struct drm_printer ip = xe_gt_info_printer(gt);
@@ -1860,18 +1866,8 @@ static void ct_dead_print(struct xe_dead_ct *dead)
 
 	drm_printf(&lp, "CTB is dead - reason=0x%X\n", dead->reason);
 
-	/* Can't generate a genuine core dump at this point, so just do the good bits */
-	drm_puts(&lp, "**** Xe Device Coredump ****\n");
-	xe_device_snapshot_print(xe, &lp);
-
-	drm_printf(&lp, "**** GT #%d ****\n", gt->info.id);
-	drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
-
-	drm_puts(&lp, "**** GuC Log ****\n");
-	xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
-
-	drm_puts(&lp, "**** GuC CT ****\n");
-	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
+	if (dead->coredump)
+		xe_devcoredump_print(&lp, dead->coredump);
 
 	drm_puts(&lp, "Done.\n");
 }
@@ -1879,6 +1875,7 @@ static void ct_dead_print(struct xe_dead_ct *dead)
 static void ct_dead_worker_func(struct work_struct *w)
 {
 	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, dead.worker);
+	struct xe_devcoredump *coredump;
 
 	if (!ct->dead.reported) {
 		ct->dead.reported = true;
@@ -1886,11 +1883,8 @@ static void ct_dead_worker_func(struct work_struct *w)
 	}
 
 	spin_lock_irq(&ct->dead.lock);
-
-	xe_guc_log_snapshot_free(ct->dead.snapshot_log);
-	ct->dead.snapshot_log = NULL;
-	xe_guc_ct_snapshot_free(ct->dead.snapshot_ct);
-	ct->dead.snapshot_ct = NULL;
+	coredump = ct->dead.coredump;
+	ct->dead.coredump = NULL;
 
 	if (ct->dead.reason & (1 << CT_DEAD_STATE_REARM)) {
 		/* A reset has occurred so re-arm the error reporting */
@@ -1899,5 +1893,8 @@ static void ct_dead_worker_func(struct work_struct *w)
 	}
 
 	spin_unlock_irq(&ct->dead.lock);
+
+	xe_devcoredump_free(coredump);
+	kfree(coredump);
 }
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
index 8e1b9d981d61..7131dd6a8366 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
@@ -99,10 +99,8 @@ struct xe_dead_ct {
 	bool reported;
 	/** @worker: worker thread to get out of interrupt context before dumping */
 	struct work_struct worker;
-	/** snapshot_ct: copy of CT state and CTB content at point of error */
-	struct xe_guc_ct_snapshot *snapshot_ct;
-	/** snapshot_log: copy of GuC log at point of error */
-	struct xe_guc_log_snapshot *snapshot_log;
+	/** coredump: copy of system state at point of error */
+	struct xe_devcoredump *coredump;
 };
 #endif
 
-- 
2.47.0

