Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E4BC2A07A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1B910E3AC;
	Mon,  5 Jan 2026 04:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i09wMHj6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF3610E232
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585764; x=1799121764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mSm+a4HPs2r+DDA9dnmjlUII2ECQqQU/g2YeIYAbF8E=;
 b=i09wMHj6jq1Ocu1eZ8Rp+rsO6TzPA8YCWnEe3bT3PeWbyqawobPFBcpd
 Tv/8TwHZ0BLvf6LkQ6pNL96dimRrpkEMg/HGPeSuzYQNx/JnR+BOHklxA
 caB0JFHzmGi9+qAns/SjI2XkHYCE9DW3GHhGB0QVEHfoQjE5WR/FjN5Ef
 sSYYGnXhSUaEGdURSS5hmz+/ek8LxV515XBXm90AB0E7tzgI6B4qmEK3w
 1vb0e+/DlfO+ncYvsMkqtAdheEkba8+ls7CBQuYFZygwqvnH9rzxnnDtr
 ShCNIY8Ffos2Yd4RWzUYP6qL5LYOvtydnU95rky5tY5PH3fUEgdA1HZFn A==;
X-CSE-ConnectionGUID: xk8RF4mYQXeTa5vUitJrXw==
X-CSE-MsgGUID: EGK7jJITRxqMAYWiqt5vog==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856258"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856258"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: o12Nf9IETQKGcxOXZ9DRmQ==
X-CSE-MsgGUID: DVCeGlHoSs6R4otTbnXsGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060654"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 03/22] drm/xe: Store exec queue in hardware fence
Date: Sun,  4 Jan 2026 20:02:18 -0800
Message-Id: <20260105040237.1307873-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Enable hardware fences to set deadlines for exec queues.

v2:
 - Fix kernel doc (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_fence.c       | 4 +++-
 drivers/gpu/drm/xe/xe_hw_fence.h       | 2 +-
 drivers/gpu/drm/xe/xe_hw_fence_types.h | 6 ++++++
 drivers/gpu/drm/xe/xe_lrc.c            | 6 ++++--
 drivers/gpu/drm/xe/xe_lrc.h            | 3 ++-
 drivers/gpu/drm/xe/xe_sched_job.c      | 2 +-
 6 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index f6057456e460..5995bf095843 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -242,6 +242,7 @@ void xe_hw_fence_free(struct dma_fence *fence)
  * xe_hw_fence_init() - Initialize an hw fence.
  * @fence: Pointer to the fence to initialize.
  * @ctx: Pointer to the struct xe_hw_fence_ctx fence context.
+ * @q: Pointer to exec queue tied to the fence.
  * @seqno_map: Pointer to the map into where the seqno is blitted.
  *
  * Initializes a pre-allocated hw fence.
@@ -249,12 +250,13 @@ void xe_hw_fence_free(struct dma_fence *fence)
  * dma-fence refcounting.
  */
 void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
-		      struct iosys_map seqno_map)
+		      struct xe_exec_queue *q, struct iosys_map seqno_map)
 {
 	struct  xe_hw_fence *hw_fence =
 		container_of(fence, typeof(*hw_fence), dma);
 
 	hw_fence->xe = gt_to_xe(ctx->gt);
+	hw_fence->q = q;
 	snprintf(hw_fence->name, sizeof(hw_fence->name), "%s", ctx->name);
 	hw_fence->seqno_map = seqno_map;
 	INIT_LIST_HEAD(&hw_fence->irq_link);
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index f13a1c4982c7..7a8678c881d8 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -29,5 +29,5 @@ struct dma_fence *xe_hw_fence_alloc(void);
 void xe_hw_fence_free(struct dma_fence *fence);
 
 void xe_hw_fence_init(struct dma_fence *fence, struct xe_hw_fence_ctx *ctx,
-		      struct iosys_map seqno_map);
+		      struct xe_exec_queue *q, struct iosys_map seqno_map);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_fence_types.h b/drivers/gpu/drm/xe/xe_hw_fence_types.h
index 58a8d09afe5c..052bbab1fad6 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence_types.h
@@ -13,6 +13,7 @@
 #include <linux/spinlock.h>
 
 struct xe_device;
+struct xe_exec_queue;
 struct xe_gt;
 
 /**
@@ -64,6 +65,11 @@ struct xe_hw_fence {
 	struct dma_fence dma;
 	/** @xe: Xe device for hw fence driver name */
 	struct xe_device *xe;
+	/**
+	 * @q: Exec queue which fence is tied too, not ref counted, lookup
+	 * protected by fence lock.
+	 */
+	struct xe_exec_queue *q;
 	/** @name: name of hardware fence context */
 	char name[MAX_FENCE_NAME_LEN];
 	/** @seqno_map: I/O map for seqno */
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 70eae7d03a27..eccc7f2642bf 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1783,15 +1783,17 @@ void xe_lrc_free_seqno_fence(struct dma_fence *fence)
 /**
  * xe_lrc_init_seqno_fence() - Initialize an lrc seqno fence.
  * @lrc: Pointer to the lrc.
+ * @q: Pointner to exec queue.
  * @fence: Pointer to the fence to initialize.
  *
  * Initializes a pre-allocated lrc seqno fence.
  * After initialization, the fence is subject to normal
  * dma-fence refcounting.
  */
-void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence)
+void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct xe_exec_queue *q,
+			     struct dma_fence *fence)
 {
-	xe_hw_fence_init(fence, &lrc->fence_ctx, __xe_lrc_seqno_map(lrc));
+	xe_hw_fence_init(fence, &lrc->fence_ctx, q, __xe_lrc_seqno_map(lrc));
 }
 
 s32 xe_lrc_seqno(struct xe_lrc *lrc)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 8acf85273c1a..3d72b4c0da8e 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -118,7 +118,8 @@ u64 xe_lrc_descriptor(struct xe_lrc *lrc);
 u32 xe_lrc_seqno_ggtt_addr(struct xe_lrc *lrc);
 struct dma_fence *xe_lrc_alloc_seqno_fence(void);
 void xe_lrc_free_seqno_fence(struct dma_fence *fence);
-void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct dma_fence *fence);
+void xe_lrc_init_seqno_fence(struct xe_lrc *lrc, struct xe_exec_queue *q,
+			     struct dma_fence *fence);
 s32 xe_lrc_seqno(struct xe_lrc *lrc);
 
 u32 xe_lrc_start_seqno_ggtt_addr(struct xe_lrc *lrc);
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cb674a322113..6099b4445835 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -270,7 +270,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		struct dma_fence_chain *chain;
 
 		fence = job->ptrs[i].lrc_fence;
-		xe_lrc_init_seqno_fence(q->lrc[i], fence);
+		xe_lrc_init_seqno_fence(q->lrc[i], q, fence);
 		job->ptrs[i].lrc_fence = NULL;
 		if (!i) {
 			job->lrc_seqno = fence->seqno;
-- 
2.34.1

