Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A3BF30928
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 10:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FF010EB9C;
	Thu,  5 Mar 2026 10:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ldk0V1Sk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5E110E28E;
 Thu,  5 Mar 2026 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772704874; x=1804240874;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v1xf8WgnUelQYFT9WXC+EioUMpMIX59IgrO8KVjDeKM=;
 b=Ldk0V1SklO88cS2YhwGyMKIdTRbGzkgRNxy59GVYQP/ebtVNU0rAEmuw
 D8t7x9yfm2WjBeZ/t0rOxPZP1WX9IyV14jbs/L/Bcf4Qy3DWfy+jdc+zR
 o+NVlToZYSbpDCrkGbw9d42XEOKzDcsL8dkCgHLdRD19WaDi5W9qQZpHN
 Zn8+qyHVlc9juYP/2Z+mmEIeDbtGfIyyIxLd0xgJInWsH3V0wV3kjzIJl
 y581foABsXlJD30P/gzSRc0RaLtX+9rQSHNHHaPw3bxWERopVqBRt5z5M
 WNwxKBpz/8yekyMG4iEOA8qJg/K9b+6Sopod2Vp35gCqeo4X8KV1MEPdm Q==;
X-CSE-ConnectionGUID: zArWBrBgRYWDxynTHAMUuA==
X-CSE-MsgGUID: Ee1VLPQfSrGW5aW0XOYUSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73758068"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73758068"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:13 -0800
X-CSE-ConnectionGUID: 1H6Du8BuROKk1WX/bbGyMA==
X-CSE-MsgGUID: AvP8id7nSS6vZRXlEBD6xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="215460217"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.57])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:01:11 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v5 00/16] drm/i915/display: convert a bunch of W/A checks to
 the new framework
Date: Thu,  5 Mar 2026 11:59:03 +0200
Message-ID: <20260305100100.332956-1-luciano.coelho@intel.com>
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

In v3:
   * Added a comment back (accidentally removed) (Ville);
   * Inverted the logic of W/A 16025596647 (Ville);
   * Removed macro magic (Ville).

In v4:
   * Fix checkpatch warnings (checkpatch/Suraj).

In v5:
   * Just fixed a tiny rebase conflict, just an #include that was
     removed, which conflicted with the one I had added.

Cheers,
Luca.


Luca Coelho (16):
  drm/i915/display: remove enum macro magic in intel_display_wa()
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

 drivers/gpu/drm/i915/display/intel_audio.c    | 24 +++----
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  7 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |  3 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  6 +-
 .../drm/i915/display/intel_display_device.c   |  3 +-
 .../drm/i915/display/intel_display_power.c    | 22 +++---
 .../i915/display/intel_display_power_well.c   |  4 +-
 .../gpu/drm/i915/display/intel_display_wa.c   | 67 ++++++++++++++++++-
 .../gpu/drm/i915/display/intel_display_wa.h   | 27 +++++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      | 12 ++--
 drivers/gpu/drm/i915/display/intel_flipq.c    | 13 +---
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  6 +-
 .../drm/i915/display/intel_modeset_setup.c    |  3 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c |  8 ++-
 drivers/gpu/drm/i915/display/intel_psr.c      | 20 +++---
 drivers/gpu/drm/i915/display/skl_scaler.c     |  2 +-
 .../drm/i915/display/skl_universal_plane.c    |  6 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |  3 +-
 20 files changed, 164 insertions(+), 79 deletions(-)

-- 
2.51.0

