Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F02B1073CAB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 13:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B896310E63C;
	Wed,  8 Apr 2026 13:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBKDKIpM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E68010E63C;
 Wed,  8 Apr 2026 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775654158; x=1807190158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P3JfKXk42bl2Zs7kImU0G8YfT791pIQdeXmK0++efhM=;
 b=fBKDKIpMg7OmtyE0pqAXUL3zrzZwAckVyCCFvjvFeOXwISelQbHGbprs
 6EgVVtWn+xD3vxaKyKOXjAwfVnRNlgqbSfkBVCgfutNdFvmZBhz0hk8Vw
 XK9aroXrRnMQZ7adHSsWNGY6CWqCy27/invEuosti6yKxMHPLVfpkLGih
 W76Dt6vZcYQb2g9niiCrxaA4xvG3lTogcvIVtuEYW5m/riNUGSaBQiyht
 k5GzxdrIrFElYc6IxSLh1rJ+KPqQGlnYB8c2y253/ADRuwyzWO4GHe9U4
 WeBCSjdwlVDsHVppb3L1LZHeTnDp3Ty3aoXfMd2Ki89rcIgO2khNJFQpU A==;
X-CSE-ConnectionGUID: 1EoCo2wZS160UcN1bSGSpw==
X-CSE-MsgGUID: jRie1a6fSUOjY1D2SzB1Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88020308"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="88020308"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 06:15:58 -0700
X-CSE-ConnectionGUID: Rx//ZpfYQ3WV+JrNoDaL6A==
X-CSE-MsgGUID: YwbCdrY/SZuarPL7qFytYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="227620915"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 06:15:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH 0/4] drm/i915/display: start switching to display specific reg
 types
Date: Wed,  8 Apr 2026 16:15:47 +0300
Message-ID: <cover.1775653994.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Add intel_reg_t for display, initially as an alias to i915_reg_t, and
use it in display.

There are probably dragons in converting everything, especially with gvt
usage of _MMIO() macro, but one thing at a time. I didn't go further
this time, to avoid clashing with whatever Ville is doing with
uncore. Also, this was mostly sed, and should be easy enough to rebase
if this conflicts with the uncore stuff.

BR,
Jani.

Jani Nikula (4):
  drm/i915/display: add typedef for intel_reg_t and use it
  drm/i915/display: add struct intel_irq_regs and use it
  drm/i915/display: add struct intel_error_regs and use it
  drm/i915/display: define and use intel_reg_{offset,equal,valid}()
    helpers

 drivers/gpu/drm/i915/display/g4x_dp.c         |  4 +-
 drivers/gpu/drm/i915/display/g4x_dp.h         | 10 ++--
 drivers/gpu/drm/i915/display/g4x_hdmi.c       |  2 +-
 drivers/gpu/drm/i915/display/g4x_hdmi.h       |  6 +--
 drivers/gpu/drm/i915/display/icl_dsi.c        |  2 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_color.c    |  4 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  6 +--
 drivers/gpu/drm/i915/display/intel_crt.h      |  6 +--
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 26 +++++-----
 drivers/gpu/drm/i915/display/intel_ddi.h      |  6 +--
 drivers/gpu/drm/i915/display/intel_de.c       | 30 +++++------
 drivers/gpu/drm/i915/display/intel_de.h       | 48 +++++++++---------
 drivers/gpu/drm/i915/display/intel_display.c  |  8 +--
 drivers/gpu/drm/i915/display/intel_display.h  | 10 ++--
 .../drm/i915/display/intel_display_device.c   |  2 +-
 .../gpu/drm/i915/display/intel_display_irq.c  | 20 ++++----
 .../drm/i915/display/intel_display_power.c    |  4 +-
 .../i915/display/intel_display_power_well.c   |  8 +--
 .../drm/i915/display/intel_display_reg_defs.h | 35 +++++++++++++
 .../gpu/drm/i915/display/intel_display_regs.h | 50 +++++++++----------
 .../drm/i915/display/intel_display_types.h    | 12 ++---
 drivers/gpu/drm/i915/display/intel_dmc.c      | 50 +++++++++----------
 drivers/gpu/drm/i915/display/intel_dmc_wl.c   | 14 +++---
 drivers/gpu/drm/i915/display/intel_dmc_wl.h   |  6 +--
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c   | 28 +++++------
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |  8 +--
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 32 ++++++------
 drivers/gpu/drm/i915/display/intel_dsb.c      | 22 ++++----
 drivers/gpu/drm/i915/display/intel_dsb.h      | 10 ++--
 drivers/gpu/drm/i915/display/intel_dvo_dev.h  |  2 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      | 12 ++---
 .../drm/i915/display/intel_fifo_underrun.c    |  4 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 28 +++++------
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |  6 +--
 drivers/gpu/drm/i915/display/intel_lvds.c     |  6 +--
 drivers/gpu/drm/i915/display/intel_lvds.h     |  6 +--
 drivers/gpu/drm/i915/display/intel_mchbar.c   | 14 +++---
 drivers/gpu/drm/i915/display/intel_mchbar.h   |  8 +--
 .../gpu/drm/i915/display/intel_pch_display.c  | 14 +++---
 drivers/gpu/drm/i915/display/intel_pps.c      | 38 +++++++-------
 drivers/gpu/drm/i915/display/intel_psr.c      | 36 ++++++-------
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  6 +--
 drivers/gpu/drm/i915/display/intel_sdvo.h     | 10 ++--
 drivers/gpu/drm/i915/display/intel_snps_phy.c |  4 +-
 drivers/gpu/drm/i915/display/intel_tc.c       | 10 ++--
 drivers/gpu/drm/i915/display/intel_vblank.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     | 10 ++--
 drivers/gpu/drm/i915/display/intel_vga.c      |  4 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        | 16 +++---
 55 files changed, 377 insertions(+), 342 deletions(-)

-- 
2.47.3

