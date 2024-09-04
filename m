Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716DACD37BE
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBB710E65A;
	Wed,  4 Sep 2024 00:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4G6iREz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CF510E63B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 00:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725409278; x=1756945278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GOPLPPGC0hX9OFjI2+MxxJ7kPJEO47E5u1CJCZrzhqw=;
 b=L4G6iREztwDrWvwU0YsgevEt1qDOoLr72mbS/kkt7RbWAEaRhQx+BAD8
 r4dU3a5exu6+8+4EXaKOh0w2v7TPifcIuYzJV4v/Y9qq5DUc1PwfAwLlb
 YjkFN0KpAYgED+DLOmOAn8eCPDINkgGZpxolt6r38SKRTOFoTCC5hBR13
 zwbzVAFPSIFB0J8XT6zL7GHsXlCGBw/2Jcc/uynWlF8oaY8INu0H0kI1v
 mwadjeFrhQFACxTERpYbmCWujsS+leWtZipIOmpbWvBR+oF8wVRa+/gi0
 2t3YsfStIfA5GyUDikd+MsSNNJikj0wepnJ27T++oMKsQAKJkBtaoXInO w==;
X-CSE-ConnectionGUID: hXBQC9a/RjqEh9tT3mProg==
X-CSE-MsgGUID: EgrjZ11NTyqTGHRNiEeWoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23904829"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="23904829"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
X-CSE-ConnectionGUID: N4y69kmGQueko8FfIjhZrw==
X-CSE-MsgGUID: uMAREj3oTN2GnH87793Zzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; d="scan'208";a="69944331"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 17:21:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 38/43] drm/xe/tlb: Convert register access to use xe_mmio
Date: Tue,  3 Sep 2024 17:21:39 -0700
Message-ID: <20240904002100.2023834-83-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240904002100.2023834-45-matthew.d.roper@intel.com>
References: <20240904002100.2023834-45-matthew.d.roper@intel.com>
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

Stop using GT pointers for register access.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index cca9cf536f76..98616de0c5bb 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -274,17 +274,19 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_fence_wait(&fence);
 	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
+		struct xe_mmio *mmio = &gt->mmio;
+
 		if (IS_SRIOV_VF(xe))
 			return 0;
 
 		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
-			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
+			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
-			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0,
+			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC0,
 					PVC_GUC_TLB_INV_DESC0_VALID);
 		} else {
-			xe_mmio_write32(gt, GUC_TLB_INV_CR,
+			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 		}
 		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-- 
2.45.2

