Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E967DCCD197
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F45710E508;
	Mon, 13 Oct 2025 20:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="db7kCU+D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8095810E503
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760386201; x=1791922201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N9Rrm2zCR+80YjFD8wxQUQ0YohiwkySNvYPNipSHjA8=;
 b=db7kCU+DD8gwGhoKOivgb96JX/79ypkTnAe2q7PRUWDdtvA5RF1LSh0N
 t9Eq38wQ4RJexZc2U0Zwvb/EwaN4OqLO/gP6TmLtcNTao9MWzEyTm9O9M
 JZIQk8UAopenMVD/4D0JvyqrpH2p718xb/AZ/Hr7VxFjZA5L7fMSNnh8v
 RlXs8MGINpmSNMofe01WFoSb00LDenAeAxIedkj/Eu3zgEEVHvULHnR6y
 5pByZtntu02JXbdg2chb+lvwXmdAJwT7f/AHa9zKDHciSVNLEcwsJtFNK
 8rJl9rSVsagATsm18u92O0c79LhDr0/D23AzHWAHGpr4FntfYnj8YKGWT A==;
X-CSE-ConnectionGUID: ARcis0JLQ0KmSBep52Yj2Q==
X-CSE-MsgGUID: otDPa70DRK2Y8spy3Ej7Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72800532"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72800532"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:01 -0700
X-CSE-ConnectionGUID: hxzF19y6R0iGqq2wRTpWEQ==
X-CSE-MsgGUID: VhtPfcAJQ1qjweLTE3lUbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="185707543"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:10:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v5 07/23] drm/xe: Read VF GMD_ID with a specifically-allocated
 dummy GT
Date: Mon, 13 Oct 2025 13:09:50 -0700
Message-ID: <20251013200944.2499947-32-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013200944.2499947-25-matthew.d.roper@intel.com>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
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

SRIOV VF initialization has a bit of a chicken and egg design problem.
Determining the IP version of the graphics and media IPs can't be done
via direct register reads as it is on PF or native and instead requires
querying the GuC.  However initialization of the GT, including its GuC,
needs to wait until after we know the IP versions so that the proper
initialization steps for the platform/IP are followed.

Currently the (somewhat hacky) solution is to manually fill out just
enough fields in tile 0's primary GT structure to make it look as if the
GT has been initialized so that the GuC can be partially initialized and
queried to obtain the GMD_ID values.  When the GT gets properly
initialized during the regular flows, the hacked-up values will get
overwritten as part of the general initialization flows.

Rather than using tile 0's primary GT structure to hold the hacked up
values for querying every GT on every tile, instead allocate a dedicated
dummy structure.  This will allow us to move the tile->primary_gt's
allocation to a more consistent place later in the initialization flow
in future patches (i.e., we shouldn't even allocate this GT structure if
the GT is disabled/unavailable).  It also helps ensure there can't be
any accidental leakage of initialization or state between the dummy
initialization for GMD_ID and the real driver initialization of the GT.

v2:
 - Initialize gt->tile for temporary GT.  (CI, Michal)
 - Use scope-based cleanup handler to free temp GT.  (Michal)
 - Propagate actual error code from xe_gt_sriov_vf_bootstrap() rather
   than just setting IP version to 0.0 now that read_gmdid() can return
   an error.  (Michal)
v3:
 - Explicitly initialize gt to NULL, just in case something else gets
   inserted before the kzalloc() in the future.  (Lucas)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  6 ++-
 drivers/gpu/drm/xe/xe_pci.c       | 70 ++++++++++++++++++-------------
 2 files changed, 45 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 69e2840c7ef0..0b1401b88cb8 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -307,8 +307,8 @@ const void *xe_pci_id_gen_param(struct kunit *test, const void *prev, char *desc
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_id_gen_param);
 
-static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
-			    u32 *ver, u32 *revid)
+static int fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
+			   u32 *ver, u32 *revid)
 {
 	struct kunit *test = kunit_get_current_test();
 	struct xe_pci_fake_data *data = test->priv;
@@ -320,6 +320,8 @@ static void fake_read_gmdid(struct xe_device *xe, enum xe_gmdid_type type,
 		*ver = data->graphics_verx100;
 		*revid = xe_step_to_gmdid(data->step.graphics);
 	}
+
+	return 0;
 }
 
 static void fake_xe_info_probe_tile_count(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 076d944cce6a..7fb960b61bf4 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -466,7 +466,7 @@ enum xe_gmdid_type {
 	GMDID_MEDIA
 };
 
-static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
+static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct xe_reg gmdid_reg = GMD_ID;
@@ -475,22 +475,24 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
 
 	if (IS_SRIOV_VF(xe)) {
-		struct xe_gt *gt = xe_root_mmio_gt(xe);
-
 		/*
 		 * To get the value of the GMDID register, VFs must obtain it
 		 * from the GuC using MMIO communication.
 		 *
-		 * Note that at this point the xe_gt is not fully uninitialized
-		 * and only basic access to MMIO registers is possible. To use
-		 * our existing GuC communication functions we must perform at
-		 * least basic xe_gt and xe_guc initialization.
-		 *
-		 * Since to obtain the value of GMDID_MEDIA we need to use the
-		 * media GuC, temporarily tweak the gt type.
+		 * Note that at this point the GTs are not initialized and only
+		 * tile-level access to MMIO registers is possible. To use our
+		 * existing GuC communication functions we must create a dummy
+		 * GT structure and perform at least basic xe_gt and xe_guc
+		 * initialization.
 		 */
-		xe_gt_assert(gt, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
+		struct xe_gt *gt __free(kfree) = NULL;
+		int err;
 
+		gt = kzalloc(sizeof(*gt), GFP_KERNEL);
+		if (!gt)
+			return -ENOMEM;
+
+		gt->tile = &xe->tiles[0];
 		if (type == GMDID_MEDIA) {
 			gt->info.id = 1;
 			gt->info.type = XE_GT_TYPE_MEDIA;
@@ -502,15 +504,11 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 		xe_gt_mmio_init(gt);
 		xe_guc_comm_init_early(&gt->uc.guc);
 
-		/* Don't bother with GMDID if failed to negotiate the GuC ABI */
-		val = xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_vf_gmdid(gt);
+		err = xe_gt_sriov_vf_bootstrap(gt);
+		if (err)
+			return err;
 
-		/*
-		 * Only undo xe_gt.info here, the remaining changes made above
-		 * will be overwritten as part of the regular initialization.
-		 */
-		gt->info.id = 0;
-		gt->info.type = XE_GT_TYPE_UNINITIALIZED;
+		val = xe_gt_sriov_vf_gmdid(gt);
 	} else {
 		/*
 		 * GMD_ID is a GT register, but at this point in the driver
@@ -528,6 +526,8 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 
 	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
 	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
+
+	return 0;
 }
 
 static const struct xe_ip *find_graphics_ip(unsigned int verx100)
@@ -554,18 +554,21 @@ static const struct xe_ip *find_media_ip(unsigned int verx100)
  * Read IP version from hardware and select graphics/media IP descriptors
  * based on the result.
  */
-static void handle_gmdid(struct xe_device *xe,
-			 const struct xe_ip **graphics_ip,
-			 const struct xe_ip **media_ip,
-			 u32 *graphics_revid,
-			 u32 *media_revid)
+static int handle_gmdid(struct xe_device *xe,
+			const struct xe_ip **graphics_ip,
+			const struct xe_ip **media_ip,
+			u32 *graphics_revid,
+			u32 *media_revid)
 {
 	u32 ver;
+	int ret;
 
 	*graphics_ip = NULL;
 	*media_ip = NULL;
 
-	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
+	ret = read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
+	if (ret)
+		return ret;
 
 	*graphics_ip = find_graphics_ip(ver);
 	if (!*graphics_ip) {
@@ -573,16 +576,21 @@ static void handle_gmdid(struct xe_device *xe,
 			ver / 100, ver % 100);
 	}
 
-	read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
+	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
+	if (ret)
+		return ret;
+
 	/* Media may legitimately be fused off / not present */
 	if (ver == 0)
-		return;
+		return 0;
 
 	*media_ip = find_media_ip(ver);
 	if (!*media_ip) {
 		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
 			ver / 100, ver % 100);
 	}
+
+	return 0;
 }
 
 /*
@@ -693,6 +701,7 @@ static int xe_info_init(struct xe_device *xe,
 	const struct xe_media_desc *media_desc;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
+	int ret;
 	u8 id;
 
 	/*
@@ -708,8 +717,11 @@ static int xe_info_init(struct xe_device *xe,
 		xe->info.step = xe_step_pre_gmdid_get(xe);
 	} else {
 		xe_assert(xe, !desc->pre_gmdid_media_ip);
-		handle_gmdid(xe, &graphics_ip, &media_ip,
-			     &graphics_gmdid_revid, &media_gmdid_revid);
+		ret = handle_gmdid(xe, &graphics_ip, &media_ip,
+				   &graphics_gmdid_revid, &media_gmdid_revid);
+		if (ret)
+			return ret;
+
 		xe->info.step = xe_step_gmdid_get(xe,
 						  graphics_gmdid_revid,
 						  media_gmdid_revid);
-- 
2.51.0

