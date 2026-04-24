Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183F8FE51F4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 09:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF57C10EB08;
	Fri, 24 Apr 2026 09:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jy5k9y4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12B810EA53;
 Fri, 24 Apr 2026 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777022669; x=1808558669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YQ6FWuU6ZnXiwsadRYoGPPFo/SrH83RIm3tKyeMVXXo=;
 b=jy5k9y4sN5PgVOyTV29mQavNfJkau1193+uBthwRrIg1cOmUAgbO244s
 RP+dVXpgpgfM0oJf8KkAket0Rrt/iXU6nbcZ0XmNn2+tZPptp2X5efJg6
 MgFmoN+wK3eouXkSl7oCatL8tNnujQYjXpCRZw0v9qX3RvOei/ZHWuwHc
 ip94yKa9c/swuyX0PvYdm2rEcZQYkTn+k5NFIfoGaGO9VRGzIsPyXRMHL
 D47Vz1MqgaTEo/63qQcV4TaibF/Xlb+ekxA1PzCrrAPfgwP+uf/m8y9JF
 MqyJwq31ZBR6q0G9FzFQkOLqTAKpYB/43km4hpKYrke45wLSqYBxHhFpD Q==;
X-CSE-ConnectionGUID: 0j9bVw5ZSbSjiBOX2Ctuzg==
X-CSE-MsgGUID: 14oMLf7uQZCNcY1/IRxwuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81607526"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="81607526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:24:28 -0700
X-CSE-ConnectionGUID: BhVk10bURqS5OGU4xVFd5g==
X-CSE-MsgGUID: sfU+LQ+uTPCO4lR5Nii5nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="271029295"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 02:24:27 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/3] drm/i915/dp: Add a helper to decide if AS SDP can be used
Date: Fri, 24 Apr 2026 14:39:41 +0530
Message-ID: <20260424090942.3060291-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260424090942.3060291-1-ankit.k.nautiyal@intel.com>
References: <20260424090942.3060291-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a helper that determines whether AS SDP can be used for the
current DP configuration. For now this is true only when the sink
supports AS SDP and VRR is enabled, but more conditions may be added
later.

v2:
 - Rename to intel_dp_needs_as_sdp(). (Ville)
 - Add a #FIXME documenting non-atomic of DP SDP updates. (Ville)

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 35b8fb5740aa..a08e32c912a0 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3168,6 +3168,15 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
 }
 
+static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
+				  struct intel_crtc_state *crtc_state)
+{
+	if (!intel_dp->as_sdp_supported)
+		return false;
+
+	return crtc_state->vrr.enable;
+}
+
 static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 				    struct intel_crtc_state *crtc_state)
 {
@@ -3175,7 +3184,12 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
-	if (!crtc_state->vrr.enable || !intel_dp->as_sdp_supported)
+	/*
+	 * #FIXME: SDP/infoframe updates aren’t truly atomic, and with the new
+	 * cdclk->tc clock crossing we may transiently send a corrupted packet
+	 * if the update lands mid‑transmission.
+	 */
+	if (!intel_dp_needs_as_sdp(intel_dp, crtc_state))
 		return;
 
 	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
-- 
2.45.2

