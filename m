Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843A0CD8C90
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415A410EB31;
	Wed, 10 Jun 2026 17:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJEWqEpO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C0210EB31;
 Wed, 10 Jun 2026 17:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781111269; x=1812647269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5kzynNYfRAtSIKfmzEbylgKi1kZAAP8ANW4SgdNi88U=;
 b=JJEWqEpOjz2vp6XmtHF4dwX9wQsYqXbaEO3xD1eaQLnIxazpLWFU1cRZ
 lXyqmfa3yG2eBK+JkAuS/DI+pxGTGVcqb+gWGuHMmBE5DBqFrKiKP9NvQ
 0wDJMjh0zBF2yCEDs9MkoPdRJNxKtgmXnIM3Lm9hnhdwTv0yD+8J45bcz
 RZe2kFCkbM7zrbFavQgh1pPpeiEvWGZA4HahsFGONJyEGlNH5I2/HOv1d
 E0tabimwdHkWe0aKNREwZ3RZcOe+d18LLVll9zn6qaIkZQaKKj0qimKoR
 98KtyrlZDpKKysaWiqsGtOzLbq5R71kiV2vjrO5dBDVJSo1q3ehtnKlaI Q==;
X-CSE-ConnectionGUID: 2IqVB6quRauw7gNrd1HkeA==
X-CSE-MsgGUID: I14PeOEgS16prONUbjxe8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92479122"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="92479122"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:07:49 -0700
X-CSE-ConnectionGUID: AsIU5OAoQzK6m8MkQ8zAYw==
X-CSE-MsgGUID: S0ZG11E5Qq+NvzotZcWBkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="239882524"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.62])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:07:48 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 11/14] drm/i915/cdclk: Extract skl_cdclk_pcode_{pre,
 post}_notify()
Date: Wed, 10 Jun 2026 20:06:48 +0300
Message-ID: <20260610170652.5320-12-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Extract the SKL/ICL+ pcode notify stuff to a few small helpers.
The plan is to unify these between all the platforms and turn
them into vfuncs.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 32 +++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 041b1fc8b3ee..bb47fc4c86ee 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -1170,6 +1170,21 @@ static u32 skl_cdclk_freq_sel(struct intel_display *display,
 	}
 }
 
+static int skl_cdclk_pcode_pre_notify(struct intel_display *display)
+{
+	return intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
+					  SKL_CDCLK_PREPARE_FOR_CHANGE,
+					  SKL_CDCLK_READY_FOR_CHANGE,
+					  SKL_CDCLK_READY_FOR_CHANGE, 3);
+}
+
+static int skl_cdclk_pcode_post_notify(struct intel_display *display,
+				       const struct intel_cdclk_config *cdclk_config)
+{
+	return intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
+					cdclk_config->voltage_level);
+}
+
 static void skl_set_cdclk(struct intel_display *display,
 			  const struct intel_cdclk_config *cdclk_config,
 			  enum pipe pipe)
@@ -1190,10 +1205,7 @@ static void skl_set_cdclk(struct intel_display *display,
 	drm_WARN_ON_ONCE(display->drm,
 			 display->platform.skylake && vco == 8640000);
 
-	ret = intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
-					 SKL_CDCLK_PREPARE_FOR_CHANGE,
-					 SKL_CDCLK_READY_FOR_CHANGE,
-					 SKL_CDCLK_READY_FOR_CHANGE, 3);
+	ret = skl_cdclk_pcode_pre_notify(display);
 	if (ret) {
 		drm_err(display->drm,
 			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
@@ -1235,9 +1247,7 @@ static void skl_set_cdclk(struct intel_display *display,
 	intel_de_write(display, CDCLK_CTL, cdclk_ctl);
 	intel_de_posting_read(display, CDCLK_CTL);
 
-	/* inform PCU of the change */
-	ret = intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
-				       cdclk_config->voltage_level);
+	ret = skl_cdclk_pcode_post_notify(display, cdclk_config);
 	if (ret)
 		drm_err(display->drm,
 			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
@@ -2266,10 +2276,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 	if (DISPLAY_VER(display) >= 14 || display->platform.dg2)
 		ret = 0; /* NOOP */
 	else if (DISPLAY_VER(display) >= 11)
-		ret = intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
-						 SKL_CDCLK_PREPARE_FOR_CHANGE,
-						 SKL_CDCLK_READY_FOR_CHANGE,
-						 SKL_CDCLK_READY_FOR_CHANGE, 3);
+		ret = skl_cdclk_pcode_pre_notify(display);
 	else
 		/*
 		 * BSpec requires us to wait up to 150usec, but that leads to
@@ -2302,8 +2309,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 	if (DISPLAY_VER(display) >= 14 || display->platform.dg2)
 		ret = 0; /* NOOP */
 	else if (DISPLAY_VER(display) >= 11)
-		ret = intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
-					       cdclk_config->voltage_level);
+		ret = skl_cdclk_pcode_post_notify(display, cdclk_config);
 	else
 		/*
 		 * The timeout isn't specified, the 2ms used here is based on
-- 
2.53.0

