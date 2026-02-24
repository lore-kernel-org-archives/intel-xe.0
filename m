Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9BCE9B263
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 13:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC41110E14D;
	Tue, 24 Feb 2026 13:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3twyScu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92AE10E034;
 Tue, 24 Feb 2026 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941149; x=1803477149;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N+AL4RRCESICQOXmz55Hp6YeshQ9dL8xZ4hLwPLARL0=;
 b=M3twyScuXJFVXO3FNPa2slmICzlZApuGP6jJMyDv81s3rmzogc8jDivi
 6A4RjsP3/vBgfw7hrbRqsUWiyFdvwBoDeRUa5ZnT98PU1p5UMPFvHNMBM
 Sh2b3Oh5fKiQT2GxIDwdCCJTGnWsMqTY8aa90UWlHTjLYAwVeyiwfNhwe
 HXscLZmh7CrNzRCZCre1b9Lu83mgdMQ7CW/DNgX+FYBy09DoKPOxdx4Gq
 D9MsCMwNtR+XAb+PjhPFQHvsGifHqinkOWyAm8MyucuJwAIDQwCP1rikC
 qeZ5SzFJ/rmwYBoBYsrRezGRrf01xPAFjZHGiUPVseduQLLtM7BI0BrLw A==;
X-CSE-ConnectionGUID: MyDxyF9cSzKFsW+X3DLFzA==
X-CSE-MsgGUID: 1CH6R4ToRE2CJyBCvLKBCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="60530983"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="60530983"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:52:28 -0800
X-CSE-ConnectionGUID: bf1eIGyXSCuIKN0FHrvTzA==
X-CSE-MsgGUID: 1gKx31O0QjSCZAu3pW0FHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="215925191"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.201])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:52:26 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	suraj.kandpal@intel.com
Subject: [PATCH v4 00/16] drm/i915/display: convert a bunch of W/A checks to
 the new framework
Date: Tue, 24 Feb 2026 15:49:47 +0200
Message-ID: <20260224135208.140752-1-luciano.coelho@intel.com>
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

Please review.

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

