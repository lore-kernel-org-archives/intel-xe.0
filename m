Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753EFE732D8
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 13:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B5C10E65E;
	Thu, 28 Sep 2023 13:48:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E5610E65E
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695908906; x=1727444906;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2zFj7XRzCGeU/AAfolsgSwhYyOHbTDTFaoKjdYxARYs=;
 b=bPjpt6F2c1U3OZyElH1EIgJMcPZagZKHoe8EExsy6mQ8WUH6c8bnejsJ
 LcaURxU1UvcmM8i8E89gz51gDojY18MdKuCJ/jm+wu0KXcgoORPncmR8R
 LDHB9nDLMEV7Ar+wEh63Ez08N1XnHpZKV1aQLOmHncPbkb5Y2GAJVTMLz
 do/uz0jmzG+qKAvmgCAnGkVi3URPhPEL+Lh0mqkqoXr0SzJWJIRW4Fm3f
 Dvgfllgjz5TtZBvuStMBLuhzdMaOOAysv48HPTCFR3BMBV9BIXkotfjQL
 gJBYPmNXV1ytN31oGSliTeVPqr9mci5L2nzrmXx+CZlgIRIxLJTUEpEzR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="367128669"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="367128669"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:48:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="996574257"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="996574257"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:48:24 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, stuart.summers@intel.com,
 niranjana.vishwanathapura@intel.com
Date: Thu, 28 Sep 2023 09:48:16 -0400
Message-Id: <20230928134816.881379-1-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page
 table entries.
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

Device Physical Address (DPA) is the starting offset device memory.

Update xe_migrate identity map base PTE entries to start at dpa_base
instead of 0.

The VM offset value should be 0 relative instead of DPA relative.

Signed-off-by: David Kershner <david.kershner@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9438f609d18b..848cdb6af2e6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -114,8 +114,10 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
 	return (slot + 1ULL) << xe_pt_shift(level + 1);
 }
 
-static u64 xe_migrate_vram_ofs(u64 addr)
+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_tile *tile)
 {
+	if (tile)
+		addr -= tile->mem.vram.dpa_base;
 	return addr + (256ULL << xe_pt_shift(2));
 }
 
@@ -149,7 +151,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 
 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
-	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
+	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr, tile);
 
 	return 0;
 }
@@ -223,12 +225,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	} else {
 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
 
-		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
+		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr, tile);
 
 		if (xe->info.supports_usm) {
 			batch = tile->primary_gt->usm.bb_pool->bo;
 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
-			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
+			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr, tile);
 		}
 	}
 
@@ -266,7 +268,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		 * Use 1GB pages, it shouldn't matter the physical amount of
 		 * vram is less, when we don't access it.
 		 */
-		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos += SZ_1G, ofs += 8)
+		for (pos = tile->mem.vram.dpa_base;
+		     pos < tile->mem.vram.actual_physical_size + tile->mem.vram.dpa_base;
+		     pos += SZ_1G, ofs += 8)
 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
 	}
 
@@ -441,8 +445,7 @@ static u32 pte_update_size(struct xe_migrate *m,
 		cmds += cmd_size;
 	} else {
 		/* Offset into identity map. */
-		*L0_ofs = xe_migrate_vram_ofs(cur->start +
-					      vram_region_gpu_offset(res));
+		*L0_ofs = xe_migrate_vram_ofs(cur->start, NULL);
 		cmds += cmd_size;
 	}
 
@@ -1027,7 +1030,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	xe_tile_assert(tile, update->qwords <= 0x1ff);
 	if (!ppgtt_ofs) {
 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
-							   XE_PAGE_SIZE));
+							   XE_PAGE_SIZE), tile);
 	}
 
 	do {
-- 
2.35.1

