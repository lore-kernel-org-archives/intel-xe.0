Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3153CF483D6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 17:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A3510E13E;
	Mon, 23 Mar 2026 17:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkOqF6y7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEA910E06F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 17:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774286367; x=1805822367;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=54dIJQtdiPIsD1eAHXXQfKyLUgApY2//jhAcrM6FP2I=;
 b=mkOqF6y7OFGpCgdqLUdMlUpBs9xm0JahAlSTOfoH2x34HC8F2s1cx9o+
 8iD5MK/AHXUOUk9QT5ao+34RA8GZ82/MBQVOmQGzMwHK/huGeNdEY3bC3
 NWgGk2Dfm+abVFbXm5u5HXJJHdVgV0uADwWPxQ2GwLHsxih2a+0V34jKr
 p7AqtXVw4NU78tljRvQeUgTs25b+SxAzgYvwOcfKbZayewHmo7OYD6dUr
 Le1W3sXvI1ShVERRksHX28Pbd0tCQ5+ObexQTlYeSNyOy8Ekq5h7Zr5J2
 Nzf8IjCgEGve2INHCWNKOZzRgF1gvIozDG6CfySZJMZKHWV2dwApzL/tR Q==;
X-CSE-ConnectionGUID: HbGsF6wMQo2q7FJE4lPmng==
X-CSE-MsgGUID: nYZhMIolTZKIMiCY4LIfbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75173570"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="75173570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 10:19:26 -0700
X-CSE-ConnectionGUID: vNi/PRpvT+63MptL5JvLeg==
X-CSE-MsgGUID: p5nbtFUIQVuilE3Yzn4QfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="221251424"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 10:19:25 -0700
Date: Mon, 23 Mar 2026 18:19:22 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?r?=
 =?utf-8?Q?e?= for Update 'none' recovery method for DRM wedged event (rev2)
Message-ID: <acF2Gop4ht9jS5bv@black.igk.intel.com>
References: <20260305130720.3685754-1-raag.jadav@intel.com>
 <177289748262.329959.860779911057392695@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177289748262.329959.860779911057392695@a3b018990fe9>
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

On Sat, Mar 07, 2026 at 03:31:22PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Update 'none' recovery method for DRM wedged event (rev2)
> URL   : https://patchwork.freedesktop.org/series/162488/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f_FULL -> xe-pw-162488v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-162488v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-162488v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-162488v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
>     - shard-bmg:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-9/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html

This series has no functional changes to cause any failures.

Raag

> #### Warnings ####
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-bmg:          [FAIL][3] ([Intel XE#7522] / [Intel XE#7555]) -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-5/igt@xe_oa@mmio-triggered-reports-read.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-8/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   * igt@xe_oa@mmio-triggered-reports-read@oam-2:
>     - shard-bmg:          [FAIL][5] ([Intel XE#7522]) -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-5/igt@xe_oa@mmio-triggered-reports-read@oam-2.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-8/igt@xe_oa@mmio-triggered-reports-read@oam-2.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-162488v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2327]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1124]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367] / [Intel XE#7354])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +5 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325] / [Intel XE#7358])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2372] / [Intel XE#7359])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [PASS][16] -> [INCOMPLETE][17] ([Intel XE#2049] / [Intel XE#2597]) +3 other tests incomplete
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7178] / [Intel XE#7351])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7179])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#4141]) +2 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2311]) +12 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2313]) +10 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7283]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2393])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1489]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@psr2-no-drrs:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_psr@psr2-no-drrs.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2330] / [Intel XE#5813])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_sharpness_filter@filter-scaler-downscale:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6503])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@kms_sharpness_filter@filter-scaler-downscale.html
> 
>   * igt@xe_eudebug@basic-vm-bind-extended-discovery:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4837]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
> 
>   * igt@xe_eudebug_online@pagefault-read-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#6665])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-lnl-4/igt@xe_eudebug_online@pagefault-read-stress.html
> 
>   * igt@xe_eudebug_online@single-step:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@xe_eudebug_online@single-step.html
> 
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@xe_eudebug_sriov@deny-sriov.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][36] -> [INCOMPLETE][37] ([Intel XE#6321]) +1 other test incomplete
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_balancer@many-virtual-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7482])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-lnl-4/igt@xe_exec_balancer@many-virtual-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7136])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7136]) +4 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6874]) +11 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#5625])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7138]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-userptr-rebind-err:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7138])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-userptr-rebind-err.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@vram:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1416])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-lnl-4/igt@xe_mmap@vram.html
> 
>   * igt@xe_multigpu_svm@mgpu-migration-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6964])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migration-basic.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2236])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-10/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2284] / [Intel XE#7370])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_query@multigpu-query-pxp-status:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#944]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-1/igt@xe_query@multigpu-query-pxp-status.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
>     - shard-bmg:          [FAIL][53] ([Intel XE#7545]) -> [PASS][54] +1 other test pass
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][55] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][56] +1 other test pass
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][57] ([Intel XE#2142]) -> [PASS][58] +1 other test pass
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][59] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][60] ([Intel XE#3544])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][61] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][62] ([Intel XE#1729] / [Intel XE#7424])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
>   [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
>   [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320
>   [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
>   [Intel XE#7464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7522
>   [Intel XE#7545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7545
>   [Intel XE#7555]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7555
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f -> xe-pw-162488v2
> 
>   IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f: a48305e6a2e6a1ed90df374101dd29542c105d8f
>   xe-pw-162488v2: 162488v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162488v2/index.html
