Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC99CC531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 07:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F4410F2F8;
	Fri, 24 Jul 2026 07:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/iY8w/o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EE410F2F8
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 07:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784878178; x=1816414178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4zzDL44SVapsoZaohXMs6zyk7ReBL7DV+auSXgeet3M=;
 b=c/iY8w/oO/vWB9MTB3zudVyDT73OKENmoXQVeWYyIFrw2jZr/qO2f//S
 fP49BHoCjaEmrDRITW11OgHq8VdkCnKOEcw+F6c3ikp87nfxrr+fSHrVu
 lQx9EPW1npCpItLXuv8mMRD7Ipisz2Vulsc6yJ7v2NbSPgwkfB0OuvC9P
 7Ofw/EQoQYVu/cIiLFljzUWlrzL8eoYeK+CyHzt99vtDuaJJAFaJtSP6P
 V4gVtzMw2cAj5fUYJdEVZ8tGgNiViD1CDtqcXHO6wYzS4a8byvXUe93CA
 DErh1D9RGNi/cGTXVf6u8QwL6LBSg1H69jt+EcjJ+RIcLM+MW8FQdkii3 g==;
X-CSE-ConnectionGUID: ph+M+NvARgS/6NzS+6vxmg==
X-CSE-MsgGUID: 27HHypGkTcK97xWAVZMh1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85588553"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="85588553"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 00:29:35 -0700
X-CSE-ConnectionGUID: qpGIFopkQ4qb/MTlGlSA3w==
X-CSE-MsgGUID: VpBvhgC3RsSEN8nFB1ha5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="258103777"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa008.jf.intel.com with ESMTP; 24 Jul 2026 00:29:34 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] drm/xe/pt: check no-DMA huge-pte cases before DMA segment test
Date: Fri, 24 Jul 2026 13:00:51 +0530
Message-ID: <20260724073050.429768-2-himal.prasad.ghimiray@intel.com>
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

Cc: Matthew Brost <matthew.brost@intel.com>
Fixes: 5b658b7e89c3 ("drm/xe: Clear scratch page on vm_bind")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 598c6b2571e7..917b464e3db5 100644
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
-- 
2.43.0

