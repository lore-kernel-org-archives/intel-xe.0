Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B458C624D3
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 12:41:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A41410F1B4;
	Wed,  2 Sep 2026 12:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGttHv+3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF03A10E506
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788352908; x=1819888908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=etnwHsfMmACsSE41muKxYrnyxsyHjAlMFfv2DEiq+DE=;
 b=DGttHv+3M9GvjMhGcjOjKOE0boHmTF2lxOZLqwGhUM6t/A+p9pQts+EI
 2yDTqmZ5lA5MtfdugEi5q8z9uGf5NQ6JYFz2W65PKJE47T4Nm4jtCmIB+
 YSiDbcnnH22jux6KEw98x9DkyRxtlAJuGUBBZMzTGF6YKAl/Cu9zsUrPI
 4xf3KaY0i7/qp0ksjMGVN0MHQv9ssppQf+KhxWIqTcXL5pIBvWVVrd2xd
 TrBsrYoI25nx2GugTD3bykBdJdUQlmEtbgrreIEclFbYtO3YlZ3tdhy/y
 ypRPV+BauAIyMNHMFMzXxmHSZL/it+KPFnLHpYGu6T2fTevRsqtvWvGdD w==;
X-CSE-ConnectionGUID: cAu7DpwdRDur73hTucq4DA==
X-CSE-MsgGUID: ggGefDseSj24oJKbWxhvKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88829512"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88829512"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:41:48 -0700
X-CSE-ConnectionGUID: cVGLmOJRT4+KuUrQfuh4Mg==
X-CSE-MsgGUID: rhOX4gijTi2meqtfS78icQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="269965277"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.174])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 05:41:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v3 1/5] drm/xe/migrate: support 4K PTEs for identity map
Date: Wed,  2 Sep 2026 13:41:19 +0100
Message-ID: <20260902124117.918018-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902124117.918018-7-matthew.auld@intel.com>
References: <20260902124117.918018-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When VRAM limit (usable_size) is no longer 2M aligned (e.g. because flat
CCS storage size rounds it down to 4K), we must map the tail of the
identity mapping using 4K pages.

This removes the 2M alignment assert (which pops) and introduces a 4K
fallback in the identity map programming loop to handle the last 2M
chunk of usable VRAM.

This now also ensures we are only mapping the usable portion of VRAM.

Might be possible to skip backporting this. The assert that pops should
be harmless and is only on debug builds plus only a stray write would
hit CCS, which technically get mapped.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 57 +++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 75b83687f1b5..0bf000d7c901 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -87,7 +87,7 @@ struct xe_migrate {
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
 #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
 #define NUM_KERNEL_PDE 15
-#define NUM_PT_SLOTS 32
+#define NUM_PT_SLOTS 48
 #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
 #define MAX_NUM_PTE 512
 #define IDENTITY_OFFSET 256ULL
@@ -163,22 +163,20 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 }
 
 static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
-					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs)
+					u64 map_ofs, u64 vram_offset, u16 pat_index, u64 pt_2m_ofs,
+					u64 pt_4k_ofs)
 {
 	struct xe_vram_region *vram = xe->mem.vram;
 	resource_size_t dpa_base = xe_vram_region_dpa_base(vram);
 	u64 pos, ofs, flags;
 	u64 entry;
-	/* XXX: Unclear if this should be usable_size? */
-	u64 vram_limit = xe_vram_region_actual_physical_size(vram) + dpa_base;
+	u64 vram_limit = xe_vram_region_usable_size(vram) + dpa_base;
 	u32 level = 2;
 
 	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
 	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe_vram_region_usable_size(vram), SZ_2M));
-
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
 	 * pages as mixing reserved memory (stolen, WOCPM) with a single
@@ -196,8 +194,24 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 							    true, 0);
 
 			for (ofs = pt_2m_ofs; pos < vram_limit;
-			     pos += SZ_2M, ofs += 8)
+			     pos += SZ_2M, ofs += 8) {
+				if (pos + SZ_2M > vram_limit) {
+					entry = vm->pt_ops->pde_encode_bo(bo, pt_4k_ofs);
+					xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
+
+					flags = vm->pt_ops->pte_encode_addr(xe, 0,
+									    pat_index,
+									    level - 2,
+									    true, 0);
+
+					for (ofs = pt_4k_ofs; pos < vram_limit;
+					     pos += SZ_4K, ofs += 8)
+						xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
+					break;
+				}
+
 				xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
+			}
 			break;	/* Ensure pos == vram_limit assert correct */
 		}
 
@@ -242,16 +256,17 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
 	u8 id = tile->id;
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
-#define VRAM_IDENTITY_MAP_COUNT	2
-	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
-#undef VRAM_IDENTITY_MAP_COUNT
+#define VRAM_IDENTITY_MAP_PT_COUNT	4
+	u32 num_setup = num_level + VRAM_IDENTITY_MAP_PT_COUNT;
+#undef VRAM_IDENTITY_MAP_PT_COUNT
 	u32 map_ofs, level, i;
 	struct xe_bo *bo = m->pt_bo, *batch = tile->mem.kernel_bb_pool->bo;
-	u64 entry, pt29_ofs;
+	u64 entry;
 
-	/* PT30 & PT31 reserved for 2M identity map */
-	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
-	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
+	/* PT44..PT47 reserved for 4K and 2M identity map */
+	u64 l1_pt_ofs = xe_bo_size(bo) - 5 * XE_PAGE_SIZE;
+
+	entry = vm->pt_ops->pde_encode_bo(bo, l1_pt_ofs);
 	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
 
 	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
@@ -347,11 +362,12 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
-		u64 pt30_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
+		u64 pt46_ofs = xe_bo_size(bo) - 2 * XE_PAGE_SIZE;
 		resource_size_t actual_phy_size = xe_vram_region_actual_physical_size(xe->mem.vram);
 
+		u64 pt44_ofs = xe_bo_size(bo) - 4 * XE_PAGE_SIZE;
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
-					    pat_index, pt30_ofs);
+					    pat_index, pt46_ofs, pt44_ofs);
 		xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
 		/*
@@ -362,12 +378,13 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 			u16 comp_pat_index = xe_cache_pat_idx(xe, XE_CACHE_NONE_COMPRESSION);
 			u64 vram_offset = IDENTITY_OFFSET +
 				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
-			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
+			u64 pt47_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
 
 			xe_assert(xe, actual_phy_size <= (MAX_NUM_PTE - IDENTITY_OFFSET -
 							  IDENTITY_OFFSET / 2) * SZ_1G);
+			u64 pt45_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
-						    comp_pat_index, pt31_ofs);
+						    comp_pat_index, pt47_ofs, pt45_ofs);
 		}
 	}
 
@@ -381,8 +398,8 @@ static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
 	 * Example layout created above, with root level = 3:
 	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
 	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
-	 * [PT9...PT26]: Userspace PT's for VM_BIND, 4 KiB PTE's
-	 * [PT27 = PDE 0] [PT28 = PDE 1] [PT29 = PDE 2] [PT30 & PT31 = 2M vram identity map]
+	 * [PT9...PT40]: Userspace PT's for VM_BIND, 4 KiB PTE's
+	 * [PT41 = PDE 0] [PT44...PT47 = 4K and 2M vram identity maps]
 	 *
 	 * This makes the lowest part of the VM point to the pagetables.
 	 * Hence the lowest 2M in the vm should point to itself, with a few writes
-- 
2.55.0

