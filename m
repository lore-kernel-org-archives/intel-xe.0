Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9BBCD4F5B
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 16:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E0410E923;
	Mon, 18 May 2026 16:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hl1GeXvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C14810E91C;
 Mon, 18 May 2026 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779120889; x=1810656889;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=RzDKQj8pNZX3MLJqnEJVRV8qyre/iirpffJKGp5VcwU=;
 b=Hl1GeXvAjp9lGRM2nBYWqdy/0xBSCC3Gd8MkU3DWCavBKED5DzSQyYBA
 GASaktMicxywa22WQAXxffq9GVR5Izso1cSQeAlWQ1UcAUykNxLJa24K/
 +TgKG15g3m0wPt8n774Fj5KcMotGiVXptlhXhIMAnFGvKn317zjAHE1BW
 cnrCijbD0DvJ5H+ZmQWTXx8B6zyv9Hf99nkP9aB4J4j1bPoAN4fChSC+f
 PovzWyD4gZcS6asevwp5ZRP7U7KGUpvVtBg7sjos/08BqpBii09nBRK42
 exkFBnD7/yOD0HtN4KvHseH6dk/p1YMC6nrFvm/74H748tDuC8F9BV6LX w==;
X-CSE-ConnectionGUID: ZvnRN4czQJC9WX880tTqZA==
X-CSE-MsgGUID: 4S+ePiWtRF+aVt6DAU+K7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91370633"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="91370633"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 09:14:49 -0700
X-CSE-ConnectionGUID: SpbAVWTWQ6i2Yc6xHuiCow==
X-CSE-MsgGUID: B+y4vqpdT9SXLkOmn7Pfxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235219060"
Received: from aherrold-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.133])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 09:14:47 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 18 May 2026 13:14:04 -0300
Subject: [PATCH v4 5/5] drm/i915/bw: Extract get_display_bw_params()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-separate-platform-from-diplay-ip-specific-bw-params-v4-5-918528006549@intel.com>
References: <20260518-separate-platform-from-diplay-ip-specific-bw-params-v4-0-918528006549@intel.com>
In-Reply-To: <20260518-separate-platform-from-diplay-ip-specific-bw-params-v4-0-918528006549@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

Just like it is done for the platform-specific bandwidth parameters, use
a separate function named get_display_bw_params() to return the display
IP-specific parameters.  This simplifies intel_bw_init_hw() by having
just one call for each of the *_get_bw_info() functions.

v2:
  - Prefer to call get_display_bw_params() only once in
    intel_bw_init_hw() instead of having multiple calls in each of the
    affected *_get_bw_info() functions. (Jani)

v3:
  - Call get_display_bw_params() only after the check on
    HAS_DISPLAY(display). (Jani)
  - Return &gen11_bw_params only if display version is 11. (Matt)

v4:
  - Like done with get_soc_bw_params(), drop drm_WARN() when no display
    IP is matched.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 39 ++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 26b294544d10..d7b2bc80f8e3 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -482,6 +482,28 @@ static const struct intel_display_bw_params xelpdp_bw_params = {
 	.displayrtids = 256,
 };
 
+static const struct intel_display_bw_params *get_display_bw_params(struct intel_display *display)
+{
+	if (DISPLAY_VER(display) >= 14) {
+		return &xelpdp_bw_params;
+	} else if (DISPLAY_VER(display) >= 12) {
+		/*
+		 * RKL's SoC was based on ICL and the display, even though being
+		 * gen12, had changes to the memory interface to match gen11's,
+		 * consequently inheriting gen11's display-specific bandwidth
+		 * parameters.
+		 */
+		if (display->platform.rocketlake)
+			return &gen11_bw_params;
+		else
+			return &gen12_bw_params;
+	} else if (DISPLAY_VER(display) == 11) {
+		return &gen11_bw_params;
+	}
+
+	return NULL;
+}
+
 static int icl_get_bw_info(struct intel_display *display,
 			   const struct dram_info *dram_info,
 			   const struct intel_soc_bw_params *soc_bw_params,
@@ -832,12 +854,14 @@ void intel_bw_init_hw(struct intel_display *display)
 {
 	const struct dram_info *dram_info;
 	const struct intel_soc_bw_params *soc_bw_params;
+	const struct intel_display_bw_params *display_bw_params;
 
 	if (!HAS_DISPLAY(display))
 		return;
 
 	dram_info = intel_dram_info(display);
 	soc_bw_params = get_soc_bw_params(display, dram_info);
+	display_bw_params = get_display_bw_params(display);
 
 	/*
 	 * Starting with Xe3p_LPD, the hardware tells us whether memory has ECC
@@ -850,23 +874,12 @@ void intel_bw_init_hw(struct intel_display *display)
 
 	if (DISPLAY_VERx100(display) >= 1401 && display->platform.dgfx) {
 		xe2_hpd_get_bw_info(display, dram_info, soc_bw_params);
-	} else if (DISPLAY_VER(display) >= 14) {
-		tgl_get_bw_info(display, dram_info, soc_bw_params, &xelpdp_bw_params);
 	} else if (display->platform.dg2) {
 		dg2_get_bw_info(display);
 	} else if (DISPLAY_VER(display) >= 12) {
-		/*
-		 * RKL's SoC was based on ICL and the display, even though being
-		 * gen12, had changes to the memory interface to match gen11's,
-		 * consequently inheriting gen11's display-specific bandwidth
-		 * parameters.
-		 */
-		if (display->platform.rocketlake)
-			tgl_get_bw_info(display, dram_info, soc_bw_params, &gen11_bw_params);
-		else
-			tgl_get_bw_info(display, dram_info, soc_bw_params, &gen12_bw_params);
+		tgl_get_bw_info(display, dram_info, soc_bw_params, display_bw_params);
 	} else if (DISPLAY_VER(display) == 11) {
-		icl_get_bw_info(display, dram_info, soc_bw_params, &gen11_bw_params);
+		icl_get_bw_info(display, dram_info, soc_bw_params, display_bw_params);
 	}
 }
 

-- 
2.53.0

