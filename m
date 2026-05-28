Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC30BCD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 05:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669F610EBF0;
	Thu, 28 May 2026 05:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUUXgRVm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE5F10EBEF;
 Thu, 28 May 2026 05:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779944521; x=1811480521;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sBzty2hjHKsH772Ad3aL+ucMhuevxrA7iAjA12mag0I=;
 b=ZUUXgRVm7ZYoawxv7XXmdkGe9J32KMt7vAIo1tnzLwqMY4G5MTUB1mJ5
 K8RYcaFP542G/CsU3TBzCFQ/UIzxjpwuTBOjH0n+N8b01bOdunPIzFBqE
 qTiHFkzu5ItNQZLlu7DyEky0i/tPZTa8QNcTL+JscoB19LMKkYaRHob2k
 9VI5TQYKtXCeiwuu17wTeVqn9r7WtNSoX1z68o6v2ueZ0TctFUla1al+d
 C2eFn/Qd7dAkuGhcGjmCSyUrCdKQPqulX6d04dM+wIruBvjUh6LwAiKSn
 sgEFLP0Kd4G7Zu7TISK5VwEFmBjNOz2Hjh8llPibELx77B4s90gYb7t9R g==;
X-CSE-ConnectionGUID: 5HK83CEfR12f/T57Pr4hww==
X-CSE-MsgGUID: 3igxtP4pSd6K2wNq47a3tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80895698"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80895698"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 22:02:01 -0700
X-CSE-ConnectionGUID: +FBSzI2PRMCTDPGleQTRxA==
X-CSE-MsgGUID: GJUotKguQ7SV3NbSiphf0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="238025859"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 22:02:00 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [CI v2 00/17] For CI only: DC3CO/CMTG validation series
Date: Thu, 28 May 2026 10:31:14 +0530
Message-ID: <20260528050131.466351-1-dibin.moolakadan.subrahmanian@intel.com>
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

This series is intended for CI validation only
and is not intended for merging.

Please provide review feedback on the original patch series:

* DC3CO: https://patchwork.freedesktop.org/series/163939/
* CMTG: https://patchwork.freedesktop.org/series/157664/

v2:
- Rebase

Dibin Moolakadan Subrahmanian (17):
  drm/i915/cmtg: Enable CMTG
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
  drm/i915/display: program CMTG before DC3CO enable
  drm/i915/display: Add RO bit masking gen9_write_dc_state()
  drm/i915/display: Enable DC3CO for display version 35+

 drivers/gpu/drm/i915/display/intel_alpm.c     |   6 +
 drivers/gpu/drm/i915/display/intel_cmtg.c     | 360 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_cmtg.h     |  17 +
 .../gpu/drm/i915/display/intel_cmtg_regs.h    |  24 +-
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  | 129 ++++++-
 .../gpu/drm/i915/display/intel_display_core.h |   3 +-
 .../drm/i915/display/intel_display_device.c   |  14 +
 .../drm/i915/display/intel_display_device.h   |   3 +-
 .../gpu/drm/i915/display/intel_display_irq.c  |  12 +
 .../drm/i915/display/intel_display_limits.h   |   2 +
 .../drm/i915/display/intel_display_power.c    |  65 +++-
 .../drm/i915/display/intel_display_power.h    |  25 ++
 .../i915/display/intel_display_power_well.c   |  49 +--
 .../i915/display/intel_display_power_well.h   |   1 +
 .../gpu/drm/i915/display/intel_display_regs.h |  23 +-
 .../drm/i915/display/intel_display_types.h    |  11 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      |  16 +-
 drivers/gpu/drm/i915/display/intel_dmc_regs.h |   2 +
 drivers/gpu/drm/i915/display/intel_dmc_wl.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 245 ++++--------
 drivers/gpu/drm/i915/display/intel_psr_regs.h |   1 +
 drivers/gpu/drm/i915/display/intel_vrr.c      |   5 +
 23 files changed, 788 insertions(+), 232 deletions(-)

-- 
2.43.0

