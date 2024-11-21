Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97FDD75BBB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 06:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E81710E189;
	Thu, 21 Nov 2024 06:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcOQlqpW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C4A10E189
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 06:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732170219; x=1763706219;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=32QMl6TgO0HIokqjuQ7GaH9XDA2A4r547uKVbxCe188=;
 b=LcOQlqpWS/sBA0ZTLAdRp1azWax0yfxD7ZNRAs6e3UZS/37jwTrlX4Vx
 n/EIDJtKxenhzZx62XPDvFFvlYV74h1COMT+sEBW2w4zhOHV0uaEoAWwE
 NLjI+ngVW2t4fODc224ZkSkYluzH3qWw6BybTTbwsill9oh80NRvEOApu
 MiNWDHxaEpkaxSepkBNE+otJDUYqeo+WoDbPuUUNHPtiCE70gEwQKVBp5
 bqr/G5hn3D5JYjRdVMmUSYlFEY9HNpFKbOM5dRQtFyhTDuBYGtfhXKCQ1
 QQ30RcQHPv+ce+xp+9lSnxrGkQrcEFdEdRyOQLl5gVAYCvVvqx9xmUMtD A==;
X-CSE-ConnectionGUID: ZTcPfcXwQIe8wunc1A65yA==
X-CSE-MsgGUID: Tn4JVfPKTV6Qo9L/8rSj1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="36173535"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="36173535"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 22:23:39 -0800
X-CSE-ConnectionGUID: o9h6xf/yRoS1el2Yf+1ofg==
X-CSE-MsgGUID: 20ku55ZLQ424JTJobtXRCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="94219770"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 22:23:36 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 john.c.harrison@intel.com, ashutosh.dixit@intel.com,
 soham.purkait@intel.com
Subject: [PATCH v2 0/8] Add PMU support for single engine busyness
Date: Thu, 21 Nov 2024 12:08:56 +0530
Message-Id: <20241121063904.3033754-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

The first 3 patches of the series are taken from
https://patchwork.freedesktop.org/series/139121/. They are added
only for compilation and does not require review.

This series adds support for single engine busyness.

PMU provides two counters (<engine>-busy-ticks-gt<n>,
<engine>-total-ticks-gt<n>) to calculate engine busyness. When querying
engine busyness, user must group these 2 counters using the perf_event
group mechanism to ensure both counters are sampled together.

To list engine busyness counters use the following

./perf list
  xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
  xe_0000_03_00.0/bcs0-total-ticks-gt0/              [Kernel PMU event]
  xe_0000_03_00.0/ccs0-busy-ticks-gt0/               [Kernel PMU event]
  xe_0000_03_00.0/ccs0-total-ticks-gt0/              [Kernel PMU event]

Engine busyness can then be calculated as below
busyness % = (engine active ticks/total ticks) * 100

Rev2: Add trace functions
      fix cosmetic review comments

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Riana Tauro (5):
  drm/xe: add function to convert xe hw engine class to user class
  drm/xe: Add single engine busyness support
  drm/xe/trace: Add trace for xe_engine_activity
  drm/xe/guc: Expose engine busyness only for supported GuC version
  drm/xe/pmu: Add PMU support for engine busyness

Vinay Belgaumkar (2):
  drm/xe/pmu: Add GT C6 events
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/Makefile                   |    3 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |    1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |    2 +
 drivers/gpu/drm/xe/xe_device.c                |    6 +
 drivers/gpu/drm/xe/xe_device_types.h          |    4 +
 drivers/gpu/drm/xe/xe_engine_activity.c       |  348 +++++
 drivers/gpu/drm/xe/xe_engine_activity.h       |   18 +
 drivers/gpu/drm/xe/xe_engine_activity_types.h |   85 ++
 drivers/gpu/drm/xe/xe_gt.c                    |    4 +
 drivers/gpu/drm/xe/xe_gt_idle.c               |   17 +-
 drivers/gpu/drm/xe/xe_gt_idle.h               |    1 +
 drivers/gpu/drm/xe/xe_guc.c                   |    5 +
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   19 +
 drivers/gpu/drm/xe/xe_guc_types.h             |    4 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |   21 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |    1 +
 drivers/gpu/drm/xe/xe_module.c                |    5 +
 drivers/gpu/drm/xe/xe_pmu.c                   | 1191 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h                   |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h             |  172 +++
 drivers/gpu/drm/xe/xe_query.c                 |   12 +-
 drivers/gpu/drm/xe/xe_trace_guc.h             |   49 +
 drivers/gpu/drm/xe/xe_uc.c                    |    3 +
 23 files changed, 1986 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.c
 create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.h
 create mode 100644 drivers/gpu/drm/xe/xe_engine_activity_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.40.0

