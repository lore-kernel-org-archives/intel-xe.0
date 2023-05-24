Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB35C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 18:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC7610E55F;
	Wed, 24 May 2023 18:59:56 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFE110E55F
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684954794; x=1716490794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EEEKyYhhF4ra/zYbSgQj5ycV8kZoZ3tO+8xIb6AHCf0=;
 b=mM736LCetyK2QhIePTvOedKGDMm/UlTYvk91ATxLsFFMsnOh/BqnsrQb
 NhhzDI+ljBgyNF7C2RRHQM2jGowu+m6kpy4YTtp6X/6i01y5WT7UNp2tM
 hQvJ1u4tE+Ibs7Sj5IM4XEBvBQmUAMX9RTJQtyqrTH7+q1EmBuwy/ZuuY
 L2N04PZCO7PM0NXDRUpzgzh8WaAgAN5kiNNmpCTmNflvkxNsN4xlvxLsl
 9ceplzlPzY5GSlgTuoiDEBApBs93+ySwLXB/dapjQE+Um1MuEVRlW2UKa
 puFP+G0NN3ltrhAyapbgSVEnPKTTHBAvOtOESsaHdV/KT8QnO31FdmsO6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343125651"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="343125651"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 11:59:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="769578761"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="769578761"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 11:59:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 24 May 2023 11:59:52 -0700
Message-Id: <20230524185952.666158-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524175529.662592-1-matthew.d.roper@intel.com>
References: <20230524175529.662592-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI v3] drm/xe: Add stepping support for GMD_ID platforms
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

For platforms with GMD_ID registers, the IP stepping should be
determined from the 'revid' field of those registers rather than from
the PCI revid.

The hardware teams have indicated that they plan to keep the revid =>
stepping mapping consistent across all GMD_ID platforms, with major
steppings (A0, B0, C0, etc.) having revids that are multiples of 4, and
minor steppings (A1, A2, A3, etc.) taking the intermediate values.  For
now we'll trust that hardware follows through on this plan; if they have
to change direction in the future (e.g., they wind up needing something
like an "A4" that doesn't fit this scheme), we can add a GMD_ID-based
lookup table when the time comes.

v2:
 - Set xe->info.platform before finding stepping; the pre-GMD_ID code
   relies on this value to pick a lookup table.
v3:
 - Also set xe->info.subplatform before picking the stepping for
   pre-GMD_ID lookup.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Link: https://lore.kernel.org/r/20230523234026.195301-1-matthew.d.roper@intel.com
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +-
 drivers/gpu/drm/xe/xe_pci.c          | 28 +++++++++++------
 drivers/gpu/drm/xe/xe_step.c         | 45 +++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_step.h         |  5 +++-
 drivers/gpu/drm/xe/xe_step_types.h   | 13 ++++----
 5 files changed, 74 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 4d87f1fe010d..e64e5c0733d6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -24,7 +24,7 @@
 #define GMD_ID					XE_REG(0xd8c)
 #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
 #define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
-#define   GMD_ID_STEP				REG_GENMASK(5, 0)
+#define   GMD_ID_REVID				REG_GENMASK(5, 0)
 
 #define FORCEWAKE_ACK_GT_MTL			XE_REG(0xdfc)
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 2d0d50dcd396..d8f1213ae1d6 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -459,11 +459,14 @@ static void handle_pre_gmdid(struct xe_device *xe,
 static void handle_gmdid(struct xe_device *xe,
 			 const struct xe_device_desc *desc,
 			 const struct xe_graphics_desc **graphics,
-			 const struct xe_media_desc **media)
+			 const struct xe_media_desc **media,
+			 u32 *graphics_revid,
+			 u32 *media_revid)
 {
 	u32 ver;
 
 	ver = peek_gmdid(xe, GMD_ID.addr);
+	*graphics_revid = REG_FIELD_GET(GMD_ID_REVID, ver);
 	for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
 		if (ver == graphics_ip_map[i].ver) {
 			xe->info.graphics_verx100 = ver;
@@ -479,6 +482,7 @@ static void handle_gmdid(struct xe_device *xe,
 	}
 
 	ver = peek_gmdid(xe, GMD_ID.addr + 0x380000);
+	*media_revid = REG_FIELD_GET(GMD_ID_REVID, ver);
 	for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
 		if (ver == media_ip_map[i].ver) {
 			xe->info.media_verx100 = ver;
@@ -501,19 +505,30 @@ static int xe_info_init(struct xe_device *xe,
 {
 	const struct xe_graphics_desc *graphics_desc = NULL;
 	const struct xe_media_desc *media_desc = NULL;
+	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
 	struct xe_gt *gt;
 	u8 id;
 
+	xe->info.platform = desc->platform;
+	xe->info.subplatform = subplatform_desc ?
+		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
+
 	/*
 	 * If this platform supports GMD_ID, we'll detect the proper IP
 	 * descriptor to use from hardware registers. desc->graphics will only
 	 * ever be set at this point for platforms before GMD_ID. In that case
 	 * the IP descriptions and versions are simply derived from that.
 	 */
-	if (desc->graphics)
+	if (desc->graphics) {
 		handle_pre_gmdid(xe, desc, &graphics_desc, &media_desc);
-	else
-		handle_gmdid(xe, desc, &graphics_desc, &media_desc);
+		xe->info.step = xe_step_pre_gmdid_get(xe);
+	} else {
+		handle_gmdid(xe, desc, &graphics_desc, &media_desc,
+			     &graphics_gmdid_revid, &media_gmdid_revid);
+		xe->info.step = xe_step_gmdid_get(xe,
+						  graphics_gmdid_revid,
+						  media_gmdid_revid);
+	}
 
 	/*
 	 * If we couldn't detect the graphics IP, that's considered a fatal
@@ -524,7 +539,6 @@ static int xe_info_init(struct xe_device *xe,
 		return -ENODEV;
 
 	xe->info.is_dgfx = desc->is_dgfx;
-	xe->info.platform = desc->platform;
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_4tile = desc->has_4tile;
@@ -555,10 +569,6 @@ static int xe_info_init(struct xe_device *xe,
 	if (MEDIA_VER(xe) >= 13)
 		xe->info.tile_count++;
 
-	xe->info.subplatform = subplatform_desc ?
-		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
-	xe->info.step = xe_step_get(xe);
-
 	for (id = 0; id < xe->info.tile_count; ++id) {
 		gt = xe->gt + id;
 		gt->info.id = id;
diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
index a443d9bd7bbb..1baf79ba02ad 100644
--- a/drivers/gpu/drm/xe/xe_step.c
+++ b/drivers/gpu/drm/xe/xe_step.c
@@ -107,7 +107,14 @@ static const int pvc_basedie_subids[] = {
 
 __diag_pop();
 
-struct xe_step_info xe_step_get(struct xe_device *xe)
+/**
+ * xe_step_pre_gmdid_get - Determine IP steppings from PCI revid
+ * @xe: Xe device
+ *
+ * Convert the PCI revid into proper IP steppings.  This should only be
+ * used on platforms that do not have GMD_ID support.
+ */
+struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe)
 {
 	const struct xe_step_info *revids = NULL;
 	struct xe_step_info step = {};
@@ -198,6 +205,42 @@ struct xe_step_info xe_step_get(struct xe_device *xe)
 	return step;
 }
 
+/**
+ * xe_step_gmdid_get - Determine IP steppings from GMD_ID revid fields
+ * @xe: Xe device
+ * @graphics_gmdid_revid: value of graphics GMD_ID register's revid field
+ * @media_gmdid_revid: value of media GMD_ID register's revid field
+ *
+ * Convert the revid fields of the GMD_ID registers into proper IP steppings.
+ *
+ * GMD_ID revid values are currently expected to have consistent meanings on
+ * all platforms:  major steppings (A0, B0, etc.) are 4 apart, with minor
+ * steppings (A1, A2, etc.) taking the values in between.
+ */
+struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
+				      u32 graphics_gmdid_revid,
+				      u32 media_gmdid_revid)
+{
+	struct xe_step_info step = {
+		.graphics = STEP_A0 + graphics_gmdid_revid,
+		.media = STEP_A0 + media_gmdid_revid,
+	};
+
+	if (step.graphics >= STEP_FUTURE) {
+		step.graphics = STEP_FUTURE;
+		drm_dbg(&xe->drm, "Graphics GMD_ID revid value %d treated as future stepping\n",
+			graphics_gmdid_revid);
+	}
+
+	if (step.media >= STEP_FUTURE) {
+		step.media = STEP_FUTURE;
+		drm_dbg(&xe->drm, "Media GMD_ID revid value %d treated as future stepping\n",
+			graphics_gmdid_revid);
+	}
+
+	return step;
+}
+
 #define STEP_NAME_CASE(name)	\
 	case STEP_##name:	\
 		return #name;
diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
index 0c596c8579fb..a384b640f2af 100644
--- a/drivers/gpu/drm/xe/xe_step.h
+++ b/drivers/gpu/drm/xe/xe_step.h
@@ -12,7 +12,10 @@
 
 struct xe_device;
 
-struct xe_step_info xe_step_get(struct xe_device *xe);
+struct xe_step_info xe_step_pre_gmdid_get(struct xe_device *xe);
+struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
+				      u32 graphics_gmdid_revid,
+				      u32 media_gmdid_revid);
 const char *xe_step_name(enum xe_step step);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_step_types.h b/drivers/gpu/drm/xe/xe_step_types.h
index b7859f9647ca..ccc9b4795e95 100644
--- a/drivers/gpu/drm/xe/xe_step_types.h
+++ b/drivers/gpu/drm/xe/xe_step_types.h
@@ -21,21 +21,20 @@ struct xe_step_info {
 	func(A0)			\
 	func(A1)			\
 	func(A2)			\
+	func(A3)			\
 	func(B0)			\
 	func(B1)			\
 	func(B2)			\
 	func(B3)			\
 	func(C0)			\
 	func(C1)			\
+	func(C2)			\
+	func(C3)			\
 	func(D0)			\
 	func(D1)			\
-	func(E0)			\
-	func(F0)			\
-	func(G0)			\
-	func(H0)			\
-	func(I0)			\
-	func(I1)			\
-	func(J0)
+	func(D2)			\
+	func(D3)			\
+	func(E0)
 
 /*
  * Symbolic steppings that do not match the hardware. These are valid both as gt
-- 
2.40.1

