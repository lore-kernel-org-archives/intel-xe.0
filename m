Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C533606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 00:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GgTeMuYA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DAC10ECFF;
	Thu, 19 Nov 2026 00:29:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C86310ECFF
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 00:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795048151; x=1826584151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UInCIwdEwaOTYni5zK9DOEGiMlR9/IT/HM0ELB0bcqU=;
 b=GgTeMuYAl2LObr8eEB/a+1RIixOl1zGcO0sEnoD/N5ai/i3A+Q0H/Do0
 bvhz+1ehmHJwwU562nb8D5vi2Q+CwyBadTI080eCzZMPDrBKPLuI3qJ9n
 tyWxP7xon+SFoHlR/hb9obQupip9lUjgXR+cqWlWKS1PxjnM5coIEEe20
 pxLke6vLS2dR74V4s0IiBpFqfTOiGjRuxfYHshCND0lUVX7dCpHr1LXKW
 beG2ZoM7JHk1olUuprmljJuD0U7Fi2AIponzIDQFm5q6S2OOQIG2dLjih
 gRsDHZkpaFWS9RNoqCkNyxYhhTZ7aW1ip0wD1tZdofChn2o+VK1M2crtU A==;
X-CSE-ConnectionGUID: yovvOkNvSRScL2lx/u7hRA==
X-CSE-MsgGUID: W7DitQvESp+Qja/dopdvpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3876664"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3876664"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
X-CSE-ConnectionGUID: 86tsShzkREycTYDYXvluHQ==
X-CSE-MsgGUID: zcb+5rjLSaegQ37M27tNgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10081552"
Received: from orsosgc001.jf.intel.com ([10.54.56.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 16:29:01 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, shekhar.chauhan@intel.com,
 harish.chegondi@intel.com
Cc: matthew.brost@intel.com
Subject: [PATCH v8 3/8] drm/xe/oa: Wait for in-flight OA batches before stream
 HW teardown
Date: Wed, 18 Nov 2026 16:27:41 -0800
Message-ID: <20261119002737.3899877-13-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
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
---
v2: Kill the exec queue if the wait times out (Sashiko)
v3: Drop the exec queue kill, it can reset the GT and wedge the device
    when the batch is on the kernel exec queue. Wait for the context LRI
    batch of the HW teardown too (Sashiko)
---
 drivers/gpu/drm/xe/xe_oa.c | 46 +++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index d574b0ecf39b..1c2f57735e0d 100644
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

