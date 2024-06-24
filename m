Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C47C2BD09
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 22:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7834510E155;
	Mon, 24 Jun 2024 22:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvSR26AK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A765D10E155
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 22:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719269286; x=1750805286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ar1bszlYk5x7/+6qv/8E+aes16IxKWhbO7jpWfi879I=;
 b=hvSR26AKbU6jMqaCKUzq0UtOJ/HNm7/HwcB/swz40dphIP76Inp2d+Zr
 wOpxmPzz2OvIRlBUqpp13y7+SR6mXG1aPDPppNQ+YI4UsnY1F85m7eliV
 3HhD9iDf7tZIp2fHSy5rMv27YLdENn9vrlOxo9nl6nqUlnF9Ioye+lwX3
 XblnsXzW14Kr8d8r3M+ftonZGfZRR8iNF+MHt5MSfmJdS6nXnnCht0tQE
 eoaSqlxTuIy8ql4TsfiVYmMGv3f/yiT5cn/3tOlNv58VRpQ6kVhkTI571
 yKHYXEjJY4q0sny2jm1Wv3sdJl5NaTDuobfUT1Bj62pGGkBxQZdKpyg1d A==;
X-CSE-ConnectionGUID: 9pCYA0jHSrC+wVPhqxyhvg==
X-CSE-MsgGUID: y9pdwZsoShKAZMfKO7LCKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26852734"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="26852734"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 15:48:06 -0700
X-CSE-ConnectionGUID: 65370lR0S4G453iVTGuN5w==
X-CSE-MsgGUID: Z34bEW0DT3aFxN/hebjDbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="47882453"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 15:48:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com
Subject: [PATCH] drm/xe: Add timeout to preempt fences
Date: Mon, 24 Jun 2024 15:48:44 -0700
Message-Id: <20240624224844.3950026-1-matthew.brost@intel.com>
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

To adhere to dma fencing rules that fences must signal within a
reasonable amount of time, add a 5 second timeout to preempt fences. If
this timeout occurs, kill the associated VM as this fatal to the VM.

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
 drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 35 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_preempt_fence.c    | 14 +++++++++-
 drivers/gpu/drm/xe/xe_vm.c               | 10 ++++++-
 drivers/gpu/drm/xe/xe_vm.h               |  2 ++
 6 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 201588ec33c3..1e51c978db7a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
 	int (*suspend)(struct xe_exec_queue *q);
 	/**
 	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
-	 * call after suspend.
+	 * call after suspend. In dma-fencing path thus must return within a
+	 * reasonable amount of time. A non-zero return shall indicate an error
+	 * waiting for suspend.
 	 */
-	void (*suspend_wait)(struct xe_exec_queue *q);
+	int (*suspend_wait)(struct xe_exec_queue *q);
 	/**
 	 * @resume: Resume exec queue execution, exec queue must be in a suspended
 	 * state and dma fence returned from most recent suspend call must be
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index db906117db6d..7502e3486eaf 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
 	return 0;
 }
 
-static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
+static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
 {
 	/* NIY */
+	return 0;
 }
 
 static void execlist_exec_queue_resume(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 373447758a60..56e7a340696e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1301,6 +1301,16 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
 	kfree(msg);
 }
 
+static void __suspend_fence_signal(struct xe_exec_queue *q)
+{
+	if (!q->guc->suspend_pending)
+		return;
+
+	q->guc->suspend_pending = false;
+	smp_wmb();
+	wake_up(&q->guc->suspend_wait);
+}
+
 static void suspend_fence_signal(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1310,9 +1320,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
 		  guc_read_stopped(guc));
 	xe_assert(xe, q->guc->suspend_pending);
 
-	q->guc->suspend_pending = false;
-	smp_wmb();
-	wake_up(&q->guc->suspend_wait);
+	__suspend_fence_signal(q);
 }
 
 static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
@@ -1465,6 +1473,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
 	trace_xe_exec_queue_kill(q);
 	set_exec_queue_killed(q);
+	__suspend_fence_signal(q);
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
@@ -1561,12 +1570,26 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 	return 0;
 }
 
-static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
+static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	int ret;
+
+	ret = wait_event_timeout(q->guc->suspend_wait,
+				 !q->guc->suspend_pending ||
+				 exec_queue_killed(q) ||
+				 guc_read_stopped(guc),
+				 HZ * 5);
 
-	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
-		   guc_read_stopped(guc));
+	if (!ret) {
+		xe_gt_warn(guc_to_gt(guc),
+			   "Suspend fence, guc_id=%d, failed to respond",
+			   q->guc->id);
+		/* XXX: Trigger GT reset? */
+		return -ETIME;
+	}
+
+	return 0;
 }
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index e8b8ae5c6485..8356d9798206 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -16,11 +16,23 @@ static void preempt_fence_work_func(struct work_struct *w)
 	struct xe_preempt_fence *pfence =
 		container_of(w, typeof(*pfence), preempt_work);
 	struct xe_exec_queue *q = pfence->q;
+	int err = 0;
 
 	if (pfence->error)
 		dma_fence_set_error(&pfence->base, pfence->error);
+	else if (!q->ops->reset_status(q))
+		err = q->ops->suspend_wait(q);
 	else
-		q->ops->suspend_wait(q);
+		dma_fence_set_error(&pfence->base, -ENOENT);
+
+	if (err) {
+		dma_fence_set_error(&pfence->base, err);
+
+		down_write(&q->vm->lock);
+		xe_vm_kill(q->vm, false);
+		up_write(&q->vm->lock);
+	}
+
 
 	dma_fence_signal(&pfence->base);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5b166fa03684..6b8ff13f0aff 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -311,7 +311,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
-static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
+/**
+ * xe_vm_kill() - VM Kill
+ * @vm: The VM.
+ * @unlocked: Flag indicates the VM's dma-resv is not held
+ *
+ * Kill the VM by setting banned flag indicated VM is no longer available for
+ * use. If in preempt fence mode, also kill all exec queue unlocked with the VM.
+ */
+void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 {
 	struct xe_exec_queue *q;
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b481608b12f1..c864dba35e1d 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -259,6 +259,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
 	return drm_gpuvm_resv(&vm->gpuvm);
 }
 
+void xe_vm_kill(struct xe_vm *vm, bool unlocked);
+
 /**
  * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
  * @vm: The vm
-- 
2.34.1

