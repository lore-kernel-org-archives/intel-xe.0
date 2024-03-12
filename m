Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3287C54E60
	for <intel-xe@archiver.kernel.org>; Tue, 12 Mar 2024 14:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB5D10FD94;
	Tue, 12 Mar 2024 14:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwHhrsBZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1846710FD94
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Mar 2024 14:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252306; x=1741788306;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wNcDSEbBJFJUNHz09yowzYGXU+C4k075NXh0s2rU3VY=;
 b=cwHhrsBZ2Qp2eNCJPeaGlODN/UvpBKrl9/sG+AlfarSn87Zb6QMi88GZ
 alqtCnBPA579OWPfbwUywozLAmIkHgV0ZsTP4mAdhd4US2rIRXSDP8hs8
 xZMWu9W4T3hCj4vTGfS8OfCbHC14vRBtAKE5Ev/qJ4L+JkBzeC8Al2+qO
 Qb6C1tDdyrNB2j/G0N1+6AqisCzonaKl1gT7Gv3XVOTsx4BZBkcfB9m3Q
 LmMaehKw1eu+D0bwSRJmBk36rQoS4RvRCM0xnyRJrfPq8dTNx0a1oAKtC
 WYeBdDBwiwFhtiD+KHhF+gp+H3RA0CJGTLH6dWJzq3yL/xUqvQdUmXt2w g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="22415991"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="22415991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="12148456"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:05:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 2/7] drm/xe: Rework xe_vm_rebind()
Date: Tue, 12 Mar 2024 15:04:42 +0100
Message-ID: <20240312140447.50437-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
References: <20240312140447.50437-1-thomas.hellstrom@linux.intel.com>
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

Also ensure that any new rebind fence completes *after* the previous
one so we don't lose dependencies. Use dma_fence_chain when
necessary.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 17 ++-------
 drivers/gpu/drm/xe/xe_vm.c   | 73 +++++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h   |  2 +-
 3 files changed, 61 insertions(+), 31 deletions(-)

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
index 643b3701a738..18a8e1137016 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -15,6 +15,7 @@
 #include <drm/xe_drm.h>
 #include <linux/ascii85.h>
 #include <linux/delay.h>
+#include <linux/dma-fence-chain.h>
 #include <linux/kthread.h>
 #include <linux/mm.h>
 #include <linux/swap.h>
@@ -522,7 +523,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
 	struct drm_exec exec;
-	struct dma_fence *rebind_fence;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
 	ktime_t end = 0;
@@ -568,15 +568,14 @@ static void preempt_rebind_work_func(struct work_struct *w)
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
@@ -756,32 +755,72 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	       struct xe_sync_entry *syncs, u32 num_syncs,
 	       bool first_op, bool last_op);
 
-struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
+int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
 	struct dma_fence *fence = NULL;
 	struct xe_vma *vma, *next;
+	struct dma_fence_chain *chain = NULL;
 
 	lockdep_assert_held(&vm->lock);
-	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
-		return NULL;
-
 	xe_vm_assert_held(vm);
+
 	list_for_each_entry_safe(vma, next, &vm->rebind_list,
 				 combined_links.rebind) {
+		struct dma_fence *old = vm->rebind_fence;
+		bool old_signaled = !old || dma_fence_is_signaled(old);
+
 		xe_assert(vm->xe, vma->tile_present);
 
-		list_del_init(&vma->combined_links.rebind);
-		dma_fence_put(fence);
 		if (rebind_worker)
 			trace_xe_vma_rebind_worker(vma);
 		else
 			trace_xe_vma_rebind_exec(vma);
+
+		if (!old_signaled && !chain) {
+			chain = kzalloc(sizeof(*chain), GFP_NOWAIT | __GFP_ACCOUNT);
+			if (!chain) {
+				int err = dma_fence_wait(old, true);
+
+				if (err)
+					return err;
+				old_signaled = true;
+			}
+		}
+
+		if (old_signaled) {
+			dma_fence_put(old);
+			old = NULL;
+			vm->rebind_fence = NULL;
+		}
+
 		fence = xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
-		if (IS_ERR(fence))
-			return fence;
+		if (IS_ERR(fence)) {
+			kfree(chain);
+			return PTR_ERR(fence);
+		}
+
+		list_del_init(&vma->combined_links.rebind);
+		if (fence && !dma_fence_is_signaled(fence)) {
+			if (!old_signaled) {
+				if (fence->context == old->context) {
+					dma_fence_put(old);
+					vm->rebind_fence = fence;
+				} else {
+					dma_fence_chain_init(chain, old, fence, old->seqno + 1);
+					vm->rebind_fence = &chain->base;
+					chain = NULL;
+				}
+				fence = NULL;
+			} else {
+				vm->rebind_fence = fence;
+				fence = NULL;
+			}
+		}
+		dma_fence_put(fence);
 	}
+	kfree(chain);
 
-	return fence;
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

