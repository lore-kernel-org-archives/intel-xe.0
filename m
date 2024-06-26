Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9C3C2BBCA
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 00:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713C610E134;
	Wed, 26 Jun 2024 00:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGX7YUQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CF810E134
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 00:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719362462; x=1750898462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R+FWGheW0dt0wih4jLgaxsa6dI25mebVowVX7cjuoBg=;
 b=OGX7YUQaz9bU8IfzX8iwEkNJRqsISSKo/JJZbHco1RurigZlye8O/cbd
 1jIA2KkjKLQwCnTBzX4tjBvKTRSn0WkCXkxln0YV38yqpcOADXeWnbrXT
 XylHo0PKyqrz2IrwloqDyu7u9qZeBu15FhqEzH54Lu8YJ4xKoaE2326VU
 9DxfIMOBhdbURDvPTXCYprsSc5EYyIccAIfuQtVeFLTIvl/utDMQslOps
 v6PJAO2maSU0pQmhU8vPH6F4UbVkXqu2bhBhcIGxZNCvZPpLmeIxG/Ucd
 9f1RkMj29MuPp1qMAa4PmBNtSvJ4QTm4xfRVp2pNymAGn1upi1HD8X5On g==;
X-CSE-ConnectionGUID: aBNGN7HtTgKd1Hamh8YNhQ==
X-CSE-MsgGUID: efTQXDRvRDugtjgZYZ57jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16557102"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="16557102"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:41:02 -0700
X-CSE-ConnectionGUID: 2A0Hm6bxSoCnmTxQJxK5jw==
X-CSE-MsgGUID: /AJw26N+RzmFsuglJtc9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="44478166"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:40:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	niranjana.vishwanathapura@intel.com
Subject: [PATCH v3] drm/xe: Add timeout to preempt fences
Date: Tue, 25 Jun 2024 17:41:37 -0700
Message-Id: <20240626004137.4060806-1-matthew.brost@intel.com>
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

v2:
 - Add comment for smp_wmb (Checkpatch)
 - Fix kernel doc typo (Inspection)
 - Add comment for killed check (Niranjana)
v3:
 - Drop smp_wmb (Matthew Auld)
 - Don't take vm->lock in preempt fence worker (Matthew Auld)
 - Drop RB given changes to patch

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
 drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c       | 39 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_preempt_fence.c    | 12 ++++++--
 drivers/gpu/drm/xe/xe_vm.c               | 14 +++++++--
 drivers/gpu/drm/xe/xe_vm.h               |  2 ++
 6 files changed, 62 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 201588ec33c3..ded9f9396429 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
 	int (*suspend)(struct xe_exec_queue *q);
 	/**
 	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
-	 * call after suspend.
+	 * call after suspend. In dma-fencing path thus must return within a
+	 * reasonable amount of time. -ETIME return shall indicate an error
+	 * waiting for suspend resulting in associated VM getting killed.
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
index 373447758a60..b06321897cf3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1301,6 +1301,15 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
 	kfree(msg);
 }
 
+static void __suspend_fence_signal(struct xe_exec_queue *q)
+{
+	if (!q->guc->suspend_pending)
+		return;
+
+	q->guc->suspend_pending = false;
+	wake_up(&q->guc->suspend_wait);
+}
+
 static void suspend_fence_signal(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1310,9 +1319,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
 		  guc_read_stopped(guc));
 	xe_assert(xe, q->guc->suspend_pending);
 
-	q->guc->suspend_pending = false;
-	smp_wmb();
-	wake_up(&q->guc->suspend_wait);
+	__suspend_fence_signal(q);
 }
 
 static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
@@ -1465,6 +1472,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 {
 	trace_xe_exec_queue_kill(q);
 	set_exec_queue_killed(q);
+	__suspend_fence_signal(q);
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
@@ -1561,12 +1569,31 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 	return 0;
 }
 
-static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
+static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	int ret;
+
+	/*
+	 * Likely don't need to check exec_queue_killed() as we clear
+	 * suspend_pending upon kill but to be paranoid but races in which
+	 * suspend_pending is set after kill also check kill here.
+	 */
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
index e8b8ae5c6485..56e709d2fb30 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -17,10 +17,16 @@ static void preempt_fence_work_func(struct work_struct *w)
 		container_of(w, typeof(*pfence), preempt_work);
 	struct xe_exec_queue *q = pfence->q;
 
-	if (pfence->error)
+	if (pfence->error) {
 		dma_fence_set_error(&pfence->base, pfence->error);
-	else
-		q->ops->suspend_wait(q);
+	} else if (!q->ops->reset_status(q)) {
+		int err = q->ops->suspend_wait(q);
+
+		if (err)
+			dma_fence_set_error(&pfence->base, err);
+	} else {
+		dma_fence_set_error(&pfence->base, -ENOENT);
+	}
 
 	dma_fence_signal(&pfence->base);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5b166fa03684..bf1764249724 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -133,8 +133,10 @@ static int wait_for_existing_preempt_fences(struct xe_vm *vm)
 		if (q->lr.pfence) {
 			long timeout = dma_fence_wait(q->lr.pfence, false);
 
-			if (timeout < 0)
+			/* Only -ETIME on fence indicates VM needs to be killed */
+			if (timeout < 0 || q->lr.pfence->error == -ETIME)
 				return -ETIME;
+
 			dma_fence_put(q->lr.pfence);
 			q->lr.pfence = NULL;
 		}
@@ -311,7 +313,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
-static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
+/**
+ * xe_vm_kill() - VM Kill
+ * @vm: The VM.
+ * @unlocked: Flag indicates the VM's dma-resv is not held
+ *
+ * Kill the VM by setting banned flag indicated VM is no longer available for
+ * use. If in preempt fence mode, also kill all exec queue attached to the VM.
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

