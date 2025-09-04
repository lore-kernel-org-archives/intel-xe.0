Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BEACA1002
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 16:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5AF10EA95;
	Thu,  4 Sep 2025 16:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IH8mXnJ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664BC10EA95
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757002065; x=1788538065;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ajqOCOkvvVRdqEWLkpBjkvH1LfXDmyn2cawKyc2sk8k=;
 b=IH8mXnJ+aQaaqGDexR4fpCezwvRltppTD/UD4/0KErYdToZczMQWxFal
 DShU7KQWBeKWXtpSoQBzHvpuyJskn1U4rsDTalQAqOC1zwUKzK6c931E2
 v3W4kvu2aX7aALQ28m22j+sZHREcryTz4ONX8J0397b79WW1kGdHeXcaB
 de+UxlitJxG6RuMdsKods3e1Th3oZpGWY9ULH7gVYcLyDpWukSPVqHo34
 E4synVgbd7UNO8z0bZogPq9zYVIMQHmNysouWBONESNghQyujJNq0jQZG
 wvUen2wq8/D+z1BEIexOlEOmBNRzxwExE3hBllwIkI8GGFGQbA3YvWzzW w==;
X-CSE-ConnectionGUID: dzed2aC3TKKSdE/b9p/dSg==
X-CSE-MsgGUID: 0Pm5FyWMTwSWIjfsDpsOGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="62988502"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="62988502"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:07:44 -0700
X-CSE-ConnectionGUID: z0kXa+RCSliapZBjcQUlfA==
X-CSE-MsgGUID: RfWJpBkNQamQw29A9PM4uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="177201765"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora) ([10.245.244.98])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 09:07:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 3/3] drm/xe: Block exec and rebind worker while evicting
 for suspend / hibernate
Date: Thu,  4 Sep 2025 18:07:15 +0200
Message-ID: <20250904160715.2613-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250904160715.2613-1-thomas.hellstrom@linux.intel.com>
References: <20250904160715.2613-1-thomas.hellstrom@linux.intel.com>
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

When the xe pm_notifier evicts for suspend / hibernate, there might be
racing tasks trying to re-validate again. This can lead to suspend taking
excessive time or get stuck in a live-lock. This behaviour becomes
much worse with the fix that actually makes re-validation bring back
bos to VRAM rather than letting them remain in TT.

Prevent that by having exec and the rebind worker waiting for a completion
that is set to block by the pm_notifier before suspend and is signaled
by the pm_notifier after resume / wakeup.

It's probably still possible to craft malicious applications that block
suspending. More work is pending to fix that.

v3:
- Avoid wait_for_completion() in the kernel worker since it could
  potentially cause work item flushes from freezable processes to
  wait forever. Instead terminate the rebind workers if needed and
  re-launch at resume. (Matt Auld)
v4:
- Fix some bad naming and leftover debug printouts.
- Fix kerneldoc.
- Use drmm_mutex_init() for the xe->rebind_resume_lock (Matt Auld).
- Rework the interface of xe_vm_rebind_resume_worker (Matt Auld).

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4288
Fixes: c6a4d46ec1d7 ("drm/xe: evict user memory in PM notifier")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <stable@vger.kernel.org> # v6.16+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++++
 drivers/gpu/drm/xe/xe_exec.c         |  9 ++++++
 drivers/gpu/drm/xe/xe_pm.c           | 25 +++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 42 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.h           |  2 ++
 drivers/gpu/drm/xe/xe_vm_types.h     |  5 ++++
 6 files changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 092004d14db2..1e780f8a2a8c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -507,6 +507,12 @@ struct xe_device {
 
 	/** @pm_notifier: Our PM notifier to perform actions in response to various PM events. */
 	struct notifier_block pm_notifier;
+	/** @pm_block: Completion to block validating tasks on suspend / hibernate prepare */
+	struct completion pm_block;
+	/** @rebind_resume_list: List of wq items to kick on resume. */
+	struct list_head rebind_resume_list;
+	/** @rebind_resume_lock: Lock to protect the rebind_resume_list */
+	struct mutex rebind_resume_lock;
 
 	/** @pmt: Support the PMT driver callback interface */
 	struct {
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 44364c042ad7..374c831e691b 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -237,6 +237,15 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_unlock_list;
 	}
 
+	/*
+	 * It's OK to block interruptible here with the vm lock held, since
+	 * on task freezing during suspend / hibernate, the call will
+	 * return -ERESTARTSYS and the IOCTL will be rerun.
+	 */
+	err = wait_for_completion_interruptible(&xe->pm_block);
+	if (err)
+		goto err_unlock_list;
+
 	vm_exec.vm = &vm->gpuvm;
 	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
 	if (xe_vm_in_lr_mode(vm)) {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index bee9aacd82e7..d9c466177147 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -25,6 +25,7 @@
 #include "xe_pxp.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_trace.h"
+#include "xe_vm.h"
 #include "xe_wa.h"
 
 /**
@@ -297,6 +298,19 @@ static u32 vram_threshold_value(struct xe_device *xe)
 	return DEFAULT_VRAM_THRESHOLD;
 }
 
+static void xe_pm_wake_rebind_workers(struct xe_device *xe)
+{
+	struct xe_vm *vm, *next;
+
+	mutex_lock(&xe->rebind_resume_lock);
+	list_for_each_entry_safe(vm, next, &xe->rebind_resume_list,
+				 preempt.pm_activate_link) {
+		list_del_init(&vm->preempt.pm_activate_link);
+		xe_vm_resume_rebind_worker(vm);
+	}
+	mutex_unlock(&xe->rebind_resume_lock);
+}
+
 static int xe_pm_notifier_callback(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
@@ -306,6 +320,7 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	switch (action) {
 	case PM_HIBERNATION_PREPARE:
 	case PM_SUSPEND_PREPARE:
+		reinit_completion(&xe->pm_block);
 		xe_pm_runtime_get(xe);
 		err = xe_bo_evict_all_user(xe);
 		if (err)
@@ -322,6 +337,8 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		break;
 	case PM_POST_HIBERNATION:
 	case PM_POST_SUSPEND:
+		complete_all(&xe->pm_block);
+		xe_pm_wake_rebind_workers(xe);
 		xe_bo_notifier_unprepare_all_pinned(xe);
 		xe_pm_runtime_put(xe);
 		break;
@@ -348,6 +365,14 @@ int xe_pm_init(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = drmm_mutex_init(&xe->drm, &xe->rebind_resume_lock);
+	if (err)
+		goto err_unregister;
+
+	init_completion(&xe->pm_block);
+	complete_all(&xe->pm_block);
+	INIT_LIST_HEAD(&xe->rebind_resume_list);
+
 	/* For now suspend/resume is only allowed with GuC */
 	if (!xe_device_uc_enabled(xe))
 		return 0;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f55f96bb240a..8dc3eb6a265a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -394,6 +394,9 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
 			       &vm->rebind_list);
 
+	if (!try_wait_for_completion(&vm->xe->pm_block))
+		return -EAGAIN;
+
 	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
 	if (ret)
 		return ret;
@@ -480,6 +483,33 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	return xe_vm_validate_rebind(vm, exec, vm->preempt.num_exec_queues);
 }
 
+static bool vm_suspend_rebind_worker(struct xe_vm *vm)
+{
+	struct xe_device *xe = vm->xe;
+	bool ret = false;
+
+	mutex_lock(&xe->rebind_resume_lock);
+	if (!try_wait_for_completion(&vm->xe->pm_block)) {
+		ret = true;
+		list_move_tail(&vm->preempt.pm_activate_link, &xe->rebind_resume_list);
+	}
+	mutex_unlock(&xe->rebind_resume_lock);
+
+	return ret;
+}
+
+/**
+ * xe_vm_resume_rebind_worker() - Resume the rebind worker.
+ * @vm: The vm whose preempt worker to resume.
+ *
+ * Resume a preempt worker that was previously suspended by
+ * vm_suspend_rebind_worker().
+ */
+void xe_vm_resume_rebind_worker(struct xe_vm *vm)
+{
+	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
+}
+
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
@@ -503,6 +533,11 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 retry:
+	if (!try_wait_for_completion(&vm->xe->pm_block) && vm_suspend_rebind_worker(vm)) {
+		up_write(&vm->lock);
+		return;
+	}
+
 	if (xe_vm_userptr_check_repin(vm)) {
 		err = xe_vm_userptr_pin(vm);
 		if (err)
@@ -1741,6 +1776,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	if (flags & XE_VM_FLAG_LR_MODE) {
 		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
 		xe_pm_runtime_get_noresume(xe);
+		INIT_LIST_HEAD(&vm->preempt.pm_activate_link);
 	}
 
 	if (flags & XE_VM_FLAG_FAULT_MODE) {
@@ -1922,8 +1958,12 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_assert(xe, !vm->preempt.num_exec_queues);
 
 	xe_vm_close(vm);
-	if (xe_vm_in_preempt_fence_mode(vm))
+	if (xe_vm_in_preempt_fence_mode(vm)) {
+		mutex_lock(&xe->rebind_resume_lock);
+		list_del_init(&vm->preempt.pm_activate_link);
+		mutex_unlock(&xe->rebind_resume_lock);
 		flush_work(&vm->preempt.rebind_work);
+	}
 	if (xe_vm_in_fault_mode(vm))
 		xe_svm_close(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b3e5bec0fa58..d631c4b25c51 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -281,6 +281,8 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 				       struct xe_exec_queue *q, u64 addr,
 				       enum xe_cache_level cache_lvl);
 
+void xe_vm_resume_rebind_worker(struct xe_vm *vm);
+
 /**
  * xe_vm_resv() - Return's the vm's reservation object
  * @vm: The vm
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index b5108d010786..e1a786db5f89 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -338,6 +338,11 @@ struct xe_vm {
 		 * BOs
 		 */
 		struct work_struct rebind_work;
+		/**
+		 * @preempt.pm_activate_link: Link to list of rebind workers to be
+		 * kicked on resume.
+		 */
+		struct list_head pm_activate_link;
 	} preempt;
 
 	/** @um: unified memory state */
-- 
2.50.1

