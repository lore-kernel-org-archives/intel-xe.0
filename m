Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48597C982C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 02:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE9110E4EC;
	Wed, 16 Sep 2026 02:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdK8uKim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D2C10E4EC;
 Wed, 16 Sep 2026 02:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789527449; x=1821063449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1zmnVPFazzCAM50vYv1jZKQwIWYprZstPRRkvOiDu6U=;
 b=KdK8uKimQEjzWtjoXSQ8a47WJQl4CuDzOj6TvSEDnaTz23Q1W2hg2Wc6
 gJoUPsFiBAUu2iop1rlC0+X3AZ3cNInVdgvcCLzgigrM6BRV+wUN21dDw
 0H18+PkKkckUhbQzwSISPy92gS/I8Fj5z79YQb15Bm25T9OpWGfRzkOEl
 0bunukUkrOtCm/ASfkmKtjKWUL0jr14WIiPOPEFXQ9uEJ60PM5KwTu04l
 siMdSbzfTcbVuJI6FFUJ85iD2LkBQg7ftUW2S45+DgUduJLT4il7hsqKI
 La1R7gue1CTSTvCCYbM6vaGxQ+eh3XHCr6sj9iHyvjrejiupaypbKdUFn g==;
X-CSE-ConnectionGUID: KSgLYa8uSsaJa6mP/LEzng==
X-CSE-MsgGUID: iYLmQSKpTja9P1UG3ckJnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100498341"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100498341"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 19:57:29 -0700
X-CSE-ConnectionGUID: tybBacrLQc6PhgFeYI9uUQ==
X-CSE-MsgGUID: yel5LLMITd+/iI1aPYK1Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="311473425"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 15 Sep 2026 19:57:27 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 08/10] drm/i915/display: Implement Wa_14021768792 for BMG
 DP for link_m/n ratio > 10
Date: Wed, 16 Sep 2026 08:27:08 +0530
Message-Id: <20260916025710.432281-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260916025710.432281-1-suraj.kandpal@intel.com>
References: <20260916025710.432281-1-suraj.kandpal@intel.com>
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

From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Handle the bypass logic for the M/N ratio limit for DP.
Calculate the M/N ratio, check if it can bypass the limit, and set the
appropriate flags for the workaround.

The workaround is only intended for 128b/132b links, so restrict it to
those.

Bspec also restricts the Link M/N values from changing outside of a
modeset while the mechanism is active, so disable DRRS and the seamless
M/N fastset path for such a configuration.

Bspec: 49266
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 26 ++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 2fca0eedb443..e89ff8677664 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3353,6 +3353,9 @@ static bool can_enable_drrs(struct intel_connector *connector,
 	if (pipe_config->vrr.enable)
 		return false;
 
+	if (pipe_config->dp_m_n.bypass_m_n_ratio_limit)
+		return false;
+
 	/*
 	 * DRRS and PSR can't be enable together, so giving preference to PSR
 	 * as it allows more power-savings by complete shutting down display,
@@ -3377,6 +3380,7 @@ void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
 			      struct intel_link_m_n *m_n)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
 	int m_n_ratio;
 
@@ -3385,10 +3389,21 @@ void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
 
 	m_n_ratio = DIV_ROUND_UP(m_n->link_m, m_n->link_n);
 
-	if (m_n_ratio > max_m_n_ratio)
-		drm_WARN(display->drm, 1,
-			 "Link M/N ratio (%d) exceeds max allowed (%d)\n",
-			 m_n_ratio, max_m_n_ratio);
+	if (m_n_ratio <= max_m_n_ratio)
+		return;
+
+	if (intel_dp_is_uhbr(crtc_state) &&
+	    intel_display_can_bypass_m_n_limit(display, m_n_ratio, crtc->pipe)) {
+		m_n->bypass_m_n_ratio_limit = true;
+		drm_dbg_kms(display->drm,
+			    "Bypassing Link_m/Link_n ratio limit (ratio %d)\n",
+			    m_n_ratio);
+		return;
+	}
+
+	drm_WARN(display->drm, 1,
+		 "Link M/N ratio (%d) exceeds max allowed (%d)\n",
+		 m_n_ratio, max_m_n_ratio);
 }
 
 static void
@@ -3405,7 +3420,8 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
 	 * FIXME all joined pipes share the same transcoder.
 	 * Need to account for that when updating M/N live.
 	 */
-	if (has_seamless_m_n(connector) && !pipe_config->joiner_pipes)
+	if (has_seamless_m_n(connector) && !pipe_config->joiner_pipes &&
+	    !pipe_config->dp_m_n.bypass_m_n_ratio_limit)
 		pipe_config->update_m_n = true;
 
 	if (!can_enable_drrs(connector, pipe_config, downclock_mode)) {
-- 
2.34.1

