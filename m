Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CB4E87834
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 14:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A0910E687;
	Tue,  3 Feb 2026 14:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRRXHIbD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BB510E681;
 Tue,  3 Feb 2026 14:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770128000; x=1801664000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D+y8ZQnV/X5lyaerr/31SebheEGRP8qQgWOpwaN0mko=;
 b=LRRXHIbDQVgg4kjfFNJ8jbC7kcYqwoRTuvNyPxiE+urOGJft57lPWewW
 5mgwh5Rz5at9zl0HdQbKEAMyPSbpIFWGBjS/izk9tMzPKml4EDPhR23EF
 ioSRDj4kCq0NaOEbHoKBa7PXqVaeZbXra+2Cw+Qn4wRHGtkJGRF55kad/
 DmXC2nwOrMXFU+QGbYZIDAB0SMtfmxmKt9D+9nYCS8fCM9DqV7DlayXgr
 0kJeq1N67XYKkl+dHDhTtnCyiBkkweUXDwOJy2T8vLvkFAooTOHudwYxz
 UupJQaChwE0LAGsQJQg7yNQO4oR+RpOG+X7fLnMr3z4AWugSyR4ojMdAd A==;
X-CSE-ConnectionGUID: /7u64vj8T8u5v6ud1pHAMA==
X-CSE-MsgGUID: gJ290M6hTLGyNjpfSLGKLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75156435"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="75156435"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 06:13:19 -0800
X-CSE-ConnectionGUID: E7yznrpxTtmeBlgZPDl4hA==
X-CSE-MsgGUID: HiuUPocrQRuFE2FeLULLQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="208956290"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa006.jf.intel.com with ESMTP; 03 Feb 2026 06:13:17 -0800
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v2 01/10] drm/i915/cmtg: enable cmtg LNL onwards
Date: Tue,  3 Feb 2026 19:13:58 +0530
Message-Id: <20260203134407.2823406-2-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260203134407.2823406-1-animesh.manna@intel.com>
References: <20260203134407.2823406-1-animesh.manna@intel.com>
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

Introduce a flag for cmtg. LNL onwards CMTG support will be added.
Set the flag as per DISPLAY_VER() check.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_types.h | 4 ++++
 drivers/gpu/drm/i915/display/intel_dp.c            | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e6298279dc89..1081615a14fb 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1569,6 +1569,10 @@ struct intel_crtc {
 #endif
 
 	bool vblank_psr_notify;
+
+	struct {
+		bool enable;
+	} cmtg;
 };
 
 struct intel_plane_error {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index e2fd01d1a1e4..ecf8ed0c0265 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3445,6 +3445,7 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	const struct drm_display_mode *fixed_mode;
 	struct intel_connector *connector = intel_dp->attached_connector;
+	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
 	int ret = 0, link_bpp_x16;
 
 	fixed_mode = intel_panel_fixed_mode(connector, adjusted_mode);
@@ -3549,6 +3550,9 @@ intel_dp_compute_config(struct intel_encoder *encoder,
 	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
 	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp, pipe_config, conn_state);
 
+	if (DISPLAY_VER(display) >= 15 && intel_dp_is_edp(intel_dp))
+		crtc->cmtg.enable = true;
+
 	return intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp, connector,
 							pipe_config);
 }
-- 
2.29.0

