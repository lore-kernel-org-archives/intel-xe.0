Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F39C624CE
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 21:14:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0F410EB4F;
	Mon, 31 Aug 2026 21:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ectROKJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2126810EB60;
 Mon, 31 Aug 2026 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788210876; x=1819746876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ftSecznwD+nvz0SD8AS92mR2O4B6g8lvFdWs/wYkQl4=;
 b=ectROKJ9XTGCQ1AHcRXi8M0L6TWtWphcvalQm3B67E7GtihuEb3pxue4
 gocCwj0KEB0WwbsG1lBScmrtWirlX8HKc8uokCyza2J55iYlKxc6sssUF
 tvEABLiBg0+MSCyTT8G0ZEeVm4fvpD48LqXWexoiQ0i4YzJp2UY3MyUrV
 2TgvjWdBnweDdmZFLVFetBfirKps9Pn9IBaRXJaJZ9ZYcVvlr/AqTTf03
 NjhCnA80t2g6fMT2KrOPqcE8nmXIX2EPA065h6R3yRzb+bibJuxawfTcL
 QDGHdJG+0JfeeB7i8nKmS8pOwLvrKXx8INMTaiJq+16R75wkLg0bEYsoR A==;
X-CSE-ConnectionGUID: FGRMDSRnSE6UWMIFG37Yew==
X-CSE-MsgGUID: ntYz0rWATeGw+KxBRrFWfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87762515"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="87762515"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 14:14:36 -0700
X-CSE-ConnectionGUID: KQWX63w2Sp2135CmJq9smQ==
X-CSE-MsgGUID: /jMTkNsjQ6OTsO7EZ38TIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="264612835"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2026 14:14:34 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 4/4] drm/i915/display: Gate periodic AS SDP skip frames behind a
 module parameter
Date: Tue,  1 Sep 2026 03:04:21 +0530
Message-ID: <20260831213421.1804635-5-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831213421.1804635-1-uma.shankar@intel.com>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
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

Add a display module parameter, periodic_assdp_enable, shared by both the
i915 and xe drivers via the intel_display_params infrastructure. It defaults
to false (feature disabled); set it to true to enable periodic AS SDP.

Gate the feature at its single choke point, intel_pr_as_sdp_skip_frames():
returning a zero skip count when the parameter is off makes both the
PR_ALPM_CTL programming (intel_alpm_configure_pr_as_sdp()) and the DC3co
force-disable predicate (intel_alpm_pr_as_sdp_skip_frames_enabled()) a no-op,
so AS SDP continues to be sent on every frame as before.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c           | 5 +++++
 drivers/gpu/drm/i915/display/intel_display_params.c | 6 ++++++
 drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index c784e77f610b..537cad13f0b4 100644
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
 
+	/* Off by default; gated by the periodic_assdp_enable module parameter. */
+	if (!display->params.periodic_assdp_enable)
+		return 0;
+
 	if (min_vrefresh <= 0 || max_vrefresh <= min_vrefresh)
 		return 0;
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/drivers/gpu/drm/i915/display/intel_display_params.c
index 2aed110c5b09..a845d29610cf 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.c
+++ b/drivers/gpu/drm/i915/display/intel_display_params.c
@@ -139,6 +139,12 @@ intel_display_param_named_unsafe(enable_dmc_wl, int, 0400,
 	"(-1=use per-chip default, 0=disabled, 1=enabled, 2=match any register, 3=always locked) "
 	"Default: -1");
 
+intel_display_param_named_unsafe(periodic_assdp_enable, bool, 0600,
+	"Enable periodic Adaptive-Sync SDP (AS SDP skip frames) for Panel Replay "
+	"to drive the panel down to its minimum refresh rate "
+	"(0=disabled, 1=enabled) "
+	"Default: 0");
+
 __maybe_unused
 static void _param_print_bool(struct drm_printer *p, const char *driver_name,
 			      const char *name, bool val)
diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/drivers/gpu/drm/i915/display/intel_display_params.h
index b95ecf728daa..4d912aab4811 100644
--- a/drivers/gpu/drm/i915/display/intel_display_params.h
+++ b/drivers/gpu/drm/i915/display/intel_display_params.h
@@ -50,6 +50,7 @@ struct drm_printer;
 	param(bool, psr_safest_params, false, 0400) \
 	param(bool, enable_psr2_sel_fetch, true, 0400) \
 	param(int, enable_dmc_wl, -1, 0400) \
+	param(bool, periodic_assdp_enable, false, 0600) \
 
 #define MEMBER(T, member, ...) T member;
 struct intel_display_params {
-- 
2.50.1

