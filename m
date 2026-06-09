Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EC4CD8CA8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 12:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A93610E280;
	Tue,  9 Jun 2026 12:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0E62l6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E27110E0B5;
 Tue,  9 Jun 2026 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781006621; x=1812542621;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nhNDU8sZM5A+zsVt5JqaOr9jF9mrLs2DjiLX7tK/pOQ=;
 b=I0E62l6I5AiBspr6siCTk0+TeGaUQ/XwfqoYQbO1gJqIoTmSd89AEC9K
 Ej1EJqTpbxWwhSAsWOSD+3+iCkIz+oei45l9F5QBQia0Lb4Zvep6vk5jy
 g9XvCnJjS5gEEz+6qbeT3We/zo/QLOwCi0bxoKrs1Rp46VdXlEU47Tyqd
 d+7K71r7hcfX1VFRHuqaju/+tgtac1KzHyKUen/xyhmuMIGdc4pAA2KKJ
 Lh7vaRE7SLaN4bdyW69NczceJN/5BH7p1b5NA5wH0OlAGGdmBRE8qZBlP
 mfpoYGaLEFit0VBZCE5ePhl8PHIhoBJkChqn2ohweJo0OSqPRaiiXBXBu g==;
X-CSE-ConnectionGUID: mDxRu+OkRd+DFhe6ROdh6g==
X-CSE-MsgGUID: 6rhE9tMhSNigTj6gePHLAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99340293"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="99340293"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:03:40 -0700
X-CSE-ConnectionGUID: v7TtdbZ2STyt31CM39myXA==
X-CSE-MsgGUID: zGi1zRA2SK2iNRVC6hV4Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; d="scan'208";a="244988226"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2026 05:03:39 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v3 00/36] For CI only: DC3CO/CMTG validation series
Date: Tue,  9 Jun 2026 17:32:14 +0530
Message-ID: <20260609120250.867750-1-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series is intended for CI validation only
and is not intended for merging.

Please provide review feedback on the original patch series:

* DC3CO: https://patchwork.freedesktop.org/series/163939/
* CMTG: https://patchwork.freedesktop.org/series/157664/

v2:
- Rebase
v3:
- Rebase to dc3co v5 and cmtg v8.

Animesh Manna (16):
  drm/i915/cmtg: Add intel_cmtg_is_allowed() for CMTG
  drm/i915/cmtg: Set CMTG clock select
  drm/i915/cmtg: Add CMTG transcoder offset in struct _device_info
  drm/i915/display: Pass target transcoder to
    intel_set_transcoder_timings()
  drm/i915/display: Skip DP_MIN_HBLANK_CTL programming for CMTG
    transcoders
  drm/i915/display: Pass transcoder to
    intel_set_transcoder_timings_lrr()
  drm/i915/cmtg: Set timings for CMTG by using transcoder timing helpers
  drm/i915/vrr: Pass transcoder to intel_vrr_set_fixed_rr_timings()
  drm/i915/cmtg: Program VRR fixed-rate timings for CMTG transcoder
  drm/i915/cmtg: Program VRR control register for CMTG transcoder
  drm/i915/cmtg: Set link M/N for CMTG transcoder
  drm/i915/cmtg: Add hook to enable CMTG with sync to port
  drm/i915/cmtg: Add a hook to make eDP transcoder secondary
  drm/i915/cmtg: Add CMTG interrupt handling
  drm/i915/cmtg: Add trigger to enable/disable cmtg
  drm/i915/cmtg: Restore CMTG after DC6 exit

Dibin Moolakadan Subrahmanian (20):
  drm/i915/cmtg: Modify existing hook to disable CMTG
  drm/i915/cmtg: Add CMTG HWGB programming
  drm/i915/cmtg: Add CMTG scan line programming
  drm/i915/display: Remove TGL DC3CO support
  drm/i915/display: Switch DC3CO enable from standalone bit to DC level
    encoding
  drm/i915/display: Use FIELD_PREP() for DC state enable bits
  drm/i915/display: Add DC3CO DC_STATE enable/disable support
  drm/i915/display: Add HAS_DC3CO() macro
  drm/i915/display: Add DC3CO support check
  drm/i915/psr: Add psr2 deep sleep helper API
  drm/i915/display: Add DC3CO compute and set target state in commit
    tail
  drm/i915/display: Store DC3CO eligibility in PSR state
  drm/i915/display: PSR2: Set idle_frames to 0 for DC3CO
  drm/i915/display: Enable DC3CO idle protocol in ALPM
  drm/i915/display: PSR Add delayed work to exit DC3CO
  drm/i915/display: Add helper to enable DC counter
  drm/i915/display: Add DC3CO count and residency in dmc debugfs
  drm/i915/display: Mask RO bits in gen9_write_dc_state()
  drm/i915/display: Guard CMTG function calls
  drm/i915/display: Enable DC3CO DC state

 drivers/gpu/drm/i915/display/intel_alpm.c     |   5 +
 drivers/gpu/drm/i915/display/intel_cmtg.c     | 274 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  14 +
 .../gpu/drm/i915/display/intel_cmtg_regs.h    |  24 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  11 +
 drivers/gpu/drm/i915/display/intel_display.c  | 110 ++++---
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +
 .../gpu/drm/i915/display/intel_display_core.h |   2 +
 .../drm/i915/display/intel_display_device.c   |  14 +
 .../drm/i915/display/intel_display_device.h   |   3 +-
 .../gpu/drm/i915/display/intel_display_irq.c  |  12 +
 .../drm/i915/display/intel_display_limits.h   |   2 +
 .../drm/i915/display/intel_display_power.c    | 172 ++++++++++-
 .../drm/i915/display/intel_display_power.h    |  40 +++
 .../i915/display/intel_display_power_well.c   |  73 +++--
 .../i915/display/intel_display_power_well.h   |   1 +
 .../gpu/drm/i915/display/intel_display_regs.h |  16 +-
 .../drm/i915/display/intel_display_types.h    |  11 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      |  16 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h |   2 +
 drivers/gpu/drm/i915/display/intel_dmc_wl.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 265 ++++++-----------
 drivers/gpu/drm/i915/display/intel_psr.h      |   1 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h |   1 +
 drivers/gpu/drm/i915/display/intel_vrr.c      |  18 +-
 drivers/gpu/drm/i915/display/intel_vrr.h      |   5 +-
 26 files changed, 826 insertions(+), 272 deletions(-)

-- 
2.43.0

