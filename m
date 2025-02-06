Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139FDC02196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 11:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D224A10E821;
	Thu,  6 Feb 2025 11:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4KxVbUN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2707A10E810
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738839764; x=1770375764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FldwboxX4Kc98UD2k1TmKtf7k/kfduPddyiINn6/Udk=;
 b=a4KxVbUNhTwjACU1KPbVd7ataJK4kDeFHjIiqcbQMSeHO+HOgi43LJz+
 LVsbQmYWrkOGBAEznztdYUKOeB/gEVRe3zflOVPtu4AXwdB/osAjAku2r
 7m/6DaFovuQmleM73ZuaIdcWqJMkoxHy9VbeU3NaU1Y0QWzk4pX1tfgkp
 Vir7Bv0bviKP6yDpixzpgXXO7Ax+aEspYuD8lrDAcJBykbHdjfo5zYR92
 jN52JEOLxcueUZzXwITw9mMebyhmNVm5b5VacYB27WIIpLOa9es0/ogTV
 kaYGBcjSieObYBU7QPC0vBgasNWVeHYalZJoPG4qYBvFGN8QCD25oMSoG w==;
X-CSE-ConnectionGUID: nWlFObQsS66PCvAtQJMINw==
X-CSE-MsgGUID: jPMUXZ/yTECgL5ycZXkHiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39708519"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="39708519"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 03:02:44 -0800
X-CSE-ConnectionGUID: 4embjoKITTGjaFTeCvbcyQ==
X-CSE-MsgGUID: ZXwH9FaCQ9G3yLeJ+5lKaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111628184"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.18])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 03:02:42 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] drm/xe: Add stats for vma page faults
Date: Thu,  6 Feb 2025 12:02:20 +0100
Message-ID: <20250206110220.1252580-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add new entries in stats for vma page faults. If CONFIG_DEBUG_FS is
enabled, the count and number of bytes can be viewed per GT in the
stat debugfs file. This helps when testing, to confirm page faults
have been triggered as expected. It also helps when looking at the
performance impact of page faults. Data is simply collected when
entering the page fault handler so there is no indication whether
it completed successfully, with or without retries, etc.

Example output:

    cat /sys/kernel/debug/dri/0/gt0/stats
    tlb_inval_count: 129
    vma_pagefault_count: 12
    vma_pagefault_bytes: 98304

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c   | 9 +++++++--
 drivers/gpu/drm/xe/xe_gt_stats.c       | 2 ++
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 2 ++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 8c18e9a278fb..1bc7f4f0affa 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -15,6 +15,7 @@
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_stats.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -126,15 +127,19 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	return 0;
 }
 
-static int handle_vma_pagefault(struct xe_tile *tile, struct xe_vma *vma,
+static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 				bool atomic)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	ktime_t end = 0;
 	int err;
 
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
+
 	lockdep_assert_held_write(&vm->lock);
 	trace_xe_vma_pagefault(vma);
 
@@ -239,7 +244,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		err = xe_svm_handle_pagefault(vm, vma, tile,
 					      pf->page_addr, atomic);
 	else
-		err = handle_vma_pagefault(tile, vma, atomic);
+		err = handle_vma_pagefault(gt, vma, atomic);
 
 unlock_vm:
 	if (!err)
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 7a6c1d808e41..2e9879ea4674 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -28,6 +28,8 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
 
 static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
 	"tlb_inval_count",
+	"vma_pagefault_count",
+	"vma_pagefault_bytes",
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index 2fc055e39f27..b072bd80c4b9 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -8,6 +8,8 @@
 
 enum xe_gt_stats_id {
 	XE_GT_STATS_ID_TLB_INVAL,
+	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
+	XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES,
 	/* must be the last entry */
 	__XE_GT_STATS_NUM_IDS,
 };
-- 
2.43.0

