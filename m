Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE54AC52D7B
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 10:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF0E10E2E0;
	Tue, 13 Aug 2024 10:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIejiw58";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFD810E2E0
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723544807; x=1755080807;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EPyUIuKdJyMFqLVFSBm9MD0FY9vkTpPAft4K1ZmBxGg=;
 b=CIejiw58SAsErwq6pq3A3PDQTWNJvmjscESKe1UNNy0rg6SH+w+UIwfs
 TElyrc3eSNHbNgRoRDrJHJ7UcF8RX4j0/AL//yd5LaYW04sWM8TDTxS0h
 Et2ZoNdVPwm0s+sddP2j9eC+uhAkL0UfrHjWN5/H+/3QO29vM1+VYh25i
 EzlZq8KP5nEOHRDv+ynqKX2qrU55MAfm1T+lAyNNJ9PBjfFi2F/IIh7RR
 Zh2ZUYyoFxNlHruQSrQDUO692kZhzac0AftYTx4ilxKjKGtTfS+C92Hqd
 f/nVNorObLPhb6P+ch7Ma5bYZZO/05niC878elUn2TKZd/7f747R01DM/ w==;
X-CSE-ConnectionGUID: aVN6w3BQTwyCsi0c/Zn1ZA==
X-CSE-MsgGUID: Aip3L/r6QXSU84QkTIu1kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39146021"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="39146021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:26:46 -0700
X-CSE-ConnectionGUID: UQq4mcG+TQ6GoBh5kEDhKg==
X-CSE-MsgGUID: IepwVGRbR3WSt4ycD5P2NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="62781776"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 13 Aug 2024 03:26:44 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH] drm/xe: Remove unused xe parameter
Date: Tue, 13 Aug 2024 16:14:19 +0530
Message-Id: <20240813104419.2958046-1-himal.prasad.ghimiray@intel.com>
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

Remove the xe parameter from the pde_encode_pat_index and
pte_encode_pat_index functions, as it is no longer used.

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f225107bdd65..89d86b7cdb02 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1191,7 +1191,7 @@ static const struct drm_gpuvm_ops gpuvm_ops = {
 	.vm_free = xe_vm_free,
 };
 
-static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
+static u64 pde_encode_pat_index(u16 pat_index)
 {
 	u64 pte = 0;
 
@@ -1204,8 +1204,7 @@ static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
 	return pte;
 }
 
-static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index,
-				u32 pt_level)
+static u64 pte_encode_pat_index(u16 pat_index, u32 pt_level)
 {
 	u64 pte = 0;
 
@@ -1246,12 +1245,11 @@ static u64 pte_encode_ps(u32 pt_level)
 static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
 			      const u16 pat_index)
 {
-	struct xe_device *xe = xe_bo_device(bo);
 	u64 pde;
 
 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pde |= pde_encode_pat_index(xe, pat_index);
+	pde |= pde_encode_pat_index(pat_index);
 
 	return pde;
 }
@@ -1259,12 +1257,11 @@ static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
 static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 			      u16 pat_index, u32 pt_level)
 {
-	struct xe_device *xe = xe_bo_device(bo);
 	u64 pte;
 
 	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
+	pte |= pte_encode_pat_index(pat_index, pt_level);
 	pte |= pte_encode_ps(pt_level);
 
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
@@ -1276,14 +1273,12 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 			       u16 pat_index, u32 pt_level)
 {
-	struct xe_device *xe = xe_vma_vm(vma)->xe;
-
 	pte |= XE_PAGE_PRESENT;
 
 	if (likely(!xe_vma_read_only(vma)))
 		pte |= XE_PAGE_RW;
 
-	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
+	pte |= pte_encode_pat_index(pat_index, pt_level);
 	pte |= pte_encode_ps(pt_level);
 
 	if (unlikely(xe_vma_is_null(vma)))
@@ -1303,7 +1298,7 @@ static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
 
 	pte = addr;
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pte |= pte_encode_pat_index(xe, pat_index, pt_level);
+	pte |= pte_encode_pat_index(pat_index, pt_level);
 	pte |= pte_encode_ps(pt_level);
 
 	if (devmem)
-- 
2.34.1

