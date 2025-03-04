Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D27C282D3
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 08:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C1610E537;
	Tue,  4 Mar 2025 08:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFylC/K8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1DA10E536;
 Tue,  4 Mar 2025 08:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741077149; x=1772613149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jLT1G0eDVVOu+71WLURHrG83jQTB9VeHzqBViB//uiQ=;
 b=SFylC/K8yFl3r1vNRVBOv4TU+Bu1bXNJBcJJOU0cjIEkYfEpMtCO73Vi
 RP86saESLV6ZUcwthqEyqD6lkCZiMNCCetYrsZG9P2W9WbGlguk6IPDgr
 ppdTzOvsdPvcj00IvPqdjik1/7sRO2E/WOawBC6id1yup0yEYxJSW2bKr
 SM93xyEN+78xMTt9dkMtC86+/svrNysl4bmTRuxQbOj+gowLDxCvO77yb
 LrlatXrBHGtmsYHesaeGsgf4yitpUL4l01Kvg1Ve2pRu1jh0xh3dTHuhU
 Nrqnf+Tla2RetUVBQtlDdZFgi0DOY2DM+Ns4XTgf1Il9XIIfqeGINb9s6 w==;
X-CSE-ConnectionGUID: UmqvXoObQOWlCTWbM2pM2g==
X-CSE-MsgGUID: 1OK/vCjFRfyprntSCxwEzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="45910192"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="45910192"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 00:32:28 -0800
X-CSE-ConnectionGUID: 1fzhsJdWQ3Sr/RVMK00P+w==
X-CSE-MsgGUID: tiMuDnPUTsSkCzndZvbhog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="155492250"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 00:32:26 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 16/22] drm/i915/vrr: Use fixed timings for platforms that
 support VRR
Date: Tue,  4 Mar 2025 13:49:42 +0530
Message-ID: <20250304081948.3177034-17-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250304081948.3177034-1-ankit.k.nautiyal@intel.com>
References: <20250304081948.3177034-1-ankit.k.nautiyal@intel.com>
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

For fixed refresh rate use fixed timings for all platforms that support
VRR. For this add checks to avoid computing and reading VRR for
platforms that do not support VRR.

v2: Avoid touching check for VRR_CTL_FLIP_LINE_EN. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 97040ab9ed86..11f23affd13a 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -347,6 +347,9 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	int vmin, vmax;
 
+	if (!HAS_VRR(display))
+		return;
+
 	/*
 	 * FIXME all joined pipes share the same transcoder.
 	 * Need to account for that during VRR toggle/push/etc.
@@ -370,8 +373,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 		vmax = vmin;
 	}
 
-	if (vmin >= vmax)
-		return;
+	vmin = intel_vrr_compute_vmin(crtc_state);
 
 	crtc_state->vrr.vmin = vmin;
 	crtc_state->vrr.vmax = vmax;
@@ -385,7 +387,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	 */
 	crtc_state->vrr.vmin -= intel_vrr_flipline_offset(display);
 
-	if (crtc_state->uapi.vrr_enabled)
+	if (crtc_state->uapi.vrr_enabled && vmin < vmax)
 		intel_vrr_compute_vrr_timings(crtc_state);
 	else if (is_cmrr_frac_required(crtc_state) && is_edp)
 		intel_vrr_compute_cmrr_timings(crtc_state);
@@ -659,6 +661,9 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 trans_vrr_ctl, trans_vrr_vsync;
 
+	if (!HAS_VRR(display))
+		return;
+
 	trans_vrr_ctl = intel_de_read(display,
 				      TRANS_VRR_CTL(display, cpu_transcoder));
 
-- 
2.45.2

