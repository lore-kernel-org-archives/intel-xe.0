Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E358C27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 17:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C6F10E6F4;
	Tue, 11 Jun 2024 17:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/jUpHtq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A289A10E6F4
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 17:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718128152; x=1749664152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DTMrIgPdMlEMBXYD+V/luChBYFM2NmDJNoOTMOM3VrM=;
 b=A/jUpHtqZpydsPvs5h6Jf8K69uSZMo6Gr5G7Z6CVtvqUGn60H1ZIqJ+G
 XJWSmaj86+eK0F0LoTGU8npkHGm8floJ8c2xjkBakG3q6DFmdp/EoAiXJ
 jFClUVB6KiBptoxridwjbEQcAsNZ301pCFz1fKd1qvKsQHNCZDfH075JM
 0nNFyv4Fs/q5Hdle/hIWwLzsT8p6tafxwfrWFIwqQg8bEi6uPW70nCPjc
 ExGe1m7R8gucbCQLvycqHCafDj9yyfytqaKo2TlofWy+mra5lwH0T6gj2
 sxELXgPKaPshywHjFJHdYcGpiS7faxfA+p2vx4pRF8ltCTRqrR6SxrgMH g==;
X-CSE-ConnectionGUID: yzGiHOIaSDmULnhZXXxdtA==
X-CSE-MsgGUID: C3qL+Hu7TLi9olQX8iqINA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="26273797"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="26273797"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 10:48:59 -0700
X-CSE-ConnectionGUID: z6hO2SQCQ0ibOZ6+WtCyLQ==
X-CSE-MsgGUID: 9VswpSu7SnyX+YBnt25ZZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39571246"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa010.fm.intel.com with ESMTP; 11 Jun 2024 10:48:59 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com
Subject: [PATCH] drm/i915/display: Send vrr vsync params whne vrr is enabled
Date: Tue, 11 Jun 2024 23:19:09 +0530
Message-ID: <20240611174909.154670-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.45.2
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

Compute trans vrr vsync params only when either VRR or CMRR
is enabled.

Fixes: 5922f45329cd ("drm/i915/display: Compute vrr vsync params")
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 05f67dc9d98d..dc9cf7ddafe9 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -232,7 +232,8 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 	}
 
-	if (intel_dp_as_sdp_supported(intel_dp)) {
+	if (intel_dp_as_sdp_supported(intel_dp) &&
+	    crtc_state->vrr.enable) {
 		crtc_state->vrr.vsync_start =
 			(crtc_state->hw.adjusted_mode.crtc_vtotal -
 			 crtc_state->hw.adjusted_mode.vsync_start);
-- 
2.45.2

