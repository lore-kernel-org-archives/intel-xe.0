Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2214AD66B9D
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 00:31:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECE810E2F0;
	Wed, 27 Nov 2024 00:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuxSV+IE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6AC10E106
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 00:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732667494; x=1764203494;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=C9s7THqwlrVLG6AEpJg9PurepQ6i1vZzPkNo5wSvdZs=;
 b=MuxSV+IE/q6v3kYoD893ZdCrrPOiDrTwG1E3MgG+3GfKz03unYaYDwbi
 5zgwFu8QbKClvZf9mKDDMqe7m0JdIg7C/nPh/4vKV8Ej875Ms6a4Hpw/l
 izscyGoBwlORSyXA2u0qBc9OaaVIxIHIlh2pDhVTlgYbSEqnvwCk6/5Qy
 lymIN1Pp6lw7xwXZ61G+bnbF8eEyLG7Nn4cJRSZHOvr3k9ZyZyyW94qeC
 F47Mi0jk2K8ZnnNLuYFPeRM505MgTVLM8U6RR8ksU80E5DLJBV0aGdxBW
 +aZ62n+O3ByavimKTGPV6TR43eSxa0SrD7UPcEXEGCQWHHrkXXAJLeJ7I Q==;
X-CSE-ConnectionGUID: UJg3QbGdT+eSH8oUGJE74w==
X-CSE-MsgGUID: o50fuzpcQ1WK4oeMYRgRuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36517522"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="36517522"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 16:31:34 -0800
X-CSE-ConnectionGUID: ZhtBE5QGSbOj1Ccwx9FMRw==
X-CSE-MsgGUID: sSpnnD1HR8W3qtVD6fcQEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="91875666"
Received: from dut7231atsm.jf.intel.com ([10.75.202.213])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 16:31:33 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 matthew.brost@intel.com
Subject: [PATCH 2/2] xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable OAR/OAC
Date: Tue, 26 Nov 2024 16:31:27 -0800
Message-Id: <20241127003127.42560-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127003127.42560-1-umesh.nerlige.ramappa@intel.com>
References: <20241127003127.42560-1-umesh.nerlige.ramappa@intel.com>
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

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 68 ++++++++++++++++++++++++++++----------
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index 8dd55798ab31..73c07fee6409 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -719,27 +719,55 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
 	return err;
 }
 
-static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
+static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri, u32 count)
 {
+	struct xe_exec_queue *q = stream->exec_q;
+	struct xe_sched_job *job;
 	struct dma_fence *fence;
 	struct xe_bb *bb;
+	long timeout;
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
-	if (IS_ERR(fence)) {
-		err = PTR_ERR(fence);
+	if (q->vm) {
+		down_read(&q->vm->lock);
+		xe_vm_lock(q->vm, false);
+	}
+
+	job = xe_bb_create_job(q, bb);
+	job->ggtt = true;
+	if (IS_ERR(job)) {
+		err = PTR_ERR(job);
 		goto free_bb;
 	}
-	xe_bb_free(bb, fence);
+
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	if (q->vm) {
+		xe_vm_unlock(q->vm);
+		up_read(&q->vm->lock);
+	}
+
+	timeout = dma_fence_wait_timeout(fence, false, HZ);
 	dma_fence_put(fence);
+	xe_bb_free(bb, fence);
+
+	if (timeout < 0) {
+		drm_dbg(&stream->oa->xe->drm, "OA load with LRI failed %ld\n", timeout);
+		return timeout;
+	} else if (!timeout) {
+		drm_dbg(&stream->oa->xe->drm, "OA load with LRI timed out\n");
+		return -ETIME;
+	}
 
 	return 0;
 free_bb:
@@ -751,8 +779,6 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
 static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
 {
 	const struct xe_oa_format *format = stream->oa_buffer.format;
-	struct xe_lrc *lrc = stream->exec_q->lrc[0];
-	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
 	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
 		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
 
@@ -762,13 +788,17 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
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
@@ -778,14 +808,12 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
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
@@ -794,14 +822,18 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
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
@@ -815,7 +847,7 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
 		return err;
 
 	/* Apply reg_lri using LRI */
-	return xe_oa_load_with_lri(stream, &reg_lri);
+	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
 }
 
 static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
-- 
2.34.1

