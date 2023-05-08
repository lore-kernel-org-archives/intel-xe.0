Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3C2C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BEE10E2DB;
	Mon,  8 May 2023 14:47:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEEA10E2DE
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557227; x=1715093227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GrE5vhz6K7XYcgp6dGvbBngnMeBEmINHF+m9D2DgsUM=;
 b=hkIZmklbmfpkchH6IqOnxFNOo9EpAHXi1iZCX3el67FyDa4wj8Fs/xSR
 mtoGRtr8yALzIPsdGZtlyu1VODECxmXafdJT3coe43ySpXPMeUGdT0u5P
 lhSGkaBwFdsAoQT5y7gXrYrY4gq+n4czHCEpFRuGc1kQFQ/NQxHskpHnX
 epa2VbHRs6pfviWPb+oRY834NuMfAk35hV8eIsj3KvTsYXtfXKEhYTYe8
 sqK1nba08UKcldi7jT+5SrSDbEgh6HNvaIhmYrR5YzpEYRp8sh5SI7ToQ
 t+mz6jVIAQ+8EjbNnQcPtz/jUJ981MO2cZG0q1vaFWoYKJq5eD7m6fLgD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="347129855"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="347129855"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="1028433343"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="1028433343"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:46:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:00 +0300
Message-Id: <20230508144618.162140-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/18] xe&i915 display integration: add uncore
 and pcode compat layers
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

v2 of
https://lore.kernel.org/r/20230503131005.1602412-1-jani.nikula@intel.com

- rebase
- fix rmw now that xe follows i915 rmw arguments


Jani Nikula (18):
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Rename intel_de.h to xe_de.h
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Add more macros to remove all direct calls to
    uncore
  fixup! drm/i915/display: Remove all uncore mmio accesses in favor of
    intel_de
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/display/hsw_ips.c        |   7 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  19 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |  34 ++--
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  45 ++---
 drivers/gpu/drm/i915/display/intel_de.h       |  54 ------
 drivers/gpu/drm/i915/display/intel_display.c  |   1 +
 .../drm/i915/display/intel_display_power.c    |   3 +-
 .../i915/display/intel_display_power_well.c   |   7 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |   9 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   9 +-
 drivers/gpu/drm/i915/display/skl_watermark.c  |  23 +--
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 +
 .../drm/xe/compat-i915-headers/intel_pcode.h  |  42 +++++
 .../drm/xe/compat-i915-headers/intel_uncore.h |  98 +++++++++++
 drivers/gpu/drm/xe/display/ext/i915_irq.c     | 118 ++++++-------
 .../drm/xe/display/ext/intel_clock_gating.c   |   1 +
 .../drm/xe/display/ext/intel_device_info.c    |   1 +
 drivers/gpu/drm/xe/display/ext/intel_dram.c   |   3 +-
 drivers/gpu/drm/xe/display/xe_de.h            | 163 ------------------
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_display.c               |   3 +
 drivers/gpu/drm/xe/xe_mmio.h                  |   8 +
 22 files changed, 298 insertions(+), 355 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
 delete mode 100644 drivers/gpu/drm/xe/display/xe_de.h

-- 
2.39.2

