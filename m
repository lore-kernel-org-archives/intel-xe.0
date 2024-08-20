Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A8CC52D6F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 00:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E2210E34D;
	Tue, 20 Aug 2024 00:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjm6hGuT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F63610E32E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 00:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724115495; x=1755651495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hKGrmJrzzEerh7gMdEX53Ce69AZbGsdX20ZQAsLZekg=;
 b=kjm6hGuTkq45YJYVUGa1lDJnFs9oiHIIeTJ+xTbwpgvwGQqdzurWfIOE
 8GuSPAovOj8KpiPsB95GUN1ic6DHLb8LtWtp+ybygn1iGjRxKKfNCtviS
 hnZ0mysBfxungGtVjrcXPLasds0+3MpGk4nZCfEaZUfKVOjCjImcYpU6J
 eNGC6SjdnmlSAwa1w07+vsARLEP6d1G3Nw35/QvFqsSXnGiGnyslmqMmR
 h9tSWzEhg2B4FY6Saj2c9l8MjFH1ooHch0QBaRiJFpjxrK+qopux53DVV
 kxn/rX54wccIfDIGI2GH5zvay1mSLX4zRtDpzKN2zP6cqKFG7rOVppyr8 w==;
X-CSE-ConnectionGUID: hzXewG6nRO6t1WS0zjPWOA==
X-CSE-MsgGUID: S6PNMyFsR2akKyUVag2HJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33057763"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33057763"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:58:15 -0700
X-CSE-ConnectionGUID: 6VHhfWDPSVmwryardL3n7A==
X-CSE-MsgGUID: Eljf0Bq/Qi+HIuXmzErT9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="91319937"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:58:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 4/7] drm/xe/oa: Signal output fences
Date: Mon, 19 Aug 2024 17:58:05 -0700
Message-ID: <20240820005808.1412649-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
References: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
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

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c       | 110 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_oa_types.h |   3 +
 2 files changed, 100 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index cad8f54500a10..1478d88722170 100644
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
@@ -945,13 +954,62 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
 	return oa_bo;
 }
 
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
+static struct xe_oa_fence *xe_oa_fence_arm(struct xe_oa_stream *stream)
+{
+	struct xe_oa_fence *ofence;
+
+	ofence = kzalloc(sizeof(*ofence), GFP_KERNEL);
+	if (!ofence)
+		return ERR_PTR(-ENOMEM);
+
+	dma_fence_init(&ofence->base, &xe_oa_fence_ops, &stream->oa_fence_lock, 0, 0);
+	return ofence;
+}
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
 
 	/* Emit OA configuration batch */
 	oa_bo = xe_oa_alloc_config_buffer(stream, config);
@@ -966,18 +1024,43 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
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
+	/* Initialize and set fence to signal */
+	ofence = xe_oa_fence_arm(stream);
+	if (IS_ERR(ofence)) {
+		err = PTR_ERR(ofence);
+		goto put_fence;
+	}
 
-	/* Additional empirical delay needed for NOA programming after registers are written */
-	usleep_range(us, 2 * us);
+	for (i = 0; i < stream->num_syncs; i++) {
+		if (stream->syncs[i].flags & DRM_XE_SYNC_FLAG_SIGNAL)
+			num_signal++;
+		xe_sync_entry_signal(&stream->syncs[i], &ofence->base);
+	}
+
+	/* Add job fence callback to schedule work to signal ofence->base */
+	err = dma_fence_add_callback(fence, &ofence->cb, xe_oa_config_cb);
+	if (err == -ENOENT)
+		xe_oa_config_cb(fence, &ofence->cb);
+	else if (err)
+		goto put_ofence;
+
+	/* If nothing needs to be signaled we wait synchronously */
+	if (!num_signal)
+		dma_fence_wait(&ofence->base, true);
+
+	/* Done with syncs */
+	for (i = 0; i < stream->num_syncs; i++)
+		xe_sync_entry_cleanup(&stream->syncs[i]);
+	kfree(stream->syncs);
+
+	return 0;
+put_ofence:
+	for (i = 0; i < stream->num_syncs; i++)
+		xe_sync_entry_cleanup(&stream->syncs[i]);
+	kfree(stream->syncs);
+	dma_fence_put(&ofence->base);
+put_fence:
+	dma_fence_put(fence);
 exit:
 	return err;
 }
@@ -1480,6 +1563,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
 		goto err_free_oa_buf;
 	}
 
+	spin_lock_init(&stream->oa_fence_lock);
 	ret = xe_oa_enable_metric_set(stream);
 	if (ret) {
 		drm_dbg(&stream->oa->xe->drm, "Unable to enable metric set\n");
diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
index c1ca960af9305..412f1460c1437 100644
--- a/drivers/gpu/drm/xe/xe_oa_types.h
+++ b/drivers/gpu/drm/xe/xe_oa_types.h
@@ -239,6 +239,9 @@ struct xe_oa_stream {
 	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
 	u32 no_preempt;
 
+	/** @oa_fence_lock: Lock for struct xe_oa_fence */
+	spinlock_t oa_fence_lock;
+
 	/** @num_syncs: size of @syncs array */
 	u32 num_syncs;
 
-- 
2.41.0

