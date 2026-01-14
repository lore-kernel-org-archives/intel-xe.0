Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78FAD31A0C
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 05:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709C910E39B;
	Wed, 14 Jan 2026 05:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OKk/as1Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4050910E39B
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 05:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768366982; x=1799902982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TzDyC75Sro85eJOd902ZrNgM+JyElXoMmRJs2/2C/fo=;
 b=OKk/as1Ztn0OtqfJFTi9kWnQ6E7+jSOUuz3i/dRr9Wwr1VRiREM4O5uF
 h5MXOrJ16u3yhdfWg4pM8WyZb2RBnOVlsqIU7DGBp9ykjJIu+q1U4cW39
 A3sn4T+O6jGW+ggx3dXZtjjHEUza0nTAHEQgpjXdauKqErIC5ayohHTqZ
 gHGPsbTuwXzYlOtVUWcQJwH+iB3FovwHJg2yEnjryOEY1dP94Uaihi5OD
 p99yriTka0Qhyh/PT2YFCmNHdchHIS24GjFrtZHBy8IW3yUVP97wsOFDB
 vppieYVV4KeT5icTvxf71T4lGgOXFBsHQQvqYaovODm+0QokOanQInvu+ A==;
X-CSE-ConnectionGUID: fY55DYa7TGW3TqT+YzTpsw==
X-CSE-MsgGUID: J97LUBITQfyQ99sJRQgfOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="72245469"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="72245469"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 21:03:01 -0800
X-CSE-ConnectionGUID: 9M9dhBcLQqi+Z84Yzi6Qzg==
X-CSE-MsgGUID: 6cAxbQIKSciz4yVHvOAX2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="209622885"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 21:03:01 -0800
Date: Wed, 14 Jan 2026 06:02:57 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 00/79] Cleanup unused headers reported by clangd
Message-ID: <aWcjgZ3zA-xPlexC@black.igk.intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
 <aWbe/6D9Fvmg9rzi@lstrano-desk.jf.intel.com>
 <20260114003608.GF458797@mdroper-desk1.amr.corp.intel.com>
 <aWcRi7SOBeZYQB/r@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWcRi7SOBeZYQB/r@lstrano-desk.jf.intel.com>
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

On Tue, Jan 13, 2026 at 07:46:19PM -0800, Matthew Brost wrote:
> On Tue, Jan 13, 2026 at 04:36:08PM -0800, Matt Roper wrote:
> > On Tue, Jan 13, 2026 at 04:10:39PM -0800, Matthew Brost wrote:
> > > On Tue, Jan 13, 2026 at 03:03:05PM -0800, Matt Roper wrote:
> > > > clangd[1] helpfully flags #include's of headers that aren't being
> > > > directly used by the file including them.  In most cases we can either
> > > > drop those #include statements or replace them with a more targeted
> > > > include (such as xe_gt.h to xe_gt_types.h).  Let's drop/simplify a bunch
> > > > of the unnecessary includes in our driver's .c files; this may help
> > > > speed up partial rebuilds for developers since the build system won't
> > > > see as many false dependencies.
> > > > 
> > > 
> > > Yes, header situation isn't great.
> > > 
> > > > There's more header-related cleanup that could be done (e.g., some of
> > > > our headers incorrectly include other headers they don't need), but that
> > > > can wait for a follow-up series; this one is already long enough.
> > > > 
> > > > 
> > > > [1] https://clangd.llvm.org/
> > > > 
> > > 
> > > Once we get the headers into better shape can we get clangd in CI?
> > > Without that a year from we will need another huge series of fixes to
> > > undo all the mistakes we've made in the last year.
> > 
> > clangd is a language server intended to talk to plugins in editors
> > (e.g., I just set it up in neovim); I don't think clangd specifically
> > can be used in a CI-like setup.  However clang-tidy is a standalone lint
> > tool that I think could be configured to print out the same kinds of
> > warnings (the "misc-include-cleaner" check seems to be the one for this
> > case), although I haven't tried it myself.
> > 
> 
> Ok - for the series:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> I'd personaly prefer this squashed into one patch as 79 patches is a
> lot, maybe Rodrigo, Thomas, Dave, and Sima have a different preference?

Our CI doesn't test for other archs and we might risk breaking upstream
builds.

I tried to dive[1] into some core headers but the situation seems
impossible now. So fully agree, better to clean-up before the debt
piles up.

[1] https://lore.kernel.org/dri-devel/2342b516-2c6e-42e5-b4f4-579b280823ba@app.fastmail.com/

Raag

> > > > Matt Roper (79):
> > > >   drm/xe: Cleanup headers in xe_bb.c
> > > >   drm/xe: Drop unused header in xe_bo.c
> > > >   drm/xe: Cleanup headers in xe_devcoredump.c
> > > >   drm/xe: Drop unused header in xe_device.c
> > > >   drm/xe: Drop unused header in xe_exec.c
> > > >   drm/xe: Cleanup headers in xe_execlist.c
> > > >   drm/xe: Drop unused headers in xe_exec_queue.c
> > > >   drm/xe: Simplify headers in xe_ggtt.c
> > > >   drm/xe: Cleanup headers in xe_gsc_debugfs.c
> > > >   drm/xe: Simplify header in xe_gsc_proxy.c
> > > >   drm/xe: Drop unused headers in xe_gsc_submit.c
> > > >   drm/xe: Drop unused headers in xe_gt.c
> > > >   drm/xe: Cleanup headers in xe_gt_clock.c
> > > >   drm/xe: Drop unused header in xe_gt_debugfs.c
> > > >   drm/xe: Drop unused header in xe_gt_idle.c
> > > >   drm/xe: Drop unused header in xe_gt_mcr.c
> > > >   drm/xe: Drop unused headers in xe_gt_sriov_pf_config.c
> > > >   drm/xe: Drop unused header in xe_gt_sriov_pf_debugfs.c
> > > >   drm/xe: Simplify header in xe_gt_sriov_pf_migration.c
> > > >   drm/xe: Drop unused header in xe_gt_sriov_pf_policy.c
> > > >   drm/xe: Cleanup headers in xe_gt_sriov_pf_service.c
> > > >   drm/xe: Drop unused header in xe_gt_sriov_vf.c
> > > >   drm/xe: Simplify header in xe_gt_stats.c
> > > >   drm/xe: Simplify header in xe_gt_sysfs.c
> > > >   drm/xe: Simplify header in xe_gt_throttle.c
> > > >   drm/xe: Drop unused headers in xe_guc_ads.c
> > > >   drm/xe: Drop unused header in xe_guc_buf.c
> > > >   drm/xe: Cleanup headers in xe_guc_capture.c
> > > >   drm/xe: Cleanup headers in xe_guc_debugfs.c
> > > >   drm/xe: Simplify headers in xe_guc_hwconfig.c
> > > >   drm/xe: Simplify header in xe_guc_log.c
> > > >   drm/xe: Cleanup headers in xe_guc_relay.c
> > > >   drm/xe: Drop unused headers in xe_guc_submit.c
> > > >   drm/xe: Drop unused header in xe_heci_gsc.c
> > > >   drm/xe: Drop unused header in xe_huc.c
> > > >   drm/xe: Clean up headers in xe_huc_debugfs.c
> > > >   drm/xe: Drop unused header in xe_hw_engine.c
> > > >   drm/xe: Simplify include in xe_hw_engine_class_sysfs.c
> > > >   drm/xe: Simplify include in xe_hw_engine_group.c
> > > >   drm/xe: Cleanup headers in xe_hw_fence.c
> > > >   drm/xe: Cleanup headers in xe_i2c.c
> > > >   drm/xe: Drop unused header in xe_irq.c
> > > >   drm/xe: Drop unused headers in xe_memirq.c
> > > >   drm/xe: Drop unused headers in xe_mmio.c
> > > >   drm/xe: Drop unused headers in xe_mocs.c
> > > >   drm/xe: Simplify include in xe_module.c
> > > >   drm/xe: Drop unused header in xe_nvm.c
> > > >   drm/xe: Drop unused headers in xe_page_reclaim.c
> > > >   drm/xe: Drop unused header in xe_pci.c
> > > >   drm/xe: Simplify include in xe_psmi.c
> > > >   drm/xe: Drop unused header in xe_pxp.c
> > > >   drm/xe: Simplify header in xe_pxp_debugfs.c
> > > >   drm/xe: Cleanup headers in xe_reg_sr.c
> > > >   drm/xe: Drop unused headers in xe_reg_whitelist.c
> > > >   drm/xe: Cleanup headers in xe_ring_ops.c
> > > >   drm/xe: Drop unused header in xe_rtp.c
> > > >   drm/xe: Simplify header in xe_sa.c
> > > >   drm/xe: Simplify header in xe_sched_job.c
> > > >   drm/xe: Drop unused header in xe_sriov_packet.c
> > > >   drm/xe: Drop unused header in xe_sriov_pf_debugfs.c
> > > >   drm/xe: Drop unused header in xe_sriov_vf.c
> > > >   drm/xe: Cleanup headers in xe_step.c
> > > >   drm/xe: Drop unused header in xe_survivability_mode.c
> > > >   drm/xe: Cleanup headers in xe_tile.c
> > > >   drm/xe: Cleanup headers in xe_tlb_inval.c
> > > >   drm/xe: Drop unused header in xe_ttm_stolen_mgr.c
> > > >   drm/xe: Drop unused header in xe_ttm_sys_mgr.c
> > > >   drm/xe: Drop unused header in xe_ttm_vram_mgr.c
> > > >   drm/xe: Drop unused headers in xe_uc.c
> > > >   drm/xe: Cleanup headers in xe_uc_debugfs.c
> > > >   drm/xe: Simplify header in xe_uc_fw.c
> > > >   drm/xe: Drop unused header in xe_validation.c
> > > >   drm/xe: Drop unused header in xe_vm.c
> > > >   drm/xe: Drop unused headers in xe_vram.c
> > > >   drm/xe: Drop unused header in xe_vram_freq.c
> > > >   drm/xe: Drop unused header in xe_vsec.c
> > > >   drm/xe: Simplify header in xe_wa.c
> > > >   drm/xe: Drop unused header in xe_wait_user_fence.c
> > > >   drm/xe: Simplify header in xe_wopcm.c
> > > > 
> > > >  drivers/gpu/drm/xe/tests/xe_bo.c              | 1 +
> > > >  drivers/gpu/drm/xe/xe_bb.c                    | 3 +--
> > > >  drivers/gpu/drm/xe/xe_bo.c                    | 1 -
> > > >  drivers/gpu/drm/xe/xe_devcoredump.c           | 3 +--
> > > >  drivers/gpu/drm/xe/xe_device.c                | 1 -
> > > >  drivers/gpu/drm/xe/xe_exec.c                  | 1 -
> > > >  drivers/gpu/drm/xe/xe_exec_queue.c            | 2 --
> > > >  drivers/gpu/drm/xe/xe_execlist.c              | 3 +--
> > > >  drivers/gpu/drm/xe/xe_ggtt.c                  | 3 +--
> > > >  drivers/gpu/drm/xe/xe_gsc_debugfs.c           | 5 ++---
> > > >  drivers/gpu/drm/xe/xe_gsc_proxy.c             | 2 +-
> > > >  drivers/gpu/drm/xe/xe_gsc_submit.c            | 2 --
> > > >  drivers/gpu/drm/xe/xe_gt.c                    | 2 --
> > > >  drivers/gpu/drm/xe/xe_gt_clock.c              | 6 +-----
> > > >  drivers/gpu/drm/xe/xe_gt_debugfs.c            | 1 -
> > > >  drivers/gpu/drm/xe/xe_gt_idle.c               | 1 -
> > > >  drivers/gpu/drm/xe/xe_gt_mcr.c                | 1 -
> > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 2 --
> > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 1 -
> > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 +-
> > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 1 -
> > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 5 ++---
> > > >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 1 -
> > > >  drivers/gpu/drm/xe/xe_gt_stats.c              | 2 +-
> > > >  drivers/gpu/drm/xe/xe_gt_sysfs.c              | 2 +-
> > > >  drivers/gpu/drm/xe/xe_gt_throttle.c           | 2 +-
> > > >  drivers/gpu/drm/xe/xe_guc_ads.c               | 2 --
> > > >  drivers/gpu/drm/xe/xe_guc_buf.c               | 1 -
> > > >  drivers/gpu/drm/xe/xe_guc_capture.c           | 5 +----
> > > >  drivers/gpu/drm/xe/xe_guc_debugfs.c           | 5 ++---
> > > >  drivers/gpu/drm/xe/xe_guc_hwconfig.c          | 4 ++--
> > > >  drivers/gpu/drm/xe/xe_guc_log.c               | 2 +-
> > > >  drivers/gpu/drm/xe/xe_guc_relay.c             | 3 +--
> > > >  drivers/gpu/drm/xe/xe_guc_submit.c            | 2 --
> > > >  drivers/gpu/drm/xe/xe_heci_gsc.c              | 1 -
> > > >  drivers/gpu/drm/xe/xe_huc.c                   | 1 -
> > > >  drivers/gpu/drm/xe/xe_huc_debugfs.c           | 5 ++---
> > > >  drivers/gpu/drm/xe/xe_hw_engine.c             | 1 -
> > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 2 +-
> > > >  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 2 +-
> > > >  drivers/gpu/drm/xe/xe_hw_fence.c              | 4 +---
> > > >  drivers/gpu/drm/xe/xe_i2c.c                   | 4 ++--
> > > >  drivers/gpu/drm/xe/xe_irq.c                   | 1 -
> > > >  drivers/gpu/drm/xe/xe_memirq.c                | 2 --
> > > >  drivers/gpu/drm/xe/xe_mmio.c                  | 4 ----
> > > >  drivers/gpu/drm/xe/xe_mocs.c                  | 2 --
> > > >  drivers/gpu/drm/xe/xe_module.c                | 2 +-
> > > >  drivers/gpu/drm/xe/xe_nvm.c                   | 1 -
> > > >  drivers/gpu/drm/xe/xe_page_reclaim.c          | 4 ----
> > > >  drivers/gpu/drm/xe/xe_pci.c                   | 1 -
> > > >  drivers/gpu/drm/xe/xe_psmi.c                  | 2 +-
> > > >  drivers/gpu/drm/xe/xe_pxp.c                   | 1 -
> > > >  drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 2 +-
> > > >  drivers/gpu/drm/xe/xe_reg_sr.c                | 5 +----
> > > >  drivers/gpu/drm/xe/xe_reg_whitelist.c         | 1 -
> > > >  drivers/gpu/drm/xe/xe_ring_ops.c              | 4 +---
> > > >  drivers/gpu/drm/xe/xe_rtp.c                   | 1 -
> > > >  drivers/gpu/drm/xe/xe_sa.c                    | 2 +-
> > > >  drivers/gpu/drm/xe/xe_sched_job.c             | 2 +-
> > > >  drivers/gpu/drm/xe/xe_sriov_packet.c          | 1 -
> > > >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 1 -
> > > >  drivers/gpu/drm/xe/xe_sriov_vf.c              | 1 -
> > > >  drivers/gpu/drm/xe/xe_step.c                  | 3 ++-
> > > >  drivers/gpu/drm/xe/xe_survivability_mode.c    | 1 -
> > > >  drivers/gpu/drm/xe/xe_tile.c                  | 3 +--
> > > >  drivers/gpu/drm/xe/xe_tlb_inval.c             | 7 ++-----
> > > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 1 -
> > > >  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           | 1 -
> > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 1 -
> > > >  drivers/gpu/drm/xe/xe_uc.c                    | 2 --
> > > >  drivers/gpu/drm/xe/xe_uc_debugfs.c            | 2 +-
> > > >  drivers/gpu/drm/xe/xe_uc_fw.c                 | 2 +-
> > > >  drivers/gpu/drm/xe/xe_validation.c            | 1 -
> > > >  drivers/gpu/drm/xe/xe_vm.c                    | 1 -
> > > >  drivers/gpu/drm/xe/xe_vram.c                  | 2 --
> > > >  drivers/gpu/drm/xe/xe_vram_freq.c             | 1 -
> > > >  drivers/gpu/drm/xe/xe_vsec.c                  | 1 -
> > > >  drivers/gpu/drm/xe/xe_wa.c                    | 2 +-
> > > >  drivers/gpu/drm/xe/xe_wait_user_fence.c       | 1 -
> > > >  drivers/gpu/drm/xe/xe_wopcm.c                 | 2 +-
> > > >  80 files changed, 45 insertions(+), 129 deletions(-)
> > > > 
> > > > -- 
> > > > 2.52.0
> > > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
