Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C2FC7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 22:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A1610E1F0;
	Wed, 31 May 2023 22:48:42 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FA510E09A
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 22:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685573310; x=1717109310;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KoyJxqvtLniBx7d6zEITxqgYj0CrxeZZs1vmRHRWWcs=;
 b=Mfz02LZWfz3WABB7ztpo51wu0eSrIys4kOelKKxuc59NumltaQKMO0hW
 OxHGfziKcZ8JU6dLsi0ZSTb+OJONJze4W0huaPWxEQlGKkKU+awlEkUYd
 b80OcDgPQvfa21Mab7x/MJ15nTbN4zmgz4I9sc7vLcCYznFhMYtA3eQ6r
 5V9GyccuXgHVrS11XGNsrvWvf285PveR17UAYytjRt1xtEXTL3tgUYzuA
 nEMpKCHKaH+TomnNiX5qF/MUTi2+YevBJ7ibB65zEvw990b+QCaDcdGLQ
 tmpNSJnx7MMng9Hvy8ZQGSMfYYEiC3e7f1mYPob5Twj63RRdsgnBinPTS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="354235474"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="354235474"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 15:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="1037229602"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="1037229602"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 15:48:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 15:48:13 -0700
Message-Id: <20230531224821.387722-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/8] Utilize i915 display probing
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
interface.  The final patch was intended to be squashed into
"drm/xe/display: Implement display support," but that commit has itself
been missquashed into some other patch.

A future step to further eliminate the display shim will be to split
i915's display-specific handling out of intel_device_info_runtime_init() 
into a function under display/ that can be called directly by Xe.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Matt Roper (8):
  drm/i915/display: Move display device info to header under display/
  drm/i915: Convert INTEL_INFO()->display to a pointer
  drm/i915/display: Move display runtime info to display structure
  drm/i915/display: Make display responsible for probing its own IP
  drm/i915/display: Handle GMD_ID identification in display code
  drm/i915/display: Move feature test macros to intel_display_device.h
  drm/i915/display: Include of display limits doesn't need 'display/'
  drm/xe/display: Call display probe from i915 code

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/display/intel_color.c    |  31 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_display.h  |  10 +-
 .../drm/i915/display/intel_display_device.c   | 775 ++++++++++++++++++
 .../drm/i915/display/intel_display_device.h   | 128 +++
 .../drm/i915/display/intel_display_power.c    |   6 +-
 .../drm/i915/display/intel_display_reg_defs.h |  14 +-
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |   6 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_hti.c      |   2 +-
 .../drm/i915/display/skl_universal_plane.c    |   2 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |   8 +-
 drivers/gpu/drm/i915/i915_driver.c            |  17 +-
 drivers/gpu/drm/i915/i915_drv.h               |  66 +-
 drivers/gpu/drm/i915/i915_pci.c               | 384 +--------
 drivers/gpu/drm/i915/i915_reg.h               |  33 -
 drivers/gpu/drm/i915/intel_device_info.c      | 116 +--
 drivers/gpu/drm/i915/intel_device_info.h      |  67 +-
 drivers/gpu/drm/i915/intel_step.c             |   8 +-
 drivers/gpu/drm/xe/Makefile                   |   2 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  40 +-
 .../drm/xe/display/ext/intel_device_info.c    |  60 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  56 +-
 drivers/gpu/drm/xe/xe_display.c               | 164 +---
 28 files changed, 1119 insertions(+), 890 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_device.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_device.h

-- 
2.40.1

