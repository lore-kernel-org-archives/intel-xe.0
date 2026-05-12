Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E50CD4F25
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 13:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A039510EA88;
	Tue, 12 May 2026 13:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfI2O+Wf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA4E10E276;
 Tue, 12 May 2026 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778593641; x=1810129641;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GTQcBV/1RrhAvaWV+gebjB0QCh0DkpGaRlrbDaGrFqo=;
 b=TfI2O+WfHiiI0D7BDG+reqO7NqHfZF3rn0/p8pX4ArrCEg8I984kbGja
 nSwRZlpzoxxXlQwgXBdOmpYBmL4HOe6BVBQTOMg+rpf6H5lzFc174O1Ck
 IcQXT+90MASDQrXRxL4iry1EXSQ4Fxq7faN4UggvWrsQ/re0QVsRpfPsg
 ilpxFc/UvTZMgmsljHMCWOmuzN35iKfTN1h0rmghXCj8P6+rfkSynSCsp
 IL/ZjUGSHMRz2uSOXIAnSSIjk8cbAjwzq5akyQ55u0J9gqpEhPs9nm9fs
 uT3rnqwDCmcd4yPbikz/hYmU7mqe5SpEDrBRKs+tomGchkwxXT/UZyjzx Q==;
X-CSE-ConnectionGUID: ekTIu5fKT5GUpo+8ETeJNw==
X-CSE-MsgGUID: VQlCUFamSTO9knMRsi6dmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90604309"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="90604309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 06:47:20 -0700
X-CSE-ConnectionGUID: WQGu3xAeR6Sdle/1x8Yn8w==
X-CSE-MsgGUID: TAGSMZAoRF6FHd+aXh4Ouw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="261257368"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 06:47:17 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, jani.nikula@linux.intel.com,
 navaremanasi@google.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 0/6] drm/i915/intel_panel: Fix seamless VRR mode switching for
 DRRS panels
Date: Tue, 12 May 2026 19:02:43 +0530
Message-ID: <20260512133249.2475882-1-ankit.k.nautiyal@intel.com>
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

Currently intel_panel_fixed_mode() can return a lower refresh rate mode
for VRR panels if the lower refresh rate mode is first in the list.
This creates problems for seamless switch features like LRR and
Seamless-DRRS, as it results in changes to vsync_start/end causing a
full modeset instead of a seamless switch.

This is particularly problematic for DRRS panels on platforms without
double buffered M/N support for LNL+ (display version 20+), where
seamless clock changes are not possible.

This series attempts to fix this by:
1. Adding a helper to get the highest refresh rate mode from the list of
   fixed modes for a connector.
2. When a seamless switch to a lower mode is desired, making
   intel_panel_fixed_mode() return the highest refresh rate mode,
   provided the requested rate is in VRR range. The vblank is then
   extended to provide the desired refresh rate.

To determine whether a full modeset or seamless switch is intended, the
connector state is checked for the allow_modeset flag. A nullable
conn_state parameter is added to intel_panel_fixed_mode() and
intel_panel_compute_config() for this purpose.

Rev2:
 - Address Ville's comments to preserve Vtotal-Vsync distance while
   adjusting VTOTAL.
 - Address Manasi's comments to always go with highest RR mode
   irrespective of allow_modeset flag for modes that have same clock but
   different votal.

Ankit Nautiyal (6):
  drm/i915/display: Deprecate TRANS_VSYNC where VRR TG is always on
  drm/i915/panel: Preserve Vtotal-Vsync distance while adjusting vtotal
  drm/i915/intel_panel: Add a helper to get the highest refresh rate
    mode
  drm/i915/intel_panel: Pass crtc_state to intel_panel_compute_config
  drm/i915/intel_panel: Use highest refresh rate mode for VRR panels
  drm/i915/intel_panel: Refine VRR fixed mode selection for DRRS panels

 drivers/gpu/drm/i915/display/icl_dsi.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c | 19 +++-
 drivers/gpu/drm/i915/display/intel_dp.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_dvo.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_panel.c   | 94 ++++++++++++++++----
 drivers/gpu/drm/i915/display/intel_panel.h   |  9 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c    |  8 +-
 drivers/gpu/drm/i915/display/intel_vrr.c     | 31 +++++--
 drivers/gpu/drm/i915/display/vlv_dsi.c       |  2 +-
 10 files changed, 130 insertions(+), 41 deletions(-)

-- 
2.45.2

