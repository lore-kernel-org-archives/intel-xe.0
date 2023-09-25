Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0B2CE7A96
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 13:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E11510E24D;
	Mon, 25 Sep 2023 13:21:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF2010E1C3
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695648094; x=1727184094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qZKhVyT4bpMjFlV0AiQeX/28qsK+f8GVM9gZkjDcnyg=;
 b=ZdCxHeh0wIfW/KOyIiBmcaeF+8nPBo0H9j69c8Wor4XpjsTN8Z6WvZPJ
 LdOzhGzDtyZ02gLr+E0kAz4+TWDH0cfHS+kKi5OXXbKCcBhXSEYtJBk8Z
 3HoAgl/rdAI1NSnF2Sgo3DWDrpBrr1oLM12MmFWnd7MRF4qb2qRrUG3Ut
 rOHKn6quuMpNCD287THSYHa/jH4Px6C6t113qDcFpYD6uTsPsElZKe3Yz
 BhhtuwMW1wcfAySVvFpTMx1RPKv7MbUXICeC1KJegCHndu44i2rMdbls2
 r5JnuqCPtp9Z0tTYA+0vNj/rKdqclIRjGCa+Lu6RqOl+MF6iPwfxmNHAG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378521522"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="378521522"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:21:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751679142"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="751679142"
Received: from ngorb-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.27.97])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:21:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 25 Sep 2023 14:21:18 +0100
Message-ID: <20230925132113.59900-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925132113.59900-9-matthew.auld@intel.com>
References: <20230925132113.59900-9-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 5/7] drm/xe/migrate: rather use pte_encode
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

v2 (Matt Roper):
  - Rather use the 'level' local variable.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c |  7 ++++---
 drivers/gpu/drm/xe/xe_pt.c      | 12 ++++++------
 drivers/gpu/drm/xe/xe_pt.h      |  2 ++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 46f88f3a8c58..ebae0117f577 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -257,8 +257,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		level = 2;
 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
-		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
-			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
+
+		flags = XE_PPGTT_PTE_DM;
+		flags = __xe_pte_encode(flags, XE_CACHE_WB, vm, NULL, level);
 
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
index 397ef2573c05..ddb4d9c33181 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -68,8 +68,8 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset)
 	return pde;
 }
 
-static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
-			struct xe_vm *vm, struct xe_vma *vma, u32 pt_level)
+u64 __xe_pte_encode(u64 pte, enum xe_cache_level cache,
+		    struct xe_vm *vm, struct xe_vma *vma, u32 pt_level)
 {
 	struct xe_device *xe = vm->xe;
 
@@ -113,7 +113,7 @@ u64 xe_pte_encode(struct xe_vm *vm, struct xe_bo *bo, u64 offset, enum xe_cache_
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
 		pte |= XE_PPGTT_PTE_DM;
 
-	return __pte_encode(pte, cache, vm, NULL, pt_level);
+	return __xe_pte_encode(pte, cache, vm, NULL, pt_level);
 }
 
 static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
@@ -595,9 +595,9 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 
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

