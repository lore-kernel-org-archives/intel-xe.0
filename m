Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BDDD2E9C3
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 09:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E258410E443;
	Mon, 11 Nov 2024 09:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knReNnQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2202510E443;
 Mon, 11 Nov 2024 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731316193; x=1762852193;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SpY/iH3+ZO6cpqrXkddbVeZ8XoSkeC14wCg5EuKwEZM=;
 b=knReNnQ+jSIVkKRlfp4fRIJOFgdAVP0yQ1jJ78DAhV6WXn4K62H0bTfc
 YMnAMOD8Kntq1Wzp1OCIcTyIAh3owLaq/EFI55UlrFqLXKxXSWkx63+fv
 jkQ6tbUbdGHS91p0TFZLyYHHpcluEkawNl7VTODYzJ5LDTGhBv1pWGWMU
 mmJg1pT1ax+ysHC5/bR9v2zGm0KPx3CcDBLVy/K/ZG7PIlJhgaLz4h46U
 jsKXYwpRm1OSODF1jrFzOAdqfmh/aM2ePPKLFqrzDPZvDPlCvqAoyQh5V
 N2QCR2oEqe6trpoNvTzDECx3xXuPPRn+052dUewwkTpRJeIFBYH2My/6Y w==;
X-CSE-ConnectionGUID: lIfPjL1STE20X1TdF1ZkkQ==
X-CSE-MsgGUID: 16xIBOxcRmWyzzFWPh+XVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="35052301"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="35052301"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 01:09:53 -0800
X-CSE-ConnectionGUID: qtA2FHv+Q+GbLkUELmZymw==
X-CSE-MsgGUID: LY9Aga3/QXy/7ITy3/ixHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="86762527"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 01:09:50 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, mitulkumar.ajitkumar.golani@intel.com
Subject: [PATCH 00/23] Use VRR timing generator for fixed refresh rate modes
Date: Mon, 11 Nov 2024 14:41:58 +0530
Message-ID: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
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

Even though the VRR timing generator (TG) is primarily used for
variable refresh rates, it can be used for fixed refresh rates as
well. For a fixed refresh rate the Flip Line and Vmax must be equal
(TRANS_VRR_FLIPLINE = TRANS_VRR_VMAX). Beyond that, there are some
dependencies between the VRR timings and the legacy timing generator
registers.

This series is an attempt to use VRR TG for fixed refresh rate.
For platforms XE2LPD+, always go with VRR timing generator for both fixed and
variable refresh rate cases.

Rev2:
-Added support from MTL+ and for HDMI too.
-Changed VRR VSYNC programming which is required for HDMI.
-Modified vrr compute config for bigjoiner case. (Still to be tested).

Rev3:
-Start support from XE2LPD+ as MTL needs a WA to have PSR +VRR (fixed
refresh rate)
-Add changes to enable PSR with VRR with fixed refresh rate.

Rev4:
-Addressed review comments from Mitul and rebased.

Rev5:
-Avoid MSA Ignore PAR timing enable bit for fixed refresh rate
with VRR TG.
-Skip VRR compute config for HDMI connected via DP-HDMI2.1 PCON.
-Print fixed_rr along with other VRR parameters in crtc state dump.
-Rebase

Rev6:
-Refactor VRR code to have distinct modes in which VRR timing generator
can be used: VRR, FIXED_RR, CMRR.
-Bring the cmmr attributes in vrr struct.
-Remove condition flipline > vmin for LNL.
-Account for vmax being 0 based while MSA vtotal being 1 based.

Ankit Nautiyal (23):
  drm/i915/vrr: Refactor VRR Timing Computation
  drm/i915/vrr: Simplify CMRR Enable Check in intel_vrr_get_config
  drm/i915/vrr: Introduce new field for VRR mode
  drm/i915/vrr: Fill VRR mode for CMRR and dynamic VRR
  drm/i915/vrr: Rename vrr.enable to vrr.tg_enable
  drm/i915/display: Absorb cmrr attributes into vrr
  drm/i915/display: Add vrr mode to crtc_state dump
  drm/i915/vrr: Remove condition flipline > vmin for LNL
  drm/i915/vrr: Compute vrr vsync if platforms support it
  drm/i915/dp: Avoid vrr compute config for HDMI sink
  drm/i915/dp: fix the Adaptive sync Operation mode for SDP
  drm/i915/hdmi: Use VRR Timing generator for HDMI
  drm/i915/vrr: Handle joiner with vrr
  drm/i915/display: Handle transcoder timings for joiner
  drm/i915/vrr: Introduce VRR mode Fixed RR
  drm/i915/vrr: Fill fixed refresh mode in vrr_get_compute_config
  drm/i915/display: Enable MSA Ignore Timing PAR only when in not
    fixed_rr mode
  drm/i915/dp: Set FAVT mode in DP SDP with fixed refresh rate
  drm/i915/vrr: Avoid sending PUSH when VRR TG is used with Fixed
    refresh rate
  drm/i915/display: Disable PSR before disabling VRR
  drm/i915/psr: Allow PSR for fixed refrsh rate with VRR TG
  drm/i915/vrr: Always use VRR timing generator for XE2LPD+
  drm/i915/display: Use VRR timings for XE2LPD+ in modeset sequence

 .../drm/i915/display/intel_crtc_state_dump.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  61 ++--
 .../drm/i915/display/intel_display_types.h    |  18 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  19 +-
 .../drm/i915/display/intel_dp_link_training.c |   8 +-
 drivers/gpu/drm/i915/display/intel_dsb.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   3 +
 .../drm/i915/display/intel_modeset_setup.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   5 +-
 drivers/gpu/drm/i915/display/intel_vblank.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      | 271 +++++++++++++-----
 drivers/gpu/drm/i915/display/skl_watermark.c  |   2 +-
 13 files changed, 279 insertions(+), 127 deletions(-)

-- 
2.45.2

