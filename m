Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD819CD4F25
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 14:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8066B10EB29;
	Tue, 12 May 2026 14:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JaVYNcxz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC9310E215;
 Tue, 12 May 2026 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778594613; x=1810130613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3knpWJ3x2aseliV7KgyuGviQAnBw7DXmc51CGDTKlBs=;
 b=JaVYNcxz8UL2i7La9oDzpriJuAAF0hVVlZvfE4qmrrr2KZ2xcKJgTocB
 w8ifBJuKQFl+0mNDC/e0F4eE+fpR6mdkqki6DpKKBSMWi0nYobR8o7Sbf
 cwFZ/kJNmtwBzeGXPX7xyMdsBd/joAKoZHEs+9xyq/gccYWMtuOwqIKC7
 8VJX7qn4hXjaMFBvE0JKkJunWXrzF/EWk27DKHThJrw5yebDIlq6XMHFX
 FwOMkDbKhs79RjAnuiING1EdWLIb5JF/I51xjgjIEaKkZp0QtKujZ8tUl
 d1xXCULuOzkk3SKv3O0xfMXRuSNcYzdHKaCORN/dHZZEXAsCq2GScNXik Q==;
X-CSE-ConnectionGUID: GmLpwNE5Qo6Ch5Pb4ZszJA==
X-CSE-MsgGUID: KYXb5h+2TxeD2OuGWq9/aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89806351"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="89806351"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 07:03:32 -0700
X-CSE-ConnectionGUID: 8o6eyMSoSu+ZDR+Lx50IfQ==
X-CSE-MsgGUID: B4QpkiScSWOIu3Nh0iqWYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="233311248"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa006.fm.intel.com with ESMTP; 12 May 2026 07:03:28 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 05/15] drm/i915/cmtg: Program VRR registers of CMTG
Date: Tue, 12 May 2026 19:01:58 +0530
Message-Id: <20260512133208.1363116-6-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260512133208.1363116-1-animesh.manna@intel.com>
References: <20260512133208.1363116-1-animesh.manna@intel.com>
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

Program the VRR registers of CMTG, as the VRR timing generator
will always be enabled for NVL.

v2: Use sw state instead of reading from hardware. [Jani]
v3: Program cmtg vrr control and timing registers along with
vrr transcoder registers.

Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c | 34 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h |  2 ++
 drivers/gpu/drm/i915/display/intel_vrr.c  |  5 ++++
 3 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index e8a5429c888f..a0f8cec8120b 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -16,6 +16,7 @@
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
+#include "intel_vrr_regs.h"
 
 /**
  * DOC: Common Primary Timing Generator (CMTG)
@@ -292,3 +293,36 @@ void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, bool lrr)
 	intel_de_write(display, TRANS_SET_CONTEXT_LATENCY(display, cmtg_transcoder),
 		       crtc_state->set_context_latency);
 }
+
+void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cmtg_transcoder = to_cmtg_transcoder(crtc_state->cpu_transcoder);
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	intel_de_write(display, TRANS_VRR_VMIN(display, cmtg_transcoder), crtc_state->vrr.vmin - 1);
+	intel_de_write(display, TRANS_VRR_VMAX(display, cmtg_transcoder), crtc_state->vrr.vmax - 1);
+	intel_de_write(display, TRANS_VRR_FLIPLINE(display, cmtg_transcoder),
+		       crtc_state->vrr.flipline - 1);
+}
+
+void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cmtg_transcoder = to_cmtg_transcoder(crtc_state->cpu_transcoder);
+	u32 vrr_ctl;
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	vrr_ctl = VRR_CTL_VRR_ENABLE | VRR_CTL_FLIP_LINE_EN |
+		  XELPD_VRR_CTL_VRR_GUARDBAND(crtc_state->vrr.guardband);
+
+	/* TODO: The code below may need to be revisited once CMRR is enabled */
+	if (crtc_state->cmrr.enable)
+		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
+
+	intel_de_write(display, TRANS_VRR_CTL(display, cmtg_transcoder), vrr_ctl);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 53a44f505dd2..c92e3a62ff0d 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -11,6 +11,8 @@
 struct intel_display;
 struct intel_crtc_state;
 
+void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state);
+void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, bool lrr);
 void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_sanitize(struct intel_display *display);
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 1b09992ce9fd..1260ceb7958e 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -7,6 +7,7 @@
 #include <drm/drm_print.h>
 
 #include "intel_alpm.h"
+#include "intel_cmtg.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_regs.h"
@@ -334,6 +335,8 @@ void intel_vrr_set_fixed_rr_timings(const struct intel_crtc_state *crtc_state)
 		       intel_vrr_fixed_rr_hw_vmax(crtc_state) - 1);
 	intel_de_write(display, TRANS_VRR_FLIPLINE(display, cpu_transcoder),
 		       intel_vrr_fixed_rr_hw_flipline(crtc_state) - 1);
+
+	intel_cmtg_set_vrr_timings(crtc_state);
 }
 
 static
@@ -932,6 +935,8 @@ static void intel_vrr_tg_enable(const struct intel_crtc_state *crtc_state,
 		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
 
 	intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder), vrr_ctl);
+
+	intel_cmtg_set_vrr_ctl(crtc_state);
 }
 
 static void intel_vrr_tg_disable(const struct intel_crtc_state *old_crtc_state)
-- 
2.29.0

