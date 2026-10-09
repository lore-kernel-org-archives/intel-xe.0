Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7B4CA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE191112059;
	Fri,  9 Oct 2026 10:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkNKmDzu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31BA112059;
 Fri,  9 Oct 2026 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791542160; x=1823078160;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZyTuiy3torNtGDWrVerQslHfJ3+5WOuFeUV8wTu+NQM=;
 b=MkNKmDzuIJ2Fb1ouwSY9zUnvTo37smCO34dQLkTZ0uDTCRbzoeU7ts7x
 lRkBnbUBvcYrEQ18U4605nTAa//xtx7M0mKxSBKzZeWGNRttmZql5KXnU
 7gE87HzO2+Z9ryq5ijRaQFkXIN1PJTvbNAidsG6s8MYwrZhi3AysdBoOc
 LolOb/6qWSsOter2XOrWTe+QZtx2C1JLNP+2Z3Ic99X0ERzA7tNhFhNYn
 6olb8XNvk1/3Qqka9fe+H7wCUinujvR0Te78MN+DIy1XmR3W6B4EE9x9J
 8wg9LUF8B5SDUFbYYYYwVXx6OSu18ppr0su+6yrfA5ZJ5pFm+UkIl1BEM Q==;
X-CSE-ConnectionGUID: mKLCFbBGTg+nYDKqU+CqQA==
X-CSE-MsgGUID: 61B6LugwQWWb3V6Hj/fjYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="219335"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="219335"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 03:35:59 -0700
X-CSE-ConnectionGUID: qM4N92wFSHagPgXJ4ygH/Q==
X-CSE-MsgGUID: QffEhuFiQDe/Ixq4PYKp3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="399264"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa002.fm.intel.com with ESMTP; 09 Oct 2026 03:35:58 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH 0/5] Move the PLL power save W/A to the display W/A framework
Date: Fri,  9 Oct 2026 10:35:46 +0000
Message-ID: <20261009103552.1864818-1-mika.kahola@intel.com>
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

W/A 14022081154 moves a dedicated display PHY that is not being brought
up to its lowest power state, so it stops blocking S0ix. Its condition
and the encoder walk were open-coded in the C10 implementation, neither
of which is specific to the C10 PHY.

Move both into a new intel_dpll_power_save_wa(), with the condition
expressed in the display W/A framework, and leave the C10 code with
just the PHY sequence. While there, restrict the W/A to port A, which
it was never meant to leave.

With the generic part split out the W/A is no longer tied to one PHY
type, so the last three patches extend it to LT PHY platforms, where
port A was left in the reset power state because only the C10 sequence
was ever implemented.

Only patch 5 is a functional change on LT PHY platforms, and only
patch 2 on WCL.

Mika Kahola (5):
  drm/i915/dpll: move the PLL power save W/A to the display W/A
    framework
  drm/i915/dpll: apply the PLL power save W/A to port A only
  drm/i915/lt_phy: split out intel_lt_phy_pll_calc_state_from_table()
  drm/i915/lt_phy: drop the unused pll argument from
    intel_lt_phy_pll_enable()
  drm/i915/lt_phy: apply the PLL power save W/A on LT PHY platforms

 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  60 ++++------
 drivers/gpu/drm/i915/display/intel_cx0_phy.h  |   2 +-
 .../drm/i915/display/intel_display_reset.c    |   4 +-
 .../gpu/drm/i915/display/intel_display_wa.c   |   2 +
 .../gpu/drm/i915/display/intel_display_wa.h   |   1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  36 +++++-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h |   1 +
 drivers/gpu/drm/i915/display/intel_lt_phy.c   | 103 +++++++++++++-----
 drivers/gpu/drm/i915/display/intel_lt_phy.h   |   2 +-
 9 files changed, 138 insertions(+), 73 deletions(-)

-- 
2.43.0

