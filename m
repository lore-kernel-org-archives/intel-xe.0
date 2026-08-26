Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AD7C61DC6
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D68110ED31;
	Wed, 26 Aug 2026 13:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lpX3TNX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F2310ED2F;
 Wed, 26 Aug 2026 13:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751686; x=1819287686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gb57zDmgWkgq43BBZW9XK1gK37IXzlV5N30HgkVNxKQ=;
 b=lpX3TNX67UQZ4H5yM2lAXUUxuQ78XobrGLxbtbmeLOoPKuHBhWa6jG5b
 I5b/T4UpwtUpDE8LJiGwwlClDSc7YSiA+08aSDFSlP5bjq9NENSAlZUD4
 hx8zUCdB6aWEKvtddgQPyS9McuDUitENIh1OYbTxjJPwytdyrwKZCXLRz
 f1kvMWFWCdO0wTRQqeLgDk8wPzReBz7Zzk4fPhztfJM5yPLkUqDmyHOm9
 xKsZg81d4DDI+i62lBsFAGKT4n798fM/vReqjvN/gKDt6yE8Ui+INGINs
 2NQyZEx5ZuTxKPXgxAc5d/sapn9MofgkTK5ylME7bNeVe0hYL/Ea/9J0X A==;
X-CSE-ConnectionGUID: //zRMmW/SQG0YDuHaK3TJw==
X-CSE-MsgGUID: GwAN+oSxRbGxjmmHPJb0tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98566570"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98566570"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:26 -0700
X-CSE-ConnectionGUID: 69OPNuqkTuaRahlBQZQ1rQ==
X-CSE-MsgGUID: /AWoMQc3TO+AjHO4puUAig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="292439522"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:24 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 11/14] drm/i915/cdclk: Extract skl_cdclk_pcode_{pre,
 post}_notify()
Date: Wed, 26 Aug 2026 16:40:30 +0300
Message-ID: <20260826134033.13976-12-ville.syrjala@linux.intel.com>
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

Extract the SKL/ICL+ pcode notify stuff to a few small helpers.
The plan is to unify these between all the platforms and turn
them into vfuncs.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 32 +++++++++++++---------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index cf7670abc369..e42ecbcfc0a8 100644
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
@@ -2293,10 +2303,7 @@ static void bxt_set_cdclk(struct intel_display *display,
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
@@ -2329,8 +2336,7 @@ static void bxt_set_cdclk(struct intel_display *display,
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
2.54.0

