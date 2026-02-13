Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8AEEE369A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F05210E7E4;
	Fri, 13 Feb 2026 09:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWpD9wQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADBA10E7E1
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770974782; x=1802510782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qzGmTBK+x5ez8RzVKPBCCJUzFqr0DIEbHuoiDvpDjs8=;
 b=dWpD9wQOaveH54xS1oC7h3UKygbiK3lQDU5zLw3NDLLpexemF7EgVagQ
 65BG0TM8pO2hrF1YZ+y1TvlcNTTgq+UmkeMPKE9NvvlVfmQ1y5zSEs49r
 v4Fj3A0/+NSYsWpt+ncEx+voks7Prj1MjBRnVUpF0ef1Ioj+pU1eDOv3s
 Oxvan8wTiC4budCWBbBp60pjyqLT/tntfEfu78nZiHKuHyv0jFwTcUOps
 Q2Z7fvWomoPKbwYSVehs46mNF4fsjtldbPAC/eh7yY1iSywCkkEMb1gCK
 tVzqjJII2RsUCPXHY0uNXNcweuUumzZs7bk5u8jD3lRinoJ7NehqOfZYM w==;
X-CSE-ConnectionGUID: bSpseiiZSdaccvDbSnddrw==
X-CSE-MsgGUID: Gt65o59HQyOsmsGAWCDPVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="97615840"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="97615840"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:26:22 -0800
X-CSE-ConnectionGUID: 5ItHi1v8S7ytEvuPtqDoeQ==
X-CSE-MsgGUID: q6eQOtiERFGLhLfMXn3WNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212121238"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:26:20 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 1/6] drm/xe/svm: Use res_to_mem_region
Date: Fri, 13 Feb 2026 14:55:54 +0530
Message-ID: <20260213092552.1527799-9-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213092552.1527799-8-tejas.upadhyay@intel.com>
References: <20260213092552.1527799-8-tejas.upadhyay@intel.com>
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

Replace the direct use of block->private with the helper function
res_to_mem_region to get vram region.

V2(MattA): Use res_to_mem_region

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 2 +-
 drivers/gpu/drm/xe/xe_bo.h  | 1 +
 drivers/gpu/drm/xe/xe_svm.c | 8 +-------
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cb8a177ec02b..70aca621c1a1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -173,7 +173,7 @@ mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
 	return tile->migrate;
 }
 
-static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
+struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct ttm_resource_manager *mgr;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c914ab719f20..393f1b4faf99 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -311,6 +311,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 		      struct drm_mode_create_dumb *args);
 
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
+struct xe_vram_region *res_to_mem_region(struct ttm_resource *res);
 
 static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 213f0334518a..8015eb6fcbc9 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -762,7 +762,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 	int j = 0;
 
 	list_for_each_entry(block, blocks, link) {
-		struct xe_vram_region *vr = block->private;
+		struct xe_vram_region *vr = res_to_mem_region(res);
 		struct drm_buddy *buddy = vram_to_buddy(vr);
 		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
 						    drm_buddy_block_offset(block));
@@ -1033,9 +1033,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct dma_fence *pre_migrate_fence = NULL;
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
-	struct drm_buddy_block *block;
 	struct xe_validation_ctx vctx;
-	struct list_head *blocks;
 	struct drm_exec exec;
 	struct xe_bo *bo;
 	int err = 0, idx;
@@ -1072,10 +1070,6 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 					&dpagemap_devmem_ops, dpagemap, end - start,
 					pre_migrate_fence);
 
-		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
-		list_for_each_entry(block, blocks, link)
-			block->private = vr;
-
 		xe_bo_get(bo);
 
 		/* Ensure the device has a pm ref while there are device pages active. */
-- 
2.52.0

