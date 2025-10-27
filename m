Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60221CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B1910E547;
	Mon, 27 Oct 2025 18:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUO3VIZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36B610E550
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761589663; x=1793125663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QdwizcmUs5IaWEfLIvBnm3OVcKen81kI5dvrxFDnrW4=;
 b=PUO3VIZL+GwojayPb1lQwU8vzYRxAI0UkYwrOPvRQi8PC3JStKHjolfc
 fIPlGMMxOS/hOK5tGrErRbPrR108ZbJx0f857126Lxcltrg2kBKVJHflQ
 H6zrJb8wUDyIOIdKjp/w/zdewZhG3y66Q7mUDyqKafDiiYFKTLfk4XlH6
 cn0MGx43NORBmTd/Dtxtv+t2NNmZhqfgz9w+wugxPZXql8wxqHs6aNKZ/
 yG97jK2XNyh6Vkl+d6QUBfHxpfTAWOIhUullzQYX0I5RcLNII+8Z07SAv
 4xSkgdvJ8c0mT6rKAb9gpdKfud7mnie75qOD+w+HMJ06t+iQ9+dHPdkwY A==;
X-CSE-ConnectionGUID: zbU4dHZ1T2GnAvhevrzEeQ==
X-CSE-MsgGUID: pKmKIqZrS5a8bo6he8dV/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67544506"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="67544506"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:27:43 -0700
X-CSE-ConnectionGUID: jrjemZRpRn+oXxvwyfs0oA==
X-CSE-MsgGUID: Jf66birOSPi4V8Ncd9bjmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185884121"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:27:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v4 4/5] drm/xe: Don't allow in fences on zero batch exec or
 zero binds
Date: Mon, 27 Oct 2025 11:27:36 -0700
Message-Id: <20251027182737.2358096-5-matthew.brost@intel.com>
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

The zero batch or zero binds mechanism was added to implement queue
idling in Mesa. In this case, output fences are attached, which can be
waited upon to indicate that the queue is idle once they signal.

As part of this, we added the ability to install input fences on zero
batch execs or zero binds for interface congruence. However, upon
inspection, this implementation doesn't work correctly, as multiple
composite fences could be chained together, which is disallowed.

While this could be fixed, it would be rather complicated. Since the use
case for input fences on zero batch execs or zero binds isn't actually
used, it's better to remove support and disallow it.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 101 +++++++++++++----------------------
 1 file changed, 36 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 70706362c11a..f50134bedf8a 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -288,84 +288,55 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 
 	lockdep_assert_held(&vm->lock);
 
-	/* Count in-fences */
-	for (i = 0; i < num_sync; ++i) {
-		if (sync[i].fence) {
-			++num_fence;
-			fence = sync[i].fence;
-		}
-	}
-
-	/* Easy case... */
-	if (!num_fence) {
-		if (q->flags & EXEC_QUEUE_FLAG_VM) {
-			struct xe_exec_queue *__q;
-			struct xe_tile *tile;
-			u8 id;
-
-			for_each_tile(tile, vm->xe, id)
-				num_fence += (1 + XE_MAX_GT_PER_TILE);
-
-			fences = kmalloc_array(num_fence, sizeof(*fences),
-					       GFP_KERNEL);
-			if (!fences)
-				return ERR_PTR(-ENOMEM);
-
+	/* Reject in fences */
+	for (i = 0; i < num_sync; ++i)
+		if (sync[i].fence)
+			return ERR_PTR(-EOPNOTSUPP);
+
+	if (q->flags & EXEC_QUEUE_FLAG_VM) {
+		struct xe_exec_queue *__q;
+		struct xe_tile *tile;
+		u8 id;
+
+		for_each_tile(tile, vm->xe, id)
+			num_fence += (1 + XE_MAX_GT_PER_TILE);
+
+		fences = kmalloc_array(num_fence, sizeof(*fences),
+				       GFP_KERNEL);
+		if (!fences)
+			return ERR_PTR(-ENOMEM);
+
+		fences[current_fence++] =
+			xe_exec_queue_last_fence_get(q, vm);
+		for_each_tlb_inval(i)
+			fences[current_fence++] =
+				xe_exec_queue_tlb_inval_last_fence_get(q, vm, i);
+		list_for_each_entry(__q, &q->multi_gt_list,
+				    multi_gt_link) {
 			fences[current_fence++] =
-				xe_exec_queue_last_fence_get(q, vm);
+				xe_exec_queue_last_fence_get(__q, vm);
 			for_each_tlb_inval(i)
 				fences[current_fence++] =
-					xe_exec_queue_tlb_inval_last_fence_get(q, vm, i);
-			list_for_each_entry(__q, &q->multi_gt_list,
-					    multi_gt_link) {
-				fences[current_fence++] =
-					xe_exec_queue_last_fence_get(__q, vm);
-				for_each_tlb_inval(i)
-					fences[current_fence++] =
-						xe_exec_queue_tlb_inval_last_fence_get(__q, vm, i);
-			}
-
-			xe_assert(vm->xe, current_fence == num_fence);
-			cf = dma_fence_array_create(num_fence, fences,
-						    dma_fence_context_alloc(1),
-						    1, false);
-			if (!cf)
-				goto err_out;
-
-			return &cf->base;
+					xe_exec_queue_tlb_inval_last_fence_get(__q, vm, i);
 		}
 
-		fence = xe_exec_queue_last_fence_get(q, vm);
-		return fence;
-	}
+		xe_assert(vm->xe, current_fence == num_fence);
+		cf = dma_fence_array_create(num_fence, fences,
+					    dma_fence_context_alloc(1),
+					    1, false);
+		if (!cf)
+			goto err_out;
 
-	/*
-	 * Create composite fence - FIXME - the below code doesn't work. This is
-	 * unused in Mesa so we are ok for the moment. Perhaps we just disable
-	 * this entire code path if number of in fences != 0.
-	 */
-	fences = kmalloc_array(num_fence + 1, sizeof(*fences), GFP_KERNEL);
-	if (!fences)
-		return ERR_PTR(-ENOMEM);
-	for (i = 0; i < num_sync; ++i) {
-		if (sync[i].fence) {
-			dma_fence_get(sync[i].fence);
-			fences[current_fence++] = sync[i].fence;
-		}
+		return &cf->base;
 	}
-	fences[current_fence++] = xe_exec_queue_last_fence_get(q, vm);
-	cf = dma_fence_array_create(num_fence, fences,
-				    dma_fence_context_alloc(1), 1, false);
-	if (!cf)
-		goto err_out;
 
-	return &cf->base;
+	fence = xe_exec_queue_last_fence_get(q, vm);
+	return fence;
 
 err_out:
 	while (current_fence)
 		dma_fence_put(fences[--current_fence]);
 	kfree(fences);
-	kfree(cf);
 
 	return ERR_PTR(-ENOMEM);
 }
-- 
2.34.1

