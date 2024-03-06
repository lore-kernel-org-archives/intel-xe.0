Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81833C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 10:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC6A10EC52;
	Wed,  6 Mar 2024 10:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDrg+mYU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2081410EC52
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709719303; x=1741255303;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9MKKmWAe0qa0FcyvfaWCSolojqWNDx0sMdgWiQyL1YQ=;
 b=jDrg+mYUnKLsihbAbLahdDrhAScV3qvjIJ3EtRPm0nq2c60lc2v+kLOh
 UAbi+xZvJzru0UyNoljrfrhAQ78o/29Nmb1ZFQE0lgDpsyngGViWUMT8K
 ZRi8VSVcMtXJZRS7V9gJnaLfc4TZrr56yD1hyjPqTRrroy15jmWQiSSZO
 lnXJAESkZGSVHqwuKcoWtC978wAHfvMir6qdu1E1V9CjxYzt6iy25lY5H
 qvNOLBRrogs2i9IRNruVme857qi0vzRoAPN4eXY9CVvpiuxwPHTFt/Rqb
 SWDjZzBMHuwGYB7LESnDvw2eBEPXWAS0bjGsKhbHIEeP74Exhiu4mOwW6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4255151"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4255151"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9587648"
Received: from fatinf5x-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.40])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 02:01:41 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/2] drm/xe: Rework xe_vm_rebind()
Date: Wed,  6 Mar 2024 11:01:32 +0100
Message-ID: <20240306100133.4962-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

Rework xe_vm_rebind() to attach its resulting fence to the vm directly,
and have exec- and rebind worker only deal with the vm's rebind fence.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 17 ++++-------------
 drivers/gpu/drm/xe/xe_vm.c   | 35 +++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm.h   |  2 +-
 3 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 952496c6260d..5124663a9694 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -152,7 +152,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_exec *exec = &vm_exec.exec;
 	u32 i, num_syncs = 0, num_ufence = 0;
 	struct xe_sched_job *job;
-	struct dma_fence *rebind_fence;
 	struct xe_vm *vm;
 	bool write_locked, skip_retry = false;
 	ktime_t end = 0;
@@ -289,20 +288,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	 * Rebind any invalidated userptr or evicted BOs in the VM, non-compute
 	 * VM mode only.
 	 */
-	rebind_fence = xe_vm_rebind(vm, false);
-	if (IS_ERR(rebind_fence)) {
-		err = PTR_ERR(rebind_fence);
-		goto err_put_job;
+	if (!xe_vm_in_lr_mode(vm)) {
+		err = xe_vm_rebind(vm, false);
+		if (err)
+			goto err_put_job;
 	}
 
-	/*
-	 * We store the rebind_fence in the VM so subsequent execs don't get
-	 * scheduled before the rebinds of userptrs / evicted BOs is complete.
-	 */
-	if (rebind_fence) {
-		dma_fence_put(vm->rebind_fence);
-		vm->rebind_fence = rebind_fence;
-	}
 	if (vm->rebind_fence) {
 		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 			     &vm->rebind_fence->flags)) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 643b3701a738..427b2063d876 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -522,7 +522,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
 	struct drm_exec exec;
-	struct dma_fence *rebind_fence;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
 	ktime_t end = 0;
@@ -568,15 +567,14 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock;
 
-	rebind_fence = xe_vm_rebind(vm, true);
-	if (IS_ERR(rebind_fence)) {
-		err = PTR_ERR(rebind_fence);
+	err = xe_vm_rebind(vm, true);
+	if (err)
 		goto out_unlock;
-	}
 
-	if (rebind_fence) {
-		dma_fence_wait(rebind_fence, false);
-		dma_fence_put(rebind_fence);
+	if (vm->rebind_fence) {
+		dma_fence_wait(vm->rebind_fence, false);
+		dma_fence_put(vm->rebind_fence);
+		vm->rebind_fence = NULL;
 	}
 
 	/* Wait on munmap style VM unbinds */
@@ -756,16 +754,14 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	       struct xe_sync_entry *syncs, u32 num_syncs,
 	       bool first_op, bool last_op);
 
-struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
+int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
 	struct dma_fence *fence = NULL;
 	struct xe_vma *vma, *next;
 
 	lockdep_assert_held(&vm->lock);
-	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
-		return NULL;
-
 	xe_vm_assert_held(vm);
+
 	list_for_each_entry_safe(vma, next, &vm->rebind_list,
 				 combined_links.rebind) {
 		xe_assert(vm->xe, vma->tile_present);
@@ -778,10 +774,21 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			trace_xe_vma_rebind_exec(vma);
 		fence = xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
 		if (IS_ERR(fence))
-			return fence;
+			return PTR_ERR(fence);
 	}
 
-	return fence;
+	if (fence) {
+		struct dma_fence *old = vm->rebind_fence;
+
+		if (old) {
+			xe_assert(vm->xe, dma_fence_is_later(fence, old));
+			dma_fence_put(old);
+		}
+
+		vm->rebind_fence = fence;
+	}
+
+	return 0;
 }
 
 static void xe_vma_free(struct xe_vma *vma)
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6df1f1c7f85d..4853354336f2 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -207,7 +207,7 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
 
 int xe_vm_userptr_check_repin(struct xe_vm *vm);
 
-struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
+int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
-- 
2.44.0

