Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55D3C2A076
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3429B10E267;
	Mon,  5 Jan 2026 04:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Msc9OeB2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59A210E1FF
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585764; x=1799121764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JhixBQOcde4/C8U0aeimbHK5ln3BzKGzG8zlBlCl794=;
 b=Msc9OeB2b/t6uL73uBQaGJfChP/9pq/f6WAcwcauP3esSiCfGknCTTpd
 Qymva9tUu/336dyv8KHzZrDY56vKeepWpMzOKNbc84xZXff+tl+6LvQjY
 ao4SJODb8pEdNvmzu+/gCxszq1R+thmfChyQJ+1A0YXPIyY8IvaIswluT
 43lqnLp9ELKsjtrf7IJQrcJt4Gx5H2hi5BMNyzrWtBaNMy5YXRp8PfOg1
 JUdpM2bDuejaKALxT7mO5HKsKIjJERzL2StdQaaJ/iPjOFwBEcuz1lAGz
 U3rdFuXYHPt0d/W9VOERva6J0yViDCALvIY9wg0BME0hb4EfThg664vrH Q==;
X-CSE-ConnectionGUID: JSQ9KiUpT9S4CtAWLeioKg==
X-CSE-MsgGUID: kc+JeC9TRdeIVJzlQkBiBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856252"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:43 -0800
X-CSE-ConnectionGUID: LI7eN2lQQC6Kmk63A/eezA==
X-CSE-MsgGUID: TXAWdWwpTm2ZD26ZoBLHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060648"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 00/22] Fence deadlines in Xe
Date: Sun,  4 Jan 2026 20:02:15 -0800
Message-Id: <20260105040237.1307873-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series introduces deadline support for exported scheduler fences.
When a deadline is set on a fence, the driver attempts to complete the
work within a configurable window (default 3 ms, via Kconfig) ahead of
the deadline.

As the deadline approaches, the exec queue first receives a frequency
boost. If the queue has CAP_SYS_ADMIN privileges, a later stage also
applies a priority boost. This tiered approach allows work to run at the
same baseline priority as the application, only increasing priority when
a deadline is at risk of being missed.

The primary use case is compositors that target a stable frame cadence
while avoiding a permanently elevated scheduling priority.

Lightly tested with an IGT and running display; behavior appears
correct.

VLK-82801

IGT: https://patchwork.freedesktop.org/series/159616/

v2:
 - Fully implemented deadline manager
 - Separate frequency and priority boost windows
 - Enable deadlines in Intel display

Matt

Matthew Brost (22):
  drm/xe: Add dedicated message lock
  drm/xe: Add EXEC_QUEUE_FLAG_CAP_SYS_NICE
  drm/xe: Store exec queue in hardware fence
  drm/xe: Add deadline exec queue vfuncs
  drm/xe: Export to_xe_hw_fence
  drm/xe: Export xe_hw_fence_signaled
  drm/xe: Implement deadline manager
  drm/xe: Initialize deadline manager on exec queues
  drm/xe: Stub out execlists deadline vfuncs as NOPs
  drm/xe: Make scheduler message lock IRQ-safe
  drm/xe: Support unstable opcodes for static scheduler messages
  drm/xe: Implement GuC submission backend ops for deadlines
  drm/xe: Enable deadlines on hardware fences
  drm/xe: Fix Kconfig.profile newlines
  drm/xe: Add deadline Kconfig options
  drm/xe: Add exec queue deadline trace points
  drm/xe: Add hw fence deadline trace points
  drm/xe: Add timestamp_ms to LRC snapshot
  drm/xe: Enforce GuC static message defines
  drm/xe: Document the deadline manager
  drm/atomic: Export fence deadline helper for atomic commits
  drm/i915/display: Use atomic helper to set plane fence deadlines

 drivers/gpu/drm/drm_atomic_helper.c          |  11 +-
 drivers/gpu/drm/i915/display/intel_display.c |   2 +
 drivers/gpu/drm/xe/Kconfig.profile           |  29 ++
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/xe_deadline_mgr.c         | 463 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_deadline_mgr.h         |  26 ++
 drivers/gpu/drm/xe/xe_deadline_mgr_types.h   |  52 +++
 drivers/gpu/drm/xe/xe_exec_queue.c           |  11 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |  15 +
 drivers/gpu/drm/xe/xe_execlist.c             |  15 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  43 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  17 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |   4 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 170 +++++--
 drivers/gpu/drm/xe/xe_hw_fence.c             |  38 +-
 drivers/gpu/drm/xe/xe_hw_fence.h             |   7 +-
 drivers/gpu/drm/xe/xe_hw_fence_types.h       |  19 +
 drivers/gpu/drm/xe/xe_lrc.c                  |  10 +-
 drivers/gpu/drm/xe/xe_lrc.h                  |   4 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |   5 +-
 drivers/gpu/drm/xe/xe_trace.h                |  42 +-
 include/drm/drm_atomic_helper.h              |   3 +
 23 files changed, 918 insertions(+), 71 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr.c
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr.h
 create mode 100644 drivers/gpu/drm/xe/xe_deadline_mgr_types.h

-- 
2.34.1

