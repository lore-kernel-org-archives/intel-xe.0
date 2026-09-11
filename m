Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E69C79FA1
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:15:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F0A10F2E6;
	Fri, 11 Sep 2026 04:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MryGN6Lz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA4210EBDA;
 Fri, 11 Sep 2026 04:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789100114; x=1820636114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a5280bqZC0FB78xnrlnAKcTEvf4yJyXvLeq6+E7xR3c=;
 b=MryGN6LzsXPIKFrmd1BGNZd1lx++ykP45pdSYuQoX8BJXGR9lqjp6jRu
 pqaP7iOFvXudL4gVsh7zsPPueAXa/27TBY2bDFvOzh89KO2ZmM1rlzOLy
 /NTHd+JdnGrsdtgHrqWq/rOG6/uTYyR2XFnxc5WeCbQunLSqHW3+bo//v
 SoqjDOKxmazKzWnM8fco0gvhVTkPOubi3xduRlS0Qu43PZxGyUS8aMPOI
 OXDbVk2I2SW5YwH0+UUcDA+xvkj3159M0Iyfm1ZILyJf6k73pVk1QiChd
 a9NxNPcRH6o+dJAV6ui9gH3+4j/eDVxYDQvuqISy2jEkZaxtmiItCYMTF g==;
X-CSE-ConnectionGUID: Pv+g1tGuRdmfP6LFzD6L3A==
X-CSE-MsgGUID: W6dcxJ3wToub+FNJ8XwONQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89599962"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="89599962"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:15:14 -0700
X-CSE-ConnectionGUID: e2XcZ3n1RO23WI+cPceyGA==
X-CSE-MsgGUID: eaym8tXFS06ym2G/HwcQFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275334464"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 10 Sep 2026 21:15:12 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 08/10] drm/i915/display: Implement Wa_14021768792 for BMG DP
 for link_m/n ratio > 10
Date: Fri, 11 Sep 2026 09:44:47 +0530
Message-Id: <20260911041449.3699400-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911041449.3699400-1-suraj.kandpal@intel.com>
References: <20260911041449.3699400-1-suraj.kandpal@intel.com>
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
 drivers/gpu/drm/i915/display/intel_display.c |  1 -
 drivers/gpu/drm/i915/display/intel_display.h |  2 ++
 drivers/gpu/drm/i915/display/intel_dp.c      | 26 ++++++++++++++++----
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 068798658bd1..f0adf3c9a097 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -3529,7 +3529,6 @@ void intel_get_m_n(struct intel_display *display,
 	m_n->tu = REG_FIELD_GET(TU_SIZE_MASK, intel_de_read(display, data_m_reg)) + 1;
 }
 
-static
 bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
 					int m_n_ratio,
 					enum pipe pipe)
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index fc474d9cd533..dc1c0da3e45d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -526,5 +526,7 @@ int intel_crtc_num_joined_pipes(const struct intel_crtc_state *crtc_state);
 void intel_display_get_link_m_n(u32 *link_m, u32 *link_n,
 				u32 pixel_clock,
 				u32 link_clock);
+bool intel_display_can_bypass_m_n_limit(struct intel_display *display,
+					int m_n_ratio, enum pipe pipe);
 
 #endif
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 585762be07bb..27ffd937c75f 100644
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

