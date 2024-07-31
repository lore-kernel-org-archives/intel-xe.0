Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B06C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 14:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8662A10E629;
	Wed, 31 Jul 2024 14:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lx4Ho8H0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D695210E645
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722435853; x=1753971853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fo4QFjdtMFS8pgZML11KbQjEmogBurL2/gwcAiS7wm0=;
 b=lx4Ho8H0BcZKzqYLLDdHQ5oFUm0w8JdyeqyIimP0ltZXgUIJrpHqkzPf
 beQd5aru2yOZRIWpjaphdOtOuy6SwOiUuFlIrizR6N+GM8/2TA/RLGtTE
 hYoTd8PpVYp42wraMgjwFZwGsH3nil8QXqeasD5A/OnEvMXLMBIKcqWA1
 jcoD5xHIhhw8llR/Pt5QpQrkrn7bV0rBobRaqjjosBLyX9kGWNdMCpluj
 89zrkZa8C/zei9Eb01GYbswO6AP4GCQQKlaaEmsw0VT1SMkFurlXINkgF
 g7dKbz+/dHnUaogtB15I4OEkDpYWeLuDFRBckZ9Jw6CGf8nmI/e0b1OZE Q==;
X-CSE-ConnectionGUID: z0qlE+XTQxG9sFx+Q0Tvzg==
X-CSE-MsgGUID: jgWBVrz2R4mT8yGFJ4TsBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31469191"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="31469191"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:13 -0700
X-CSE-ConnectionGUID: zB9haziwSgWI6FqIYimY4Q==
X-CSE-MsgGUID: EFlJuFtGRyerJF3/Xho1hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59501005"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:24:11 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v3 06/13] drm/xe/exec_queue: Prepare last fence for hw engine
 group resume context
Date: Wed, 31 Jul 2024 16:21:40 +0200
Message-ID: <20240731142349.4101307-7-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731142349.4101307-1-francois.dugast@intel.com>
References: <20240731142349.4101307-1-francois.dugast@intel.com>
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

Ensure we can safely take a ref of the exec queue's last fence from the
context of resuming jobs from the hw engine group. The locking requirements
differ from the general case, hence the introduction of
xe_exec_queue_last_fence_{get,put}_for_resume().

v2: Add kernel doc, rework the code to prevent code duplication

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 123 ++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h |   3 +
 2 files changed, 113 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 85da2a30a4a4..a860ba752786 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -815,8 +815,37 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
-						    struct xe_vm *vm)
+/**
+ * exec_queue_last_fence_lockdep_assert() - Assert locking to access last fence
+ * @q: The exec queue
+ * @vm: The VM
+ *
+ * These are the locking requirements to access the last fence of this exec
+ * queue. This is the general and strictest version, to be used by default.
+ */
+static void exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
+						 struct xe_vm *vm)
+{
+	if (q->flags & EXEC_QUEUE_FLAG_VM) {
+		lockdep_assert_held(&vm->lock);
+	} else {
+		xe_vm_assert_held(vm);
+		lockdep_assert_held(&q->hwe->hw_engine_group->mode_sem);
+	}
+}
+
+/**
+ * exec_queue_last_fence_lockdep_assert_for_test_dep() - Assert locking only to
+ * test the last fence dep
+ * @q: The exec queue
+ * @vm: The VM
+ *
+ * This version of exec_queue_last_fence_lockdep_assert() does not require
+ * locking of the hw engine group semaphore. It is exclusively meant to be used
+ * from the context of xe_exec_queue_last_fence_test_dep().
+ */
+static void exec_queue_last_fence_lockdep_assert_for_test_dep(struct xe_exec_queue *q,
+							      struct xe_vm *vm)
 {
 	if (q->flags & EXEC_QUEUE_FLAG_VM)
 		lockdep_assert_held(&vm->lock);
@@ -831,7 +860,22 @@ static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
  */
 void xe_exec_queue_last_fence_put(struct xe_exec_queue *q, struct xe_vm *vm)
 {
-	xe_exec_queue_last_fence_lockdep_assert(q, vm);
+	exec_queue_last_fence_lockdep_assert(q, vm);
+
+	xe_exec_queue_last_fence_put_unlocked(q);
+}
+
+/**
+ * xe_exec_queue_last_fence_put_for_resume() - Drop ref to last fence
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind or exec for
+ *
+ * Only safe to be called in the context of resuming the hw engine group's
+ * long-running exec queue, when the group semaphore is held.
+ */
+void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *q, struct xe_vm *vm)
+{
+	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
 
 	xe_exec_queue_last_fence_put_unlocked(q);
 }
@@ -851,30 +895,82 @@ void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *q)
 }
 
 /**
- * xe_exec_queue_last_fence_get() - Get last fence
+ * exec_queue_last_fence_get() - Get last fence
  * @q: The exec queue
  * @vm: The VM the engine does a bind or exec for
+ * @only_for_test_dep: True if context is testing last fence dependency
+ * @only_for_resume: True if context is resuming the hw engine group's queues
  *
- * Get last fence, takes a ref
+ * Get last fence, takes a ref, after checking locking depending on the
+ * context.
  *
- * Returns: last fence if not signaled, dma fence stub if signaled
+ * This function is parameterized to cover various contexts and consequently
+ * various locking requirements from which the caller gets the last fence,
+ * while also avoiding code duplication.
+ *
+ * It is intentionally made static to hide those parameters externally and
+ * limit possible incorrect uses from the wrong context.
  */
-struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
-					       struct xe_vm *vm)
+static struct dma_fence *exec_queue_last_fence_get(struct xe_exec_queue *q,
+						   struct xe_vm *vm,
+						   bool only_for_test_dep,
+						   bool only_for_resume)
 {
 	struct dma_fence *fence;
 
-	xe_exec_queue_last_fence_lockdep_assert(q, vm);
+	xe_assert(vm->xe, !(only_for_test_dep && only_for_resume));
+	if (only_for_resume)
+		lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
+	else if (only_for_test_dep)
+		exec_queue_last_fence_lockdep_assert_for_test_dep(q, vm);
+	else
+		exec_queue_last_fence_lockdep_assert(q, vm);
 
 	if (q->last_fence &&
-	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
-		xe_exec_queue_last_fence_put(q, vm);
+	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags)) {
+		if (only_for_resume)
+			xe_exec_queue_last_fence_put_for_resume(q, vm);
+		else
+			xe_exec_queue_last_fence_put(q, vm);
+	}
 
 	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
 	dma_fence_get(fence);
 	return fence;
 }
 
+/**
+ * xe_exec_queue_last_fence_get() - Get last fence
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind or exec for
+ *
+ * Get last fence, takes a ref
+ *
+ * Returns: last fence if not signaled, dma fence stub if signaled
+ */
+struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
+					       struct xe_vm *vm)
+{
+	return exec_queue_last_fence_get(q, vm, false, false);
+}
+
+/**
+ * xe_exec_queue_last_fence_get_to_resume() - Get last fence
+ * @q: The exec queue
+ * @vm: The VM the engine does a bind or exec for
+ *
+ * Get last fence, takes a ref. Only safe to be called in the context of
+ * resuming the hw engine group's long-running exec queue, when the group
+ * semaphore is held.
+ *
+ * Returns: last fence if not signaled, dma fence stub if signaled
+ */
+struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *q,
+							  struct xe_vm *vm)
+{
+	return exec_queue_last_fence_get(q, vm, false, true);
+}
+
 /**
  * xe_exec_queue_last_fence_set() - Set last fence
  * @q: The exec queue
@@ -887,7 +983,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
 				  struct dma_fence *fence)
 {
-	xe_exec_queue_last_fence_lockdep_assert(q, vm);
+	exec_queue_last_fence_lockdep_assert(q, vm);
 
 	xe_exec_queue_last_fence_put(q, vm);
 	q->last_fence = dma_fence_get(fence);
@@ -906,7 +1002,8 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
 	struct dma_fence *fence;
 	int err = 0;
 
-	fence = xe_exec_queue_last_fence_get(q, vm);
+	fence = exec_queue_last_fence_get(q, vm, true, false);
+
 	if (fence) {
 		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
 			0 : -ETIME;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index ded77b0f3b90..fc9884a6ce85 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -71,8 +71,11 @@ enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_devi
 
 void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
 void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *e);
+void xe_exec_queue_last_fence_put_for_resume(struct xe_exec_queue *e, struct xe_vm *vm);
 struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *e,
 					       struct xe_vm *vm);
+struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *e,
+							  struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
 int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
-- 
2.43.0

