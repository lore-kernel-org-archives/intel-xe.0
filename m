Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5159CFF885E
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 11:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A34B10E058;
	Mon, 27 Apr 2026 11:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jaHkhEg5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26BC10E058;
 Mon, 27 Apr 2026 11:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777287878; x=1808823878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nyn01qNrubzw8ywsmCHb4NJMI3YFqjPKuCzEcojY/KE=;
 b=jaHkhEg59TqibzbIvngTOaRG/ImcLPEiRmIhPTCxkc8mGOwKxEHlrMsq
 pPSYHF456xHcsZ9aGOaEPF5fCAJ1zKE+KeX27bVmgROjvR20kEy7lsBmg
 Xccnkppfpp/q5r+MD9wMhIB/re8Mg/Qs6jHU9PmlAY6ElhpNmHXWDDTCa
 3mnKg8mL8Ina5pGWeExarFbrDC+ijg0NQe+RZPzqiUqiwB1k7lf2133Rs
 EOrsh+3g2MuezX5+GMGGHUqMWc1LULZw7USRGfL6DF/CznRFkM8unkcnV
 /ZQtScIjPQ5RgJV+QRuDnzbbq1snxgW46t1qBP7Xg/Zomwi+0XvtR/1PZ A==;
X-CSE-ConnectionGUID: 9c9BOX+URfCDbHNtz60fSA==
X-CSE-MsgGUID: +YtrFVaRT2+tqx9Salr+LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78189044"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78189044"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 04:04:38 -0700
X-CSE-ConnectionGUID: +6odCcOBT3WxSsSjSa0CpQ==
X-CSE-MsgGUID: 0peF5Lh2TBmL76v3huQWkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="256921674"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.53])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 04:04:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/6] drm/i915: crtc iteration cleanups
Date: Mon, 27 Apr 2026 14:04:26 +0300
Message-ID: <cover.1777287836.git.jani.nikula@intel.com>
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

Some cleanups to crtc iteration.

Jani Nikula (6):
  drm/{i915,xe}: move xe_display_flush_cleanup_work() to i915 display
  drm/i915/display: switch from drm_for_each_crtc() to
    for_each_intel_crtc()
  drm/i915/display: always pass display->drm to for_each_intel_crtc*()
  drm/i915/display: pass struct intel_display to all
    for_each_intel_crtc*() macros
  drm/i915/display: stop passing i to for_each_*_intel_crtc_in_state()
    macros
  drm/i915/display: stop passing i to
    for_each_pipe_crtc_modeset_{enable,disable}()

 drivers/gpu/drm/i915/display/i9xx_wm.c        |  32 +--
 drivers/gpu/drm/i915/display/intel_atomic.c   |   3 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  14 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |  13 +-
 drivers/gpu/drm/i915/display/intel_dbuf_bw.c  |   7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  10 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 193 +++++++++---------
 drivers/gpu/drm/i915/display/intel_display.h  |  80 ++++----
 .../drm/i915/display/intel_display_debugfs.c  |   6 +-
 .../drm/i915/display/intel_display_power.c    |   2 +-
 .../drm/i915/display/intel_display_trace.h    |   6 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  11 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c  |   2 +-
 .../gpu/drm/i915/display/intel_dp_tunnel.c    |   8 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   2 +-
 drivers/gpu/drm/i915/display/intel_drrs.c     |   4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_fdi.c      |   3 +-
 .../drm/i915/display/intel_fifo_underrun.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_flipq.c    |   2 +-
 .../gpu/drm/i915/display/intel_global_state.c |   8 +-
 .../drm/i915/display/intel_initial_plane.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c  |   2 +-
 .../gpu/drm/i915/display/intel_load_detect.c  |   2 +-
 .../drm/i915/display/intel_modeset_setup.c    |  32 +--
 drivers/gpu/drm/i915/display/intel_plane.c    |   9 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c |   6 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      |   4 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |  38 ++--
 drivers/gpu/drm/xe/display/xe_display.c       |  27 +--
 34 files changed, 252 insertions(+), 305 deletions(-)

-- 
2.47.3

