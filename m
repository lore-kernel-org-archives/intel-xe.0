Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6271CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB9010EAB0;
	Fri, 22 Aug 2025 09:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZNzKtdGa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467F810EAAF
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 09:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755854951; x=1787390951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hn8orlhLoHBdXn9eVvAZcR9St1Uat06bLvCc5km7+Bw=;
 b=ZNzKtdGaJCvjIPIfwC6pTdDInuMcAT3/oo28eOHSiLoJsRsT6LdAyF4k
 FGlTGtUq92bgCtkMPyhxC9O+arxUE/hc4iOVxqD0apXrCSZYvede5UXSW
 XiJGU5K2bTjcn4u07BHAln5tXQfTw//76BTRAfTfgzUFC8ymUcdfTGn9Z
 0C5XOwsC6RVHUr1kv1KpMHePsk8d1bSNK3G0YDhTEREFFri83+Rm+FoBN
 JUOWFcprBK6zqBIcOoiXIU9OeeFsW/GFPJ+IgUuJhCuh7LF7I9sWJbAXQ
 L3FBnfjjV2baMe05WZo9saRM2aoEDTd0KJgxIz9LZs2qrNdNwMb+Ljj4v Q==;
X-CSE-ConnectionGUID: 26I3lmNfSmencv+o7ZfLFA==
X-CSE-MsgGUID: /5nARflXQIWB6M0hZbVI1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80759588"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="80759588"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:29:11 -0700
X-CSE-ConnectionGUID: GoHqYbA2TDGQ6SkRRzccWA==
X-CSE-MsgGUID: eGBfo11aR3uYytUM30wAtw==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by fmviesa003.fm.intel.com with ESMTP; 22 Aug 2025 02:29:09 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, carlos.santa@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v2 0/8] [ANDROID]: Add GPU work period support for Xe driver
Date: Fri, 22 Aug 2025 08:59:22 +0000
Message-ID: <20250822085932.2221054-1-aakash.deep.sarkar@intel.com>
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
  [ANDROID]: Add a new xe_user structure
  [ANDROID]: Add xe_gt_clock_interval_to_ns function
  [ANDROID]: Add a trace point for GPU work period
  [ANDROID]: Modify xe_exec_queue_update_run_ticks
  [ANDROID]: Handle xe_user creation and removal
  [ANDROID]: Implement xe_work_period_worker
  [ANDROID]: Add a Kconfig option for GPU work period
  [ANDROID]: Handle xe_work_period destruction

 drivers/gpu/drm/xe/Makefile                   |   2 +
 drivers/gpu/drm/xe/xe_device.c                |  90 ++++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  19 ++
 drivers/gpu/drm/xe/xe_exec_queue.c            |  10 ++
 drivers/gpu/drm/xe/xe_gt_clock.c              |  14 ++
 drivers/gpu/drm/xe/xe_gt_clock.h              |   1 +
 .../drm/xe/xe_power_gpu_work_period_trace.h   |  61 +++++++
 drivers/gpu/drm/xe/xe_user.c                  | 162 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_user.h                  | 114 ++++++++++++
 drivers/gpu/trace/Kconfig                     |  12 ++
 10 files changed, 485 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
 create mode 100644 drivers/gpu/drm/xe/xe_user.c
 create mode 100644 drivers/gpu/drm/xe/xe_user.h

-- 
2.49.0

