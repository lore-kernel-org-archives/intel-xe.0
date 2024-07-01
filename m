Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5374CC3065A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 15:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CCF10E2CB;
	Mon,  1 Jul 2024 15:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSWhzPrk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D6410E2CB
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 15:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719847139; x=1751383139;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RTdhTRch3XBx8iNe2w+eeM50IXa5X6BRhldMqSgCv+4=;
 b=JSWhzPrkV71yI81exNreJcS81SRNRJ+H4XJEkB1foXFn5dEgXLV/S8RJ
 WWfB4vRzzIl+Ji1mHBE8keG04H074sVr6DKQYoBbiPcpuf1Rj5jkovbGf
 78iB+fQNtQD1T1b7XXP4SoShRjFDJ2ZvpiWXMK7IAzyvM2pt4xhFMgJa+
 ZbJeWpYYOyQZ4bATtBUIKisS9VhhyEAW3pvEgjcxgdAwVDz6hp81Jfv4D
 KY0aVBwMs4MIMm85eFJ8l9v7ronAw/oC63Lg6WYSHcnGhM6xjdwE1V8pw
 CczJ4zUinlD9ugCp84TmF/Piv2JgAT11mqaS9PGjJ1IBPnqZmD4S2SV4W Q==;
X-CSE-ConnectionGUID: aGcCrD3DQSiyP4lsHHFrGA==
X-CSE-MsgGUID: WW2Itfu1QniBBIhw7TKzEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="16822972"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="16822972"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 08:18:50 -0700
X-CSE-ConnectionGUID: cOmewObmQ8u8NDqKqSs0cA==
X-CSE-MsgGUID: MIM94A8cTwG2FwmwlqOihw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="76273587"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa002.jf.intel.com with ESMTP; 01 Jul 2024 08:18:46 -0700
Received: from [10.245.82.99] (unknown [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C4001284EE
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 16:18:45 +0100 (IST)
Message-ID: <909b2e7c-6752-4d08-aa91-283be291b02e@intel.com>
Date: Mon, 1 Jul 2024 17:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_Rem?=
 =?UTF-8?Q?ove_inlined_=23ifdef_CONFIG=5FPCI=5FIOV?=
To: intel-xe@lists.freedesktop.org
References: <20240627104305.1477-1-michal.wajdeczko@intel.com>
 <171951499094.164687.3072890903707795408@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171951499094.164687.3072890903707795408@a6498e030952>
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



On 27.06.2024 21:03, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Remove inlined #ifdef CONFIG_PCI_IOV
> URL   : https://patchwork.freedesktop.org/series/135472/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c_full -> xe-pw-135472v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135472v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135472v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135472v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

must be unrelated, series is about coding style

> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-adlp:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_pm_dc@dc5-dpms.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-4/igt@kms_pm_dc@dc5-dpms.html

<6> [664.948794] [IGT] kms_pm_dc: starting subtest dc5-dpms
<7> [665.979493] xe 0000:00:02.0: [drm:intel_power_well_enable [xe]]
enabling DC_off
<7> [665.980123] xe 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [xe]]
Setting DC state from 02 to 00
<4> [665.980650] ------------[ cut here ]------------
<4> [665.980661] xe 0000:00:02.0: [drm]
drm_WARN_ON(intel_cdclk_clock_changed(&dev_priv->display.cdclk.hw,
&cdclk_config))
<4> [665.980757] WARNING: CPU: 2 PID: 140 at
drivers/gpu/drm/i915/display/intel_display_power_well.c:983
gen9_disable_dc_states+0x1e9/0x200 [xe]


> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p}:
>     - {shard-lnl}:        NOTRUN -> [SKIP][3] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135472v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_setmaster@master-drop-set-shared-fd:
>     - shard-dg2-set2:     [PASS][4] -> [DMESG-WARN][5] ([Intel XE#1162] / [Intel XE#1214])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>     - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] ([Intel XE#1033] / [Intel XE#1214])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#316])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#619])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1124] / [Intel XE#1201])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#367])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#787]) +2 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#314])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#308])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#309])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][21] -> [FAIL][22] ([Intel XE#1874]) +9 other tests fail
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         [PASS][23] -> [SKIP][24] ([Intel XE#1201]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-adlp:         [PASS][25] -> [FAIL][26] ([Intel XE#1861])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#658])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#656])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#653])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-434/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#929])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#327])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][38] -> [FAIL][39] ([Intel XE#771] / [Intel XE#899])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][40] -> [FAIL][41] ([Intel XE#899])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][42] -> [FAIL][43] ([Intel XE#899])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-6/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-434/igt@kms_vrr@flip-suspend.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [PASS][46] -> [TIMEOUT][47] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][50] -> [FAIL][51] ([Intel XE#1600])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][52] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-436/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind:
>     - shard-adlp:         [PASS][53] -> [DMESG-WARN][54] ([Intel XE#1214]) +1 other test dmesg-warn
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-4/igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-464/igt@xe_exec_fault_mode@once-basic.html
> 
>   * igt@xe_exec_reset@cat-error:
>     - shard-adlp:         [PASS][56] -> [DMESG-WARN][57] ([Intel XE#1214] / [Intel XE#358])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-2/igt@xe_exec_reset@cat-error.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-6/igt@xe_exec_reset@cat-error.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-adlp:         [PASS][58] -> [DMESG-WARN][59] ([Intel XE#1214] / [Intel XE#1638] / [Intel XE#358])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-1/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-mixed-fd-rebind:
>     - shard-dg2-set2:     [PASS][60] -> [FAIL][61] ([Intel XE#1069])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-rebind.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-434/igt@xe_exec_threads@threads-mixed-fd-rebind.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1192] / [Intel XE#1201])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#366])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][64] ([Intel XE#1214] / [Intel XE#569])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [PASS][65] -> [ABORT][66] ([Intel XE#1358])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [PASS][67] -> [ABORT][68] ([Intel XE#1794]) +1 other test abort
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-4/igt@xe_pm@s4-mocs.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-2/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [PASS][69] -> [FAIL][70] ([Intel XE#958])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#944])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][72] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][73] +2 other tests pass
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][74] ([Intel XE#1231]) -> [PASS][75] +1 other test pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
>     - shard-adlp:         [FAIL][76] ([Intel XE#1874]) -> [PASS][77] +3 other tests pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][78] ([Intel XE#1204]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - {shard-lnl}:        [FAIL][80] -> [PASS][81] +2 other tests pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-lnl-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][82] ([Intel XE#1214]) -> [PASS][83] +3 other tests pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [DMESG-FAIL][84] ([Intel XE#324]) -> [PASS][85] +3 other tests pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][86] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_invalid_mode@zero-clock:
>     - shard-adlp:         [SKIP][88] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_invalid_mode@zero-clock.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-4/igt@kms_invalid_mode@zero-clock.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - {shard-lnl}:        [DMESG-WARN][90] ([Intel XE#2052]) -> [PASS][91] +1 other test pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-lnl-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [FAIL][92] ([Intel XE#616]) -> [PASS][93] +1 other test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][94] ([Intel XE#361]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
>     - shard-adlp:         [SKIP][96] ([Intel XE#1201]) -> [PASS][97] +3 other tests pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-4/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][98] ([Intel XE#899]) -> [PASS][99] +1 other test pass
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][100] ([Intel XE#1214] / [Intel XE#1551]) -> [PASS][101] +2 other tests pass
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate:
>     - {shard-lnl}:        [INCOMPLETE][102] -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-1/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-lnl-2/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
>     - {shard-lnl}:        [INCOMPLETE][104] ([Intel XE#1330] / [Intel XE#1622]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-lnl-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_threads@threads-shared-vm-userptr:
>     - shard-adlp:         [DMESG-WARN][106] ([Intel XE#1214]) -> [PASS][107] +5 other tests pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@xe_exec_threads@threads-shared-vm-userptr.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-8/igt@xe_exec_threads@threads-shared-vm-userptr.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [FAIL][108] ([Intel XE#1414]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
>     - {shard-lnl}:        [SKIP][112] ([Intel XE#1192]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-2/igt@xe_live_ktest@xe_migrate.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_pm@s4-basic:
>     - {shard-lnl}:        [ABORT][114] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-2/igt@xe_pm@s4-basic.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-lnl-3/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - {shard-lnl}:        [ABORT][116] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-lnl-8/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [ABORT][118] ([Intel XE#1358]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-8/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [ABORT][120] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][122] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][123] ([Intel XE#1033] / [Intel XE#1214])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][124] ([Intel XE#324]) -> [FAIL][125] ([Intel XE#1231])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
>     - shard-adlp:         [SKIP][126] ([Intel XE#1201]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
>     - shard-adlp:         [SKIP][128] ([Intel XE#1201]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#656]) +2 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-adlp:         [FAIL][130] -> [SKIP][131] ([Intel XE#1201] / [Intel XE#653])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-adlp:         [SKIP][132] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][133] ([Intel XE#1201])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [FAIL][134] ([Intel XE#1729]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#362])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#1500])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     [DMESG-WARN][138] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][139] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-WARN][140] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][141] ([Intel XE#1760])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7905 -> IGT_7906
>   * Linux: xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c -> xe-pw-135472v1
> 
>   IGT_7905: 7905
>   IGT_7906: ae91ba26f657bf11264f64bd2dc21f471a5d18f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1538-42f35e623e6590cf8ec493373e4664ae4e32123c: 42f35e623e6590cf8ec493373e4664ae4e32123c
>   xe-pw-135472v1: 135472v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135472v1/index.html
> 
