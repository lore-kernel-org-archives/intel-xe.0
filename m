Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF3FC7EE2F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 23:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B33310E33B;
	Tue,  6 Jun 2023 23:53:11 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7530D10E33B
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 23:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686095589; x=1717631589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z1f/VqqD5HXB8b0QPK+DfBIA8qxAQRB8t4so1GqdBHI=;
 b=NrOCsUTTJYPWud9eDNg9p1vgpL7pUHPMOo2qOIiLYTijwD2jyB9YrDVf
 5VwN0EFbd4zeh6juCGz0ulXHZ15isb0csbjjtxEFkS6ePseppeOF47CMk
 PXAc4u9e3HnVb1nenRKUet2I/4sIzg/Z2l+pRN6lClyj7VxC6l8uaAkSN
 kAZLqc/+/ECzfjklTh6q7+FXbYFbUreXn3rh6MA7whTFpFZD/kzv1KCpW
 MWMmQtpuhZDweZRuIYj4Xeb/mjWxik0qOtr8tGlOKnDPdwKnizBi2VPG1
 2455l511EYlferQhrzyhEy60+vYn+ebS5XNTz7ssutol7H0xFixkbkCdc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341481316"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="341481316"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 16:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="703385550"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; d="scan'208";a="703385550"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 16:52:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  6 Jun 2023 16:52:32 -0700
Message-Id: <20230606235242.1895643-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 00/10] Utilize i915 display probing
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Now that i915 has moved display IP probing into the display/ directory,
we can re-use that directly from Xe and eliminate a big chunk of Xe's
display shim.

This is mostly cherry-picks of the new i915 patches from drm-tip,
followed by an update to the Xe-specific display layer to use the new
interface.

v2:
 - Rebase on latest drm-xe-next, which has now fixed the earlier
   mis-squashing of display code.
 - Include additional cherry-pick of i915's display vs non-display
   intel_device_info_runtime_init separation.

A future step to further eliminate the display shim will be to split
i915's display-specific handling out of intel_device_info_runtime_init() 
into a function under display/ that can be called directly by Xe.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Matt Roper (10):
  drm/i915/display: Move display device info to header under display/
  drm/i915: Convert INTEL_INFO()->display to a pointer
  drm/i915/display: Move display runtime info to display structure
  drm/i915/display: Make display responsible for probing its own IP
  drm/i915/display: Handle GMD_ID identification in display code
  drm/i915/display: Move feature test macros to intel_display_device.h
  drm/i915/display: Include of display limits doesn't need 'display/'
  drm/i915: Fix error handling if driver creation fails during probe
  drm/i915/display: Extract display init from
    intel_device_info_runtime_init
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/display/intel_color.c    |  31 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_display.h  |  10 +-
 .../drm/i915/display/intel_display_device.c   | 902 ++++++++++++++++++
 .../drm/i915/display/intel_display_device.h   | 129 +++
 .../drm/i915/display/intel_display_power.c    |   6 +-
 .../drm/i915/display/intel_display_reg_defs.h |  14 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |   6 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_hti.c      |   2 +-
 .../drm/i915/display/skl_universal_plane.c    |   2 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |   8 +-
 drivers/gpu/drm/i915/i915_driver.c            |  15 +-
 drivers/gpu/drm/i915/i915_drv.h               |  66 +-
 drivers/gpu/drm/i915/i915_pci.c               | 384 +-------
 drivers/gpu/drm/i915/i915_reg.h               |  33 -
 drivers/gpu/drm/i915/intel_device_info.c      | 192 +---
 drivers/gpu/drm/i915/intel_device_info.h      |  67 +-
 drivers/gpu/drm/i915/intel_step.c             |   8 +-
 drivers/gpu/drm/xe/Makefile                   |   2 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  40 +-
 .../drm/xe/display/ext/intel_device_info.c    |  94 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  56 +-
 drivers/gpu/drm/xe/xe_display.c               | 166 +---
 28 files changed, 1199 insertions(+), 1048 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_device.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_device.h

-- 
2.40.1

