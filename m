Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377CBC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46E310E9B5;
	Thu,  6 Feb 2025 23:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eyFwXZol";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8D310E98F
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 23:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738884235; x=1770420235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/WgQTWGM9iUjyBmQLHV4URtJQ92JtrC0rgadpJddmLU=;
 b=eyFwXZoltDKIdgGJtZFhd+YACFoa7f0tRgyvYICsY8PjstBhGgkZNgDY
 inYGHjangoTVNjtzIFr6CDG8qqyt8NJjLSbDxY0B1Es6K7928vllBDqVh
 gHQmxEOxJGKQoHg3bcRnyVf0bmgovr94+WkmMEPpF3z+yKkTmb4Y+gYt9
 LMW6EtveA3SJnHWUtBHmtYtoTnKWmoVZneqG8U5vXvzS1Ffkt9doLtpzJ
 wN+aStcIWiSbqd1PF0C81nJ4aIf33dAnmlv7KuD5QpQTpDnKV1n4SpFuC
 CARpXWBdxAmY1ySETO5JpS9OISSkk8PMbr/EYMWr62cBJykAnnCuiFo1b g==;
X-CSE-ConnectionGUID: uKWXcmKfQXCTMkKYR7zrcQ==
X-CSE-MsgGUID: zUu+ie6MRqm4DLYTus4Afw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61993714"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="61993714"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:55 -0800
X-CSE-ConnectionGUID: BrkRxa7vSXWMGEMBy5+VWA==
X-CSE-MsgGUID: gjZZZCStTKKovQiMgMSQ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134594779"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 15:23:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 00/14] Cleanup error handling on probe
Date: Thu,  6 Feb 2025 15:23:18 -0800
Message-ID: <20250206232333.2660325-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
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

Mixing style with goto and devm_add_action_or_reset() is very confusing
and error prone. Clean that up. The only missing one is one of the
display calls, but that can be done in parallel to the review of these
first patches.

This received limited load/unload tests on LNL and may very well not be
100%.

v2:
  - Add callback-based removed to overcome issue with gsc/mei
    integration: it can't be removed with devm.
  - More cleanups, adding drm_dev_unplug in the right place, fixing
    hwmon, pmu and oa

Lucas De Marchi (14):
  drm/xe: Fix xe_display_fini() calls
  drm/xe: Fix error handling in xe_irq_install()
  drm/xe: Fix xe_tile_init_noalloc() error propagation
  drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
  drm/xe: Remove leftover pxp comment
  drm/xe: Add callback support for driver remove
  drm/xe: Cleanup unwind of gt initialization
  drm/xe: Cleanup extra calls to xe_hw_fence_irq_finish()
  drm/xe: Move oa fini to xe_oa
  drm/xe: Move drm_dev_unplug() out of display function
  drm/xe/oa: Handle errors in xe_oa_register()
  drm/xe: Fail probe if xe_pmu_register() fails
  drm/xe/hwmon: Fix mutex destroy
  drm/xe/hwmon: Stop ignoring errors on probe

 drivers/gpu/drm/xe/display/xe_display.c      |  22 +--
 drivers/gpu/drm/xe/display/xe_display.h      |   2 -
 drivers/gpu/drm/xe/xe_device.c               | 133 ++++++++++++-------
 drivers/gpu/drm/xe/xe_device.h               |   4 +
 drivers/gpu/drm/xe/xe_device_remove_action.h |  24 ++++
 drivers/gpu/drm/xe/xe_device_types.h         |  15 +++
 drivers/gpu/drm/xe/xe_gsc.c                  |   9 --
 drivers/gpu/drm/xe/xe_gsc.h                  |   1 -
 drivers/gpu/drm/xe/xe_gsc_proxy.c            |  63 +++++----
 drivers/gpu/drm/xe/xe_gsc_proxy.h            |   1 -
 drivers/gpu/drm/xe/xe_gsc_types.h            |   3 +
 drivers/gpu/drm/xe/xe_gt.c                   |  50 +++----
 drivers/gpu/drm/xe/xe_gt.h                   |   1 -
 drivers/gpu/drm/xe/xe_hwmon.c                |  39 +++---
 drivers/gpu/drm/xe/xe_hwmon.h                |   4 +-
 drivers/gpu/drm/xe/xe_irq.c                  |  14 +-
 drivers/gpu/drm/xe/xe_oa.c                   |  78 +++++------
 drivers/gpu/drm/xe/xe_oa.h                   |   4 +-
 drivers/gpu/drm/xe/xe_pci.c                  |   4 +-
 drivers/gpu/drm/xe/xe_tile.c                 |   4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c       |  17 +--
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h       |   2 +-
 drivers/gpu/drm/xe/xe_uc.c                   |  13 --
 drivers/gpu/drm/xe/xe_uc.h                   |   1 -
 24 files changed, 267 insertions(+), 241 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_remove_action.h

-- 
2.48.1

