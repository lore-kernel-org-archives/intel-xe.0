Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F59CCFA07
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 23:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CA010E119;
	Fri, 31 Oct 2025 23:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e31609Ol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E08310E10D
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 23:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761954059; x=1793490059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hcYREWQYbIqX7KL/k2LqGg81WhoCiM0jJnBF38ctCcU=;
 b=e31609OliBY+7pB/ZkCpvLztFljs4DjDNgWdWV+3uGi/60tbtB/Co7CT
 7X6S9BmOFGADZhdhrg2jmodDkZ5z9B7HcXaO1DO/cjsHIgxV/ABW3ge/D
 EC/4DUARlk8XX89PgGTrgqarD7nGW1DkLLo++bMsS5cVW4ezHS1AWskaz
 rFS2kryHmy82WUb8wb8MmJUYpvg3iFmRCNuNq/Q5ELWtBHI8jWVZ9Q6Td
 EgXht3JQX5fogKBDcKVjQYioDgae+qNDFj8eNxyNeLoGKVJ/NVi404Jah
 WTO5drPMNoeehuStWBsOenTwb9VVuaFHPgSJRjvKWQ06dAJcRcg2NZUtx A==;
X-CSE-ConnectionGUID: La4USVG8TwyuTaOJODO0Ig==
X-CSE-MsgGUID: ksT5FJ0jSt69c/Px82COkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81749190"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="81749190"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 16:40:58 -0700
X-CSE-ConnectionGUID: J7RFho9FSN6v/JIp5I2qhg==
X-CSE-MsgGUID: Snu3FasBQ4isp+xjIaSvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="223595476"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 16:40:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v7 5/6] drm/xe: Disallow input fences on zero batch execs and
 zero binds
Date: Fri, 31 Oct 2025 16:40:49 -0700
Message-Id: <20251031234050.3043507-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031234050.3043507-1-matthew.brost@intel.com>
References: <20251031234050.3043507-1-matthew.brost@intel.com>
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

