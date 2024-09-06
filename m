Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E85CCE7B1B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 14:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0A110E6E4;
	Fri,  6 Sep 2024 14:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kuv1rMpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECF610E1B8;
 Fri,  6 Sep 2024 14:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725633189; x=1757169189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Umzr4kwMBhbtA2l0v8tMn2R+sCrgzfJhbBn7qgS7ElE=;
 b=Kuv1rMpxzgCQwP2vOEpkNFYvH2JgJYd/IoY2G10wJC8vnlCSk2RYv1S4
 Do2aLAzcxt4DxdvvLt4Oip2Bmaxi1MKRajgX3+gLQszRYYqrJEiWELURe
 cdrM+GqnyVYBeZa46Rmt80HPmWQgYgSWRczXoYWmL8FLYaFXsBuvq7YZP
 F0ZzFpPO882wIMa1zbqkpYbWbfdv4YUBSBOZM26kb4onfMFLaWxWbnkcm
 glHUE/od8jlVGFenmRVdTu1T1POSXVVDAxokFa7yHmqaN5vqHQywxd/bs
 t1EsgQSw0ilgvtWK2K77cWianbJaxqOgWH9dd0cRAKN6yk7HqGNCK2J1O g==;
X-CSE-ConnectionGUID: rSIPhDJmSuukyNGfpSMPDQ==
X-CSE-MsgGUID: xn4s6gedS2q/6YgVbeRvoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="41903015"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="41903015"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 07:33:09 -0700
X-CSE-ConnectionGUID: zfCXAB6+RuOk77F3ngqsbA==
X-CSE-MsgGUID: 7gbAizHMRFOfGbVXK8rItw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66003869"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 06 Sep 2024 07:33:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 06 Sep 2024 17:33:06 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915: Some intel_display conversions
Date: Fri,  6 Sep 2024 17:33:00 +0300
Message-ID: <20240906143306.15937-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

I somehow ended up in the power domains code and decided
to see how much of it could be converted to use struct
intel_display. The result was still too messy but at least
I managed to convert some of the dependecies in somewhat
decent way. Here they are.

Ville Syrjälä (6):
  drm/i915/cdclk: Add missing braces
  drm/i915/cdclk: Convert CDCLK code to intel_display
  drm/i915/power: Convert low level DC state code to intel_display
  drm/i915/vga: Convert VGA code to intel_display
  drm/i915/power: Convert "i830 power well" code to intel_display
  drm/i915/dmc: Convert DMC code to intel_display

 drivers/gpu/drm/i915/display/intel_cdclk.c    | 1171 +++++++++--------
 drivers/gpu/drm/i915/display/intel_cdclk.h    |   24 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   86 +-
 drivers/gpu/drm/i915/display/intel_display.h  |    5 +-
 .../drm/i915/display/intel_display_debugfs.c  |    4 +-
 .../drm/i915/display/intel_display_device.c   |    2 +-
 .../drm/i915/display/intel_display_driver.c   |   34 +-
 .../drm/i915/display/intel_display_power.c    |   93 +-
 .../i915/display/intel_display_power_well.c   |  238 ++--
 .../i915/display/intel_display_power_well.h   |   15 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      |  391 +++---
 drivers/gpu/drm/i915/display/intel_dmc.h      |   26 +-
 drivers/gpu/drm/i915/display/intel_dmc_wl.c   |    4 +-
 .../drm/i915/display/intel_modeset_setup.c    |    3 +-
 drivers/gpu/drm/i915/display/intel_vga.c      |   45 +-
 drivers/gpu/drm/i915/display/intel_vga.h      |   14 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |    3 +-
 drivers/gpu/drm/i915/i915_driver.c            |    6 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |    2 +-
 drivers/gpu/drm/i915/i915_suspend.c           |    3 +-
 drivers/gpu/drm/xe/display/xe_display.c       |    4 +-
 21 files changed, 1137 insertions(+), 1036 deletions(-)

-- 
2.44.2

