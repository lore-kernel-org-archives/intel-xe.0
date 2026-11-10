Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1715B606A321
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aNFPMTga
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C750610EDDD;
	Tue, 10 Nov 2026 19:01:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982DE10E969
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 19:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794337268; x=1825873268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fwn4wKZWzaXz43nN1j3Z9mqkNFwyJRI7IoifxXfRjwQ=;
 b=aNFPMTgajD+RUaRMl9agp1YmVcsgBxVisvrUad2SXNf+DEq03FWE4gHM
 4ovNB6Caqbai4rjdHnIQzceKW8iOnCrQwH0bvGeNVjtP+T61+lzTzx2/t
 4YN4tLcwAAeiN5LE4tZQeKTvzp49k/XLDVpRPWoh/P/E8p2e7rlXpmENL
 aEe4JntEqRp647NGXOGU91E8g1TK87KzMyrXwGudBeBksN6cs6usQH30X
 KQuxzvUQI0qHY7CB767GFTScrZmQUnBdasXts3LZSC+6JyO/px7bwe8U7
 Uzx0EYUkIxs1dn7blGzOPvYNZd6rEqpOfit01q2oO9jO4Kx3Vu8SRg7ml Q==;
X-CSE-ConnectionGUID: sFqIMFNGS+eF2AYTdeuIGw==
X-CSE-MsgGUID: AxhIwkSnT2K16IE7vGq+7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3116717"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3116717"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 11:01:01 -0800
X-CSE-ConnectionGUID: QsmhkiXdSoC0v0heP8bwoA==
X-CSE-MsgGUID: 8w5fDXj/SZqxPu4fDHJUwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8300618"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 11:01:00 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org,
	shekhar.chauhan@intel.com
Cc: harish.chegondi@intel.com
Subject: [PATCH v5 5/7] drm/xe/oa: Wait for in-flight OA batches before stream
 HW teardown
Date: Tue, 10 Nov 2026 11:00:58 -0800
Message-ID: <20261110190052.3514226-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
References: <20261110190052.3514226-9-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 8a3e1ac2a068..f3d3b2eaddd8 100644
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
@@ -876,6 +883,23 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
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
+	if (!dma_fence_wait_timeout(stream->last_fence, false, timeout))
+		drm_err(&stream->oa->xe->drm, "Timed out waiting for OA batch\n");
+}
+
 /*
  * Also drops forcewake, which accesses the HW too. On a wedged device this is skipped and
  * the forcewake reference leaks, which is fine: the device needs a reset or rebind to
@@ -914,6 +938,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 	/* The poll timer may still be armed if the OA disable was skipped */
 	hrtimer_cancel(&stream->poll_check_timer);
 
+	xe_oa_stream_drain(stream);
 	if (!xe_wedged(stream->oa->xe))
 		xe_oa_stream_hw_teardown(stream);
 
@@ -1012,12 +1037,6 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
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

