Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA39EEE241
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3C710EC2B;
	Thu, 12 Sep 2024 18:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDjtzDxJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046FE10EC2A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726167513; x=1757703513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=USWOpXs65zHzxsSVcqYTp9x5x+82oB2OdUcEK6miiTk=;
 b=KDjtzDxJHaSKFfREQUbrRMAHCllsxzsBP1b2/JkJqBcDRarErIqxJAEP
 AZrS/w8tunzhT88fGuyKOgqvA4qJ/8pRM4ZEwf3RXz3U73ys5XBd0NpP7
 PgJITezcdPDXzINBGbCotjQOQF/56/J1f/eaCkDdw6H7T2nJQGVeOenp1
 rusi3AKtMn9jZpvUdbeXuLTfaA7OeZDrSExFO0Q7S3Z47mmA1Xv3fCIeL
 /srDL3+AVQ3EvpsBVXU7cBTFyiXIoeSbdbMN8JLqqoLA7FsiDK82FvJzZ
 BMoLZUNIj/LM7LI/94KKfOWFOOiFq32cwerMp4QSlSSM6OWwq0kYO65na g==;
X-CSE-ConnectionGUID: Tj153CyRSai5sXeQyE5izQ==
X-CSE-MsgGUID: cpT5ky9ZTtmk7mDu1rXtWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25202993"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25202993"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:58:32 -0700
X-CSE-ConnectionGUID: UUqoPIRSRlyNARKDXrCs2g==
X-CSE-MsgGUID: CDJlcGeVR8OIOC+KSaRaXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="71910215"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 11:58:31 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 17/23] drm/xe/gt_tlb_invalidation_ggtt: Update handling of
 xe_force_wake_get return
Date: Fri, 13 Sep 2024 00:45:57 +0530
Message-Id: <20240912191603.194964-18-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
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

With xe_force_wake_get() now returning the refcount-incremented domain
mask, a return value of 0 indicates failure for single domains
(excluding XE_FORCEWAKE_ALL).

Modify the return handling of xe_force_wake_get() accordingly and pass
the return value to xe_force_wake_put().

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 98616de0c5bb..089ee0b4c8f9 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -259,6 +259,7 @@ static int xe_gt_tlb_invalidation_guc(struct xe_gt *gt,
 int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	int fw_ref;
 
 	if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
 	    gt->uc.guc.submission_state.enabled) {
@@ -279,7 +280,8 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 		if (IS_SRIOV_VF(xe))
 			return 0;
 
-		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		xe_gt_WARN_ON(gt, !fw_ref);
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(mmio, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
@@ -289,7 +291,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 			xe_mmio_write32(mmio, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 		}
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
 	return 0;
-- 
2.34.1

