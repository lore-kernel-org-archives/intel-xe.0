Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1430606A88C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 22:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K0A5enk4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBC810E208;
	Mon, 16 Nov 2026 22:30:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EAC10E478
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 22:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794868212; x=1826404212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dNl6P+h4/Mn0M/Hbd2FiZ9JngJ3Kfg7CnryYstDa1Cg=;
 b=K0A5enk4r027W1cic9lYRrrXDE+t8eeQfLwi/IWzP2/aZuXse3QJJYUC
 soA3kviGAtBu6cBpgBbKzuO/us08Bjxvy5vcS2fV7JNNngK3Y2q4ihyvQ
 LpWvcAD9gGllwzVBHs1qJfPItqwIKb8tqZvi6bj8EMAv1t/aUt8xom6NO
 zp2UgcPHwBF2GHjbMm8jQCos/VVelR80CShbYKlm9wvKeQ5MdD3pN6SpG
 LGOJK6VEWyuJebnYe7S0K2s/j6cTuzSWFB2TbOINMapdlN+YNZfuzBhUW
 chmBKvQ/yfWFLItxGeJtk/jh1y0H5RGhILkQLrEcpwqcHHCMtABzwXGr/ Q==;
X-CSE-ConnectionGUID: gNRhY3OHQ0O5LjEsZqVbzg==
X-CSE-MsgGUID: Ra8yFrWoSQ2DNWZc/VI+yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3699699"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3699699"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 14:28:05 -0800
X-CSE-ConnectionGUID: toso2hY2QC2/uNoInNrx3w==
X-CSE-MsgGUID: E1jNO1CnTVu5Wzfq503z3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9705053"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 14:28:04 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: shekhar.chauhan@intel.com, harish.chegondi@intel.com,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v6 5/7] drm/xe/oa: Wait for in-flight OA batches before stream
 HW teardown
Date: Mon, 16 Nov 2026 14:27:58 -0800
Message-ID: <20261116222752.3677159-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com>
References: <20261116222752.3677159-9-umesh.nerlige.ramappa@intel.com>
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
the job timeout of the exec queue.

A config batch with an input sync that doesn't signal sits in the
scheduler, where no TDR times it out, and would still run once the sync
signals. Kill the exec queue if the wait times out, so the batch is
dropped instead.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
v2: Kill the exec queue if the wait times out (Sashiko)
---
 drivers/gpu/drm/xe/xe_oa.c | 46 +++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 8ed427ad67b4..1a37312de099 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -733,6 +733,12 @@ static void xe_oa_free_configs(struct xe_oa_stream *stream)
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
@@ -753,6 +759,7 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 		goto free_bb;
 	}
 	xe_bb_free(bb, fence);
+	xe_oa_update_last_fence(stream, fence);
 	dma_fence_put(fence);
 
 	return 0;
@@ -876,6 +883,38 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
 		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE, 0);
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
+	timeout = msecs_to_jiffies(q->sched_props.job_timeout_ms) + HZ;
+	if (dma_fence_wait_timeout(stream->last_fence, false, timeout))
+		return;
+
+	drm_err(&stream->oa->xe->drm, "Timed out waiting for OA batch, killing exec queue\n");
+
+	/*
+	 * The batch is most likely still waiting for an input sync, which no TDR covers. Kill
+	 * the exec queue, so the batch is dropped instead of run when the input sync signals.
+	 * A batch already on the HW gets cleaned up by the TDR the kill triggers, give it a
+	 * moment.
+	 */
+	if (q->vm)
+		xe_exec_queue_kill(q);
+	else
+		q->ops->kill(q);
+
+	dma_fence_wait_timeout(stream->last_fence, false, HZ);
+}
+
 static void xe_oa_stream_hw_teardown(struct xe_oa_stream *stream)
 {
 	if (stream->sample)
@@ -909,6 +948,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	/* The poll timer may still be armed if the OA disable was skipped */
 	hrtimer_cancel(&stream->poll_check_timer);
 
+	xe_oa_stream_drain(stream);
 	if (!xe_wedged(stream->oa->xe))
 		xe_oa_stream_hw_teardown(stream);
 
@@ -1007,12 +1047,6 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
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

