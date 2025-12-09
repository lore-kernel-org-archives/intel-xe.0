Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91B1D3B9A8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 22:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C78B10E214;
	Tue,  9 Dec 2025 22:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBsPd8pe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19B210E214
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 22:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765318128; x=1796854128;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=oZMiKIUAyEgNFemOQgcTv8CtQv/oDyhVeVDyZ2kfDM0=;
 b=eBsPd8peYDEWO63+D9PfrJTH57hEHa2gF2exCuiqEXq2eKU4Qt7fkGqB
 I716gb7fS0ZONPJLtNhxNzFNk0LTTXsd8KR7Sy5876Mew9mW1+nu/gEOz
 aLhj29MghDVoBXnQ3Jx7/VXRGyl6K6VoATTPUG09HicGQiiI6IWmWTBHh
 dET8SYp8dyQMW1B7zuDko/a3fN6AojiFnYqwap1lLXf0v8/ihrlJnLc6T
 uiYPQrhv9IBaajpfxo8/Bg9JLvDQg6llGDKQHE1jAxOgYLa2RBjmToSkR
 bomaWSIHeyb0t4mdp+cmynw3lC1Pu9b3S4deJ1tPh9nHP+c7FB9leq4V3 g==;
X-CSE-ConnectionGUID: pAx9bXFER8KdZBJxVMMruw==
X-CSE-MsgGUID: o1WQLTQNQRm+FslRAEcf7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67336767"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67336767"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:07:37 -0800
X-CSE-ConnectionGUID: OLzoglFvTjSvQQV1JApliw==
X-CSE-MsgGUID: RmuznM6OSr6COkDiqTsiiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="233744250"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 14:07:36 -0800
Date: Tue, 9 Dec 2025 23:07:33 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm=2Fb?=
 =?UTF-8?Q?uddy=3A_release_free=5Ftrees_array_on_buddy_mm_te?=
 =?UTF-8?Q?ardown_=28rev3=29?=
In-Reply-To: <176522456170.67190.10682865669736637769@a3b018990fe9>
Message-ID: <8363c9bb-8956-5e0b-d982-6f78debbb198@intel.com>
References: <20251208102714.4008260-1-michal.grzelak@intel.com>
 <176522456170.67190.10682865669736637769@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Mon, 8 Dec 2025, Patchwork wrote:
> Patch Details
> Series:
> drm/buddy: release free_trees array on buddy mm teardown (rev3)
> URL:
> https://patchwork.freedesktop.org/series/157829/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157829v3/index.html
>                          CI Bug Log - changes from xe-4204-e04a4be1a156054fa00b25ef28848cf0df91453e_FULL -> xe-pw-157829v3_FULL
> 
> SUMMARY
> 
> FAILURE
> 
> Serious unknown changes coming with xe-pw-157829v3_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-157829v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> PARTICIPATING HOSTS (4 -> 4)
> 
> No changes in participating hosts
> 
> POSSIBLE NEW ISSUES
> 
> Here are the unknown changes that may have been introduced in xe-pw-157829v3_FULL:
>
>   IGT changes
>
>     Possible regressions
>
>  * 
>
>     igt@kms_async_flips@test-time-stamp@pipe-a-dp-2:
>
>      +  shard-bmg: PASS -> FAIL +3 other tests fail

"(kms_async_flips:2459) CRITICAL: Failed assertion: seq1 == seq + 1
(kms_async_flips:2459) CRITICAL: Vblank sequence is expected to be
incremented by one(1760 != (1758 + 1)"

This change doesn't touch vblank, hence unrelated.

>  * 
>
>     igt@kms_pm_rpm@basic-pci-d3-state:
>
>      +  shard-bmg: PASS -> SKIP

"Test requirement: drm_fd != -1
Last errno: 125, Operation canceled"

Same as below, unrelated issue.
>
>     Warnings
>
>  *  igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>      +  shard-bmg: SKIP (Intel XE#1439 / Intel XE#3141 / Intel XE#836) -> SKIP

"Test requirement: drm_fd != -1
Last errno: 125, Operation canceled"

Same skip has been observed with xe-4200 on shard-bmg, thus unrelated
issue.
> 
> KNOWN ISSUES
> 
> Here are the changes found in xe-pw-157829v3_FULL that come from known issues:
>
>   IGT changes
>
>     Issues hit
>
>  * 
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#623)
>  * 
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>      +  shard-bmg: NOTRUN -> FAIL (Intel XE#3718 / Intel XE#6078)
>  * 
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic:
>
>      +  shard-bmg: PASS -> FAIL (Intel XE#3718 / Intel XE#6078)
>  * 
>
>     igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
>
>      +  shard-bmg: PASS -> FAIL (Intel XE#6078)
>  * 
>
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
>
>      +  shard-bmg: NOTRUN -> FAIL (Intel XE#6078)
>  * 
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2327) +5 other tests skip
>  * 
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1124) +2 other tests skip
>  * 
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1124)
>  * 
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +4 other tests skip
>  * 
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>
>      +  shard-bmg: PASS -> SKIP (Intel XE#367)
>  * 
>
>     igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#367) +1 other test skip
>  * 
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#787) +20 other tests skip
>  * 
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#2887)
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#3432) +1 other test skip
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +5 other tests skip
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>
>      +  shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#2705 / Intel XE#3113 / Intel XE#4212) +1 other test incomplete
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +13 other tests skip
>      +  shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#2705 / Intel XE#3113 / Intel XE#4212 / Intel XE#4345) +1 other test incomplete
>  * 
>
>     igt@kms_chamelium_color@ctm-0-75:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#306)
>  * 
>
>     igt@kms_chamelium_color@degamma:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2325) +1 other test skip
>  * 
>
>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#373) +1 other test skip
>  * 
>
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +2 other tests skip
>  * 
>
>     igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6704) +4 other tests skip
>  * 
>
>     igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#6704)
>  * 
>
>     igt@kms_colorop@plane-xr30-xr30-pq_125_inv_eotf:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6704) +3 other tests skip
>  * 
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#307)
>  * 
>
>     igt@kms_content_protection@srm@pipe-a-dp-4:
>
>      +  shard-dg2-set2: NOTRUN -> FAIL (Intel XE#1178) +1 other test fail
>  * 
>
>     igt@kms_content_protection@suspend-resume:
>
>      +  shard-bmg: NOTRUN -> FAIL (Intel XE#1178) +2 other tests fail
>  * 
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2320) +2 other tests skip
>  * 
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>
>      +  shard-bmg: PASS -> FAIL (Intel XE#5299)
>  * 
>
>     igt@kms_cursor_legacy@forked-move:
>
>      +  shard-bmg: PASS -> DMESG-FAIL (Intel XE#5545) +1 other test dmesg-fail
>  * 
>
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4331)
>  * 
>
>     igt@kms_dsc@dsc-with-formats:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#2244)
>  * 
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#455) +7 other tests skip
>  * 
>
>     igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:
>
>      +  shard-bmg: PASS -> ABORT (Intel XE#5545) +1 other test abort
>  * 
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>      +  shard-bmg: PASS -> FAIL (Intel XE#3098) +1 other test fail
>  * 
>
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>
>      +  shard-lnl: PASS -> FAIL (Intel XE#301 / Intel XE#3149) +2 other tests fail
>  * 
>
>     igt@kms_flip@flip-vs-suspend:
>
>      +  shard-bmg: PASS -> INCOMPLETE (Intel XE#2049 / Intel XE#2597) +1 other test incomplete
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380) +6 other tests skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +6 other tests skip
>  * 
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
>
>      +  shard-adlp: PASS -> FAIL (Intel XE#1874) +1 other test fail
>  * 
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +15 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +5 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#651) +8 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#653) +10 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +21 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6312)
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#656) +6 other tests skip
>  * 
>
>     igt@kms_hdr@bpc-switch:
>
>      +  shard-bmg: PASS -> ABORT (Intel XE#6740) +1 other test abort
>  * 
>
>     igt@kms_hdr@bpc-switch-dpms:
>
>      +  shard-bmg: NOTRUN -> ABORT (Intel XE#6740) +1 other test abort
>  * 
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2501)
>  * 
>
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#5624)
>  * 
>
>     igt@kms_plane_multiple@tiling-y:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#5020)
>  * 
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#5825) +4 other tests skip
>  * 
>
>     igt@kms_pm_backlight@basic-brightness:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#870)
>  * 
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2938)
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#2938)
>  * 
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#870)
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893 / Intel XE#4608)
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4608) +1 other test skip
>  * 
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +6 other tests skip
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +2 other tests skip
>  * 
>
>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893)
>  * 
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2387)
>  * 
>
>     igt@kms_psr@fbc-pr-cursor-plane-move:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2850 / Intel XE#929) +3 other tests skip
>  * 
>
>     igt@kms_psr@fbc-pr-sprite-plane-onoff:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel XE#2850) +5 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr2-sprite-render:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406)
>  * 
>
>     igt@kms_psr@fbc-psr2-sprite-render@edp-1:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4609)
>  * 
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2330) +1 other test skip
>  * 
>
>     igt@kms_scaling_modes@scaling-mode-full:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2413)
>  * 
>
>     igt@kms_setmode@basic:
>
>      +  shard-adlp: PASS -> FAIL (Intel XE#6361) +2 other tests fail
>  * 
>
>     igt@kms_setmode@basic@pipe-a-hdmi-a-6:
>
>      +  shard-dg2-set2: NOTRUN -> FAIL (Intel XE#6361) +3 other tests fail
>  * 
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>      +  shard-lnl: PASS -> FAIL (Intel XE#2142) +1 other test fail
>  * 
>
>     igt@xe_compute_preempt@compute-threadgroup-preempt:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6360)
>  * 
>
>     igt@xe_create@create-big-vram:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1062)
>  * 
>
>     igt@xe_eudebug@basic-vm-access:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +5 other tests skip
>  * 
>
>     igt@xe_eudebug@basic-vm-bind-discovery:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837)
>  * 
>
>     igt@xe_eudebug_online@interrupt-other-debuggable:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665)
>  * 
>
>     igt@xe_eudebug_online@preempt-breakpoint:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +3 other tests skip
>  * 
>
>     igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#6665) +2 other tests skip
>  * 
>
>     igt@xe_evict@evict-beng-large-external:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#688)
>  * 
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>      +  shard-bmg: PASS -> INCOMPLETE (Intel XE#6321)
>  * 
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +3 other tests skip
>  * 
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1392) +1 other test skip
>  * 
>
>     igt@xe_exec_fault_mode@once-rebind-imm:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#288) +9 other tests skip
>  * 
>
>     igt@xe_exec_system_allocator@many-64k-free-madvise:
>
>      +  shard-bmg: PASS -> SKIP (Intel XE#6557 / Intel XE#6703) +4 other tests skip
>  * 
>
>     igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge-nomemset:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#4943) +3 other tests skip
>  * 
>
>     igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +16 other tests skip
>  * 
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4915) +108 other tests skip
>  * 
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-new-nomemset:
>
>      +  shard-bmg: PASS -> SKIP (Intel XE#6703) +75 other tests skip
>  * 
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>      +  shard-bmg: NOTRUN -> FAIL (Intel XE#6558) +1 other test fail
>  * 
>
>     igt@xe_media_fill@media-fill:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2459 / Intel XE#2596)
>  * 
>
>     igt@xe_oa@blocking:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#3573) +2 other tests skip
>  * 
>
>     igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6566)
>  * 
>
>     igt@xe_pm@s3-d3cold-basic-exec:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2284) +2 other tests skip
>  * 
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#579)
>  * 
>
>     igt@xe_pmu@all-fn-engine-activity-load:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#4650)
>  * 
>
>     igt@xe_pxp@display-pxp-fb:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4733) +3 other tests skip
>  * 
>
>     igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4733)
>  * 
>
>     igt@xe_query@multigpu-query-engines:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#944)
>  * 
>
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#944)
>  * 
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#4130)
>  * 
>
>     igt@xe_sriov_vram@vf-access-beyond:
>
>      +  shard-dg2-set2: NOTRUN -> SKIP (Intel XE#6318)
>  * 
>
>     igt@xe_vm@out-of-memory:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#5745)
>
>     Possible fixes
>
>  * 
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>      +  shard-bmg: INCOMPLETE -> PASS +1 other test pass
>  * 
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
>
>      +  shard-adlp: FAIL (Intel XE#3908) -> PASS +1 other test pass
>  * 
>
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>
>      +  shard-bmg: SKIP (Intel XE#367) -> PASS
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>      +  shard-dg2-set2: INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel XE#4345 / Intel XE#6168) -> PASS
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
>
>      +  shard-dg2-set2: INCOMPLETE (Intel XE#6168) -> PASS
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
>
>      +  shard-dg2-set2: DMESG-WARN (Intel XE#1727 / Intel XE#3113) -> PASS
>  * 
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>      +  shard-bmg: FAIL (Intel XE#6715) -> PASS
>  * 
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>      +  shard-bmg: FAIL (Intel XE#5299) -> PASS
>  * 
>
>     igt@kms_hdr@bpc-switch-suspend:
>
>      +  shard-bmg: ABORT (Intel XE#6740) -> PASS +1 other test pass
>  * 
>
>     igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-3:
>
>      +  shard-bmg: ABORT (Intel XE#3970) -> PASS +1 other test pass
>  * 
>
>     igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-3:
>
>      +  shard-bmg: DMESG-WARN (Intel XE#3970) -> PASS +1 other test pass
>  * 
>
>     igt@xe_exec_reset@cm-gt-reset:
>
>      +  shard-bmg: ABORT -> PASS
>  * 
>
>     igt@xe_pmu@engine-activity-accuracy-90:
>
>      +  shard-lnl: FAIL (Intel XE#6251) -> PASS +3 other tests pass
>  * 
>
>     igt@xe_pmu@engine-activity-single-load:
>
>      +  shard-dg2-set2: FAIL -> PASS +1 other test pass
>  * 
>
>     igt@xe_pmu@engine-activity-suspend:
>
>      +  shard-adlp: DMESG-WARN (Intel XE#2953 / Intel XE#4173) -> PASS +1 other test pass
>
>     Warnings
>
>  * 
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>
>      +  shard-bmg: SKIP (Intel XE#2327) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>
>      +  shard-bmg: SKIP (Intel XE#1124) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>
>      +  shard-bmg: SKIP (Intel XE#2314 / Intel XE#2894) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
>
>      +  shard-bmg: SKIP (Intel XE#2887) -> SKIP (Intel XE#6703) +1 other test skip
>  * 
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>
>      +  shard-bmg: SKIP (Intel XE#3432) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
>
>      +  shard-bmg: SKIP (Intel XE#2887) -> SKIP (Intel XE#6557 / Intel XE#6703)
>  * 
>
>     igt@kms_cdclk@mode-transition:
>
>      +  shard-bmg: SKIP (Intel XE#2724) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
>
>      +  shard-bmg: SKIP (Intel XE#2252) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_colorop@plane-xr30-xr30-pq_inv_eotf:
>
>      +  shard-bmg: SKIP (Intel XE#6704) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_content_protection@legacy:
>
>      +  shard-bmg: FAIL (Intel XE#1178) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_cursor_crc@cursor-onscreen-max-size:
>
>      +  shard-bmg: SKIP (Intel XE#2320) -> SKIP (Intel XE#6557 / Intel XE#6703)
>  * 
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>      +  shard-bmg: SKIP (Intel XE#2321) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>      +  shard-lnl: FAIL (Intel XE#301) -> FAIL (Intel XE#301 / Intel XE#3149)
>  * 
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>      +  shard-bmg: SKIP (Intel XE#2293 / Intel XE#2380) -> SKIP (Intel XE#6703) +1 other test skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-render:
>
>      +  shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#6703) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
>
>      +  shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#6703) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>
>      +  shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#6703) +5 other tests skip
>  * 
>
>     igt@kms_hdr@brightness-with-hdr:
>
>      +  shard-bmg: SKIP (Intel XE#3544) -> SKIP (Intel XE#3374 / Intel XE#3544)
>  * 
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
>
>      +  shard-bmg: SKIP (Intel XE#5825) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_psr@psr2-suspend:
>
>      +  shard-bmg: SKIP (Intel XE#1406 / Intel XE#2234 / Intel XE#2850) -> SKIP (Intel XE#1406 / Intel XE#6703) +2 other tests skip
>  * 
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>      +  shard-bmg: SKIP (Intel XE#3414 / Intel XE#3904) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_sharpness_filter@invalid-filter-with-scaler:
>
>      +  shard-bmg: SKIP (Intel XE#6503) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>      +  shard-dg2-set2: SKIP (Intel XE#362) -> SKIP (Intel XE#1500)
>  * 
>
>     igt@xe_eudebug@basic-vm-bind:
>
>      +  shard-bmg: SKIP (Intel XE#4837) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@xe_eudebug_online@pagefault-read-stress:
>
>      +  shard-bmg: SKIP (Intel XE#6665 / Intel XE#6681) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@xe_eudebug_sriov@deny-sriov:
>
>      +  shard-bmg: SKIP (Intel XE#5793) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
>
>      +  shard-bmg: SKIP (Intel XE#2322) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
>
>      +  shard-bmg: SKIP (Intel XE#4943) -> SKIP (Intel XE#6703) +1 other test skip
>  * 
>
>     igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>
>      +  shard-bmg: SKIP (Intel XE#4733) -> SKIP (Intel XE#6703)
>  * 
>
>     igt@xe_query@multigpu-query-mem-usage:
>
>      +  shard-bmg: SKIP (Intel XE#944) -> SKIP (Intel XE#6703)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> BUILD CHANGES
>
>  *  Linux: xe-4204-e04a4be1a156054fa00b25ef28848cf0df91453e -> xe-pw-157829v3
> 
> IGT_8658: 5d645d459768a0e5c8e5e95b9fce16bb17319825 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4204-e04a4be1a156054fa00b25ef28848cf0df91453e: e04a4be1a156054fa00b25ef28848cf0df91453e
> xe-pw-157829v3: 157829v3
> 
> 
>
