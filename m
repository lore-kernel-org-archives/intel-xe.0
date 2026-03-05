Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5D4F3092D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A3110EBFF;
	Thu,  5 Mar 2026 10:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+2dS5Ox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B518410EBF8;
 Thu,  5 Mar 2026 10:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772704894; x=1804240894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kK4vVNAwBpJurNfYc+KL0n/rW+OAIfSs8ky56S4rxA8=;
 b=F+2dS5OxBiZYx3DjcgnwHpzPjKqBsPdnK+8I4JtjOj2+LXJTTb6NYZps
 1bvd4MQPKSLv72Q1+oha/dqrHnz9dWiCyjIUFJMHPNS7z8h6iIxUJJmiz
 VtwGOr0NjK+FgmV4EAKAc6nRjYJpvOTYFpoHHtbGQ/ERVi1YvHySkcccV
 heTDPEAgLGoahrfVgqoNibpshk4hgBZhKia8kozghzjUKsTnKfZxtd3Fg
 tqnxad0NxJYttBVrD0w0jQiD0GIYFU2ElbTbTUdDXbMYGRWrY5tNacT7+
 QwT3ztgew78nQXRoaXom5IaV0HDDivbJeVu51wVxgvWCmKQNkKrOevs8R g==;
X-CSE-ConnectionGUID: GQug0zcjQZ2tAJgfJWDyWg==
X-CSE-MsgGUID: yT4qrTc7RtCbPQtIEET5yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73758104"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73758104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:33 -0800
X-CSE-ConnectionGUID: Aki7ou4eSsiVBTr5sF0ntg==
X-CSE-MsgGUID: 0ln/xuPuTLylsK9lII+OZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="215460295"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.57])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:32 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v5 11/16] drm/i915/display: convert W/As in intel_flipq.c to
 new framework
Date: Thu,  5 Mar 2026 11:59:14 +0200
Message-ID: <20260305100100.332956-12-luciano.coelho@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display_wa.c |  4 ++++
 drivers/gpu/drm/i915/display/intel_display_wa.h |  1 +
 drivers/gpu/drm/i915/display/intel_flipq.c      | 13 +++----------
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
index 0f449ea8e1bb..81be1e875c07 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.c
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
@@ -117,6 +117,10 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
 		return intel_display_needs_wa_16023588340(display);
 	case INTEL_DISPLAY_WA_16025573575:
 		return intel_display_needs_wa_16025573575(display);
+	case INTEL_DISPLAY_WA_18034343758:
+		return DISPLAY_VER(display) == 20 ||
+			(display->platform.pantherlake &&
+			 IS_DISPLAY_STEP(display, STEP_A0, STEP_B0));
 	case INTEL_DISPLAY_WA_22010178259:
 		return DISPLAY_VER(display) == 12;
 	case INTEL_DISPLAY_WA_22011320316:
diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
index 373cbbb93873..68d67b9b0263 100644
--- a/drivers/gpu/drm/i915/display/intel_display_wa.h
+++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
@@ -46,6 +46,7 @@ enum intel_display_wa {
 	INTEL_DISPLAY_WA_16011863758,
 	INTEL_DISPLAY_WA_16023588340,
 	INTEL_DISPLAY_WA_16025573575,
+	INTEL_DISPLAY_WA_18034343758,
 	INTEL_DISPLAY_WA_22010178259,
 	INTEL_DISPLAY_WA_22011320316,
 	INTEL_DISPLAY_WA_22012358565,
diff --git a/drivers/gpu/drm/i915/display/intel_flipq.c b/drivers/gpu/drm/i915/display/intel_flipq.c
index 1e9550cb66a3..253dc2e96d2d 100644
--- a/drivers/gpu/drm/i915/display/intel_flipq.c
+++ b/drivers/gpu/drm/i915/display/intel_flipq.c
@@ -12,6 +12,7 @@
 #include "intel_display_core.h"
 #include "intel_display_types.h"
 #include "intel_display_utils.h"
+#include "intel_display_wa.h"
 #include "intel_dmc.h"
 #include "intel_dmc_regs.h"
 #include "intel_dsb.h"
@@ -447,19 +448,11 @@ void intel_flipq_add(struct intel_crtc *crtc,
 	intel_flipq_sw_dmc_wake(crtc);
 }
 
-/* Wa_18034343758 */
-static bool need_dmc_halt_wa(struct intel_display *display)
-{
-	return DISPLAY_VER(display) == 20 ||
-		(display->platform.pantherlake &&
-		 IS_DISPLAY_STEP(display, STEP_A0, STEP_B0));
-}
-
 void intel_flipq_wait_dmc_halt(struct intel_dsb *dsb, struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
 
-	if (need_dmc_halt_wa(display))
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_18034343758))
 		intel_dsb_wait_usec(dsb, 2);
 }
 
@@ -467,6 +460,6 @@ void intel_flipq_unhalt_dmc(struct intel_dsb *dsb, struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
 
-	if (need_dmc_halt_wa(display))
+	if (intel_display_wa(display, INTEL_DISPLAY_WA_18034343758))
 		intel_dsb_reg_write(dsb, PIPEDMC_CTL(crtc->pipe), 0);
 }
-- 
2.51.0

