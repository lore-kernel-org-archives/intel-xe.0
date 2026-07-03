Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503F1C43458
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 12:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1451410E5DF;
	Fri,  3 Jul 2026 12:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="neBk7nKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E798110E5DF
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783082547; x=1814618547;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ygD9iI5qfGE+cBnbv4+h08Yk0JulNUxyKU+CQ12hzbY=;
 b=neBk7nKSDQJqog8aFAoHyUQaMLGoBunIg1VfUKYaobSmA6KQJ/BhHkYU
 BP6nmBVjbn183FF/cbwELGLiqkM0KJ8rMnJdiHoqVCUtV5eiIFNrg9iNQ
 3jhOhMlm228CyNRT5w5IYqch7axvjOL13qfiWOTfZWJejxklA5bGJwF1E
 gnx7cMVPzhYcezPXL/VZy+e9nEEghUpPwNCqPzXXvaYes/kirmBnhzpwO
 4+rHZ48oKNV/NdIDtMLWrkrJOVN54kyMnG7H1l+qAoNpnY5UbZVKDUB4X
 +xQLzgyPDeYjz3YLPs3FLw9g3jx+33Kc4W9v7+kUVCY5jjPxBwPfKP/+v Q==;
X-CSE-ConnectionGUID: sync6GeLRk+XVCeL488tTA==
X-CSE-MsgGUID: oe9gpF/EQDaae+IDEKiZww==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101256709"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="101256709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:42:27 -0700
X-CSE-ConnectionGUID: Nc1qGdx2T2iYZRRrP/+pyw==
X-CSE-MsgGUID: G9pJwvz2SlKbvFk7iimmKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="253249946"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO
 mpatelcz-mobl.intel.com) ([10.245.245.83])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 05:42:25 -0700
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, stuart.summers@intel.com,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: [PATCH] drm/xe: Allow multi tile fence signaling for VM queue
Date: Fri,  3 Jul 2026 14:41:53 +0200
Message-ID: <20260703124153.1736798-1-maciej.patelczyk@intel.com>
X-Mailer: git-send-email 2.43.0
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

1. Exec queue can be created without populating multi_gt_list.
2. VM BIND IOCTL can be called without exec queue id as argument
   which will end in using vm->q[0] later in the flow.
3. exec queues in vm->q table are not the same as in
   vm->exec_queue.list.

However, the xe_sync_in_fence_get() does not take the above into
its calculations which may lead to following error:
   [drm] Assertion `current_fence == num_fence` failed!

Exec queues with and without multi_gt_list both carry
EXEC_QUEUE_FLAG_VM flag, so xe_sync_in_fence_get() does its
calculations in one way.
The proposed solution it to check if input exec queue is vm's
(un)binding queue, that is q == vm->q[0] and process data
separately.

Fixes: cb99e12ba8cb ("drm/xe: Decouple bind queue last fence from TLB invalidations")
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 68 ++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 37866768d64c..14d8603631ab 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -314,6 +314,46 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
 		user_fence_put(sync->ufence);
 }
 
+static int
+sync_in_fence_get_from_vm(struct xe_vm *vm, struct dma_fence **fences)
+{
+	struct xe_tile *tile;
+	int id, i, n_fence = 0;
+
+	for_each_tile(tile, vm->xe, id) {
+		fences[n_fence++] =
+			xe_exec_queue_last_fence_get(vm->q[id], vm);
+		for_each_tlb_inval(i)
+			fences[n_fence++] =
+				xe_exec_queue_tlb_inval_last_fence_get(vm->q[id], vm, i);
+	}
+	return n_fence;
+}
+
+static int
+sync_in_fence_get_from_q_list(struct xe_exec_queue *q, struct xe_vm *vm,
+			      struct dma_fence **fences)
+{
+	struct xe_exec_queue *__q;
+	int i, n_fence = 0;
+
+	fences[n_fence++] =
+		xe_exec_queue_last_fence_get(q, vm);
+	for_each_tlb_inval(i)
+		fences[n_fence++] =
+			xe_exec_queue_tlb_inval_last_fence_get(q, vm, i);
+
+	list_for_each_entry(__q, &q->multi_gt_list,
+			    multi_gt_link) {
+		fences[n_fence++] =
+			xe_exec_queue_last_fence_get(__q, vm);
+		for_each_tlb_inval(i)
+			fences[n_fence++] =
+				xe_exec_queue_tlb_inval_last_fence_get(__q, vm, i);
+	}
+	return n_fence;
+}
+
 /**
  * xe_sync_in_fence_get() - Get a fence from syncs, exec queue, and VM
  * @sync: input syncs
@@ -335,7 +375,7 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
 	struct dma_fence *fence;
-	int i, num_fence = 0, current_fence = 0;
+	int i, num_fence = 0, n_fence = 0;
 
 	lockdep_assert_held(&vm->lock);
 
@@ -345,9 +385,8 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 			return ERR_PTR(-EOPNOTSUPP);
 
 	if (q->flags & EXEC_QUEUE_FLAG_VM) {
-		struct xe_exec_queue *__q;
 		struct xe_tile *tile;
-		u8 id;
+		int id;
 
 		for_each_tile(tile, vm->xe, id) {
 			num_fence++;
@@ -359,21 +398,12 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 		if (!fences)
 			return ERR_PTR(-ENOMEM);
 
-		fences[current_fence++] =
-			xe_exec_queue_last_fence_get(q, vm);
-		for_each_tlb_inval(i)
-			fences[current_fence++] =
-				xe_exec_queue_tlb_inval_last_fence_get(q, vm, i);
-		list_for_each_entry(__q, &q->multi_gt_list,
-				    multi_gt_link) {
-			fences[current_fence++] =
-				xe_exec_queue_last_fence_get(__q, vm);
-			for_each_tlb_inval(i)
-				fences[current_fence++] =
-					xe_exec_queue_tlb_inval_last_fence_get(__q, vm, i);
-		}
+		if (q == vm->q[0])
+			n_fence = sync_in_fence_get_from_vm(vm, fences);
+		else
+			n_fence = sync_in_fence_get_from_q_list(q, vm, fences);
 
-		xe_assert(vm->xe, current_fence == num_fence);
+		xe_assert(vm->xe, n_fence == num_fence);
 		cf = dma_fence_array_create(num_fence, fences,
 					    dma_fence_context_alloc(1),
 					    1);
@@ -387,8 +417,8 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 	return fence;
 
 err_out:
-	while (current_fence)
-		dma_fence_put(fences[--current_fence]);
+	while (n_fence)
+		dma_fence_put(fences[--n_fence]);
 	kfree(fences);
 
 	return ERR_PTR(-ENOMEM);
-- 
2.43.0

