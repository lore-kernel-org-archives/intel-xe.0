Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C7BC79FBE
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C5710F11A;
	Wed,  9 Sep 2026 12:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwlSwzGb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2031910F11A
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 12:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788957736; x=1820493736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C9G+mgTni3/pq/1xjykeyWPiVwi7vUaVuwSNC0+G7W0=;
 b=bwlSwzGb8dJjxWf7pQBSASAq3ptQ2N2SA2hzUob8/GYkK7DEwtmOQ+hx
 Q8K6lirRijIcocNQJl9UiKHCMFmmnkDhMJfWc8HE49M/iHtbDyWBsn9I5
 7MO1/Oh7VORVR09324UL8535vx7n7Ppjf865jW5pJDdb89wGIEV5f5PA+
 piWb91cUAqWv+wMXNltdxkugAXxkDoRABMI69+O4+yREa4HbOf9RBRpIG
 KimqRxGwoyEUtReMZtCv2vFbbnhM6LcCX8cqTK4YgfY5n7xeNlZ3Laflb
 9wZpRfLe0HcZ/z5KIB4OVs7OZ2Jc4DTKsvyj9egodCamKyKSU1Ob88bm7 A==;
X-CSE-ConnectionGUID: GJoWgZXlRKWwJT6vagiUmw==
X-CSE-MsgGUID: erhYR0lfQrqcDn9F3vkuZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99715574"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="99715574"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 05:42:16 -0700
X-CSE-ConnectionGUID: 8e8dKFlARha+pmm9e+CMjQ==
X-CSE-MsgGUID: P6kVwr4YR6aP+hL/vrI04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="296246661"
Received: from hghimira.iind.intel.com ([10.190.239.34])
 by fmviesa001.fm.intel.com with ESMTP; 09 Sep 2026 05:42:15 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [RFC v2 17/21] drm/xe/pt: Set NC PTE bit for VMAs ineligible for
 access counting
Date: Wed,  9 Sep 2026 18:15:11 +0530
Message-ID: <20260909124457.1610890-40-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
References: <20260909124457.1610890-23-himal.prasad.ghimiray@intel.com>
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
 drivers/gpu/drm/xe/regs/xe_gtt_defs.h |  1 +
 drivers/gpu/drm/xe/xe_pt.c            | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
index d6bc19ef277b..1286ef346504 100644
--- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
@@ -30,6 +30,7 @@
 #define XE_PDE_IPS_64K			BIT_ULL(11)
 
 #define XE_GGTT_PTE_DM			BIT_ULL(1)
+#define XE_PPGTT_PTE_NC			BIT_ULL(5)
 #define XE_USM_PPGTT_PTE_AE		BIT_ULL(10)
 #define XE_PPGTT_PTE_DM			BIT_ULL(11)
 #define XE_PDE_64K			BIT_ULL(6)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 5d990c1c3740..9000e882e51d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -800,6 +800,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.clear_pt = clear_pt,
 	};
 	struct xe_pt *pt = vm->pt_root[tile->id];
+	struct drm_gpusvm_range_flags range_flags;
 	int ret;
 	bool is_purged = false;
 
@@ -859,6 +860,18 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			XE_USM_PPGTT_PTE_AE : 0;
 	}
 
+	if (!xe_vma_supports_access_ctr(xe, vma, tile)) {
+		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
+		xe_walk.default_system_pte |= XE_PPGTT_PTE_NC;
+	}
+
+	if (range) {
+		xe_walk.default_vram_pte |= XE_PPGTT_PTE_NC;
+		range_flags.__flags = READ_ONCE(range->base.flags.__flags);
+		if (!range_flags.migrate_devmem)
+			xe_walk.default_system_pte |= XE_PPGTT_PTE_NC;
+	}
+
 	xe_walk.default_vram_pte |= XE_PPGTT_PTE_DM;
 	xe_walk.dma_offset = (bo && !is_purged) ? vram_region_gpu_offset(bo->ttm.resource) : 0;
 	if (!range)
-- 
2.43.0

