Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56591C25B76
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 18:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF45510E249;
	Mon,  3 Jun 2024 18:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMsajMFc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682CD10E2E2
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 18:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717438675; x=1748974675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n+ZTHpnCrq+ZO1ODiuhNdn895IIiVZr3UzqUT6+zeDI=;
 b=gMsajMFcDwIpVNEBRW30fhZH5zSdUPC69jKW8Jsm6OX/sFCDHDLW/cHy
 A6dqeu+vP1/2szp0uM8+fDBgg68MD6s6ITGPnlXG5GZ7ksPvKiKkqH+cz
 Bw4eJ+el3MhNRWJ5lwKwSASFC0zMTkUxlnCKPJjhCY+kDB5B1pdxoKnPA
 mYwwdXevw/3DVkAO21MzIqcUsKwKQ8YlKn7KAobkq05122uLzq3W8u33J
 SOf8pZcyJvA69VsSPKSwErkDbpfkv/wzQoetex7a+e81p6tm82Yw/OKTK
 0+Bbj1ivZi3tq/z0gPDd8rn86FZhA8Tzm7XYWNmgnyRn/oR63Kp1UTRT7 Q==;
X-CSE-ConnectionGUID: 6I8g+4OXQqWE2uFfl7513w==
X-CSE-MsgGUID: HH64EyJRQbGF1760BdO+xg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="16887121"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="16887121"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 11:17:54 -0700
X-CSE-ConnectionGUID: iB0AE3XaQzecPno6V4Q9ng==
X-CSE-MsgGUID: CeL3YXERQHewbj7t6iLshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="36891050"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 11:17:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Fei Yang <fei.yang@intel.com>
Subject: [PATCH v2] drm/xe: Don't overmap identity VRAM mapping
Date: Mon,  3 Jun 2024 11:18:24 -0700
Message-Id: <20240603181824.1927675-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Overmapping the identity VRAM mapping is triggering hardware bugs on
certain platforms. Use 2M pages for the last unaligned (to 1G) VRAM
chunk.

v2:
 - Always use 2M pages for last chunk (Fei Yang)
 - break loop when 2M pages are used
 - Add assert for usable_size being 2M aligned

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 57 +++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cccffaf3db06..c1269cdbf93a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -69,7 +69,7 @@ struct xe_migrate {
 
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
 #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
-#define NUM_KERNEL_PDE 17
+#define NUM_KERNEL_PDE 15
 #define NUM_PT_SLOTS 32
 #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
 #define MAX_NUM_PTE 512
@@ -137,10 +137,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	struct xe_device *xe = tile_to_xe(tile);
 	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
 	u8 id = tile->id;
-	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
+	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level,
+	    num_setup = num_level + 1;
 	u32 map_ofs, level, i;
 	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
-	u64 entry;
+	u64 entry, pt30_ofs;;
 
 	/* Can't bump NUM_PT_SLOTS too high */
 	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
@@ -160,10 +161,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pat_index);
+	/* PT31 reserved for 2M identity map */
+	pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
+	entry = vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
 	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
 
-	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
+	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
 
 	/* Map the entire BO in our level 0 pt */
 	for (i = 0, level = 0; i < num_entries; level++) {
@@ -234,7 +237,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	}
 
 	/* Write PDE's that point to our BO. */
-	for (i = 0; i < num_entries - num_level; i++) {
+	for (i = 0; i < map_ofs / PAGE_SIZE; i++) {
 		entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
 						  pat_index);
 
@@ -252,28 +255,54 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
 		u64 pos, ofs, flags;
+		/* XXX: Unclear if this should be usable_size? */
+		u64 vram_limit =  xe->mem.vram.actual_physical_size +
+			xe->mem.vram.dpa_base;
 
 		level = 2;
 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
 		flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 						    true, 0);
 
+		xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+
 		/*
-		 * Use 1GB pages, it shouldn't matter the physical amount of
-		 * vram is less, when we don't access it.
+		 * Use 1GB pages when possible, last chunk always use 2M
+		 * pages as mixing reserved memory (stolen, WOCPM) with a single
+		 * mapping is not allowed on certain platforms.
 		 */
-		for (pos = xe->mem.vram.dpa_base;
-		     pos < xe->mem.vram.actual_physical_size + xe->mem.vram.dpa_base;
-		     pos += SZ_1G, ofs += 8)
-			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
+		for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+		     pos += SZ_1G, ofs += 8) {
+			if (pos + SZ_1G >= vram_limit) {
+				u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
+
+				entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
+								  pat_index);
+				xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
+
+				flags = vm->pt_ops->pte_encode_addr(xe, 0,
+								    pat_index,
+								    level - 1,
+								    true, 0);
+
+				for (ofs = pt31_ofs; pos < vram_limit;
+				     pos += SZ_2M, ofs += 8)
+					xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
+				break;	/* Ensure pos == vram_limit assert correct */
+			} else {
+				xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
+			}
+		}
+
+		xe_assert(xe, pos == vram_limit);
 	}
 
 	/*
 	 * Example layout created above, with root level = 3:
 	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
 	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
-	 * [PT9...PT28]: Userspace PT's for VM_BIND, 4 KiB PTE's
-	 * [PT29 = PDE 0] [PT30 = PDE 1] [PT31 = PDE 2]
+	 * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
+	 * [PT28 = PDE 0] [PT29 = PDE 1] [PT30 = PDE 2] [PT31 = 2M vram identity map]
 	 *
 	 * This makes the lowest part of the VM point to the pagetables.
 	 * Hence the lowest 2M in the vm should point to itself, with a few writes
-- 
2.34.1

