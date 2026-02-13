Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24249EDF170
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 14:44:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC96910E102;
	Fri, 13 Feb 2026 14:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="da2PV5Me";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1641210E102
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Feb 2026 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770993887; x=1802529887;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=IlvXt3Dz5BkNhhhQ1AwGIiNEmH0/e1XS72c5Avm8YyY=;
 b=da2PV5Mec6eYGzGPijA4L8mpTrg/vzlA4tMhXgJaGHRKmeMEAz/2m4Nl
 9/LIzpRL18PYdrW/O45UFN2W0w17Uc74UaQOnCgDmhAM0AuycpQI0vsQy
 yoFBf/QPjdfYR8iPkGqxuDyIiuhjfskKsbLcnxgEpfkLkYYUTNcbvIUPa
 UUl04EdFowFU6kYT/EtuJP6aqH7Gc4aF1s9O/BB97ZII04lRHthuRfJYU
 ukEuNZ4YzIyAHzb+xbeICsCTHxA0L+r6+3Rrd4irSd8Mmf3eadbARWomI
 rO85TPV1SA1+TJH+OfTLOcgs0FV3YC2NrSffoIqxXdp/0OeoeSgZUv0t3 g==;
X-CSE-ConnectionGUID: AAgjxXRwSL2vlysWYt6HGQ==
X-CSE-MsgGUID: hTfhKaxBRm+9Ah0BIOUSNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72083505"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72083505"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 06:44:47 -0800
X-CSE-ConnectionGUID: cip23lkATlm7ymYBPNlkDQ==
X-CSE-MsgGUID: MWk70MnJRY2Ole/b5CED3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212346046"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 06:44:46 -0800
Date: Fri, 13 Feb 2026 15:44:43 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe=2Fbo?= =?utf-8?Q?=3A?= Redirect faults to dummy
 page for wedged device (rev2)
Message-ID: <aY8420-5ptkTn9Ly@black.igk.intel.com>
References: <20260212055622.2054991-1-raag.jadav@intel.com>
 <177097538306.251530.10825145589741737132@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177097538306.251530.10825145589741737132@a3b018990fe9>
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

On Fri, Feb 13, 2026 at 09:36:23AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/bo: Redirect faults to dummy page for wedged device (rev2)
> URL   : https://patchwork.freedesktop.org/series/161507/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68_FULL -> xe-pw-161507v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161507v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161507v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-161507v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-fault:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-fault.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-multi-fault.html

This test is passing locally.

$ ./build/tests/xe_exec_system_allocator --r threads-shared-vm-many-large-malloc-multi-fault
IGT-Version: 2.3-ge0961900c (x86_64) (Linux: 6.19.0-rc2-xe x86_64)
Using IGT_SRANDOM=1770993370 for randomisation
Opened device: /dev/dri/card1
Starting subtest: threads-shared-vm-many-large-malloc-multi-fault
Subtest threads-shared-vm-many-large-malloc-multi-fault: SUCCESS (7.664s)

> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161507v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>     - shard-bmg:          [PASS][3] -> [ABORT][4] ([Intel XE#6652])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2314] / [Intel XE#2894])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#3432])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2325])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:
>     - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#3304]) +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-9/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2321])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1138])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7178])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4141]) +2 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +7 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +6 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-bmg:          [PASS][21] -> [DMESG-WARN][22] ([Intel XE#3428]) +1 other test dmesg-warn
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-10/igt@kms_hdr@static-toggle-suspend.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7130]) +8 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7111] / [Intel XE#7130]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7111] / [Intel XE#7130] / [Intel XE#7131])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7131])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7111] / [Intel XE#7131])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6886]) +4 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#870])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1406] / [Intel XE#2387])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@pr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_psr@pr-suspend.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2330])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#3414] / [Intel XE#3904])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_sharpness_filter@filter-scaler-downscale:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6503])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-downscale.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4837]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_eudebug_online@pagefault-read:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4837] / [Intel XE#6665])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_eudebug_online@pagefault-read.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2322]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7136]) +2 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html
> 
>   * igt@xe_exec_multi_queue@many-execs-close-fd-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6874]) +7 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_exec_multi_queue@many-execs-close-fd-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7138]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_multigpu_svm@mgpu-migration-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6964])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_multigpu_svm@mgpu-migration-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#7161])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#4733])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#944])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>     - shard-lnl:          [FAIL][47] ([Intel XE#5993]) -> [PASS][48] +3 other tests pass
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - shard-bmg:          [DMESG-WARN][49] ([Intel XE#5354]) -> [PASS][50]
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-bmg:          [FAIL][51] ([Intel XE#5299]) -> [PASS][52] +1 other test pass
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][53] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][54] +1 other test pass
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms:
>     - shard-bmg:          [INCOMPLETE][55] ([Intel XE#6891]) -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms@plane-134:
>     - shard-bmg:          [INCOMPLETE][57] -> [PASS][58]
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-3/igt@kms_pm_rpm@universal-planes-dpms@plane-134.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-4/igt@kms_pm_rpm@universal-planes-dpms@plane-134.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][59] ([Intel XE#6321]) -> [PASS][60]
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
>     - shard-lnl:          [SKIP][61] ([Intel XE#7131]) -> [SKIP][62] ([Intel XE#7131] / [Intel XE#7250]) +13 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-7/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
>     - shard-lnl:          [SKIP][63] ([Intel XE#7130] / [Intel XE#7131]) -> [SKIP][64] ([Intel XE#7130] / [Intel XE#7131] / [Intel XE#7250]) +13 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5:
>     - shard-lnl:          [SKIP][65] ([Intel XE#7130]) -> [SKIP][66] ([Intel XE#7130] / [Intel XE#7250]) +25 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-lnl-2/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-lnl-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][67] ([Intel XE#2426]) -> [SKIP][68] ([Intel XE#2509])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6891]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6891
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
>   [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
>   [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7161]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7161
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7250]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7250
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68 -> xe-pw-161507v2
> 
>   IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4545-b4bfe7d753afaf6ea4950111a309a4e2ef5aef68: b4bfe7d753afaf6ea4950111a309a4e2ef5aef68
>   xe-pw-161507v2: 161507v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161507v2/index.html
