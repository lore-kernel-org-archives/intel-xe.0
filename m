Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97670CCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 21:43:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C64C10E55E;
	Mon, 27 Oct 2025 21:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kizrj6K/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FC110E19A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761601377; x=1793137377;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=QdwizcmUs5IaWEfLIvBnm3OVcKen81kI5dvrxFDnrW4=;
 b=kizrj6K/2PlmEBWST3k5gz6oSDx4ttCN6lBMz1VSW8QxaKI9N1zf8iQT
 THPjl5CU5z7Ol0v8dtu3HTBF8H5aIdAHkgDIVVBtgrjHiFAhYbUdrrvzU
 h0QeDQ9vp1q6Obj0T/lp6PLNs4ZhuqDRzYgMSDssqXqQERiFeidUUm4is
 IdhgnroEvx3cC5UGzd+cM+busOZqoNQtRIVn45PPmZRVOXl24VcsUWtqu
 7a+6DEbvazmGmk8WlMq8nylzQD9IlCUJu+tObzqJXgUxyGOcY4auIUhGm
 EEutnC3qjeCA/6Mwjeay0KErMmupknTFWdboxcJ8CPMM7cUxRBNVKe/fQ Q==;
X-CSE-ConnectionGUID: DT856KU5SIK0GMlIYqYQhg==
X-CSE-MsgGUID: 0uylzebwTkiEyuTnf9yGRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74368846"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="74368846"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:57 -0700
X-CSE-ConnectionGUID: T7+1ZwkFQtar6zS33uigig==
X-CSE-MsgGUID: PhjPW3AkQ6GJOHwus+oPJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184782346"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 14:42:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 4/8] drm/xe: Don't allow in fences on zero batch exec or zero
 binds
Date: Mon, 27 Oct 2025 14:42:48 -0700
Message-Id: <20251027214252.2455093-5-matthew.brost@intel.com>
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

