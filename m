Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A717C77B61
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 21:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF6110EDF2;
	Fri, 28 Apr 2023 21:00:48 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707BC10EDEC
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 21:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682715643; x=1714251643;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qMNf/KzPqgk6I4aCO8UtlCEUV87jpcVBbISg7IHOXyI=;
 b=JCQM8chkQuocerTApoZ3IQfFA7tqZ/v72ZOiwWkkXkV/CxXBRb5gLD3i
 9m1p4jdcn6FJZLmVuPs6Ppey1huwtGHvaaC6Wzbu5n9Cm6/E/CQuOVso3
 EeC3RDuw9q3qSzZ/ak7H5Xzp65p/QDbR7Go4QNXCAHusamhwUvzGAjvhV
 Gp8PycdvKElnb9ZuUEO596KjD5Ih552H/nnmkTrzQepsnWhPrf+XWUv5C
 T4x3UvChN0OjaV9cr7dRcvzMRaQcaza8h2g7cGUZ6tDzOX972fsJM+zcy
 iueHKKSvrr2Pdhza+qgOZGwCUpF8oBZ5/MOFbefC5JNt2sDEvJmKMl59Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346625030"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="346625030"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 14:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="819147187"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="819147187"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 14:00:42 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 28 Apr 2023 17:00:28 -0400
Message-Id: <20230428210028.4084872-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230428210028.4084872-1-michael.j.ruhl@intel.com>
References: <20230428210028.4084872-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/4] drm/xe: Rename GPU offset helper to reflect
 true usage
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
Cc: michael.j.ruhl@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.auld@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The _io_offset helper function is returning an offset into the GPU
address space.  Using the CPU address offset (io_) is not correct.

Rename to reflect usage.
Update to use GPU offset information.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c      | 8 ++++----
 drivers/gpu/drm/xe/xe_bo.h      | 2 +-
 drivers/gpu/drm/xe/xe_migrate.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3ab404e33fae..7ee5a135b065 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1335,7 +1335,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
  * XXX: This is in the VM bind data path, likely should calculate this once and
  * store, with a recalculation if the BO is moved.
  */
-uint64_t vram_region_io_offset(struct ttm_resource *res)
+uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct xe_gt *gt = mem_type_to_gt(xe, res->mem_type);
@@ -1343,7 +1343,7 @@ uint64_t vram_region_io_offset(struct ttm_resource *res)
 	if (res->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_gpu_offset(xe);
 
-	return gt->mem.vram.io_start - xe->mem.vram.io_start;
+	return gt->mem.vram.base;
 }
 
 /**
@@ -1427,7 +1427,7 @@ int xe_bo_pin(struct xe_bo *bo)
 			XE_BUG_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
 
 			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
-				       vram_region_io_offset(bo->ttm.resource)) >> PAGE_SHIFT;
+				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
 			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
 
 			spin_lock(&xe->pinned.lock);
@@ -1571,7 +1571,7 @@ dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset,
 
 		xe_res_first(bo->ttm.resource, page << PAGE_SHIFT,
 			     page_size, &cur);
-		return cur.start + offset + vram_region_io_offset(bo->ttm.resource);
+		return cur.start + offset + vram_region_gpu_offset(bo->ttm.resource);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8354d05ccdf3..161d5e9f09cf 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -224,7 +224,7 @@ void xe_bo_vunmap(struct xe_bo *bo);
 bool mem_type_is_vram(u32 mem_type);
 bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
-uint64_t vram_region_io_offset(struct ttm_resource *res);
+uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index a1d507db0098..c79561035b1b 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -419,7 +419,7 @@ static u32 pte_update_size(struct xe_migrate *m,
 	} else {
 		/* Offset into identity map. */
 		*L0_ofs = xe_migrate_vram_ofs(cur->start +
-					      vram_region_io_offset(res));
+					      vram_region_gpu_offset(res));
 		cmds += cmd_size;
 	}
 
@@ -469,7 +469,7 @@ static void emit_pte(struct xe_migrate *m,
 					addr |= XE_PTE_PS64;
 				}
 
-				addr += vram_region_io_offset(bo->ttm.resource);
+				addr += vram_region_gpu_offset(bo->ttm.resource);
 				addr |= XE_PPGTT_PTE_LM;
 			}
 			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
-- 
2.39.2

