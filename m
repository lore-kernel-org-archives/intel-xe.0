Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A79C54788
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 03:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9D010E86A;
	Thu, 22 Feb 2024 03:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbvyBR+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4426B10E868
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 03:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708573600; x=1740109600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3AHOBwG832QmUtG5xZQNxzAHGs6VuWuV/tARfB27vA4=;
 b=CbvyBR+S95QbXSBCXMH1Uh5Uv7g5+Dc0f9RUPtHY46llWJjeVuAXacr/
 8VFJVe9q8zS0Yxnp009iE3ay+2tEZbLnJGzqnCSyHczLpKQCtnEWE7lTs
 rKiqDTcJxmAPZ0fjFFaTsNz3ZgiBNzi2s8jfLosRJe4jstuHQ6LGu6CEm
 44ofyr9JnluYpCEgA+VdUAecMxWI0NFNd3Jk3m8Q7kT44qCazN3xGupST
 6x5xxoGqk/+viAPpLjQJeUFW3ksUxTtJSSvyHz+u2k+u9zYPtLbjLD1h/
 ndPmMuFtwUaAdg9Fcw9/A+x12q6wj3vkM1lOXvobo1lpNcs36SJkxddTU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2914028"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2914028"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 19:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="10038523"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 19:46:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe: Don't issue TLB invalidations for VMAs if using
 execlists
Date: Wed, 21 Feb 2024 19:47:25 -0800
Message-Id: <20240222034725.3835064-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222034725.3835064-1-matthew.brost@intel.com>
References: <20240222034725.3835064-1-matthew.brost@intel.com>
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

