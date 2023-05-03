Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3250C77B7F
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509A610E0CB;
	Wed,  3 May 2023 13:10:15 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3289410E0CB
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119413; x=1714655413;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y3TAf6Mr8AdgUebRS9PFAuD133rjopVEPHjQvmVPSWo=;
 b=auuEcgeUehU3MDMLnyEy8JcQC0RiBntKDVIEXuTPwIZU5ZiwVeLGyy2f
 7rc2LJKcS1V0vteXnB9HdQ1RPBts+TB/YHnZYjinWZ/w8Y7my/xGj9TfU
 8vppyRNNB276uoosxYy6IGgUm5OIb66/7HjoYFy4/Jgbww7pt0RP3F3A/
 QLgq+C+MF6cIkQJJI4I947rBZ7XYOlmDbQojtf0XREhyZgY6I5l7BRlqO
 iUMd81GM0K3dUT3tUkccnLHEdVmlOUwVMuS5GlqYSPMubwUH6GTwLL07g
 8G8DRGVsgmRpZHqAYc9sCY9S+CFRLZJHHPRUqEL6LnYieZzfUq2ncv+mi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="434960671"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="434960671"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="820762183"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="820762183"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:10:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:09:47 +0300
Message-Id: <20230503131005.1602412-1-jani.nikula@intel.com>
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

Add intel_uncore.h and intel_pcode.h compat layers to direct the calls
in i915 display code properly, without needing to change a lot of call
sites in i915 display.

The main trick or hack here is adding a fake uncore member to struct
xe_device, which lets all the call sites use &i915->uncore as before,
which we can use in the glue layers to get at the struct xe_device
pointer.

The fake uncore is intentionally struct fake_uncore in xe, so you can't
really start passing around uncore pointers in display code, only do
&i915->uncore, and it'll be the correct, but different type for each
driver.

IMO the trick and the compat layers are cleaner than what we've had
before, and doesn't force using intel_de_* accessors for non-de
registers in i915 display code.

BR,
Jani.


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
 .../drm/xe/compat-i915-headers/intel_uncore.h |  99 +++++++++++
 drivers/gpu/drm/xe/display/ext/i915_irq.c     | 134 +++++++-------
 .../drm/xe/display/ext/intel_clock_gating.c   |   1 +
 .../drm/xe/display/ext/intel_device_info.c    |   1 +
 drivers/gpu/drm/xe/display/ext/intel_dram.c   |   3 +-
 drivers/gpu/drm/xe/display/xe_de.h            | 163 ------------------
 drivers/gpu/drm/xe/xe_device_types.h          |   4 +
 drivers/gpu/drm/xe/xe_display.c               |   3 +
 drivers/gpu/drm/xe/xe_mmio.h                  |   8 +
 22 files changed, 307 insertions(+), 363 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_pcode.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
 delete mode 100644 drivers/gpu/drm/xe/display/xe_de.h

-- 
2.39.2

