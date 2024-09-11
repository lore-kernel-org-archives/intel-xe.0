Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F76AEE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E4810EA7F;
	Wed, 11 Sep 2024 20:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QZHzZ0dG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D57F10E9C4
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726084949; x=1757620949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hYcJG32hHHZiy+B6ZyLi03oHIin40awjnuSHssAypIo=;
 b=QZHzZ0dGeJ4miEerGmypCaRYZCgQh0MS7JC7yVV3VJB/2aa3oGR037Gg
 Jg4e25UJOgYgHgbG+xJU4m00u6uwnMK/RiMsjJsOX0ADClynj8iK7Qjw3
 vXEfjaVelGpOa68Nisy9yZJAA11PYEKiQSgtxAW7iVRw6gwR140qB/BgM
 Z/V5jlASWu3Lon/HGSUybx41HLB7MFged2p63UXfN33f2Q7l3EQFJn0WG
 MnFGuL/20NuOmcI4cHR8OD23PI+EZx9Zb+UFgNg2RFFdIkcQacEqfO1Ze
 zfu0ELxF3WmKfCS6vBWQLOft45jTdLBgeXiijSfeI0nfD8zQCUlPXF/M6 w==;
X-CSE-ConnectionGUID: UK+Za46jQdKrVe0xv76A0A==
X-CSE-MsgGUID: crDtz3DBT+eQzvhdyAn/mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25066817"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="25066817"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:02:29 -0700
X-CSE-ConnectionGUID: mqtR/FY1TrCPf5EyJED3SA==
X-CSE-MsgGUID: SW5qoN2KROK/iVO9UJK2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="98177334"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:02:28 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Subject: [PATCH 2/3] drm/xe: Add a parameter to xe_bb_create_job() to append
 or not batch buffer end instruction
Date: Wed, 11 Sep 2024 13:02:17 -0700
Message-ID: <20240911200218.130219-2-jose.souza@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911200218.130219-1-jose.souza@intel.com>
References: <20240911200218.130219-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There is overflow happening in OA because it reuses batch buffers,
so at each submission one batch buffer end instruction is appended
eventually causing a overflow.
That will be fixed in the next patch, here just adding adding
parameter and updating all the callers.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_bb.c         | 13 ++++++++-----
 drivers/gpu/drm/xe/xe_bb.h         |  2 +-
 drivers/gpu/drm/xe/xe_gsc.c        |  2 +-
 drivers/gpu/drm/xe/xe_gsc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_gt.c         |  4 ++--
 drivers/gpu/drm/xe/xe_oa.c         |  2 +-
 6 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index a13e0b3a169ed..a3dd8c3f9717e 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -61,11 +61,13 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 }
 
 static struct xe_sched_job *
-__xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
+__xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr,
+		   bool emit_bb_end)
 {
 	u32 size = drm_suballoc_size(bb->bo);
 
-	bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
+	if (emit_bb_end)
+		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 
 	xe_gt_assert(q->gt, bb->len * 4 + bb_prefetch(q->gt) <= size);
 
@@ -89,17 +91,18 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
 	xe_gt_assert(q->gt, xe_sched_job_is_migration(q));
 	xe_gt_assert(q->gt, q->width == 1);
 
-	return __xe_bb_create_job(q, bb, addr);
+	return __xe_bb_create_job(q, bb, addr, true);
 }
 
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
-				      struct xe_bb *bb)
+				      struct xe_bb *bb,
+				      bool emit_bb_end)
 {
 	u64 addr = xe_sa_bo_gpu_addr(bb->bo);
 
 	xe_gt_assert(q->gt, !xe_sched_job_is_migration(q));
 	xe_gt_assert(q->gt, q->width == 1);
-	return __xe_bb_create_job(q, bb, &addr);
+	return __xe_bb_create_job(q, bb, &addr, emit_bb_end);
 }
 
 void xe_bb_free(struct xe_bb *bb, struct dma_fence *fence)
diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
index fafacd73dcc38..c696726eb697e 100644
--- a/drivers/gpu/drm/xe/xe_bb.h
+++ b/drivers/gpu/drm/xe/xe_bb.h
@@ -16,7 +16,7 @@ struct xe_sched_job;
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
 struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
-				      struct xe_bb *bb);
+				      struct xe_bb *bb, bool emit_bb_end);
 struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
 						struct xe_bb *bb, u64 batch_ofs,
 						u32 second_idx);
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 6fbea70d3d36d..8af50672097c7 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -83,7 +83,7 @@ static int emit_gsc_upload(struct xe_gsc *gsc)
 	bb->cs[bb->len++] = upper_32_bits(offset);
 	bb->cs[bb->len++] = (gsc->private->size / SZ_4K) | GSC_FW_LOAD_LIMIT_VALID;
 
-	job = xe_bb_create_job(gsc->q, bb);
+	job = xe_bb_create_job(gsc->q, bb, true);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
 		return PTR_ERR(job);
diff --git a/drivers/gpu/drm/xe/xe_gsc_submit.c b/drivers/gpu/drm/xe/xe_gsc_submit.c
index 9ede483d37efd..ce316e8b7a46b 100644
--- a/drivers/gpu/drm/xe/xe_gsc_submit.c
+++ b/drivers/gpu/drm/xe/xe_gsc_submit.c
@@ -198,7 +198,7 @@ int xe_gsc_pkt_submit_kernel(struct xe_gsc *gsc, u64 addr_in, u32 size_in,
 	bb->cs[bb->len++] = size_out;
 	bb->cs[bb->len++] = 0;
 
-	job = xe_bb_create_job(gsc->q, bb);
+	job = xe_bb_create_job(gsc->q, bb, true);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
 		return PTR_ERR(job);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 522f10f163c8b..39bfe2e9221a8 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -175,7 +175,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_exec_queue *q)
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
-	job = xe_bb_create_job(q, bb);
+	job = xe_bb_create_job(q, bb, true);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
 		return PTR_ERR(job);
@@ -261,7 +261,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_exec_queue *q)
 
 	xe_lrc_emit_hwe_state_instructions(q, bb);
 
-	job = xe_bb_create_job(q, bb);
+	job = xe_bb_create_job(q, bb, true);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
 		return PTR_ERR(job);
diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 0369cc016f6ab..d3043078d89f1 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -575,7 +575,7 @@ static int xe_oa_submit_bb(struct xe_oa_stream *stream, struct xe_bb *bb)
 	int err = 0;
 
 	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
-	job = xe_bb_create_job(stream->k_exec_q, bb);
+	job = xe_bb_create_job(stream->k_exec_q, bb, true);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
 		goto exit;
-- 
2.46.0

