Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9515ACCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A5C10E563;
	Mon, 27 Oct 2025 21:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgBk1d2i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C76410E55D
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601377; x=1793137377;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZutDNs5K2o0jiAXE0G/vqgAHWs6smMd4I+fBWFcWmwo=;
 b=NgBk1d2iinBd5B0pOnuzxmY4WeeohdoMmbo6KKiIY/6iiuvphsJKfPNz
 huuCP7I/XeiB4akhKqVTstjc0loxSjT6C3tbfnwOqkBtIN91jYNw9N4qd
 rhwy5SPLYzE0LS8c4kNrKkt7PccrQf7i072MjjoiNVzj5FBnte2/HfaAn
 PW1u1tKrBBvu0A5uR8scm0ImUezfK5rnPrslnUHTkdlw3FGShlDQDUm5J
 nagF+W4UP7Uo2Ymn5xkgD90CIwsKOZxYCXNO9xdsvVloMakxqbN/SQANm
 qTogtSbdzVAYmKbU/AwgMAF9XDESk8AnOhCKHKN97w3EJ0r9hjS0Hq3Wd A==;
X-CSE-ConnectionGUID: 33B+a2r6Q1yTRcID0VAlMw==
X-CSE-MsgGUID: f5uxOfXzQYGqFesbfqZ4ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74368847"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74368847"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:57 -0700
X-CSE-ConnectionGUID: IDJEoe8TSaOiP0cGd7XhiA==
X-CSE-MsgGUID: RaiihziGT1mCqUysLyq2oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184782347"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 5/8] drm/xe: Remove last fence dependecy check from binds
Date: Mon, 27 Oct 2025 14:42:49 -0700
Message-Id: <20251027214252.2455093-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027214252.2455093-1-matthew.brost@intel.com>
References: <20251027214252.2455093-1-matthew.brost@intel.com>
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

