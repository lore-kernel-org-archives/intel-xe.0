Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EE0CD4F24
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 10:17:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6480A10E5C3;
	Wed, 13 May 2026 10:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GV/GZf7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F3210E5C3
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778667464; x=1810203464;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SeMQAueQjjAjFy297YVP05UOCs73KXPLfbXgQ18+m7A=;
 b=GV/GZf7R6xy1RljcM+sM+54jtu6gqVW9YfyWzgKBjIz+w3cd+VmeAAkA
 l+68uwVQIgV/gHzBuBoWQQZYfeO5TS7mXVzISbQ+DjvWXSTn4ahCy8e4C
 qmd75G+Hmz8AMsP6LrCotVZmgPrLIjODv4CNWZjJZ4p/HqvoBZ/61xgrl
 0V/SMEJG7qOlYTrLJwCwgeEf0U8gzXcAyTGFFx9z0pVvFV22rDpxgvgVB
 IydBV1820tA3Sy+3IfeY/BXlknD3qPpRU3o+3RPyXTuj0GBZWFRTn8z4T
 OTeFHLa/UEgdq/ASub8ucJTuAFtJju2jVIObil5/0MuyBHf2V6IN5PgyL Q==;
X-CSE-ConnectionGUID: urvo7p6vQH2YPAZibIgMLg==
X-CSE-MsgGUID: HX81gpPlR6e9s7X7BIW/Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79621447"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79621447"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 03:17:19 -0700
X-CSE-ConnectionGUID: ZZcL40ZMRTe8NAa9EFAJ2g==
X-CSE-MsgGUID: d2hBXCFgTeKg2BV6KnBdGw==
X-ExtLoop1: 1
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa003.fm.intel.com with ESMTP; 13 May 2026 03:17:17 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: LR mode TLB coherence for userptr, rebind,
 and exec ordering
Date: Wed, 13 May 2026 15:46:59 +0530
Message-ID: <20260513101659.3470307-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

LR mode currently relies on context-switch based TLB coherence while
per-batch invalidation is disabled. This is unsafe when hardware
auto-tail update advances execution, allowing newly fetched work
to run before the expected implicit coherence point at context
-switch or re-enable.

1.On the LR path, add a dependency on q->lr.pfence so newly
submitted exec jobs wait for outstanding preempt/rebind work
to fully complete. This avoids out-of-order execution where
a new batch could run with stale TLB/PTE state.

2.For LR rebinds in non-fault mode, force explicit invalidation
instead of relying on implicit context re-enable behavior.
This avoids stale TLB entries surviving across rebind.

3.Include LR mode in the initial userptr invalidation condition so
LR queues always perform the required TLB invalidation. This avoids
cases where LR execution continues with stale userptr translations
after a mapping change.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c      | 11 +++++++++++
 drivers/gpu/drm/xe/xe_pt.c        | 18 ++++++++++++------
 drivers/gpu/drm/xe/xe_sched_job.c |  6 ++++++
 drivers/gpu/drm/xe/xe_sched_job.h |  2 ++
 drivers/gpu/drm/xe/xe_userptr.c   |  2 +-
 5 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index e05dabfcd43c..2abf851ef7a1 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -301,6 +301,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto err_put_job;
 	}
 
+	/* LR jobs wait for preempt/rebind to complete, but only when a
+	 * preemption/rebind is actually in-flight.
+	 */
+	if (xe_vm_in_lr_mode(vm) && q->lr.pfence &&
+	    test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &q->lr.pfence->flags)) {
+		err = xe_sched_job_add_fence_dep(job,
+						 dma_fence_get(q->lr.pfence));
+		if (err)
+			goto err_put_job;
+	}
+
 	for (i = 0; i < num_syncs && !err; i++)
 		err = xe_sync_entry_add_deps(&syncs[i], job);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2669ff5ee747..0281dc9ca07f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2006,9 +2006,10 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 
 		/*
 		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
-		 * cached PTEs point to freed memory. On LR vms this is done
-		 * automatically when the context is re-enabled by the rebind worker,
-		 * or in fault mode it was invalidated on PTE zapping.
+		 * cached PTEs point to freed memory. On LR vms in non-fault mode,
+		 * implicit context re-enable is not a reliable coherence point,
+		 * so force explicit invalidation here. In fault mode the TLB
+		 * was already invalidated during PTE zapping.
 		 *
 		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
 		 * PTE is already cached in the TLB so it needs to be invalidated.
@@ -2019,9 +2020,14 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
 		     xe_vm_in_lr_mode(vm)))
 			pt_update_ops->needs_invalidation = true;
-		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
-			/* We bump also if batch_invalidate_tlb is true */
-			vm->tlb_flush_seqno++;
+		else if (pt_op->rebind) {
+			if (xe_vm_in_lr_mode(vm) && !xe_vm_in_fault_mode(vm))
+				/* Force explicit invalidation for LR rebinds */
+				pt_update_ops->needs_invalidation = true;
+			else if (!xe_vm_in_lr_mode(vm))
+				/* We bump also if batch_invalidate_tlb is true */
+				vm->tlb_flush_seqno++;
+		}
 
 		vma->tile_staged |= BIT(tile->id);
 		pt_op->vma = vma;
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index ae5b38b2a884..2f6c84c662d5 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -353,6 +353,12 @@ xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot,
 		drm_printf(p, "batch_addr[%u]: 0x%016llx\n", i, snapshot->batch_addr[i]);
 }
 
+int xe_sched_job_add_fence_dep(struct xe_sched_job *job,
+			       struct dma_fence *fence)
+{
+	return drm_sched_job_add_dependency(&job->drm, fence);
+}
+
 int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
 			  enum dma_resv_usage usage)
 {
diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index 1c1cb44216c3..771fab005175 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -89,6 +89,8 @@ struct xe_sched_job_snapshot *xe_sched_job_snapshot_capture(struct xe_sched_job
 void xe_sched_job_snapshot_free(struct xe_sched_job_snapshot *snapshot);
 void xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot, struct drm_printer *p);
 
+int xe_sched_job_add_fence_dep(struct xe_sched_job *job,
+			       struct dma_fence *fence);
 int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
 			  enum dma_resv_usage usage);
 
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 6761005c0b90..9c6fd1004c7c 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -102,7 +102,7 @@ xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_d
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
 
-	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+	if ((xe_vm_in_lr_mode(vm) || xe_vm_in_fault_mode(vm)) && userptr->initial_bind) {
 		if (!userptr->finish_inuse) {
 			/*
 			 * Defer the TLB wait to an extra pass so the caller
-- 
2.46.0

