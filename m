Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB31C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 19:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9DA10E578;
	Tue,  5 Dec 2023 19:19:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CE910E51C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 19:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701803996; x=1733339996;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+LDci+bCHsTs2PK0LLZwxij2WNuwQPxDNW2ptmrt/uc=;
 b=lQvp8a9iNuk2UH8wBXYQ8mXnxJ3FIBPjqW7THsMKMJ3G9t4nJjwgoPYV
 63h6Y+R0W7AeCLA/mlQzd60m1AKD6GtlO/Yf/PP/Db+vHiMDGW7smHfxW
 WmCHgwkWL7PbCy74cZhVGw39XrXXso5hlBvxJTDbL/WjeI89m4+sv94Ch
 SOM+Ng8XjIgY0pVoNfaGKtG/zElqXQsP7T2HZ6265l8iRNnax7mzTwanO
 YBNUJpSTLYcmxJfkwzjMvKp0iHudblTKm5nrt3XLgUG+v70vvU1th3WxS
 mYMVY484BjEOfqp1L/7+EBUZWjAMpZrftpoe7cyZNrXDNeHH5TKvVY+g4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1032973"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1032973"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="12441531"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 11:19:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  5 Dec 2023 11:20:14 -0800
Message-Id: <20231205192014.301742-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231205192014.301742-1-matthew.brost@intel.com>
References: <20231205192014.301742-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/5] drm/xe: Take in-syncs into account when
 num_execs or num_binds == 0
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

Wait on in-syncs before signaling out-syncs if num_execs or num_binds ==
0 in execbuf IOCTL or VM bind IOCTL respectfully.

v2: Wait on last fence in addition to in-fences (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 10 ++++-
 drivers/gpu/drm/xe/xe_sync.c | 74 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sync.h |  5 +++
 drivers/gpu/drm/xe/xe_vm.c   | 24 ++++++++++--
 4 files changed, 107 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 76c0d517cd7a..9f7709d78a52 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -238,11 +238,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (!args->num_batch_buffer) {
 		if (xe_vm_in_lr_mode(vm)) {
-			struct dma_fence *fence =
-				xe_exec_queue_last_fence_get(q, vm);
+			struct dma_fence *fence;
 
+			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
+			if (IS_ERR(fence)) {
+				err = PTR_ERR(fence);
+				goto err_exec;
+			}
 			for (i = 0; i < num_syncs; i++)
 				xe_sync_entry_signal(&syncs[i], NULL, fence);
+			xe_exec_queue_last_fence_set(q, vm, fence);
+			dma_fence_put(fence);
 		}
 
 		goto err_exec;
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index d0f118223fa2..e4c220cf9115 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -5,6 +5,7 @@
 
 #include "xe_sync.h"
 
+#include <linux/dma-fence-array.h>
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
@@ -14,6 +15,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_device_types.h"
+#include "xe_exec_queue.h"
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
 
@@ -268,3 +270,75 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
 	if (sync->ufence)
 		user_fence_put(sync->ufence);
 }
+
+/**
+ * xe_sync_in_fence_get() - Get a fence from syncs, exec queue, and VM
+ * @sync: input syncs
+ * @num_sync: number of syncs
+ * @q: exec queue
+ * @vm: VM
+ *
+ * Get a fence from syncs, exec queue, and VM. If syncs contain in-fences create
+ * and return a composite fence of all in-fences + last fence. If no in-fences
+ * return last fence on  input exec queue. Caller must drop reference to
+ * returned fence.
+ *
+ * Return: fence on success, ERR_PTR(-ENOMEM) on failure
+ */
+struct dma_fence *
+xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
+		     struct xe_exec_queue *q, struct xe_vm *vm)
+{
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *cf = NULL;
+	struct dma_fence *fence;
+	int i, num_in_fence = 0, current_fence = 0;
+
+	lockdep_assert_held(&vm->lock);
+
+	/* Count in-fences */
+	for (i = 0; i < num_sync; ++i) {
+		if (sync[i].fence) {
+			++num_in_fence;
+			fence = sync[i].fence;
+		}
+	}
+
+	/* Easy case... */
+	if (!num_in_fence) {
+		fence = xe_exec_queue_last_fence_get(q, vm);
+		dma_fence_get(fence);
+		return fence;
+	}
+
+	/* Create composite fence */
+	fences = kmalloc_array(num_in_fence + 1, sizeof(*fences), GFP_KERNEL);
+	if (!fences)
+		return ERR_PTR(-ENOMEM);
+	for (i = 0; i < num_sync; ++i) {
+		if (sync[i].fence) {
+			dma_fence_get(sync[i].fence);
+			fences[current_fence++] = sync[i].fence;
+		}
+	}
+	fences[current_fence++] = xe_exec_queue_last_fence_get(q, vm);
+	dma_fence_get(fences[current_fence - 1]);
+	cf = dma_fence_array_create(num_in_fence, fences,
+				    vm->composite_fence_ctx,
+				    vm->composite_fence_seqno++,
+				    false);
+	if (!cf) {
+		--vm->composite_fence_seqno;
+		goto err_out;
+	}
+
+	return &cf->base;
+
+err_out:
+	while (current_fence)
+		dma_fence_put(fences[--current_fence]);
+	kfree(fences);
+	kfree(cf);
+
+	return ERR_PTR(-ENOMEM);
+}
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 45f4371e94b9..d284afbe917c 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -9,8 +9,10 @@
 #include "xe_sync_types.h"
 
 struct xe_device;
+struct xe_exec_queue;
 struct xe_file;
 struct xe_sched_job;
+struct xe_vm;
 
 #define SYNC_PARSE_FLAG_EXEC			BIT(0)
 #define SYNC_PARSE_FLAG_LR_MODE			BIT(1)
@@ -27,5 +29,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync,
 			  struct xe_sched_job *job,
 			  struct dma_fence *fence);
 void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
+struct dma_fence *
+xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
+		     struct xe_exec_queue *q, struct xe_vm *vm);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 042e1e31ba54..c84d991dc9d8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3178,12 +3178,28 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 unwind_ops:
 	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 free_syncs:
-	for (i = 0; err == -ENODATA && i < num_syncs; i++) {
-		struct dma_fence *fence =
-			xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
+	if (err == -ENODATA) {
+		struct dma_fence *fence;
+
+		fence = xe_sync_in_fence_get(syncs, num_syncs,
+					     to_wait_exec_queue(vm, q), vm);
+		if (IS_ERR(fence)) {
+			err = PTR_ERR(fence);
+			goto cleanup_syncs;
+		}
+		for (i = 0; i < num_syncs; i++)
+			xe_sync_entry_signal(&syncs[i], NULL, fence);
+		if (!async) {
+			long timeout = dma_fence_wait(fence, true);
 
-		xe_sync_entry_signal(&syncs[i], NULL, fence);
+			if (timeout < 0)
+				err = -EINTR;
+		}
+		xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
+					     fence);
+		dma_fence_put(fence);
 	}
+cleanup_syncs:
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
 
-- 
2.34.1

