Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4053EEB56D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jan 2026 07:41:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F99A10E515;
	Thu,  1 Jan 2026 07:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a4Xb/iFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B4F10E515
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jan 2026 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767253264; x=1798789264;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=oS+tggkWBDiVgG5tHtwyNpVBWj6Eq98gBPUQ435CyF4=;
 b=a4Xb/iFM2hrcVN1kR6daj2MEvuqe3+/aNQ84DFO8BRKDebhW6ct9eBo6
 RSH0n3t9Dyx5+MnjEHnFjcuQ16TbeTnR7WXw+9lnvySfF+zFbmWYvwTpW
 +ePX9E1H9uDgOtIKgGEZ7lgnPVNUzQVwlOKPWenUvYar+2mX/m43zgrZi
 9UK7Qnde+aDDiCQJd42NudjpJFT18v4hybxTow7laqJdOsnU1CIo0r33q
 bfiRrmQvb5i4lAPsZJlBPmLAwUKY36Ax1vx3yRCBvXQjfNznQ0HoZUsoS
 2k1DqMJQjwomoaWJD9sDPqYN93gO0lfit9I+SicaU84jQvupkemZQH2fM A==;
X-CSE-ConnectionGUID: nwYp0UVQRAi5oqkIcJMe+A==
X-CSE-MsgGUID: 1sQDatM/RzKvJdRgnOnmdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67805115"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="67805115"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 23:41:04 -0800
X-CSE-ConnectionGUID: VYodCwfJTpKy1C2X1WK4oA==
X-CSE-MsgGUID: YPGSqctVTNydkDleoatL5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="202541415"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 23:41:03 -0800
Date: Thu, 1 Jan 2026 08:41:00 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/i2c: Force polling mode in survivability
Message-ID: <aVYlDHsJpQsXxyUw@black.igk.intel.com>
References: <20251211182353.1149481-1-raag.jadav@intel.com>
 <176554151978.80125.7846276198043667275@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176554151978.80125.7846276198043667275@a3b018990fe9>
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

On Fri, Dec 12, 2025 at 12:11:59PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/i2c: Force polling mode in survivability
> URL   : https://patchwork.freedesktop.org/series/158824/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4226-d8f645c04dad21f981669f0b65191cac664735f9_FULL -> xe-pw-158824v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-158824v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-158824v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-158824v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-root:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@core_setmaster@master-drop-set-root.html
> 
>   * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

The failures seem like from GuC and display component, and are unrelated
to the patch.

Raag

>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-158824v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
>     - shard-bmg:          [PASS][4] -> [DMESG-FAIL][5] ([Intel XE#5545]) +1 other test dmesg-fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2328])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2252]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2320]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#6747]) +2 other tests fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>     - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#301]) +1 other test fail
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
>     - shard-bmg:          [PASS][15] -> [INCOMPLETE][16] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2293] / [Intel XE#2380])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2293])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4141]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2311]) +8 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2313]) +2 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-bmg:          [PASS][22] -> [ABORT][23] ([Intel XE#6740]) +1 other test abort
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-5/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2927] / [Intel XE#6590])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_lease@implicit-plane-lease:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6703]) +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_lease@implicit-plane-lease.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][26] ([Intel XE#5545]) +1 other test incomplete
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-bmg:          [PASS][27] -> [FAIL][28] ([Intel XE#5099])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-8/igt@kms_pm_rpm@i2c.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_psr@fbc-psr2-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_psr@fbc-psr2-primary-page-flip.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1406] / [Intel XE#2414])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_sharpness_filter@filter-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6503])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@kms_sharpness_filter@filter-dpms.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
>     - shard-bmg:          [PASS][32] -> [ABORT][33] ([Intel XE#3970]) +1 other test abort
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-2/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4837]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence.html
> 
>   * igt@xe_eudebug_online@single-step:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4837] / [Intel XE#6665])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@xe_eudebug_online@single-step.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2322])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-basic.html
> 
>   * igt@xe_exec_system_allocator@many-stride-malloc-madvise:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][37] ([Intel XE#6480])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-malloc-madvise.html
> 
>   * igt@xe_exec_system_allocator@once-large-malloc-race-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@xe_exec_system_allocator@once-large-malloc-race-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4943]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
>     - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#6703]) +40 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2459] / [Intel XE#2596])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2284])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-50:
>     - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#6251]) +1 other test fail
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50.html
> 
>   * igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:
>     - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#6557] / [Intel XE#6703])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>     - shard-bmg:          [SKIP][48] ([Intel XE#367]) -> [PASS][49]
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2:
>     - shard-bmg:          [FAIL][50] -> [PASS][51] +1 other test pass
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][52] ([Intel XE#5299]) -> [PASS][53]
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-bmg:          [FAIL][54] ([Intel XE#6816]) -> [PASS][55]
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][56] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][57] +1 other test pass
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][58] ([Intel XE#6321]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
>     - shard-bmg:          [WARN][60] ([Intel XE#5786]) -> [PASS][61]
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
>     - shard-lnl:          [FAIL][62] ([Intel XE#6251]) -> [PASS][63] +2 other tests pass
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-bmg:          [SKIP][64] ([Intel XE#1124]) -> [SKIP][65] ([Intel XE#6703])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          [SKIP][66] ([Intel XE#2887]) -> [SKIP][67] ([Intel XE#6703])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>     - shard-bmg:          [SKIP][68] ([Intel XE#2252]) -> [SKIP][69] ([Intel XE#6703])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-bmg:          [SKIP][70] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][71] ([Intel XE#6703])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
>     - shard-bmg:          [SKIP][72] ([Intel XE#2311]) -> [SKIP][73] ([Intel XE#6703]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][74] ([Intel XE#4141]) -> [SKIP][75] ([Intel XE#6703])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][76] ([Intel XE#2313]) -> [SKIP][77] ([Intel XE#6703]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-bmg:          [ABORT][78] ([Intel XE#6740]) -> [SKIP][79] ([Intel XE#6703])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_hdr@bpc-switch-dpms.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [ABORT][80] ([Intel XE#6740]) -> [SKIP][81] ([Intel XE#1503])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-bmg:          [SKIP][82] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][83] ([Intel XE#1406] / [Intel XE#6703])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr@psr2-sprite-plane-move:
>     - shard-bmg:          [SKIP][84] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][85] ([Intel XE#1406] / [Intel XE#6703])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@kms_psr@psr2-sprite-plane-move.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_psr@psr2-sprite-plane-move.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][86] ([Intel XE#2426]) -> [SKIP][87] ([Intel XE#2509])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_eudebug_online@pagefault-write:
>     - shard-bmg:          [SKIP][88] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][89] ([Intel XE#6557] / [Intel XE#6703])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@xe_eudebug_online@pagefault-write.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-write.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          [SKIP][90] ([Intel XE#2322]) -> [SKIP][91] ([Intel XE#6703]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:
>     - shard-bmg:          [SKIP][92] ([Intel XE#4943]) -> [SKIP][93] ([Intel XE#6703]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-bmg:          [SKIP][94] ([Intel XE#2284]) -> [SKIP][95] ([Intel XE#6703])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>     - shard-bmg:          [SKIP][96] ([Intel XE#4733]) -> [SKIP][97] ([Intel XE#6703])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4226-d8f645c04dad21f981669f0b65191cac664735f9/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5099
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
>   [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
>   [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
>   [Intel XE#6747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6747
>   [Intel XE#6816]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6816
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4226-d8f645c04dad21f981669f0b65191cac664735f9 -> xe-pw-158824v1
> 
>   IGT_8664: 28cc709ad89c0ef569569f19f4772d4cca354963 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4226-d8f645c04dad21f981669f0b65191cac664735f9: d8f645c04dad21f981669f0b65191cac664735f9
>   xe-pw-158824v1: 158824v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158824v1/index.html
