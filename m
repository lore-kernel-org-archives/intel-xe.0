Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B993CD98E6
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250C110EB05;
	Tue, 16 Jun 2026 12:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDUvYSJq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E01510EABF;
 Tue, 16 Jun 2026 12:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613933; x=1813149933;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=b+21+wotF8dK7jsrfepw2a7c/F+eNaG+k0hzOabidiQ=;
 b=EDUvYSJqh/OCWV1YruTETJ2Dy2mxFAIBiyhTgaAxDvs3Bbt4bQsVaaMG
 8zZQT5gvtuV4zX3V/9KcIRKveAe0IXVOF/898P1DZJS+pw+Q4vma25waS
 wx4i6+B66qlDbqG9X64w/FepFAxmff63d3NioiAEbA/q8WZaiIv3BiYI0
 NhDiO9cc+II/NHO0Sh9BkqiMpTzpvdbeBDU13VbDpLoKpcn58mOpJZRZX
 QF/hhpsQF+XX0O4Fd4BalTEIbXs1iBMdCi9YhGewcyWwH0uiIQ/8r4iSd
 ifn/aPN+ZQOgwdrUHpr4rytFmNxj8fIftIRGM01oc675GxaLb1OUMdRQ0 A==;
X-CSE-ConnectionGUID: otnwiWjBTJqitr8QmrpXkQ==
X-CSE-MsgGUID: E2WSgtOJSBuwDxh5bUmTWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513243"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513243"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:33 -0700
X-CSE-ConnectionGUID: CFSMSLpHSriPdEENPP8VTg==
X-CSE-MsgGUID: pF1D8cuBSmKsLQH0jE/nkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876266"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:32 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 12/39] drm/i915/cmtg: Program VRR fixed-rate timings for CMTG
 transcoder
Date: Tue, 16 Jun 2026 18:13:48 +0530
Message-ID: <20260616124416.2442161-13-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260616124416.2442161-1-dibin.moolakadan.subrahmanian@intel.com>
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

From: Animesh Manna <animesh.manna@intel.com>

Program the VRR registers of CMTG, as the VRR timing generator
will always be enabled for NVL.

Add intel_cmtg_set_vrr_timings() which mirrors the per-transcoder
VRR VMIN/VMAX/FLIPLINE programming on the CMTG transcoder paired
with the pipe's cpu_transcoder.

Invoke it from intel_vrr_set_transcoder_timings() and from the LRR
fastset path, right after the existing intel_vrr_set_fixed_rr_timings()
calls, so the CMTG VRR timing registers stay in sync with the
cpu_transcoder's.

v2: Use sw state instead of reading from hardware. [Jani]
v3: Program cmtg vrr timing registers along with vrr transcoder registers.
v4: Reuse vrr timing programming helper.

Bspec: 68989
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c    | 11 +++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c |  1 +
 drivers/gpu/drm/i915/display/intel_vrr.c     |  2 ++
 4 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index cb1d69c17830..c5fff66f0d9e 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -16,6 +16,7 @@
 #include "intel_display_power.h"
 #include "intel_display_regs.h"
 #include "intel_display_types.h"
+#include "intel_vrr.h"
 
 /**
  * DOC: Common Primary Timing Generator (CMTG)
@@ -247,3 +248,13 @@ void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, enum set_
 	else
 		intel_set_transcoder_timings(crtc_state, cmtg_transcoder);
 }
+
+void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state)
+{
+	enum transcoder cmtg_transcoder = to_cmtg_transcoder(crtc_state->cpu_transcoder);
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	intel_vrr_set_fixed_rr_timings(crtc_state, cmtg_transcoder);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index e3c678019815..e64a26aa5a1c 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -16,6 +16,7 @@ enum set_timing_type {
 	LRR
 };
 
+void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, enum set_timing_type type);
 void intel_cmtg_set_clk_select(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_sanitize(struct intel_display *display);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 8f6acddac6a9..3eb93853da9e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6695,6 +6695,7 @@ static void intel_pipe_fastset(const struct intel_crtc_state *old_crtc_state,
 		intel_set_transcoder_timings_lrr(new_crtc_state, new_crtc_state->cpu_transcoder);
 		intel_cmtg_set_timings(new_crtc_state, LRR);
 		intel_vrr_set_fixed_rr_timings(new_crtc_state, new_crtc_state->cpu_transcoder);
+		intel_cmtg_set_vrr_timings(new_crtc_state);
 		intel_vrr_transcoder_enable(new_crtc_state);
 	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 401a12aee700..74094f4335f0 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -7,6 +7,7 @@
 #include <drm/drm_print.h>
 
 #include "intel_alpm.h"
+#include "intel_cmtg.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
 #include "intel_display_limits.h"
@@ -647,6 +648,7 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 	}
 
 	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
+	intel_cmtg_set_vrr_timings(crtc_state);
 
 	if (!intel_vrr_always_use_vrr_tg(display))
 		intel_de_write(display, TRANS_VRR_CTL(display, cpu_transcoder),
-- 
2.43.0

