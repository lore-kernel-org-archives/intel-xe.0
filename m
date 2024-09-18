Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FACCDD552
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 19:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E09B10E63A;
	Wed, 18 Sep 2024 19:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeFyNcBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D0210E63D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726689215; x=1758225215;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yNJNgtIETtJ3ys8iyzVZaCuCYVIVNTiL3sDsWJ7yu/0=;
 b=YeFyNcBwxscnu1U51o6N3c/0rWgL8PjWse5tTRGEV/dD4yDPnBaC8np4
 wIuFtYRa9/wLYevypmNM0QMFXHCl+37yjDQFHHjfSJTfSWo/JfO78yleu
 GsWG1fyg+csikC+DH21MUQG+4uvzIX6DiyCcNVYS2wtwlE2OaRHpKrJ2t
 FfUuqEIXEFq8X3Wy0o2iK1hM+WON9ELQTFhNh/TGMkVvw3lWpNqByiyfG
 AGOb/NyrmoZTdUszov1rKlQZVqONeKx+ylbbHMglsv8Xf4LV2PgmMWNCF
 /DeT1vjp80GWG6ijkD4PXEBxEuSjBNwrE9D0fVnZdXzUJgy8ldp9o1kC8 A==;
X-CSE-ConnectionGUID: KfmUsAHWRn24rPFAg1E1Dg==
X-CSE-MsgGUID: wp4/Fa8FSOe21bP68VmrsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="48152931"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="48152931"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 12:53:34 -0700
X-CSE-ConnectionGUID: MKEmh6EcSpWDnbcM6UeLIw==
X-CSE-MsgGUID: OeI+T7+aRyKzSp3DUZ+bfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="100406151"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 12:53:35 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/7] drm/xe/oa: Signal output fences
Date: Wed, 18 Sep 2024 12:53:26 -0700
Message-ID: <20240918195330.3167756-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240918195330.3167756-1-ashutosh.dixit@intel.com>
References: <20240918195330.3167756-1-ashutosh.dixit@intel.com>
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

Introduce 'struct xe_oa_fence' which includes the dma_fence used to signal
output fences in the xe_sync array. The fences are signaled
asynchronously. When there are no output fences to signal, the OA
configuration wait is synchronously re-introduced into the ioctl.

v2: Don't wait in the work, use callback + delayed work (Matt B)
    Use a single, not a per-fence spinlock (Matt Brost)
v3: Move ofence alloc before job submission (Matt)
    Assert, don't fail, from dma_fence_add_callback (Matt)
    Additional dma_fence_get for dma_fence_wait (Matt)
    Change dma_fence_wait to non-interruptible (Matt)
v4: Introduce last_fence to prevent uaf if stream is closed with
    pending OA config jobs
v5: Remove oa_fence_lock, move spinlock back into xe_oa_fence to
    prevent uaf

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 119 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_oa_types.h |   3 +
 2 files changed, 105 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index c72cc7b0451a2..6aee2ba454ad1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -100,6 +100,17 @@ struct xe_oa_config_bo {
 	struct xe_bb *bb;
 };
 
+struct xe_oa_fence {
+	/* @base: dma fence base */
+	struct dma_fence base;
+	/* @lock: lock for the fence */
+	spinlock_t lock;
+	/* @work: work to signal @base */
+	struct delayed_work work;
+	/* @cb: callback to schedule @work */
+	struct dma_fence_cb cb;
+};
+
 #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
 
 static const struct xe_oa_format oa_formats[] = {
@@ -172,10 +183,10 @@ static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int metrics_se
 	return oa_config;
 }
 
-static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo)
+static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo, struct dma_fence *last_fence)
 {
 	xe_oa_config_put(oa_bo->oa_config);
-	xe_bb_free(oa_bo->bb, NULL);
+	xe_bb_free(oa_bo->bb, last_fence);
 	kfree(oa_bo);
 }
 
@@ -655,7 +666,8 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
 
 	xe_oa_config_put(stream->oa_config);
 	llist_for_each_entry_safe(oa_bo, tmp, stream->oa_config_bos.first, node)
-		free_oa_config_bo(oa_bo);
+		free_oa_config_bo(oa_bo, stream->last_fence);
+	dma_fence_put(stream->last_fence);
 }
 
 static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
@@ -954,40 +966,113 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
 	return oa_bo;
 }
 
+static void xe_oa_update_last_fence(struct xe_oa_stream *stream, struct dma_fence *fence)
+{
+	dma_fence_put(stream->last_fence);
+	stream->last_fence = dma_fence_get(fence);
+}
+
+static void xe_oa_fence_work_fn(struct work_struct *w)
+{
+	struct xe_oa_fence *ofence = container_of(w, typeof(*ofence), work.work);
+
+	/* Signal fence to indicate new OA configuration is active */
+	dma_fence_signal(&ofence->base);
+	dma_fence_put(&ofence->base);
+}
+
+static void xe_oa_config_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
+{
+	/* Additional empirical delay needed for NOA programming after registers are written */
+#define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
+
+	struct xe_oa_fence *ofence = container_of(cb, typeof(*ofence), cb);
+
+	INIT_DELAYED_WORK(&ofence->work, xe_oa_fence_work_fn);
+	queue_delayed_work(system_unbound_wq, &ofence->work,
+			   usecs_to_jiffies(NOA_PROGRAM_ADDITIONAL_DELAY_US));
+	dma_fence_put(fence);
+}
+
+static const char *xe_oa_get_driver_name(struct dma_fence *fence)
+{
+	return "xe_oa";
+}
+
+static const char *xe_oa_get_timeline_name(struct dma_fence *fence)
+{
+	return "unbound";
+}
+
+static const struct dma_fence_ops xe_oa_fence_ops = {
+	.get_driver_name = xe_oa_get_driver_name,
+	.get_timeline_name = xe_oa_get_timeline_name,
+};
+
 static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
 {
 #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
 	struct xe_oa_config_bo *oa_bo;
-	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
+	struct xe_oa_fence *ofence;
+	int i, err, num_signal = 0;
 	struct dma_fence *fence;
-	long timeout;
 
-	/* Emit OA configuration batch */
+	ofence = kzalloc(sizeof(*ofence), GFP_KERNEL);
+	if (!ofence) {
+		err = -ENOMEM;
+		goto exit;
+	}
+
 	oa_bo = xe_oa_alloc_config_buffer(stream, config);
 	if (IS_ERR(oa_bo)) {
 		err = PTR_ERR(oa_bo);
 		goto exit;
 	}
 
+	/* Emit OA configuration batch */
 	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		goto exit;
 	}
 
-	/* Wait till all previous batches have executed */
-	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
-	dma_fence_put(fence);
-	if (timeout < 0)
-		err = timeout;
-	else if (!timeout)
-		err = -ETIME;
-	if (err)
-		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
+	/* Point of no return: initialize and set fence to signal */
+	spin_lock_init(&ofence->lock);
+	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &ofence->lock, 0, 0);
 
-	/* Additional empirical delay needed for NOA programming after registers are written */
-	usleep_range(us, 2 * us);
+	for (i = 0; i < stream->num_syncs; i++) {
+		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
+			num_signal++;
+		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
+	}
+
+	/* Additional dma_fence_get in case we dma_fence_wait */
+	if (!num_signal)
+		dma_fence_get(&ofence->base);
+
+	/* Update last fence too before adding callback */
+	xe_oa_update_last_fence(stream, fence);
+
+	/* Add job fence callback to schedule work to signal ofence->base */
+	err = dma_fence_add_callback(fence, &ofence->cb, xe_oa_config_cb);
+	xe_gt_assert(stream->gt, !err || err == -ENOENT);
+	if (err == -ENOENT)
+		xe_oa_config_cb(fence, &ofence->cb);
+
+	/* If nothing needs to be signaled we wait synchronously */
+	if (!num_signal) {
+		dma_fence_wait(&ofence->base, false);
+		dma_fence_put(&ofence->base);
+	}
+
+	/* Done with syncs */
+	for (i = 0; i < stream->num_syncs; i++)
+		xe_sync_entry_cleanup(&stream->syncs[i]);
+	kfree(stream->syncs);
+
+	return 0;
 exit:
+	kfree(ofence);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 99f4b2d4bdcf6..c8e0df13faf83 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -239,6 +239,9 @@ struct xe_oa_stream {
 	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
 	u32 no_preempt;
 
+	/** @last_fence: fence to use in stream destroy when needed */
+	struct dma_fence *last_fence;
+
 	/** @num_syncs: size of @syncs array */
 	u32 num_syncs;
 
-- 
2.41.0

