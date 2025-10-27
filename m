Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCB5CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ED510E549;
	Mon, 27 Oct 2025 18:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJW1H3Uh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC66D10E54D
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761589664; x=1793125664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZutDNs5K2o0jiAXE0G/vqgAHWs6smMd4I+fBWFcWmwo=;
 b=nJW1H3UhkX9o0ZmgNCVE+fBV/JKC5EcPh7tASNZElUay2iMM+/U79MQO
 kbIiDKvnemQO/vC7tzMXx/igazGPZ9BqyIw99EAwOfY7/dl5du+kjGqex
 KEra2Z9OKIG8DLCpG7bqLLR8wMeXUjCqqFWkwD+/idIad9aFzTkzridi0
 5G32fFfT08WSoPpN6HfSkIfmFc/vP1F6wDwgBYEYAMFcuXwS8TNKIrg0D
 bxKMJLzWEvGQqL/4ALqMiM5KvOz3kGIcUxWGMz2SmK1t79+uEoPRZXm4x
 DHwFoQSyLkY0rslJvbT8QqTJB/nskVIAY5Qu5Vpirxu6tA4w+adRRF9/Z w==;
X-CSE-ConnectionGUID: RfbExcLGTv2HSE01AsvZyQ==
X-CSE-MsgGUID: wUHHCyJ/SZ2146eb3kMhhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67544507"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="67544507"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:27:43 -0700
X-CSE-ConnectionGUID: XtT27bJcSpu1F+4mTiFkJQ==
X-CSE-MsgGUID: GDPDf3TAT8OexyQCjlJdDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185884122"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:27:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v4 5/5] drm/xe: Remove last fence dependecy check from binds
Date: Mon, 27 Oct 2025 11:27:37 -0700
Message-Id: <20251027182737.2358096-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027182737.2358096-1-matthew.brost@intel.com>
References: <20251027182737.2358096-1-matthew.brost@intel.com>
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

The last fence dependency check for binds is now equivalent to
xe_exec_queue_is_idle and is redundant, so remove this dead code.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 23 -----------------------
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
 drivers/gpu/drm/xe/xe_pt.c         |  7 -------
 3 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index d7d00d4de93c..efcdfdb0cc3f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1109,29 +1109,6 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
 	q->last_fence = dma_fence_get(fence);
 }
 
-/**
- * xe_exec_queue_last_fence_test_dep - Test last fence dependency of queue
- * @q: The exec queue
- * @vm: The VM the engine does a bind or exec for
- *
- * Returns:
- * -ETIME if there exists an unsignalled last fence dependency, zero otherwise.
- */
-int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
-{
-	struct dma_fence *fence;
-	int err = 0;
-
-	fence = xe_exec_queue_last_fence_get(q, vm);
-	if (fence) {
-		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
-			0 : -ETIME;
-		dma_fence_put(fence);
-	}
-
-	return err;
-}
-
 /**
  * xe_exec_queue_tlb_inval_last_fence_put() - Drop ref to last TLB invalidation fence
  * @q: The exec queue
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index c4b95fad93f1..839e9880a598 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -88,8 +88,6 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
 							  struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
-int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
-				      struct xe_vm *vm);
 
 void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
 					    struct xe_vm *vm,
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a4b9cdf016d9..01056b51ac9f 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1338,13 +1338,6 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 			return err;
 	}
 
-	if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
-		if (job)
-			err = xe_sched_job_last_fence_add_dep(job, vm);
-		else
-			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
-	}
-
 	for (i = 0; job && !err && i < vops->num_syncs; i++)
 		err = xe_sync_entry_add_deps(&vops->syncs[i], job);
 
-- 
2.34.1

