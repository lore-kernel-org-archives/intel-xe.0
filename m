Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D25DC282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 20:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA94E10ED2E;
	Fri, 28 Feb 2025 20:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqpdBicd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B8E10ED3D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 20:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740772977; x=1772308977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HsMyFOL0Cx/raXaRMfpimU+sXEavTcaoo7RyC8fiuVY=;
 b=HqpdBicdVduj6hg19N/0Ed/hghh1hfmWnKyNcc+mBUcbW9B0lQf5AUgl
 q4ARGnNHcLZXWh6bZDMPXW0Sc3xEDCLVh/A1x56zkZ5lLnyEbthUU6F2a
 lh350943RXY7mA4MhyfmS7pU1L9e41RWPiLhXo9tHpRHloMKujcXfdqrc
 AshOUnvwY9Gf2enb0JkyS60gds+HodBfBRaX/Ag+vOAuF01b78SMMSoA0
 0JymjUxx3k4Oh2/cVJgS6i6qYQXGBbLluL9ycRMMOPjF3AQCCZMx1McFd
 loQ73wnY4YT9twXu6zKb2GMjrIPSitVQsdCyjNppMCscACVRxozwFUYQ0 g==;
X-CSE-ConnectionGUID: OyCRD7HBSESu1twwYu7quQ==
X-CSE-MsgGUID: wh0RgunyQb2N+Eb9Zu3nmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41737752"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="41737752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 12:02:57 -0800
X-CSE-ConnectionGUID: jlnjnM17Ql6pLN0F2uQK9A==
X-CSE-MsgGUID: GTtij/i+SXqnSU0FBF5S4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="148236203"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 12:02:57 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH 2/2] drm/xe/vf: Fix guc_info debugfs for VFs
Date: Fri, 28 Feb 2025 12:02:46 -0800
Message-ID: <20250228200246.3117410-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228200246.3117410-1-daniele.ceraolospurio@intel.com>
References: <20250228200246.3117410-1-daniele.ceraolospurio@intel.com>
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

There are 2 issues with the guc_info debugfs when using it from a VF:

1 - We report a GuC binary path and a GuC release version as wanted, but
    the VF actually wants a compatibility version and no specific binary

2 - We attempt to read a bunch of registers that the VFs doesn't have
    access to.

Fix #1 by setting the VF expected value during handshake and #2 by not
accessing those registers if VF. The output of the debugfs changes from:

GuC firmware: xe/ptl_guc_70.38.1.bin
	status: PRELOADED
	wanted release version 70.38.1
	found compatibility version 1.18.1

to:

GuC firmware: Loaded by PF
	status: PRELOADED
	wanted compatibility version 1.2.0
	found compatibility version 1.18.1

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  9 ++++++
 drivers/gpu/drm/xe/xe_guc.c         | 44 +++++++++++++++--------------
 drivers/gpu/drm/xe/xe_uc_fw.c       |  8 +++++-
 3 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index eeccbf4cb4b4..751e6a9a26cb 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -154,6 +154,13 @@ static void vf_wanted_guc_version(struct xe_gt *gt, struct xe_uc_fw_version *ver
 	return vf_minimum_guc_version(gt, ver);
 }
 
+static void set_guc_wanted_version(struct xe_guc *guc, struct xe_uc_fw_version *wanted)
+{
+	guc->fw.path = "Loaded by PF";
+	guc->fw.versions.wanted_type = XE_UC_FW_VER_COMPATIBILITY;
+	memcpy(&guc->fw.versions.wanted, wanted, sizeof(struct xe_uc_fw_version));
+}
+
 static int vf_handshake_with_guc(struct xe_gt *gt)
 {
 	struct xe_guc *guc = &gt->uc.guc;
@@ -172,6 +179,8 @@ static int vf_handshake_with_guc(struct xe_gt *gt)
 	} else {
 		vf_wanted_guc_version(gt, &wanted);
 		xe_gt_assert(gt, wanted.major != GUC_VERSION_MAJOR_ANY);
+
+		set_guc_wanted_version(guc, &wanted);
 	}
 
 	err = guc_action_match_version(guc, &wanted, &found);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index bc1ff0a4e1e7..fdd6e90c1258 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1516,30 +1516,32 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 
 	xe_uc_fw_print(&guc->fw, p);
 
-	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (!fw_ref)
-		return;
+	if (!IS_SRIOV_VF(gt_to_xe(gt))) {
+		fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		if (!fw_ref)
+			return;
+
+		status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
+
+		drm_printf(p, "\nGuC status 0x%08x:\n", status);
+		drm_printf(p, "\tBootrom status = 0x%x\n",
+			REG_FIELD_GET(GS_BOOTROM_MASK, status));
+		drm_printf(p, "\tuKernel status = 0x%x\n",
+			REG_FIELD_GET(GS_UKERNEL_MASK, status));
+		drm_printf(p, "\tMIA Core status = 0x%x\n",
+			REG_FIELD_GET(GS_MIA_MASK, status));
+		drm_printf(p, "\tLog level = %d\n",
+			xe_guc_log_get_level(&guc->log));
+
+		drm_puts(p, "\nScratch registers:\n");
+		for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
+			drm_printf(p, "\t%2d: \t0x%x\n",
+				i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
+		}
 
-	status = xe_mmio_read32(&gt->mmio, GUC_STATUS);
-
-	drm_printf(p, "\nGuC status 0x%08x:\n", status);
-	drm_printf(p, "\tBootrom status = 0x%x\n",
-		   REG_FIELD_GET(GS_BOOTROM_MASK, status));
-	drm_printf(p, "\tuKernel status = 0x%x\n",
-		   REG_FIELD_GET(GS_UKERNEL_MASK, status));
-	drm_printf(p, "\tMIA Core status = 0x%x\n",
-		   REG_FIELD_GET(GS_MIA_MASK, status));
-	drm_printf(p, "\tLog level = %d\n",
-		   xe_guc_log_get_level(&guc->log));
-
-	drm_puts(p, "\nScratch registers:\n");
-	for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
-		drm_printf(p, "\t%2d: \t0x%x\n",
-			   i, xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(i)));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
 	}
 
-	xe_force_wake_put(gt_to_fw(gt), fw_ref);
-
 	drm_puts(p, "\n");
 	xe_guc_ct_print(&guc->ct, p, false);
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 18e06ee9e23f..b9c32f5a8715 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -234,6 +234,10 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	entries = blobs_all[uc_fw->type].entries;
 	count = blobs_all[uc_fw->type].count;
 
+	/* For VFs the GuC path and wanted version are set during the handshake */
+	if (uc_fw->path)
+		return;
+
 	for (i = 0; i < count && p <= entries[i].platform; i++) {
 		if (p == entries[i].platform) {
 			uc_fw->path = entries[i].path;
@@ -663,7 +667,9 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
 	 */
 	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
 	xe_assert(xe, !uc_fw->status);
-	xe_assert(xe, !uc_fw->path);
+
+	/* For VFs the GuC path is set during the handshake */
+	xe_assert(xe, IS_SRIOV_VF(xe) || !uc_fw->path);
 
 	uc_fw_auto_select(xe, uc_fw);
 
-- 
2.43.0

