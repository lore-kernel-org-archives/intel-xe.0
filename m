Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9273EE0212
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 23:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F7110E1FA;
	Wed, 13 Sep 2023 23:15:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A77B10E1DB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 23:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694646890; x=1726182890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vE1WN6D7ofxWFvfTayWD1Rn9S+3GvgrUfQGat04n4Lc=;
 b=RVgBABww3lj/rNsDKc16He/Zld887ToZT2VIP1iw987fDaOOzPyWh3SB
 3KPWEn5FO3+e+EZHJVMz59suCpxsflHTyiUI5KwO7NcFvge24HhbDm5ww
 4MHitts0HcEWTEv5yumWRyPT2gapV/7UhX3CRBDw1wUTznxCPgICr+8k4
 WxikksK6I98cZA6Vc/ip5l845yXqDdsCQ/rIq4AoInJSAl4yApzdfWxvt
 EAj1ihDzZW/voh9HbQge2/IYqMZ11vcLKVIgbRcG6dR9CPVXikwjyy8Jz
 iGT5cWGkwVhYyLB0ols6jaNjoNdq+5E4Saj7l3hmX83+3W5Qne6pDEUBE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="377714985"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="377714985"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="773659691"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; d="scan'208";a="773659691"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 16:14:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 16:14:12 -0700
Message-ID: <20230913231411.291933-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Separate display and tile workarounds
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

i915's "clock gating" hooks were historically a bit of a dumping ground
for assorted register programming (some of which wasn't actually related
to clock gating in any way).  i915 has now moved display workarounds to
their own area within the display-specific code, so cherry-picking those
patches into the Xe kernel will ensure that the same display workarounds
are applied automatically during Xe's display init.

With display workarounds taken care of by the i915 cherry-picks, the
remaining "clock gating" programming that Xe needs is more accurately
described as "tile workarounds," i.e., workarounds that target
sgunit/soc registers outside of the GTs and the display.  Such
workarounds are very rare and if we disregard pre-production
workarounds, there's only a single tile workaround needed on Xe today.
Adding proper programming for tile workarounds to Xe and moving
Wa_22010954014 to that new area allows us to drop
ext/intel_clock_gating.c.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>

Matt Roper (6):
  drm/i915: Stop forcing clock gating init for future platforms
  drm/i915/adlp: Stop calling gen12lp_init_clock_gating()
  drm/i915/display: Extract display workarounds from clock gating init
  drm/i915/display: Apply workarounds during display init
  drm/xe/wa: Apply tile workarounds at probe/resume
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../drm/i915/display/intel_display_driver.c   |   3 +
 .../gpu/drm/i915/display/intel_display_wa.c   |  48 +++++++
 .../gpu/drm/i915/display/intel_display_wa.h   |  13 ++
 drivers/gpu/drm/i915/intel_clock_gating.c     |  52 +-------
 drivers/gpu/drm/xe/Makefile                   |   4 +-
 .../drm/xe/display/ext/intel_clock_gating.c   | 124 ------------------
 drivers/gpu/drm/xe/regs/xe_regs.h             |   3 +
 drivers/gpu/drm/xe/xe_display.c               |   2 -
 drivers/gpu/drm/xe/xe_pm.c                    |   5 +
 drivers/gpu/drm/xe/xe_tile.c                  |   3 +
 drivers/gpu/drm/xe/xe_wa.c                    |  20 +++
 drivers/gpu/drm/xe/xe_wa.h                    |   2 +
 drivers/gpu/drm/xe/xe_wa_oob.rules            |   1 +
 14 files changed, 103 insertions(+), 178 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_wa.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_display_wa.h
 delete mode 100644 drivers/gpu/drm/xe/display/ext/intel_clock_gating.c

-- 
2.41.0

