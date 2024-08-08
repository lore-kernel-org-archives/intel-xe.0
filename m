Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B721C52D7B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 17:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D6510E7BA;
	Thu,  8 Aug 2024 17:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R35GVYTb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93B110E7C5
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723138910; x=1754674910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5XJAFp6HzVrUQNQcj180nup/XHPuvqGgfM2JBfxlu/k=;
 b=R35GVYTbHP2aVUYBQC74KU/GhQB1bRQRbOnh6xEI+3uaNVgufIVy/qhn
 paVZ3eogMPd7CafQp3khWFFi/qm2A/aQ+Zsa1oDx3NGDjlPjJBitm3kC/
 B3p1mQLGCBbLEMPM9Xw3eKGHgZKviBfuckwST9Vl7TfemikZpIl1s7fye
 y3/LMbYYZgjEp4VhYU9UI3L2AAgdNw3VparImyVLAxOAMTDYmgAzc4dTF
 WRgPBRePd1aFCegYjsTdvtgbLhMujGkjrKEgi2kCiuJGcuiRZXgDf2B3L
 uxb0DGQTj31KyRHdBNrxhdl3IT/P4zqwpsjIcUNb40dET9IIWfmWbLmCx g==;
X-CSE-ConnectionGUID: lQKcaZ+4QIK/lM80bBz0IQ==
X-CSE-MsgGUID: rQVBUlx2Sgel+/ybIJBBsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21256060"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="21256060"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
X-CSE-ConnectionGUID: oXUdFqSBRCaASvodArW3Rg==
X-CSE-MsgGUID: mR2FHA0kSqGGG732jxMusA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="57850444"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 10:41:49 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Subject: [PATCH 1/8] drm/xe/oa: Separate batch submission from waiting for
 completion
Date: Thu,  8 Aug 2024 10:41:32 -0700
Message-ID: <20240808174139.4027534-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
References: <20240808174139.4027534-1-ashutosh.dixit@intel.com>
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

When we introduce xe_syncs, we don't wait for internal OA programming
batches to complete. That is, xe_syncs are signaled asynchronously. In
anticipation for this, separate out batch submission from waiting for
completion of those batches.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 45 ++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 3ef92eb8fbb1e..d842c801fb9f1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -563,11 +563,10 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
 	return ret;
 }
 
-static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
+static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb,
+			   struct dma_fence **fence)
 {
 	struct xe_sched_job *job;
-	struct dma_fence *fence;
-	long timeout;
 	int err = 0;
 
 	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
@@ -578,15 +577,8 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
 	}
 
 	xe_sched_job_arm(job);
-	fence = dma_fence_get(&job->drm.s_fence->finished);
+	*fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
-
-	timeout = dma_fence_wait_timeout(fence, false, HZ);
-	dma_fence_put(fence);
-	if (timeout < 0)
-		err = timeout;
-	else if (!timeout)
-		err = -ETIME;
 exit:
 	return err;
 }
@@ -652,6 +644,7 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 				  const struct flex *flex, u32 count)
 {
+	struct dma_fence *fence;
 	struct xe_bb *bb;
 	int err;
 
@@ -663,14 +656,16 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 
 	xe_oa_store_flex(stream, lrc, bb, flex, count);
 
-	err = xe_oa_submit_bb(stream, bb);
-	xe_bb_free(bb, NULL);
+	err = xe_oa_submit_bb(stream, bb, &fence);
+	xe_bb_free(bb, fence);
+	dma_fence_put(fence);
 exit:
 	return err;
 }
 
 static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
 {
+	struct dma_fence *fence;
 	struct xe_bb *bb;
 	int err;
 
@@ -682,8 +677,9 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 
 	write_cs_mi_lri(bb, reg_lri, 1);
 
-	err = xe_oa_submit_bb(stream, bb);
-	xe_bb_free(bb, NULL);
+	err = xe_oa_submit_bb(stream, bb, &fence);
+	xe_bb_free(bb, fence);
+	dma_fence_put(fence);
 exit:
 	return err;
 }
@@ -913,15 +909,30 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 {
 #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
 	struct xe_oa_config_bo *oa_bo;
-	int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
+	int err = 0, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
+	struct dma_fence *fence;
+	long timeout;
 
+	/* Emit OA configuration batch */
 	oa_bo = xe_oa_alloc_config_buffer(stream, config);
 	if (IS_ERR(oa_bo)) {
 		err = PTR_ERR(oa_bo);
 		goto exit;
 	}
 
-	err = xe_oa_submit_bb(stream, oa_bo->bb);
+	err = xe_oa_submit_bb(stream, oa_bo->bb, &fence);
+	if (err)
+		goto exit;
+
+	/* Wait till all previous batches have executed */
+	timeout = dma_fence_wait_timeout(fence, false, 5 * HZ);
+	dma_fence_put(fence);
+	if (timeout < 0)
+		err = timeout;
+	else if (!timeout)
+		err = -ETIME;
+	if (err)
+		drm_dbg(&stream->oa->xe->drm, "dma_fence_wait_timeout err %d\n", err);
 
 	/* Additional empirical delay needed for NOA programming after registers are written */
 	usleep_range(us, 2 * us);
-- 
2.41.0

