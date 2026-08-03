Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D7DC55AB9
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 18:33:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A39F10E776;
	Mon,  3 Aug 2026 18:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2uyG/BB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C7A10E773;
 Mon,  3 Aug 2026 18:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785782026; x=1817318026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yODvqO8ST7oWiI9XlUyc0sHhBRy0LhcFNr48xY4nN2U=;
 b=a2uyG/BBPS4GimDhcF0iAXk8AKwGki6Y91X2onSaHkSIeC1AeZ6n1m1w
 Jk5JDre0dwI+2ZwkDEPmHNJML8C+0NqQQntdNwCnyJlYuGch6cJi2n0jI
 bn7wgIxdG/JqhMxP4vGyoNwiLjRfAHOifLMemo++xMInNnm3RWMfZap76
 ELamriyLqWNFs68s94UuBs10jcqSzcLPYk0perpxQ8XUUurkLo09XZyKL
 VWxklAVnIQz+S265O+gp1stEMqdm2eCd9RmFjacpHVXQjl3w48vojcDEB
 yACL6q+jGVle6MLkmqr1AZlVrI0W46b2ixKV6IvP+vpkYrR2LGpM9oW3G w==;
X-CSE-ConnectionGUID: lXA/vYgoTcCiM7+4R9P0NQ==
X-CSE-MsgGUID: yToZ1MA9S6+W1gtkUJ/bwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="90214484"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="90214484"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 11:33:46 -0700
X-CSE-ConnectionGUID: XdqEB1L3Rmm7wXZspwqUEw==
X-CSE-MsgGUID: pi9MXj/MSRSeRMKYgJqCyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="291228610"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 11:33:45 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 2/2] drm/i915/display: Keep AS SDP flowing when skip frames is
 enabled
Date: Tue,  4 Aug 2026 00:23:05 +0530
Message-ID: <20260803185305.562609-3-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260803185305.562609-1-uma.shankar@intel.com>
References: <20260803185305.562609-1-uma.shankar@intel.com>
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

The AS SDP skip-frame mechanism relies on the AS SDP still being
transmitted (just less often) while Panel Replay is active, so the source
must not stop sending it in the PR active state, nor enter the DC3CO idle
protocol which would suppress it entirely.

When a non-zero skip-frame count is programmed, leave both
PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE and
PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL cleared. The previous behaviour
(honouring disable_as_sdp_when_pr_active and the DC3CO idle protocol) is
retained for the non skip-frame case.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 28 +++++++++++++++--------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 0f98f02a1848..7e2292f93e1e 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -439,21 +439,31 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 
 		if (intel_dp->as_sdp_supported) {
 			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
+			u32 skip_frames = 0;
+
+			/* AS SDP skip frames field only exists on Xe3LPD+ */
+			if (DISPLAY_VER(display) >= 35)
+				skip_frames = intel_pr_as_sdp_skip_frames(crtc_state);
 
 			if (crtc_state->link_off_after_as_sdp_when_pr_active)
 				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
-			if (crtc_state->disable_as_sdp_when_pr_active)
-				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 
-			if (intel_display_power_dc3co_allowed(display))
-				pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
-			else
+			/*
+			 * Skip frames needs the AS SDP to keep flowing during PR
+			 * active, so it is mutually exclusive with disabling AS SDP
+			 * transmission in active and with the DC3CO idle protocol.
+			 */
+			if (skip_frames) {
+				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
+				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
+			} else {
+				if (crtc_state->disable_as_sdp_when_pr_active)
+					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
 
-			/* AS SDP skip frames field only exists on Xe3LPD+ */
-			if (DISPLAY_VER(display) >= 35)
-				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(
-					intel_pr_as_sdp_skip_frames(crtc_state));
+				if (intel_display_power_dc3co_allowed(display))
+					pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
+			}
 
 			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
 				       pr_alpm_ctl);
-- 
2.50.1

