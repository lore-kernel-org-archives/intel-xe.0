Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB415C4828C
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 00:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE66C10FDFF;
	Thu,  1 Feb 2024 00:48:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D27910FE09
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 00:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706748489; x=1738284489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RssCCZtuwZyCuUGyVsRjDh0VIJ91VFSz2qea19UC1/g=;
 b=LzZqGvKpfu8azWOhxQZ58J9cCIsIIfaVjA81U0XSU4F+pI2qAo72qMYE
 BSJrtlO8mMMWQ0fRetAG6YCoFJXWORfg4+ViPbehtiy4Ooz7T2/O0NY/D
 GoZsORHYC4wjLvXdWtLeZxU+P/K7JPEmLAqjr4XR3T5SQp52/MxjPrP7w
 +L7n+vcZdcaGxeYg+q6o57HFhHncnHLMiC52cgXm+YKKOZ4A06LtWW16+
 LWHaFssxj02AYEH7FxwqFu4NUg4xIIOcoPdZCa34DjkBkbyxYKnnf3xYW
 FDWUUdQCEsaHZzFPaAwZgr/7tY19luRBabiHKaq0jua3G0DekGmIJfN5C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10424075"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="10424075"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="878961977"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="878961977"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 16:48:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/xe: Take a reference in xe_exec_queue_last_fence_get()
Date: Wed, 31 Jan 2024 16:48:48 -0800
Message-Id: <20240201004849.2219558-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201004849.2219558-1-matthew.brost@intel.com>
References: <20240201004849.2219558-1-matthew.brost@intel.com>
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

Take a reference in xe_exec_queue_last_fence_get(). Also fix a reference
counting underflow bug VM bind and unbind.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 8 ++++++--
 drivers/gpu/drm/xe/xe_migrate.c    | 5 ++++-
 drivers/gpu/drm/xe/xe_sched_job.c  | 1 -
 drivers/gpu/drm/xe/xe_sync.c       | 2 --
 drivers/gpu/drm/xe/xe_vm.c         | 1 +
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c0b7434e78f1..2976635be4d3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -976,20 +976,24 @@ void xe_exec_queue_last_fence_put_unlocked(struct xe_exec_queue *q)
  * @q: The exec queue
  * @vm: The VM the engine does a bind or exec for
  *
- * Get last fence, does not take a ref
+ * Get last fence, takes a ref
  *
  * Returns: last fence if not signaled, dma fence stub if signaled
  */
 struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
 					       struct xe_vm *vm)
 {
+	struct dma_fence *fence;
+
 	xe_exec_queue_last_fence_lockdep_assert(q, vm);
 
 	if (q->last_fence &&
 	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
 		xe_exec_queue_last_fence_put(q, vm);
 
-	return q->last_fence ? q->last_fence : dma_fence_get_stub();
+	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
+	dma_fence_get(fence);
+	return fence;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9ab004871f9a..894e36c28f32 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1214,8 +1214,11 @@ static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
 	}
 	if (q) {
 		fence = xe_exec_queue_last_fence_get(q, vm);
-		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
+			dma_fence_put(fence);
 			return false;
+		}
+		dma_fence_put(fence);
 	}
 
 	return true;
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cde1407867db..8151ddafb940 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -274,7 +274,6 @@ int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
 	struct dma_fence *fence;
 
 	fence = xe_exec_queue_last_fence_get(job->q, vm);
-	dma_fence_get(fence);
 
 	return drm_sched_job_add_dependency(&job->drm, fence);
 }
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index e4c220cf9115..aab92bee1d7c 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -307,7 +307,6 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 	/* Easy case... */
 	if (!num_in_fence) {
 		fence = xe_exec_queue_last_fence_get(q, vm);
-		dma_fence_get(fence);
 		return fence;
 	}
 
@@ -322,7 +321,6 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 		}
 	}
 	fences[current_fence++] = xe_exec_queue_last_fence_get(q, vm);
-	dma_fence_get(fences[current_fence - 1]);
 	cf = dma_fence_array_create(num_in_fence, fences,
 				    vm->composite_fence_ctx,
 				    vm->composite_fence_seqno++,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8576535c4b6a..e55161136490 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1959,6 +1959,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 					xe_exec_queue_last_fence_get(wait_exec_queue, vm);
 
 				xe_sync_entry_signal(&syncs[i], NULL, fence);
+				dma_fence_put(fence);
 			}
 		}
 
-- 
2.34.1

