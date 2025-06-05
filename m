Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA28C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1844410E944;
	Thu,  5 Jun 2025 15:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWyF8HRA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8C10E8AB
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749137452; x=1780673452;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h0vXpwom4JIMJxv2Nx+eapXUwKV2D84/xAzNmXscLak=;
 b=MWyF8HRAkhv4fj50niKsSkdOE9qBKMz3y0ixWNqRtXvEtRKnArAsyBDZ
 dyNEN52jp9dvvCyLcXW7e3OANuRqDrp1Dxnf0uMI0aL6kKbyozW3yy3l6
 u9AO0TZoQs5YKQcrSeL/m/nH4iVWypd549ZifLIBZQ2Io1wNxsPXgmTp7
 c39j2nbtgW9FsW/Igw9VanTtBCawXJwqFHTwPVRKxYkmJXUFqU271dWm5
 Q3tVJ8cZLM+n1R2q+sDiXfqQCdbtec5r6K075Rv4r+ZDV4rxlPFTawbYR
 I3AMas3qU9Dr9hdXRku3sTPsuiN1jmDX3WHcqzvbAPn6syohH5VqOghWP g==;
X-CSE-ConnectionGUID: lY9QG6TNRrGXlBWIcJdcrw==
X-CSE-MsgGUID: SaxFYAwhSr+cTlfiKanViQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61529482"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="61529482"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:51 -0700
X-CSE-ConnectionGUID: ZSR7nphJR5GSQGjslzOq1A==
X-CSE-MsgGUID: qcTpiGnXQm+EZ3rGYsiMHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="176502788"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 08:30:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 00/15] CPU binds and ULLS on migration queue 
Date: Thu,  5 Jun 2025 08:32:08 -0700
Message-Id: <20250605153223.2789122-1-matthew.brost@intel.com>
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

Matt

[1] https://patchwork.freedesktop.org/series/149811/

Matthew Brost (15):
  drm/xe: Drop struct xe_migrate_pt_update argument from populate /
    clear vfuns
  drm/xe: Add __xe_migrate_update_pgtables_cpu helper
  drm/xe: CPU binds for jobs
  drm/xe: Remove unused arguments from xe_migrate_pt_update_ops
  drm/xe: Don't use migrate exec queue for page fault binds
  drm/xe: Add xe_hw_engine_write_ring_tail
  drm/xe: Add ULLS support to LRC
  drm/xe: Add ULLS migration job support to migration layer
  drm/xe: Add MI_SEMAPHORE_WAIT instruction defs
  drm/xe: Add ULLS migration job support to ring ops
  drm/xe: Add ULLS migration job support to GuC submission
  drm/xe: Enable ULLS migration jobs when opening LR VM
  drm/xe: Set slpc freq to max on ULLS jobs
  drm/xe: Add modparam to enable / disable ULLS on migrate queue
  drm/xe: Add modparam to enable / disable high SLPC on migrate queue

 .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
 drivers/gpu/drm/xe/xe_bo.c                    |   7 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   9 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   2 -
 drivers/gpu/drm/xe/xe_debugfs.c               |   3 +
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 drivers/gpu/drm/xe/xe_device_types.h          |  10 +
 drivers/gpu/drm/xe/xe_drm_client.c            |   3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  86 +++-
 drivers/gpu/drm/xe/xe_hw_engine.c             |  10 +
 drivers/gpu/drm/xe/xe_hw_engine.h             |   1 +
 drivers/gpu/drm/xe/xe_lrc.c                   |  51 +-
 drivers/gpu/drm/xe/xe_lrc.h                   |   3 +
 drivers/gpu/drm/xe/xe_lrc_types.h             |   2 +
 drivers/gpu/drm/xe/xe_migrate.c               | 442 ++++++++----------
 drivers/gpu/drm/xe/xe_migrate.h               |  27 +-
 drivers/gpu/drm/xe/xe_module.c                |   7 +
 drivers/gpu/drm/xe/xe_module.h                |   2 +
 drivers/gpu/drm/xe/xe_pt.c                    | 221 ++++++---
 drivers/gpu/drm/xe/xe_pt.h                    |   5 +-
 drivers/gpu/drm/xe/xe_pt_types.h              |  29 +-
 drivers/gpu/drm/xe/xe_ring_ops.c              |  30 ++
 drivers/gpu/drm/xe/xe_sched_job.c             |  78 ++--
 drivers/gpu/drm/xe/xe_sched_job_types.h       |  37 +-
 drivers/gpu/drm/xe/xe_vm.c                    |  73 +--
 25 files changed, 730 insertions(+), 417 deletions(-)

-- 
2.34.1

