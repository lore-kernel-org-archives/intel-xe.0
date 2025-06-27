Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C35AC7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 11:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FBC10E9CE;
	Fri, 27 Jun 2025 11:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WNNTlTOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC33410E9CE;
 Fri, 27 Jun 2025 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751024199; x=1782560199;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RGmq25A3mNZ04s92MLEjDBHT3F+05A/ZCkIqFnmPINQ=;
 b=WNNTlTOcB37H67RxMbJGvD87yKB/QG+sKPZEyeTznLTsst9Vs4zwtp7r
 xAEy2ILZ+PdEMTRvWJ5R6fbqFQVNrzyghOVK/rmALToSieoqJUnzLDFbO
 puTA7zrOb90cyzjhrUJ/8RjoSx9e914h4MEFNc8hDJqsqsxk3iRNkWUSs
 uty2Ju/iHDTaCaCVGznHvW+Vd+WtRqopBuV7She7EEETI/G1S3ycr4IAW
 dbzqBr3cJLoEjvyNMjFr11vnafS1+qHfsWd+sgcrfdIR3qxhIOiEW7eUB
 pjUW4NG0FTyRnl0+iANpbrfHaQYA+j5On3kbIToEwpQNEHRNjG5xz76W+ A==;
X-CSE-ConnectionGUID: e1bE47/CQyGB659K1yf9iw==
X-CSE-MsgGUID: t4VM1JynRDWDtJyU5UKpVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53416246"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53416246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 04:36:38 -0700
X-CSE-ConnectionGUID: klyi8gERQEiIYVltVqE/Wg==
X-CSE-MsgGUID: 0m/38x0cT/SdOG6C2cKbhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="153310966"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.146])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 04:36:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 00/18] drm/i915/display: convert to generic read_poll_timeout()
Date: Fri, 27 Jun 2025 14:36:14 +0300
Message-Id: <cover.1751023767.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

Convert waits that are not related to MMIO reads to the generic iopoll.h
read_poll_timeout() helper.

Together with [1] and [2], this series completely removes the custom
i915_utils.h wait macro usage from display code, and unifies on the
kernel generic poll waiter.


BR,
Jani.

[1] https://lore.kernel.org/r/cover.1750959689.git.jani.nikula@intel.com
[2] https://lore.kernel.org/r/20250626192632.2330349-1-jani.nikula@intel.com


Jani Nikula (18):
  drm/i915/hdmi: use generic read_poll_timeout() instead of __wait_for()
  drm/i915/hdcp: use generic read_poll_timeout() instead of __wait_for()
  drm/i915/dsi: use generic read_poll_timeout() instead of wait_for_us()
  drm/i915/dsi-pll: use generic read_poll_timeout() instead of
    wait_for()
  drm/i915/gmbus: use generic read_poll_timeout*() instead of
    wait_for*()
  drm/i915/wm: use generic read_poll_timeout() instead of wait_for()
  drm/i915/cdclk: use generic read_poll_timeout() instead of wait_for()
  drm/i915/power: use generic read_poll_timeout() instead of wait_for()
  drm/i915/power-well: use generic read_poll_timeout() instead of
    wait_for() for DKL PHY
  drm/i915/power-well: use generic read_poll_timeout() instead of
    wait_for() for VLV/CHV
  drm/i915/dp: use generic read_poll_timeout() instead of wait_for()
  drm/i915/dp: use generic read_poll_timeout() instead of wait_for() in
    link training
  drm/i915/vblank: use generic read_poll_timeout() instead of wait_for()
  drm/i915/tc: use generic read_poll_timeout() instead of wait_for()
  drm/i915/dsb: use generic read_poll_timeout() instead of wait_for()
  drm/i915/lspcon: use generic read_poll_timeout() instead of wait_for()
  drm/i915/opregion: use generic read_poll_timeout() instead of
    wait_for()
  drm/i915/ddi: prefer read_poll_timeout() over readx_poll_timeout()

 drivers/gpu/drm/i915/display/i9xx_wm.c        | 18 ++++++--
 drivers/gpu/drm/i915/display/icl_dsi.c        | 20 +++++++--
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 41 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_ddi.c      | 33 ++++++--------
 .../drm/i915/display/intel_display_power.c    |  9 +++-
 .../i915/display/intel_display_power_well.c   | 43 +++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c       | 23 +++++-----
 .../drm/i915/display/intel_dp_link_training.c | 19 ++++++--
 drivers/gpu/drm/i915/display/intel_dsb.c      | 12 +++++-
 drivers/gpu/drm/i915/display/intel_gmbus.c    | 15 +++++--
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  9 ++--
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 10 ++---
 drivers/gpu/drm/i915/display/intel_lspcon.c   | 14 ++++--
 drivers/gpu/drm/i915/display/intel_opregion.c | 11 +++--
 drivers/gpu/drm/i915/display/intel_tc.c       | 18 +++++++-
 drivers/gpu/drm/i915/display/intel_vblank.c   | 10 ++++-
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c    | 10 ++++-
 17 files changed, 210 insertions(+), 105 deletions(-)

-- 
2.39.5

