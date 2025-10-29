Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96C9CCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDC110E84D;
	Wed, 29 Oct 2025 20:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hO+fFAHa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00F6E10E84A
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761771446; x=1793307446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5RSvikfcMzYpZ1/CZQ1Kk7tCu0ICrBJRbIqv6hm6Upc=;
 b=hO+fFAHaichOf17flFTaucNuCAIEQEQ6thq6mPBzttGRsqHlwowzgG9B
 10/MGdcFQuSJRfWfJbQV05pJApo6oII9QDNbqq0Z813QakHQUGL0JVSBH
 K/p5Bknvo7nMnLY8PZmKFpwC+dlp0JFa3bE5OOc8sKJ0NXSyoK0rzj5LW
 ijpPgMZ7fTUOJCGB1cXTogHbxhiWOT9aix4ux2BLyT+rj/mzohz40udUr
 VQGu+68dw2sRebm+dClMkZdYCbw0GSMmSWhTRIIaA9V5zftHSaDgZu8U5
 qGntzDOIz5xLrlW7zWW0gc4QsXdA6gVBNgPWbJDH3puKdO3rPnsaFp+PQ A==;
X-CSE-ConnectionGUID: ip/8ARV2RxS/aQymBcsNng==
X-CSE-MsgGUID: kEwzS7IASOqmaz0zMxhrdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="86533179"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="86533179"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:57:25 -0700
X-CSE-ConnectionGUID: WV3E1lOjRwCuc2z8R7A8Iw==
X-CSE-MsgGUID: m6YnelFISQS5PiPu/Kfbuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190128891"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:57:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 6/6] drm/xe: Remove last fence dependency check from binds
Date: Wed, 29 Oct 2025 13:57:19 -0700
Message-Id: <20251029205719.2746501-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029205719.2746501-1-matthew.brost@intel.com>
References: <20251029205719.2746501-1-matthew.brost@intel.com>
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

Eliminate redundant last fence dependency checks in bind jobs, as they
are now equivalent to xe_exec_queue_is_idle. Simplify the code by
removing this dead logic.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 23 -----------------------
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
 drivers/gpu/drm/xe/xe_pt.c         |  7 -------
 3 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index b7551592fe3f..3486744a8dfd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1122,29 +1122,6 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
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
index 1ba7354b33d1..fda4d4f9bda8 100644
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

