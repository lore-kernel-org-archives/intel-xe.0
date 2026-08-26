Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F201C61DCD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 17:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F16E10EDA8;
	Wed, 26 Aug 2026 17:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVltvqF1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7237410EDA2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 17:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787764326; x=1819300326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LB5N2NiAz0LFyoFSsBM6t1cI/+9+kiAe8ekqMAODyxE=;
 b=fVltvqF1r3wW7iGoDbTKvDbCFVg9Jj6StSQ38EVojCcTO9ujEd3JfTXu
 u9AGSsEhlWkCjmvuV9WMSk2AHWQUs7aLX0hmf95gmEMnQkA7NXRZnmmI8
 aN4TsOLptaqyS3JeWw9847+dlDj8cnizkqjha6c+Ct3WP/2QZL6ASsWAU
 KNMISJP4X3pcGk+GX4JJsJHLpIrgz1EhX8K9hyeEOpuy37SCoktv5UWrp
 RNBJRClbeLnemyI+wELbIyUVCpSxdXANrD+fXBYWtTs9wQyDtKD28N6nS
 iBuIO9LNsJenVkBGnl0ycbcn80NGHFiglpC62dQLAhQRWJQTEh/LkDQD9 A==;
X-CSE-ConnectionGUID: 3AmPb0RQTx2dgfsY4kLjNQ==
X-CSE-MsgGUID: s17tyON0TIe0f22J+jDkPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88379126"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88379126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:05 -0700
X-CSE-ConnectionGUID: VhU9o147SG2zM+AAPQtbaw==
X-CSE-MsgGUID: h+ctc5/zSTSwYxRDMsZyOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="261493139"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 10:12:05 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2 3/6] drm/xe/uc: mark HuC and GSC as only available on the
 media GT
Date: Wed, 26 Aug 2026 17:11:46 +0000
Message-ID: <20260826171149.708378-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
References: <20260826171149.708378-1-daniele.ceraolospurio@intel.com>
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

This is mainly needed to make things simpler for a follow-up patch, but
it also allows us to drop gt-type checks during GSC and HuC init,
because uc_fw_init will now return "not supported" on the primary GT.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_gsc.c   |  7 -------
 drivers/gpu/drm/xe/xe_huc.c   | 11 -----------
 drivers/gpu/drm/xe/xe_uc_fw.c | 14 +++++++-------
 3 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 524ac56bdcc7..a8834735cdcd 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -400,19 +400,12 @@ void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec)
 int xe_gsc_init(struct xe_gsc *gsc)
 {
 	struct xe_gt *gt = gsc_to_gt(gsc);
-	struct xe_tile *tile = gt_to_tile(gt);
 	int ret;
 
 	gsc->fw.type = XE_UC_FW_TYPE_GSC;
 	INIT_WORK(&gsc->work, gsc_work);
 	spin_lock_init(&gsc->lock);
 
-	/* The GSC uC is only available on the media GT */
-	if (tile->media_gt && (gt != tile->media_gt)) {
-		xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
-		return 0;
-	}
-
 	/*
 	 * Starting from BMG the GSC is no longer needed for MC6 entry, so the
 	 * only missing features if the FW is lacking would be the content
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index 57afe21444b1..182b1065509e 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -70,17 +70,6 @@ int xe_huc_init(struct xe_huc *huc)
 
 	huc->fw.type = XE_UC_FW_TYPE_HUC;
 
-	/*
-	 * The HuC is only available on the media GT on most platforms.  The
-	 * exception to that rule are the old Xe1 platforms where there was
-	 * no separate GT for media IP, so the HuC was part of the primary
-	 * GT.  Such platforms have graphics versions 12.55 and earlier.
-	 */
-	if (!xe_gt_is_media_type(gt) && GRAPHICS_VERx100(xe) > 1255) {
-		xe_uc_fw_change_status(&huc->fw, XE_UC_FIRMWARE_NOT_SUPPORTED);
-		return 0;
-	}
-
 	ret = xe_uc_fw_init(&huc->fw);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index f918135cc96f..3a74acfaf2c7 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -133,10 +133,10 @@ struct fw_blobs_by_type {
 	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))
 
 #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		ptl))		\
-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
-	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
+	fw_def(PANTHERLAKE,	GT_TYPE_MEDIA,	no_ver(xe,	huc,		ptl))		\
+	fw_def(BATTLEMAGE,	GT_TYPE_MEDIA,	no_ver(xe,	huc,		bmg))		\
+	fw_def(LUNARLAKE,	GT_TYPE_MEDIA,	no_ver(xe,	huc,		lnl))		\
+	fw_def(METEORLAKE,	GT_TYPE_MEDIA,	no_ver(i915,	huc_gsc,	mtl))		\
 	fw_def(DG1,		GT_TYPE_ANY,	no_ver(i915,	huc,		dg1))		\
 	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
 	fw_def(ALDERLAKE_S,	GT_TYPE_ANY,	no_ver(i915,	huc,		tgl))		\
@@ -145,9 +145,9 @@ struct fw_blobs_by_type {
 
 /* for the GSC FW we match the compatibility version and not the release one */
 #define XE_GSC_FIRMWARE_DEFS(fw_def, major_ver)		\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
-	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
+	fw_def(PANTHERLAKE,	GT_TYPE_MEDIA,	major_ver(xe,	gsc,	ptl,	105, 1, 0))	\
+	fw_def(LUNARLAKE,	GT_TYPE_MEDIA,	major_ver(xe,	gsc,	lnl,	104, 1, 0))	\
+	fw_def(METEORLAKE,	GT_TYPE_MEDIA,	major_ver(i915,	gsc,	mtl,	102, 1, 0))
 
 #define MAKE_FW_PATH(dir__, uc__, shortname__, version__)			\
 	__stringify(dir__) "/" __stringify(shortname__) "_" __stringify(uc__) version__ ".bin"
-- 
2.53.0

