Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FE3C3DA70
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 21:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD35F10E32C;
	Thu, 25 Jul 2024 21:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MinLBfsa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F4510E32C
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 21:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721944086; x=1753480086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YTjp8061uR93gg4Ie9jr+MzuBJ+OmizUyxFJaOP0Bbc=;
 b=MinLBfsafChkRluSSwVZKVPIahWGjq1uylNaNhwy113euHFznVf7wAZr
 40k3D+DDd2QPJfPghjOugjFE+EPg73q57tQgakL9jgm5h73Abjead1Z9k
 6uQ0mxrh7niabskOrPi/JEli5+UmLuZ0hxDwxXpXzUIdcOYY1NpDVz60b
 OCzlIfwJmZMtU4DDIL8rwb53iBxXpwRn0JMuvMTulHh/If+cAXC6G5EJF
 WnNgtoFg9ILbfob1Bbhw7JIOFs+4XTxO35+2vCff74X/LOIViTeGitTUk
 AzK9jM86T1VN9HGC8t3Hc/1sdIIWt98OYpyk4z4UnNnL4OLSvs5ohewsV Q==;
X-CSE-ConnectionGUID: 4hCxLAW8RGKvAEojjoJWVw==
X-CSE-MsgGUID: pPIt3JZOTQS9dytEYD72fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="23515581"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="23515581"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 14:48:06 -0700
X-CSE-ConnectionGUID: cc2F+WgpTK2muDcQYy6ErQ==
X-CSE-MsgGUID: LVoSFmHOQKOPlaTYe39vQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="57198938"
Received: from azharsha-mobl36.amr.corp.intel.com (HELO
 AZHARSHA-mobl36.intel.com) ([10.125.134.145])
 by fmviesa003.fm.intel.com with ESMTP; 25 Jul 2024 14:48:04 -0700
From: Azhar Shaikh <azhar.shaikh@intel.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org
Cc: azhar.shaikh@intel.com
Subject: [PATCH] drm/xe: Remove unused variable
Date: Thu, 25 Jul 2024 14:48:04 -0700
Message-Id: <20240725214804.31650-1-azhar.shaikh@intel.com>
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

pde_encode_pat_index() and pte_encode_pat_index() no
longer use the 'xe' parameter. Remove this parameter
from these functions and also clean up all other places in
the file where these functions are called.

Signed-off-by: Azhar Shaikh <azhar.shaikh@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 12d43c35978c..1b66d27ad7c3 100644
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

