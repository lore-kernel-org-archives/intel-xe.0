Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F17BFF5136
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 19:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840F910E178;
	Tue,  7 Apr 2026 19:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmFGW12D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD4D10E040;
 Tue,  7 Apr 2026 19:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775590596; x=1807126596;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ARz0b09/8d7QnEKlFYMctfWAJ0BeJ/QqzMh55gH4rwc=;
 b=TmFGW12D6S5DjA5UqPjA/PtgYDO6Gyv+5S3T0GBEPD3z6y0tRWvsVpL/
 dAMnu1R2JaX567ZszU+FPH/6wljHJYXxjc2V6vKZQQPUawckpnaxPH1CX
 l0uCAN9N4YpL1s+mlDsHkrfVTNcw/+2VzDs4Xy9lPDrAzv+ThPM0XGO8Y
 gvf5I73BsucwYzaJsSPxe/GG0Hb1ghKQkCmmJTDbpcPNOndpUhBe0/HWX
 K0fDRkOJ+fEal/95hgxwlUxsi3tWweSoQcKo9KcQO1Uk4mfD5kCuo2DrQ
 drWNDj74Bp2gCwEPxPRFcQ/K0c7fOGCInkZE5JR+YIyAHLyK4VfnIf0hZ Q==;
X-CSE-ConnectionGUID: P1Er2GlATfKP0bIimlkIbQ==
X-CSE-MsgGUID: C4spHESIROmKhEP6VUjyWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80424003"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="80424003"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 12:36:35 -0700
X-CSE-ConnectionGUID: jokQgyLiR9eG0CIip7BDEQ==
X-CSE-MsgGUID: vf+TTEbUQWmLJLQ2rvf4ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="227419373"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 12:36:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH v2 0/5] drm/i915: relocate mchbar and pci regs headers
Date: Tue,  7 Apr 2026 22:36:25 +0300
Message-ID: <cover.1775590536.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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


v2 of [1] with a couple of cleanup patches added.

[1] https://lore.kernel.org/r/cover.1775559414.git.jani.nikula@intel.com

Jani Nikula (5):
  drm/i915/mchbar: include intel_mchbar_regs.h from intel_mchbar.h
  drm/i915/mchbar: drop unnecessary intel_mchbar_regs.h include
  drm/i915/mchbar: move intel_mchbar_regs.h under include/drm/intel
  drm/i915: drop unnecessary intel_pci_config.h include
  drm/i915/pci: move intel_pci_config.h under include/drm/intel

 drivers/gpu/drm/i915/display/i9xx_display_sr.c              | 2 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c                      | 1 -
 drivers/gpu/drm/i915/display/intel_backlight.c              | 2 +-
 drivers/gpu/drm/i915/display/intel_bw.c                     | 1 -
 drivers/gpu/drm/i915/display/intel_cdclk.c                  | 3 +--
 drivers/gpu/drm/i915/display/intel_display_power.c          | 1 -
 drivers/gpu/drm/i915/display/intel_dram.c                   | 1 -
 drivers/gpu/drm/i915/display/intel_lpe_audio.c              | 2 +-
 drivers/gpu/drm/i915/display/intel_mchbar.c                 | 1 -
 drivers/gpu/drm/i915/display/intel_mchbar.h                 | 2 ++
 drivers/gpu/drm/i915/display/intel_opregion.c               | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c                  | 4 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt.c                        | 2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c                | 2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c                          | 2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c               | 1 -
 drivers/gpu/drm/i915/gt/intel_llc.c                         | 2 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c                 | 2 +-
 drivers/gpu/drm/i915/gt/intel_reset.c                       | 5 +++--
 drivers/gpu/drm/i915/gt/intel_rps.c                         | 4 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c                 | 1 -
 drivers/gpu/drm/i915/gvt/cfg_space.c                        | 2 +-
 drivers/gpu/drm/i915/gvt/handlers.c                         | 1 -
 drivers/gpu/drm/i915/i915_debugfs.c                         | 2 +-
 drivers/gpu/drm/i915/i915_driver.c                          | 1 -
 drivers/gpu/drm/i915/i915_freq.c                            | 2 +-
 drivers/gpu/drm/i915/i915_gmch.c                            | 2 +-
 drivers/gpu/drm/i915/i915_hwmon.c                           | 2 +-
 drivers/gpu/drm/i915/i915_overlay.c                         | 2 +-
 drivers/gpu/drm/i915/i915_pci.c                             | 2 +-
 drivers/gpu/drm/i915/intel_clock_gating.c                   | 4 ++--
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c                 | 2 +-
 drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h  | 6 ------
 drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h   | 6 ------
 .../intel_mchbar_regs.h => include/drm/intel/mchbar_regs.h  | 0
 .../intel_pci_config.h => include/drm/intel/pci_config.h    | 0
 36 files changed, 29 insertions(+), 48 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_mchbar_regs.h
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pci_config.h
 rename drivers/gpu/drm/i915/intel_mchbar_regs.h => include/drm/intel/mchbar_regs.h (100%)
 rename drivers/gpu/drm/i915/intel_pci_config.h => include/drm/intel/pci_config.h (100%)

-- 
2.47.3

