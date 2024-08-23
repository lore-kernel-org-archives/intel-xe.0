Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ADBC5321E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 02:40:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDAF10EC00;
	Fri, 23 Aug 2024 02:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXAnaFHg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A476510EC00
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 02:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724380803; x=1755916803;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iXP28BNt33rGXLikWntCW5vjnXG8n0YT77LOhk1Den4=;
 b=MXAnaFHg4hXNBz+HCIcnvJLjEqyrlKi/hG9QgyEPc4CVxIBDPhQlo9HK
 qXjB58wslvtkX1jkYbYwE9SVFsblTfYfwKu2nieMd/DNIv+4rGJejkwif
 WumgBPhQwUcuiByW6URyN0Dcy/BpHo9BwACxNQ2jKrKfqLgqDB6ZyfrFW
 Ct6N2xBWkns6+w52RS7nLzNXod79n/wPXuJINtyt/AbOBOoyHo2oyy28g
 Wpw2G2kPomu9N9klrYbYGbLHiwxSVumPu9VbOJPdqzB7AnlKc65Xf32jy
 j6jxZxvypfOZV30XjVxBwC84wXpdKsWBkyRSno0qp1holbOf/1lYF8rdv w==;
X-CSE-ConnectionGUID: I6q9XfzQQzG2Jo9rY0Rm6A==
X-CSE-MsgGUID: 24d+wHKbSfiYeYP41WTB7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="25730928"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="25730928"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 19:40:02 -0700
X-CSE-ConnectionGUID: +jqqQr0mQ1SiIlSvw1pzmQ==
X-CSE-MsgGUID: sJ8Hu6UWQVmLblCVRBQSYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="61335994"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 19:40:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe: Use dma-fence array for media GT TLB invalidations
 in PT code
Date: Thu, 22 Aug 2024 19:40:58 -0700
Message-Id: <20240823024058.2061503-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Using a chain fence is problematic as these cannot be installed in
timeout drm sync objects. Use a dma-fence-array instead at the cost of
an extra failure point.

Also fixup reserve fence count to include media GT invalidation fence.

v2:
 - Fix reserve fence count (Casey Bowman)

Fixes: 40520283e0fd ("drm/xe: Invalidate media_gt TLBs in PT code")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6c6714af3d5d..3e9126cc2df6 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3,7 +3,7 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <linux/dma-fence-chain.h>
+#include <linux/dma-fence-array.h>
 
 #include "xe_pt.h"
 
@@ -1629,9 +1629,11 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
 
 static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
 {
+	int shift = xe_device_get_root_tile(xe)->media_gt ? 1 : 0;
+
 	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
 		return dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv,
-					       xe->info.tile_count);
+					       xe->info.tile_count << shift);
 
 	return 0;
 }
@@ -1818,6 +1820,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
 	struct xe_vma_op *op;
+	int shift = tile->media_gt ? 1 : 0;
 	int err;
 
 	lockdep_assert_held(&vops->vm->lock);
@@ -1826,7 +1829,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	xe_pt_update_ops_init(pt_update_ops);
 
 	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
-				      tile_to_xe(tile)->info.tile_count);
+				      tile_to_xe(tile)->info.tile_count << shift);
 	if (err)
 		return err;
 
@@ -1983,7 +1986,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		&vops->pt_update_ops[tile->id];
 	struct dma_fence *fence;
 	struct invalidation_fence *ifence = NULL, *mfence = NULL;
-	struct dma_fence_chain *chain_fence = NULL;
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *cf = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
 	int err = 0, i;
@@ -2022,8 +2026,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 				err = -ENOMEM;
 				goto free_ifence;
 			}
-			chain_fence = dma_fence_chain_alloc();
-			if (!chain_fence) {
+			fences = kmalloc_array(2, sizeof(*fences), GFP_KERNEL);
+			if (!fences) {
 				err = -ENOMEM;
 				goto free_ifence;
 			}
@@ -2068,9 +2072,17 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 			invalidation_fence_init(tile->media_gt, mfence, fence,
 						pt_update_ops->start,
 						pt_update_ops->last, vm->usm.asid);
-			dma_fence_chain_init(chain_fence, &ifence->base.base,
-					     &mfence->base.base, 0);
-			fence = &chain_fence->base;
+			fences[0] = &ifence->base.base;
+			fences[1] = &mfence->base.base;
+			cf = dma_fence_array_create(2, fences,
+						    vm->composite_fence_ctx,
+						    vm->composite_fence_seqno++,
+						    false);
+			if (!cf) {
+				err = -ENOMEM;
+				goto put_ifence;
+			}
+			fence = &cf->base;
 		} else {
 			fence = &ifence->base.base;
 		}
@@ -2105,10 +2117,16 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	return fence;
 
+put_ifence:
+	if (pt_update_ops->needs_userptr_lock)
+		up_read(&vm->userptr.notifier_lock);
+	dma_fence_put(&ifence->base.base);
+	if (mfence)
+		dma_fence_put(&mfence->base.base);
 free_rfence:
 	kfree(rfence);
 free_ifence:
-	dma_fence_chain_free(chain_fence);
+	kfree(fences);
 	kfree(mfence);
 	kfree(ifence);
 kill_vm_tile1:
-- 
2.34.1

