Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EB9C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 00:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DD710F30F;
	Fri,  7 Aug 2026 00:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iItXqctb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EC410F332
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 00:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786061350; x=1817597350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=l1qJRWbZe4oP105tzm6K+rCLpdYi2IEbojnLc3a+rdA=;
 b=iItXqctbBCNH/Z3gL5DmsW+jdiCQ0bu/QEHVh+iqP1e+I3j/+dNVyZeY
 Rfr2zTmOs2OFTLD1od0RFIIAzRHayi1e0FMJh4xmiTIlmt7BdqxAKgu7c
 E1vtWMKoSJPBX0iWP9qk6j4TJYDIBJh5izZadbl2mFJX6pzs96tcAsppn
 9ctWIEazW+SI05kPwx+rTp0nvAjicAFyk7VRxDjrqAgjqXuQJyGd954+w
 Ce29LXrv2GpgkDFeqcWjkDyMASVkhQyFKeO++U+fG7y+v5ZVfo9ZSIIzY
 sPxpyKk39d0RJpO1VpSO9T3pF5/MlZK8T7GWc7mCUyusPt6Ya9BEJuaiR Q==;
X-CSE-ConnectionGUID: zYqx5FGHRWOB/Rf0tB4NSw==
X-CSE-MsgGUID: EHDfTWR3SKqBsOoB1K+e8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86875587"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="86875587"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 17:09:09 -0700
X-CSE-ConnectionGUID: KRNqO8DPRY6zNUw2sVNoYg==
X-CSE-MsgGUID: bAm0/FohR0GKAsKCMqJXtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="285624008"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 17:09:08 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Riana Tauro <riana.tauro@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/xe_gt_idle: fix vecs config for powergating info
Date: Thu,  6 Aug 2026 17:09:04 -0700
Message-ID: <20260807000904.3570956-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

vecs configuration newer platforms (media version >= 35) is different. Fix
powergating info for these platforms.

Bspec: 67103, 77977

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 45 ++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 04b24e1c8b78e..a8aa33471f512 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -208,15 +208,19 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	/*
 	 * Media Slices
 	 *
-	 * Slice 0: VCS0, VCS1, VECS0
-	 * Slice 1: VCS2, VCS3, VECS1
-	 * Slice 2: VCS4, VCS5, VECS2
-	 * Slice 3: VCS6, VCS7, VECS3
+	 * Prior to MEDIA_VER 35		Post MEDIA_VER 35
+	 *
+	 * Slice 0: VCS0, VCS1, VECS0		Slice 0: VCS0, VCS1, VECS0, VECS1
+	 * Slice 1: VCS2, VCS3, VECS1		Slice 1: VCS2, VCS3, VECS2, VECS3
+	 * Slice 2: VCS4, VCS5, VECS2		Slice 2: VCS4, VCS5
+	 * Slice 3: VCS6, VCS7, VECS3		Slice 3: VCS6, VCS7
 	 */
-	static const struct {
+	struct media_slice {
 		u64 engines;
 		u32 status_bit;
-	} media_slices[] = {
+	};
+
+	static const struct media_slice media_slices_pre_35[] = {
 		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
 		  BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
 
@@ -230,6 +234,22 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 		   BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
 	};
 
+	static const struct media_slice media_slices_post_35[] = {
+		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
+		  BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1)),
+		 MEDIA_SLICE0_AWAKE_STATUS},
+
+		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
+		   BIT(XE_HW_ENGINE_VECS2) | BIT(XE_HW_ENGINE_VECS3)),
+		 MEDIA_SLICE1_AWAKE_STATUS},
+
+		{(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5)),
+		 MEDIA_SLICE2_AWAKE_STATUS},
+
+		{(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7)),
+		 MEDIA_SLICE3_AWAKE_STATUS},
+	};
+
 	if (xe->info.platform == XE_PVC) {
 		drm_printf(p, "Power Gating not supported\n");
 		return 0;
@@ -261,10 +281,21 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 
 	/* Print media CPG status only if media is present */
 	if (vcs_mask || vecs_mask) {
+		const struct media_slice *media_slices;
+		int num_media_slices;
+
+		if (MEDIA_VERx100(gt_to_xe(gt)) < 3500) {
+			media_slices = media_slices_pre_35;
+			num_media_slices = ARRAY_SIZE(media_slices_pre_35);
+		} else {
+			media_slices = media_slices_post_35;
+			num_media_slices = ARRAY_SIZE(media_slices_post_35);
+		}
+
 		drm_printf(p, "Media Power Gating Enabled: %s\n",
 			   str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
 
-		for (n = 0; n < ARRAY_SIZE(media_slices); n++)
+		for (n = 0; n < num_media_slices; n++)
 			if (gt->info.engine_mask & media_slices[n].engines)
 				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
 					   str_up_down(pg_status & media_slices[n].status_bit));
-- 
2.54.0

