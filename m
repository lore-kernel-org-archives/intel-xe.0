Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D5DC61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 23:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604A710EB85;
	Tue, 25 Aug 2026 23:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoiI/KAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF32110EB77
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 23:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787699779; x=1819235779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XdrLQJfZqLNcnKsT6QndfQMwfbfH/wXIIHi5q9vwgMY=;
 b=GoiI/KAdsj4U4xKEHiUpwyM/IWx5Rx2j8Vz/pClcI5qfK5djc47AXvM6
 zJ08K4rW54VVm+m0K+8e4I97iIGW7XgmMT4jIv1IT7qCRJvaYgZz8EYNv
 C+W2rW77/0KjU3Y7pvBJuo9CJjrgc9ykSaXGK6nbZCaFEQLu2W2mShGFE
 YEZjpJIFC9sgXDTLGTUt4XXoZmxlcDKJf/Xz0ClOdSKXfxFZtEg8y9rUG
 qlnAJV7oQ0sYP+jgAgM+eTHbhsjPfvhgH/wsTLp3FWNPomi9YdbmpfIq/
 szTE373stDV6Z2OW4CPX0jIt1o1fRCqtHkCiXB6rLTfIFgG67AlOWc9YX A==;
X-CSE-ConnectionGUID: cqMedGGQS2GO0rNrelBwXg==
X-CSE-MsgGUID: FL0K6IO9S6q0TQhzw73s5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="91857238"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="91857238"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 16:16:19 -0700
X-CSE-ConnectionGUID: yX+Eqr/ZQmmYJ/nCd8uaEA==
X-CSE-MsgGUID: gvFufpSqT6W014U8WIeDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="270906902"
Received: from dceraolo-desk1.fm.intel.com (HELO dceraolo-desk1)
 ([10.121.64.189])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 16:16:20 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 3/6] drm/xe/uc: mark HuC and GSC as only available on the
 media GT
Date: Tue, 25 Aug 2026 23:16:01 +0000
Message-ID: <20260825231604.651906-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825231604.651906-1-daniele.ceraolospurio@intel.com>
References: <20260825231604.651906-1-daniele.ceraolospurio@intel.com>
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
index 3a7a2b1cfc7a..135d4c350f52 100644
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
index b116f39fc354..040e1d7b2dff 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -135,10 +135,10 @@ struct fw_blobs_by_type {
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
@@ -147,9 +147,9 @@ struct fw_blobs_by_type {
 
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

