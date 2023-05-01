Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C46C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B41610E38B;
	Mon,  1 May 2023 07:51:13 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429E510E303
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927472; x=1714463472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WOgmMdp9B8bdA7wAc1OBP8jL9Q/DLUVIsYPf4rjo4ic=;
 b=BtdSkOM4EFJeBYx0fq+Lyjtg1WJmt28X4khijQQKa2uy3Y7qgFNAORev
 xoPlS8JMLXhfQHnleCZWmXRTVRRauvG2/KEmYLhHUWRL/URSEMZ6J7Apv
 EjuZjk19VbVCzS4+lMyFkfdGRa5j7npS8WFYB0OW/UQFh6SBaywHptW91
 3ucSjfHzKSJrwN7rLSMAcA/9l2/b1ylCnW4J9VRCITHgfZPuI99nwQCvi
 hAM1uL97ZQuim8gR0LV58mpjAYSOGi0hhHrzqwHUDhbTiBStzAz9XQi92
 MqZfBGCsx7N1QbdqYQqhKjFZmFxH7L8gjXHDAalkGSLhy8YQ+376jjtIF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910699"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910699"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095182"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095182"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:50:44 -0700
Message-Id: <20230501075114.3108352-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 00/30] Upstreaming prep / all of mbrosts patches
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

Series includes:

- DRM scheduler changes for firmware backends (1 to 1 entity to scheduler)
- LR workload story
- VM LRU handling
- GuC doorbell submission
- Basic GPUVA
- Sparse binding support
- GPUVA + extobj + drm exec (collaboration with dakr + Francois Dugast)
- GPUVA + userptr (minimal, more can be once Nouveua has userptr)
- Fix fencing rules for compute / fault mode
- Remove async worker for VM + error handling updates

Series is not fully ready for upstream and some of these things need to
get merged upstream first but overall it is largely correct and
certainly step in the right direction. Based on its size and the fact it
took me 8 hours to rebase this today I'd say let's get this tree and
fixup everything else in place.

Minor uAPI breakage, IGT series will be posted early tomorrow.

gitlab link:
https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/344

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Christian König (1):
  drm: execution context for GEM buffers v3

Danilo Krummrich (2):
  maple_tree: split up MA_STATE() macro
  drm: manager to keep track of GPUs VA mappings

Matthew Brost (27):
  drm/sched: Add run_wq argument to drm_sched_init
  drm/sched: Move schedule policy to scheduler
  drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
  drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
  drm/xe: Long running job update
  drm/xe: Ensure LR engines are not persistent
  drm/xe: Only try to lock external BOs in VM bind
  drm/xe: VM LRU bulk move
  drm/xe/guc: Read HXG fields from DW1 of G2H response
  drm/xe/guc: Return the lower part of blocking H2G message
  drm/xe/guc: Use doorbells for submission if possible
  drm/xe/guc: Print doorbell ID in GuC engine debugfs entry
  maple_tree: Export mas_preallocate
  drm/xe: Port Xe to GPUVA
  drm/xe: NULL binding implementation
  drm/xe: Avoid doing rebinds
  drm/xe: Reduce the number list links in xe_vma
  drm/xe: Optimize size of xe_vma allocation
  drm/gpuva: Add drm device to GPUVA manager
  drm/gpuva: Move dma-resv to GPUVA manager
  drm/gpuva: Add support for extobj
  drm/xe: Userptr refactor
  drm/exec: Always compile drm_exec
  drm/xe: Use drm_exec for locking rather than TTM exec helpers
  drm/xe: Allow dma-fences as in-syncs for compute / faulting VM
  drm/xe: Allow compute VMs to output dma-fences on binds
  drm/xe: remove async worker, sync binds, new error handling

 Documentation/gpu/drm-mm.rst                 |   43 +
 drivers/gpu/drm/Kconfig                      |    6 +
 drivers/gpu/drm/Makefile                     |    4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |    3 +-
 drivers/gpu/drm/drm_debugfs.c                |   41 +
 drivers/gpu/drm/drm_exec.c                   |  248 ++
 drivers/gpu/drm/drm_gem.c                    |    3 +
 drivers/gpu/drm/drm_gpuva_mgr.c              | 1779 ++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |    5 +-
 drivers/gpu/drm/i915/display/intel_display.c |    6 +-
 drivers/gpu/drm/lima/lima_sched.c            |    5 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c         |    5 +-
 drivers/gpu/drm/panfrost/panfrost_job.c      |    5 +-
 drivers/gpu/drm/scheduler/sched_entity.c     |   84 +-
 drivers/gpu/drm/scheduler/sched_fence.c      |    2 +-
 drivers/gpu/drm/scheduler/sched_main.c       |   88 +-
 drivers/gpu/drm/v3d/v3d_sched.c              |   25 +-
 drivers/gpu/drm/xe/Kconfig                   |    1 +
 drivers/gpu/drm/xe/regs/xe_guc_regs.h        |    1 +
 drivers/gpu/drm/xe/xe_bo.c                   |  100 +-
 drivers/gpu/drm/xe/xe_bo.h                   |   13 +-
 drivers/gpu/drm/xe/xe_bo_evict.c             |   24 +-
 drivers/gpu/drm/xe/xe_bo_types.h             |    1 -
 drivers/gpu/drm/xe/xe_device.c               |    2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c              |    2 +-
 drivers/gpu/drm/xe/xe_engine.c               |   50 +-
 drivers/gpu/drm/xe/xe_engine.h               |    4 +
 drivers/gpu/drm/xe/xe_engine_types.h         |    1 +
 drivers/gpu/drm/xe/xe_exec.c                 |  117 +-
 drivers/gpu/drm/xe/xe_execlist.c             |    3 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c         |   84 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c  |   14 +-
 drivers/gpu/drm/xe/xe_guc.c                  |    6 +
 drivers/gpu/drm/xe/xe_guc_ct.c               |   12 +-
 drivers/gpu/drm/xe/xe_guc_engine_types.h     |    9 +
 drivers/gpu/drm/xe/xe_guc_pc.c               |    6 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           |  398 ++-
 drivers/gpu/drm/xe/xe_guc_submit.h           |    1 +
 drivers/gpu/drm/xe/xe_guc_types.h            |    4 +
 drivers/gpu/drm/xe/xe_huc.c                  |    2 +-
 drivers/gpu/drm/xe/xe_lrc.c                  |    8 +-
 drivers/gpu/drm/xe/xe_migrate.c              |   31 +-
 drivers/gpu/drm/xe/xe_pt.c                   |  198 +-
 drivers/gpu/drm/xe/xe_sync.c                 |   26 +-
 drivers/gpu/drm/xe/xe_sync.h                 |    2 +-
 drivers/gpu/drm/xe/xe_trace.h                |   20 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 2565 +++++++-----------
 drivers/gpu/drm/xe/xe_vm.h                   |  135 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c           |  125 +-
 drivers/gpu/drm/xe/xe_vm_types.h             |  324 ++-
 drivers/gpu/drm/xe/xe_wait_user_fence.c      |   43 +-
 include/drm/drm_debugfs.h                    |   24 +
 include/drm/drm_drv.h                        |    7 +
 include/drm/drm_exec.h                       |  115 +
 include/drm/drm_gem.h                        |   75 +
 include/drm/drm_gpuva_mgr.h                  |  759 ++++++
 include/drm/gpu_scheduler.h                  |   29 +-
 include/linux/maple_tree.h                   |    7 +-
 include/uapi/drm/xe_drm.h                    |   87 +-
 lib/maple_tree.c                             |    1 +
 60 files changed, 5484 insertions(+), 2304 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 include/drm/drm_exec.h
 create mode 100644 include/drm/drm_gpuva_mgr.h

-- 
2.34.1

