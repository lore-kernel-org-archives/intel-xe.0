Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC120D42BBF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 04:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D0210E336;
	Wed, 13 Nov 2024 04:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nof1PZZT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137E510E336
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 04:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731472840; x=1763008840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6R4iMvmoRF+yVFVr7JbV/cSoCllL31DJPy5+fqUWVYA=;
 b=nof1PZZT4iAi8Sz+2BnP6lOEraYxa8EwvktoroQHP3qxg3pdBe6R0nRX
 WOt+yF1Gz3hX4ZzhKhxOWPTZJ1pI3jMv/c8AdwCSCUzyB/7Bx7NiRz16f
 YHihKn4uim70+D/qpVqcH+RSjwmRfey33AJeEkMKn+GjTWxkduV3pbrB5
 EZhKG3WJwOGZN/9/iTqjFgrffdihZ4o6+kHlYBQnWve5eRr1EZj3vJJ9n
 Vhow6/kCVMkoDE6P1wbepBgCn8lebQpUvkUdHaRD6utHeQTY27bVqNkMc
 57Oq+UjPETauPtFteLmrLp9EpoZ/DHupWYbryHwrdiICamLC1+PX3U7D1 A==;
X-CSE-ConnectionGUID: a1zLIAcyS0yLQxO775jw1g==
X-CSE-MsgGUID: gy7uMWTjRq2Eyv5b8aqB7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="30742146"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="30742146"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:40:34 -0800
X-CSE-ConnectionGUID: 8NtLSVz+Sl2vTGTjAeKnrw==
X-CSE-MsgGUID: zyXUlOCnSdSbkKY+qxi28w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="87489396"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 20:40:30 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 john.c.harrison@intel.com, ashutosh.dixit@intel.com,
 soham.purkait@intel.com
Subject: [PATCH 0/7] Add PMU support for single engine busyness
Date: Wed, 13 Nov 2024 10:25:42 +0530
Message-Id: <20241113045549.2390980-1-riana.tauro@intel.com>
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

Aravind Iddamsetty (1):
  drm/xe/pmu: Enable PMU interface

Riana Tauro (4):
  drm/xe: add function to convert xe hw engine class to user class
  drm/xe: Add single engine busyness support
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
 drivers/gpu/drm/xe/xe_engine_activity.c       |  339 +++++
 drivers/gpu/drm/xe/xe_engine_activity.h       |   18 +
 drivers/gpu/drm/xe/xe_engine_activity_types.h |   85 ++
 drivers/gpu/drm/xe/xe_gt.c                    |    4 +
 drivers/gpu/drm/xe/xe_gt_idle.c               |   17 +-
 drivers/gpu/drm/xe/xe_gt_idle.h               |    1 +
 drivers/gpu/drm/xe/xe_guc.c                   |    5 +
 drivers/gpu/drm/xe/xe_guc_fwif.h              |   19 +
 drivers/gpu/drm/xe/xe_guc_types.h             |    4 +
 drivers/gpu/drm/xe/xe_hw_engine.c             |   25 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |    1 +
 drivers/gpu/drm/xe/xe_module.c                |    5 +
 drivers/gpu/drm/xe/xe_pmu.c                   | 1191 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.h                   |   30 +
 drivers/gpu/drm/xe/xe_pmu_types.h             |  176 +++
 drivers/gpu/drm/xe/xe_query.c                 |   12 +-
 drivers/gpu/drm/xe/xe_uc.c                    |    3 +
 22 files changed, 1936 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.c
 create mode 100644 drivers/gpu/drm/xe/xe_engine_activity.h
 create mode 100644 drivers/gpu/drm/xe/xe_engine_activity_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
 create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
 create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h

-- 
2.40.0

