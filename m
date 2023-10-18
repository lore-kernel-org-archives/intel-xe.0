Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86311CDB482
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 12:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C2910E3D8;
	Wed, 18 Oct 2023 12:35:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E219610E3D8
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 12:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697632503; x=1729168503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QZ9F+qpo8eGYP1h5Z9nhDQ2YwpPrq+0C11e+g/tgPs8=;
 b=WEcNmgvxOrvNyvu63a0yOcj+fUuO4AhMULPuLE9II0T02u6j2ahXEoYO
 YT7edhq3gW9Aj4vZvAbFZmid6zRNcGK2r+4tskOCstXhHT0uVUJrNwGj2
 rDj6+VZS+Lq8zRbo2v1p8dhvoYaFr2sOp/Cp1ytrM0BgZOypoFTAsszD3
 +993Jc2YUDN/dPlJdPsO1KWMLfhOdA/esGFPZIvKXCR+sujAf9H2kuKNf
 OtvfPpnb74MfgQEfuGazwgPU/A032/QJjnN2T2HV09cFnGWOLeWyouGt/
 hCpejtJ1x/9QNtjcziOg1yunwC+s54lzJIClFCrulwXLdyZ5WGCwMPxPe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="7553695"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="7553695"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 05:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="847256623"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; d="scan'208";a="847256623"
Received: from mmulahme-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.17.84])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 05:34:41 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 18 Oct 2023 13:34:24 +0100
Message-ID: <20231018123423.427552-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: fix pat[2] programming with 2M/1G pages
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Bit 7 in the leaf node is normally programmed with pat[2], however with
2M/1G pages that same bit in the PDE/PDPE also toggles 2M/1G pages. For
2M/1G entries the pat[2] is rather moved to bit 12, which is now free
given that the address must be aligned to 2M or 1G, leaving bit 7 for
toggling 2M/1G pages.

Bspec: 59510, 45038
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h |  1 +
 drivers/gpu/drm/xe/xe_vm.c | 17 +++++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 78da28f4ea13..4e74201cc986 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -41,6 +41,7 @@
 
 #define XELPG_PPGTT_PTE_PAT3		BIT_ULL(62)
 #define XE2_PPGTT_PTE_PAT4		BIT_ULL(61)
+#define XE_PPGTT_PDE_PDPE_PAT2		BIT_ULL(12)
 #define XE_PPGTT_PTE_PAT2		BIT_ULL(7)
 #define XE_PPGTT_PTE_PAT1		BIT_ULL(4)
 #define XE_PPGTT_PTE_PAT0		BIT_ULL(3)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index fa6fa34a0663..498c0b3e1d73 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1210,7 +1210,8 @@ static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
 	return pte;
 }
 
-static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index)
+static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index,
+				u32 pt_level)
 {
 	u64 pte = 0;
 
@@ -1220,8 +1221,12 @@ static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index)
 	if (pat_index & BIT(1))
 		pte |= XE_PPGTT_PTE_PAT1;
 
-	if (pat_index & BIT(2))
-		pte |= XE_PPGTT_PTE_PAT2;
+	if (pat_index & BIT(2)) {
+		if (pt_level)
+			pte |= XE_PPGTT_PDE_PDPE_PAT2;
+		else
+			pte |= XE_PPGTT_PTE_PAT2;
+	}
 
 	if (pat_index & BIT(3))
 		pte |= XELPG_PPGTT_PTE_PAT3;
@@ -1265,7 +1270,7 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 
 	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pte |= pte_encode_pat_index(xe, pat_index);
+	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
 	pte |= pte_encode_ps(pt_level);
 
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
@@ -1284,7 +1289,7 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 	if (likely(!xe_vma_read_only(vma)))
 		pte |= XE_PAGE_RW;
 
-	pte |= pte_encode_pat_index(xe, pat_index);
+	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
 	pte |= pte_encode_ps(pt_level);
 
 	if (unlikely(xe_vma_is_null(vma)))
@@ -1304,7 +1309,7 @@ static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
 
 	pte = addr;
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pte |= pte_encode_pat_index(xe, pat_index);
+	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
 	pte |= pte_encode_ps(pt_level);
 
 	if (devmem)
-- 
2.41.0

