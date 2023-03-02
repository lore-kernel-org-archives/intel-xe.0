Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DEEC6FA8E
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 14:31:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C424610E4F6;
	Thu,  2 Mar 2023 14:31:02 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C5610E4F6
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677767460; x=1709303460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=diXjJts2XO36KKO2YrSQ9n1CvIhuKRuX9bR8qRvH/yQ=;
 b=EMKA09uS8OTmvnHMiKrdvabwgM7RCYGCLI6mfS4Bp9/UHwQOMz3RoyRW
 gLEZrsyQgQp1aabtC3k3X8wrRBv7jKysXbuhOYJpqoiAVKqJIyaZKXWef
 pIuXVX0mAUjoPFAOQnO4MeeUP/pB/K69ZHPDDdqaEmkkTDv8l6AVobgZ4
 duIoEVoLMVA145cAPU/iOinLltUa4EnBie3mXff858kEuvyemb8mm5iUN
 w/qhMylDrpCwIn6sEVkDNdsK36shkns7DetT5KxsEhXnRFQ4WBm5CqwIi
 PRKuN7dc1gM+Fburhv9mSQ5QacWVPPdPvpwrmZT61J62bKRXW69rVl9S8 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="337033215"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="337033215"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:16:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668265151"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="668265151"
Received: from martamon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.57.129])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 06:12:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 16:12:22 +0200
Message-Id: <20230302141230.2804699-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/8] drm/xe: clean up i915 includes both sides
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

This probably needs to be rebased on top of "Encapsulate display" from
Lucas. Sending to present some ideas anyway.

1) Clean up changes to i915 that would not be accepted to upstream i915

2) Never add top level i915 directory to include search path with -I,
   not even when building with CONFIG_DRM_XE_DISPLAY=y

3) Instead, add the handful of proxy headers under compat-headers/ so
   that we have an explicit list of headers that we include from i915,
   instead of hidden by the search path

4) Currently compat-headers is added to search path unconditionally, but
   after Lucas' changes we can move that to CONFIG_DRM_XE_DISPLAY=y


BR,
Jani.


[1] https://patchwork.freedesktop.org/series/114541/ 



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
 drivers/gpu/drm/xe/Makefile                   | 11 +++--
 .../i915_active_types.h                       |  0
 .../xe/{display => compat-headers}/i915_drv.h |  2 +-
 .../gpu/drm/xe/compat-headers/i915_fixed.h    |  1 +
 drivers/gpu/drm/xe/compat-headers/i915_reg.h  |  1 +
 .../gpu/drm/xe/compat-headers/i915_reg_defs.h |  1 +
 .../gpu/drm/xe/compat-headers/i915_utils.h    |  1 +
 .../xe/{display => compat-headers}/i915_vma.h |  0
 .../i915_vma_types.h                          |  0
 .../drm/xe/compat-headers/intel_mchbar_regs.h |  1 +
 .../drm/xe/compat-headers/intel_pci_config.h  |  1 +
 .../intel_pm_types.h                          |  2 -
 .../intel_runtime_pm.h                        |  0
 .../intel_wakeref.h                           |  0
 drivers/gpu/drm/xe/display/ext/i915_irq.c     | 18 +++----
 .../drm/xe/display/ext/intel_device_info.c    |  5 +-
 drivers/gpu/drm/xe/display/ext/intel_dram.c   |  2 +-
 drivers/gpu/drm/xe/display/ext/intel_pm.c     |  6 +--
 .../gpu/drm/xe/display/intel_display_core.h   |  2 +
 drivers/gpu/drm/xe/regs/xe_reg_defs.h         |  2 +-
 drivers/gpu/drm/xe/xe_display.c               | 26 +++++-----
 30 files changed, 77 insertions(+), 71 deletions(-)
 rename drivers/gpu/drm/xe/{display => compat-headers}/i915_active_types.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-headers}/i915_drv.h (99%)
 create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_fixed.h
 create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_reg.h
 create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_reg_defs.h
 create mode 100644 drivers/gpu/drm/xe/compat-headers/i915_utils.h
 rename drivers/gpu/drm/xe/{display => compat-headers}/i915_vma.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-headers}/i915_vma_types.h (100%)
 create mode 100644 drivers/gpu/drm/xe/compat-headers/intel_mchbar_regs.h
 create mode 100644 drivers/gpu/drm/xe/compat-headers/intel_pci_config.h
 rename drivers/gpu/drm/xe/{display => compat-headers}/intel_pm_types.h (95%)
 rename drivers/gpu/drm/xe/{display => compat-headers}/intel_runtime_pm.h (100%)
 rename drivers/gpu/drm/xe/{display => compat-headers}/intel_wakeref.h (100%)
 create mode 100644 drivers/gpu/drm/xe/display/intel_display_core.h

-- 
2.39.1

