Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3D9E9B265
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 13:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0298210E58D;
	Tue, 24 Feb 2026 13:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X9ok33iA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F4D10E58A;
 Tue, 24 Feb 2026 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941170; x=1803477170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kK4vVNAwBpJurNfYc+KL0n/rW+OAIfSs8ky56S4rxA8=;
 b=X9ok33iAi5mC2HyeIhwYth9Zzy9i4w3TT/ked4RvSRNLyQgRs+K1zMDR
 3HlqPUho6f+o7DRRmSUs71QRbHmC+REfIEZBXTtTWniSn+2TPFaPaChT1
 IzuvYncQgWOK5JGJXM4JHmc1lrbh7vctbpsmO5AZpMzp6nRKp/ZRyCnQF
 5NYSWm9vOsixXBfUneiDYSdX12scYro5uG6lTLWGjmC+CR3d+Q1hTsPvU
 jZY0T9i7MSxooE8aLqMtwEWYmLDzGYTqyRqCJWkEkBOW8X2vZFIrs66Zc
 OD1O8ByydJUQDMPRskzemP/6Glw4twyVjodla0XpI3riVT5ca7RbMol3B A==;
X-CSE-ConnectionGUID: nwykufMmSiqm4fQZRZyhwQ==
X-CSE-MsgGUID: TknOGTjGS/u7zyZ1o6BJ7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="60531031"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="60531031"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:52:49 -0800
X-CSE-ConnectionGUID: LwQHHU/cQnyCHv6iJX/X3A==
X-CSE-MsgGUID: k47W0K2uRz2E5MsLOTi3kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215925259"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:52:48 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v4 11/16] drm/i915/display: convert W/As in intel_flipq.c to
 new framework
Date: Tue, 24 Feb 2026 15:49:58 +0200
Message-ID: <20260224135208.140752-12-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260224135208.140752-1-luciano.coelho@intel.com>
References: <20260224135208.140752-1-luciano.coelho@intel.com>
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

