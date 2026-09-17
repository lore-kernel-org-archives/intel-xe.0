Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626C0C982D0
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 05:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A57D10E3CA;
	Thu, 17 Sep 2026 05:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WR+pXiXU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925DE10E3CA;
 Thu, 17 Sep 2026 05:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789621671; x=1821157671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=umjZfcbOwpNS2IuQB4TKEW8R+K787+5qlmWbNRE4YWE=;
 b=WR+pXiXUPU6X1SqT6kxq2XpgEWLwb8ptl40T4FDBraaOXhms+63vhJoH
 x0D7nNKAwCTzZ0uAFJus7LX7IDUhXulH8qrKXA8c0j6x5AoODIzWvnaLP
 DnLVSQaIg1SU69sV+TpxsJLxlwvTL4JbThHzQSKvQ6Fawiwl2xKACyB2G
 JlgAmzKRmpJOJk5bKRhp2tgBlVPBjYl76RQGfviHM8R2v+uoA+TtjL/Wg
 ChaI4CgKRPbsLfP8tVMBi9NapTa4Nrvp6J4KlgxSx5uSwA4LRHBM3+KlK
 EPiavzP62ZyNERZKlu1HR07+pl+cES4Yay9ZzX+tCSUMyaObkO3UgF4Hx w==;
X-CSE-ConnectionGUID: 7l+qPdadToaKZELH0uFc0Q==
X-CSE-MsgGUID: dzJNnqU6QMm1v9z8opH+Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77569713"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77569713"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 22:07:50 -0700
X-CSE-ConnectionGUID: uvzvFXuHSFeam76jT7JVMg==
X-CSE-MsgGUID: nzpapZ69T3+HSIP2xygz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278799091"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2026 22:07:49 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v4 08/10] drm/i915/display: Implement Wa_14021768792 for BMG
 DP for link_m/n ratio > 10
Date: Thu, 17 Sep 2026 10:36:47 +0530
Message-Id: <20260917050649.871960-9-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917050649.871960-1-suraj.kandpal@intel.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
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

v2:
-Restrict the workaround to 128b/132b links.
-Clear bypass_m_n_ratio_limit on entry, so a rejected link rate cannot
leave it set for the rate that gets used. (Sashiko)

Bspec: 49266
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 31 +++++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index fbfc00101886..9c327008b733 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3373,6 +3373,9 @@ static bool can_enable_drrs(struct intel_connector *connector,
 	if (pipe_config->vrr.enable)
 		return false;
 
+	if (pipe_config->dp_m_n.bypass_m_n_ratio_limit)
+		return false;
+
 	/*
 	 * DRRS and PSR can't be enable together, so giving preference to PSR
 	 * as it allows more power-savings by complete shutting down display,
@@ -3397,18 +3400,35 @@ void intel_dp_check_m_n_ratio(struct intel_crtc_state *crtc_state,
 			      struct intel_link_m_n *m_n)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
 	int m_n_ratio;
 
-	if (!m_n || !m_n->link_n)
+	if (!m_n)
+		return;
+
+	m_n->bypass_m_n_ratio_limit = false;
+
+	if (!m_n->link_n)
 		return;
 
 	m_n_ratio = DIV_ROUND_UP(m_n->link_m, m_n->link_n);
 
-	if (m_n_ratio > max_m_n_ratio)
+	if (m_n_ratio <= max_m_n_ratio)
+		return;
+
+	if (intel_dp_is_uhbr(crtc_state) &&
+	    intel_display_can_bypass_m_n_limit(display, m_n_ratio, crtc->pipe)) {
+		m_n->bypass_m_n_ratio_limit = true;
 		drm_dbg_kms(display->drm,
-			    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
-			    m_n_ratio, max_m_n_ratio);
+			    "Bypassing Link_m/Link_n ratio limit (ratio %d)\n",
+			    m_n_ratio);
+		return;
+	}
+
+	drm_dbg_kms(display->drm,
+		    "Link M/N ratio (%d) exceeds max allowed (%d)\n",
+		    m_n_ratio, max_m_n_ratio);
 }
 
 static void
@@ -3425,7 +3445,8 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
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

