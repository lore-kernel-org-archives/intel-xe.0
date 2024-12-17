Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282E5E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 00:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3DF10E1FC;
	Tue, 17 Dec 2024 00:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kP/bQmZ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C79010E807
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 00:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734397103; x=1765933103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t+8aNpIjMrRXweEoJTxZ2AkMyUTfciQecA/Rr78x5Uk=;
 b=kP/bQmZ7Q4WdZ8OGnsfSH9jrSjQWm9l7WTWVzpv+sChnPrrzXZJqbC17
 /7WKQ5p0V7/sWffzYTBvrQl+UysHVwAsorw4iivRkeodN8sPWXm6q4jGP
 GUoYBD+KFHRCZOymL/bfeJBRZj/ILrMMtppA2kN57VYxXOWQbE9VYl65I
 xJtOlySDPVvUuudwN/jGKUXmvnrhsQDWue98jclft6c50tsSUUksfY6E/
 wim+030doghcuCpe7dQTyoN4EYMxbLAIijAl+iIjHjRDfwBX8RjJwzL0S
 f5KKUxdjf5yfyQT6Fnx5rKwaG8wq3MnCznSb5C1Ht4BBLubW2fnn7BzIg A==;
X-CSE-ConnectionGUID: WhtpG/dvRdOJxNQK5TIfTg==
X-CSE-MsgGUID: sL5IQ//cTqafVLxPQOJEDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46202042"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="46202042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 16:58:23 -0800
X-CSE-ConnectionGUID: Zx9xKZxtQ6+l4owQ8HC/bA==
X-CSE-MsgGUID: zZ9voMbCSXOaXqFngWcufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97220173"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 16:58:23 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 2/2] xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC
Date: Mon, 16 Dec 2024 16:58:18 -0800
Message-Id: <20241217005818.25205-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
References: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
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

To enable OAR/OAC, a bit in RING_CONTEXT_CONTROL needs to be set.
Setting this bit cause the context image size to change and if not done
correct, can cause undesired hangs.

Current code uses a separate exec_queue to modify this bit and is
error-prone. As per HW recommendation, submit MI_LOAD_REGISTER_IMM to
the target hardware context to modify the relevant bit.

In v2 version, an attempt to submit everything to the user-queue was
made, but it failed the unprivileged-single-ctx-counters test. It
appears that the OACTXCONTROL must be modified from a remote context.

In summary,
- the OACTXCONTROL is always modified from the k_exec_q
- the LRI registers are always modified from the user-queue
- emit_oa_config picks user-queue if available, else it uses k_exec_q.

v2:
(Matt)
- set job->ggtt to true if create job is successful
- unlock vm on job error

(Ashutosh)
- don't wait on job submission
- use kernel exec queue where possible

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 71 +++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 8dd55798ab31..d6298c6fa78b 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -596,19 +596,39 @@ static __poll_t xe_oa_poll(struct file *file, poll_table *wait)
 	return ret;
 }
 
-static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, enum xe_oa_submit_deps deps,
+static void xe_oa_lock_vma(struct xe_exec_queue *q)
+{
+	if (q->vm) {
+		down_read(&q->vm->lock);
+		xe_vm_lock(q->vm, false);
+	}
+}
+
+static void xe_oa_unlock_vma(struct xe_exec_queue *q)
+{
+	if (q->vm) {
+		xe_vm_unlock(q->vm);
+		up_read(&q->vm->lock);
+	}
+}
+
+static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream,
+					 struct xe_exec_queue *q,
+					 enum xe_oa_submit_deps deps,
 					 struct xe_bb *bb)
 {
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
 	int err = 0;
 
-	/* Kernel configuration is issued on stream->k_exec_q, not stream->exec_q */
-	job = xe_bb_create_job(stream->k_exec_q, bb);
+	xe_oa_lock_vma(q);
+
+	job = xe_bb_create_job(q, bb);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
 		goto exit;
 	}
+	job->ggtt = true;
 
 	if (deps == XE_OA_SUBMIT_ADD_DEPS) {
 		for (int i = 0; i < stream->num_syncs && !err; i++)
@@ -623,10 +643,14 @@ static struct dma_fence *xe_oa_submit_bb(struct xe_oa_stream *stream, enum xe_oa
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 
+	xe_oa_unlock_vma(q);
+
 	return fence;
 err_put_job:
 	xe_sched_job_put(job);
 exit:
+	xe_oa_unlock_vma(q);
+
 	return ERR_PTR(err);
 }
 
@@ -692,6 +716,7 @@ static void xe_oa_store_flex(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lrc,
 				  const struct flex *flex, u32 count)
 {
+	struct xe_exec_queue *q = stream->k_exec_q;
 	struct dma_fence *fence;
 	struct xe_bb *bb;
 	int err;
@@ -704,7 +729,7 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 
 	xe_oa_store_flex(stream, lrc, bb, flex, count);
 
-	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
+	fence = xe_oa_submit_bb(stream, q, XE_OA_SUBMIT_NO_DEPS, bb);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		goto free_bb;
@@ -719,21 +744,22 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 	return err;
 }
 
-static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
+static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri, u32 count)
 {
+	struct xe_exec_queue *q = stream->exec_q;
 	struct dma_fence *fence;
 	struct xe_bb *bb;
 	int err;
 
-	bb = xe_bb_new(stream->gt, 3, false);
+	bb = xe_bb_new(stream->gt, 2 * count + 1, false);
 	if (IS_ERR(bb)) {
 		err = PTR_ERR(bb);
 		goto exit;
 	}
 
-	write_cs_mi_lri(bb, reg_lri, 1);
+	write_cs_mi_lri(bb, reg_lri, count);
 
-	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
+	fence = xe_oa_submit_bb(stream, q, XE_OA_SUBMIT_NO_DEPS, bb);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		goto free_bb;
@@ -751,8 +777,6 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 {
 	const struct xe_oa_format *format = stream->oa_buffer.format;
-	struct xe_lrc *lrc = stream->exec_q->lrc[0];
-	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
 	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
 		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
 
@@ -762,13 +786,17 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
 			enable ? OA_COUNTER_RESUME : 0,
 		},
+	};
+	struct xe_oa_reg reg_lri[] = {
+		{
+			OAR_OACONTROL,
+			oacontrol,
+		},
 		{
 			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
-			regs_offset + CTX_CONTEXT_CONTROL,
 			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE),
 		},
 	};
-	struct xe_oa_reg reg_lri = { OAR_OACONTROL, oacontrol };
 	int err;
 
 	/* Modify stream hwe context image with regs_context */
@@ -778,14 +806,12 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 		return err;
 
 	/* Apply reg_lri using LRI */
-	return xe_oa_load_with_lri(stream, &reg_lri);
+	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
 }
 
 static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
 {
 	const struct xe_oa_format *format = stream->oa_buffer.format;
-	struct xe_lrc *lrc = stream->exec_q->lrc[0];
-	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
 	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
 		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
 	struct flex regs_context[] = {
@@ -794,14 +820,18 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
 			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
 			enable ? OA_COUNTER_RESUME : 0,
 		},
+	};
+	struct xe_oa_reg reg_lri[] = {
+		{
+			OAC_OACONTROL,
+			oacontrol
+		},
 		{
 			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
-			regs_offset + CTX_CONTEXT_CONTROL,
 			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE) |
 			_MASKED_FIELD(CTX_CTRL_RUN_ALONE, enable ? CTX_CTRL_RUN_ALONE : 0),
 		},
-	};
-	struct xe_oa_reg reg_lri = { OAC_OACONTROL, oacontrol };
+       	};
 	int err;
 
 	/* Set ccs select to enable programming of OAC_OACONTROL */
@@ -815,7 +845,7 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
 		return err;
 
 	/* Apply reg_lri using LRI */
-	return xe_oa_load_with_lri(stream, &reg_lri);
+	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
 }
 
 static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
@@ -1015,6 +1045,7 @@ static const struct dma_fence_ops xe_oa_fence_ops = {
 static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config *config)
 {
 #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
+	struct xe_exec_queue *q = stream->exec_q ? : stream->k_exec_q;
 	struct xe_oa_config_bo *oa_bo;
 	struct xe_oa_fence *ofence;
 	int i, err, num_signal = 0;
@@ -1033,7 +1064,7 @@ static int xe_oa_emit_oa_config(struct xe_oa_stream *stream, struct xe_oa_config
 	}
 
 	/* Emit OA configuration batch */
-	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
+	fence = xe_oa_submit_bb(stream, q, XE_OA_SUBMIT_ADD_DEPS, oa_bo->bb);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		goto exit;
-- 
2.34.1

