Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C96C48BF8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 03:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693C010E3AE;
	Thu, 22 Feb 2024 03:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHASqs2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2980010E3AE
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 03:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708574380; x=1740110380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3AHOBwG832QmUtG5xZQNxzAHGs6VuWuV/tARfB27vA4=;
 b=dHASqs2KILBja0rncPIBC+njZwM/vK3GiXdnHRy5P9cJg4Fv0lrhWx7O
 Y05rhXgrN61bw6YtEKisMdq8cc7y0GTtqnTuQDCmmqTZFe3UhsCVEmN76
 71aEIstByJ1HiGiOgJci321FN+ffRq7bRxr9ZrRnw4mLjUQDBm8YnbfDm
 1KcqQ11ue+ppdJ0DKQSg0O3AnrvA9eIf14hpnyM6DmeIrXPkSO9ang9Hh
 sLQobXEeNhqX/9CBy35jJgNY2NIWnvKIG5d9T3UW/9U9RE3aGlWDR8Ih4
 vD0TshZaC8u3bLscABBfpdCqSmlKP7Ya1Ylsd4QA08MzLstsR2z4HD/j3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14198962"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="14198962"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 19:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="913442923"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="913442923"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 19:59:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Don't issue TLB invalidations for VMAs if
 using execlists
Date: Wed, 21 Feb 2024 19:59:06 -0800
Message-Id: <20240222035906.3835257-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222035906.3835257-1-matthew.brost@intel.com>
References: <20240222035906.3835257-1-matthew.brost@intel.com>
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

TLB invalidations for VMAs are currently only implemented with the GuC
enabled. Do not issue TLB invalidations if using execlists. A longer
term fix would be up the TLB invalidation layer to be execlist aware.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7f54bc3e389d..c4de13bcfe85 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1256,9 +1256,11 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	 */
 	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
 	    (!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
-		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-		if (!ifence)
-			return ERR_PTR(-ENOMEM);
+		if (!vm->xe->info.force_execlist) {
+			ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
+			if (!ifence)
+				return ERR_PTR(-ENOMEM);
+		}
 	}
 
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
@@ -1574,7 +1576,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 	struct xe_vm *vm = xe_vma_vm(vma);
 	u32 num_entries;
 	struct dma_fence *fence = NULL;
-	struct invalidation_fence *ifence;
+	struct invalidation_fence *ifence = NULL;
 	struct xe_range_fence *rfence;
 
 	LLIST_HEAD(deferred);
@@ -1593,9 +1595,11 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
 				   num_entries);
 
-	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-	if (!ifence)
-		return ERR_PTR(-ENOMEM);
+	if (!vm->xe->info.force_execlist) {
+		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
+		if (!ifence)
+			return ERR_PTR(-ENOMEM);
+	}
 
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
 	if (!rfence) {
@@ -1625,13 +1629,15 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 			dma_fence_wait(fence, false);
 
 		/* TLB invalidation must be done before signaling unbind */
-		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
-		if (err) {
-			dma_fence_put(fence);
-			kfree(ifence);
-			return ERR_PTR(err);
+		if (ifence) {
+			err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
+			if (err) {
+				dma_fence_put(fence);
+				kfree(ifence);
+				return ERR_PTR(err);
+			}
+			fence = &ifence->base.base;
 		}
-		fence = &ifence->base.base;
 
 		/* add shared fence now for pagetable delayed destroy */
 		dma_resv_add_fence(xe_vm_resv(vm), fence,
-- 
2.34.1

