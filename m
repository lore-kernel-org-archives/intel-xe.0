Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C095EE66896
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 21:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BEA10F0C4;
	Fri, 19 Dec 2025 21:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQR5se3n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207BF10F0C4
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 21:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766178727; x=1797714727;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xpYiYxcSfgJ8Izj/OKwTyccUIsISJO4sI7ks0ps9YwY=;
 b=KQR5se3nqO48hSQyfVD21916k19a0eC1g0vuEzNsu0PYVYOt5uoeekmT
 M9lKSgNXSKz7kh3BASenlsB+7WiK7lKjSFn9he9W0lsKUxTvsvtHC9HA+
 hjI2BaT8HljmHJmNXUMsUKUiaI5j3uTvwTEH1TzOWzUKnd4mkEcA34aXp
 BdP/Ww3Iiv1ee273jKAwa67J9yEGjIkmngJvI4dw3Iv3pNUgaYOjDjMfZ
 qZPlpVxmg/hda8BGb4wXPrJCubUsuxGoIocFLAz940xKC5RuPo3AsHStH
 J6kMt3HUnSSyEqA7fTdESCVWZmviqrGzg7fmB0UKiN7vqEDswXTdPlQl+ A==;
X-CSE-ConnectionGUID: PeGGJgfURxyA9m6SDsIXNQ==
X-CSE-MsgGUID: Uk4IzmJeQey1RMziXMO3HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78460620"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="78460620"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:12:06 -0800
X-CSE-ConnectionGUID: Zk+BtzOLT2KroENoMeu6tg==
X-CSE-MsgGUID: fSjEesSDTr27WqGQT4zjEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="204030370"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:12:07 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] drm/xe: Show migrate VM layout
Date: Fri, 19 Dec 2025 13:11:59 -0800
Message-Id: <20251219211201.4107410-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219211201.4107410-1-matthew.brost@intel.com>
References: <20251219211201.4107410-1-matthew.brost@intel.com>
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

We have occasionally seen the migrate engine take a page fault. Add
debug messages that display the migrate VM layout when loading the
driver to aid debugging.

Signed-off-by: Matthew <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f3b66b55acfb..1cec1093541c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -36,6 +36,7 @@
 #include "xe_sched_job.h"
 #include "xe_sriov_vf_ccs.h"
 #include "xe_sync.h"
+#include "xe_tile_printk.h"
 #include "xe_trace_bo.h"
 #include "xe_validation.h"
 #include "xe_vm.h"
@@ -270,10 +271,17 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
 
+		xe_tile_dbg(tile, "batch base virtual range: 0x%016llx-0x%016llx\n",
+			    m->batch_base_ofs, m->batch_base_ofs +
+			    xe_bo_size(batch) - 1);
+
 		if (xe->info.has_usm) {
 			batch = tile->primary_gt->usm.bb_pool->bo;
 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
 			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
+			xe_tile_dbg(tile, "USM batch base virtual range: 0x%016llx-0x%016llx\n",
+				    m->usm_batch_base_ofs, m->usm_batch_base_ofs +
+				    xe_bo_size(batch) - 1);
 		}
 	}
 
@@ -303,6 +311,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	m->large_page_copy_pdes = map_ofs + XE_PAGE_SIZE * level +
 		NUM_PT_SLOTS * 8;
 
+	xe_tile_dbg(tile, "large page copy virtual address: 0x%016llx\n",
+		    m->large_page_copy_ofs);
+
 	/* Set up a 1GiB NULL mapping at 255GiB offset. */
 	level = 2;
 	xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255 * 8, u64,
@@ -310,15 +321,24 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		  | XE_PTE_NULL);
 	m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
 
+	xe_tile_dbg(tile, "cleared memory virtual address: 0x%016llx\n",
+		    m->cleared_mem_ofs);
+
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
 		u64 pt30_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
+		u64 base = xe_vram_region_dpa_base(xe->mem.vram);
+		u64 ofs = xe_migrate_vram_ofs(xe, base, false);
+
 		resource_size_t actual_phy_size = xe_vram_region_actual_physical_size(xe->mem.vram);
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
 		xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
+		xe_tile_dbg(tile, "vram id map virtual range: 0x%016llx-0x%016llx\n",
+			    ofs, ofs + actual_phy_size - 1);
+
 		/*
 		 * Identity map the entire vram for compressed pat_index for xe2+
 		 * if flat ccs is enabled.
@@ -333,6 +353,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 							  IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
 						    comp_pat_index, pt31_ofs);
+
+			ofs = xe_migrate_vram_ofs(xe, base, true);
+			xe_tile_dbg(tile, "vram comp map virtual range: 0x%016llx-0x%016llx\n",
+				    ofs, ofs + actual_phy_size - 1);
 		}
 	}
 
-- 
2.34.1

