Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A54C04E69
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 19:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C09410E5E6;
	Thu, 27 Jul 2023 19:00:13 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B66810E5E6
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690484411; x=1722020411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9I8N8/YMwzYId3Z8Woh27JQDv2ODKiEmyoGdSQpS/vk=;
 b=boGeWHHN3KSsDJNv3V5kI0WUNfaT7IsdM9kdgqYpM/QJpCT3p/7ofVhS
 fKv9EbWbSEnkyXEr9MNhK8/ad+5hX+Wp9QvVQNq7t8fKyRRzu5NyjNKT2
 BiBwETwhvZ0jRJZSy0Qd/ypxuPF6OcWp5XkAZ3qHKN3c/Uff/z+fDjmXp
 m0LbwtM41FZFI0avasG7LriaKfaNV7ZrSWyb0/Rpo0c1ztMVknVmGgrhy
 pyJSeomddHCySZnVVVCQFC9CADB074XgzgtdUJPA04arxKJKztuivFTyK
 7MEZ4fDQJGf7l3GpnqjqrkU9Zv6PBJL9Yg0gvqP9sYOji8YTYdpS/Wiws w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="348681579"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="348681579"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 12:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727127087"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="727127087"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 12:00:09 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 11:59:43 -0700
Message-ID: <20230727185945.401047-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727185945.401047-1-daniele.ceraolospurio@intel.com>
References: <20230727185945.401047-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe: fix submissions without vm
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

Kernel engines can submit privileged batches directly in GGTT, so they
don't always need a vm. The submission front-end already supports
creating and submitting jobs without a vm, but some parts of the
back-end assume the vm is always there. Fix this by handling a lack of
vm in the back-end as well.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c   | 8 ++++----
 drivers/gpu/drm/xe/xe_sched_job.c  | 3 +++
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 911d4965c27c..c5b265624344 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1128,7 +1128,7 @@ static int guc_engine_init(struct xe_engine *e)
 	ge->engine = e;
 	init_waitqueue_head(&ge->suspend_wait);
 
-	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
+	timeout = e->vm && xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index cc278485908c..8e21c19cb041 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -212,7 +212,7 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
 	u32 ppgtt_flag = get_ppgtt_flag(job);
 	struct xe_vm *vm = job->engine->vm;
 
-	if (vm->batch_invalidate_tlb) {
+	if (vm && vm->batch_invalidate_tlb) {
 		dw[i++] = preparser_disable(true);
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 					seqno, true, dw, i);
@@ -270,13 +270,13 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 			i = emit_aux_table_inv(gt, VE0_AUX_NV, dw, i);
 	}
 
-	if (vm->batch_invalidate_tlb)
+	if (vm && vm->batch_invalidate_tlb)
 		i = emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 					seqno, true, dw, i);
 
 	dw[i++] = preparser_disable(false);
 
-	if (!vm->batch_invalidate_tlb)
+	if (!vm || !vm->batch_invalidate_tlb)
 		i = emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
 					seqno, dw, i);
 
@@ -315,7 +315,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
 
 	/* See __xe_pt_bind_vma() for a discussion on TLB invalidations. */
-	i = emit_pipe_invalidate(mask_flags, vm->batch_invalidate_tlb, dw, i);
+	i = emit_pipe_invalidate(mask_flags, vm && vm->batch_invalidate_tlb, dw, i);
 
 	/* hsdes: 1809175790 */
 	if (has_aux_ccs(xe))
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index f581472cb391..e1af1f2a44c2 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -87,6 +87,9 @@ struct xe_sched_job *xe_sched_job_create(struct xe_engine *e,
 	int i, j;
 	u32 width;
 
+	/* only a kernel context can submit a vm-less job */
+	XE_BUG_ON(!e->vm && !(e->flags & ENGINE_FLAG_KERNEL));
+
 	/* Migration and kernel engines have their own locking */
 	if (!(e->flags & (ENGINE_FLAG_KERNEL | ENGINE_FLAG_VM |
 			  ENGINE_FLAG_WA))) {
-- 
2.41.0

