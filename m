Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60939C531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 17:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0186410E467;
	Tue, 20 Aug 2024 17:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3ZEfvnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D631910E467
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 17:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174174; x=1755710174;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZuBeGB/S6WRDryNwOpb2VHFRtX5Len399laJ2EM2og8=;
 b=A3ZEfvnAJNyBzNa5ZaKBD7VV216hKmUhu+uhJR902cahpzuEXv3eMLIS
 qXxd2M2lfZfoQOcyWHNHE3an9H8+bkWFlLOFvYJn8d7cBrYlz1V9qYepR
 MX3GIWfAra3396csro4Y1yteMyocHp8NawifCVFkEXspaJWnv1Euu1GJx
 mY92EpffSDVn8KfElIRBOZ9A18QDGBmhrUV+0a1vj5c+lHWV71T1z4dCj
 aB+A3O9JnGDAbczJSF9Igmqg8PXo+4nFteC+u/LiNFSjbzAb+0OgcJ/IN
 7auqJev03VNhHNQCV9fxteVdk84KCBndx70mpoLaHhmF2ABfSSKj/lkkq Q==;
X-CSE-ConnectionGUID: CjG6OXWeSlmcXiCpBDUX2w==
X-CSE-MsgGUID: 2m1C4xwkSqG9/75gZYJ5Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33114117"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="33114117"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:14:30 -0700
X-CSE-ConnectionGUID: WU3U5pJYTli+8hJQhmrt5w==
X-CSE-MsgGUID: bbECcZ/sQIGyesSD0l5iTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="60755957"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.143])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:14:28 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 arun.r.murthy@intel.com, rodrigo.vivi@intel.com, uma.shankar@intel.com,
 ville.syrala@intel.com
Subject: [PATCH v3 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Date: Tue, 20 Aug 2024 20:14:07 +0300
Message-Id: <20240820171408.192309-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820171408.192309-1-vinod.govindapillai@intel.com>
References: <20240820171408.192309-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Imre Deak <imre.deak@intel.com>

This is a preparation for the follow-up patch where polling
will be handled properly for all cases during runtime suspend/resume.

Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index ad7fc5137b42..b2a0b4b5c45c 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -320,15 +320,13 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	 * properly.
 	 */
 	intel_power_domains_disable(xe);
+
 	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
-	if (has_display(xe)) {
+	if (!runtime && has_display(xe)) {
 		drm_kms_helper_poll_disable(&xe->drm);
-		if (!runtime)
-			intel_display_driver_disable_user_access(xe);
-	}
-
-	if (!runtime)
+		intel_display_driver_disable_user_access(xe);
 		intel_display_driver_suspend(xe);
+	}
 
 	xe_display_flush_cleanup_work(xe);
 
@@ -387,15 +385,12 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 
 	/* MST sideband requires HPD interrupts enabled */
 	intel_dp_mst_resume(xe);
-	if (!runtime)
+	if (!runtime && has_display(xe)) {
 		intel_display_driver_resume(xe);
-
-	if (has_display(xe)) {
 		drm_kms_helper_poll_enable(&xe->drm);
-		if (!runtime)
-			intel_display_driver_enable_user_access(xe);
+		intel_display_driver_enable_user_access(xe);
+		intel_hpd_poll_disable(xe);
 	}
-	intel_hpd_poll_disable(xe);
 
 	intel_opregion_resume(display);
 
-- 
2.34.1

