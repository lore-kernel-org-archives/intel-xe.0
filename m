Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC332C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 14:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA3F10E100;
	Thu,  5 Jun 2025 14:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gowCUVbX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EC710E100
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749135549; x=1780671549;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cXFx6L3JqBE1yMttb14hiOl8/ETPEwqAWhjqBBJ6kTk=;
 b=gowCUVbXOFUHsOHz0Ue+q2m0z3AMb6rr3Ed6RHMj5Jh/i3N1THgAFLje
 bnjfDf9NVuMl+B31u30blmnAUlTcm1YPpFhp6hRgejCGCzBOKK63WLRY9
 I5V9Mix0hThYv+hCo8j7HntNajXCuO3T97AssIZcVWN62lx+3TpK01sUw
 Ufn4Wco6oMag+7JM+Q39wcgsiedtnFb71WdBPJ1A11LkIuoUUCISb0y+K
 A5eSShgP9IDX4whB3Vfbz4BZ6scv3egdcHZxqI//YEnlBp0hZ0Y9W4Zpr
 bn0vW95VQt2CL7VNkvgb/IZ94gLxAtzAnUQ38azGiEprx1jqEaWg601Xe A==;
X-CSE-ConnectionGUID: 1T9LwlUySpSzSNOaKdJfvQ==
X-CSE-MsgGUID: mg29gQgtQA2XYZbs4jgMBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51172337"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51172337"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 07:59:09 -0700
X-CSE-ConnectionGUID: um0BBeRLTW60L+GelvNyvA==
X-CSE-MsgGUID: bG4bc/bSQmqp8HUXI9XbpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="150693676"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 07:59:08 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [CI] drm/xe: Enable ATS if enabled on the PCI side
Date: Thu,  5 Jun 2025 16:58:38 +0200
Message-ID: <20250605145838.31942-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h | 1 +
 drivers/gpu/drm/xe/xe_lrc.c           | 5 +++++
 drivers/gpu/drm/xe/xe_pt.c            | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

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
index c9c41fbe125c..025a9052cc1e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -65,7 +65,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 	u8 id = tile->id;
 
 	if (!xe_vm_has_scratch(vm))
-		return 0;
+		return XE_PAGE_FORCE_FAULT;
 
 	if (level > MAX_HUGEPTE_LEVEL)
 		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
-- 
2.49.0

