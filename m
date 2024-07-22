Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A0BC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 10:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D797110E4A6;
	Mon, 22 Jul 2024 10:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="em5iHo5Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B9910E4A6
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721642726; x=1753178726;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=S86o7iWCpBCmiZBZnHNZiJ4lbDgla3owGQwHjrnkNXI=;
 b=em5iHo5Q6AYVVDQDLzcIbm/YSFiUW/UnkXBIVi5tbRJSbKB1UijUq4sI
 m5aW3kpo112Anq0kjehtjqRWQT1TwgBv0dJKUGwzKxS88e+sbyk+aYo49
 6o0aGKRHTob33TrkulAoIwkdM2Fg/kdqxOkmt3PBT4LMZzB11+iknZd0o
 36qHcTHFpL4pCX7xFydhKlqHphgd6+4hguC7J8ypop/OQWjwEiMMRAW+a
 BL1H0FNQNtVDTMP68xNS91WqIny4wwz4YwQN4evo+dFHfyRVeUPoTsQwy
 yRX/DWcxA4kekQZh4Vz7Cp9hh21SHM1Xm37wbDZnvE08871YWQaXUD1kH g==;
X-CSE-ConnectionGUID: cICPXHpPRp2x9mlxbCTTiA==
X-CSE-MsgGUID: W+81FBjURWW0IICQgCQlUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19387790"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="19387790"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 03:05:16 -0700
X-CSE-ConnectionGUID: HljrbsvsRESbHnoy3arPmw==
X-CSE-MsgGUID: qUqHkLw4RzCiYUboQdl1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="51909828"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 22 Jul 2024 03:05:12 -0700
Received: from [10.246.48.141] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.48.141])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 69BCD28763
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 11:05:11 +0100 (IST)
Message-ID: <d50584d9-785a-4521-8b68-236401c93b37@intel.com>
Date: Mon, 22 Jul 2024 12:05:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Convert_live_tes?=
 =?UTF-8?Q?ts_to_parameterized_style_=28rev3=29?=
To: intel-xe@lists.freedesktop.org
References: <20240720142528.530-1-michal.wajdeczko@intel.com>
 <172149202874.308939.7594098943378521759@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172149202874.308939.7594098943378521759@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 20.07.2024 18:13, Patchwork wrote:
> == Series Details ==
> 
> Series: Convert live tests to parameterized style (rev3)
> URL   : https://patchwork.freedesktop.org/series/136163/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f_full -> xe-pw-136163v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-136163v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136163v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-136163v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@plane-position-hole-dpms:
>     - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms.html

unrelated, series is live-tests specific

<3> [101.803994] xe 0000:00:02.0: [drm] *ERROR* CPU pipe A FIFO
underrun: port,transcoder,
<7> [101.804362] xe 0000:00:02.0: [drm:intel_fbc_underrun_work_fn [xe]]
Disabling FBC due to FIFO underrun.
<7> [101.819070] xe 0000:00:02.0: [drm:__intel_fbc_disable [xe]]
Disabling FBC on [PLANE:32:plane 1A]

> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

expected

[]     # xe_bo_evict_kunit: running on LUNARLAKE device
[]         ok 1 0000:00:02.0 # SKIP non-discrete device
[]     ok 1 xe_bo_evict_kunit # SKIP

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_plane@plane-position-covered@pipe-a-plane-1}:
>     - shard-lnl:          [PASS][4] -> [DMESG-FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
> 
>   * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3}:
>     - shard-lnl:          [PASS][6] -> [DMESG-WARN][7] +6 other tests dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   * {igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit}:
>     - shard-lnl:          [PASS][8] -> [SKIP][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-4/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

expected, as the result of new way of reporting SKIP:

[]     # xe_validate_ccs_kunit: Skipping non-xe2 discrete device
0000:00:02.0.
[]     ok 1 xe_validate_ccs_kunit

vs

[]     # xe_validate_ccs_kunit: running on LUNARLAKE device
[]         ok 1 0000:00:02.0 # SKIP non-xe2 discrete device
[]     ok 1 xe_validate_ccs_kunit # SKIP


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136163v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotrebind:
>     - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1195])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-435/igt@core_hotunplug@hotrebind.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-466/igt@core_hotunplug@hotrebind.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#599])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1124])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#367])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1399])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#314])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#373])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
> 
>   * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
>     - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#1541])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#310])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-panning:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1421])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_flip@2x-flip-vs-panning.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#886]) +1 other test fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1401] / [Intel XE#1745])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1401])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1397] / [Intel XE#1745])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1397])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
>     - shard-adlp:         [PASS][32] -> [FAIL][33] ([Intel XE#1874])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#651]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-rte:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#656]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#656]) +3 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][39] -> [SKIP][40] ([Intel XE#455])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][41] ([Intel XE#1195])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1439])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1128])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#929])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][45] -> [FAIL][46] ([Intel XE#771] / [Intel XE#899])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#899]) +1 other test fail
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][49] -> [FAIL][50] ([Intel XE#899])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1447])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][52] -> [TIMEOUT][53] ([Intel XE#1473] / [Intel XE#402])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#688])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][55] -> [TIMEOUT][56] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-433/igt@xe_evict@evict-threads-large.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-436/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-adlp:         [PASS][57] -> [ABORT][58] ([Intel XE#2271])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_exec_reset@parallel-close-fd:
>     - shard-adlp:         [PASS][59] -> [ABORT][60] ([Intel XE#2271] / [Intel XE#2309])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-2/igt@xe_exec_reset@parallel-close-fd.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-6/igt@xe_exec_reset@parallel-close-fd.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][61] -> [ABORT][62] ([Intel XE#2271])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-adlp:         [PASS][63] -> [DMESG-WARN][64] ([Intel XE#2226])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-8/igt@xe_huc_copy@huc_copy.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-6/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1192] / [Intel XE#1201])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#366])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-6/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [PASS][67] -> [ABORT][68] ([Intel XE#1358])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-6/igt@xe_pm@s4-basic.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-9/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          [PASS][69] -> [ABORT][70] ([Intel XE#1358] / [Intel XE#1607])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-8/igt@xe_pm@s4-exec-after.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-2/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][71] ([Intel XE#1760])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-dg2-set2:     [FAIL][72] ([Intel XE#1426]) -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][74] -> [PASS][75]
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [FAIL][76] ([Intel XE#1659]) -> [PASS][77]
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [FAIL][78] ([Intel XE#886]) -> [PASS][79] +4 other tests pass
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][80] ([Intel XE#1874]) -> [PASS][81] +1 other test pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>     - shard-lnl:          [INCOMPLETE][82] -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [DMESG-WARN][84] -> [PASS][85] +2 other tests pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-7/igt@kms_plane@plane-position-hole.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-8/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][86] ([Intel XE#361]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][88] ([Intel XE#1195]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-hdmi-a-6.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][90] ([Intel XE#771] / [Intel XE#899]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][92] ([Intel XE#899]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][94] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][95] +1 other test pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][96] ([Intel XE#1473]) -> [PASS][97] +1 other test pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [ABORT][98] ([Intel XE#1358]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-2/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [ABORT][100] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][102] ([Intel XE#316]) -> [SKIP][103] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][105] ([Intel XE#316]) +2 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][106] -> [FAIL][107] ([Intel XE#1231]) +2 other tests fail
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][109] ([Intel XE#607])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][111] ([Intel XE#610])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][113] ([Intel XE#1124]) +7 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#1124]) -> [SKIP][115] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#367]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#367])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][119] ([Intel XE#367])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][121] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][123] ([Intel XE#787]) +76 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#787]) -> [SKIP][125] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][126] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][129] ([Intel XE#373]) +8 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][131] ([Intel XE#306]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#373]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][135] ([Intel XE#307]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#307]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#307])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     [FAIL][138] ([Intel XE#1204]) -> [INCOMPLETE][139] ([Intel XE#1195]) +1 other test incomplete
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-466/igt@kms_content_protection@lic-type-0.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][141] ([Intel XE#308]) +2 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#308]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#308])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#776]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#776])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][147] ([Intel XE#1135])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_feature_discovery@psr1.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1135]) -> [SKIP][149] ([Intel XE#1135] / [Intel XE#1201])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-435/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][151] ([Intel XE#455]) +9 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][153] ([Intel XE#651]) +26 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#651]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][157] ([Intel XE#653]) +24 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#653]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#455]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#498]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][167] ([Intel XE#1122])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][169] ([Intel XE#908]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#1129]) -> [SKIP][171] ([Intel XE#1129] / [Intel XE#1201])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#1489]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][175] ([Intel XE#1489]) +4 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#929]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][179] ([Intel XE#929]) +12 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][181] ([Intel XE#1149])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#327]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#327])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][185] ([Intel XE#327]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-270.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#1127]) -> [SKIP][187] ([Intel XE#1127] / [Intel XE#1201])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#362])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][191] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#944]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-436/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][194] ([Intel XE#1195] / [Intel XE#1473]) -> [INCOMPLETE][195] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-basic-imm:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][197] ([Intel XE#288]) +22 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@xe_exec_fault_mode@once-basic-imm.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#288]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][201] ([Intel XE#512])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@xe_mmap@small-bar.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][203] ([Intel XE#366]) +1 other test skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#366]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#366])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-435/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][207] ([Intel XE#944]) +1 other test skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-463/igt@xe_query@multigpu-query-config.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][209] ([Intel XE#1130])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-dg2-434/igt@xe_wedged@basic-wedged.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-dg2-432/igt@xe_wedged@basic-wedged.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [DMESG-FAIL][210] ([Intel XE#1760]) -> [DMESG-WARN][211] ([Intel XE#1760])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
>   [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
>   [Intel XE#2309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309
>   [Intel XE#2339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2339
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f -> xe-pw-136163v3
> 
>   IGT_7933: 7933
>   xe-1637-51eaf1afceb400cf4fe9ed1147dffccc4cc8204f: 51eaf1afceb400cf4fe9ed1147dffccc4cc8204f
>   xe-pw-136163v3: 136163v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v3/index.html
> 
