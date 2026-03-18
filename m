Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950B8FCD0C1
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 07:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5759510E6AC;
	Wed, 18 Mar 2026 07:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQfACK36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A9810E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 07:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773817843; x=1805353843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qYdzDRnCE+wrOFNJD7b2mTCCtgREdI/DhjA/JUEAs9Y=;
 b=iQfACK36S5Ezcx1/8t54cuuPhoHsBp/dKTY/9RlaoLO13h4g+z/3T1LY
 0dzqnrsxSapjdz5vk4JTwtqAS4TekKnJnEhqsc0Krp4UenYHN1n2iAK9q
 2gDHneCKQrAxoVa/pmpF1pvifLXoRlHm3c0OM1K2z/4tryMa4P8VB+Fgh
 Pbytt1yOOn4KBKCQjjHuzHbMIZ7QMgmKb4qbBb/natYnN2430NmFdp6WA
 ESsgKvQkxLBYnelhsoH1B2joF3UljXG9C/A6zKh3A3xsX3sLUqWwco/iC
 KRNDORJKrkBQKWGdVooU1Njb7sFHoKvy+KBMe9mHTX8S/Vd670QVjUO9T A==;
X-CSE-ConnectionGUID: FRSFvAQHStCj+e0I7SzqfQ==
X-CSE-MsgGUID: pUQEd9U0R/GbhEG1KNZAbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78764296"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="78764296"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 00:10:43 -0700
X-CSE-ConnectionGUID: WvS1nE9eQF+tRh7GurwXoA==
X-CSE-MsgGUID: Q7SkcRPrQcCQDvrzjrwoHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260424110"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by orviesa001.jf.intel.com with ESMTP; 18 Mar 2026 00:10:41 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 stuart.summers@intel.com, arvind.yadav@intel.com, tejas.upadhyay@intel.com,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC 15/15] drm/xe/pt: Set NC PTE bit for VMAs ineligible for access
 counting
Date: Wed, 18 Mar 2026 13:14:56 +0530
Message-Id: <20260318074456.2839499-16-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
References: <20260318074456.2839499-1-himal.prasad.ghimiray@intel.com>
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

Set XE_PPGTT_PTE_NC on PTEs for VMAs that can't benefit from access
counter migration hints, avoiding wasteful slot allocation.

Bspec: 67095
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  2 +-
 drivers/gpu/drm/xe/xe_pt.c            | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index 4d83461e538b..ace3cbcc13d8 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -28,11 +28,11 @@
 #define XE_GGTT_PTE_DM			BIT_ULL(1)
 #define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
 #define XE_PPGTT_PTE_DM			BIT_ULL(11)
+#define XE_PPGTT_PTE_NC			BIT_ULL(5)
 #define XE_PDE_64K			BIT_ULL(6)
 #define XE_PTE_PS64			BIT_ULL(8)
 #define XE_PTE_NULL			BIT_ULL(9)
 
 #define XE_PAGE_PRESENT			BIT_ULL(0)
 #define XE_PAGE_RW			BIT_ULL(1)
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 2d9ce2c4cb4f..cc8dcdb6649a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -755,6 +755,17 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			XE_USM_PPGTT_PTE_AE : 0;
 	}
 
+	if (!xe_vma_supports_access_ctr(xe, vma, tile)) {
+		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
+		xe_walk.default_system_pte |= XE_PPGTT_PTE_NC;
+	}
+
+	if (range) {
+		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
+		if (!range->base.pages.flags.migrate_devmem)
+			xe_walk.default_system_pte |= XE_PPGTT_PTE_NC;
+	}
+
 	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
 	xe_walk.dma_offset = bo ? vram_region_gpu_offset(bo->ttm.resource) : 0;
 	if (!range)
-- 
2.34.1

