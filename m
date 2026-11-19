Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0742606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 11:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dMu92WDA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CA41122D6;
	Thu, 19 Nov 2026 11:19:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697B41122B9
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795087169; x=1826623169;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=3LPHhFdqem+nQtwfSLco5ZnVUoP0Ia81S0rTTm3ezQs=;
 b=dMu92WDAqkz7u/j7/lYi3NmrRzMc0PgxobmiJl5yclYXHCul/KPjtFvK
 3ZBVVUlrKQUwH3VAv/KBvYCZuN177pqamIC7bntXXqhnFysV89JGudmKm
 byJYZkQ7mm8Kt7AV05I2I7Fce0rOO4e8kIHMuUJisKa9KvR0TUXurexLM
 pfrc35hTeCH43JJNSUddF1OWHsfBDTSH2vSNmilCBVbgAuGfoHDcnhVes
 HzV/kNMMKTNoRHWSNkH4ex6NB9WUCiFTCetywLsz+9gUsGmv/1XWjHC/4
 Eh/aTAPKMirlEsRchtwxYrxjdusvCgLN+tyJTe8UUKvCxyrToqMsWh6hR Q==;
X-CSE-ConnectionGUID: IZEUIlgcRzyvE5gP1GbawA==
X-CSE-MsgGUID: 5v8GbaO+SAuyOMfCXLGm6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3828773"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3828773"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:19:29 -0800
X-CSE-ConnectionGUID: 26jDR3TmRIinmQ85wt70bg==
X-CSE-MsgGUID: PgJfXctfSIO5r7WBkna+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10402269"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [192.168.0.182])
 ([10.245.245.108])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 03:19:27 -0800
From: Matthew Auld <matthew.auld@intel.com>
Date: Thu, 19 Nov 2026 11:14:33 +0000
Subject: [PATCH 2/5] drm/xe: Requeue the rebind worker instead of retrying
 in-line on -EAGAIN
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-userptr-repin-v1-2-af2e327833a9@intel.com>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
In-Reply-To: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
X-Mailer: b4 0.14.3
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

When the preempt rebind worker needs to retry, it currently jumps back
and keeps holding vm->lock in write mode across the retry. Only VFs
with migration support drop the lock and requeue the worker.

Holding the vm lock across retries needlessly blocks other users of the
lock and other work on the ordered workqueue, and makes the retry unfit
for conditions that may last for a while, like repeatedly invalidated
userptrs.

Always drop the vm lock and requeue the worker on -EAGAIN. This also
fixes a leak of the preempt fences allocated in the failed attempt on
the existing VF path.

The userptr invalidation injection state that forces one retry per
rebind sequence was a local variable that would be reset by a requeue.
Move it to the vm.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 59 ++++++++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++++
 2 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 75be5e5329bd..ff8d355728fc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -542,6 +542,31 @@ void xe_vm_resume_rebind_worker(struct xe_vm *vm)
 	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+/*
+ * Force one retry per rebind sequence. The sequence spans requeues of the
+ * worker, so the state must live in the vm.
+ */
+static bool xe_vm_rebind_worker_inject_retry(struct xe_vm *vm)
+{
+	return !vm->preempt.inval_inject_tries++;
+}
+
+static void xe_vm_rebind_worker_reset_inject(struct xe_vm *vm)
+{
+	vm->preempt.inval_inject_tries = 0;
+}
+#else
+static bool xe_vm_rebind_worker_inject_retry(struct xe_vm *vm)
+{
+	return false;
+}
+
+static void xe_vm_rebind_worker_reset_inject(struct xe_vm *vm)
+{
+}
+#endif
+
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
@@ -551,7 +576,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	LIST_HEAD(preempt_fences);
 	int err = 0;
 	long wait;
-	int __maybe_unused tries = 0;
 
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
 	trace_xe_vm_rebind_worker_enter(vm);
@@ -564,7 +588,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		return;
 	}
 
-retry:
 	if (!try_wait_for_completion(&vm->xe->pm_block) && vm_suspend_rebind_worker(vm)) {
 		up_write(&vm->lock);
 		/* We don't actually block but don't make progress. */
@@ -614,20 +637,14 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		goto out_unlock;
 	}
 
-#define retry_required(__tries, __vm) \
-	(IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT) ? \
-	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
-	__xe_vm_userptr_needs_repin(__vm))
-
 	xe_svm_notifier_lock(vm);
-	if (retry_required(tries, vm)) {
+	if (xe_vm_rebind_worker_inject_retry(vm) ||
+	    __xe_vm_userptr_needs_repin(vm)) {
 		xe_svm_notifier_unlock(vm);
 		err = -EAGAIN;
 		goto out_unlock;
 	}
 
-#undef retry_required
-
 	xe_vm_bump_lru(vm, &exec);
 
 	/* Point of no return. */
@@ -642,20 +659,20 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		trace_xe_vm_rebind_worker_retry(vm);
 
 		/*
-		 * We can't block in workers on a VF which supports migration
-		 * given this can block the VF post-migration workers from
-		 * getting scheduled.
+		 * Drop all locks and requeue rather than retrying in-line.
+		 * This avoids blocking other work items, such as VF
+		 * post-migration workers, and lets other users of the vm
+		 * lock make progress between attempts.
 		 */
-		if (IS_SRIOV_VF(vm->xe) &&
-		    xe_sriov_vf_migration_supported(vm->xe)) {
-			up_write(&vm->lock);
-			xe_vm_queue_rebind_worker(vm);
-			return;
-		}
-
-		goto retry;
+		up_write(&vm->lock);
+		free_preempt_fences(&preempt_fences);
+		xe_vm_queue_rebind_worker(vm);
+		trace_xe_vm_rebind_worker_exit(vm);
+		return;
 	}
 
+	xe_vm_rebind_worker_reset_inject(vm);
+
 	if (err) {
 		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
 		xe_vm_kill(vm, true);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index fb9305124679..756cf2dbee8a 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -350,6 +350,14 @@ struct xe_vm {
 		 * kicked on resume.
 		 */
 		struct list_head pm_activate_link;
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+		/**
+		 * @inval_inject_tries: Number of rebind attempts in the
+		 * current rebind sequence. Used to force a retry for testing.
+		 * Protected by @lock.
+		 */
+		unsigned int inval_inject_tries;
+#endif
 	} preempt;
 
 	/** @exec_queues: Manages list of exec queues attached to this VM, protected by lock. */

-- 
2.56.1

