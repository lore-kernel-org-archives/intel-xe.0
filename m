Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76FBC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9321A10ED32;
	Wed, 26 Aug 2026 13:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIIorxHn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB92910ED33;
 Wed, 26 Aug 2026 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751690; x=1819287690;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ABH4crv4k4ktDHxfj31olG3+5PzNVZowUPqArbSr/Zo=;
 b=TIIorxHnIj+2XBYtYgYKfVMLNREIVq1wQvR/YTxDY2FFnIN2yFs+aePr
 Ip42lJUVY/l3yw+Hj8wyLPBjvSSWlx//Z511TELjkQ5qu3vTloMgGSAhu
 anhiFFy4pNp/T7imy5OScmYJE5ZzLvWUAHJVEEROIgVOcXJ9cfaOGgU2Y
 tfnyx6EwTf4Y0OHYeRI7QVPvQyPUZld5Oe4veY7NysTq2CB6HepAyzHLx
 CDjbzuy3WmZv0bHKmMdoKB9SrZvgZ9uW/L/gIaU9210vQ7aejCiUWCE/M
 wptorJ/nxl1LMKa8IPTW0f7EaLHaFkcyDn7ebutQmrGM56GJkrj1bp6Sh w==;
X-CSE-ConnectionGUID: hECSK8IJS7Gnqa6Ni+znoQ==
X-CSE-MsgGUID: DliEbBA6SFyWs48bVas0FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98566572"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98566572"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:29 -0700
X-CSE-ConnectionGUID: V9VZrRDrQyKR06sjAK1mzw==
X-CSE-MsgGUID: 4KMpsik0Q7+3y7XIB1vKew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="292439538"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:28 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 12/14] drm/i915/cdclk: Extract bxt_cdclk_pcode_{pre,
 post}_notify()
Date: Wed, 26 Aug 2026 16:40:31 +0300
Message-ID: <20260826134033.13976-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
References: <20260826134033.13976-1-ville.syrjala@linux.intel.com>
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

Extract the BXT/GLK pcode notify stuff to a few small helpers.
The plan is to unify these between all the platforms and turn
them into vfuncs.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 42 +++++++++++++---------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index e42ecbcfc0a8..cf7efac7d648 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2253,6 +2253,29 @@ static u32 bxt_cdclk_ctl(struct intel_display *display,
 	return val;
 }
 
+static int bxt_cdclk_pcode_pre_notify(struct intel_display *display)
+{
+	/*
+	 * BSpec requires us to wait up to 150usec, but that leads to
+	 * timeouts; the 2ms used here is based on experiment.
+	 */
+	return intel_parent_pcode_write_timeout(display, HSW_PCODE_DE_WRITE_FREQ_REQ,
+						0x80000000, 2);
+}
+
+static int bxt_cdclk_pcode_post_notify(struct intel_display *display,
+				       const struct intel_cdclk_config *cdclk_config)
+{
+	/*
+	 * The timeout isn't specified, the 2ms used here is based on
+	 * experiment.
+	 * FIXME: Waiting for the request completion could be delayed
+	 * until the next PCODE request based on BSpec.
+	 */
+	return intel_parent_pcode_write_timeout(display, HSW_PCODE_DE_WRITE_FREQ_REQ,
+						cdclk_config->voltage_level, 2);
+}
+
 static void _bxt_set_cdclk(struct intel_display *display,
 			   const struct intel_cdclk_config *cdclk_config,
 			   enum pipe pipe)
@@ -2305,13 +2328,7 @@ static void bxt_set_cdclk(struct intel_display *display,
 	else if (DISPLAY_VER(display) >= 11)
 		ret = skl_cdclk_pcode_pre_notify(display);
 	else
-		/*
-		 * BSpec requires us to wait up to 150usec, but that leads to
-		 * timeouts; the 2ms used here is based on experiment.
-		 */
-		ret = intel_parent_pcode_write_timeout(display,
-						       HSW_PCODE_DE_WRITE_FREQ_REQ,
-						       0x80000000, 2);
+		ret = bxt_cdclk_pcode_pre_notify(display);
 
 	if (ret) {
 		drm_err(display->drm,
@@ -2338,15 +2355,8 @@ static void bxt_set_cdclk(struct intel_display *display,
 	else if (DISPLAY_VER(display) >= 11)
 		ret = skl_cdclk_pcode_post_notify(display, cdclk_config);
 	else
-		/*
-		 * The timeout isn't specified, the 2ms used here is based on
-		 * experiment.
-		 * FIXME: Waiting for the request completion could be delayed
-		 * until the next PCODE request based on BSpec.
-		 */
-		ret = intel_parent_pcode_write_timeout(display,
-						       HSW_PCODE_DE_WRITE_FREQ_REQ,
-						       cdclk_config->voltage_level, 2);
+		ret = bxt_cdclk_pcode_post_notify(display, cdclk_config);
+
 	if (ret)
 		drm_err(display->drm,
 			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
-- 
2.54.0

