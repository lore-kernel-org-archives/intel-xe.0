Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DDFCDD555
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 19:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C3D10E640;
	Wed, 18 Sep 2024 19:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLMxWm75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C1110E63D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 19:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726689215; x=1758225215;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=M9ktbcGfbt9uAuZQIQaTbZnO+gtSrGLqZV0xJtRtMLE=;
 b=iLMxWm75Z2t4Z0BMI87L8LG+OEa15Ur+yAJ5UI9FD/gCEn/hRG1dHEap
 twTXMqVmw0PttcN9Kab1cHc5BdKRwrJhbOlaz9PXG6Z9WiAmR/fsLasdt
 rEZepF3LLLymbWzvYkJ6EKVTYJLiv3bsDiArXygu4zMRAqUbInI2+vaTM
 47ARI8omQV4292jOnY+tIdu21aZBuKpofIeScrna33NniRxpEDIQR6kNw
 BjnOtOlt3hDJ8O+cWm7BcZHp2gGWm/22K9KoF9pOtpICeN17E5QbD07SJ
 KXnDlSZqX9vVFT+6exvhshoO1pxPO34TJFMjEhgIfTqU5FQUQNWo2RjqT Q==;
X-CSE-ConnectionGUID: U5rfpQjeSV+IJn74XVd6dg==
X-CSE-MsgGUID: gx0rD+/URlWbZ1KH5ePXeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="48152926"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="48152926"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 12:53:34 -0700
X-CSE-ConnectionGUID: Oaxf2t5dRaGrmduveeoBtg==
X-CSE-MsgGUID: 3wpLwpXyQrim3roCeE43pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="100406148"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 12:53:35 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/7] drm/xe/oa: Separate batch submission from waiting for
 completion
Date: Wed, 18 Sep 2024 12:53:23 -0700
Message-ID: <20240918195330.3167756-2-ashutosh.dixit@intel.com>
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

When we introduce xe_syncs, we don't wait for internal OA programming
batches to complete. That is, xe_syncs are signaled asynchronously. In
anticipation for this, separate out batch submission from waiting for
completion of those batches.

v2: Change return type of xe_oa_submit_bb to "struct dma_fence *" (Matt B)
v3: Retain init "int err = 0;" in xe_oa_submit_bb (Jose)

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 57 +++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 354ee9045efc8..52805e159e6fd 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -570,11 +570,10 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
 	return ret;
 }
 
-static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
+static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
 {
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
-	long timeout;
 	int err = 0;
 
 	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
@@ -588,14 +587,9 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 
-	timeout = dma_fence_wait_timeout(fence, false, HZ);
-	dma_fence_put(fence);
-	if (timeout < 0)
-		err = timeout;
-	else if (!timeout)
-		err = -ETIME;
+	return fence;
 exit:
-	return err;
+	return ERR_PTR(err);
 }
 
 static void write_cs_mi_lri(struct xe_bb *bb, const struct xe_oa_reg *reg_data, u32 n_regs)
@@ -659,6 +653,7 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 				  const struct flex *flex, u32 count)
 {
+	struct dma_fence *fence;
 	struct xe_bb *bb;
 	int err;
 
@@ -670,7 +665,16 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 
 	xe_oa_store_flex(stream, lrc, bb, flex, count);
 
-	err = xe_oa_submit_bb(stream, bb);
+	fence = xe_oa_submit_bb(stream, bb);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+		goto free_bb;
+	}
+	xe_bb_free(bb, fence);
+	dma_fence_put(fence);
+
+	return 0;
+free_bb:
 	xe_bb_free(bb, NULL);
 exit:
 	return err;
@@ -678,6 +682,7 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 
 static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
 {
+	struct dma_fence *fence;
 	struct xe_bb *bb;
 	int err;
 
@@ -689,7 +694,16 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 
 	write_cs_mi_lri(bb, reg_lri, 1);
 
-	err = xe_oa_submit_bb(stream, bb);
+	fence = xe_oa_submit_bb(stream, bb);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+		goto free_bb;
+	}
+	xe_bb_free(bb, fence);
+	dma_fence_put(fence);
+
+	return 0;
+free_bb:
 	xe_bb_free(bb, NULL);
 exit:
 	return err;
@@ -922,15 +936,32 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
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
+	fence = xe_oa_submit_bb(stream, oa_bo->bb);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+		goto exit;
+	}
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

