Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0482C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 12:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C535610E96B;
	Wed, 19 Apr 2023 12:39:58 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E1B10E96B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681907995; x=1713443995;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cKY1CmY9yZH59yLjGy8XL6kDLnU3Ebws+B31NEkLwhA=;
 b=Osh5QoISSjXfGzOg2Ev4vJhlQ2+ZLwVtLyy0EcKICssgP/4KggXFqSge
 os5YmyOcjG/qrHRL6d77nVNPTgCCFf4p8vTSNvggCvv0rMCjftKTW78Sp
 Kq0UKSiWzf4+jYmo17bzsQkIgUtvWR2VujR+mfrFn9fBjH5/K5M2Hv+aN
 UpBqMn61MbBurETeWmgypTpt2G6VsnOyfGitqmSDQTbRoRaYYWLKfYNvN
 T71kzqP0u1kGDp3tQw8+Z6ocZ3OBs6kJc9HvRbazTa8PTKEVtTeZFk6MN
 /TBy94KbHHRI1x9jwQhx/xlFf1BX7vbRHP1V+HDHj/wwW3I9zZmwgk8/P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="348189230"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="348189230"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="937660098"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="937660098"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 05:39:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 19 Apr 2023 15:39:38 +0300
Message-Id: <20230419123947.543175-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/9] xe & i915 display integration cleanups
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

Change the way i915 display gets built for xe. Additional cleanups and
backports on top to make future changes simpler.

Jani Nikula (9):
  fixup! drm/xe/display: Implement display support
  drm/i915/wm: remove stale and unused ilk_wm_max_level() declaration
  drm/i915/display: add I915 conditional build to i9xx_wm.h
  fixup! drm/xe/display: Implement display support
  drm/i915: rename intel_pm.[ch] to intel_clock_gating.[ch]
  fixup! drm/xe/display: Implement display support
  drm/i915: use explicit includes for i915_reg.h and i915_irq.h
  fixup! drm/xe/display: Implement display support
  fixup! drm/i915/display: Remaining changes to make xe compile

 drivers/gpu/drm/i915/Makefile                 |   2 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c        |   1 +
 drivers/gpu/drm/i915/display/i9xx_wm.h        |  18 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   4 +-
 .../drm/i915/display/intel_display_power.c    |   1 +
 .../i915/display/intel_display_power_well.c   |   1 +
 .../drm/i915/display/intel_display_reg_defs.h |   4 -
 .../drm/i915/display/intel_display_trace.h    |   1 -
 drivers/gpu/drm/i915/display/intel_fbc.c      |   1 +
 .../drm/i915/display/intel_fifo_underrun.c    |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   1 +
 drivers/gpu/drm/i915/gt/intel_reset.c         |   1 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |   1 +
 drivers/gpu/drm/i915/gt/selftest_rps.c        |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   1 +
 drivers/gpu/drm/i915/i915_debugfs.c           |   1 +
 drivers/gpu/drm/i915/i915_driver.c            |   8 +-
 drivers/gpu/drm/i915/i915_gem.c               |   8 +-
 drivers/gpu/drm/i915/i915_irq.c               |   1 +
 drivers/gpu/drm/i915/i915_irq.h               |   2 +-
 .../i915/{intel_pm.c => intel_clock_gating.c} |   9 +-
 drivers/gpu/drm/i915/intel_clock_gating.h     |  14 ++
 drivers/gpu/drm/i915/intel_pm.h               |  18 --
 drivers/gpu/drm/i915/vlv_suspend.c            |   4 +-
 drivers/gpu/drm/xe/Makefile                   | 170 +++++++++---------
 .../compat-i915-headers/intel_clock_gating.h  |   1 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c     |   2 +-
 drivers/gpu/drm/xe/display/ext/i9xx_wm.c      |  24 ---
 drivers/gpu/drm/xe/display/ext/i9xx_wm.h      |  20 ---
 .../ext/{intel_pm.c => intel_clock_gating.c}  |   4 +-
 drivers/gpu/drm/xe/display/ext/intel_pm.h     |  29 ---
 drivers/gpu/drm/xe/xe_device_types.h          |   3 +
 drivers/gpu/drm/xe/xe_display.c               |   4 +-
 33 files changed, 152 insertions(+), 210 deletions(-)
 rename drivers/gpu/drm/i915/{intel_pm.c => intel_clock_gating.c} (99%)
 create mode 100644 drivers/gpu/drm/i915/intel_clock_gating.h
 delete mode 100644 drivers/gpu/drm/i915/intel_pm.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_clock_gating.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i9xx_wm.c
 delete mode 100644 drivers/gpu/drm/xe/display/ext/i9xx_wm.h
 rename drivers/gpu/drm/xe/display/ext/{intel_pm.c => intel_clock_gating.c} (97%)
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_pm.h

-- 
2.39.2

