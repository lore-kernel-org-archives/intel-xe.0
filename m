Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC51C47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 19:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD18810E68B;
	Thu, 16 Nov 2023 19:40:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F62F10E689
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700163638; x=1731699638;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tHP4SQfIcdO0P503T8sxrj1sIg5KaqLGND5PWQv7Otc=;
 b=nslp71o5r0ShswHy44pCjq4su8y0hxhOIIJ4PMStL928TWS0rDzjssDD
 91ouZQq0qMbkpQeR2fuYY5dyPUVgT3WknIXZsGYJKuUNRGi7xwcT9NQDR
 sOJ7Xc2TRKJMdv36f6VYIsSj/qe6NZRL02L1FM6n8IdTbyPcWNjCc2lk9
 LquDUDTJbruNS+VcKNcFnFnqNEAgJULD7Sf1eKZMtONEoH31eya0pS0Ap
 0428Dlz4QIwZtMG9tmg/k5CWKJL/vxQFsEIDpOhfSowG5b4BjwZQes91+
 8SWwaudh+j70t79v2frUJgHSrKwLHSoUCEZRT60adTyKcA9YvqDivX4nG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="394016993"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="394016993"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="769004703"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="769004703"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 11:40:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Nov 2023 11:40:46 -0800
Message-Id: <20231116194047.214330-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116194047.214330-1-matthew.brost@intel.com>
References: <20231116194047.214330-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] rm/xe: Allow num_batch_buffer == 0 in exec
 IOCTL
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

The idea being out-syncs can signal indicating all previous operations
on the exec queue are complete. An example use case of this would be
support for implementing vkQueueWaitForIdle easily.

v2: Don't add last_fence for VM's that do not support dma fences
v3: Use a flags field instead of severval bools in sync parse (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             | 23 ++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  5 ++++-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++--
 drivers/gpu/drm/xe/xe_sync.c             |  4 ++++
 drivers/gpu/drm/xe/xe_sync.h             |  6 +++++-
 5 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 7d4d22c81a42..4989bc6038af 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -161,7 +161,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, q->width != args->num_batch_buffer))
+	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
+			 q->width != args->num_batch_buffer))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
@@ -183,12 +184,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
 					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
 					  (xe_vm_no_dma_fences(vm) ?
-					   SYNC_PARSE_FLAG_LR_MODE : 0));
+					   SYNC_PARSE_FLAG_LR_MODE : 0) |
+					  (!args->num_batch_buffer ?
+					   SYNC_PARSE_FLAG_DISALLOW_USER_FENCE : 0));
 		if (err)
 			goto err_syncs;
 	}
 
-	if (xe_exec_queue_is_parallel(q)) {
+	if (args->num_batch_buffer && xe_exec_queue_is_parallel(q)) {
 		err = __copy_from_user(addresses, addresses_user, sizeof(u64) *
 				       q->width);
 		if (err) {
@@ -235,6 +238,18 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
+	if (!args->num_batch_buffer) {
+		if (!xe_vm_no_dma_fences(vm)) {
+			struct dma_fence *fence =
+				xe_exec_queue_last_fence_get(q, vm);
+
+			for (i = 0; i < num_syncs; i++)
+				xe_sync_entry_signal(&syncs[i], NULL, fence);
+		}
+
+		goto err_exec;
+	}
+
 	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
 		err = -EWOULDBLOCK;
 		goto err_exec;
@@ -328,6 +343,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (xe_exec_queue_is_lr(q))
 		q->ring_ops->emit_job(job);
+	if (!xe_vm_no_dma_fences(vm))
+		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 4fd44a9203e4..35710b66e5de 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -924,7 +924,10 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
 static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
-	lockdep_assert_held_write(&vm->lock);
+	if (q->flags & EXEC_QUEUE_FLAG_VM)
+		lockdep_assert_held_write(&vm->lock);
+	else
+		xe_vm_assert_held(vm);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 5ba47a5cfdbd..52f0927d0d9b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -56,8 +56,9 @@ struct xe_exec_queue {
 	struct xe_hw_fence_irq *fence_irq;
 
 	/**
-	 * @last_fence: last fence on engine, protected by vm->lock in write
-	 * mode if bind engine
+	 * @last_fence: last fence on exec queue, protected by vm->lock in write
+	 * mode if bind exec queue, protected by dma resv lock if non-bind exec
+	 * queue
 	 */
 	struct dma_fence *last_fence;
 
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 016d0a2ea5bc..cfe8724ee954 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -106,6 +106,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	int err;
 	bool exec = flags & SYNC_PARSE_FLAG_EXEC;
 	bool lr_mode = flags & SYNC_PARSE_FLAG_LR_MODE;
+	bool disallow_user_fence = flags & SYNC_PARSE_FLAG_DISALLOW_USER_FENCE;
 	bool signal;
 
 	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
@@ -173,6 +174,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		break;
 
 	case DRM_XE_SYNC_USER_FENCE:
+		if (XE_IOCTL_DBG(xe, disallow_user_fence))
+			return -EOPNOTSUPP;
+
 		if (XE_IOCTL_DBG(xe, !signal))
 			return -EOPNOTSUPP;
 
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 30958ddc4cdc..45f4371e94b9 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -12,10 +12,14 @@ struct xe_device;
 struct xe_file;
 struct xe_sched_job;
 
+#define SYNC_PARSE_FLAG_EXEC			BIT(0)
+#define SYNC_PARSE_FLAG_LR_MODE			BIT(1)
+#define SYNC_PARSE_FLAG_DISALLOW_USER_FENCE	BIT(2)
+
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
-			bool exec, bool compute_mode);
+			unsigned int flags);
 int xe_sync_entry_wait(struct xe_sync_entry *sync);
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
 			   struct xe_sched_job *job);
-- 
2.34.1

