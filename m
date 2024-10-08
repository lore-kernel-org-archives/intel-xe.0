Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D1CCED273
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 06:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA7310E470;
	Tue,  8 Oct 2024 06:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5exmN3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C54C10E474
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 06:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728370407; x=1759906407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OtmLdOUv/z+s8k4zmKZP2WdezhK3mxoZ2F8AFkhMk8E=;
 b=m5exmN3LghXEJnv+3PLdY6tX5dwcpdfRi2JpJoL1kTGGS0ZECasDms0K
 if9hQtQLKkrlX2jZjzHuUi/lj3pSjJi9Y4vu0EV8OEwzqw66psugRnsXi
 Sl6rnaPjizNDsbdQ08eGI4rwhjg1+Tq09FrmrBQ2iCs4igHJymNIoLlfJ
 4qEToXUQMOTHXhSxuDkXVSqUcWWU/GEDiR96+KYcUBhXhXKiGzGcgLM12
 x/GTJYY+6xvAA8GQmWTFWYPi1KtfQ/T42TXGfI2YTWSxhAuzNzayNHZIq
 YEzqc3EBRsp2RAVl3EmHW2IKIeI76BwYCJpqDopEYB9uoX8ftEryuluPD Q==;
X-CSE-ConnectionGUID: 7cAHsmIbQ4qddjy0bgsNkQ==
X-CSE-MsgGUID: Y9XI6TE0RTGicvcQrWp4jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="31430465"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="31430465"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 23:53:27 -0700
X-CSE-ConnectionGUID: hjuskR+NSUmafk2HFdPX/Q==
X-CSE-MsgGUID: nt3o3iLWRVKAmUBXZsxkrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="106577765"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2024 23:53:25 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v8 20/26] drm/xe/gt_tlb_invalidation_ggtt: Update handling of
 xe_force_wake_get return
Date: Tue,  8 Oct 2024 12:41:09 +0530
Message-Id: <20241008071115.1862704-21-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

