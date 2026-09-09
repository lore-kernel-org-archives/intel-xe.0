Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1814C79FB5
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7856310EF94;
	Wed,  9 Sep 2026 07:48:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DkXHcbFz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E056910EF93;
 Wed,  9 Sep 2026 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788940118; x=1820476118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ADhni/y26ZrlgoHuaN8kFwhh051HfF292qgcQaWpdn8=;
 b=DkXHcbFz+tO0uEel30bxJSCkIItRq8DQReeD026LeHCpOHHw+WNKm8hz
 X5cDXxP9uYpiJBlM9K8FqFBPLf+VEd++pq3XGYUsE8QBXlByNSa3iyu25
 FOmJa1Rn4SM+mNU00J3uXQ6EvuCUEPb6SvktSTy1Uzjm+IWl9gJVPJFmK
 c3tQCTojZrXF5C5F8BTFeEMYZuXPPWSeT4BkJl0DnJbHv5ck1gytqCcl6
 kwgUQUJ9tEgM5QxedAAp6GgHID35Tb3jxKCUx+Gv8fpj4y/EIPQM2zXMd
 0pbmd6nqzBMKL+zX1YJey4Yi/q3Bu1D9NKCJpgzGbezxe79LWuBGgEuAA Q==;
X-CSE-ConnectionGUID: tM1fjBXvQjqAvPzp+BtOHA==
X-CSE-MsgGUID: XbRxFqzORZOzcsRij8F/gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89480431"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89480431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 00:48:17 -0700
X-CSE-ConnectionGUID: MwgmjvQ7TvG3suKRmR6ZZg==
X-CSE-MsgGUID: qupB5NXrSQmalrMnMDDjSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="268680933"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 09 Sep 2026 00:48:15 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dibin.moolakadan.subrahmanian@intel.com, ramanaidu.naladala@intel.com
Cc: Uma Shankar <uma.shankar@intel.com>
Subject: [v5 4/4] drm/i915/display: Gate periodic AS SDP skip frames behind a
 debugfs knob
Date: Wed,  9 Sep 2026 13:38:10 +0530
Message-ID: <20260909080810.2202879-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260909080810.2202879-1-uma.shankar@intel.com>
References: <20260909080810.2202879-1-uma.shankar@intel.com>
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

Periodic AS SDP (skip frames) drives a Panel Replay panel down toward its
minimum refresh rate. It is a new, panel- and platform-sensitive behaviour,
so keep it opt-in rather than enabling it unconditionally.

Expose it as a per-device debugfs knob, enable_periodic_assdp, rather than a
module parameter. The behaviour is panel-specific, so the correct granularity
is per-device, not per-module. The knob is added through the intel_display_params
infrastructure (shared by i915 and xe) with a debugfs entry only. It defaults to
false (feature disabled); write 1 to the debugfs file to enable periodic AS SDP
at runtime.

Gate the feature at its single choke point, intel_pr_as_sdp_skip_frames():
returning a zero skip count when the knob is off makes both the PR_ALPM_CTL
programming (intel_alpm_configure_pr_as_sdp()) and the DC3co force-disable
predicate (intel_alpm_pr_as_sdp_skip_frames_enabled()) a no-op, so AS SDP
continues to be sent on every frame as before.

v2: Switch to debugfs entry and drop module param

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
Tested-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c           | 5 +++++
 drivers/gpu/drm/i915/display/intel_display_params.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index c784e77f610b..10943539bc7c 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -392,11 +392,16 @@ static u32 get_pr_alpm_as_sdp_transmission_time(const struct intel_crtc_state *c
  */
 static u32 intel_pr_as_sdp_skip_frames(struct intel_dp *intel_dp)
 {
+	struct intel_display *display = to_intel_display(intel_dp);
 	const struct drm_display_info *info =
 		&intel_dp->attached_connector->base.display_info;
 	int max_vrefresh = info->monitor_range.max_vfreq;
 	int min_vrefresh = info->monitor_range.min_vfreq;
 
+	/* Off by default; gated by the enable_periodic_assdp debugfs knob. */
+	if (!display->params.enable_periodic_assdp)
+		return 0;
+
 	if (min_vrefresh <= 0 || max_vrefresh <= min_vrefresh)
 		return 0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index b95ecf728daa..ba01aeaf8944 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -50,6 +50,11 @@ struct drm_printer;
 	param(bool, psr_safest_params, false, 0400) \
 	param(bool, enable_psr2_sel_fetch, true, 0400) \
 	param(int, enable_dmc_wl, -1, 0400) \
+	/*
+	 * Debugfs-only knob (per-device): no matching module_param is registered
+	 * in intel_display_params.c on purpose. Runtime-toggle via debugfs.
+	 */ \
+	param(bool, enable_periodic_assdp, false, 0600) \
 
 #define MEMBER(T, member, ...) T member;
 struct intel_display_params {
-- 
2.50.1

