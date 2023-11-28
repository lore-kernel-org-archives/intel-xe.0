Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B942BC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 17:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CEE10E2C0;
	Tue, 28 Nov 2023 17:56:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147AE10E2C0
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 17:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701194161; x=1732730161;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Jo0h39LIlj13zqst3C1ELNgLmAtl+uoXPeHd/4vSyQ=;
 b=Tp0b0MTmnQZjCvFU7MwWM4ykg5wZ/b3DI5hRUAPvvMAOifxkX5OkCpeu
 Tpex/i4ia0iTrDdABFqoj284DZK9lRTIf1juOgKIdlYmDDR0N+/IEEBSG
 jl2tnR8ubaqUNvKG1lxup0bNOKONgSoaJGdqnK51Ftxa/NK36ZYt+iGG0
 1Eb0fd1aiXv1y86aPZNw1jzsNnpHo5qYt7H+9c/taR61vRNkrdFCNd+lr
 y8GWLnlLLCISkoHaL6UDkMy4eUDf/AUbfZsyGRBVorrNKansaSV3KSY3m
 2OgYNkD1qJkOiqYDuByGJP8imXq/E0MFjpk/aiIyVZZf5N0kLy1ZZAJnE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="457312941"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="457312941"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:56:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892144068"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="892144068"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 09:56:00 -0800
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 09:55:59 -0800
Message-Id: <20231128175559.21326-1-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Memory allocations are tile-based,
 not GT-based
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Fix a missed conversion of GT to tile in vma_is_valid().
Best is to update the function to take a tile argument.

This bug causes page faults to not complete successfully from media
engines and when the PTE had been invalidated prior.
(Caught by igt@xe_exec_fault_mode and INVALIDATE tests.)

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 03c1ab0ab0ca..1e083dda0679 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -64,10 +64,10 @@ static bool access_is_atomic(enum access_type access_type)
 	return access_type == ACCESS_TYPE_ATOMIC;
 }
 
-static bool vma_is_valid(struct xe_gt *gt, struct xe_vma *vma)
+static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 {
-	return BIT(gt_to_tile(gt)->id) & vma->tile_present &&
-		!(BIT(gt->info.id) & vma->usm.tile_invalidated);
+	return BIT(tile->id) & vma->tile_present &&
+		!(BIT(tile->id) & vma->usm.tile_invalidated);
 }
 
 static bool vma_matches(struct xe_vma *vma, u64 page_addr)
@@ -169,7 +169,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	atomic = access_is_atomic(pf->access_type);
 
 	/* Check if VMA is valid */
-	if (vma_is_valid(gt, vma) && !atomic)
+	if (vma_is_valid(tile, vma) && !atomic)
 		goto unlock_vm;
 
 	/* TODO: Validate fault */
@@ -215,7 +215,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	if (xe_vma_is_userptr(vma))
 		ret = xe_vma_userptr_check_repin(vma);
-	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
+	vma->usm.tile_invalidated &= ~BIT(tile->id);
 
 unlock_dma_resv:
 	drm_exec_fini(&exec);
-- 
2.38.0

