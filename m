Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2DEC5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 12:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C7010E2E8;
	Mon, 26 May 2025 12:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z4AlDhnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FDD10E2E8
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 12:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748261131; x=1779797131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Yl9AvIiq0uaQP6hXDWtGO19r5S6xiFXsGGAq4XTC+4=;
 b=Z4AlDhnAsun95VbondtZvyT9/UpHejAF0a84AifY1U4I53Z7q2+Fz+Zt
 jQii318+WUm5kcVoopG/PvDaPIclt/XSNLcxjDU/WxmcQfyV1DZzHkB/3
 jnj/PHJS8E/yUzLWZjiTyFnMwToScWRLY7qVgHhh0wS7KwM0kVXbP74YG
 1mkMSCFGVNwLiGOaCzUzK/1aGM3WmFOjSDeXTTg+5M3F4n4aSSIoQXVG9
 9WH2ec2W4oLRqMvUXKWmrlImeDX+Fx81qJQyRkHwk3PqyJd6V6AbbFciH
 3MeIPyLcOFPOWtf4pXLXI6/79wPf+KIV+ohCQLdEIsUkip43bmv9OijfT A==;
X-CSE-ConnectionGUID: 0S7ldqxCShG+Cm6CsYf4fQ==
X-CSE-MsgGUID: VZaJeEhLS5i7bXgmgxVWAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60492280"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60492280"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:31 -0700
X-CSE-ConnectionGUID: X0NneAV7RHaULRPihUBqLg==
X-CSE-MsgGUID: ewYvjb15TW2nKWOt26rTdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147576004"
Received: from johunt-mobl9.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.138])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 05:05:30 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v4 00/12] Panel Replay + Adaptive sync
Date: Mon, 26 May 2025 15:05:00 +0300
Message-ID: <20250526120512.1702815-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

This patch set is adding missing configuration to have Panel Replay
and Adaptive Sync enabled simultaneously. Also some issues identified
while debugging are fixed:

1. Source PORT ALPM configuration has to made during modeset.
2. PHY_CMN1_CONTROL is not written according to HAS document
3. Wrong register field definitions for PORT_ALPM_LFPS_CTL.

Patches are tested on LunarLake and PantherLake using our reference panel supporting
Adaptive Sync and Panel Replay.

No changes. Resending to intel-xe@lists.freedesktop.org as previously
it wasn't testest by Xe CI at all.

v4:
  - added DP_DSC_DECODE_CAPABILITY definitions
  - use defined shift instead of hardcoded value
v3:
  - comment about DP2.1 corrected as DP2.1a
  - referring patch removed from commit message
v2:
  - rework Panel Replay DPCD register definitions
  - do not use hardcoded indices while accessing intel_dp->pr_dpcd
  - ensure ALPM registers are not written on platform where they do
    not exist
  - remove kerneldoc comments

Jouni Högander (12):
  drm/panelreplay: Panel Replay capability DPCD register definitions
  drm/dp: Add Panel Replay capability bits from DP2.1 specification
  drm/i915/psr: Read all Panel Replay capability registers from DPCD
  drm/i915/alpm: Add PR_ALPM_CTL register definitions
  drm/i915/alpm: Write PR_ALPM_CTL register
  drm/i915/psr: Add interface to check if AUXLess ALPM is needed by PSR
  drm/i915/alpm: Add new interface to check if AUXLess ALPM is used
  drm/i915/alpm: Move port alpm configuration
  drm/i915/display: Add PHY_CMN1_CONTROL register definitions
  drm/i915/display: Add function to configure LFPS sending
  drm/i915/psr: Fix using wrong mask in REG_FIELD_PREP
  drm/i915/psr: Do not disable Panel Replay in case VRR is enabled

 drivers/gpu/drm/i915/display/intel_alpm.c     | 72 +++++++++++++------
 drivers/gpu/drm/i915/display/intel_alpm.h     |  4 ++
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  | 32 +++++++++
 drivers/gpu/drm/i915/display/intel_cx0_phy.h  |  2 +
 .../gpu/drm/i915/display/intel_cx0_phy_regs.h |  3 +
 drivers/gpu/drm/i915/display/intel_ddi.c      | 12 ++++
 .../drm/i915/display/intel_display_types.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 44 +++++++-----
 drivers/gpu/drm/i915/display/intel_psr.h      |  2 +
 drivers/gpu/drm/i915/display/intel_psr_regs.h | 14 +++-
 include/drm/display/drm_dp.h                  | 24 +++++--
 11 files changed, 168 insertions(+), 45 deletions(-)

-- 
2.43.0

