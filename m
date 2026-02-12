Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A41FEEA845
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 18:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B970810E28E;
	Thu, 12 Feb 2026 18:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cKKNiqZl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFA510E289;
 Thu, 12 Feb 2026 18:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770922103; x=1802458103;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tNlBaglZ2un3woa2RpJSVT+Y4WohjUmstN3DsXNWUfo=;
 b=cKKNiqZlIoygOgaWIRbogMbIHFv0hT0yaX2jlwA/E3lHWY7e4jhWTsKJ
 Pl4M7Qp6+PbhBuAOPrSZrmlolBs8tEeiw5F3GL5y4Ha6iV8S+BQCsJtSb
 L4B7ZQ4DF1EiNhKXMZk3NrodlPwmp/AKjl+jzKklQpwHUFkGr01BzGwqS
 DGmBya5TcEirKQTI1ymYqEwPMGMWDxxXqZ1tk6I1gU7VH00mnPvOIwoX/
 ZDGh+ZEh3Uh6zkCIwmtIKjTYX/MOaJWG7t0n8roFt1AS7GV7YP3aitz1z
 PF6i+oS/x0EVtxRVJhnZyb1L9kQiQVHsKBasZCU+SdQc2AhXThAR+dgSt A==;
X-CSE-ConnectionGUID: JjG+khrVRH6woSPgvuXzxw==
X-CSE-MsgGUID: yBv3FR27ToGL0APyOtnGxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72204100"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="72204100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:23 -0800
X-CSE-ConnectionGUID: PhSWmBxBQOGc3HCV3wneqQ==
X-CSE-MsgGUID: BAjSZZ2NTF2Uz1tguJ37EQ==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.245.217])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:48:22 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 00/15] drm/i915/display: convert a bunch of W/A checks to
 the new framework
Date: Thu, 12 Feb 2026 20:45:58 +0200
Message-ID: <20260212184737.352515-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.51.0
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

Hi,

This series convert the "low hanging fruits" of workaround checks to
the new framework.  Some of the workarounds check other values that
are not in the intel_display structure, so they don't directly fit in
the workaround framework and will be left for later.

In v2:
   * Added intel-xe in Cc for xe CI (Jani);
   * Removed NOP intel-overlay.c patch (Jani).

Please review.

Cheers,
Luca.


Luca Coelho (15):
  drm/i915/display: convert audio workaround to new framework
  drm/i915/display: convert W/As in intel_display_power.c to new
    framework
  drm/i915/display: convert W/As in intel_cdclk.c to new framework
  drm/i915/display: convert W/As in intel_cursor.c to new framework
  drm/i915/display: convert W/As in intel_ddi.c to new framework
  drm/i915/display: convert W/As in intel_display.c to new framework
  drm/i915/display: convert W/As in intel_display_device.c to new
    framework
  drm/i915/display: convert W/As in intel_dp_mst.c to new framework
  drm/i915/display: convert W/As in intel_fbc.c to new framework
  drm/i915/display: convert W/As in intel_flipq.c to new framework
  drm/i915/display: convert W/As in intel_modeset_setup.c to new
    framework
  drm/i915/display: convert W/As in intel_pmdemand.c to new framework
  drm/i915/display: convert W/As in intel_psr.c to new framework
  drm/i915/display: convert W/As in skl_universal_plane.c to new
    framework
  drm/i915/display: convert W/As in skl_watermark.c to new framework

 drivers/gpu/drm/i915/display/intel_audio.c    | 16 +----
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |  3 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  4 +-
 .../drm/i915/display/intel_display_device.c   |  3 +-
 .../drm/i915/display/intel_display_power.c    | 22 +++----
 .../gpu/drm/i915/display/intel_display_wa.c   | 65 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_display_wa.h   | 25 +++++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |  4 +-
 drivers/gpu/drm/i915/display/intel_flipq.c    | 13 +---
 .../drm/i915/display/intel_modeset_setup.c    |  3 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c |  8 ++-
 drivers/gpu/drm/i915/display/intel_psr.c      | 20 +++---
 .../drm/i915/display/skl_universal_plane.c    |  6 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |  3 +-
 17 files changed, 140 insertions(+), 64 deletions(-)

-- 
2.51.0

