Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED33CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BEA10E080;
	Tue, 30 Sep 2025 22:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mh9kXBVx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCE010E2E1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272993; x=1790808993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HzMbraSmW8/7YgC19yUA031kMJPV5oOh6HqpXvA1ftI=;
 b=Mh9kXBVxYx1Bta1KoZhmhofXvkf7skoNZ2vfhAUtEFuUGy8VBUgisMQx
 bFOT3NGF4jDQLeCqLJY35tzUNZP1LG2kwQveQLuH+no7oXerD6Jl9ufpO
 aWaxqfEfvv49V+MsunxTQgVwmV8wPrFob9gYp6Ke7foE6RjscUObqkUQF
 DRCrrNwfS51aC7BRgkTSsDVM2e6Rlu9kg1iCUvbwyLLkdQ6rVymRx1O7h
 HGYqJiiMP+rQmqwYS1YPZYG9gbmjKC6huRTvVoIScVkXrjwA+iiknKUS1
 QlzITAytCr5QWBZyUl8tYW6XPwmZyo3nZcLfAeTXG8TlT0ui+e4hJdnbC w==;
X-CSE-ConnectionGUID: hJKB83eDTbWM4P+cLgaLvg==
X-CSE-MsgGUID: zX1KqAypQu2NkGXTZkduLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65397747"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="65397747"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
X-CSE-ConnectionGUID: RxSqsGb8RU2ag3RAzyCU0Q==
X-CSE-MsgGUID: u2Dostb5Q+eV0MeWiWd1Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="178229452"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:56:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 07/23] drm/xe: Read VF GMD_ID with a specifically-allocated
 dummy GT
Date: Tue, 30 Sep 2025 15:56:24 -0700
Message-ID: <20250930225618.140071-32-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_pci.c |  6 ++-
 drivers/gpu/drm/xe/xe_pci.c       | 61 +++++++++++++++++--------------
 2 files changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
index 0f136bc85b76..969f1dacade8 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -307,8 +307,8 @@ const void *xe_pci_id_gen_param(const void *prev, char *desc)
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
index 37ae49f4b648..9fb5df10844d 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -464,7 +464,7 @@ enum xe_gmdid_type {
 	GMDID_MEDIA
 };
 
-static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
+static int read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver, u32 *revid)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 	struct xe_reg gmdid_reg = GMD_ID;
@@ -473,21 +473,19 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
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
+		struct xe_gt *gt = kzalloc(sizeof(*gt), GFP_KERNEL);
+		if (!gt)
+			return -ENOMEM;
 
 		if (type == GMDID_MEDIA) {
 			gt->info.id = 1;
@@ -503,12 +501,7 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 		/* Don't bother with GMDID if failed to negotiate the GuC ABI */
 		val = xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_vf_gmdid(gt);
 
-		/*
-		 * Only undo xe_gt.info here, the remaining changes made above
-		 * will be overwritten as part of the regular initialization.
-		 */
-		gt->info.id = 0;
-		gt->info.type = XE_GT_TYPE_UNINITIALIZED;
+		kfree(gt);
 	} else {
 		/*
 		 * GMD_ID is a GT register, but at this point in the driver
@@ -526,6 +519,8 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 
 	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
 	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
+
+	return 0;
 }
 
 static const struct xe_ip *find_graphics_ip(unsigned int verx100)
@@ -552,18 +547,21 @@ static const struct xe_ip *find_media_ip(unsigned int verx100)
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
@@ -571,16 +569,21 @@ static void handle_gmdid(struct xe_device *xe,
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
@@ -690,6 +693,7 @@ static int xe_info_init(struct xe_device *xe,
 	const struct xe_media_desc *media_desc;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
+	int ret;
 	u8 id;
 
 	/*
@@ -705,8 +709,11 @@ static int xe_info_init(struct xe_device *xe,
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

