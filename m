Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF778606A321
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 20:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c6sFdQi8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E19E10E0EC;
	Tue, 24 Nov 2026 20:12:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D5D10E1BB
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 20:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795551129; x=1827087129;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4v88doPXJjkntJ+50XGHil5GV3tWum0HZvAX1LN4VjM=;
 b=c6sFdQi8NOO06fQndk+xnXY5RJxFD1OA18Gjh7OC51rK+8Y9yOxuPEJU
 BYKCz1rxH/j6Lg3jw2JHLraJRLuTQefF+jRGlrwjNGOp4UX25wWYT90qe
 ggBureiZUZPU8TRkXLMapqJeHiXvKOK4wK419G3O4Hle6p5fjuYjZktBW
 1/FEPuA5Qqm1SF5KuDkqr/phcP1coC3Bk/HH2qIKZUx1ao0uFHUIL9zG2
 fiLvBM/zWnOj0Np9jtUg2wJVWASJ6C1N8P18x5QlFcRScMaOCMgY1tz/n
 wwFdObApHk4UfKT4cUHvK1zpDXbtvWHtjOHLiyv6YiB2CqvXImb0rpaj/ Q==;
X-CSE-ConnectionGUID: U3OqJ0cuTqSUI+jU7yUukg==
X-CSE-MsgGUID: Zs0FotlSSuOGUrx7vG9F9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4305569"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4305569"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:11:58 -0800
X-CSE-ConnectionGUID: tEbA/1VfTNqK8PRAZSKRCw==
X-CSE-MsgGUID: kTXh2BQfS5aPjWgveJOZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12240631"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 12:11:58 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v10 4/7] drm/xe/oa: Wait for in-flight OA batches before
 stream HW teardown
Date: Tue, 24 Nov 2026 12:11:55 -0800
Message-ID: <20261124201150.405479-13-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
References: <20261124201150.405479-9-umesh.nerlige.ramappa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Config batches submitted with output syncs and context LRI batches are
not waited for. If one is still in flight when the stream is closed, it
can program the OA registers after they were restored.

Both go to the same exec queue, so also record the LRI batch fence in
stream->last_fence, and wait for it before the HW teardown, bounded by
the job timeout of the exec queue. Also wait for the LRI batch that
disables the context save/restore of the OA counters during the HW
teardown, which covers the stream init error path as well.

A config batch with an input sync that doesn't signal sits in the
scheduler, where no TDR times it out, and still runs once the sync
signals, possibly reprogramming the OA config of a later stream. Don't
kill the exec queue when the wait times out to prevent that: the TDR of
a killed kernel exec queue resets the GT and can wedge the device.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
v2: Kill the exec queue if the wait times out (Sashiko)
v3: Drop the exec queue kill, it can reset the GT and wedge the device
    when the batch is on the kernel exec queue. Wait for the context LRI
    batch of the HW teardown too (Sashiko)
---
 drivers/gpu/drm/xe/xe_oa.c | 46 +++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7677f3f2c65a..7241cf18b325 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -741,6 +741,12 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
 	dma_fence_put(stream->last_fence);
 }
 
+static void xe_oa_update_last_fence(struct xe_oa_stream *stream, struct dma_fence *fence)
+{
+	dma_fence_put(stream->last_fence);
+	stream->last_fence = dma_fence_get(fence);
+}
+
 static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri, u32 count)
 {
 	struct dma_fence *fence;
@@ -761,6 +767,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 		goto free_bb;
 	}
 	xe_bb_free(bb, fence);
+	xe_oa_update_last_fence(stream, fence);
 	dma_fence_put(fence);
 
 	return 0;
@@ -848,6 +855,28 @@ static u32 oag_configure_mmio_trigger(const struct xe_oa_stream *stream, bool en
 		return REG_MASKED_FIELD_ENABLE(OAG_OA_DEBUG_DISABLE_MMIO_TRG);
 }
 
+/*
+ * Wait for the last OA batch of the stream, so that it can't program the HW after the HW
+ * teardown.
+ */
+static void xe_oa_stream_drain(struct xe_oa_stream *stream)
+{
+	struct xe_exec_queue *q = stream->exec_q ?: stream->k_exec_q;
+	long timeout;
+
+	if (!stream->last_fence || dma_fence_is_signaled(stream->last_fence))
+		return;
+
+	/*
+	 * A batch waiting for an input sync that doesn't signal isn't covered by a TDR and still
+	 * runs once the sync signals, possibly reprogramming the OA config. Don't kill the exec
+	 * queue to prevent that, the TDR of a killed kernel exec queue resets the GT.
+	 */
+	timeout = msecs_to_jiffies(q->sched_props.job_timeout_ms) + HZ;
+	if (!dma_fence_wait_timeout(stream->last_fence, false, timeout))
+		drm_err(&stream->oa->xe->drm, "Timed out waiting for OA batch\n");
+}
+
 static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 {
 	struct xe_mmio *mmio = &stream->gt->mmio;
@@ -864,9 +893,14 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 	xe_mmio_write32(mmio, __oa_regs(stream)->oa_debug,
 			oag_configure_mmio_trigger(stream, false));
 
-	/* disable the context save/restore or OAR counters */
-	if (stream->exec_q)
+	/*
+	 * disable the context save/restore or OAR counters, and wait for that batch like for
+	 * the ones before it
+	 */
+	if (stream->exec_q) {
 		xe_oa_configure_oa_context(stream, false);
+		xe_oa_stream_drain(stream);
+	}
 
 	/* Make sure we disable noa to save power. */
 	if (GT_VER(stream->gt) < 35)
@@ -896,6 +930,8 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	mutex_destroy(&stream->stream_lock);
 
+	xe_oa_stream_drain(stream);
+
 	if (stream->sample)
 		xe_reg_dewhitelist_oa_regs(stream->gt);
 
@@ -1002,12 +1038,6 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
 	return oa_bo;
 }
 
-static void xe_oa_update_last_fence(struct xe_oa_stream *stream, struct dma_fence *fence)
-{
-	dma_fence_put(stream->last_fence);
-	stream->last_fence = dma_fence_get(fence);
-}
-
 static void xe_oa_fence_work_fn(struct work_struct *w)
 {
 	struct xe_oa_fence *ofence = container_of(w, typeof(*ofence), work.work);
-- 
2.55.0

