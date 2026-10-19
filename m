Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDF7CCF2DE
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A57C10ED30;
	Mon, 19 Oct 2026 13:53:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC21C10ED4B;
 Mon, 19 Oct 2026 13:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792418012; x=1823954012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xbYj7ts8bpqpEzM24xuC261ufriwftY4EquD9ny812w=;
 b=dwKRStRk/GVl7tCNPNBKgI7V2TexbAHSqmmdKBaNz1umCJunDMfQjqjP
 K9ewm3b/2/3SU2LzyD8Xxl3aqI/ninEB8P2gUaqBrc7ar5Gkle5MncGyk
 2vNqI1LVXVId7MN21MWnaskQ3/ysgCOpDNZQHY2Lnbv1foEBpetRffl3O
 10HProMmMw8mpFeeAKHUVP+EU+YwJHVFBwMSsIyW0neq3bsjpg8Nsk47B
 Jyozbx881/If4oEj/ggpwFYyTPwDS7aMLp2anMdZAnHCC8Qd4JqQtb9X9
 MrGAHRps20T6iTfJ13lkvLMN2Vhm4ElEzt7bEcJ1jgQbXbhEnIZHnqzSs Q==;
X-CSE-ConnectionGUID: t0hA8gK5QjafG8YNwcen5w==
X-CSE-MsgGUID: 7U+OPq0KTFGKYop5WOSLig==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1085056"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1085056"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:13 -0700
X-CSE-ConnectionGUID: 93v6HrYzRyOqLYYNCROl2w==
X-CSE-MsgGUID: xXVFKHI0Rmy3/c6VV9f0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2844338"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:11 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/15] drm/i915/pfit: Make GMCH panel fitter nicer
Date: Mon, 19 Oct 2026 16:52:54 +0300
Message-ID: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Eliminate the GMCH vs. ILK+ panel fitter differences in high
level code by populating the crtc_state->pch_pfit (will be
just crtc_state->pfit from now on) information on GMCH
platofrms. Also include a few other assorted improvements
to the pfit code.

Ville Syrjälä (15):
  drm/i915/pfit: s/pch_pfit/pfit/
  drm/i915/pfit: s/intel_pch_pfit/ilk_pfit/
  drm/i915/pfit: Stop using HAS_PCH_SPLIT() in confusing places
  drm/i915/pfit: Introduce intel_pfit_get_config()
  drm/i915/pfit: Rename some pfit functions
  drm/i915/pfit: Extract i965_pfit_get_config()
  drm/i915/pfit: Drop platform check for gmch_pfit.pgm_ratios
  drm/i915/pfit: Unconfuse panel_fitter_scaling()
  drm/i915/pfit: Populate crtc_state->pfit.dst on GMCH platforms
  drm/i915/pfit: Check scaling factor on GMCH
  drm/i915/pfit: Check panel fitter source size on GMCH
  drm/i915/pfit: Extract i9xx_pfit_vscale_ratio() and
    i9xx_pfit_is_one_line_mode()
  drm/i915/pfit: No pfit one line mode on i965+
  drm/i915/pfit: Account for pfit downscaling in pixel rate on GMCH
    platforms
  drm/i915/pfit: Allow downscaling on i966+

 drivers/gpu/drm/i915/display/i9xx_wm.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_casf.c     |  28 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |  16 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  77 ++-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +-
 .../drm/i915/display/intel_display_types.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  31 +-
 drivers/gpu/drm/i915/display/intel_pfit.c     | 459 ++++++++++++++----
 drivers/gpu/drm/i915/display/intel_pfit.h     |   8 +-
 .../gpu/drm/i915/display/intel_pfit_regs.h    |   4 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     |  40 +-
 12 files changed, 447 insertions(+), 230 deletions(-)

-- 
2.55.0

