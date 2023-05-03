Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FA3C77B78
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 12:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFFF10E027;
	Wed,  3 May 2023 12:40:49 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1D210E027
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683117647; x=1714653647;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HD6agsL7/jZpz7n+JufHyYVVb+BPuEf6EA2th70Dnxk=;
 b=OHTCXnbUB1mwdyqbbJ1FcL09qDB0MECIrO+Cam+t5NP/jX68OuF+57Wp
 5biGfdY1Ko6b34M34fpmN6AaqShHm1C4pbCSLkNuUOE2iIDNNxlpUvTit
 YKFGgE6dtTMovEJdWrrSj5QwjZn0/SnJv6BaaxuohkFMVJW3azhZT/HAX
 pCJiuzqj7s5GX2269Pupe+3mogtRi5aVIrJaHk60vgZUEeMgJ4J1+ZDuY
 h/+I9iDl7xoIFG3MFrIqD3m96gnkSz28E8OFoiab2PTcorTIqZQKeC4g1
 2MJpTAUYfltsOwNpp7fmcWc6NCSUjaWDcPQtIp/4GAcsXt5zIh+6+7XS6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="346122970"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="346122970"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 05:37:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="820750767"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="820750767"
Received: from nbint65x-mobl.gar.corp.intel.com (HELO [10.249.254.206])
 ([10.249.254.206])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 05:37:19 -0700
Message-ID: <21f0b213-c307-2fbd-1312-74b26287d352@linux.intel.com>
Date: Wed, 3 May 2023 14:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 00/31] Upstreaming prep / all of mbrosts
 patches
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

Hi, Matthew

On 5/2/23 02:16, Matthew Brost wrote:
> Series includes:
>
> - DRM scheduler changes for firmware backends (1 to 1 entity to scheduler)
> - LR workload story
> - VM LRU handling
> - GuC doorbell submission
> - Basic GPUVA
> - Sparse binding support
> - GPUVA + extobj + drm exec (collaboration with dakr + Francois Dugast)
> - GPUVA + userptr (minimal, more can be once Nouveua has userptr)
> - Fix fencing rules for compute / fault mode
> - Remove async worker for VM + error handling updates
> - Kernel doc for VM bind

It would be beneficial to the reviewer if  you could make separate 
series where applicable with links to previous discussions and add 
information about whether all design issues /discussions were resolved 
or if anything was remaining and a brief guidance as to what is in each 
patch of the series.

/Thomas




> Series is not fully ready for upstream and some of these things need to
> get merged upstream first but overall it is largely correct and
> certainly step in the right direction. Based on its size and the fact it
> took me 8 hours to rebase this today I'd say let's get this tree and
> fixup everything else in place.
>
> Minor uAPI breakage, IGT series:
> https://patchwork.freedesktop.org/series/117177/
>
> gitlab link:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/344
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
> Christian König (1):
>    drm: execution context for GEM buffers v3
>
> Danilo Krummrich (2):
>    maple_tree: split up MA_STATE() macro
>    drm: manager to keep track of GPUs VA mappings
>
> Matthew Brost (28):
>    drm/sched: Add run_wq argument to drm_sched_init
>    drm/sched: Move schedule policy to scheduler
>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>    drm/xe: Use DRM_SCHED_POLICY_SINGLE_ENTITY mode
>    drm/xe: Long running job update
>    drm/xe: Ensure LR engines are not persistent
>    drm/xe: Only try to lock external BOs in VM bind
>    drm/xe: VM LRU bulk move
>    drm/xe/guc: Read HXG fields from DW1 of G2H response
>    drm/xe/guc: Return the lower part of blocking H2G message
>    drm/xe/guc: Use doorbells for submission if possible
>    drm/xe/guc: Print doorbell ID in GuC engine debugfs entry
>    maple_tree: Export mas_preallocate
>    drm/xe: Port Xe to GPUVA
>    drm/xe: NULL binding implementation
>    drm/xe: Avoid doing rebinds
>    drm/xe: Reduce the number list links in xe_vma
>    drm/xe: Optimize size of xe_vma allocation
>    drm/gpuva: Add drm device to GPUVA manager
>    drm/gpuva: Move dma-resv to GPUVA manager
>    drm/gpuva: Add support for extobj
>    drm/xe: Userptr refactor
>    drm/exec: Always compile drm_exec
>    drm/xe: Use drm_exec for locking rather than TTM exec helpers
>    drm/xe: Allow dma-fences as in-syncs for compute / faulting VM
>    drm/xe: Allow compute VMs to output dma-fences on binds
>    drm/xe: remove async worker, sync binds, new error handling
>    drm/xe/uapi: Add some VM bind kernel doc
>
>   Documentation/gpu/drm-mm.rst                 |   43 +
>   drivers/gpu/drm/Kconfig                      |    6 +
>   drivers/gpu/drm/Makefile                     |    4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |    3 +-
>   drivers/gpu/drm/drm_debugfs.c                |   41 +
>   drivers/gpu/drm/drm_exec.c                   |  248 ++
>   drivers/gpu/drm/drm_gem.c                    |    3 +
>   drivers/gpu/drm/drm_gpuva_mgr.c              | 1779 ++++++++++++
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c      |    5 +-
>   drivers/gpu/drm/i915/display/intel_display.c |    6 +-
>   drivers/gpu/drm/lima/lima_sched.c            |    5 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c         |    5 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c      |    5 +-
>   drivers/gpu/drm/scheduler/sched_entity.c     |   84 +-
>   drivers/gpu/drm/scheduler/sched_fence.c      |    2 +-
>   drivers/gpu/drm/scheduler/sched_main.c       |   88 +-
>   drivers/gpu/drm/v3d/v3d_sched.c              |   25 +-
>   drivers/gpu/drm/xe/Kconfig                   |    1 +
>   drivers/gpu/drm/xe/regs/xe_guc_regs.h        |    1 +
>   drivers/gpu/drm/xe/tests/xe_bo.c             |   26 +-
>   drivers/gpu/drm/xe/tests/xe_migrate.c        |    6 +-
>   drivers/gpu/drm/xe/xe_bo.c                   |  100 +-
>   drivers/gpu/drm/xe/xe_bo.h                   |   13 +-
>   drivers/gpu/drm/xe/xe_bo_evict.c             |   24 +-
>   drivers/gpu/drm/xe/xe_bo_types.h             |    1 -
>   drivers/gpu/drm/xe/xe_device.c               |    2 +-
>   drivers/gpu/drm/xe/xe_dma_buf.c              |    2 +-
>   drivers/gpu/drm/xe/xe_engine.c               |   50 +-
>   drivers/gpu/drm/xe/xe_engine.h               |    4 +
>   drivers/gpu/drm/xe/xe_engine_types.h         |    1 +
>   drivers/gpu/drm/xe/xe_exec.c                 |  117 +-
>   drivers/gpu/drm/xe/xe_execlist.c             |    3 +-
>   drivers/gpu/drm/xe/xe_gt_pagefault.c         |   84 +-
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c  |   14 +-
>   drivers/gpu/drm/xe/xe_guc.c                  |    6 +
>   drivers/gpu/drm/xe/xe_guc_ct.c               |   12 +-
>   drivers/gpu/drm/xe/xe_guc_engine_types.h     |    9 +
>   drivers/gpu/drm/xe/xe_guc_pc.c               |    6 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c           |  398 ++-
>   drivers/gpu/drm/xe/xe_guc_submit.h           |    1 +
>   drivers/gpu/drm/xe/xe_guc_types.h            |    4 +
>   drivers/gpu/drm/xe/xe_huc.c                  |    2 +-
>   drivers/gpu/drm/xe/xe_lrc.c                  |    8 +-
>   drivers/gpu/drm/xe/xe_migrate.c              |   31 +-
>   drivers/gpu/drm/xe/xe_pt.c                   |  198 +-
>   drivers/gpu/drm/xe/xe_sync.c                 |   26 +-
>   drivers/gpu/drm/xe/xe_sync.h                 |    2 +-
>   drivers/gpu/drm/xe/xe_trace.h                |   20 +-
>   drivers/gpu/drm/xe/xe_vm.c                   | 2567 +++++++-----------
>   drivers/gpu/drm/xe/xe_vm.h                   |  135 +-
>   drivers/gpu/drm/xe/xe_vm_madvise.c           |  125 +-
>   drivers/gpu/drm/xe/xe_vm_types.h             |  324 ++-
>   drivers/gpu/drm/xe/xe_wait_user_fence.c      |   43 +-
>   include/drm/drm_debugfs.h                    |   24 +
>   include/drm/drm_drv.h                        |    7 +
>   include/drm/drm_exec.h                       |  115 +
>   include/drm/drm_gem.h                        |   75 +
>   include/drm/drm_gpuva_mgr.h                  |  759 ++++++
>   include/drm/gpu_scheduler.h                  |   29 +-
>   include/linux/maple_tree.h                   |    7 +-
>   include/uapi/drm/xe_drm.h                    |  128 +-
>   lib/maple_tree.c                             |    1 +
>   62 files changed, 5543 insertions(+), 2320 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_exec.c
>   create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>   create mode 100644 include/drm/drm_exec.h
>   create mode 100644 include/drm/drm_gpuva_mgr.h
>
