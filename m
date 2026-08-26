Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC4BC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44C010ED2A;
	Wed, 26 Aug 2026 13:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n95Gj36h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C33E10ED2E;
 Wed, 26 Aug 2026 13:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787751682; x=1819287682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=puxPkpVs7cSwxN4oXvZMIkRbcvOXbpqmIuOPDVRY+Eo=;
 b=n95Gj36hZmFpvZca5OHIDsRdpzon3b8F3BDXX8VTequ19NS5wy7QMXeJ
 5X+mex9Kjsqbpwfi0D03LNcNO+KSMA59LpJlFUUNk/d0J6zcbQEL2mD0W
 w15w/MVlseFeRl03copu/fHK1dN9PePyb+Mb2YlJs09p4Znkqhjj0fRsV
 dAzU4ZR5rOllNYlh2TPWs2J9DyN1tpUg6QUf2kbhVVty4BTlOGtPNfUG5
 BkYfNhKtiJeh4spqwJEqfgPi4HeZ8H/xAMrr6QXT7iqx6C/V7RwhpyoXO
 gigCLq+iPfOo1kWWrNyUrHBdM/QnQ8flrk8ciiByN2QtSXciWRpnHK6D4 A==;
X-CSE-ConnectionGUID: lzRYWtkfSNKJbhbG6gLXyA==
X-CSE-MsgGUID: /2JGTMHYQDOyHEAGhugeHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88360981"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88360981"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:22 -0700
X-CSE-ConnectionGUID: lv2sfU5VQk+9zxujUP52YQ==
X-CSE-MsgGUID: FLHdtU7tQWyhCutxwlRCHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271081824"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.39])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:41:20 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 10/14] drm/i915/cdclk: Extract bdw_cdclk_pcode_{pre,
 post}_notify()
Date: Wed, 26 Aug 2026 16:40:29 +0300
Message-ID: <20260826134033.13976-11-ville.syrjala@linux.intel.com>
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

Extract the BDW pcode notify stuff to a few small helpers. The
plan is to unify these between all the platforms and turn them
into vfuncs.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_cdclk.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index ba1684a99886..cf7670abc369 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -872,6 +872,19 @@ static u32 bdw_cdclk_freq_sel(int cdclk)
 	}
 }
 
+static int bdw_cdclk_pcode_pre_notify(struct intel_display *display)
+{
+	return intel_parent_pcode_write(display, BDW_PCODE_DISPLAY_FREQ_CHANGE_REQ,
+					0x0);
+}
+
+static int bdw_cdclk_pcode_post_notify(struct intel_display *display,
+				       const struct intel_cdclk_config *cdclk_config)
+{
+	return intel_parent_pcode_write(display, HSW_PCODE_DE_WRITE_FREQ_REQ,
+					cdclk_config->voltage_level);
+}
+
 static void bdw_set_cdclk(struct intel_display *display,
 			  const struct intel_cdclk_config *cdclk_config,
 			  enum pipe pipe)
@@ -888,7 +901,7 @@ static void bdw_set_cdclk(struct intel_display *display,
 		     "trying to change cdclk frequency with cdclk not enabled\n"))
 		return;
 
-	ret = intel_parent_pcode_write(display, BDW_PCODE_DISPLAY_FREQ_CHANGE_REQ, 0x0);
+	ret = bdw_cdclk_pcode_pre_notify(display);
 	if (ret) {
 		drm_err(display->drm,
 			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
@@ -918,8 +931,7 @@ static void bdw_set_cdclk(struct intel_display *display,
 	if (ret)
 		drm_err(display->drm, "Switching back to LCPLL failed\n");
 
-	ret = intel_parent_pcode_write(display, HSW_PCODE_DE_WRITE_FREQ_REQ,
-				       cdclk_config->voltage_level);
+	ret = bdw_cdclk_pcode_post_notify(display, cdclk_config);
 	if (ret)
 		drm_err(display->drm,
 			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
-- 
2.54.0

