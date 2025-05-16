Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763A3C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 18:09:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBEB10EB61;
	Fri, 16 May 2025 18:09:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKmsD5eX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD5310EB61
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 18:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747418968; x=1778954968;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=meyjFS/2F0BjsMvdF73lCrSf4D5JcTJ3/ukeGZc6RCY=;
 b=AKmsD5eXuxM+D3/nmKHTAELBPPyIdLXXjmayfgredwBS0OUcPlnPcnnF
 0192ccxVAob/ioYENBdcShgDbD7hcwmz2Vwv1B4I532g0YBEDgdrYkp3G
 +knJVSRMe4JBydi5guuJd9Q7wo21X/o95TZdj+xWmXcLjyOZysVcSVCj3
 HTD9pJk6uIDkF80idITFU+RxOdZkUy+QvTDtBB6AXX3bPeep/d00g2P6L
 XxkXI6CLBfrqpfS/8GeQLSLg8KF+wbVPHkqjuPBddc25pFeZeRiCQl1l6
 ZbKWkcvjcZdUMBR8Oe/ypajRTAWFSUUh8k4ak+xGsIK8nvfY2Ammz/ybV A==;
X-CSE-ConnectionGUID: HmnJ3VIQRrKtsPOLD/bv0A==
X-CSE-MsgGUID: djTVlQo3RjejsvgNVdo0yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60740355"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60740355"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:09:27 -0700
X-CSE-ConnectionGUID: FHYqkxWYQJKumfJDc3is6w==
X-CSE-MsgGUID: KrQcCy1GR4ehRmQM7HpXzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="139777991"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 11:09:27 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH] drm/xe/oa: Expose media OA units
Date: Fri, 16 May 2025 11:09:13 -0700
Message-ID: <20250516180913.2072293-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

On Xe2+ platforms, media engines are attached to "SCMI" OA media (OAM)
units. One or two SCMI OAM units might be present on a platform. In
addition there is another OAM unit for global events, called
OAM-SAG. Performance metrics for media workloads can be obtained from these
OAM units, similar to OAG.

Expose these OAM units for userspace to use. OAM-SAG is exposed as an OA
unit without any attached engines.

Bspec: 70819, 67103, 63844, 72572, 74476, 61284

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_oa.c | 83 ++++++++++++++++++++++++++++++++------
 1 file changed, 71 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
index fb842fa0552e5..4fa94b3624146 100644
--- a/drivers/gpu/drm/xe/xe_oa.c
+++ b/drivers/gpu/drm/xe/xe_oa.c
@@ -43,6 +43,12 @@
 #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
 #define XE_OA_UNIT_INVALID U32_MAX
 
+enum xe_oam_unit_type {
+	XE_OAM_UNIT_SAG,
+	XE_OAM_UNIT_SCMI_0,
+	XE_OAM_UNIT_SCMI_1,
+};
+
 enum xe_oa_submit_deps {
 	XE_OA_SUBMIT_NO_DEPS,
 	XE_OA_SUBMIT_ADD_DEPS,
@@ -2448,20 +2454,34 @@ int xe_oa_register(struct xe_device *xe)
 
 static u32 num_oa_units_per_gt(struct xe_gt *gt)
 {
-	return 1;
+	if (!xe_gt_is_media_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
+		return 1;
+	else if (!IS_DGFX(gt_to_xe(gt)))
+		return XE_OAM_UNIT_SCMI_0 + 1; /* SAG + SCMI_0 */
+	else
+		return XE_OAM_UNIT_SCMI_1 + 1; /* SAG + SCMI_0 + SCMI_1 */
 }
 
 static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
 {
-	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
-		/*
-		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
-		 * within the gt use the same OAM. All MTL/LNL SKUs list 1 SA MEDIA
-		 */
-		xe_gt_WARN_ON(hwe->gt, hwe->gt->info.type != XE_GT_TYPE_MEDIA);
+	xe_gt_WARN_ON(hwe->gt, !xe_gt_is_media_type(hwe->gt));
 
+	if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 20)
 		return 0;
-	}
+	/*
+	 * XE_OAM_UNIT_SAG has only GSCCS attached to it, but only on some platforms. Also
+	 * GSCCS cannot be used to submit batches to program the OAM unit. Therefore we don't
+	 * assign an OA unit to GSCCS. This means that XE_OAM_UNIT_SAG is exposed as an OA
+	 * unit without attached engines. However OA streams can still be opened on it.
+	 */
+	else if (hwe->engine_id == XE_HW_ENGINE_GSCCS0)
+		return XE_OA_UNIT_INVALID;
+	else if (!IS_DGFX(gt_to_xe(hwe->gt)))
+		return XE_OAM_UNIT_SCMI_0;
+	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE)
+		return (hwe->instance / 2 & 0x1) + 1;
+	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
+		return (hwe->instance & 0x1) + 1;
 
 	return XE_OA_UNIT_INVALID;
 }
@@ -2475,6 +2495,7 @@ static u32 __hwe_oa_unit(struct xe_hw_engine *hwe)
 
 	case XE_ENGINE_CLASS_VIDEO_DECODE:
 	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+	case XE_ENGINE_CLASS_OTHER:
 		return __hwe_oam_unit(hwe);
 
 	default:
@@ -2514,17 +2535,23 @@ static struct xe_oa_regs __oag_regs(void)
 
 static void __xe_oa_init_oa_units(struct xe_gt *gt)
 {
-	const u32 mtl_oa_base[] = { 0x13000 };
+	/* Actual address is MEDIA_GT_GSI_OFFSET + oam_base_addr[i] */
+	const u32 oam_base_addr[] = {
+		[XE_OAM_UNIT_SAG]    = 0x13000,
+		[XE_OAM_UNIT_SCMI_0] = 0x14000,
+		[XE_OAM_UNIT_SCMI_1] = 0x14800,
+	};
 	int i, num_units = gt->oa.num_oa_units;
 
 	for (i = 0; i < num_units; i++) {
 		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
 
-		if (gt->info.type != XE_GT_TYPE_MEDIA) {
+		if (!xe_gt_is_media_type(gt)) {
 			u->regs = __oag_regs();
 			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
-		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
-			u->regs = __oam_regs(mtl_oa_base[i]);
+		} else {
+			xe_gt_assert(gt, GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270);
+			u->regs = __oam_regs(oam_base_addr[i]);
 			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
 		}
 
@@ -2574,17 +2601,49 @@ static int xe_oa_init_gt(struct xe_gt *gt)
 	return 0;
 }
 
+static void xe_oa_print_oa_units(struct xe_oa *oa)
+{
+	enum xe_hw_engine_id hwe_id;
+	struct xe_hw_engine *hwe;
+	struct xe_oa_unit *u;
+	struct xe_gt *gt;
+	int gt_id, i, n;
+	char buf[256];
+
+	for_each_gt(gt, oa->xe, gt_id) {
+		for (i = 0; i < gt->oa.num_oa_units; i++) {
+			u = &gt->oa.oa_unit[i];
+			buf[0] = '\0';
+			n = 0;
+
+			for_each_hw_engine(hwe, gt, hwe_id)
+				if (xe_oa_unit_id(hwe) == u->oa_unit_id)
+					n += scnprintf(buf + n, sizeof(buf) - n, "%s ", hwe->name);
+
+			xe_gt_dbg(gt, "oa_unit %d, type %d, Engines: %s\n",
+				  u->oa_unit_id, u->type, buf);
+		}
+	}
+}
+
 static int xe_oa_init_oa_units(struct xe_oa *oa)
 {
 	struct xe_gt *gt;
 	int i, ret;
 
+	/* Needed for OAM implemenation here */
+	BUILD_BUG_ON(XE_OAM_UNIT_SAG != 0);
+	BUILD_BUG_ON(XE_OAM_UNIT_SCMI_0 != 1);
+	BUILD_BUG_ON(XE_OAM_UNIT_SCMI_1 != 2);
+
 	for_each_gt(gt, oa->xe, i) {
 		ret = xe_oa_init_gt(gt);
 		if (ret)
 			return ret;
 	}
 
+	xe_oa_print_oa_units(oa);
+
 	return 0;
 }
 
-- 
2.48.1

