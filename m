Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A669EEEA84E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 18:49:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFD210E780;
	Thu, 12 Feb 2026 18:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2ynDwSV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962E410E297;
 Thu, 12 Feb 2026 18:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770922136; x=1802458136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tX463kLIKnr53/Qu95N1uj9800jgx9/lTCLHdttTw+M=;
 b=Y2ynDwSVOZwydWsNJDzAtvMrvSJbmmdwKjfdUarRetDhLNI14/jz70tq
 FpmNJIc37jcb9uMz7KfL4MTO7RTwgG+M76cTN6qAcXmXBV7VcTfWsFmml
 j75cgW1LtUD7qnffKB3GCfLQkcm4K1bw0F2RsqdvXTODax4eracyaQM4Q
 e9S9DnyYluK3sNHroY1cw3idVItFa2CrOFAIGwkLrV7dT5J7LaZN6sNxD
 92j+rREeopYVPN4NX4Sm+HIfmfmuPpH8Aoj1VhApAFHexkQVTs3dAs8Fi
 nfU83d/cedeVHCWHZe8Ok9s2fEjAe5P3ptTZb4LPLQD0TTwRdcI+5csF+ w==;
X-CSE-ConnectionGUID: TJAHnuZUS5CreLBHBxMUVg==
X-CSE-MsgGUID: XjZXFxPJStm/dycaSaPUWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72204164"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72204164"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:42 -0800
X-CSE-ConnectionGUID: 8AoMNw5HSLW81CNZrJKQow==
X-CSE-MsgGUID: rzxzUyaBTyeyGelDoUw7Tw==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.217])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:40 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 12/15] drm/i915/display: convert W/As in intel_pmdemand.c
 to new framework
Date: Thu, 12 Feb 2026 20:46:10 +0200
Message-ID: <20260212184737.352515-13-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212184737.352515-1-luciano.coelho@intel.com>
References: <20260212184737.352515-1-luciano.coelho@intel.com>
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
workarounds all over, concentrate the checks in intel_wa.c.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_wa.c | 2 ++
 drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
 drivers/gpu/drm/i915/display/intel_pmdemand.c   | 8 +++++---
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 72f645686efd..77ea2e5b8144 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -100,6 +100,8 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 			IS_DISPLAY_STEP(display, STEP_A0, STEP_A2);
 	case INTEL_DISPLAY_WA_14014143976:
 		return IS_DISPLAY_STEP(display, STEP_E0, STEP_FOREVER);
+	case INTEL_DISPLAY_WA_14016740474:
+		return IS_DISPLAY_VERx100_STEP(display, 1400, STEP_A0, STEP_C0);
 	case INTEL_DISPLAY_WA_14020863754:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 2000 ||
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index d8359f88de29..3d2cf05ffacc 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -39,6 +39,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_14011508470,
 	INTEL_DISPLAY_WA_14011765242,
 	INTEL_DISPLAY_WA_14014143976,
+	INTEL_DISPLAY_WA_14016740474,
 	INTEL_DISPLAY_WA_14020863754,
 	INTEL_DISPLAY_WA_14025769978,
 	INTEL_DISPLAY_WA_15013987218,
diff --git a/drivers/gpu/drm/i915/display/intel_pmdemand.c b/drivers/gpu/drm/i915/display/intel_pmdemand.c
index dc44a7a169c1..3b7471df6287 100644
--- a/drivers/gpu/drm/i915/display/intel_pmdemand.c
+++ b/drivers/gpu/drm/i915/display/intel_pmdemand.c
@@ -15,6 +15,7 @@
 #include "intel_display_regs.h"
 #include "intel_display_trace.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_pmdemand.h"
 #include "intel_step.h"
 #include "skl_watermark.h"
@@ -129,9 +130,10 @@ int intel_pmdemand_init(struct intel_display *display)
 				     &pmdemand_state->base,
 				     &intel_pmdemand_funcs);
 
-	if (IS_DISPLAY_VERx100_STEP(display, 1400, STEP_A0, STEP_C0))
-		/* Wa_14016740474 */
-		intel_de_rmw(display, XELPD_CHICKEN_DCPR_3, 0, DMD_RSP_TIMEOUT_DISABLE);
+	/* Wa_14016740474 */
+	if (intel_display_wa(display, 14016740474))
+		intel_de_rmw(display, XELPD_CHICKEN_DCPR_3, 0,
+			     DMD_RSP_TIMEOUT_DISABLE);
 
 	return 0;
 }
-- 
2.51.0

