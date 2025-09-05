Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07109CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 14:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC65510EBBA;
	Fri,  5 Sep 2025 14:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WhjWghl3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7122C10EBBA
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 14:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757082949; x=1788618949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bCijpcSZI9yHe2Au69RPeqhwbiZm/TNDy54p/s+VeKs=;
 b=WhjWghl3yMrf71kj5kkqDoagIlhofu/VXcg/kjPjqyjiuADAOx3ohvgB
 JzUmzdNzOBxckFi1+nMpVH2Cj5w5fEDwmnqpu7gXVJ5gEcKAX/yXo9qRE
 x5+lg5uTY5rUUQDkbKWb/ovH9W1FzsCT5BJIJkc20SauAHCllxOENr1qI
 MyxqCpNjgRHmk5AezJHJIEO74P3TQDkC/8SG45I/sVSPBxOkO4PIKhhJf
 b6yWAi8FOnYfachLF6hEks7ki4r14c+m+w/PqIsiT0a/whvRuCjKt2meE
 DHamN6ODILqaTmaSInQ6ApJJT8crpqhZiIOx9mzZhgywd0EHuyRlRAcRO Q==;
X-CSE-ConnectionGUID: IVYG/EqYT/exXpjpS+LMpA==
X-CSE-MsgGUID: II0GgeqpTLyy1W8PPGer1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="76891008"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="76891008"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 07:35:48 -0700
X-CSE-ConnectionGUID: blurrSgCSIu4wVQ3e+qZeQ==
X-CSE-MsgGUID: Ft26Sw3/QC2Qd+tiqj6Kvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="195834825"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 07:35:47 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/guc: Move ADS BO realloc to xe_guc_ads code
Date: Fri,  5 Sep 2025 16:35:38 +0200
Message-ID: <20250905143538.7927-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

We already have dedicated GuC ADS function that is called during
the post_hwconfig step. Move ADS BO reallocation there to have all
of ADS BO management together. Note that since any BO reinit must
be done prior to the point where we prepare GuC boot params, as
those include BO offsets, we have to move up call to ADS function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c     | 10 +++++-----
 drivers/gpu/drm/xe/xe_guc_ads.c |  8 ++++++++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b3a6408a5760..a62c483c9d88 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -705,10 +705,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -847,6 +843,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
+	ret = xe_guc_ads_init_post_hwconfig(&guc->ads);
+	if (ret)
+		return ret;
+
 	guc_init_params_post_hwconfig(guc);
 
 	ret = xe_guc_submit_init(guc, ~0);
@@ -869,7 +869,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	return xe_guc_ads_init_post_hwconfig(&guc->ads);
+	return 0;
 }
 
 int xe_guc_post_load_init(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 5631722f34f5..fc2c37ca9dbc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -424,11 +424,19 @@ ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
  */
 int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 {
+	struct xe_device *xe = ads_to_xe(ads);
 	struct xe_gt *gt = ads_to_gt(ads);
 	u32 prev_regset_size = ads->regset_size;
+	int ret;
 
 	xe_gt_assert(gt, ads->bo);
 
+	if (IS_DGFX(xe)) {
+		ret = xe_managed_bo_reinit_in_vram(xe, gt->tile, &ads->bo);
+		if (ret)
+			return ret;
+	}
+
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	/* Calculate Capture size with worst size */
 	ads->capture_size = xe_guc_capture_ads_input_worst_size(ads_to_guc(ads));
-- 
2.47.1

