Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E945CD5BC8
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 19:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AC910E50D;
	Tue, 26 May 2026 19:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9IXTbdz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29AE10E4FD;
 Tue, 26 May 2026 19:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779823133; x=1811359133;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uX3syL/RrcvIk5nH3WOA+nN5+fshTg3JX0obktMLNic=;
 b=n9IXTbdz4DZ6DA93U93e5V95rgelgLq6hl8OaVGlO80IoIIlNkT06fpc
 umuV0IN3y9rgetVA3a4uVX77RWiWu49gKWpzy1l1oelEl4fyejTbiPCgt
 2/lYLQAohL/BMZnYC9oXWJpkW/1Kjate/mNJLD5o4V95QOrQl0tcunqoT
 nneojF/odsdUVSmNmVkqijJQO+V6EitVDjnJywxCykYOTPGGXdm5nrkWT
 S4Z1Ogk4LM0djkGR6M+Nc6t7dDaWgmTMTrGdD9wWINoBV/kPjnGkWyJ10
 yFp5pqSeJbR5ZPqPJ+1hwfGPGLfbF2hg1eMQPA3+j7TTVQq+WzStdWSJB Q==;
X-CSE-ConnectionGUID: 6l8od6cqRhabNotE/94Clg==
X-CSE-MsgGUID: wQ52O3G7TsqkKGxFbAPilg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="83226277"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="83226277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:18:53 -0700
X-CSE-ConnectionGUID: 1OoUBd4pRMirnCbdHaTImA==
X-CSE-MsgGUID: qkHtSAN7QIKGoaHTvQ4u6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="237841830"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 12:18:52 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com,
	uma.shankar@intel.com
Subject: [PATCH v4 00/13] drm/i915/display: Add DC3CO support
Date: Wed, 27 May 2026 00:48:13 +0530
Message-ID: <20260526191826.3786009-1-dibin.moolakadan.subrahmanian@intel.com>
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

Dibin Moolakadan Subrahmanian (13):
  drm/i915/display: Remove TGL DC3CO support
  drm/i915/display: Switch DC3CO enable from standalone bit to DC level
    encoding
  drm/i915/display: Use FIELD_PREP() for DC state enable bits
  drm/i915/display: Add DC3CO DC_STATE enable/disable support
  drm/i915/display: Add DC3CO support check
  drm/i915/display: Add HAS_DC3CO() macro
  drm/i915/display: Add DC3CO eligibility computation
  drm/i915/display: Store DC3CO eligibility in PSR state
  drm/i915/display: PSR2: Set idle_frames to 0 for DC3CO
  drm/i915/display: Enable DC3CO idle protocol in ALPM
  drm/i915/display: PSR Add delayed work to exit DC3CO
  drm/i915/display: Add helper to enable DC counter
  drm/i915/display: Add DC3CO count and residency in dmc debugfs

 drivers/gpu/drm/i915/display/intel_alpm.c     |   6 +
 drivers/gpu/drm/i915/display/intel_display.c  | 102 +++++++-
 .../gpu/drm/i915/display/intel_display_core.h |   3 +-
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_power.c    |  44 +++-
 .../drm/i915/display/intel_display_power.h    |  23 ++
 .../i915/display/intel_display_power_well.c   |  36 ++-
 .../i915/display/intel_display_power_well.h   |   1 +
 .../gpu/drm/i915/display/intel_display_regs.h |  14 +-
 .../drm/i915/display/intel_display_types.h    |   7 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      |  16 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h |   2 +
 drivers/gpu/drm/i915/display/intel_dmc_wl.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 245 +++++-------------
 drivers/gpu/drm/i915/display/intel_psr_regs.h |   1 +
 15 files changed, 285 insertions(+), 218 deletions(-)

-- 
2.43.0

