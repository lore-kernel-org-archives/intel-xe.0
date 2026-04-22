Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D517FA1FD3
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 16:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B111310E2C9;
	Wed, 22 Apr 2026 16:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knqeWB8+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB6F10E2C3;
 Wed, 22 Apr 2026 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776875164; x=1808411164;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4TcsIkESoN6crEvV29JN1jCHYVBVVeVa44MiVRQZ1WA=;
 b=knqeWB8+gYA4L2UiRtJV+78K1PfbHRrgKu7k5lStAFU+2bkskJR37KDN
 l0ACd+vrQGXUuYe/cP4+CU1FXAxqnnyNhx4WxhrC5MGnIsoQSJu9RyjAW
 7uQ2AM6IjGEBRFoZ61yTW+7kRVk8bEoCfntYFGCUw03T+6CphmMD70kBq
 GVx/OeFC1+E6QkISBovaLptRCQlJ53Utnjp0DTh87DZLe+EtAQy1bg3A+
 KBamQe8NR2wVuT5G8XNechSaJH+EORw5Gu23zdXTWYAK+zMdXmxNvOITd
 DgMJr162eGe5Ey/phuik46ehpemPvvTCzZ5I82pzPGaK/dvqBWX34okx8 g==;
X-CSE-ConnectionGUID: sn7vczmDRvednFf1+Y+BRQ==
X-CSE-MsgGUID: 14TZRCfySrCElb3f+kZNEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95247589"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="95247589"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:04 -0700
X-CSE-ConnectionGUID: UYmgadSiQa6+KW/S/j55dw==
X-CSE-MsgGUID: VTjVIwJ+ThyUUd7Ev/v+Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="227816081"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 09:26:02 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH v2 00/13] drm/i915/display: Add DC3CO support
Date: Wed, 22 Apr 2026 21:56:08 +0530
Message-ID: <20260422162622.1869831-1-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series adds initial DC3CO support for display version 35+ and adds
debugfs visibility into DC3CO count/residency.

The series also includes required PSR/ALPM updates for DC3CO enablement.

This series is based on the CMTG enablement series currently under
review:
https://patchwork.freedesktop.org/series/157664/

DC3CO is not enabled by this series since power_domains->allowed_dc_mask
is not updated to include DC3CO.

TODO:
- CMTG restore on DC6 exit
- CMTG HWGB programming for DC3CO latencies
- Enable DC3CO in power_domains->allowed_dc_mask

Changes in v2:
- Move dc3co state from intel_atomic_state to display->power
- Squash cleanup and related patches to reduce series from 19 to 13
  patches

Dibin Moolakadan Subrahmanian (13):
  drm/i915/display: Remove TGL DC3CO support
  drm/i915/display: Switch DC3Co enable from standalone bit to DC level
    encoding
  drm/i915/display: Use FIELD_PREP() for DC state enable bits
  drm/i915/display: Add DC3CO DC_STATE enable/disable support
  drm/i915/display: Add DC3CO support check and validate target DC state
  drm/i915/display: Add HAS_DC3CO() macro
  drm/i915/display: Add DC3CO eligibility computation
  drm/i915/display: Store DC3CO eligibility in PSR state
  drm/i915/display: PSR2: Set idle_frames to 0 for DC3CO
  drm/i915/display: Enable DC3CO idle protocol in ALPM
  drm/i915/display: PSR Add delayed work to exit DC3CO
  drm/i915/display: Add helper to enable DC counter
  drm/i915/display: Add DC3CO count and residency in dmc debugfs

 drivers/gpu/drm/i915/display/intel_alpm.c     |   6 +
 drivers/gpu/drm/i915/display/intel_display.c  |  92 ++++++-
 drivers/gpu/drm/i915/display/intel_display.h  |   1 -
 .../gpu/drm/i915/display/intel_display_core.h |   3 +-
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_power.c    |  50 +++-
 .../drm/i915/display/intel_display_power.h    |  23 ++
 .../i915/display/intel_display_power_well.c   |  36 ++-
 .../i915/display/intel_display_power_well.h   |   1 +
 .../gpu/drm/i915/display/intel_display_regs.h |  14 +-
 .../drm/i915/display/intel_display_types.h    |   7 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      |  15 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h |   2 +
 drivers/gpu/drm/i915/display/intel_dmc_wl.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 230 +++++-------------
 drivers/gpu/drm/i915/display/intel_psr_regs.h |   1 +
 16 files changed, 266 insertions(+), 218 deletions(-)

-- 
2.43.0

