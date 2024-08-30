Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AF0CA101C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 22:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1840310E9C1;
	Fri, 30 Aug 2024 22:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEVAB6lu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050B410EAF6
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725056196; x=1756592196;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KCp3IcKnGDsijdBaehJ8AVOfSkztMciGHMP3sRVjJ4I=;
 b=CEVAB6luv2g5aaRhdqNd0O6Zw00NEbD6R87tN7VwLe4W921boHkQOYk7
 X99hE4lpEs9K4EZsijNqVxlGh56kn8O+zcHYUY1nzd400uKxLangtf4VV
 qX15IbJ6DYxzIZNWLVjqTdt6y81yOOBttiHi/jIZ2myg1sAkUAYPTEtY4
 rBoI7i7QaRlWkk9jCQR0nBHV4gNAiG1ARn5xyUGGJxiLBbeHAcaQyyw33
 gkVzWKToFu8+U4Hv/RDjFPRvmKCwTIwxsS8crTzlmF7VXLvDlXab0Kg1C
 ea66/14bqtPug3pEk5V1Kg9b+SY737XmdE0ZVcIfY7KrJ3JG5L2bFPRSy g==;
X-CSE-ConnectionGUID: 0+WHYVIFQ7KohZR6Vldn2A==
X-CSE-MsgGUID: L01K2bFcQkiEPQnAF3HofQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23898743"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="23898743"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 15:16:35 -0700
X-CSE-ConnectionGUID: tB+Dq/oRQBO71AAoPx0AmA==
X-CSE-MsgGUID: Db3qtwThQLuiNpijA4OqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="64040412"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 15:16:34 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 4/7] drm/xe/oa: Signal output fences
Date: Fri, 30 Aug 2024 15:16:15 -0700
Message-ID: <20240830221618.2103948-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240830221618.2103948-1-ashutosh.dixit@intel.com>
References: <20240830221618.2103948-1-ashutosh.dixit@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 117 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_oa_types.h |   6 ++
 2 files changed, 106 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index b4b68019d35b7..56f95fd431bf9 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -100,6 +100,15 @@ struct xe_oa_config_bo {
 	struct xe_bb *bb;
 };
 
+struct xe_oa_fence {
+	/* @base: dma fence base */
+	struct dma_fence base;
+	/* @work: work to signal @base */
+	struct delayed_work work;
+	/* @cb: callback to schedule @work */
+	struct dma_fence_cb cb;
+};
+
 #define DRM_FMT(x) DRM_XE_OA_FMT_TYPE_##x
 
 static const struct xe_oa_format oa_formats[] = {
@@ -172,10 +181,10 @@ static struct xe_oa_config *xe_oa_get_oa_config(struct xe_oa *oa, int metrics_se
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
 
@@ -648,7 +657,8 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
 
 	xe_oa_config_put(stream->oa_config);
 	llist_for_each_entry_safe(oa_bo, tmp, stream->oa_config_bos.first, node)
-		free_oa_config_bo(oa_bo);
+		free_oa_config_bo(oa_bo, stream->last_fence);
+	dma_fence_put(stream->last_fence);
 }
 
 static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
@@ -945,40 +955,112 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
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
+	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &stream->oa_fence_lock, 0, 0);
 
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
 
@@ -1479,6 +1561,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 		goto err_free_oa_buf;
 	}
 
+	spin_lock_init(&stream->oa_fence_lock);
 	ret = xe_oa_enable_metric_set(stream);
 	if (ret) {
 		drm_dbg(&stream->oa->xe->drm, "Unable to enable metric set\n");
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index 99f4b2d4bdcf6..935f98772a948 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -239,6 +239,12 @@ struct xe_oa_stream {
 	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
 	u32 no_preempt;
 
+	/** @last_fence: fence to use in stream destroy when needed */
+	struct dma_fence *last_fence;
+
+	/** @oa_fence_lock: Lock for struct xe_oa_fence */
+	spinlock_t oa_fence_lock;
+
 	/** @num_syncs: size of @syncs array */
 	u32 num_syncs;
 
-- 
2.41.0

