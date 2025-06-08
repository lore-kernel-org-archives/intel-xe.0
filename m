Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090D9C5AD49
	for <intel-xe@archiver.kernel.org>; Sun,  8 Jun 2025 17:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B254810E67C;
	Sun,  8 Jun 2025 17:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnHTu+s6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761FE10E5E5
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Jun 2025 17:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749404201; x=1780940201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pVoeJ9vszqFasVz1ytaoa5Vo/Mi2RPUwZZon7zEFQ8g=;
 b=UnHTu+s6zOME8kMt6dCtfZW9PNPFtI1n3MlRVy5Kh4u0YB1UO7HmlchI
 NTEfi0B2Pe7r9Ip+XXafGUFatvuOffetFy7IkP3F+Uq6RrrT9iCMDGrV2
 n7f5C8IiTenfMGcS8hEedup9wNEaUy+vNA3q5astfPtNhuIrhUVgJuXxA
 0fGm/pfrL9//+puGuN5yvrZZh7AKoNarE9BRckpQKfLw1SAYJH9kDBqS/
 umed+jqd2j+hHj2HZSAM1CnsovDjslhU9DNhju9dAUShYEgj/a+d18sr4
 JU46Y8pLRZEJp8EoXdpQxS1fT+Ueou/ewoF8sbkeL6ibg9jgE4Hc7YiD4 A==;
X-CSE-ConnectionGUID: w69xhIIDR1Wiinzc1aKf7Q==
X-CSE-MsgGUID: Af48SzagSEKDL4+WxI3cwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51633424"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; d="scan'208";a="51633424"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 10:36:35 -0700
X-CSE-ConnectionGUID: KCwofRmARfqx41yT9p9/1Q==
X-CSE-MsgGUID: uwuuTnHaR2O9OJ/TTmkCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; d="scan'208";a="147240946"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.230])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2025 10:36:34 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2] drm/xe: Enable ATS if enabled on the PCI side
Date: Sun,  8 Jun 2025 19:36:19 +0200
Message-ID: <20250608173619.200247-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h | 1 +
 drivers/gpu/drm/xe/xe_lrc.c           | 5 +++++
 drivers/gpu/drm/xe/xe_pt.c            | 4 ++--
 3 files changed, 8 insertions(+), 2 deletions(-)

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
index c9c41fbe125c..15e87be0e491 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -65,7 +65,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 	u8 id = tile->id;
 
 	if (!xe_vm_has_scratch(vm))
-		return 0;
+		return XE_PAGE_FORCE_FAULT;
 
 	if (level > MAX_HUGEPTE_LEVEL)
 		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
@@ -535,7 +535,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
 		if (xe_walk->clear_pt) {
-			pte = 0;
+			pte = XE_PAGE_FORCE_FAULT;
 		} else {
 			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
 							 xe_res_dma(curs) +
-- 
2.49.0

