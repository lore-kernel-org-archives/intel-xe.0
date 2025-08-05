Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1936ACA0EC1
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637A710E6EB;
	Tue,  5 Aug 2025 23:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mr/HJTZq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885D210E2C6
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437324; x=1785973324;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uwjXfuj10itw2VE5sOCYGGt9bzmuTv20/HXDPOX+06I=;
 b=mr/HJTZqX1PPLW176tFwq1rtrTDcVD5pg2zYCGb81gUojF6kScDm9czl
 KV8garw6SXh40TWLGqi6qD15niJXB36ezrpC6eNyabW9GQCN/SNMYWotX
 mdglL+W/SlLdusLiC0ayjxDB6Vt2ZWQvYA9zB5cnVUKXtIdhgdV3VT0pn
 qxazxtyUl3JHQLXcMn9yAZdTGEnd7QTTACBQTcD01JTyXYPLj9UQNmPX1
 joCYvkT31rkRuOllzy/m0yh0iFtt/RTPqqDA4F6cvj05DpsfzqEZs4EHC
 BrPQmXHKbCOPisEvh/99GlDwVr30eocW9TE7Sbgd89pSBZX16JgQfne6J g==;
X-CSE-ConnectionGUID: EK67Rwd0TAWbftcsVHyxOw==
X-CSE-MsgGUID: Uvtat4jCTNypXCESUS4oTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119056"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119056"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
X-CSE-ConnectionGUID: z4l8ZTQrTrSM/6DYoW/xEg==
X-CSE-MsgGUID: ideF6x6+R0ez/Rumn/E6lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641618"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 00/15] CPU binds and ULLS on migration queue
Date: Tue,  5 Aug 2025 16:41:45 -0700
Message-Id: <20250805234200.1035609-1-matthew.brost@intel.com>
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

We now have data to back up the need for CPU binds and ULLS on the
migration queue, as generated from [1].

On BMG, it is shown that when the GPU is consistently processing faults,
copy jobs run approximately 40–65µs faster (depending on the test case)
with ULLS compared to traditional GuC submission with SLPC enabled on
the migration queue (not upstream, but last patch in series can enable
this). Without SLPC enabled (upstream), ULLS is approximately 100–200µs
faster. Startup from a cold GPU shows an even larger speedup. Given the
critical nature of fault performance, ULLS appears to be a worthwhile
feature.

ULLS will consume more power (not yet measured) due to a continuously
running batch on the paging engine. However, compute UMDs already do
this on engines exposed to users. Again, this seems like a worthwhile
tradeoff.

CPU binds are required for ULLS to function, as the migration queue
needs exclusive access to the paging hardware engine. Thus, CPU binds
are included here. Beyond being a requirement for ULLS, CPU binds
should also reduce VM bind latency and decouple kernel binds from
unrelated copy/clear jobs—this is especially beneficial when faults are
serviced in parallel. Average bind time in a parallel faulting test case
was reduced by approximately 15µs-in the worst case, 2M copy time (~140µs)
* (number of page fault threads - 1) latency would be added to single
fault.

This series could be merged in phases: first CPU binds, then ULLS on the
migration execution queue.

Last couple of patches in series add modparams for quick performance /
power experiments.

v2:
 - Use delayed worker to exit ULLS mode in an effort to save on power
 - Various other cleanups

Matt

[1] https://patchwork.freedesktop.org/series/149811/



Matthew Brost (15):
  drm/xe: Drop struct xe_migrate_pt_update argument from populate /
    clear vfuns
  drm/xe: Add __xe_migrate_update_pgtables_cpu helper
  drm/xe: CPU binds for jobs
  drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
  drm/xe: Don't use migrate exec queue for page fault binds
  drm/xe: Do not create a VM bind queue per tile
  drm/xe: Add xe_hw_engine_write_ring_tail
  drm/xe: Add ULLS support to LRC
  drm/xe: Add ULLS migration job support to migration layer
  drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
  drm/xe: Add ULLS migration job support to ring ops
  drm/xe: Add ULLS migration job support to GuC submission
  drm/xe: Enter ULLS for migration jobs upon page fault or SVM prefetch
  drm/xe: Add modparam to enable / disable ULLS on migrate queue
  drm/xe: Add modparam to enable / disable high SLPC on migrate queue

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/tests/xe_migrate.c         |   2 +
 drivers/gpu/drm/xe/xe_bo.c                    |   7 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   9 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   2 -
 drivers/gpu/drm/xe/xe_debugfs.c               |   3 +
 drivers/gpu/drm/xe/xe_device.c                |  13 +-
 drivers/gpu/drm/xe/xe_device_types.h          |  10 +
 drivers/gpu/drm/xe/xe_drm_client.c            |   3 +-
 drivers/gpu/drm/xe/xe_exec_queue.c            |  43 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |  15 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  58 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  10 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  51 ++
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
 drivers/gpu/drm/xe/xe_lrc_types.h             |   4 +
 drivers/gpu/drm/xe/xe_migrate.c               | 544 +++++++++---------
 drivers/gpu/drm/xe/xe_migrate.h               |  24 +-
 drivers/gpu/drm/xe/xe_module.c                |  10 +
 drivers/gpu/drm/xe/xe_module.h                |   2 +
 drivers/gpu/drm/xe/xe_pt.c                    | 221 +++++--
 drivers/gpu/drm/xe/xe_pt.h                    |   5 +-
 drivers/gpu/drm/xe/xe_pt_types.h              |  29 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |  31 +
 drivers/gpu/drm/xe/xe_sched_job.c             |  78 ++-
 drivers/gpu/drm/xe/xe_sched_job_types.h       |  37 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  11 +
 drivers/gpu/drm/xe/xe_vm.c                    |  99 ++--
 drivers/gpu/drm/xe/xe_vm_types.h              |   2 +-
 31 files changed, 846 insertions(+), 489 deletions(-)

-- 
2.34.1

