Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F986E784AF
	for <intel-xe@archiver.kernel.org>; Thu, 25 Dec 2025 01:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1348113F74;
	Thu, 25 Dec 2025 01:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/oNMmnr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C76113F6E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Dec 2025 01:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766625462; x=1798161462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9HyxzVi0qp3rNFm73TKfmNUycfQ7PL/8MrbAmexNYE4=;
 b=h/oNMmnr3d5V8kX7Q4+6OxWeBRG7Vb93CKVB3L9YZvvhewbzGacr8QzT
 kI1xY6W8glzJSRZOkGbkj1Zg/eT8FSuVvT39sphoz/CLi/wBwywQLWXcy
 0Y1TdBpb1iXvSUts3rhsbRW7bXck7PEFKfduwMYjVWWP7IU2L9Ye+iK5z
 Ke9geowDK0MVoJ43WOJe0+KB5bkTKGkA/+RcBz40pcW+PEOGGdaKEVlXR
 gfNkMC1f0RDSgUZeHrYgTme83OWfOWM0U8BIrKZeVe+vlGdkaEl+RWdE+
 RRPb/++Srg1fKpxJDO1a5UhzwfWzNp1gaua94rSpRgEF9yqlArrw/OQ/d A==;
X-CSE-ConnectionGUID: eBe5eYMETfiNpHGFViRtzg==
X-CSE-MsgGUID: hSjpgu8iSQuk7Cn+ix9GYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="85866357"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="85866357"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:41 -0800
X-CSE-ConnectionGUID: EFhJNKx+RxWeN8g/J13TgA==
X-CSE-MsgGUID: xX8DtUzYR7uUVWlyiil+gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; d="scan'208";a="204629124"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 17:17:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [RFC PATCH 03/13] drm/xe: Store exec queue in hardware fence
Date: Wed, 24 Dec 2025 17:17:24 -0800
Message-Id: <20251225011734.341683-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225011734.341683-1-matthew.brost@intel.com>
References: <20251225011734.341683-1-matthew.brost@intel.com>
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
index 70eae7d03a27..fc4b21e3c00d 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1783,15 +1783,17 @@ void xe_lrc_free_seqno_fence(struct dma_fence *fence)
 /**
  * xe_lrc_init_seqno_fence() - Initialize an lrc seqno fence.
  * @lrc: Pointer to the lrc.
+ ( @q: Pointner to exec queue.
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

