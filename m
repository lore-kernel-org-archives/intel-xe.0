Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A0DCD37AC
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 17:10:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A7C10EF9C;
	Wed, 13 May 2026 17:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8l2VR+I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F54510EF96;
 Wed, 13 May 2026 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778692207; x=1810228207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zmCeSao3WA+96kCXFTk2smUD6ytbkcdeHipW8FPex74=;
 b=h8l2VR+IaVG3BUqZK1mLNQDV9hoEDgzPyV/rQ3VQLN4jK/dzkqqw5hQU
 GFDccwyN/ovPJ86Eg3rORwD8fEF7zaFCqH2C9cXp4rHCv1889px58cox+
 b5ylpCeK7OqaHOqoKIuDM5zNWxkzFqGD06qPasfOOqHMTknJ8gbTXU9Ki
 DtH4sXxiw0Bvla0SCp4AhYvfFHe4ncaE75A7Qxud3YnlxjCuyLmf88LoT
 2VrGk3yfw0y1wT7AfELBu3X9q948vDyTotC3Sx4e494EIhEAl/Z1EUbKW
 O4jYxbJgtJod252fZruwsRM5t4wecOU+cKCA4RN8G9LQNRHnVdSkD0w3Y A==;
X-CSE-ConnectionGUID: 72f50GGtQp20w4yUI8oeZQ==
X-CSE-MsgGUID: uOOqygQFQsaWA2FK2e6wiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102295293"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="102295293"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 10:10:07 -0700
X-CSE-ConnectionGUID: NhPEftEbTHaBcjV0xQT9NQ==
X-CSE-MsgGUID: WG4dfdHRQKWKIrqwmBYnHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="238030134"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa008.jf.intel.com with ESMTP; 13 May 2026 10:10:05 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v6 01/16] drm/i915/cmtg: Add intel_cmtg_is_allowed() for CMTG
Date: Wed, 13 May 2026 22:08:42 +0530
Message-Id: <20260513163857.1541888-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260513163857.1541888-1-animesh.manna@intel.com>
References: <20260513163857.1541888-1-animesh.manna@intel.com>
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

CMTG will be enabled only with DC3co, so add a separate function
intel_cmtg_is_allowed() to check the prerequisites for enabling CMTG.
DC3co will be enabled in a separate patch.

v2:
- Remove separate flag for DC3co from crtc_state. [Uma, Dibin]

v3:
- Do not access power domain members directly. [Jani]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 15 ++++++++++++++-
 drivers/gpu/drm/i915/display/intel_cmtg.h |  4 ++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index e1fdc6fe9762..dc039bea452c 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/string_choices.h>
-#include <linux/types.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_print.h>
@@ -16,6 +15,7 @@
 #include "intel_display_device.h"
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
+#include "intel_display_types.h"
 
 /**
  * DOC: Common Primary Timing Generator (CMTG)
@@ -185,3 +185,16 @@ void intel_cmtg_sanitize(struct intel_display *display)
 
 	intel_cmtg_disable(display, &cmtg_config);
 }
+
+bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+
+	if ((cpu_transcoder == TRANSCODER_A || cpu_transcoder == TRANSCODER_B) &&
+	    DISPLAY_VER(display) == 35 && intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP) &&
+	    intel_display_power_get_current_dc_state(display) == DC_STATE_EN_DC3CO)
+		return true;
+
+	return false;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index ba62199adaa2..ed540581738f 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -6,8 +6,12 @@
 #ifndef __INTEL_CMTG_H__
 #define __INTEL_CMTG_H__
 
+#include <linux/types.h>
+
 struct intel_display;
+struct intel_crtc_state;
 
 void intel_cmtg_sanitize(struct intel_display *display);
+bool intel_cmtg_is_allowed(const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_CMTG_H__ */
-- 
2.29.0

