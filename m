Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E247FEA4FBA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F0510E3DC;
	Mon, 23 Feb 2026 14:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gjousx5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21FB10E3D3;
 Mon, 23 Feb 2026 14:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855208; x=1803391208;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ISgBmKYvPcFaEiuc7pAW0ah8Gp2xY71Ezy3GhG5pHb4=;
 b=gjousx5LG3U04urGVYOja+T8WqY5aO8lFlinUx3VQghvQ6BbWnwVjNlh
 LwpxA0oAEZ1qSlVUeo4JUf63lKCMNeaI6Z/2rEcForMklRE9FUKvAIrTa
 Sl7yjJNYn9dAsKBg93TTGDw/d8RTRthwJY+c36twA1j/WLJvD5GRrL+5n
 5w0c11Q4xE7rv3j7M4tBRff4+8h03JzmRHOUl+ACkbxrsBY5OSBkC+m8b
 Wh+kbLxctDzVDk6RJ+aPvp9hdie9I8U71yZauv/W//xUQ4bpzMnL7kj9A
 qb0+sfyZme1vbQSHD/a9LtB6NPuTvb7adGTJ2DgtAoDBTHnkFLcmOLJLw A==;
X-CSE-ConnectionGUID: WoqEPjzlTL21ULfjp5BKKg==
X-CSE-MsgGUID: BjvC0UqFSoOMAghs78iurQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72827039"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72827039"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:00:07 -0800
X-CSE-ConnectionGUID: GryBmEE4R2KrXU7mod2RdA==
X-CSE-MsgGUID: 4DjINXDCSvit/Ydtz1CkOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="212961178"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:00:05 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 03/14] drm/i915/dp: Add a helper to decide if AS SDP is needed
Date: Mon, 23 Feb 2026 19:14:20 +0530
Message-ID: <20260223134431.1639308-4-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
References: <20260223134431.1639308-1-ankit.k.nautiyal@intel.com>
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

Add a helper to check if AS SDP is needed. Currently AS SDP is only
required when VRR is enabled. However, there are other use cases, along
with the missing case of CMRR, dealt in subsequent changes.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b999d8c085c7..65764ab0bb9b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3111,6 +3111,12 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
 	vsc->content_type = DP_CONTENT_TYPE_NOT_DEFINED;
 }
 
+static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
+				  struct intel_crtc_state *crtc_state)
+{
+	return crtc_state->vrr.enable;
+}
+
 static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 				    struct intel_crtc_state *crtc_state)
 {
@@ -3118,7 +3124,10 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
-	if (!crtc_state->vrr.enable || !intel_dp->as_sdp_supported)
+	if (!intel_dp->as_sdp_supported)
+		return;
+
+	if (!intel_dp_needs_as_sdp(intel_dp, crtc_state))
 		return;
 
 	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
-- 
2.45.2

