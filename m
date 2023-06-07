Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23839C7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 17:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73B110E535;
	Wed,  7 Jun 2023 17:47:50 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95BF10E534
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686160068; x=1717696068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F2TLK7jEOD0OpuFJbokzVct56iug+ppx6nyseXxdxyU=;
 b=RzlMAlqHHo69/BUa81j7lta4p3VFevVkuWeezQlv694DImf1m6qRWHdn
 Qd0LVG9TfqXP3RTOh36cmHxCgbEt0CXO4gm1qjG16Y1zl8t1Af4KMMlgK
 C/SH3FbGEP3OuHXl+uNrVKb/R5yBSOdjs9F6EyctuRRltY79XLLrwhXa/
 7TVvn3lvlzU8NozPnSIlf2oMrqUvIt+1+1YcVP0T+qWKMD1HcLkmLfLyl
 z9KQR2OcygNdCBW2qXHXbj4jXRsdzA/cIBp7FrSXil4E95u1W0DTny4BR
 lo0J800X43V1xOSAAdvIsOifG4TbQ9o5XkMC342BAejfvPj9wADSNuzsM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="337421337"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="337421337"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 10:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687057835"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400"; d="scan'208";a="687057835"
Received: from aaalabdu-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.118])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 10:47:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  7 Jun 2023 19:47:28 +0200
Message-Id: <20230607174729.54899-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
References: <20230607174729.54899-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Invalidate TLB also on bind if in
 scratch page mode
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

For scratch table mode we need to cover the case where a scratch PTE might
have been pre-fetched and cached and used instead of that of the newly
bound vma.
For compute vms, invalidate TLB globally using GuC before signalling
bind complete. For !long-running vms, invalidate TLB at batch start.

Also document how TLB invalidation works.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  1 +
 drivers/gpu/drm/xe/xe_pt.c                | 17 +++++++++++++++--
 drivers/gpu/drm/xe/xe_ring_ops.c          | 15 ++++++++++++---
 3 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index 0f9c5b0b8a3b..d2d41f717525 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -73,6 +73,7 @@
 #define   PIPE_CONTROL_STORE_DATA_INDEX			(1<<21)
 #define   PIPE_CONTROL_CS_STALL				(1<<20)
 #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
+#define   PIPE_CONTROL_TLB_INVALIDATE                   (1<<18)
 #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
 #define   PIPE_CONTROL_QW_WRITE				(1<<14)
 #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index bef265715000..e817fa9fe65e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1297,7 +1297,20 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
 
-	if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
+	/*
+	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
+	 * cached PTEs point to freed memory. on LR vms this is done
+	 * automatically when the context is re-enabled by the rebind worker,
+	 * or in fault mode it was invalidated on PTE zapping.
+	 *
+	 * If !rebind, and scratch enabled VMs, there is a chance the scratch
+	 * PTE is already cached in the TLB so it needs to be invalidated.
+	 * on !LR VMs this is done in the ring ops preceding a batch, but on
+	 * non-faulting LR, in particular on user-space batch buffer chaining,
+	 * it needs to be done here.
+	 */
+	if ((rebind && !xe_vm_no_dma_fences(vm)) ||
+	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_compute_mode(vm))) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 		if (!ifence)
 			return ERR_PTR(-ENOMEM);
@@ -1313,7 +1326,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 		LLIST_HEAD(deferred);
 
 		/* TLB invalidation must be done before signaling rebind */
-		if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
+		if (ifence) {
 			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
 							  vma);
 			if (err) {
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index 2deee7a2bb14..c20fe41c0729 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -15,6 +15,7 @@
 #include "xe_macros.h"
 #include "xe_sched_job.h"
 #include "xe_vm_types.h"
+#include "xe_vm.h"
 
 /*
  * 3D-related flags that can't be set on _engines_ that lack access to the 3D
@@ -107,7 +108,7 @@ static int emit_flush_invalidate(u32 flag, u32 *dw, int i)
 	return i;
 }
 
-static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
+static int emit_pipe_invalidate(u32 mask_flags, u32 extra_flags, u32 *dw, int i)
 {
 	u32 flags = PIPE_CONTROL_CS_STALL |
 		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
@@ -117,7 +118,8 @@ static int emit_pipe_invalidate(u32 mask_flags, u32 *dw, int i)
 		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
 		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
 		PIPE_CONTROL_QW_WRITE |
-		PIPE_CONTROL_STORE_DATA_INDEX;
+		PIPE_CONTROL_STORE_DATA_INDEX |
+		extra_flags;
 
 	flags &= ~mask_flags;
 
@@ -250,14 +252,21 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 	struct xe_gt *gt = job->engine->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
+	struct xe_vm *vm = job->engine->vm;
 	u32 mask_flags = 0;
+	u32 extra_flags = 0;
 
 	dw[i++] = preparser_disable(true);
 	if (lacks_render)
 		mask_flags = PIPE_CONTROL_3D_ARCH_FLAGS;
 	else if (job->engine->class == XE_ENGINE_CLASS_COMPUTE)
 		mask_flags = PIPE_CONTROL_3D_ENGINE_FLAGS;
-	i = emit_pipe_invalidate(mask_flags, dw, i);
+
+	/* See xe_pt.c for a discussion on TLB invalidations. */
+	if (!xe_vm_no_dma_fences(vm) && vm->scratch_bo[gt_to_tile(gt)->id])
+		extra_flags = PIPE_CONTROL_TLB_INVALIDATE;
+
+	i = emit_pipe_invalidate(mask_flags, extra_flags, dw, i);
 
 	/* hsdes: 1809175790 */
 	if (has_aux_ccs(xe))
-- 
2.39.2

