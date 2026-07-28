Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6219DC53219
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 05:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33C810E4B9;
	Tue, 28 Jul 2026 05:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0NqVvSM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A9010E4B9
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jul 2026 05:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785218274; x=1816754274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0BJDv0Fj5ZwYTj4HWufxViHF33krhNlidSdJZN06qFM=;
 b=L0NqVvSM0rp16JA0G37xPXhhhPGwne6UixYt5xEB24SiDcpf1HPAYo1j
 KvyjyjohWO1moUbOs1phf85un/frky5QTIeGdFPaf0hUwEJIHYyQcaRXc
 v3p8pxE7ORBtybGspYupYpI6TZFjG8HDgXKNDfj7SJhgBadOX4QHSi8vk
 h8voEVOnciMUIga8L3KKsVDknlFjSE1qZisOiM53G8EsUvsy9WWDcSq5/
 BLszvluOqIi7U6GR9SzstTas/+YGV8OMlz41ZZ+hUciKbVGeYLTP0/Pdh
 T5rVnQRqw84nwmjRbu6IzFAKgz2/zgiqWbiKgrBpbAdbw00XEABjsgSA3 w==;
X-CSE-ConnectionGUID: WeY3ZAiZTFSPwEpDeizQcQ==
X-CSE-MsgGUID: 7zEUOZ8/Sg+9tKSBkVC4mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96150392"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="96150392"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 22:57:53 -0700
X-CSE-ConnectionGUID: BsUByHCCRPm+g0oSuIuVqg==
X-CSE-MsgGUID: ONNlfZpEQUKACRX+dsBPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; d="scan'208";a="261590699"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa004.fm.intel.com with ESMTP; 27 Jul 2026 22:57:51 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] drm/xe/pt: check no-DMA huge-pte cases before DMA segment
 test
Date: Tue, 28 Jul 2026 11:29:17 +0530
Message-ID: <20260728055916.593707-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
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

On a non-range clear, curs.size is never set, so the segment test
(next - va_curs_start > curs->size) returns false for every level > 0
before the clear_pt short-circuit is reached. The clear then descends to
level 0 instead of forming a huge zero-leaf, wasting page tables and
risking -ENOMEM on unbind.

Move the null-VMA, purged-BO and clear_pt short-circuits above the
curs->size test. The bind path always sets curs.size, so it is unaffected.

v2
- Also set curs.size on the clear path so the cursor stays meaningful
during the walk. clear_pt is only reached with range == NULL, so assert
that invariant. (Matthew Brost)

Cc: Matthew Brost <matthew.brost@intel.com>
Fixes: 5b658b7e89c3 ("drm/xe: Clear scratch page on vm_bind")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 598c6b2571e7..0e9d669620b9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -443,10 +443,6 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 	if (!xe_pt_covers(addr, next, level, &xe_walk->base))
 		return false;
 
-	/* Does the DMA segment cover the whole pte? */
-	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
-		return false;
-
 	/* null VMA's and purged BO's do not have dma addresses */
 	if (xe_vma_is_null(xe_walk->vma) || (bo && xe_bo_is_purged(bo)))
 		return true;
@@ -455,6 +451,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 	if (xe_walk->clear_pt)
 		return true;
 
+	/* Does the DMA segment cover the whole pte? */
+	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
+		return false;
+
 	/* Is the DMA address huge PTE size aligned? */
 	size = next - addr;
 	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
@@ -775,8 +775,11 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	}
 
 	xe_walk.needs_64K = (vm->flags & XE_VM_FLAG_64K);
-	if (clear_pt)
+	if (clear_pt) {
+		xe_assert(xe, !range);
+		curs.size = xe_vma_size(vma);
 		goto walk_pt;
+	}
 
 	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
 		xe_walk.default_vram_pte = xe_atomic_for_vram(vm, vma) ? XE_USM_PPGTT_PTE_AE : 0;
-- 
2.43.0

