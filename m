Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C52C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 14:18:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E4710E206;
	Tue, 16 May 2023 14:18:53 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8465C10E206
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684246731; x=1715782731;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vR1uK6CJPpPBty5W6v+85m7tL8zxM4cglSGu5V9MTdI=;
 b=E89AqFjOmVRR5DjJjg5lqxE8lzx54U62qqEoyelbhT8scM0PoLpQYmOH
 fATcwP7dDFF18BAI+MWkkaSAjcHZ+rKM8gxIBMdtpmxDGntKK8SQbMRhh
 ZoZ4y9acRQqG2wuHhFPwdrYB4U5tljH1LMQ7/rpC3O4C/c4E/ofFigQ4W
 /ITm+d3Sh71xefsK7qxPKLPE+DvtFAt6b5XB6TX1Fb7RU9szMXKvhFdKR
 CSMXM2qFstqIai3iQgWwSsUqdZBMF69j+AHRH+Pnt5SsorIVHZ+TM31S3
 0lucwbHqq/l/s2tph7JMZmIGSNVOmSxFUd0M0pzFtH1hqo1i/PSwGxV5D A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="350328517"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="350328517"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="651856503"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="651856503"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.49.128])
 ([10.252.49.128])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 07:18:48 -0700
Message-ID: <56c0ecb8-fe67-b75a-8b4d-21eabd7fc1bf@linux.intel.com>
Date: Tue, 16 May 2023 16:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
Content-Language: en-US
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 00/26] Separate GT and tile
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
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/11/2023 5:46 AM, Matt Roper wrote:
> A 'tile' is not the same thing as a 'GT.'  For historical reasons, i915
> attempted to use a single 'struct intel_gt' to represent both concepts,
> although this design hasn't worked out terribly well.  For Xe we have
> the opportunity to design the driver in a way that more accurately
> reflects the real hardware behavior.
>
> Different vendors use the term "tile" a bit differently, but in the
> Intel world, a 'tile' is pretty close to what most people would think of
> as being a complete GPU.  When multiple GPUs are placed behind a single
> PCI device, that's what we refer to as a "multi-tile device."  In such
> cases, pretty much all hardware is replicated per-tile, although certain
> responsibilities like PCI communication, reporting of interrupts to the
> OS, etc. are handled solely by the "root tile."  A multi-tile platform
> takes care of tying the tiles together in a way such that interrupt
> notifications from remote tiles are forwarded to the root tile, the
> per-tile vram is combined into a single address space, etc.
>
> In contrast, a "GT" (which officially stands for "Graphics Technology")
> is the subset of a GPU/tile that is responsible for implementing
> graphics and/or media operations.  The GT is where a lot of the driver
> implementation happens since it's where the hardware engines, the
> execution units, and the GuC all reside.
>
> Historically most Intel devices were single-tile devices that contained
> a single GT.  PVC is currently the only released Intel platform built on
> a multi-tile design (i.e., multiple GPUs behind a single PCI device);
> each PVC tile only has a single GT.  In contrast, platforms like MTL
> that have separate chips for render and media IP are still only a single
> logical GPU, but the graphics and media IP blocks are exposed each
> exposed as a separate GT within that single GPU.  This is important from
> a software perspective because multi-GT platforms like MTL only
> replicate a subset of the GPU hardware and behave differently than
> multi-tile platforms like PVC where nearly everything is replicated.
>
> This series separates tiles from GTs in a manner that more closely
> matches the hardware behavior.  We now consider a PCI device (xe_device)
> to contain one or more tiles (struct xe_tile).  Each tile will contain
> one or two GTs (struct xe_gt).  Although we don't have any platforms yet
> that are multi-tile *and* contain more than one GT per tile, that may
> change in the future.  This driver redesign splits functionality as
> follows:
>
> Per-tile functionality (shared by all GTs within the tile):
>   - Complete 4MB MMIO space (containing SGunit/SoC registers, GT
>     registers, display registers, etc.)
>   - Global GTT
>   - VRAM (if discrete)
>   - Interrupt flows
>   - Migration context
>   - kernel batchbuffer pool
>   - Primary GT
>   - Media GT (if media version >= 13)
>
> Per-GT functionality:
>   - GuC
>   - Hardware engines
>   - Programmable hardware units (subslices, EUs)
>   - GSI subset of registers (multiple copies of these registers reside
>     within the complete MMIO space provided by the tile, but at different
>     offsets --- 0 for render, 0x380000 for media)
>   - Multicast register steering
>   - TLBs to cache page table translations
>   - Reset capability
>   - Low-level power management (e.g., C6)
>   - Clock frequency
>   - MOCS and PAT programming
>
> At the moment I've left USM / pagefault handling at the GT level,
> although I'm not familiar enough with that specific feature to know
> whether it's truly correct or not.
>
> The first patch in this series temporarily drops MTL media GT support.
> The driver doesn't load properly on MTL today, largely due to the
> mishandling of GT vs tile; dropping support completely allows us to more
> easily make the necessary driver redesign required.  The media GT is
> re-enabled (properly this time) near the end of the series and this
> allows the driver to load successfully without error on MTL for the
> first time.  There are still issues when submitting workloads to MTL
> after driver load (i.e., CAT errors), but those seem to be a separate
> platform-specific issues unrelated to the GT/tile work in this series
> that will need to be debugged and fixed separately.
>
>
> This series leaves a few open questions and FIXME's:
>   - Unlike i915, the Xe driver has chosen to expose GTs to userspace
>     rather than keeping them a hidden implementation detail.  With the
>     separation of xe_tile and xe_gt, we need to decide whether we also
>     want to expose tiles (in addition to GTs), whether we want to _only_
>     expose tiles (and keep the primary vs media GT separation a hidden
>     internal detail), or something else.
>   - How should GTs be numbered?  Today it's straightforward --- PVC
>     assigns GT IDs 0 and 1 to the primary GT of each tile.  MTL assigns
>     GT IDs 0 and 1 to the primary and media GTs of its sole tile.  But if
>     we have a platform in the future that has multiple tiles _and_
>     multiple GTs per tile, how should we handle the numbering in that
>     case?
>   - Xe (mis)design used xe_gt as the target of all MMIO operations (i.e.,
>     xe_mmio_*()).  This really doesn't make sense, especially since
>     there's a lot of MMIO accesses that are completely unrelated to GT
>     (i.e., sgunit registers, display registers, etc.).  i915 used
>     'intel_uncore' as the MMIO target, although that wasn't really an
>     accurate reflection of the hardware either.  What we really want is
>     something that combines the MMIO register space (stored in the tile)
>     with the GSI offset (stored in the GT).  My current plan is to
>     introduce an "xe_mmio_view" (name may change) in a future series that
>     will serve as a target for register operations.  There will be
>     sensible APIs to obtain an xe_mmio_view appropriate to the type of
>     register access being performed (and that will also be able to do
>     some range sanity checking in debug drivers to help catch misuse).
>     That's a somewhat large/invasive change, so I'm saving that for a
>     follow-up series after this one is completed.
>
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>


Tested this on my MTL C0. You might be working on next revision but feel 
free to add Tested-by: Nirmoy Das <nirmoy.das@intel.com> for the series.

>
>
> Matt Roper (26):
>    drm/xe/mtl: Disable media GT
>    drm/xe: Introduce xe_tile
>    drm/xe: Add backpointer from gt to tile
>    drm/xe: Add for_each_tile iterator
>    drm/xe: Move register MMIO into xe_tile
>    drm/xe: Move VRAM from GT to tile
>    drm/xe: Memory allocations are tile-based, not GT-based
>    drm/xe: Move migration from GT to tile
>    drm/xe: Clarify 'gt' retrieval for primary tile
>    drm/xe: Drop vram_id
>    drm/xe: Drop extra_gts[] declarations and XE_GT_TYPE_REMOTE
>    drm/xe: Allocate GT dynamically
>    drm/xe: Add media GT to tile
>    drm/xe: Move display IRQ postinstall out of GT function
>    drm/xe: Interrupts are delivered per-tile, not per-GT
>    drm/xe/irq: Handle ASLE backlight interrupts at same time as display
>    drm/xe/irq: Actually call xe_irq_postinstall()
>    drm/xe/irq: Ensure primary GuC won't clobber media GuC's interrupt
>      mask
>    drm/xe/irq: Untangle postinstall functions
>    drm/xe: Replace xe_gt_irq_postinstall with xe_irq_enable_hwe
>    drm/xe: Invalidate TLB on all affected GTs during GGTT updates
>    drm/xe/tlb: Obtain forcewake when doing GGTT TLB invalidations
>    drm/xe: Allow GT looping and lookup on standalone media
>    drm/xe: Update query uapi to support standalone media
>    drm/xe: Reinstate media GT support
>    drm/xe: Clarify source of GT log messages
>
>   drivers/gpu/drm/i915/display/intel_dsb.c      |   5 +-
>   drivers/gpu/drm/i915/display/intel_fbc.c      |   3 +-
>   drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   .../drm/xe/compat-i915-headers/intel_uncore.h |   2 +-
>   drivers/gpu/drm/xe/display/ext/i915_irq.c     |   2 +-
>   drivers/gpu/drm/xe/display/xe_fb_pin.c        |  13 +-
>   drivers/gpu/drm/xe/display/xe_plane_initial.c |   8 +-
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   8 +
>   drivers/gpu/drm/xe/tests/xe_bo.c              |   8 +-
>   drivers/gpu/drm/xe/tests/xe_migrate.c         |  15 +-
>   drivers/gpu/drm/xe/xe_bb.c                    |   5 +-
>   drivers/gpu/drm/xe/xe_bo.c                    | 104 ++---
>   drivers/gpu/drm/xe/xe_bo.h                    |  20 +-
>   drivers/gpu/drm/xe/xe_bo_evict.c              |  22 +-
>   drivers/gpu/drm/xe/xe_bo_types.h              |   4 +-
>   drivers/gpu/drm/xe/xe_device.c                |  12 +-
>   drivers/gpu/drm/xe/xe_device.h                |  49 ++-
>   drivers/gpu/drm/xe/xe_device_types.h          | 107 ++++-
>   drivers/gpu/drm/xe/xe_engine.c                |   2 +-
>   drivers/gpu/drm/xe/xe_ggtt.c                  |  45 +-
>   drivers/gpu/drm/xe/xe_ggtt.h                  |   6 +-
>   drivers/gpu/drm/xe/xe_ggtt_types.h            |   2 +-
>   drivers/gpu/drm/xe/xe_gt.c                    | 191 ++-------
>   drivers/gpu/drm/xe/xe_gt.h                    |   8 +-
>   drivers/gpu/drm/xe/xe_gt_debugfs.c            |   8 +-
>   drivers/gpu/drm/xe/xe_gt_mcr.c                |   2 +-
>   drivers/gpu/drm/xe/xe_gt_pagefault.c          |  16 +-
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |   4 +-
>   drivers/gpu/drm/xe/xe_gt_types.h              |  87 ++--
>   drivers/gpu/drm/xe/xe_guc.c                   |  11 +-
>   drivers/gpu/drm/xe/xe_guc_ads.c               |   5 +-
>   drivers/gpu/drm/xe/xe_guc_ct.c                |   5 +-
>   drivers/gpu/drm/xe/xe_guc_hwconfig.c          |   5 +-
>   drivers/gpu/drm/xe/xe_guc_log.c               |   6 +-
>   drivers/gpu/drm/xe/xe_guc_pc.c                |   5 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c             |   6 +-
>   drivers/gpu/drm/xe/xe_irq.c                   | 393 +++++++++---------
>   drivers/gpu/drm/xe/xe_irq.h                   |   3 +-
>   drivers/gpu/drm/xe/xe_lrc.c                   |  13 +-
>   drivers/gpu/drm/xe/xe_lrc_types.h             |   4 +-
>   drivers/gpu/drm/xe/xe_migrate.c               |  76 ++--
>   drivers/gpu/drm/xe/xe_migrate.h               |   9 +-
>   drivers/gpu/drm/xe/xe_mmio.c                  |  92 ++--
>   drivers/gpu/drm/xe/xe_mmio.h                  |  21 +-
>   drivers/gpu/drm/xe/xe_mocs.c                  |  14 +-
>   drivers/gpu/drm/xe/xe_pci.c                   |  92 ++--
>   drivers/gpu/drm/xe/xe_pt.c                    | 150 ++++---
>   drivers/gpu/drm/xe/xe_pt.h                    |  14 +-
>   drivers/gpu/drm/xe/xe_query.c                 |  32 +-
>   drivers/gpu/drm/xe/xe_res_cursor.h            |   2 +-
>   drivers/gpu/drm/xe/xe_sa.c                    |  13 +-
>   drivers/gpu/drm/xe/xe_sa.h                    |   4 +-
>   drivers/gpu/drm/xe/xe_tile.c                  |  89 ++++
>   drivers/gpu/drm/xe/xe_tile.h                  |  16 +
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   4 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  16 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   4 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |   6 +-
>   drivers/gpu/drm/xe/xe_uc_fw.c                 |   5 +-
>   drivers/gpu/drm/xe/xe_vm.c                    | 156 ++++---
>   drivers/gpu/drm/xe/xe_vm.h                    |   2 +-
>   drivers/gpu/drm/xe/xe_vm_types.h              |  22 +-
>   include/uapi/drm/xe_drm.h                     |   4 +-
>   64 files changed, 1108 insertions(+), 957 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_tile.c
>   create mode 100644 drivers/gpu/drm/xe/xe_tile.h
>
