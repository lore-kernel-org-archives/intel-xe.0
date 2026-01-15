Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1F6D3CC92
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jan 2026 00:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532B610E0E2;
	Thu, 15 Jan 2026 00:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ROib/5rG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B80810E0E2
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jan 2026 00:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768437952; x=1799973952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YPQzwd2u/jGY38bVw/k56h8aB9XQtgmCNt6ae7KHrJg=;
 b=ROib/5rGq7MFf5i1cdqSptzhm7POdik0I14NMFFnLRl+iTZsw+0XRi84
 dwsLAK5dVAJ2vRxCVP+RvJUXlaudi36QEgjmjtQxhjp9qd+ng6sueZ8+/
 8m8c4OgCUP/53UfltNJwn1LLdxjLVw/ddowPsLxUCbwltddYkjGMo8pkV
 Hrmu6dLLEB7pqIWlT2mFPAJYagnn7fCZOkUq6oUsAO9fDgd3KowE5oG7u
 XnBvXgdM3rS0uIcAr60uMgaQKveGdT2hmn7yeljP8IWpFOlk+UF/4TVc9
 /GjB4GWhnYDKLlHCMxKEsLMX5RpJS7ZBuQ3i91SYwqCB96GqFhQbQIUyt A==;
X-CSE-ConnectionGUID: 6u/VmG4xS4iElbsDhBJWHA==
X-CSE-MsgGUID: xept5DcfTOab9yy4MoOexQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69645100"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="69645100"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 16:45:52 -0800
X-CSE-ConnectionGUID: eHD7HpnURueogh//7N3zag==
X-CSE-MsgGUID: HEpB6j7NQReS5Zm1yj4JaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204607549"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 16:45:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Carlos Santa <carlos.santa@intel.com>
Subject: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Date: Wed, 14 Jan 2026 16:45:46 -0800
Message-Id: <20260115004546.58060-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

If a batch buffer is complete, it makes little sense to preempt the
fence signaling instructions in the ring, as the largest portion of the
work (the batch buffer) is already done and fence signaling consists of
only a few instructions. If these instructions are preempted, the GuC
would need to perform a context switch just to signal the fence, which
is costly and delays fence signaling. Avoid this scenario by disabling
preemption immediately after the BB start instruction and re-enabling it
after executing the fence signaling instructions.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Carlos Santa <carlos.santa@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index a1fd99f2d539..cd645ee400b9 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
+	/* Don't preempt fence signaling */
+	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
+
 	if (job->user_fence.used) {
 		i = emit_flush_dw(dw, i);
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
@@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
+	/* Don't preempt fence signaling */
+	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
+
 	if (job->user_fence.used) {
 		i = emit_flush_dw(dw, i);
 		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
@@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
 
+	/* Don't preempt fence signaling */
+	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
+
 	i = emit_render_cache_flush(job, dw, i);
 
 	if (job->user_fence.used)
-- 
2.34.1

