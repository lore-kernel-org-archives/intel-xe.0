Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDF7C54E49
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 13:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55ECF112ABD;
	Tue,  5 Mar 2024 13:12:53 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40E5112ABD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 13:12:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/4] drm/xe: Do not grab forcewakes when issuing GGTT TLB
 invalidation via GuC
Date: Tue,  5 Mar 2024 14:12:48 +0100
Message-ID: <20240305131250.5330-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
References: <20240305131250.5330-1-maarten.lankhorst@linux.intel.com>
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
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c                | 7 -------
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0435e1202c46..325337c38961 100644
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
 		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
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
2.43.0

