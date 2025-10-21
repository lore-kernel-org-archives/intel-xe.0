Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EFECCD1A5
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 22:46:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D000510E665;
	Tue, 21 Oct 2025 22:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lW03ZPKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2338110E665
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 22:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761086766; x=1792622766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jKkUhVUCbOIskeOgB904tk/o/YvaY1HylIVgV4LmY4k=;
 b=lW03ZPKvj3Xg3tPYq7m1oPgk6gB937Hz0dF4eNvfuW+gs9JirbaM2fSn
 xa/wD5i/Rfnf/dpi41IIAPn26MkZ3TE5ILOmHAZQxHozQ0RApPg8ypYCX
 OZCPzuh49EK7t0s36AoLnO0E8ZiU9pxz3ZsJqePmSIbxl7kFYRrtqnPZo
 ZNMXlnMwvcBcyBdHg/7+LjcOxW4BblzZyUwv5eviu1eCn9mD2avna5i6r
 +r84rvWHt0u+9dgqOYmdVco8LNCKU1m/+Quv/F376YE3YcpUS0vZ3yEQZ
 NTvKc5Q60B4sijwubgWKVIhe+cAaw1QX4WODjph/YPt7SbSipNCXZFOQE A==;
X-CSE-ConnectionGUID: NsO+PD8nQyGLac1quj3E5Q==
X-CSE-MsgGUID: YChyEZIQSSiiOiKdWpWgHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63128909"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63128909"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:46:06 -0700
X-CSE-ConnectionGUID: z75mHB5TRB+2g1nkvZf6Ew==
X-CSE-MsgGUID: 0Yiz/EQJQ52aVHqfi25+Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; d="scan'208";a="187982627"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 15:46:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 2/2] drm/xe/xe3p_xpc: Add MCR steering for NODE and L3BANK
 ranges
Date: Tue, 21 Oct 2025 15:45:56 -0700
Message-ID: <20251021224556.437970-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021224556.437970-1-matthew.d.roper@intel.com>
References: <20251021224556.437970-1-matthew.d.roper@intel.com>
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

The bspec was originally missing the information related to steering of
L3-related ranges.  Now that a late-breaking spec update has added the
necessary information, implement the steering rules in the code.  Note
that the sole L3BANK range is the same as the one used on Xe_LPG, so we
can re-use the existing table for that MCR type.

Bspec: 74418
Fixes: be614ea19dad ("drm/xe/xe3p_xpc: Add MCR steering")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c      | 27 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_topology.c |  7 +++++++
 drivers/gpu/drm/xe/xe_gt_topology.h |  2 ++
 drivers/gpu/drm/xe/xe_gt_types.h    |  1 +
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 0b4b617d413b..42e764564ee3 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -268,6 +268,12 @@ static const struct xe_mmio_range xe3p_xpc_gam_grp1_steering_table[] = {
 	{},
 };
 
+static const struct xe_mmio_range xe3p_xpc_node_steering_table[] = {
+	{ 0x00B000, 0x00B0FF },
+	{ 0x00D880, 0x00D8FF },
+	{},
+};
+
 static const struct xe_mmio_range xe3p_xpc_instance0_steering_table[] = {
 	{ 0x00B500, 0x00B6FF },		/* PSMI */
 	{ 0x00C800, 0x00CFFF },		/* GAMCTRL */
@@ -277,9 +283,23 @@ static const struct xe_mmio_range xe3p_xpc_instance0_steering_table[] = {
 
 static void init_steering_l3bank(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_mmio *mmio = &gt->mmio;
 
-	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
+	if (GRAPHICS_VER(xe) >= 35) {
+		unsigned int first_bank = xe_l3_bank_mask_ffs(gt->fuse_topo.l3_bank_mask);
+		const int banks_per_node = 4;
+		const int nodes_per_grp = 2;
+		unsigned int node = first_bank / banks_per_node;
+
+		/* L3BANK ranges place node in grpID, bank in instanceid */
+		gt->steering[L3BANK].group_target = node;
+		gt->steering[L3BANK].instance_target = first_bank % banks_per_node;
+
+		/* NODE ranges split the node across grpid and instanceid */
+		gt->steering[NODE].group_target = node / nodes_per_grp;
+		gt->steering[NODE].instance_target = node % nodes_per_grp;
+	} else if (GRAPHICS_VERx100(xe) >= 1270) {
 		u32 mslice_mask = REG_FIELD_GET(MEML3_EN_MASK,
 						xe_mmio_read32(mmio, MIRROR_FUSE3));
 		u32 bank_mask = REG_FIELD_GET(GT_L3_EXC_MASK,
@@ -292,7 +312,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
 		gt->steering[L3BANK].group_target = __ffs(mslice_mask);
 		gt->steering[L3BANK].instance_target =
 			bank_mask & BIT(0) ? 0 : 2;
-	} else if (gt_to_xe(gt)->info.platform == XE_DG2) {
+	} else if (xe->info.platform == XE_DG2) {
 		u32 mslice_mask = REG_FIELD_GET(MEML3_EN_MASK,
 						xe_mmio_read32(mmio, MIRROR_FUSE3));
 		u32 bank = __ffs(mslice_mask) * 8;
@@ -458,6 +478,7 @@ static const struct {
 	void (*init)(struct xe_gt *gt);
 } xe_steering_types[] = {
 	[L3BANK] =	{ "L3BANK",	init_steering_l3bank },
+	[NODE] =	{ "NODE",	NULL }, /* initialized by l3bank init */
 	[MSLICE] =	{ "MSLICE",	init_steering_mslice },
 	[LNCF] =	{ "LNCF",	NULL }, /* initialized by mslice init */
 	[DSS] =		{ "DSS / XeCore", init_steering_dss },
@@ -512,6 +533,8 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
 			gt->steering[DSS].ranges = xe3p_xpc_xecore_steering_table;
 			gt->steering[GAM1].ranges = xe3p_xpc_gam_grp1_steering_table;
 			gt->steering[INSTANCE0].ranges = xe3p_xpc_instance0_steering_table;
+			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
+			gt->steering[NODE].ranges = xe3p_xpc_node_steering_table;
 		} else if (GRAPHICS_VER(xe) >= 20) {
 			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
 			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index 1e0516ba7422..bd5260221d8d 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -309,6 +309,13 @@ xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum)
 	return find_next_bit(mask, XE_MAX_DSS_FUSE_BITS, groupnum * groupsize);
 }
 
+/* Used to obtain the index of the first L3 bank. */
+unsigned int
+xe_l3_bank_mask_ffs(const xe_l3_bank_mask_t mask)
+{
+	return find_first_bit(mask, XE_MAX_L3_BANK_MASK_BITS);
+}
+
 /**
  * xe_gt_topology_has_dss_in_quadrant - check fusing of DSS in GT quadrant
  * @gt: GT to check
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
index 3ff40f44bf2a..162d603c9b81 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.h
+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
@@ -40,6 +40,8 @@ xe_gt_topology_mask_last_dss(const xe_dss_mask_t mask)
 
 unsigned int
 xe_dss_mask_group_ffs(const xe_dss_mask_t mask, int groupsize, int groupnum);
+unsigned int
+xe_l3_bank_mask_ffs(const xe_l3_bank_mask_t mask);
 
 bool
 xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 6e9c84b33b60..0b525643a048 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -66,6 +66,7 @@ struct xe_mmio_range {
  */
 enum xe_steering_type {
 	L3BANK,
+	NODE,
 	MSLICE,
 	LNCF,
 	DSS,
-- 
2.51.0

