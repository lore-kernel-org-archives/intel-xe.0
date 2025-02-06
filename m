Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E34C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 13:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D907010E838;
	Thu,  6 Feb 2025 13:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NEeJ1vOE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCD110E838
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 13:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738849561; x=1770385561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eFAXAr7LFBuXpygvSUFl93OuNTcsd+MtWFzBUl5heAA=;
 b=NEeJ1vOEfp2oYBlYil3aKElYZYi5x6YmpTIGMM+P7HCBchtEhO60ANM/
 dpRYo/IRN9pOA28RcTFP+hEDwHe0+hzHIIbc9Fb1sn4YoOkP7LTH96EW1
 aeh7JeUq7NxKFtPKoqMW2QsRG4/mABjNCJkAHt2sAwMyIq6fgRrjjvZRY
 HSoknJkWAnspAyTMtxfUm7VCPD5fciFKRGVomSnlj7NpNNKhduJ+yCWGh
 QxLMKL6g2p7KqZdbT3dFWfMru9wmLjdCSuYMKLRR5r6QHX40hiI+jhECz
 ALZuKaA3Ne5nr/2SfDhKHQZHjKta+uEVTl89OrwZiPy3USGc0c5GPmcYF w==;
X-CSE-ConnectionGUID: BjJvFTk6RqOiiZ55ZtjP8w==
X-CSE-MsgGUID: SGsP7qspT8eEKc80U2raRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39565009"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39565009"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 05:46:00 -0800
X-CSE-ConnectionGUID: CAGqfqtVS0aqIjpWhex0ZQ==
X-CSE-MsgGUID: 4v/sW2sCRtaOWi6r69ov5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111131729"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 05:45:59 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v2] drm/xe: Add stats for vma page faults
Date: Thu,  6 Feb 2025 14:45:50 +0100
Message-ID: <20250206134551.1321265-1-francois.dugast@intel.com>
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

v2: Rebase

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c   | 10 +++++++---
 drivers/gpu/drm/xe/xe_gt_stats.c       |  2 ++
 drivers/gpu/drm/xe/xe_gt_stats_types.h |  2 ++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index cb92fb5cbc75..46701ca11ce0 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -14,6 +14,7 @@
 #include "abi/guc_actions_abi.h"
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_stats.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -124,16 +125,20 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	return 0;
 }
 
-static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
+static int handle_vma_pagefault(struct xe_gt *gt, struct pagefault *pf,
 				struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	ktime_t end = 0;
 	int err;
 	bool atomic;
 
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_BYTES, xe_vma_size(vma));
+
 	trace_xe_vma_pagefault(vma);
 	atomic = access_is_atomic(pf->access_type);
 
@@ -202,7 +207,6 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
 static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	int err;
@@ -231,7 +235,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		goto unlock_vm;
 	}
 
-	err = handle_vma_pagefault(tile, pf, vma);
+	err = handle_vma_pagefault(gt, pf, vma);
 
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

