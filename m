Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7A9E77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 07:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A89D10E5A4;
	Mon,  6 Jan 2025 07:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2shjRTR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C09210E5A4
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 07:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736148980; x=1767684980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=r9B59t0kPlCK64QYIDas6jp2BX65ShYZ3yRfXiSyoEI=;
 b=g2shjRTRLx6p7uWH3gpg6FCWCM2DbWQsNr1rt5J+6+8VTSDmhSwibbGl
 cPZHb6CMmin2c82MGFinu06tb7zlPVk79QWX+Dhc8Bo9lIGUqMPxuwKqn
 baA0cqAuwRkfOu8+yZuce9p+4W1LilLij2/EOho1YEP4IctDOA2RfRbH+
 0OXzXeSX3+t1afaAxFA/08NGzAR2X0yGcy1ZL6ryJMg+TC21kLGXxBbnL
 WCVRxM542655imb/b5hlp5wZ+/L48mS5BtL2cBvK/mfMb+Q0qg8Aw3AFz
 WnW+vHz/YwmVh2iKjCJKqai0dkX1Bv7mI8TXY++0BE9mCzjnm/pUD7tP+ w==;
X-CSE-ConnectionGUID: lqWKUZfNQjeY5c4r7WY/ZQ==
X-CSE-MsgGUID: ugr1uIsOT26/5YGDPmHvLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46872988"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="46872988"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:18 -0800
X-CSE-ConnectionGUID: NRmeTZoUTdeDEZ8W+XqajA==
X-CSE-MsgGUID: xzVIqN2VT82gzxuZyo3c8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="125650659"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2025 23:36:15 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 john.c.harrison@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@intel.com, soham.purkait@intel.com
Subject: [PATCH v3 00/10] PMU Support for per-engine-class activity
Date: Mon,  6 Jan 2025 13:25:49 +0530
Message-ID: <20250106075600.852080-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
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

The first 5 patches of the series are taken from
https://patchwork.freedesktop.org/series/139121/. They are added
only for compilation and does not require review.

This series adds support for per-engine-class activity

PMU provides two counters (engine-active-ticks, total-ticks)
to calculate engine activity. When querying this, user must group
these 2 counters using the perf_event group mechanism to ensure 
both counters are sampled together.

To list the events

	./perf list
		xe_0000_03_00.0/engine-active-ticks/	[Kernel PMU event]
		xe_0000_03_00.0/total-ticks/		[Kernel PMU event]

The formats to be used with the above are

	engine_class    - config:20-27
        engine_instance - config:12-19
	gt_id           - config:60-63

The events can then be read using perf tool

	./perf stat -e xe_0000_03_00.0/engine-active-ticks,gt_id=0,
				       engine_class=0,engine_instance=0/,
		       xe_0000_03_00.0/total-ticks,gt_id=0,
				       engine_class=0,engine_instance=0/ 
		       -I 1000

Engine activity can then be calculated as below
engine activity % = (engine active ticks/total ticks) * 100


Rev2: Add trace functions
      fix cosmetic review comments

Rev3: add engine class and instance as parameters
      bump minimum guc to 70.36.0
      replace busyness with engine activity

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Riana Tauro (6):
  drm/xe/xe_pmu: add fixes for base PMU
  drm/xe: Add per-engine-class activity support
  drm/xe/trace: Add trace for engine activity
  drm/xe/guc: Expose engine activity only for supported GuC version
  drm/xe/pmu: Add PMU support for per-engine-class activity
  drm/xe/guc: Bump minimum required GuC version to v70.36.0

Vinay Belgaumkar (3):
  drm/xe: Add locks in gtidle code
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile                   |    3 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |    1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |    2 +
 drivers/gpu/drm/xe/xe_device.c                |    3 +
 drivers/gpu/drm/xe/xe_device_types.h          |    4 +
 drivers/gpu/drm/xe/xe_gt.c                    |    5 +
 drivers/gpu/drm/xe/xe_gt_idle.c               |   23 +-
 drivers/gpu/drm/xe/xe_gt_idle.h               |    1 +
 drivers/gpu/drm/xe/xe_gt_idle_types.h         |    3 +
 drivers/gpu/drm/xe/xe_guc.c                   |    5 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   |  358 +++++
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   19 +
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |   89 ++
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   19 +
 drivers/gpu/drm/xe/xe_guc_types.h             |    4 +
 drivers/gpu/drm/xe/xe_module.c                |    5 +
 drivers/gpu/drm/xe/xe_pmu.c                   | 1163 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h                   |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h             |  154 +++
 drivers/gpu/drm/xe/xe_trace_guc.h             |   49 +
 drivers/gpu/drm/xe/xe_uc.c                    |    3 +
 drivers/gpu/drm/xe/xe_uc_fw.c                 |   28 +-
 22 files changed, 1954 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.47.1

