Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAB7CD11C2
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 22:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F52410EAF9;
	Fri, 30 Aug 2024 22:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2XwaZrH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9601E10EAF3
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725056195; x=1756592195;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1jsEy1lND4dyrKaUZSQMUWZXfNjyobsftLbhdaM8pps=;
 b=m2XwaZrHsrMFU8jhtr2YHcWOtK3vUl6lOhl2AtgvdHyrLIUoFDn5MrLJ
 8XiSs2JILxb6VHqWkkmbMvMoOLLD7iruiTAEWry155ZLNPelrWMeH2FaB
 8EASHbhavcnjk62ncLtY1dHCirSFKfSBgAOCe53qoI4883y2DQ2dyogY0
 VATxo91wvofe6kjntjB+/JQi3izgL0Lwz0hZnR06DjlGVJy9dkFxOMN6z
 yLDz4CA7LfjjbxJJ1vUQNw2zTh+0abE508KghnlWuRU1R2q4i9giak97U
 LOzwIJH+d0XPfe0JxR2RQIXPvlmyOSN1Q6ANxNlg0qvHi5wIv7SubW1fN g==;
X-CSE-ConnectionGUID: /4NWrolnTBqZbOj7SjQl6w==
X-CSE-MsgGUID: JFrVn8gDSnilaTgpOu2bRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23898739"
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="23898739"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 15:16:34 -0700
X-CSE-ConnectionGUID: MJXyvAFHSQqMjC8yaSQSFQ==
X-CSE-MsgGUID: ChgXWVDsS2iowsPS7kP4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,190,1719903600"; d="scan'208";a="64040409"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 15:16:34 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/7] drm/xe/oa: Separate batch submission from waiting for
 completion
Date: Fri, 30 Aug 2024 15:16:12 -0700
Message-ID: <20240830221618.2103948-2-ashutosh.dixit@intel.com>
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

When we introduce xe_syncs, we don't wait for internal OA programming
batches to complete. That is, xe_syncs are signaled asynchronously. In
anticipation for this, separate out batch submission from waiting for
completion of those batches.

v2: Change return type of xe_oa_submit_bb to "struct dma_fence *" (Matt B)

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 59 +++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 63286ed8457fa..676d6ae5c75de 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -563,12 +563,11 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
 	return ret;
 }
 
-static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
+static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
 {
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
-	long timeout;
-	int err = 0;
+	int err;
 
 	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
 	job = xe_bb_create_job(stream->k_exec_q, bb);
@@ -581,14 +580,9 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
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
@@ -652,6 +646,7 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 				  const struct flex *flex, u32 count)
 {
+	struct dma_fence *fence;
 	struct xe_bb *bb;
 	int err;
 
@@ -663,7 +658,16 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 
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
@@ -671,6 +675,7 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 
 static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
 {
+	struct dma_fence *fence;
 	struct xe_bb *bb;
 	int err;
 
@@ -682,7 +687,16 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 
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
@@ -913,15 +927,32 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
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

