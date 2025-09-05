Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1AECA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 21:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2AC10E364;
	Fri,  5 Sep 2025 21:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCZ7Mm7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B114410E294
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 21:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757109382; x=1788645382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nO5WUaIsBVmVcg6Alsfen4dSUk8r3ngMU4goGnhMKrM=;
 b=eCZ7Mm7fiChUzwqnqIPNAk5sLPV2gxKfAfQ1SrXd94Z9J080hiR11Sf8
 YDgF947Set1zS+O/Cl4C1EGWRq3IHW9CTG7pwwlbm4oYS76CX1JlFZ+ti
 7Lx9HlJ2B3L7s5S6jGD1j1VccWkawhtSsmXIIriM1hZVbCRXACQ+ez3l2
 nmoIRZ3wmspbD9tklErRuA4BsvXEj15YMe6R+u7cYVF47Kta9exvqvrIW
 DsT7GT1uI9PLd779L9eLqzcK9u+Ha5qDsp5WnnJ/rqHRVURiNAYX9xSqr
 WCUDeJKVlb41XCcFE7Xf2ESyOc3wRTce5Go8Vusyyz+4NR0lKzoaT9x4x A==;
X-CSE-ConnectionGUID: 5itmRb8LRqCKybTStogR7g==
X-CSE-MsgGUID: ndC3Gef9QXCbkLzQUISWbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="76919857"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="76919857"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:56:22 -0700
X-CSE-ConnectionGUID: JfMddgR/SfWpVMZtY/118Q==
X-CSE-MsgGUID: Z1mdk+++Twqd/ExG3Kvmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="172175904"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:56:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 1/2] drm/xe: Never report L3 bank mask for media GT going
 forward
Date: Fri,  5 Sep 2025 14:56:15 -0700
Message-ID: <20250905215614.796247-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
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

We currently report an L3 bank mask as part of the GT topology on both
GTs (primary and media) because a copy of the L3 bank fuse register
exists on both GTs (e.g., $gsi_offset + 0x9130 on Xe3).  After recent
discussions it's come to light that the only known userspace software
that uses this part of the uapi (the compute UMD and Mesa) only uses the
value reported for the primary GT; the value reported for the media GT
is ignored by both projects, and the media UMDs don't have any use for
L3 information today.  Since we always strive to have our uapi match the
specific needs of userspace and not include additional unused baggage,
let's officially drop L3 bank reporting on the media GT going forward
and only keep it around for the primary GT where it actually gets used.
This change will only apply to future platforms (Xe3 and later); even
though it would probably be safe to remove it from Xe1/Xe2 as well, we
don't want to take any chances with changing existing ABI.

Note that we'd already disabled reading/reporting of the L3 bank for the
media GT on PTL in commit 9ab440a9d042 ("drm/xe/ptl: L3bank mask is not
available on the media GT") because it was discovered that the copy of
the fuse registers on the media GT were just reporting a bogus ~0 value
rather than an accurate mask.  So this is just extending that PTL
behavior forward to WCL and other future platforms.  Note that we're
also free to reinstate this part of the uapi in the future if/when some
new userspace consumer emerges that _does_ have a use for media-specific
L3 bank masks.

Cc: Fei Yang <fei.yang@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_topology.c | 31 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_gt_topology.h |  2 ++
 drivers/gpu/drm/xe/xe_query.c       |  5 +++--
 drivers/gpu/drm/xe/xe_wa_oob.rules  |  1 -
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 0ed7dc9044a5..4e61c5e39bcb 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -123,6 +123,21 @@ gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
 	}
 }
 
+bool xe_gt_topology_report_l3(struct xe_gt *gt)
+{
+	/*
+	 * No known userspace needs/uses the L3 bank mask reported by
+	 * the media GT, and the hardware itself is known to report bogus
+	 * values on several platforms.  Only report L3 bank mask as part
+	 * of the media GT's topology on pre-Xe3 platforms since that's
+	 * already part of our ABI.
+	 */
+	if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) >= 30)
+		return false;
+
+	return true;
+}
+
 static void
 load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 {
@@ -130,16 +145,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
 	struct xe_mmio *mmio = &gt->mmio;
 	u32 fuse3 = xe_mmio_read32(mmio, MIRROR_FUSE3);
 
-	/*
-	 * PTL platforms with media version 30.00 do not provide proper values
-	 * for the media GT's L3 bank registers.  Skip the readout since we
-	 * don't have any way to obtain real values.
-	 *
-	 * This may get re-described as an official workaround in the future,
-	 * but there's no tracking number assigned yet so we use a custom
-	 * OOB workaround descriptor.
-	 */
-	if (XE_GT_WA(gt, no_media_l3))
+	if (!xe_gt_topology_report_l3(gt))
 		return;
 
 	if (GRAPHICS_VER(xe) >= 30) {
@@ -276,8 +282,9 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_printer *p)
 	drm_printf(p, "EU type:             %s\n",
 		   eu_type_to_str(gt->fuse_topo.eu_type));
 
-	drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
-		   gt->fuse_topo.l3_bank_mask);
+	if (xe_gt_topology_report_l3(gt))
+		drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_BITS,
+			   gt->fuse_topo.l3_bank_mask);
 }
 
 /*
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index d95cdd6e45be..5e62f5949b7b 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -49,4 +49,6 @@ bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
 
 bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt);
 
+bool xe_gt_topology_report_l3(struct xe_gt *gt);
+
 #endif /* _XE_GT_TOPOLOGY_H_ */
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 4dbe5732cb7f..e1b603aba61b 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -21,6 +21,7 @@
 #include "xe_force_wake.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
+#include "xe_gt_topology.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_macros.h"
 #include "xe_mmio.h"
@@ -477,7 +478,7 @@ static size_t calc_topo_query_size(struct xe_device *xe)
 			sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss);
 
 		/* L3bank mask may not be available for some GTs */
-		if (!XE_GT_WA(gt, no_media_l3))
+		if (xe_gt_topology_report_l3(gt))
 			query_size += sizeof(struct drm_xe_query_topology_mask) +
 				sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask);
 	}
@@ -540,7 +541,7 @@ static int query_gt_topology(struct xe_device *xe,
 		 * mask, then it's better to omit L3 from the query rather than
 		 * reporting bogus or zeroed information to userspace.
 		 */
-		if (!XE_GT_WA(gt, no_media_l3)) {
+		if (xe_gt_topology_report_l3(gt)) {
 			topo.type = DRM_XE_TOPO_L3_BANK;
 			err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
 					sizeof(gt->fuse_topo.l3_bank_mask));
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 338c344dcd7d..f3a6d5d239ce 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -49,7 +49,6 @@
 16023588340	GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
 14019789679	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION_RANGE(1270, 2004)
-no_media_l3	MEDIA_VERSION_RANGE(3000, 3002)
 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
 16021333562	GRAPHICS_VERSION_RANGE(1200, 1274)
-- 
2.51.0

