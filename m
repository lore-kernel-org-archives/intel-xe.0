Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF5ECCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 16:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDA310E80D;
	Wed, 22 Oct 2025 16:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BwTSAKZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9160610E80A
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 16:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761151192; x=1792687192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fDRj2cdVn4a/baXV4iGnKFliifq8jTUiIuFial0wEoE=;
 b=BwTSAKZ82GPUx4Oi6rbNOXS6THboKdnocpid/EbFj++NHiVd+NX79ibV
 batm5VbULiy2q9DN8G+7LmgNORQID9dnzbO6PdD5/YhIkZiatECNotOoh
 4DXRAKdFmuE2jNvsUNr2qkkX4SToyaWypH6y72h8sd4W9iKSEYcd1KxYG
 nJV0MRvLjlpC7pMsDZBGPIpoEYyWP+l0JFM5jUrdqh70AhEvb10OA/SPL
 9wgor27Yz5NpfWYAxPDLOT83/5m/j/xPOQ+AJP3tMwqGRPCpOPffHOtpg
 SwEiOTduP1+LKNGRASvyyllndYKmOKBKYTMRa+++y6l4CZo44mABMoNNY w==;
X-CSE-ConnectionGUID: rhA7HMXsSN6s0ErlO3zrOA==
X-CSE-MsgGUID: f55JGIKUTlS01eukx4GUVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73911739"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="73911739"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:52 -0700
X-CSE-ConnectionGUID: esEZnxZ8RAOEZV4sHF790w==
X-CSE-MsgGUID: lFSnjmg4Rway2t+FTue6dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="189043684"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.63])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 09:39:51 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 2/7] drm/xe/migrate: rework size restrictions for sram pte
 emit
Date: Wed, 22 Oct 2025 17:38:31 +0100
Message-ID: <20251022163836.191405-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251022163836.191405-1-matthew.auld@intel.com>
References: <20251022163836.191405-1-matthew.auld@intel.com>
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

We allow the input size to not be aligned to PAGE_SIZE, which leads to
various bugs in build_pt_update_batch_sram() for PAGE_SIZE > 4K systems.
For example if ptes is exactly one gpu_page_size then the chunk size is
rounded down to zero.  The simplest fix looks to be forcing PAGE_SIZE
aligned inputs.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ce2ad876586c..451fae0106e5 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1798,6 +1798,8 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 	u32 ptes;
 	int i = 0;
 
+	xe_tile_assert(m->tile, PAGE_ALIGNED(size));
+
 	ptes = DIV_ROUND_UP(size, gpu_page_size);
 	while (ptes) {
 		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
@@ -1811,12 +1813,13 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 		ptes -= chunk;
 
 		while (chunk--) {
-			u64 addr = sram_addr[i].addr & ~(gpu_page_size - 1);
-			u64 pte, orig_addr = addr;
+			u64 addr = sram_addr[i].addr;
+			u64 pte;
 
 			xe_tile_assert(m->tile, sram_addr[i].proto ==
 				       DRM_INTERCONNECT_SYSTEM);
 			xe_tile_assert(m->tile, addr);
+			xe_tile_assert(m->tile, PAGE_ALIGNED(addr));
 
 again:
 			pte = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
@@ -1827,7 +1830,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 
 			if (gpu_page_size < PAGE_SIZE) {
 				addr += XE_PAGE_SIZE;
-				if (orig_addr + PAGE_SIZE != addr) {
+				if (!PAGE_ALIGNED(addr)) {
 					chunk--;
 					goto again;
 				}
@@ -1918,10 +1921,10 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
 
 	if (use_pde)
 		build_pt_update_batch_sram(m, bb, m->large_page_copy_pdes,
-					   sram_addr, len + sram_offset, 1);
+					   sram_addr, npages << PAGE_SHIFT, 1);
 	else
 		build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
-					   sram_addr, len + sram_offset, 0);
+					   sram_addr, npages << PAGE_SHIFT, 0);
 
 	if (dir == XE_MIGRATE_COPY_TO_VRAM) {
 		if (use_pde)
-- 
2.51.0

