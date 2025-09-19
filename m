Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9305CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 19:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617B410EA76;
	Fri, 19 Sep 2025 19:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIdrfCl6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E575B10EA76
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 19:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758309117; x=1789845117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QU3uzVywWBntWw/uPGh7jQoFapN4sZiFoe4KLLeqhF8=;
 b=NIdrfCl6DAOn17cL3V9EEVypgCoeWVA+9sUtAgZrvO0l05eqXa1H+xWb
 9NykrZgO0YoqAvDxPLaQYGC6koR7LBgK6vJobi3LWHxoRYR3VfxbprDKR
 q2sMDIvdES2M2BFjP4K7jnoTOBQOFlX+i9oNeILtwRgGT0L+lJMmGaNOO
 bN/KVBLJxvModjs951ToBCF/5cN1FJLZ8xhz6TJAN7pvW6boB+BdD4Gfh
 4sA20kmLgS/TOULUQ4IDjuyQXp0pqanqp178ciaOydJMxmr6Q1OUEzwF8
 JE6uHwENu6DNTQ2QkzDtZ5pzwBU77OjXfJTAhpBQh1rmCuDmc4tnGyg4w A==;
X-CSE-ConnectionGUID: xxpBpZ5uTDuo5XSf+ScEbQ==
X-CSE-MsgGUID: xw9z4YAARROE445axx2cEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60579531"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60579531"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 12:11:56 -0700
X-CSE-ConnectionGUID: e61lKAFzT1OeoKQFSAT2tA==
X-CSE-MsgGUID: wdjd20FCQ0OAH/xUVESSKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; d="scan'208";a="175530189"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2025 12:11:54 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v3 0/8] [ANDROID]: Add GPU work period support for Xe driver
Date: Fri, 19 Sep 2025 18:38:00 +0000
Message-ID: <20250919183817.52325-1-aakash.deep.sarkar@intel.com>
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


Aakash Deep Sarkar (8):
  Add a new xe_user structure
  Add xe_gt_clock_interval_to_ns function
  drm/xe: Add a trace point for GPU work period
  drm/xe: Modify xe_exec_queue_update_run_ticks
  Handle xe_user creation and removal
  drm/xe: Implement xe_work_period_worker
  drm/xe: Add a Kconfig option for GPU work period
  Handle xe_work_period destruction

 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |  32 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  19 +++
 drivers/gpu/drm/xe/xe_exec_queue.c   |   8 +
 drivers/gpu/drm/xe/xe_gt_clock.c     |  14 ++
 drivers/gpu/drm/xe/xe_gt_clock.h     |   1 +
 drivers/gpu/drm/xe/xe_pm.c           |   5 +
 drivers/gpu/drm/xe/xe_user.c         | 246 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_user.h         | 129 ++++++++++++++
 drivers/gpu/trace/Kconfig            |  12 ++
 include/trace/gpu_work_period.h      |  59 +++++++
 11 files changed, 527 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_user.c
 create mode 100644 drivers/gpu/drm/xe/xe_user.h
 create mode 100644 include/trace/gpu_work_period.h

-- 
2.49.0

