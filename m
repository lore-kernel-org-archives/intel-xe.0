Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09161CCD192
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 14:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD47510E811;
	Wed, 15 Oct 2025 14:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kx0ylkrO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B716910E80C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760538023; x=1792074023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IPE+KYVJG1fOpW6d0A72y1PBEDHPlok0m8x4JZ/S5eY=;
 b=Kx0ylkrOmrR0QoWzU/7xSZ0e0o8Imgn7uc4ibhZzmvi4JDai5Pj+w0nz
 2h5EBvKK23MrpXOLEYAcD2bvgQOTqMRypHsCITzm7B9JbceO+T+yEqfZT
 SbCr5pmg5vjGlEDXFRdSYaXsq2E6Indmahw7Ew+YtaHQezPBu80yPgfDp
 MQJXedlQhhqpRNdGYTilZMaHMy8IVXWa/SsBCdvzv8pO0gf5aR0HyjVQH
 xGBGQwJemjNg+5uY9YtMKcowzdCEyFFCHj+fRm56as7eR2C7dKeQQ6fBi
 lLvjq4ErsCmYEWNEFJFZtgnIuMJjFTdff6nnJYnoiNubnTpWVR3UXcFRO A==;
X-CSE-ConnectionGUID: sUlqLsiASZaSPs5ENmQ+9A==
X-CSE-MsgGUID: sodjr5wuQYaUOREAlCXFyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="72990277"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="72990277"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:23 -0700
X-CSE-ConnectionGUID: /aMmPKrHTEGSeC2CceDZ7g==
X-CSE-MsgGUID: zGkFhR6FSdq+so73Fm18eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="181740955"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 07:20:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 1/6] drm/xe/migrate: rework size restrictions for sram pte emit
Date: Wed, 15 Oct 2025 15:19:31 +0100
Message-ID: <20251015141929.123637-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015141929.123637-8-matthew.auld@intel.com>
References: <20251015141929.123637-8-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/xe/xe_migrate.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4ca48dd1cfd8..ff8e442bf519 100644
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

