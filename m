Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E7FE7F142
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 22:36:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446D810E45F;
	Tue, 26 Sep 2023 22:36:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A0A10E468
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695767785; x=1727303785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G/sEoiFaIxFMCzEW4GqWbnGG2GPlZjJyW+YpyPLytWk=;
 b=Ub3FLTWZDcCJB0b21BOkYZQoUZIqOds6wmjAuySyLlVOsJfJffLaE4oX
 2c6o+zRnGWgqUFwdI00J2xV/XJpUVeGPXsWlpcUVLYR51WfEp3+Ou4bOc
 cHkv6YS9JxxsV4aRO9WooUJSDtzyt+qEGaGrDscibr8aPC5OJSjGa9a3u
 R5Xv9P0uO0AdhSkZmcFc0o921qOqoyzCZva1qqlAb2KpCexJIrL2Hh8DY
 +wrTr7XHrEaXmDPr9ObGfg82D+DEdkxdL0sW9e8WxWJkYleLmqcUbsER0
 U7ztEq5bA3IdUjWmZugNyEYHoi3ivERhXv2OtngdSNCutyKnpQhueGr5z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412597207"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="412597207"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="752343371"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="752343371"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 15:36:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 15:36:24 -0700
Message-Id: <20230926223631.2807873-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926223631.2807873-1-lucas.demarchi@intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/11] drm/xe/migrate: Do not hand-encode pte
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Instead of encoding the pte, call a new vfunc from xe_vm to handle that.
The encoding may not be the same on every platform, so keeping it in one
place helps to better support them.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c  | 14 ++++++++------
 drivers/gpu/drm/xe/xe_pt_types.h |  2 ++
 drivers/gpu/drm/xe/xe_vm.c       | 23 ++++++++++++++++++++++-
 3 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index aa0396330903..e497b533d410 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -261,8 +261,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		level = 2;
 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
-		flags = XE_PAGE_RW | XE_PAGE_PRESENT | PPAT_CACHED |
-			XE_PPGTT_PTE_DM | XE_PDPE_PS_1G;
+		flags = vm->pt_ops->pte_encode_addr(0, XE_CACHE_WB, level, true, 0);
 
 		/*
 		 * Use 1GB pages, it shouldn't matter the physical amount of
@@ -483,7 +482,8 @@ static void emit_pte(struct xe_migrate *m,
 		ptes -= chunk;
 
 		while (chunk--) {
-			u64 addr;
+			u64 addr, flags = 0;
+			bool devmem = false;
 
 			addr = xe_res_dma(cur) & PAGE_MASK;
 			if (is_vram) {
@@ -491,13 +491,15 @@ static void emit_pte(struct xe_migrate *m,
 				if ((m->q->vm->flags & XE_VM_FLAG_64K) &&
 				    !(cur_ofs & (16 * 8 - 1))) {
 					xe_tile_assert(m->tile, IS_ALIGNED(addr, SZ_64K));
-					addr |= XE_PTE_PS64;
+					flags |= XE_PTE_PS64;
 				}
 
 				addr += vram_region_gpu_offset(bo->ttm.resource);
-				addr |= XE_PPGTT_PTE_DM;
+				devmem = true;
 			}
-			addr |= PPAT_CACHED | XE_PAGE_PRESENT | XE_PAGE_RW;
+
+			addr = m->q->vm->pt_ops->pte_encode_addr(addr, XE_CACHE_WB,
+								 0, devmem, flags);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index c58f6926fabf..64e3921a0f46 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -39,6 +39,8 @@ struct xe_pt_ops {
 			     enum xe_cache_level cache, u32 pt_level);
 	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
 			      enum xe_cache_level cache, u32 pt_level);
+	u64 (*pte_encode_addr)(u64 addr, enum xe_cache_level cache,
+			       u32 pt_level, bool devmem, u64 flags);
 	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
 			     const enum xe_cache_level cache);
 };
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2e1b4d46d9ea..23452b98d853 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1216,7 +1216,6 @@ static u64 pte_encode_cache(enum xe_cache_level cache)
 
 static u64 pte_encode_ps(u32 pt_level)
 {
-	/* XXX: Does hw support 1 GiB pages? */
 	XE_WARN_ON(pt_level > 2);
 
 	if (pt_level == 1)
@@ -1272,9 +1271,31 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 	return pte;
 }
 
+static u64 xelp_pte_encode_addr(u64 addr, enum xe_cache_level cache,
+				u32 pt_level, bool devmem, u64 flags)
+{
+	u64 pte;
+
+	/* Avoid passing random bits directly as flags */
+	XE_WARN_ON(flags & ~XE_PTE_PS64);
+
+	pte = addr;
+	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
+	pte |= pte_encode_cache(cache);
+	pte |= pte_encode_ps(pt_level);
+
+	if (devmem)
+		pte |= XE_PPGTT_PTE_DM;
+
+	pte |= flags;
+
+	return pte;
+}
+
 static const struct xe_pt_ops xelp_pt_ops = {
 	.pte_encode_bo = xelp_pte_encode_bo,
 	.pte_encode_vma = xelp_pte_encode_vma,
+	.pte_encode_addr = xelp_pte_encode_addr,
 	.pde_encode_bo = xelp_pde_encode_bo,
 };
 
-- 
2.40.1

