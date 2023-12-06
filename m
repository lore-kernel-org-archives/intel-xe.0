Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33948C10DC1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 22:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A9410E7CE;
	Wed,  6 Dec 2023 22:21:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3138310E7CE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 22:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701901284; x=1733437284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=obY0L1KYQZWv9KjMMHrbnDbfPTcQPgOAui0yb7o/4po=;
 b=KHDr3OEXgZwfTM63OxNS63v1cf1zhkuzy70yR1iZOgTBCGv+8RnQx9L9
 x4mCfcYfwUZB2Xj4VzqA2cnOn+kZSLAyv0ZgZTabLU8A9usl22ncoaJ/K
 bKwCafd87/M+BEPn56mw8xFI+x3h/2FuZu8fR834Nub4RycROr6aRAxo/
 M9mw58KZHzOGf8JG1b2Au0L/QxPsgWB0pVMew+XVjyz2W4uRPZ4vu0Ny+
 8gihX0EEfKJk1pvLmFXx4svw/slrr7msZO8MTujiuaynLMLk5ueQk30ty
 Bgbo0sqfMDYJ5HxXj1rSXNNvCu+rAZSW0ftjZqtTkz4yeYlpPdpsk0Tqy g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="425286696"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="425286696"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 14:21:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="800500674"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="800500674"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 14:21:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  6 Dec 2023 14:21:40 -0800
Message-Id: <20231206222141.398040-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206222141.398040-1-matthew.brost@intel.com>
References: <20231206222141.398040-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 5/6] drm/xe: Take in-syncs into account when
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
v3: Use function for in-fence signaling

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 10 ++++-
 drivers/gpu/drm/xe/xe_sync.c | 74 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sync.h |  5 +++
 drivers/gpu/drm/xe/xe_vm.c   | 40 +++++++++++++++----
 4 files changed, 120 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 96d7506a4c72..438e34585e1e 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -238,11 +238,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (!args->num_batch_buffer) {
 		if (!xe_vm_in_lr_mode(vm)) {
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
index f6de0584ea91..eedf6737a86e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2948,6 +2948,36 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	return err;
 }
 
+static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
+				       struct xe_exec_queue *q,
+				       struct xe_sync_entry *syncs,
+				       int num_syncs)
+{
+	struct dma_fence *fence;
+	int i;
+
+	fence = xe_sync_in_fence_get(syncs, num_syncs,
+				     to_wait_exec_queue(vm, q), vm);
+	if (IS_ERR(fence))
+		return PTR_ERR(fence);
+
+	for (i = 0; i < num_syncs; i++)
+		xe_sync_entry_signal(&syncs[i], NULL, fence);
+
+	if (xe_vm_sync_mode(vm, q)) {
+		long timeout = dma_fence_wait(fence, true);
+
+		if (timeout < 0)
+			return -EINTR;
+	}
+
+	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
+				     fence);
+	dma_fence_put(fence);
+
+	return 0;
+}
+
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -3178,12 +3208,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 unwind_ops:
 	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 free_syncs:
-	for (i = 0; err == -ENODATA && i < num_syncs; i++) {
-		struct dma_fence *fence =
-			xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
-
-		xe_sync_entry_signal(&syncs[i], NULL, fence);
-	}
+	if (err == -ENODATA)
+		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
 
@@ -3203,7 +3229,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	kfree(ops);
 	if (args->num_binds > 1)
 		kfree(bind_ops);
-	return err == -ENODATA ? 0 : err;
+	return err;
 }
 
 /**
-- 
2.34.1

