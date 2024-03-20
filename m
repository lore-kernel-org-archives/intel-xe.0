Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FB2C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 12:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B1310F752;
	Wed, 20 Mar 2024 12:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anocZIa5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C1710F752
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Mar 2024 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710939586; x=1742475586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ySzIYKHXzPmHfXwPaQCRPbwSHbPLHa36rdbomlpP2aY=;
 b=anocZIa5lmAVehdbQNCF8wOJYn8Fhx4qaMUtC61uCcdWkRSvunMKJzbD
 m1NqpjYJOt79TaqI90pSnO6Ae/8nQC0K8JRiS62OlR1czcTjkJDQK3ZAl
 poh5pD5V0dgTz/6tz7BRmo+9p3kQIoh8ZPuiGs0MBme9mrC7HOUU2cNna
 bBox074istmeN8sPGJsUdtbqaGzTsikJAKXtoQIuTtoOZpI56zP/ohX+t
 dNneA0Qwqiz3u7jk9M/9JTe2qjzV32vQYFftj/QQj/AnNtX7+w6zAJQL5
 Yy18uLDGnlJl4sD+aGV3/VKrvXqutVOtAI4Wp0Ae4B/1D4F4qf4ZIctAc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="17264458"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="17264458"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 05:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="18614315"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 05:59:43 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Create a helper function to init job's user fence
Date: Wed, 20 Mar 2024 13:45:56 +0100
Message-ID: <20240320124556.10337-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Refactor xe_sync_entry_signal so it doesn't have to
modify xe_sched_job struct instead create a new helper function
to set user fence values for a job.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c      | 10 ++++++----
 drivers/gpu/drm/xe/xe_sched_job.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_sched_job.h |  3 +++
 drivers/gpu/drm/xe/xe_sync.c      |  7 +------
 drivers/gpu/drm/xe/xe_sync.h      |  1 -
 drivers/gpu/drm/xe/xe_vm.c        | 10 +++++-----
 6 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 7692ebfe7d47..1fb4dd4d0557 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -249,7 +249,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 				goto err_unlock_list;
 			}
 			for (i = 0; i < num_syncs; i++)
-				xe_sync_entry_signal(&syncs[i], NULL, fence);
+				xe_sync_entry_signal(&syncs[i], fence);
 			xe_exec_queue_last_fence_set(q, vm, fence);
 			dma_fence_put(fence);
 		}
@@ -359,9 +359,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, &job->drm.s_fence->finished,
 					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
 
-	for (i = 0; i < num_syncs; i++)
-		xe_sync_entry_signal(&syncs[i], job,
-				     &job->drm.s_fence->finished);
+	for (i = 0; i < num_syncs; i++) {
+		xe_sync_entry_signal(&syncs[i], &job->drm.s_fence->finished);
+		if (syncs[i].type == DRM_XE_SYNC_TYPE_USER_FENCE)
+			xe_sched_job_init_user_fence(job, &syncs[i]);
+	}
 
 	if (xe_exec_queue_is_lr(q))
 		q->ring_ops->emit_job(job);
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 8151ddafb940..734900b9c7d2 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -17,6 +17,7 @@
 #include "xe_macros.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
+#include "xe_sync_types.h"
 
 static struct kmem_cache *xe_sched_job_slab;
 static struct kmem_cache *xe_sched_job_parallel_slab;
@@ -278,6 +279,19 @@ int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
 	return drm_sched_job_add_dependency(&job->drm, fence);
 }
 
+/**
+ * xe_sched_job_init_user_fence - Initialize user_fence for the job
+ * @job: job whose user_fence needs an init:w
+ * @sync: sync to be use to init user_fence
+ */
+void xe_sched_job_init_user_fence(struct xe_sched_job *job,
+				  struct xe_sync_entry *sync)
+{
+	job->user_fence.used = true;
+	job->user_fence.addr = sync->addr;
+	job->user_fence.value = sync->timeline_value;
+}
+
 struct xe_sched_job_snapshot *
 xe_sched_job_snapshot_capture(struct xe_sched_job *job)
 {
diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index f1a660648cf0..c75018f4660d 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -10,6 +10,7 @@
 
 struct drm_printer;
 struct xe_vm;
+struct xe_sync_entry;
 
 #define XE_SCHED_HANG_LIMIT 1
 #define XE_SCHED_JOB_TIMEOUT LONG_MAX
@@ -58,6 +59,8 @@ void xe_sched_job_arm(struct xe_sched_job *job);
 void xe_sched_job_push(struct xe_sched_job *job);
 
 int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
+void xe_sched_job_init_user_fence(struct xe_sched_job *job,
+				  struct xe_sync_entry *sync);
 
 static inline struct xe_sched_job *
 to_xe_sched_job(struct drm_sched_job *drm)
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 02c9577fe418..65f1f1628235 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -224,8 +224,7 @@ int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 	return 0;
 }
 
-void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
-			  struct dma_fence *fence)
+void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
 {
 	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
 		return;
@@ -254,10 +253,6 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 			user_fence_put(sync->ufence);
 			dma_fence_put(fence);
 		}
-	} else if (sync->type == DRM_XE_SYNC_TYPE_USER_FENCE) {
-		job->user_fence.used = true;
-		job->user_fence.addr = sync->addr;
-		job->user_fence.value = sync->timeline_value;
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 0fd0d51208e6..3e03396af2c6 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -26,7 +26,6 @@ int xe_sync_entry_wait(struct xe_sync_entry *sync);
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
 			   struct xe_sched_job *job);
 void xe_sync_entry_signal(struct xe_sync_entry *sync,
-			  struct xe_sched_job *job,
 			  struct dma_fence *fence);
 void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
 struct dma_fence *
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 80d43d75b1da..497e49b867fc 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1696,7 +1696,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
 	if (last_op) {
 		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], NULL, fence);
+			xe_sync_entry_signal(&syncs[i], fence);
 	}
 
 	return fence;
@@ -1770,7 +1770,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 
 	if (last_op) {
 		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], NULL,
+			xe_sync_entry_signal(&syncs[i],
 					     cf ? &cf->base : fence);
 	}
 
@@ -1831,7 +1831,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
 		if (last_op) {
 			for (i = 0; i < num_syncs; i++)
-				xe_sync_entry_signal(&syncs[i], NULL, fence);
+				xe_sync_entry_signal(&syncs[i], fence);
 		}
 	}
 
@@ -2052,7 +2052,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 				struct dma_fence *fence =
 					xe_exec_queue_last_fence_get(wait_exec_queue, vm);
 
-				xe_sync_entry_signal(&syncs[i], NULL, fence);
+				xe_sync_entry_signal(&syncs[i], fence);
 				dma_fence_put(fence);
 			}
 		}
@@ -2930,7 +2930,7 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 		return PTR_ERR(fence);
 
 	for (i = 0; i < num_syncs; i++)
-		xe_sync_entry_signal(&syncs[i], NULL, fence);
+		xe_sync_entry_signal(&syncs[i], fence);
 
 	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
 				     fence);
-- 
2.42.0

