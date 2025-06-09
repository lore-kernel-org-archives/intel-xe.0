Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14492C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 13:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC59210E3A2;
	Mon,  9 Jun 2025 13:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJ7Ivv4G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C820510E3A2
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749477264; x=1781013264;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eWizBVnz9K/1HyruqKqvRGekcLNVvY5ZeM5fXPG7YYc=;
 b=eJ7Ivv4Gg6F2NqRpXajOm7CoWZhq3NmZMLnLcpRp8wqFq2SjepnAhuPm
 oaErop2wjdxXPfHGDeUUkrJjcvQj2HmGIBoNc8B+67PaQ3kfJU3vErq3G
 9iZWeIR8S2smIckaRJ+iZpKLw226zCNiKR+jR3BPCzx+JzqY6Z3Mfl3qm
 lrvF7nZO0N3Ne+EYFyeNgX3ZUhO7fgiEufHxHWUb+DR82wuFhKc4qqrTx
 iydyIq3mIghtx3lsnIdEkkDvO+HEdxCPCNf2mMRAn0nA8a3g3dUJpOltT
 IGy4e3DwK84fvhyqBPAfpa85Vup0WqBU5WLvZ7MArNyqWo3Z8trw5I/M8 g==;
X-CSE-ConnectionGUID: nM8Kz3jUTCenPDpSZfntTw==
X-CSE-MsgGUID: IwnpZczbSeWhiK9e+I8gdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51433593"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51433593"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 06:54:24 -0700
X-CSE-ConnectionGUID: rybnGPvcTYCox2Pi17i+qw==
X-CSE-MsgGUID: mP3iAjKSSweC4ZTaa8eM8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="151333491"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.70])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 06:54:23 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3] drm/xe: Enable ATS if enabled on the PCI side
Date: Mon,  9 Jun 2025 15:54:08 +0200
Message-ID: <20250609135408.102001-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

If IOMMU and device supports ATS, enable it in an effort to offload
IOMMU TLB.

v2:
- Set the FORCE_FAULT PTE flag when clearing a PTE for faulting VM. (CI)
v3:
- More instances of FORCE_FAULT flag. (CI)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  1 +
 drivers/gpu/drm/xe/xe_lrc.c           |  5 ++++
 drivers/gpu/drm/xe/xe_pt.c            | 36 +++++++++++++++------------
 3 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 4389e5a76f89..c6b32516b008 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -33,5 +33,6 @@
 
 #define XE_PAGE_PRESENT			BIT_ULL(0)
 #define XE_PAGE_RW			BIT_ULL(1)
+#define XE_PAGE_FORCE_FAULT             BIT_ULL(2)
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 61a2e87990a9..085f7e0568e9 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -976,6 +976,7 @@ static void xe_lrc_setup_utilization(struct xe_lrc *lrc)
 
 #define PVC_CTX_ASID		(0x2e + 1)
 #define PVC_CTX_ACC_CTR_THOLD	(0x2a + 1)
+#define XE_CTX_PASID            (0x2c + 1)
 
 static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		       struct xe_vm *vm, u32 ring_size, u16 msix_vec,
@@ -1104,6 +1105,10 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (xe->info.has_asid && vm)
 		xe_lrc_write_ctx_reg(lrc, PVC_CTX_ASID, vm->usm.asid);
 
+	/* If possible, enable ATS to offload the IOMMU TLB */
+	if (to_pci_dev(xe->drm.dev)->ats_enabled)
+		xe_lrc_write_ctx_reg(lrc, XE_CTX_PASID, (1 << 31));
+
 	lrc->desc = LRC_VALID;
 	lrc->desc |= FIELD_PREP(LRC_ADDRESSING_MODE, LRC_LEGACY_64B_CONTEXT);
 	/* TODO: Priority */
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c9c41fbe125c..6227ea238b1b 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -65,7 +65,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 	u8 id = tile->id;
 
 	if (!xe_vm_has_scratch(vm))
-		return 0;
+		return XE_PAGE_FORCE_FAULT;
 
 	if (level > MAX_HUGEPTE_LEVEL)
 		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
@@ -163,17 +163,9 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 	u64 empty;
 	int i;
 
-	if (!xe_vm_has_scratch(vm)) {
-		/*
-		 * FIXME: Some memory is allocated already allocated to zero?
-		 * Find out which memory that is and avoid this memset...
-		 */
-		xe_map_memset(vm->xe, map, 0, 0, SZ_4K);
-	} else {
-		empty = __xe_pt_empty_pte(tile, vm, pt->level);
-		for (i = 0; i < XE_PDES; i++)
-			xe_pt_write(vm->xe, map, i, empty);
-	}
+	empty = __xe_pt_empty_pte(tile, vm, pt->level);
+	for (i = 0; i < XE_PDES; i++)
+		xe_pt_write(vm->xe, map, i, empty);
 }
 
 /**
@@ -535,7 +527,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
 		if (xe_walk->clear_pt) {
-			pte = 0;
+			pte = XE_PAGE_FORCE_FAULT;
 		} else {
 			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
 							 xe_res_dma(curs) +
@@ -865,9 +857,21 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 	 */
 	if (xe_pt_nonshared_offsets(addr, next, --level, walk, action, &offset,
 				    &end_offset)) {
-		xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child->bo->vmap,
-			      offset * sizeof(u64), 0,
-			      (end_offset - offset) * sizeof(u64));
+		struct iosys_map *map = &xe_child->bo->vmap;
+		struct xe_device *xe = tile_to_xe(xe_walk->tile);
+
+		/*
+		 * Write only the low dword in 32-bit case to avoid potential
+		 * issues with the high dword being non-atomically written first
+		 * resulting in an out-of-bounds address with the present
+		 * bit set.
+		 */
+		for (; offset < end_offset; offset++) {
+			if (IS_ENABLED(CONFIG_64BIT))
+				xe_map_wr(xe, map, offset * sizeof(u64), u64, XE_PAGE_FORCE_FAULT);
+			else
+				xe_map_wr(xe, map, offset * sizeof(u64), u32, XE_PAGE_FORCE_FAULT);
+		}
 		xe_walk->needs_invalidate = true;
 	}
 
-- 
2.49.0

