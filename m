Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24239C0218B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 15:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B3A10E9C1;
	Fri, 24 Jan 2025 15:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQpbdJfC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B4810E9BE;
 Fri, 24 Jan 2025 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737731549; x=1769267549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l6lh8jhWG+xpK9Cp5q0rr0OQeysn1RC/CbX3FXYzTLk=;
 b=SQpbdJfCoybaCLkifiOHTWmks/H3OkvDtvzExAM+SsxC3VxC6Ib2rghK
 xpyxAGco3mXlxpAW2BxAJ6NG6J2vJTkll3CvUYZl4J8pTsvoCbFnTl3Df
 2gz+Usa08Qu1JPlWNvoPGwLsIeGrCR+ZzOhCehZwBXQMg/5bBYzyMbyd0
 t08BQTsK/449ilbQq/aMR/IPYOjL6hrOVwMVKMDlrykgXOy+r6ezFM2Mk
 9xegCH/hJY50JNFFUv74DKDSHlren/1ChhkA1ie8BAbo3q9Cn6Cb0T/Sh
 Qt7OU4n6gAbMC2/39IPWXHKXYOMmvCGtMvglsgsEoLJmfs2weODrkJvxD A==;
X-CSE-ConnectionGUID: /J4SMkQiRr6sAZuM5qoYMw==
X-CSE-MsgGUID: loUfMij1SkSwwDKJ0M+6qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38177445"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="38177445"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 07:12:29 -0800
X-CSE-ConnectionGUID: ct1F2XWAQA63l1SkEMTTCw==
X-CSE-MsgGUID: CGfmf0nIScmOT64h+0p5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108221483"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 07:12:27 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 23/35] drm/i915/vrr: Use crtc_vtotal for vmin
Date: Fri, 24 Jan 2025 20:30:08 +0530
Message-ID: <20250124150020.2271747-24-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250124150020.2271747-1-ankit.k.nautiyal@intel.com>
References: <20250124150020.2271747-1-ankit.k.nautiyal@intel.com>
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

To have fixed refresh rate with VRR timing generator the
guardband/pipeline full cant be programmed on the fly. So we need to
ensure that the values satisfy both the fixed and variable refresh
rates.

Since we compute these value based on vmin, lets set the vmin to
crtc_vtotal for both fixed and variable timings instead of using the
current refresh rate based approach. This way the guardband remains
sufficient for both cases.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 42e661acdf32..f485c3e35d68 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -265,17 +265,16 @@ void intel_vrr_compute_vrr_timings(struct intel_crtc_state *crtc_state, int vmin
 }
 
 static
-int intel_vrr_compute_vmin(struct intel_connector *connector,
-			   struct drm_display_mode *adjusted_mode)
+int intel_vrr_compute_vmin(struct intel_crtc_state *crtc_state)
 {
-	int vmin;
-	const struct drm_display_info *info = &connector->base.display_info;
-
-	vmin = DIV_ROUND_UP(adjusted_mode->crtc_clock * 1000,
-			    adjusted_mode->crtc_htotal * info->monitor_range.max_vfreq);
-	vmin = max_t(int, vmin, adjusted_mode->crtc_vtotal);
-
-	return vmin;
+	/*
+	 * To make fixed rr and vrr work seamless the guardband/pipeline full
+	 * should be set such that it satisfies both the fixed and variable
+	 * timings.
+	 * For this set the vmin as crtc_vtotal. With this we never need to
+	 * change anything to do with the guardband.
+	 */
+	return crtc_state->hw.adjusted_mode.crtc_vtotal;
 }
 
 static
@@ -328,7 +327,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	if (HAS_LRR(display))
 		crtc_state->update_lrr = true;
 
-	vmin = intel_vrr_compute_vmin(connector, adjusted_mode);
+	vmin = intel_vrr_compute_vmin(crtc_state);
 	vmax = intel_vrr_compute_vmax(connector, adjusted_mode);
 
 	if (vmin >= vmax)
-- 
2.45.2

