Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1916FCCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 14:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF67010E0D6;
	Mon,  6 Oct 2025 14:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvX69VcX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AABE10E419
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759762599; x=1791298599;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hMdWKSd27Hq3phN24BERb8onx2Gj7NqAziXWaZoXGHE=;
 b=NvX69VcXXUZ5d+QICtkL/Oe+n+QmZfh6hX1hgMoCJxI2RMnmQTztVCCw
 JxUjhMkp1I1MqEtAI3z6mo5DOC9gFbossyD3nla8iHhEKCobsST2zl4ni
 JJUIVYE5pYBMOo6XNozUuN6Cs1gU3jys1Nyr//LThnetRrHOtSm6EHTg1
 lrW3aiEQ+rqMI7P6uvlwySnH7xsLpOWMTOGg4qPwUGzBU9Ah+7Co007W5
 4BKZ9w4Ho/ngQMt4rDqdmreKQFAEncW+6nFv2s0zI4bdeHhzBLC4wCZUP
 2yIBsQZIhUD23Ee4Bi0VniMrb9NFHAH1unv9TQ9dR3CT/SB+DOAwSWfGM Q==;
X-CSE-ConnectionGUID: hJOYQn+ZThe2PF6hS8ERPA==
X-CSE-MsgGUID: 3yVl2XRIQV+6ubIaQy1QIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61143135"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="61143135"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:56:38 -0700
X-CSE-ConnectionGUID: a9Z2yc95TSWV64YESSrtrg==
X-CSE-MsgGUID: DtM+A6CySz+l7RxAvjIwXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="179507610"
Received: from intel-s2600wft.iind.intel.com (HELO biaas-d105.iind.intel.com)
 ([10.223.26.161])
 by orviesa009.jf.intel.com with ESMTP; 06 Oct 2025 07:56:35 -0700
From: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com, matthew.auld@intel.com,
 jani.nikula@intel.com, ashutosh.dixit@intel.com,
 Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
Subject: [PATCH v5 0/8] [ANDROID]: Add GPU work period support for Xe driver
Date: Mon,  6 Oct 2025 14:20:21 +0000
Message-ID: <20251006142034.674435-1-aakash.deep.sarkar@intel.com>
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
  drm/xe: Add a new xe_user structure
  drm/xe: Add xe_gt_clock_interval_to_ns function
  drm/xe: Modify xe_exec_queue_update_run_ticks
  drm/xe: Handle xe_user creation and removal
  drm/xe: Implement xe_work_period_worker
  drm/xe: Add a Kconfig option for GPU work period
  drm/xe: Handle xe_work_period destruction
  Hack patch: Do not merge

 drivers/gpu/drm/xe/Makefile          |   2 +
 drivers/gpu/drm/xe/xe_device.c       |  23 +++
 drivers/gpu/drm/xe/xe_device_types.h |  19 ++
 drivers/gpu/drm/xe/xe_exec_queue.c   |   8 +
 drivers/gpu/drm/xe/xe_gt_clock.c     |  14 ++
 drivers/gpu/drm/xe/xe_gt_clock.h     |   1 +
 drivers/gpu/drm/xe/xe_pm.c           |   5 +
 drivers/gpu/drm/xe/xe_user.c         | 288 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_user.h         | 131 ++++++++++++
 9 files changed, 491 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_user.c
 create mode 100644 drivers/gpu/drm/xe/xe_user.h

-- 
2.49.0

