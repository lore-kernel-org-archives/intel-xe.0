Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E08CE937E0
	for <intel-xe@archiver.kernel.org>; Sun, 12 Apr 2026 11:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E957C10E2B9;
	Sun, 12 Apr 2026 11:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9c3NzmU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49B210E2BA;
 Sun, 12 Apr 2026 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775992103; x=1807528103;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YYM+YvQuXrqAUwtZwMqIjtspxdL3exgwNUXpth1pTHM=;
 b=m9c3NzmU50i8Fpx4E0fRtHFCJmPBc8HaoWw3JPca3qhOzxeA3kZHWi9p
 Tt+F7Rpjyd492mj6pDixgQIT5VaEg8Mg3gx1xx+BgZlw5fLfyDXLt1D3M
 Rvsn9AfW1G7PARVYj889HyO9V2kZfXgHZ/MknZIypv7pGUiO7xc4iIJ3e
 kb0Fo+sk/rUfvyZ2ZPYtNVNHPGit+PdOiE63mnmzroR4PCWOJKAOitjwv
 rCGhV6cIpkTEC+N22ZMkwTUosZTcwB3FZS4WN1mUyhP9myrGd1+m3Oinu
 clzxDyDIQaJF3MpEoostIZiNhVycJQHakdoQNzjLFuoTI5jaQhQSAGdjK g==;
X-CSE-ConnectionGUID: ROrnLlm1Qs6anF13LRpaSQ==
X-CSE-MsgGUID: XCRTFGM8Rz+5U9SxVZ2MFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76115143"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="76115143"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 04:08:22 -0700
X-CSE-ConnectionGUID: UJkVl/KiT9qrreVDkfOcow==
X-CSE-MsgGUID: qY1J8OVHRl+vdpbcgscC3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; d="scan'208";a="267507757"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa001.jf.intel.com with ESMTP; 12 Apr 2026 04:08:20 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 jani.nikula@intel.com, Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v4 13/13] drm/i915/cmtg: Set target_dc_state flag for
 lobf/psr2/pr-alpm
Date: Sun, 12 Apr 2026 16:07:12 +0530
Message-Id: <20260412103712.4021213-14-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260412103712.4021213-1-animesh.manna@intel.com>
References: <20260412103712.4021213-1-animesh.manna@intel.com>
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

Set the target_dc_state in specific scenarios such as LOBF/PSR2/PR-ALPM,
where DC3CO enablement will be targeted, allowing CMTG to be programmed.
DC3CO enablement will be implemented in a separate patch series.

Note: This patch currently added to test cmtg and need to revisit once
DC3co enablement design in finilized.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b8b6d62fb275..5de6cfde8bf5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7342,6 +7342,7 @@ int intel_dp_compute_config_late(struct intel_encoder *encoder,
 				 struct intel_crtc_state *crtc_state,
 				 struct drm_connector_state *conn_state)
 {
+	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
 	int ret;
 
@@ -7353,6 +7354,13 @@ int intel_dp_compute_config_late(struct intel_encoder *encoder,
 
 	intel_alpm_lobf_compute_config_late(intel_dp, crtc_state);
 
+	if (DISPLAY_VER(display) >= 35 && intel_dp_is_edp(intel_dp) &&
+	    (crtc_state->has_lobf || crtc_state->has_sel_update ||
+	     crtc_state->has_panel_replay))
+		intel_display_power_set_target_dc_state(display, DC_STATE_EN_DC3CO);
+	else
+		intel_display_power_set_target_dc_state(display, DC_STATE_EN_UPTO_DC6);
+
 	return 0;
 }
 
-- 
2.29.0

