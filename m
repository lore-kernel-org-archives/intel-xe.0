Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569DAC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3155510E47D;
	Mon, 24 Feb 2025 13:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTvrt21J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BD610E051
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 05:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740374286; x=1771910286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KlzAUAA2+QwN5Xdk9G2+YBwtXXdMl6QHMvma2NdhpM8=;
 b=NTvrt21JfjFXlawPEdw61/uZiSMKltzOJmS9DHmKNbAspr7ezrCu49wd
 FNaaBl68+NXQi3SqVfBNK4zP1buaB6KeycXOGp2etbAWGDYitG03SA4z3
 x7sSLvhpQ+zzMunhCGTweTxsYLcapMEOJnLy/5tBpfoEj93HK01EKoJyV
 k+LaQURO451mf9uOlmSABGTNw+uIqcBiiLcci8ksnhJtpnDjNBtBIiCB3
 D8pUvk2mz7JUubTIZWQ2GBGEcJzWiB7J6DH3VAYz+dqGSxoTTtiq+jhTl
 EZ2iOxsWjVVlTLgto64T+fCXsKyP+Pfx6wj8EW3yHlss/KemKhb4GykXw Q==;
X-CSE-ConnectionGUID: Frq17BmSSU+hsIe/Itt4xg==
X-CSE-MsgGUID: ZIzB+BSKQuqmvqgn6o9F5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41380306"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41380306"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 21:18:05 -0800
X-CSE-ConnectionGUID: wwykXwddRmqYuKTWDhAeDA==
X-CSE-MsgGUID: yJ3EPc77TPaU7giqy+0FGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153150643"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 21:18:03 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com
Subject: [PATCH v9 0/5] PMU support for engine activity
Date: Mon, 24 Feb 2025 11:08:57 +0530
Message-ID: <20250224053903.2253539-1-riana.tauro@intel.com>
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
        engine_class    - config:20-27
        engine_instance - config:12-19

The events can then be read using perf tool

        ./perf stat -e xe_<bdf>/engine-active-ticks,gt=<n>,engine_class=<n>,
                                engine_instance=<n>/,
                       xe_<bdf>/engine-total-ticks,gt=<n>,engine_class=<n>,
                                engine_instance=<n>/
                       -I 1000

Engine activity can then be calculated as below
engine activity % = (engine active ticks/engine total ticks) * 100

Test-with: 20250212095834.384508-1-riana.tauro@intel.com

Rev2: Add trace functions
      fix cosmetic review comments

Rev3: add engine class and instance as parameters
      replace busyness with engine activity

Rev4: add per-function engine activity
      fix review comments

Rev5: Remove global for SRIOV
      Add forcewake during init and destroy
      fix other review comments

Rev6: fix review comments

Rev7: Split VF and Native

Rev8: add fw_ref to pmu event data

Rev9: free local copy

Riana Tauro (5):
  drm/xe: Add engine activity support
  drm/xe/trace: Add trace for engine activity
  drm/xe/guc: Expose engine activity only for supported GuC version
  drm/xe/xe_pmu: Add PMU support for engine activity
  drm/xe/xe_pmu: Acquire forcewake on event init for engine events

 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   2 +
 drivers/gpu/drm/xe/xe_guc.c                   |   5 +
 drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 373 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_engine_activity.h   |  19 +
 .../gpu/drm/xe/xe_guc_engine_activity_types.h |  92 +++++
 drivers/gpu/drm/xe/xe_guc_fwif.h              |  19 +
 drivers/gpu/drm/xe/xe_guc_types.h             |   4 +
 drivers/gpu/drm/xe/xe_pmu.c                   | 175 +++++++-
 drivers/gpu/drm/xe/xe_trace_guc.h             |  49 +++
 drivers/gpu/drm/xe/xe_uc.c                    |   3 +
 12 files changed, 734 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_engine_activity_types.h

-- 
2.47.1

