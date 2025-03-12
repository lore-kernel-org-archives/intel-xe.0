Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12EAC28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 08:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A373610E721;
	Wed, 12 Mar 2025 08:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyWuo5ch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752ED10E721
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 08:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741767163; x=1773303163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MvrREUiBp+jDDX/90JiMhEjoPRmtAPtiL+a1FlMTGEg=;
 b=hyWuo5chFolBLg1coaSACpaW+Vucw/FGlQVZoo9hLOBR/JmdNlLdR+Tr
 MtBJiWjqcwDArhdtyPsmUcI10yungvHt+11zRaO3hwybdd/UwUdTXqfMx
 44YSgKfj5Wp9cA8B8OqeCuOhUqPqBD1XrX4Z63KuB+i9tUEyaVwdJJck9
 GxzOZCT0od29H3cWkD98X+aAoQeIdKwjBYpXoc1h5+cY2Yh2gxBTv/zwB
 sO12IRI5OYE01G8bB8fvQkHZsXGWN/iHyszesuJRHVtg6vlxiw+ykoKH9
 lvFwtnO/iWOIpr2L6b6timODoKRPmDYDrFGl6sTstC+n6SqfPFCbaX+Pw Q==;
X-CSE-ConnectionGUID: /0NuaQj1RcGHNDq8bVynXQ==
X-CSE-MsgGUID: Xg94B+OqQJutH02NZBP55Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="68193905"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="68193905"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 01:12:43 -0700
X-CSE-ConnectionGUID: +3r1xi1CR5+P702RAQ+dKQ==
X-CSE-MsgGUID: 788FRud3Qu6OWsNS5jZ6jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="121075233"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.250])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 01:12:42 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH] drm/xe/svm: Add stats for SVM page faults
Date: Wed, 12 Mar 2025 09:12:22 +0100
Message-ID: <20250312081222.125293-1-francois.dugast@intel.com>
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

Add a new entry in stats to for svm page faults. If CONFIG_DEBUG_FS is
enabled, the count can be viewed with per GT stat debugfs file.

This is similar to what is already in place for vma page faults.

Example output:

    cat /sys/kernel/debug/dri/0/gt0/stats
    svm_pagefault_count: 6
    tlb_inval_count: 78
    vma_pagefault_count: 0
    vma_pagefault_kb: 0

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c   | 2 +-
 drivers/gpu/drm/xe/xe_gt_stats.c       | 1 +
 drivers/gpu/drm/xe/xe_gt_stats_types.h | 1 +
 drivers/gpu/drm/xe/xe_svm.c            | 6 +++++-
 drivers/gpu/drm/xe/xe_svm.h            | 5 +++--
 5 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index c5ad9a0a89c2..9fa11e837dd1 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -240,7 +240,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	atomic = access_is_atomic(pf->access_type);
 
 	if (xe_vma_is_cpu_addr_mirror(vma))
-		err = xe_svm_handle_pagefault(vm, vma, gt_to_tile(gt),
+		err = xe_svm_handle_pagefault(vm, vma, gt,
 					      pf->page_addr, atomic);
 	else
 		err = handle_vma_pagefault(gt, vma, atomic);
diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
index 6155ea354432..30f942671c2b 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats.c
+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
@@ -27,6 +27,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
 }
 
 static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
+	"svm_pagefault_count",
 	"tlb_inval_count",
 	"vma_pagefault_count",
 	"vma_pagefault_kb",
diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
index d556771f99d6..be3244d7133c 100644
--- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
@@ -7,6 +7,7 @@
 #define _XE_GT_STATS_TYPES_H_
 
 enum xe_gt_stats_id {
+	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_TLB_INVAL,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
 	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 516898e99b26..51f826231de7 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_bo.h"
+#include "xe_gt_stats.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_module.h"
@@ -723,7 +724,7 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
  * Return: 0 on success, negative error code on error.
  */
 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-			    struct xe_tile *tile, u64 fault_addr,
+			    struct xe_gt *gt, u64 fault_addr,
 			    bool atomic)
 {
 	struct drm_gpusvm_ctx ctx = {
@@ -737,12 +738,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
+	struct xe_tile *tile = gt_to_tile(gt);
 	ktime_t end = 0;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
+	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
+
 retry:
 	/* Always process UNMAPs first so view SVM ranges is current */
 	err = xe_svm_garbage_collector(vm);
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index e059590e5076..35658d0e6855 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -12,10 +12,11 @@
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
 struct xe_bo;
-struct xe_vram_region;
+struct xe_gt;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
+struct xe_vram_region;
 
 /** struct xe_svm_range - SVM range */
 struct xe_svm_range {
@@ -64,7 +65,7 @@ void xe_svm_fini(struct xe_vm *vm);
 void xe_svm_close(struct xe_vm *vm);
 
 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
-			    struct xe_tile *tile, u64 fault_addr,
+			    struct xe_gt *gt, u64 fault_addr,
 			    bool atomic);
 
 bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
-- 
2.43.0

