Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00BBEA4FBE
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 13:30:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56F910E3C2;
	Mon, 23 Feb 2026 13:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNj4bjuS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD05610E3B9;
 Mon, 23 Feb 2026 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771853422; x=1803389422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eJIbThSOvhhvyr2TVkh1V0NSi+LmS2OiodVKgSJrTws=;
 b=bNj4bjuSADJ6q3QVrJ6XursdFbIjm8VbAYTylgp0Hqd821dVzBa0fMcY
 WpIPAcly9Gvj4KsP3CeRnQtgPClX+BMujdSqcNI5178zh6rLEzyCoxwRI
 EVoe5WOaFFheKohrfcnM9n9eU0g5YT1qnI1XXlCO+AteKoHTdtgO13j8P
 ierpuoc4r4qw+uYhYwYE0Y8+TbBtBvJ7rz7CObi2toZfn0GU6X+tOExiG
 FhQglFZ25MWkzdLmIqfZM1mli1Ho6Zq/vQH+4qxeanqVM5MY1Tlw6OAk/
 ODQBYVeMwAs80h4RKF4Ug/Y84FLPX45p3bz4VLr2aFDTFHD9MMnHTX2ns A==;
X-CSE-ConnectionGUID: 9hUjLsl2RFWoILGaq6ydRg==
X-CSE-MsgGUID: 2y/BVRPDR6KtGO7bah0fxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72724204"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72724204"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:30:22 -0800
X-CSE-ConnectionGUID: jqOAAV6QS0WsF9fL/a/ErQ==
X-CSE-MsgGUID: Uv52UZZhTCKjVxTGXfKdwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215580504"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 05:30:20 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 11/14] drm/i915/dp: Program AS SDP DB[1:0] for PR with Link off
Date: Mon, 23 Feb 2026 18:44:23 +0530
Message-ID: <20260223131426.1638946-12-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223131426.1638946-1-ankit.k.nautiyal@intel.com>
References: <20251111093007.3771409-3-ankit.k.nautiyal@intel.com>
 <20260223131426.1638946-1-ankit.k.nautiyal@intel.com>
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

For Panel Replay with AUX-less ALPM (link-off PR), the source must send
Adaptive-Sync SDP v2. Program DB[1:0] per DP spec v2.1:
- VRR AVT: 00b (variable VTotal)
- VRR FAVT: 10b/11b (TRR not reached/reached)
- Fixed timing with PR link-off (VRR off): 01b (AS disabled; VTotal fixed)

Select SDP version v2 whenever PR link-off or VRR is active, otherwise v1,
and program the AS SDP DB[1:0] bits.

Also, drop the redundant target_rr assignment.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 5952db6197cf..ad2aceb526ff 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3139,7 +3139,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	as_sdp->duration_incr_ms = 0;
 	as_sdp->version = 0x2;
 
-	if (crtc_state->vrr.enable)
+	if (crtc_state->vrr.enable || intel_psr_is_pr_with_link_off(crtc_state))
 		as_sdp->version = 0x2;
 	else
 		as_sdp->version = 0x1;
@@ -3154,9 +3154,10 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
 		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
 		as_sdp->target_rr_divider = true;
-	} else {
+	} else if (crtc_state->vrr.enable) {
 		as_sdp->mode = DP_AS_SDP_AVT_DYNAMIC_VTOTAL;
-		as_sdp->target_rr = 0;
+	} else if (intel_psr_is_pr_with_link_off(crtc_state)) {
+		as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;
 	}
 }
 
-- 
2.45.2

