Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D152CD98E7
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 12:45:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4831510EB03;
	Tue, 16 Jun 2026 12:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyXrprHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D845710EB02;
 Tue, 16 Jun 2026 12:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781613936; x=1813149936;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=L0yqevgkhBIRmC6Fm6zS3Qmq1eCKm8Q0SaAIL/SOl+M=;
 b=cyXrprHX+cg+GaZcluhlHLKwMjMt5k5LxRjw+xukvWobNAcbTR7+hFNc
 e1l/VK7Y4ByRR+XEagjjuWhfVclWlda1KgcYjTZdrpcDS7Bs69NFaWFlm
 VZ4S63s9V6XSMfFcqTcSvYrOvklZQ1U+o9OnZX3vxn3aot7k6cPtQtoer
 G9nAZjDj+16dnlRNELb53S3wM3l0UOIrUoYsV3Kkdn1ESDVRyjsvIFrXK
 +0Y7IaDIyEgqUJo23pAFgprMxiX3kSDhsCRsZ49/hRV9OXcf33A6OKjcK
 epnPftETMw07hzgl/6i0S/unoVSfOFAWi8gfIT48VlMid+wFzFjqvoxrO A==;
X-CSE-ConnectionGUID: 3EiZLycPR42tabBBuRWHiw==
X-CSE-MsgGUID: lRmJm6P5T0KgbGxdeSgs1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="81513246"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="81513246"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:36 -0700
X-CSE-ConnectionGUID: XZcQJvqdRGOLPfH/QrlhJA==
X-CSE-MsgGUID: T+zcEoybRmmvZxAc0JYorA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="244876270"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 05:45:35 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v4 14/39] drm/i915/cmtg: Set link M/N for CMTG transcoder
Date: Tue, 16 Jun 2026 18:13:50 +0530
Message-ID: <20260616124416.2442161-15-dibin.moolakadan.subrahmanian@intel.com>
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

Program CMTG link M/N.
Not much to reuse so add a separate function for CMTG.

Bspec: 68989
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c    | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_cmtg.h    |  1 +
 drivers/gpu/drm/i915/display/intel_display.c |  5 ++++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 87198de8dfed..533e58d90bb6 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -278,3 +278,16 @@ void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state)
 
 	intel_de_write(display, TRANS_VRR_CTL(display, cmtg_transcoder), vrr_ctl);
 }
+
+void intel_cmtg_set_m_n(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	enum transcoder cmtg_transcoder = to_cmtg_transcoder(crtc_state->cpu_transcoder);
+	const struct intel_link_m_n *m_n = &crtc_state->dp_m_n;
+
+	if (!intel_cmtg_is_allowed(crtc_state))
+		return;
+
+	intel_de_write(display, PIPE_LINK_M1(display, cmtg_transcoder), m_n->link_m);
+	intel_de_write(display, PIPE_LINK_N1(display, cmtg_transcoder), m_n->link_n);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.h b/drivers/gpu/drm/i915/display/intel_cmtg.h
index 76ab908c6e61..de852fc2405d 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.h
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.h
@@ -16,6 +16,7 @@ enum set_timing_type {
 	LRR
 };
 
+void intel_cmtg_set_m_n(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_vrr_timings(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state);
 void intel_cmtg_set_timings(const struct intel_crtc_state *crtc_state, enum set_timing_type type);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 3eb93853da9e..62dc2b414f3c 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1635,6 +1635,7 @@ static void hsw_configure_cpu_transcoder(const struct intel_crtc_state *crtc_sta
 					       &crtc_state->dp_m2_n2);
 	}
 
+	intel_cmtg_set_m_n(crtc_state);
 	intel_set_transcoder_timings(crtc_state, crtc_state->cpu_transcoder);
 	intel_cmtg_set_timings(crtc_state, MODESET);
 
@@ -6687,9 +6688,11 @@ static void intel_pipe_fastset(const struct intel_crtc_state *old_crtc_state,
 	    display->platform.broadwell || display->platform.haswell)
 		hsw_set_linetime_wm(new_crtc_state);
 
-	if (new_crtc_state->update_m_n)
+	if (new_crtc_state->update_m_n) {
 		intel_cpu_transcoder_set_m1_n1(crtc, new_crtc_state->cpu_transcoder,
 					       &new_crtc_state->dp_m_n);
+		intel_cmtg_set_m_n(new_crtc_state);
+	}
 
 	if (new_crtc_state->update_lrr) {
 		intel_set_transcoder_timings_lrr(new_crtc_state, new_crtc_state->cpu_transcoder);
-- 
2.43.0

