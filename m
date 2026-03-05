Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4E1F3092E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0E510EBFD;
	Thu,  5 Mar 2026 10:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFnaaWfO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3E710EBF6;
 Thu,  5 Mar 2026 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772704892; x=1804240892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FetxATyE5i8oFRCbnUVmj6s/OwMs70GITrdnIVLocZE=;
 b=ZFnaaWfO10uk1thpYuIvcCdx1Js++Gx68sV5R3aLZISeIdk0S1NVu4cF
 gWY/SWb3V5PvbFPuu5XLj3DVV6wr1Oj0IBDfVlXumE2FRZjXg5CAve1mS
 gzHfe3jZS2lc3zKqudG/pj7chL2Rx2MSP8+OXSFm9JqkpSCOXOyMao8nn
 kbfZN3aiBXOpx1a3T+3UPoLqOvHQZ3FRp4/OWO+jA+LeNMA0Vt+J62buc
 DrAKsj6aB1an4rLIOePbzRidzQSohv7w8HX0uZvAyFPcTkS9MNShTppt4
 TGKFoBX6h4hRC/LznvgcjQvWmGO77P6eS7ewC7jeLcQuHJSqggLFdPiqi A==;
X-CSE-ConnectionGUID: 7Kj06QGmTSmALk0InakJNA==
X-CSE-MsgGUID: 6D5VW2SNTYy+6obuDPcTHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73758100"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73758100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:32 -0800
X-CSE-ConnectionGUID: izSFFZgHTN+WzdYyW9Pozg==
X-CSE-MsgGUID: kbhUdQKuR3ej2ZACF7B1TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="215460289"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.57])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:30 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v5 10/16] drm/i915/display: convert W/As in intel_fbc.c to new
 framework
Date: Thu,  5 Mar 2026 11:59:13 +0200
Message-ID: <20260305100100.332956-11-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305100100.332956-1-luciano.coelho@intel.com>
References: <20260305100100.332956-1-luciano.coelho@intel.com>
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

Convert the low-hanging fruits of workaround checks to the workaround
framework.  Instead of having display structure checks for the
workarounds all over, concentrate the checks in intel_display_wa.c.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 4 ++++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 2 ++
 drivers/gpu/drm/i915/display/intel_fbc.c        | 4 ++--
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index be37a23edce4..0f449ea8e1bb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -70,6 +70,8 @@ static bool intel_display_needs_wa_16025573575(struct intel_display *display)
 bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa, const char *name)
 {
 	switch (wa) {
+	case INTEL_DISPLAY_WA_1409120013:
+		return IS_DISPLAY_VER(display, 11, 12);
 	case INTEL_DISPLAY_WA_1409767108:
 		return (display->platform.alderlake_s ||
 			(display->platform.rocketlake &&
@@ -109,6 +111,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 	case INTEL_DISPLAY_WA_16011342517:
 		return display->platform.alderlake_p &&
 			IS_DISPLAY_STEP(display, STEP_A0, STEP_D0);
+	case INTEL_DISPLAY_WA_16011863758:
+		return DISPLAY_VER(display) >= 11;
 	case INTEL_DISPLAY_WA_16023588340:
 		return intel_display_needs_wa_16023588340(display);
 	case INTEL_DISPLAY_WA_16025573575:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index dc1a187fd0a1..373cbbb93873 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -27,6 +27,7 @@ bool intel_display_needs_wa_16023588340(struct intel_display *display);
  * number.
  */
 enum intel_display_wa {
+	INTEL_DISPLAY_WA_1409120013,
 	INTEL_DISPLAY_WA_1409767108,
 	INTEL_DISPLAY_WA_13012396614,
 	INTEL_DISPLAY_WA_14010547955,
@@ -42,6 +43,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_15013987218,
 	INTEL_DISPLAY_WA_15018326506,
 	INTEL_DISPLAY_WA_16011342517,
+	INTEL_DISPLAY_WA_16011863758,
 	INTEL_DISPLAY_WA_16023588340,
 	INTEL_DISPLAY_WA_16025573575,
 	INTEL_DISPLAY_WA_22010178259,
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 5d0d7c1027f5..ea0ce00c8474 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -183,7 +183,7 @@ static unsigned int skl_fbc_min_cfb_stride(struct intel_display *display,
 	 * Wa_16011863758: icl+
 	 * Avoid some hardware segment address miscalculation.
 	 */
-	if (DISPLAY_VER(display) >= 11)
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_16011863758))
 		stride += 64;
 
 	/*
@@ -949,7 +949,7 @@ static void intel_fbc_program_workarounds(struct intel_fbc *fbc)
 	}
 
 	/* Wa_1409120013:icl,jsl,tgl,dg1 */
-	if (IS_DISPLAY_VER(display, 11, 12))
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_1409120013))
 		intel_de_rmw(display, ILK_DPFC_CHICKEN(fbc->id),
 			     0, DPFC_CHICKEN_COMP_DUMMY_PIXEL);
 	/*
-- 
2.51.0

