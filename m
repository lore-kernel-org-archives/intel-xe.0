Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D53D2F7EF
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 14:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0455B10E1F4;
	Fri,  5 Dec 2025 14:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hs5t7rSo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B905610E1F4
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 13:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764943198; x=1796479198;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=ea0U4iCfLdUE/uKwcL8ON207SB8vxqLhvvu+oVV1vU4=;
 b=hs5t7rSoTAnSEeB3C9u/KkHBe799miWpOELhtY12kHMHTVtDSZgB0uq1
 XRPwYrEHxEWboYM4J9bKtyGgCIZvIC2Lw6SCv+f7gAJ4mr571l024g7oZ
 w0mHZ23k2uYIpGK11QujLjmADUMlQp5RHenkJcs+yjdOrQHTf+Gn9yYS2
 mL1Y+jBi/HbE530Ba6qknBlgfoNyoMGxFeVuo7Aww7lPAqoGgZSJSoEgr
 ow26H1h7G1swYmbkU6607z/K5gkoAGpbid02ChhUJsGPRRXHHrKbq6jas
 NCLJwqUtVBRYyg42kYgT6hi/A06DWpv2RpXUTD1JcUO7QnQ+v+VB4xDjs w==;
X-CSE-ConnectionGUID: vV/tygufTO+qO8Cdpe3dGw==
X-CSE-MsgGUID: Q8e2i9iWQYKXqz30rFRTZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84382417"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84382417"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 05:59:58 -0800
X-CSE-ConnectionGUID: INreHCxvRlOyAKPj99i+9A==
X-CSE-MsgGUID: MD1FSFerQx+0AtsIWc+Ydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195385908"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 05:59:57 -0800
Date: Fri, 5 Dec 2025 14:59:55 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: intel-xe@lists.freedesktop.org
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm=2Fb?=
 =?UTF-8?Q?uddy=3A_release_free=5Ftrees_array_on_buddy_mm_te?=
 =?UTF-8?Q?ardown_=28rev2=29?=
In-Reply-To: <176446022061.40284.10597013568695060085@a3b018990fe9>
Message-ID: <a61fb2dc-c463-389e-dbd4-66429653aa8e@intel.com>
References: <20251129214740.3305249-1-michal.grzelak@intel.com>
 <176446022061.40284.10597013568695060085@a3b018990fe9>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-983496518-1764933618=:3922338"
Content-ID: <9caec049-54df-fb31-a35f-69413a3da77c@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-983496518-1764933618=:3922338
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <d3fb2661-30c8-a7bf-12f6-55a4f9bf6696@intel.com>

On Sat, 29 Nov 2025, Patchwork wrote:
> Patch Details
> Series:
> drm/buddy: release free_trees array on buddy mm teardown (rev2)
> URL:
> https://patchwork.freedesktop.org/series/157829/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157829v2/index.html
>                          CI Bug Log - changes from xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc_FULL -> xe-pw-157829v2_FULL
> 
> SUMMARY
> 
> FAILURE
> 
> Serious unknown changes coming with xe-pw-157829v2_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-157829v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> PARTICIPATING HOSTS (4 -> 4)
> 
> No changes in participating hosts
> 
> POSSIBLE NEW ISSUES
> 
> Here are the unknown changes that may have been introduced in xe-pw-157829v2_FULL:
>
>   IGT changes
>
>     Possible regressions
>
>  * 
>
>     igt@kms_colorop@plane-xr24-xr24-3dlut_17_12_rgb:
>
>      +  shard-adlp: NOTRUN -> SKIP
>  * 
>
>     igt@kms_colorop@plane-xr24-xr24-bt2020_inv_oetf-bt2020_oetf:
>
>      +  shard-bmg: NOTRUN -> SKIP +1 other test skip

These two tests skip on every platform in CI; unrelated issue.

>
>     Warnings
>
>  *  igt@kms_content_protection@dp-mst-suspend-resume:
>      +  shard-bmg: SKIP (Intel XE#6692) -> SKIP

"No DP MST set up with >= 2 outputs found in a single topology".
Unrelated issue.

BR,
Micha³

> 
> KNOWN ISSUES
> 
> Here are the changes found in xe-pw-157829v2_FULL that come from known issues:
>
>   IGT changes
>
>     Issues hit
>
>  * 
>
>     igt@kms_big_fb@4-tiled-addfb:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#619)
>  * 
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#1124) +2 other tests skip
>  * 
>
>     igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#316)
>  * 
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#607)
>  * 
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1124) +5 other tests skip
>  * 
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#2191)
>  * 
>
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#367) +1 other test skip
>  * 
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#2887)
>  * 
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#787) +14 other tests skip
>  * 
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2887) +10 other tests skip
>  * 
>
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#455 / Intel XE#787) +9 other tests skip
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
>
>      +  shard-dg2-set2: PASS -> INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel XE#4345 / Intel XE#6168)
>  * 
>
>     igt@kms_chamelium_color@ctm-blue-to-red:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#306)
>  * 
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2325)
>  * 
>
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2252) +5 other tests skip
>  * 
>
>     igt@kms_chamelium_frames@hdmi-crc-single:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#373) +2 other tests skip
>  * 
>
>     igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#373)
>  * 
>
>     igt@kms_color@legacy-gamma@pipe-a-dp-2:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#3910)
>  * 
>
>     igt@kms_colorop@plane-xr30-xr30-bt2020_inv_oetf:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#6704) +1 other test skip
>  * 
>
>     igt@kms_colorop@plane-xr30-xr30-srgb_inv_eotf_lut:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6704) +1 other test skip
>  * 
>
>     igt@kms_content_protection@atomic:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#455) +2 other tests skip
>  * 
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2390)
>  * 
>
>     igt@kms_content_protection@legacy:
>
>      +  shard-bmg: NOTRUN -> FAIL (Intel XE#1178) +1 other test fail
>  * 
>
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2321) +2 other tests skip
>  * 
>
>     igt@kms_cursor_crc@cursor-random-128x42:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2320)
>  * 
>
>     igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>
>      +  shard-bmg: PASS -> DMESG-WARN (Intel XE#3428) +2 other tests dmesg-warn
>  * 
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#309) +1 other test skip
>  * 
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4422)
>  * 
>
>     igt@kms_feature_discovery@psr2:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#1135)
>  * 
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>
>      +  shard-bmg: PASS -> SKIP (Intel XE#2316)
>  * 
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2316)
>  * 
>
>     igt@kms_flip@2x-plain-flip-interruptible:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#310) +1 other test skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2293) +3 other tests skip
>  * 
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2293 / Intel XE#2380) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2311) +14 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2312)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4141) +6 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#651) +4 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#1151)
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2313) +16 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#6312) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#653) +6 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#656) +9 other tests skip
>  * 
>
>     igt@kms_panel_fitting@legacy:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2486)
>  * 
>
>     igt@kms_plane_lowres@tiling-4:
>
>      +  shard-bmg: PASS -> DMESG-FAIL (Intel XE#5681)
>  * 
>
>     igt@kms_plane_lowres@tiling-4@pipe-b-dp-2:
>
>      +  shard-bmg: PASS -> DMESG-FAIL (Intel XE#5254)
>  * 
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6691) +4 other tests skip
>  * 
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2938)
>  * 
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#3309)
>  * 
>
>     igt@kms_pm_dc@dc6-dpms:
>
>      +  shard-adlp: NOTRUN -> FAIL (Intel XE#718)
>  * 
>
>     igt@kms_pm_rpm@system-suspend-idle:
>
>      +  shard-lnl: NOTRUN -> ABORT (Intel XE#6675) +1 other test abort
>  * 
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +2 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#1489) +4 other tests skip
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2893 / Intel XE#4608)
>  * 
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#4608) +1 other test skip
>  * 
>
>     igt@kms_psr@fbc-psr-sprite-blt:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2850 / Intel XE#929) +3 other tests skip
>  * 
>
>     igt@kms_psr@fbc-psr2-suspend:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2234 / Intel XE#2850) +7 other tests skip
>  * 
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1406 / Intel XE#2414)
>  * 
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#3414 / Intel XE#3904)
>  * 
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2330)
>  * 
>
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#3414)
>  * 
>
>     igt@kms_setmode@basic-clone-single-crtc:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#1435)
>  * 
>
>     igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#6503)
>  * 
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#362)
>  * 
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>      +  shard-lnl: PASS -> FAIL (Intel XE#2142) +1 other test fail
>  * 
>
>     igt@xe_compute@ccs-mode-compute-kernel:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#6599)
>  * 
>
>     igt@xe_compute_preempt@compute-preempt-many-all-ram:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#6360)
>  * 
>
>     igt@xe_copy_basic@mem-matrix-copy-200x127:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#5300)
>  * 
>
>     igt@xe_eudebug@basic-vm-access:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#4837 / Intel XE#5565) +4 other tests skip
>  * 
>
>     igt@xe_eudebug@basic-vm-bind-discovery:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4837) +7 other tests skip
>  * 
>
>     igt@xe_eudebug_online@pagefault-write-stress:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#6665)
>  * 
>
>     igt@xe_evict@evict-beng-large-external:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#261 / Intel XE#5564)
>  * 
>
>     igt@xe_evict@evict-beng-mixed-threads-small:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#261) +2 other tests skip
>  * 
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>      +  shard-bmg: NOTRUN -> INCOMPLETE (Intel XE#6321 / Intel XE#6606)
>  * 
>
>     igt@xe_evict@evict-small-multi-vm:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#261 / Intel XE#5564 / Intel XE#688)
>  * 
>
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#1392 / Intel XE#5575) +3 other tests skip
>  * 
>
>     igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2322) +4 other tests skip
>  * 
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#288 / Intel XE#5561) +9 other tests skip
>  * 
>
>     igt@xe_exec_system_allocator@process-many-execqueues-malloc-fork-read:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#4915) +106 other tests skip
>  * 
>
>     igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4943) +11 other tests skip
>  * 
>
>     igt@xe_media_fill@media-fill:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2459 / Intel XE#2596)
>  * 
>
>     igt@xe_mmap@pci-membarrier:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#5100)
>  * 
>
>     igt@xe_oa@buffer-size:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#6032)
>  * 
>
>     igt@xe_oa@syncs-syncobj-none@oag-0:
>
>      +  shard-bmg: NOTRUN -> DMESG-WARN (Intel XE#3428) +1 other test dmesg-warn
>  * 
>
>     igt@xe_oa@syncs-syncobj-wait-cfg:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#3573) +1 other test skip
>  * 
>
>     igt@xe_pat@pat-index-xelpg:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#2236)
>  * 
>
>     igt@xe_pm@s2idle-multiple-execs:
>
>      +  shard-dg2-set2: PASS -> ABORT (Intel XE#6675)
>  * 
>
>     igt@xe_pm@s3-exec-after:
>
>      +  shard-bmg: NOTRUN -> ABORT (Intel XE#6675) +4 other tests abort
>  * 
>
>     igt@xe_pm@s4-basic-exec:
>
>      +  shard-adlp: PASS -> ABORT (Intel XE#6675) +1 other test abort
>  * 
>
>     igt@xe_pmu@engine-activity-accuracy-50:
>
>      +  shard-lnl: PASS -> FAIL (Intel XE#6251) +1 other test fail
>  * 
>
>     igt@xe_pxp@display-black-pxp-fb:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#4733)
>  * 
>
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#4733 / Intel XE#5594)
>  * 
>
>     igt@xe_query@multigpu-query-invalid-extension:
>
>      +  shard-bmg: NOTRUN -> SKIP (Intel XE#944) +3 other tests skip
>  * 
>
>     igt@xe_query@multigpu-query-uc-fw-version-guc:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#944)
>  * 
>
>     igt@xe_render_copy@render-stress-2-copies:
>
>      +  shard-adlp: NOTRUN -> SKIP (Intel XE#4814 / Intel XE#5614) +1 other test skip
>  * 
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>      +  shard-lnl: NOTRUN -> SKIP (Intel XE#3342)
>
>     Possible fixes
>
>  * 
>
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>
>      +  shard-bmg: SKIP (Intel XE#2314 / Intel XE#2894) -> PASS
>  * 
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>
>      +  shard-bmg: SKIP (Intel XE#2291) -> PASS
>  * 
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>
>      +  shard-bmg: SKIP (Intel XE#2316) -> PASS +1 other test pass
>  * 
>
>     igt@kms_hdr@bpc-switch-dpms:
>
>      +  shard-bmg: ABORT (Intel XE#6662) -> PASS
>  * 
>
>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>
>      +  shard-adlp: ABORT (Intel XE#6675) -> PASS +2 other tests pass
>  * 
>
>     igt@kms_setmode@basic@pipe-a-hdmi-a-6:
>
>      +  shard-dg2-set2: FAIL (Intel XE#6361) -> PASS +1 other test pass
>  * 
>
>     {igt@kms_sharpness_filter@filter-suspend@pipe-c-edp-1-suspend}:
>
>      +  shard-lnl: INCOMPLETE -> PASS
>  * 
>
>     igt@kms_vrr@negative-basic:
>
>      +  shard-bmg: SKIP (Intel XE#1499) -> PASS
>  * 
>
>     igt@xe_exec_reset@cm-gt-reset:
>
>      +  shard-bmg: ABORT (Intel XE#6515) -> PASS
>  * 
>
>     igt@xe_pm@s2idle-basic-exec:
>
>      +  shard-lnl: ABORT (Intel XE#6675) -> PASS +1 other test pass
>  * 
>
>     igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_copy0:
>
>      +  shard-lnl: FAIL (Intel XE#6251) -> PASS
>
>     Warnings
>
>  * 
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>      +  shard-dg2-set2: ABORT (Intel XE#1727) -> INCOMPLETE (Intel XE#1727 / Intel XE#3113 / Intel XE#4345 / Intel XE#6168)
>  * 
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>      +  shard-bmg: FAIL (Intel XE#4633) -> DMESG-WARN (Intel XE#3428)
>  * 
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
>
>      +  shard-bmg: SKIP (Intel XE#2311) -> SKIP (Intel XE#2312) +4 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
>
>      +  shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2311) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
>
>      +  shard-bmg: SKIP (Intel XE#4141) -> SKIP (Intel XE#2312) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>
>      +  shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#4141) +2 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
>
>      +  shard-bmg: SKIP (Intel XE#2312) -> SKIP (Intel XE#2313) +3 other tests skip
>  * 
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
>
>      +  shard-bmg: SKIP (Intel XE#2313) -> SKIP (Intel XE#2312) +4 other tests skip
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> BUILD CHANGES
>
>  *  Linux: xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc -> xe-pw-157829v2
> 
> IGT_8645: 8645
> xe-4169-157d0854a24fa73f7516908563d3ee9eacc679fc: 157d0854a24fa73f7516908563d3ee9eacc679fc
> xe-pw-157829v2: 157829v2
> 
> 
>
--8323329-983496518-1764933618=:3922338--
