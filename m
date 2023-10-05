Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE060E92FC8
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 22:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4A510E49A;
	Thu,  5 Oct 2023 22:00:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A4910E499
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 22:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696543253; x=1728079253;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iJhHDq66czyknQk9JLIUUHutR5WCkqNr/Uo3Cy5MTaU=;
 b=Tn1DFR4z3uZhOsp99azCTEKn87ayiUAAMFzzbnSIeUwpFoEodjKdxenF
 wSpAofAsxdGrObSCajftg/jdZT5vH4/9UvglveEariZYngaW8F3r+NiKn
 7jgQy4uGgatBTPIVnN7P+muU0g63bH7jnypOVHFV0eaV6nlSj1dy2rzH7
 +K/K+vUzGELUInCSVDFisCYoYnxKBHgIToYbj1r0O0DbAcvrDXH9bl7kJ
 z5/4gxCGvWH1SXqmsgoWqYTuwcEUJzmez/4IH8Rsdq85GjktOYSNOBsEx
 ycOpRFeVA6jYDDWxBvdiXp7yIErzrRrsv7ROkCx3byCgCUjjlfgYXUD8h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="386461076"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="386461076"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 15:00:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="999105353"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="999105353"
Received: from awvttsim-04.aw.intel.com (HELO awvttsim-04.ph.intel.com)
 ([10.228.212.165])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 15:00:51 -0700
From: David Kershner <david.kershner@intel.com>
To: david.kershner@intel.com, intel-xe@lists.freedesktop.org,
 michael.j.ruhl@intel.com, john.fleck@intel.com, matthew.d.roper@intel.com,
 matthew.brost@intel.com, stuart.summers@intel.com,
 niranjana.vishwanathapura@intel.com
Date: Thu,  5 Oct 2023 18:00:39 -0400
Message-Id: <20231005220040.552765-2-david.kershner@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231005220040.552765-1-david.kershner@intel.com>
References: <20231005220040.552765-1-david.kershner@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/2] drm/xe/xe_migrate.c: Use DPA offset for
 page table entries.
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
 drivers/gpu/drm/xe/xe_migrate.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 15f091a7bba3..db0e8d87a286 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -114,8 +114,13 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
 	return (slot + 1ULL) << xe_pt_shift(level + 1);
 }
 
-static u64 xe_migrate_vram_ofs(u64 addr)
+static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
 {
+	/*
+	 * Remove the DPA to get a correct offset into identity table for the
+	 * migrate offset
+	 */
+	addr -= xe->mem.vram.dpa_base;
 	return addr + (256ULL << xe_pt_shift(2));
 }
 
@@ -149,7 +154,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 
 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
-	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
+	m->cleared_vram_ofs = xe_migrate_vram_ofs(xe, vram_addr);
 
 	return 0;
 }
@@ -225,12 +230,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	} else {
 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
 
-		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
+		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
 
 		if (xe->info.supports_usm) {
 			batch = tile->primary_gt->usm.bb_pool->bo;
 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
-			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
+			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
 		}
 	}
 
@@ -268,7 +273,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		 * Use 1GB pages, it shouldn't matter the physical amount of
 		 * vram is less, when we don't access it.
 		 */
-		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos += SZ_1G, ofs += 8)
+		for (pos = xe->mem.vram.dpa_base;
+		     pos < xe->mem.vram.actual_physical_size + xe->mem.vram.dpa_base;
+		     pos += SZ_1G, ofs += 8)
 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
 	}
 
@@ -443,8 +450,8 @@ static u32 pte_update_size(struct xe_migrate *m,
 		cmds += cmd_size;
 	} else {
 		/* Offset into identity map. */
-		*L0_ofs = xe_migrate_vram_ofs(cur->start +
-					      vram_region_gpu_offset(res));
+		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
+					      cur->start + vram_region_gpu_offset(res));
 		cmds += cmd_size;
 	}
 
@@ -1060,10 +1067,10 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	 * pages are used. Hence the assert.
 	 */
 	xe_tile_assert(tile, update->qwords <= 0x1ff);
-	if (!ppgtt_ofs) {
-		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
+	if (!ppgtt_ofs)
+		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
+						xe_bo_addr(update->pt_bo, 0,
 							   XE_PAGE_SIZE));
-	}
 
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
-- 
2.35.1

