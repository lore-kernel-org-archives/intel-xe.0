Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E15BCFB440
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 06:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B57810E308;
	Mon,  7 Oct 2024 06:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKftsg8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A938010E308
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 06:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728283349; x=1759819349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OtmLdOUv/z+s8k4zmKZP2WdezhK3mxoZ2F8AFkhMk8E=;
 b=CKftsg8qv4AjI6DZMMtaNky6XI6T7Sz8BNq3SBcYhR7KwnWqoysKItlI
 ZIRAP7aPP7AY//PMgKespWEG9sqLKm0X2FoX8LnszjABzr4ue33KiZwdE
 A70/X48hVlgKwbN/TzNfv0to+1ukQ2cdMZfS0Z2Ym7qNEcFRqVOOvE6je
 lMfbYbfyGSc1U71A/XqNhCK+C36EVHS9AB6P5oyd3R5puM3FKvqqu4ei2
 FDmmOQt7PmVKgMLtH/c1kDp+hfCRihoDzeSg/rYuGsm7+nSNSXtGDe5AK
 BQjrsetMgkjqnvqcEq9gepanssynlsAzgI/hsAkMCI7drcy+yxGh+FQpq g==;
X-CSE-ConnectionGUID: hbtWRN0/QiKLrv11cD0l6g==
X-CSE-MsgGUID: djnmH6doQ0WzZ9wvrEYBGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="38548469"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="38548469"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2024 23:42:29 -0700
X-CSE-ConnectionGUID: chGVmUMySza0U7omvvX4CQ==
X-CSE-MsgGUID: K0UYFC1ZQfajy8v/u0of9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; d="scan'208";a="112842574"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa001.jf.intel.com with ESMTP; 06 Oct 2024 23:42:27 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v7 20/26] drm/xe/gt_tlb_invalidation_ggtt: Update handling of
 xe_force_wake_get return
Date: Mon,  7 Oct 2024 12:30:11 +0530
Message-Id: <20241007070017.1732886-21-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

xe_force_wake_get() now returns the reference count-incremented domain
mask. If it fails for individual domains, the return value will always
be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
in the event of failure. Update the return handling of xe_force_wake_get()
to reflect this behavior, and ensure that the return value is passed as
input to xe_force_wake_put().

v3
- return xe_wakeref_t instead of int in xe_force_wake_get()

v5
- return unsigned int from xe_force_wake_get()
- remove redundant warns

v7
- Fix commit message

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 98616de0c5bb..302ac48186d3 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -259,6 +259,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
 int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	unsigned int fw_ref;
 
 	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
 	    gt->uc.guc.submission_state.enabled) {
@@ -279,7 +280,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 		if (IS_SRIOV_VF(xe))
 			return 0;
 
-		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
@@ -289,7 +290,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 		}
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
 	return 0;
-- 
2.34.1

