Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E014C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 10:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA8710E07E;
	Fri,  3 Mar 2023 10:52:32 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3983510E07E
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 10:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677840749; x=1709376749;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1tTCUAd+j6asuvTqa8J1NIQQdw1Qq7qhBhZvd8HBvWU=;
 b=FqIuEkgJCGsmRS30Hr+b5XUD3Avd8o4uGbe8NcIXgxiAPBiTFb6DbUAZ
 ivRzKwxXkHVLZlpcQ0a0zxLplBMJHdr1TSS39FKqkR3fmzredWamPzGt+
 35pT9yvExTBDIWk+fcvWoxfc29hTBQAcoV+KBnin1rzTTqHZmjvI168EQ
 cyzvnDbrRUN/y3r7vITflmOXhwybhgRE9I5LhSY8xIYO6cNccWlDowCEe
 n6pRwVJfJOTgezrdZtvir/4abrKZbNGMR/zxl/rNOdqoWf+pKYKwKLy37
 cU4zeh8Ja8XuuggvBvlTipAn5GkluFKhECsMLGPvd+jj/RZbShvGYpK89 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337332357"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="337332357"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="1004542642"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="1004542642"
Received: from msieb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 02:52:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  3 Mar 2023 12:52:14 +0200
Message-Id: <20230303105222.3550161-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/8] drm/xe: clean up i915 includes both sides
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

v2 of https://patchwork.freedesktop.org/series/114573/

Jani Nikula (8):
  drm/i915/display: don't use relative ../i915 includes
  drm/i915/display: drop redundant display/ from includes
  drm/xe: drop unnecessary include
  drm/xe: drop redundant display/ from includes
  drm/xe: drop redundant ../ from includes
  drm/xe: move all top level i915 compat headers to a separate
    subdirectory
  drm/xe: remove unnecessary include
  drm/xe: drop top level i915 from include path

 .../gpu/drm/i915/display/intel_backlight.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 48 +++++++++----------
 .../drm/i915/display/intel_display_power.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  2 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |  2 +-
 drivers/gpu/drm/xe/Makefile                   |  7 +--
 .../i915_active_types.h                       |  0
 .../i915_drv.h                                |  2 +-
 .../drm/xe/compat-i915-headers/i915_fixed.h   |  1 +
 .../gpu/drm/xe/compat-i915-headers/i915_reg.h |  1 +
 .../xe/compat-i915-headers/i915_reg_defs.h    |  1 +
 .../drm/xe/compat-i915-headers/i915_utils.h   |  1 +
 .../i915_vma.h                                |  0
 .../i915_vma_types.h                          |  0
 .../compat-i915-headers/intel_mchbar_regs.h   |  1 +
 .../xe/compat-i915-headers/intel_pci_config.h |  1 +
 .../intel_pm_types.h                          |  2 -
 .../intel_runtime_pm.h                        |  0
 .../intel_wakeref.h                           |  0
 drivers/gpu/drm/xe/display/ext/i915_irq.c     | 18 +++----
 .../drm/xe/display/ext/intel_device_info.c    |  5 +-
 drivers/gpu/drm/xe/display/ext/intel_dram.c   |  2 +-
 drivers/gpu/drm/xe/display/ext/intel_pm.c     |  6 +--
 drivers/gpu/drm/xe/regs/xe_reg_defs.h         |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  6 +--
 drivers/gpu/drm/xe/xe_display.c               | 26 +++++-----
 30 files changed, 76 insertions(+), 72 deletions(-)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/i915_active_types.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/i915_drv.h (99%)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_fixed.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_reg_defs.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_utils.h
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/i915_vma.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/i915_vma_types.h (100%)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/intel_pm_types.h (95%)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/intel_runtime_pm.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-i915-headers}/intel_wakeref.h (100%)

-- 
2.39.1

