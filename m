Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F4FEEA852
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 18:48:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD31D10E789;
	Thu, 12 Feb 2026 18:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUABddTR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566C310E781;
 Thu, 12 Feb 2026 18:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770922136; x=1802458136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yzC60if1itoHXk13R6BVxuJCXh5nSAhJ5bgkmO7kC7g=;
 b=LUABddTRWUMugI3K0s4QXJDbmrZK/wXl4bEgxHJaTB9iLJ8ZyqNKeWdH
 pP8bnUETMlnq5pud3nfCLAj2jPZGUVOI4OsLjO2PokL4X8FDfgIsSVVXV
 lEzuVus0DVzo2VY5YESMrc459z5pfXBHkMFZ78nx8ZPlvTiXrBMWFexge
 zcrRKOUQlKMdqlkg3upIEOOxDgZnEWYX7TnTaSWSXD+QE2hbddeTPvRN3
 bIBSI4yHEHrGFKQKntBcdc2tSropbaZmp4wUVENCWKjmClBM5lsUcMUWm
 2o1MVGnTqeIClGCYd8zh3kjfLMBeK2zhkUXa7NSfdpv+V2JHQppOfkphP g==;
X-CSE-ConnectionGUID: s573T6tIT9O/UUxn2T8K9g==
X-CSE-MsgGUID: pmg/pBH+Qh+emJrAaZ3hKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72204169"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72204169"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:45 -0800
X-CSE-ConnectionGUID: topT4/jURseHF41fnenXlA==
X-CSE-MsgGUID: T80+oY7YQhaQBNvmimVXaA==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.217])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:43 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 14/15] drm/i915/display: convert W/As in
 skl_universal_plane.c to new framework
Date: Thu, 12 Feb 2026 20:46:12 +0200
Message-ID: <20260212184737.352515-15-luciano.coelho@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display_wa.c    | 4 ++++
 drivers/gpu/drm/i915/display/intel_display_wa.h    | 1 +
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 +++---
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 783e1383ff89..20216514c085 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -79,6 +79,10 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 	case INTEL_DISPLAY_WA_13012396614:
 		return DISPLAY_VERx100(display) == 3000 ||
 			DISPLAY_VERx100(display) == 3500;
+	case INTEL_DISPLAY_WA_14010477008:
+		return display->platform.dg1 || display->platform.rocketlake ||
+			(display->platform.tigerlake &&
+			 IS_DISPLAY_STEP(display, STEP_A0, STEP_D0));
 	case INTEL_DISPLAY_WA_14010480278:
 		return (IS_DISPLAY_VER(display, 10, 12));
 	case INTEL_DISPLAY_WA_14010547955:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 35d8df4c75a2..784baf66222b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -30,6 +30,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_1409120013,
 	INTEL_DISPLAY_WA_1409767108,
 	INTEL_DISPLAY_WA_13012396614,
+	INTEL_DISPLAY_WA_14010477008,
 	INTEL_DISPLAY_WA_14010480278,
 	INTEL_DISPLAY_WA_14010547955,
 	INTEL_DISPLAY_WA_14010685332,
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 746e942cafd2..9f31c609271f 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -17,6 +17,7 @@
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_dpt.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
@@ -1217,7 +1218,7 @@ static u32 skl_plane_ctl(const struct intel_plane_state *plane_state)
 		plane_ctl |= PLANE_CTL_KEY_ENABLE_SOURCE;
 
 	/* Wa_22012358565:adl-p */
-	if (DISPLAY_VER(display) == 13)
+	if (intel_display_wa(display, 22012358565))
 		plane_ctl |= adlp_plane_ctl_arb_slots(plane_state);
 
 	return plane_ctl;
@@ -2793,8 +2794,7 @@ static bool tgl_plane_has_mc_ccs(struct intel_display *display,
 				 enum plane_id plane_id)
 {
 	/* Wa_14010477008 */
-	if (display->platform.dg1 || display->platform.rocketlake ||
-	    (display->platform.tigerlake && IS_DISPLAY_STEP(display, STEP_A0, STEP_D0)))
+	if (intel_display_wa(display, 14010477008))
 		return false;
 
 	return plane_id < PLANE_6;
-- 
2.51.0

