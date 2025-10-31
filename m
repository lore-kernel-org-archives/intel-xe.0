Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5595ACCFA05
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD9810EC08;
	Fri, 31 Oct 2025 18:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fh2nslQ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64BF10E385
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761934196; x=1793470196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hcYREWQYbIqX7KL/k2LqGg81WhoCiM0jJnBF38ctCcU=;
 b=Fh2nslQ3Dj1Mgu3EKFCU/qvpfmHpRtIWFYqWvjRRoOdzTcE/KIa4sTP6
 UuOEF48txP2oyRwU3GBp4+JdQSsNKjwfEz3o3dJmBKw5MMQzypfg1arv1
 Ykb5UMZmXbL3R9QU88fL+rY8DunlZc/1ox5jSAZjaEDAZJwTxIApdhL5j
 m9fll3Avs1/oxDIB6TGp0DCzaLeVCsbzt1eRw4A7mUUJts51pSo0OyVMW
 zcA/7gGadM1bEiqOmKkfrnj4/ilQ2A1LTRJ2INKLsxWl8fLLJFzu5o3tr
 mYzqFzNKA/AkAlnKYF+doAIiKbGmNtHzF1MAJXbTkguw4iduJCciyfudd w==;
X-CSE-ConnectionGUID: Z8tpL1uJRDqtjOIKpF/vkQ==
X-CSE-MsgGUID: Pf1QWDl6SO2lddCoNrVySw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63305205"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63305205"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:09:56 -0700
X-CSE-ConnectionGUID: ZjgVFWtFS5CvHlB6o1LBFA==
X-CSE-MsgGUID: e6f1lrq/RySZjMSHlji4fA==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:09:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v6 5/6] drm/xe: Disallow input fences on zero batch execs and
 zero binds
Date: Fri, 31 Oct 2025 11:09:48 -0700
Message-Id: <20251031180949.2968311-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031180949.2968311-1-matthew.brost@intel.com>
References: <20251031180949.2968311-1-matthew.brost@intel.com>
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

Prevent input fences from being installed on zero batch execs or zero
binds, which were originally added to support queue idling in Mesa via
output fences. Although input fence support was introduced for interface
consistency, it leads to incorrect behavior due to chained composite
fences, which are disallowed.

Avoid the complexity of fixing this by removing support, as input fences
for these cases are not used in practice.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 101 +++++++++++++----------------------
 1 file changed, 36 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index df7ca349398b..ff74528ca0c6 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -301,84 +301,55 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 
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

