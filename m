Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4ADCAC582
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 09:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35F210EBEA;
	Fri, 12 Sep 2025 09:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UR+wdeuF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482EB10EBEA
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757669792; x=1789205792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pP0e8PNW2wEGOIhlB3GmfdBOBHJMVlmCiFl0m8KqKWk=;
 b=UR+wdeuFEiNSw0dYA8WSWp5zc0tz/ytAorviFFUWt9/8gR4f4Q6pSNIm
 SOBOjxFbzhimovXJ/i+zZR8H6Q25zKndzuXYL+59rvS29uDp9ceO71CHp
 0Ia2E3Yo/LeqpYXN/zFT9Nan1QnrT5Ya7MGg5SvcW/zjWIIJcv0KUCJXw
 l3vcKm9VoeMKrOj9MTcGMzOcSHG7sOA48ouUCzBOJFu8jwRTat6wTqPQ2
 SqV3el8gbWxYXwBdJt+mp+LoF34+GfojOnnZ4q5cOObHensFd9X+pDBlF
 /8DlTA2QGE0pRxlHywYK5kxvp2Fyk2nj4mVIESF3/jcHvU9FwHcn6mLYo Q==;
X-CSE-ConnectionGUID: 1SkgI/DOTKOdNmU5pKqClw==
X-CSE-MsgGUID: wBNUh6s6T62vxkEEFVsAmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="60159829"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="60159829"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 02:36:30 -0700
X-CSE-ConnectionGUID: QsATeVIRQE2loVD5Pwo0kA==
X-CSE-MsgGUID: 7eeKe63TQc+Ik3J3BwXJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="174311655"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa008.fm.intel.com with ESMTP; 12 Sep 2025 02:36:26 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 0/9] [ANDROID]: Add GPU work period support for Xe driver
Date: Fri, 12 Sep 2025 09:03:43 +0000
Message-ID: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
X-Mailer: git-send-email 2.49.0
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

This patch series implements the Android VSR requirement GPU work
period event for the Intel Xe driver.

|GpuWorkPeriodEvent| defines a non-overlapping, non-zero period
of time from |start_time_ns| (inclusive) until |end_time_ns|
(exclusive) for a given |uid|, and includes details of how much
work the GPU was performing for |uid| during the period. When
GPU work for a given |uid| runs on the GPU, the driver must track
one or more periods that cover the time where the work was running,
and emit events soon after.

Full requirement is defined in the following file:
https://cs.android.com/android/platform/superproject/main/+\
main:frameworks/native/services/gpuservice/gpuwork/bpfprogs/gpuWork.c;l=35

The requirement is implemented using a delayed worker thread per
user id instance to accumulate its runtime on the gpu and emit
the event. Each user id instance is tracked using an xe_user
structure and the runtime is updated every time the kworker is
executed for this uid. The delay period is hardcoded to 500 msecs.

The runtime on the gpu is collected for each xe file individually
inside the function xe_exec_queue_update_run_ticks and accumulated
into the corresponding xe_user active_duration_ns field. The HW
Context timestamp field in the GTT is used to derive the runtime
in clock ticks and then converted into nanosecs before updating the
active duration.

Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>

Aakash Deep Sarkar (9):
  Add a new xe_user structure
  Add xe_gt_clock_interval_to_ns function
  Add a trace point for GPU work period
  Modify xe_exec_queue_update_run_ticks
  Handle xe_user creation and removal
  Implement xe_work_period_worker
  Add a Kconfig option for GPU work period
  Handle xe_work_period destruction
  Fix runtime PM handling of Xe work period worker

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  90 +++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  19 ++
 drivers/gpu/drm/xe/xe_exec_queue.c            |  10 +
 drivers/gpu/drm/xe/xe_gt_clock.c              |  14 ++
 drivers/gpu/drm/xe/xe_gt_clock.h              |   1 +
 drivers/gpu/drm/xe/xe_pm.c                    |   4 +
 .../drm/xe/xe_power_gpu_work_period_trace.h   |  61 ++++++
 drivers/gpu/drm/xe/xe_user.c                  | 188 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_user.h                  | 121 +++++++++++
 drivers/gpu/trace/Kconfig                     |  12 ++
 11 files changed, 522 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
 create mode 100644 drivers/gpu/drm/xe/xe_user.c
 create mode 100644 drivers/gpu/drm/xe/xe_user.h

-- 
2.49.0

