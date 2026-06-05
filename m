Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277B8CD6E5D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 08:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D011310E51E;
	Fri,  5 Jun 2026 08:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZ+q0b5q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9843310E51E;
 Fri,  5 Jun 2026 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780649106; x=1812185106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IvpY4Wv928RHSDMiLHHYuoyLwVPGWLE/RU9RLwl2Elc=;
 b=SZ+q0b5qiofkgrJf58faixDJb1aQAgJq7VBgvUNmxv1OwZ8Cvl7SNGYl
 Tai+1b2w6vkUrSTop9JUHtcb068Gd2rnpZkbPPJ9mDkJhSAK9maNn/hdd
 k+Ov2nYaUv4jqzj6xkGErsdeMJUzEEH0hQj2YLNxrXn4CLxGmvN30m/T1
 vN3b16j9k7YwF7Tq1KrHAExlGZ1hrfkPEUGiIKlJXD42eLKwc2Iu2wmL3
 0F4jmo4VmOTBCes719USUIGjsawtVC4qDhdONFLaT6oZrO4PPhi2deBk0
 t85ytEQlbdf9pu3/IaEIIVxVKse6IYktF17/c3T72wcvlj8dTmGKX0pD8 Q==;
X-CSE-ConnectionGUID: J3Kv7IHgRhiPSqrxRhK+/Q==
X-CSE-MsgGUID: 5Lw0tWMNTyOBFYxj2hcbhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81666408"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81666408"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 01:45:05 -0700
X-CSE-ConnectionGUID: ME4tPHENQDC+Vf3plqECeQ==
X-CSE-MsgGUID: gORTPVfkRC6zb1op7JeruQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="246624098"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 01:45:03 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v5 00/14] drm/i915/display: Add DC3CO support
Date: Fri,  5 Jun 2026 14:14:07 +0530
Message-ID: <20260605084421.3912865-1-dibin.moolakadan.subrahmanian@intel.com>
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
- Enable DC3CO in power_domains->allowed_dc_mask

Changes in v2:
- Move dc3co state from intel_atomic_state to display->power
- Squash cleanup and related patches to reduce series from 19 to 13
  patches

Changes in v3:
- Fix trigger always returning zero in intel_dc3co_compute_state().

Changes in v4:
- Call intel_display_power_set_target_dc_state() only when
  DC3CO is supported.
- Add as_sdp_supported check for Panel Replay trigger.
- Add 1:1 pipe-port mapping check for display version 35
  in intel_dc3co_port_pipe_compatible() and change 
  dc3co eligibility compute logic.
- Re-arm DC3CO work in PSR resume, and schedule it 
  from intel_psr_post_plane_update() to cover cases
  where no PSR flush occurs.
- Remove dc state validation that could break the fallback mechanism.
- Keep dc5_reg initialization in the xe3lp debugfs
  to avoid invalid register access.

Changes in v5:
- Move dc3co functions to intel_display_power.c.
- Add psr2_deep_sleep helper API.
- Rename dc3co_eligible to dc3co_allowed
- Add DC3CO compute and set target state in commit tail.

Dibin Moolakadan Subrahmanian (14):
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

 drivers/gpu/drm/i915/display/intel_alpm.c     |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  14 +-
 .../gpu/drm/i915/display/intel_display_core.h |   2 +
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_power.c    | 151 +++++++++-
 .../drm/i915/display/intel_display_power.h    |  38 +++
 .../i915/display/intel_display_power_well.c   |  49 ++--
 .../i915/display/intel_display_power_well.h   |   1 +
 .../gpu/drm/i915/display/intel_display_regs.h |  14 +-
 .../drm/i915/display/intel_display_types.h    |   7 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      |  16 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h |   2 +
 drivers/gpu/drm/i915/display/intel_dmc_wl.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 265 ++++++------------
 drivers/gpu/drm/i915/display/intel_psr.h      |   1 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h |   1 +
 16 files changed, 351 insertions(+), 218 deletions(-)

-- 
2.43.0

