Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D71C54798
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 19:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DEF10E59D;
	Thu, 29 Feb 2024 19:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaLiU615";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8096510E59D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 19:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709235932; x=1740771932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZhWu5RKljv1FP5WGPH6qRBNYS9iw9O6FFajofDdDpuA=;
 b=FaLiU615HE1k26wFEK3biJyZslfS/mwQ4A0d5Y8inrUOKGi8wRqkAHkO
 AP95crEVNTHK5ByOw6+FPOpoK84Vqw4DoaTVU4k7xIo9UMiMEalYvj/fh
 eHMULLrFjmgWXU3HQMWu477zoo2PvTwKjwfWbKD3iK4y79dZJEgCYTQfn
 x95YWkHCV5mYvVpBfyVUhziPJaogp0z/YU+loLSBf2MGb3nt5dThB7tAP
 SFgdKsIrprvcOM/tZng8/3djfPlI0KhEcouIslkflyD7lI9lYEL+Q7Wya
 gUL9hh7u4/cEHw8cXyf7gvumhIN9RenjA41+hYZ1P/f09LLV1XNb2KtcI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14372459"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="14372459"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 11:45:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12507891"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 11:45:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Do not grab forcewakes when issuing GGTT TLB
 invalidation via GuC
Date: Thu, 29 Feb 2024 11:45:20 -0800
Message-Id: <20240229194520.200642-1-matthew.brost@intel.com>
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

Forcewakes are not required for communication with the GuC via CTB
as it is a memory based interfaced. Acquring forcewakes takes
considerable time. With that, do not grab a forcewake when issuing a
GGTT TLB invalidation via the GuC.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c                | 7 -------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5d46958e3144..601b3a95bffc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -256,16 +256,9 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 	if (!gt)
 		return;
 
-	/*
-	 * Invalidation can happen when there's no in-flight work keeping the
-	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
-	 * and GuC are accessible.
-	 */
-	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	err = xe_gt_tlb_invalidation_ggtt(gt);
 	if (err)
 		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
-	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
 
 void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index f29ee1ccfa71..a3c4ffba679d 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -247,6 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 
 		xe_gt_tlb_invalidation_wait(gt, seqno);
 	} else if (xe_device_uc_enabled(xe)) {
+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
@@ -256,6 +257,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 			xe_mmio_write32(gt, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 		}
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	}
 
 	return 0;
-- 
2.34.1

