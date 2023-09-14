Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A24EEAA51
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 15:38:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AAF710E581;
	Thu, 14 Sep 2023 15:38:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4F810E57E
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694705874; x=1726241874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=12lWeYRJFB/XtogvVfgIrww/Qq83MkMV2/Q9ZGk1yBQ=;
 b=Q4juCDcaBSC1fWfUvqumiIWIoFEXLA2wZ5A+vrTj+5BnRbyCj1CLvjJx
 AOb6NB4OZV+4jIOPODu3C6P2+cw+lRd4N6ZFRFKulr0ciXI+aKkUfGSCC
 yqNyThSZfCTDzogm/UiCe1LAcbLQw5FMWr7Mwj93kiIiVyki6D9BzpoiX
 Ov9tkL7funOba5bLiE/hwa43Z/1deK5wQteMMMjopuj3EHdv7vRxMdcsN
 PzANYDKmd6JLK4Vc+Oz1c7KAuqNuMQw7YOMXpe9qYXN4ulLYKqjnomjez
 Ut3tMVy9Aj+QMUNBPK+PHqxPSFwAms00gcdEXnVOXbctnqhLi41RjA3id g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376327357"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="376327357"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779686258"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="779686258"
Received: from ohararox-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.24.126])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 08:32:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 16:31:18 +0100
Message-ID: <20230914153112.455547-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914153112.455547-8-matthew.auld@intel.com>
References: <20230914153112.455547-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 5/6] drm/xe/migrate: rather use pte_encode
 helpers
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

We need to avoid using stuff like PPAT_CACHED directly, which is no
longer going to work on newer platforms. At some point we can just
directly use the pat_index, but for now just use XE_CACHE_WB.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c |  7 ++++---
 drivers/gpu/drm/xe/xe_pt.c      | 12 ++++++------
 drivers/gpu/drm/xe/xe_pt.h      |  2 ++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 46f88f3a8c58..26cbc9107501 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -257,8 +257,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		level = 2;
 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
-		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
-			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
+
+		flags = XE_PPGTT_PTE_DM;
+		flags = __xe_pte_encode(flags, XE_CACHE_WB, vm, NULL, 2);
 
 		/*
 		 * Use 1GB pages, it shouldn't matter the physical amount of
@@ -493,7 +494,7 @@ static void emit_pte(struct xe_migrate *m,
 				addr += vram_region_gpu_offset(bo->ttm.resource);
 				addr |= XE_PPGTT_PTE_DM;
 			}
-			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
+			addr = __xe_pte_encode(addr, XE_CACHE_WB, m->q->vm, NULL, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index b0874052f5ce..a1b164cf8bce 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -67,8 +67,8 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset)
 	return pde;
 }
 
-static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
-			struct xe_vm *vm, struct xe_vma *vma, u32 pt_level)
+u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
+		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level)
 {
 	struct xe_device *xe = vm->xe;
 
@@ -112,7 +112,7 @@ u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
 		pte |= XE_PPGTT_PTE_DM;
 
-	return __pte_encode(pte, cache, vm, NULL, pt_level);
+	return __xe_pte_encode(pte, cache, vm, NULL, pt_level);
 }
 
 static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
@@ -592,9 +592,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
-		pte = __pte_encode(is_null ? 0 :
-				   xe_res_dma(curs) + xe_walk->dma_offset,
-				   xe_walk->cache, xe_walk->vm, xe_walk->vma, level);
+		pte = __xe_pte_encode(is_null ? 0 :
+				      xe_res_dma(curs) + xe_walk->dma_offset,
+				      xe_walk->cache, xe_walk->vm, xe_walk->vma, level);
 		pte |= xe_walk->default_pte;
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 4a9143bc6628..0e66436d707d 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -49,5 +49,7 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset);
 
 u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
 		  u32 pt_level);
+u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
+		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level);
 
 #endif
-- 
2.41.0

