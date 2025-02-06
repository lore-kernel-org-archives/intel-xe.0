Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B161AC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 10:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A40210E80F;
	Thu,  6 Feb 2025 10:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6cBStA8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D9210E801
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 10:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738837429; x=1770373429;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nI0FOIaWBvjU0tqrFIHU5fPodAPj2eZ2iOHv6D8aRK0=;
 b=K6cBStA85C9eAMX4BfM5d8ADlOy6ITBfWM4KpW1i9mLhORwuXIS1NzfH
 pz65qj1vAvki+RoywtWtjgg/T39YY3gaO3kBhr9MhOjRVxtF74lkBGKDm
 izdzOu50d9h5A50E3LYNeO1pM2vn3z3kE5JKHg3tBfLTO8mSJtcvvHPPc
 UX6jcMBCL2WdxfsX3UOpARVkJ7bdMe9D4NvXbvAGVYFGG/mATHz24ylmR
 gpSbWM6k0ITQi5YiDGPoktcMjt+7RN49f08NtpcqMJbuBmqeWBhsAr2lv
 OipX4t6JfZ+I8k34ZNl9mMS3OVYoofA4Gjr9D3oL2Pp9VQi2Sbndn81pu Q==;
X-CSE-ConnectionGUID: 3eTIUxp7SOu6y0xjNFPaRw==
X-CSE-MsgGUID: n7KhPImFSSefjnfvRpaIPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64786881"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="64786881"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:23:49 -0800
X-CSE-ConnectionGUID: JWaNQmL4RLGyoh9rkzmXDQ==
X-CSE-MsgGUID: TDvphNQTSlGAkrUSS2GDKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="110997532"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 02:23:46 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 vinay.belgaumkar@intel.com, soham.purkait@intel.com
Subject: [PATCH v5 0/8] PMU support for engine activity
Date: Thu,  6 Feb 2025 16:13:49 +0530
Message-ID: <20250206104358.3436519-1-riana.tauro@intel.com>
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

This series adds support for engine activity for native and PF and VF's

PMU provides two counters (engine-active-ticks, engine-total-ticks)
to calculate engine activity. When querying this, user must group
these 2 counters using the perf_event group mechanism to ensure
both counters are sampled together.

To list the events

        ./perf list
        xe_0000_03_00.0/engine-active-ticks/    [Kernel PMU event]
        xe_0000_03_00.0/engine-total-ticks/     [Kernel PMU event]

The formats to be used with the above are

        gt              - config:60-63
        function        - config:59-44
        engine_class    - config:20-27
        engine_instance - config:12-19

The events can then be read using perf tool

        ./perf stat -e xe_<bdf>/engine-active-ticks,gt=<n>,engine_class=<n>,
                                engine_instance=<n>,function=<n>/,
                       xe_<bdf>/engine-total-ticks,gt=<n>,engine_class=<n>,
                                engine_instance=<n>,function<n>/
                       -I 1000

Engine activity can then be calculated as below
engine activity % = (engine active ticks/engine total ticks) * 100


Rev2: Add trace functions
      fix cosmetic review comments

Rev3: add engine class and instance as parameters
      replace busyness with engine activity

Rev4: add per-function engine activity
      fix review comments

Rev5: Remove global for SRIOV
      Add forcewake during init and destroy
      fix other review comments

Riana Tauro (8):
  drm/xe: Add engine activity support
  drm/xe/trace: Add trace for engine activity
  drm/xe/guc: Expose engine activity only for supported GuC version
  drm/xe/xe_pmu: Add PMU support for engine activity
  drm/xe/xe_pmu: Acquire forcewake on event init for engine events
  drm/xe: Add support for per-function engine activity
  drm/xe/xe_pmu: Add pmu support for per-function engine activity stats
  drm/xe/pf: Enable per-function engine activity stats

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   2 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  26 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h    |   1 +
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 514 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  20 +
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |  98 ++++
 drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 +
 drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
 drivers/gpu/drm/xe/xe_pci_sriov.c             |  25 +
 drivers/gpu/drm/xe/xe_pmu.c                   | 203 ++++++-
 drivers/gpu/drm/xe/xe_pmu_types.h             |   8 +
 drivers/gpu/drm/xe/xe_trace_guc.h             |  49 ++
 drivers/gpu/drm/xe/xe_uc.c                    |   3 +
 16 files changed, 965 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h

-- 
2.47.1

