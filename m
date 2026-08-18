Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C24C5DF67
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 05:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C3F10E49F;
	Tue, 18 Aug 2026 05:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iY83v74Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41B010E49F
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 05:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787029245; x=1818565245;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q9FJL/212FnXVwQ76hU6GHCQwoCQENXv1ZnqymKRHDc=;
 b=iY83v74ZwHe346sc9aJxyHWgQ5mUCyxI8htNu5F/1xgPfL09WA+G01sy
 U2Qana4htAUEUArsEKvg8XwyZ9uEJRH4XzxHPLS2tVqtLXnML0nZ3chec
 aYVFRk6daoVk4BMCfT70tnSgI2cS97SfsjtGzkNlUyC/iOKX8DjkMdKjk
 cgoZETsoskGE35L3b9UftfG7sEoyjUA41JyEGGA3bBIEpVox33DByBxkU
 Ux1xw4KSRaF2ULLL4ZjV9ZiZlZn9aPQDF7+Z76KI3zMgglYpbxU31dRj/
 rzYw8xkF/3zFxHHQTWyJcZJOKBilHzv4Y3Ed5Rt3TwxREc+I5zUGFYTc/ A==;
X-CSE-ConnectionGUID: SGz3v5NXR+WS3qdrWcQEvg==
X-CSE-MsgGUID: A+IqnEFoSKGgziRvF7ujGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87384947"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="87384947"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 22:00:45 -0700
X-CSE-ConnectionGUID: E9ctuyC9RfmSQFGTNG+h6g==
X-CSE-MsgGUID: n4tH6gXkQLCywgTZjealIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="263381909"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 22:00:46 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Riana Tauro <riana.tauro@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2] drm/xe/xe_gt_idle: fix vecs config for powergating info
Date: Mon, 17 Aug 2026 22:00:41 -0700
Message-ID: <20260818050041.448014-1-ashutosh.dixit@intel.com>
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

vecs configuration for newer platforms (media version >= 35) is
different. Fix powergating info for these platforms.

Bspec: 67103, 77977

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
v2: Restrict to two media slices (Badal Nilawar)
---
 drivers/gpu/drm/xe/xe_gt_idle.c | 45 +++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
index 04b24e1c8b78e..98bd4d87ba184 100644
--- a/drivers/gpu/drm/xe/xe_gt_idle.c
+++ b/drivers/gpu/drm/xe/xe_gt_idle.c
@@ -208,26 +208,34 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 	/*
 	 * Media Slices
 	 *
-	 * Slice 0: VCS0, VCS1, VECS0
-	 * Slice 1: VCS2, VCS3, VECS1
-	 * Slice 2: VCS4, VCS5, VECS2
-	 * Slice 3: VCS6, VCS7, VECS3
+	 * Prior to MEDIA_VER 35		Post MEDIA_VER 35
+	 *
+	 * Slice 0: VCS0, VCS1, VECS0, VECS2	Slice 0: VCS0, VCS1, VECS0, VECS1
+	 * Slice 1: VCS2, VCS3, VECS1, VECS3	Slice 1: VCS2, VCS3, VECS2, VECS3
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
-		  BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
+		  BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS2)),
+		 MEDIA_SLICE0_AWAKE_STATUS},
 
 		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
-		   BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
+		   BIT(XE_HW_ENGINE_VECS1) | BIT(XE_HW_ENGINE_VECS3)),
+		 MEDIA_SLICE1_AWAKE_STATUS},
+	};
 
-		{(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
-		   BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
+	static const struct media_slice media_slices_post_35[] = {
+		{(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
+		  BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_VECS1)),
+		 MEDIA_SLICE0_AWAKE_STATUS},
 
-		{(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
-		   BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
+		{(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
+		   BIT(XE_HW_ENGINE_VECS2) | BIT(XE_HW_ENGINE_VECS3)),
+		 MEDIA_SLICE1_AWAKE_STATUS},
 	};
 
 	if (xe->info.platform == XE_PVC) {
@@ -261,10 +269,21 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
 
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

