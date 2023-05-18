Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677EDC7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 17:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A37310E36A;
	Thu, 18 May 2023 17:48:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2111110E36A
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 17:47:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45FDE6510A;
 Thu, 18 May 2023 17:47:58 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 628A3C433EF;
 Thu, 18 May 2023 17:47:55 +0000 (UTC)
Date: Thu, 18 May 2023 13:47:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZGZkyRBF4Y70Lf82@rdvivi-mobl4>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 08:46:56PM -0700, Matt Roper wrote:
> A 'tile' is not the same thing as a 'GT.'  For historical reasons, i915
> attempted to use a single 'struct intel_gt' to represent both concepts,
> although this design hasn't worked out terribly well.  For Xe we have
> the opportunity to design the driver in a way that more accurately
> reflects the real hardware behavior.
> 
> Different vendors use the term "tile" a bit differently, but in the
> Intel world, a 'tile' is pretty close to what most people would think of

Even in the graphics world we have many different meanings for 'tile'
like the way to organize your pixels in memory, etc...

Other options could be sub_device, subdev, ... ?! but anyway,
as long it is well documented any name should be good.

sub_device would align well with current level 0 API, but I heard that
some folks don't like that and were asking that to change and level 0
to expose all sub_devices like devices, so I'm not sure if it worth
to align.

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
>  - Complete 4MB MMIO space (containing SGunit/SoC registers, GT
>    registers, display registers, etc.)
>  - Global GTT
>  - VRAM (if discrete)
>  - Interrupt flows
>  - Migration context
>  - kernel batchbuffer pool
>  - Primary GT
>  - Media GT (if media version >= 13)
> 
> Per-GT functionality:
>  - GuC
>  - Hardware engines
>  - Programmable hardware units (subslices, EUs)
>  - GSI subset of registers (multiple copies of these registers reside
>    within the complete MMIO space provided by the tile, but at different
>    offsets --- 0 for render, 0x380000 for media)
>  - Multicast register steering
>  - TLBs to cache page table translations
>  - Reset capability
>  - Low-level power management (e.g., C6)
>  - Clock frequency
>  - MOCS and PAT programming

Everything above is a very good text for a /** DOC: **/ page,
could you please add it to the patch 2?

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
>  - Unlike i915, the Xe driver has chosen to expose GTs to userspace
>    rather than keeping them a hidden implementation detail.  With the
>    separation of xe_tile and xe_gt, we need to decide whether we also
>    want to expose tiles (in addition to GTs), whether we want to _only_
>    expose tiles (and keep the primary vs media GT separation a hidden
>    internal detail), or something else.

same level0 alignment dilema applies here...

>  - How should GTs be numbered?  Today it's straightforward --- PVC
>    assigns GT IDs 0 and 1 to the primary GT of each tile.  MTL assigns
>    GT IDs 0 and 1 to the primary and media GTs of its sole tile.  But if
>    we have a platform in the future that has multiple tiles _and_
>    multiple GTs per tile, how should we handle the numbering in that
>    case?

exposing the sub_device/tile would make this numbering likely easier,
but then our future hw change the split again and we are again misaligned...

so, no strong opnion here...

one thing I had in mind before seeing your series was to make things
as simple as gt<n>/ and name file (type?)

$ cat gt0/name
Graphics-Root

$ cat gt1/name
Media

or

$ cat gt1/name
Graphics-Secondary


>  - Xe (mis)design used xe_gt as the target of all MMIO operations (i.e.,
>    xe_mmio_*()).  This really doesn't make sense, especially since
>    there's a lot of MMIO accesses that are completely unrelated to GT
>    (i.e., sgunit registers, display registers, etc.).  i915 used
>    'intel_uncore' as the MMIO target, although that wasn't really an
>    accurate reflection of the hardware either.  What we really want is
>    something that combines the MMIO register space (stored in the tile)
>    with the GSI offset (stored in the GT).  My current plan is to
>    introduce an "xe_mmio_view" (name may change) in a future series that
>    will serve as a target for register operations.  There will be
>    sensible APIs to obtain an xe_mmio_view appropriate to the type of
>    register access being performed (and that will also be able to do
>    some range sanity checking in debug drivers to help catch misuse).
>    That's a somewhat large/invasive change, so I'm saving that for a
>    follow-up series after this one is completed.

\o/

Ville was indeed complaining about this mmio misdesign, but since I don't
like the i915 uncore either I wasn't sure about this, but I like your idea
here very much.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> 
> 
> Matt Roper (26):
>   drm/xe/mtl: Disable media GT
>   drm/xe: Introduce xe_tile
>   drm/xe: Add backpointer from gt to tile
>   drm/xe: Add for_each_tile iterator
>   drm/xe: Move register MMIO into xe_tile
>   drm/xe: Move VRAM from GT to tile
>   drm/xe: Memory allocations are tile-based, not GT-based
>   drm/xe: Move migration from GT to tile
>   drm/xe: Clarify 'gt' retrieval for primary tile
>   drm/xe: Drop vram_id
>   drm/xe: Drop extra_gts[] declarations and XE_GT_TYPE_REMOTE
>   drm/xe: Allocate GT dynamically
>   drm/xe: Add media GT to tile
>   drm/xe: Move display IRQ postinstall out of GT function
>   drm/xe: Interrupts are delivered per-tile, not per-GT
>   drm/xe/irq: Handle ASLE backlight interrupts at same time as display
>   drm/xe/irq: Actually call xe_irq_postinstall()
>   drm/xe/irq: Ensure primary GuC won't clobber media GuC's interrupt
>     mask
>   drm/xe/irq: Untangle postinstall functions
>   drm/xe: Replace xe_gt_irq_postinstall with xe_irq_enable_hwe
>   drm/xe: Invalidate TLB on all affected GTs during GGTT updates
>   drm/xe/tlb: Obtain forcewake when doing GGTT TLB invalidations
>   drm/xe: Allow GT looping and lookup on standalone media
>   drm/xe: Update query uapi to support standalone media
>   drm/xe: Reinstate media GT support
>   drm/xe: Clarify source of GT log messages
> 
>  drivers/gpu/drm/i915/display/intel_dsb.c      |   5 +-
>  drivers/gpu/drm/i915/display/intel_fbc.c      |   3 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  .../drm/xe/compat-i915-headers/intel_uncore.h |   2 +-
>  drivers/gpu/drm/xe/display/ext/i915_irq.c     |   2 +-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |  13 +-
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |   8 +-
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   8 +
>  drivers/gpu/drm/xe/tests/xe_bo.c              |   8 +-
>  drivers/gpu/drm/xe/tests/xe_migrate.c         |  15 +-
>  drivers/gpu/drm/xe/xe_bb.c                    |   5 +-
>  drivers/gpu/drm/xe/xe_bo.c                    | 104 ++---
>  drivers/gpu/drm/xe/xe_bo.h                    |  20 +-
>  drivers/gpu/drm/xe/xe_bo_evict.c              |  22 +-
>  drivers/gpu/drm/xe/xe_bo_types.h              |   4 +-
>  drivers/gpu/drm/xe/xe_device.c                |  12 +-
>  drivers/gpu/drm/xe/xe_device.h                |  49 ++-
>  drivers/gpu/drm/xe/xe_device_types.h          | 107 ++++-
>  drivers/gpu/drm/xe/xe_engine.c                |   2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                  |  45 +-
>  drivers/gpu/drm/xe/xe_ggtt.h                  |   6 +-
>  drivers/gpu/drm/xe/xe_ggtt_types.h            |   2 +-
>  drivers/gpu/drm/xe/xe_gt.c                    | 191 ++-------
>  drivers/gpu/drm/xe/xe_gt.h                    |   8 +-
>  drivers/gpu/drm/xe/xe_gt_debugfs.c            |   8 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c                |   2 +-
>  drivers/gpu/drm/xe/xe_gt_pagefault.c          |  16 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   |   4 +-
>  drivers/gpu/drm/xe/xe_gt_types.h              |  87 ++--
>  drivers/gpu/drm/xe/xe_guc.c                   |  11 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c               |   5 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c                |   5 +-
>  drivers/gpu/drm/xe/xe_guc_hwconfig.c          |   5 +-
>  drivers/gpu/drm/xe/xe_guc_log.c               |   6 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c                |   5 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c             |   6 +-
>  drivers/gpu/drm/xe/xe_irq.c                   | 393 +++++++++---------
>  drivers/gpu/drm/xe/xe_irq.h                   |   3 +-
>  drivers/gpu/drm/xe/xe_lrc.c                   |  13 +-
>  drivers/gpu/drm/xe/xe_lrc_types.h             |   4 +-
>  drivers/gpu/drm/xe/xe_migrate.c               |  76 ++--
>  drivers/gpu/drm/xe/xe_migrate.h               |   9 +-
>  drivers/gpu/drm/xe/xe_mmio.c                  |  92 ++--
>  drivers/gpu/drm/xe/xe_mmio.h                  |  21 +-
>  drivers/gpu/drm/xe/xe_mocs.c                  |  14 +-
>  drivers/gpu/drm/xe/xe_pci.c                   |  92 ++--
>  drivers/gpu/drm/xe/xe_pt.c                    | 150 ++++---
>  drivers/gpu/drm/xe/xe_pt.h                    |  14 +-
>  drivers/gpu/drm/xe/xe_query.c                 |  32 +-
>  drivers/gpu/drm/xe/xe_res_cursor.h            |   2 +-
>  drivers/gpu/drm/xe/xe_sa.c                    |  13 +-
>  drivers/gpu/drm/xe/xe_sa.h                    |   4 +-
>  drivers/gpu/drm/xe/xe_tile.c                  |  89 ++++
>  drivers/gpu/drm/xe/xe_tile.h                  |  16 +
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   4 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  16 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   4 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |   6 +-
>  drivers/gpu/drm/xe/xe_uc_fw.c                 |   5 +-
>  drivers/gpu/drm/xe/xe_vm.c                    | 156 ++++---
>  drivers/gpu/drm/xe/xe_vm.h                    |   2 +-
>  drivers/gpu/drm/xe/xe_vm_types.h              |  22 +-
>  include/uapi/drm/xe_drm.h                     |   4 +-
>  64 files changed, 1108 insertions(+), 957 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile.c
>  create mode 100644 drivers/gpu/drm/xe/xe_tile.h
> 
> -- 
> 2.40.0
> 
