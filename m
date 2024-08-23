Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C73C531DF
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 01:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8648410E2D0;
	Fri, 23 Aug 2024 01:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4Zo7Q0i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF9010E2D0
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 01:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724375251; x=1755911251;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uFmwZXj6ITqK9iJbKQZu2LZNwodwr9snYXKZIrQEvmA=;
 b=T4Zo7Q0iy/q6dKzRy+f+KWet/5eDV4ZX25gCvUN6cPtN/DVwej4BfDJZ
 XLwnj8+n0y6VDr7jirjzd7HnYCHtxF4CMcZ8Y7YhNUlM6qVY6BnaIV07t
 9pd+f1m3YKnEhkJijpurRuseKAJ1yTtT5RNBAWQKlgvBxynQTm/6YlpS/
 kl7LMH9BpjAdehkjUSPa6p8ZRjHbFlRux801zJeFamrY66rJuJO5DBaPd
 CRY7h8htdsbNTmCdgzuiVRxDPfqrcGyOtINGHtRL3YTu0TaAINxiO9Ebd
 d0UFvc4Eb/fKUxAjE5tFC9QAaCA9F12Log+aRBAe82cbw3t6+Xqd0ywN2 g==;
X-CSE-ConnectionGUID: 2uRvniHBSFSqygBZxFKwbA==
X-CSE-MsgGUID: e5fS7ZRLSDqwHSgNhRVnhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22793952"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; d="scan'208";a="22793952"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 18:07:30 -0700
X-CSE-ConnectionGUID: t8p7LHVZTp6EWIMB00jTrw==
X-CSE-MsgGUID: 6bFm2vq1SmqqenldbNsRmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; d="scan'208";a="61774033"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 18:07:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Use dma-fence array for media GT TLB invalidations in
 PT code
Date: Thu, 22 Aug 2024 18:08:25 -0700
Message-Id: <20240823010825.2005759-1-matthew.brost@intel.com>
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

Fixes: 40520283e0fd ("drm/xe: Invalidate media_gt TLBs in PT code")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 6c6714af3d5d..f8d4839ef8ce 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -3,7 +3,7 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include <linux/dma-fence-chain.h>
+#include <linux/dma-fence-array.h>
 
 #include "xe_pt.h"
 
@@ -1983,7 +1983,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		&vops->pt_update_ops[tile->id];
 	struct dma_fence *fence;
 	struct invalidation_fence *ifence = NULL, *mfence = NULL;
-	struct dma_fence_chain *chain_fence = NULL;
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *cf = NULL;
 	struct xe_range_fence *rfence;
 	struct xe_vma_op *op;
 	int err = 0, i;
@@ -2022,8 +2023,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
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
@@ -2068,9 +2069,17 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
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
@@ -2105,10 +2114,16 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 
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

