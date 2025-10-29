Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EC8CCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 20:57:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D24E10E850;
	Wed, 29 Oct 2025 20:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V28dHy0g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38ED10E849
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761771446; x=1793307446;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hcYREWQYbIqX7KL/k2LqGg81WhoCiM0jJnBF38ctCcU=;
 b=V28dHy0ghEY9velIgSTlvP5erj/uGTna+eIdYB1WQ0lFmr6xXhEHtFw1
 7/HPod/wwkKCdIT1leXpjl/hpZ7lPRKIcgSBKsEjv2OL/Kl5CeSE64GtY
 DOpp4moALCRdLkflz48KxH40L5pSZF3HwInj+08swpPjxrG8w1vDFui4J
 wnDWfGpCQZrb5JLKqW4OC3Y7jCL+CN2hP7Mhuzvw9dDkSNfRFMUGdbn3F
 wEnVM+2hjzxyY8QjNdA4KzDcsAbMvtuAWVD62em4JtHLUb5qzVPPikNjA
 rDQbgpjsilqNh7nCXh9WFNBf8hNErZlCYhFzCWcORRRn2U37kw+BcXv5v w==;
X-CSE-ConnectionGUID: tNU38D/mSUedP5yF18o5IA==
X-CSE-MsgGUID: eTZLTWgERkijObXMic+w+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="86533178"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="86533178"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:57:24 -0700
X-CSE-ConnectionGUID: OL8bzSCLQ0WG0TUvxDyO9g==
X-CSE-MsgGUID: ibMvw1HoRq6sIl/AhBIk4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190128888"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:57:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v5 5/6] drm/xe: Disallow input fences on zero batch execs and
 zero binds
Date: Wed, 29 Oct 2025 13:57:18 -0700
Message-Id: <20251029205719.2746501-6-matthew.brost@intel.com>
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

