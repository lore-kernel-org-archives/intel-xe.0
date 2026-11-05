Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F13606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GlNg1Iu3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D450C10E909;
	Thu,  5 Nov 2026 00:16:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7333C10E909
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 00:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793837783; x=1825373783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VZIlILzbems6oJ78CNITfre4aTRmecLTUze8wtM7wwo=;
 b=GlNg1Iu3tkxEdCf9C2NkkUrKo+Ibkpw+D/lZafYoHIWLk+4ZUkVdyTKd
 QcBVGfPDPucUl/EIBZqWyWEzKVrkn8HMMnm5LiFvBOH02SOhFdDmL8U7p
 F3hurAGwHp8zQkAICn5gbktNf4BRxhue+mkb13liulgx5U2ddSMWjEa4r
 Q7v3zbrgqMzOeomd13L9ilP9e2XKSQia5nHHenerrMV1RAgutUdniGxUs
 QCxw2e8SG6OG58BXeY1Tvi5TjEXpj0pk5B8m4sQuYa0hp+HEiFampW14r
 VWKPnvUF/ecGOf5WelIaDHeCKrXnYfmzLY4GAjb+SgciiLJz4oEyXPcND Q==;
X-CSE-ConnectionGUID: KLtuyZsZRVy49TlaRQns1Q==
X-CSE-MsgGUID: HX5HjBKbQwie3oQMZ0iafA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2605968"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2605968"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 16:16:11 -0800
X-CSE-ConnectionGUID: +DnFB6szTC2YLwhJZT1dOQ==
X-CSE-MsgGUID: 4oMo3sAPRxKfk1bD7g4jMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6761945"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 16:16:11 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 Matthew Brost <matthew.brost@intel.com>
Cc: harish.chegondi@intel.com
Subject: [PATCH v4 5/7] drm/xe/oa: Wait for in-flight OA batches before stream
 HW teardown
Date: Wed,  4 Nov 2026 16:16:05 -0800
Message-ID: <20261105001559.3288915-14-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
References: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Config batches submitted with output syncs and context LRI batches are
not waited for. If one is still in flight when the stream is closed, it
can program the OA registers after they were restored.

Both go to the same exec queue, so also record the LRI batch fence in
stream->last_fence, and wait for it before the HW teardown, bounded by
the job timeout of the exec queue.
---
 drivers/gpu/drm/xe/xe_oa.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 7552ace821ca..31fc1e7675de 100644
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
@@ -913,6 +937,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
 
 	mutex_destroy(&stream->stream_lock);
 
+	xe_oa_stream_drain(stream);
 	if (!xe_wedged(stream->oa->xe))
 		xe_oa_stream_hw_teardown(stream);
 	xe_oa_stream_free_resources(stream);
@@ -1009,12 +1034,6 @@ xe_oa_alloc_config_buffer(struct xe_oa_stream *stream, struct xe_oa_config *oa_c
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

