Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E63CC52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 11:22:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAA810E4E1;
	Fri, 23 Aug 2024 11:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPmbP9ut";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A866F10E4E1
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 11:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724412138; x=1755948138;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LVYP3YAu3rRpBsHSjdgpAqyTmQ9NApNWFw2DCPGZGFU=;
 b=CPmbP9utSNFEKBXND3N7u9CgpFcJBKUSNA/BH+K1Ymgrf8VaAPTyiTZ+
 YHBd8rQ7/wKcUaFPiWHLevuzhLdYnJbu1ZtVkB98Mx6FG34MlHTz+qgdA
 XPVXmtyfhn1GoO7SS6JtU/ogI1vxWJYc7qP/CyY0klozWmLA2+TvYUS1X
 kqqCjx5fX4dmXnBi7Tk0eZp89cBQGwyieAC1cg0KRThYcyW6qdNJjF+hi
 +M1T+Vdu2GJ84lsH4QS8lm24E0SJdxdcgpsC0M16rNNU2+iI/+PD8SzjF
 pQWwjOI427GVItrhofxy+G+0nr7oOqgHcgYCrCt59kgYubKrzbaX0CLSW Q==;
X-CSE-ConnectionGUID: ue7Lh9QXRsGbXIk4kRnKGA==
X-CSE-MsgGUID: 7RIDUeDPQb62X4HLsm3meQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23000481"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23000481"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 04:22:17 -0700
X-CSE-ConnectionGUID: Q/gWsfRRSUaKUWFK0jfhOg==
X-CSE-MsgGUID: NdOmQeEqTEyHUhGjJJ9kuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="61473827"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.4])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 04:22:15 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, imre.deak@intel.com,
 arun.r.murthy@intel.com, rodrigo.vivi@intel.com, uma.shankar@intel.com,
 ville.syrjala@intel.com
Subject: [PATCH v4 2/3] drm/xe: Handle polling only for system s/r in
 xe_display_pm_suspend/resume()
Date: Fri, 23 Aug 2024 14:21:47 +0300
Message-Id: <20240823112148.327015-3-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823112148.327015-1-vinod.govindapillai@intel.com>
References: <20240823112148.327015-1-vinod.govindapillai@intel.com>
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

v2: rebased

Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/xe/display/xe_display.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index ad7fc5137b42..00dd38f6177b 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -321,14 +321,11 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
 	 */
 	intel_power_domains_disable(xe);
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
 
@@ -387,15 +384,12 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
 
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

