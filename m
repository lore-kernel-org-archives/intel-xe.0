Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D01C7EE45
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 05:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4D810E589;
	Thu,  8 Jun 2023 05:03:26 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4119710E587
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 05:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686200604; x=1717736604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V7xvshzht2yBHEA7uBDArgQM6UNIhN1KLvW5ClnfAgw=;
 b=dfMG6dr3KQqcwppGdgEEGglRD+wI5lMTloNfEecwaRx0qtKS4fEXy1gN
 bPoBq99XIy+nlQqcgopzO7/K8yHLLV95GMA98TCpGeFZXp6V3spzfEoTI
 kD3Iz5yHhljtdH/WydE4p5YDSKUOSVeicvFmJDSVjw1MJ1Trc6kPQ+Mpk
 mlvZ8mTe4Xs45o3wdOineVJPN8skbW71NU541vYphJzR6OnEluaCU0k6k
 JS37bP845pu+Qn+JcjIHFGCAaw3/gNe/P0CEzROHk+Q8tHnRiO5dPKIW8
 SDKSM5okG7Xl7b0gIGSW1nkr4fi9IH3uphbYwji8M8jQxHZdx0dYbg2th Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354692402"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="354692402"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822450162"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="822450162"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:03:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  7 Jun 2023 22:03:31 -0700
Message-Id: <20230608050333.37581-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608050333.37581-1-matthew.brost@intel.com>
References: <20230608050333.37581-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/3] drm/xe:
 s/XE_PTE_READ_ONLY/XE_PTE_FLAG_READ_ONLY
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

This define is for internal PTE flags rather than fields in the hardware
PTEs, rename as such. This will help in an upcoming patch to avoid
further confusion.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h |  2 +-
 drivers/gpu/drm/xe/xe_pt.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c | 12 +++++++-----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 29eb7474f018..552fe073e9c5 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -65,7 +65,7 @@
 #define XE_PAGE_PRESENT			BIT_ULL(0)
 #define XE_PAGE_RW			BIT_ULL(1)
 
-#define XE_PTE_READ_ONLY		BIT(0)
+#define XE_PTE_FLAG_READ_ONLY		BIT(0)
 
 #define XE_PL_SYSTEM		TTM_PL_SYSTEM
 #define XE_PL_TT		TTM_PL_TT
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index bef265715000..39ec94549439 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -102,7 +102,7 @@ static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
 {
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
 
-	if (unlikely(flags & XE_PTE_READ_ONLY))
+	if (unlikely(flags & XE_PTE_FLAG_READ_ONLY))
 		pte &= ~XE_PAGE_RW;
 
 	/* FIXME: I don't think the PPAT handling is correct for MTL */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1c380ad7f6b..94fc9c330235 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -61,7 +61,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	bool in_kthread = !current->mm;
 	unsigned long notifier_seq;
 	int pinned, ret, i;
-	bool read_only = vma->pte_flags & XE_PTE_READ_ONLY;
+	bool read_only = vma->pte_flags & XE_PTE_FLAG_READ_ONLY;
 
 	lockdep_assert_held(&vm->lock);
 	XE_BUG_ON(!xe_vma_is_userptr(vma));
@@ -869,7 +869,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	vma->start = start;
 	vma->end = end;
 	if (read_only)
-		vma->pte_flags = XE_PTE_READ_ONLY;
+		vma->pte_flags = XE_PTE_FLAG_READ_ONLY;
 
 	if (tile_mask) {
 		vma->tile_mask = tile_mask;
@@ -923,7 +923,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = vma->vm;
 	struct xe_device *xe = vm->xe;
-	bool read_only = vma->pte_flags & XE_PTE_READ_ONLY;
+	bool read_only = vma->pte_flags & XE_PTE_FLAG_READ_ONLY;
 
 	if (xe_vma_is_userptr(vma)) {
 		if (vma->userptr.sg) {
@@ -2641,7 +2641,8 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 					  first->userptr.ptr,
 					  first->start,
 					  lookup->start - 1,
-					  (first->pte_flags & XE_PTE_READ_ONLY),
+					  (first->pte_flags &
+					   XE_PTE_FLAG_READ_ONLY),
 					  first->tile_mask);
 		if (first->bo)
 			xe_bo_unlock(first->bo, &ww);
@@ -2672,7 +2673,8 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 					 last->userptr.ptr + chunk,
 					 last->start + chunk,
 					 last->end,
-					 (last->pte_flags & XE_PTE_READ_ONLY),
+					 (last->pte_flags &
+					  XE_PTE_FLAG_READ_ONLY),
 					 last->tile_mask);
 		if (last->bo)
 			xe_bo_unlock(last->bo, &ww);
-- 
2.34.1

