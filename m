Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D411C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 11:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D3A113A52;
	Wed, 24 Apr 2024 11:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnS8MxaV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39EA113A52
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713957080; x=1745493080;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=IJTCU0Sz77Fmc3TZ9RiB06socb1URWIwXnuiVeCPIzQ=;
 b=EnS8MxaVWZ44jZA2CZBt5ycUr6Si52Nj9/r0U//0e88OleqSchHNlenJ
 Ds69215M7OE9NaV3QLTOV4wkuLkVQD76PabYj73flhgoApri3szTS502f
 185XE09MeuflFCno4YQNOGnV4YYp+A89Pe0cYU31ub+LxxovtSbxWJevm
 UA1EVBAkTi8G+MX0RdCKplETW4tzYf+ytoPduMHIr3EaKnTTkHVrWi/QO
 gB6qrdOvPLioMoF0cdvcnGFnXqQB5FLWAPhkZbmDQnIRjT6knmzommDLd
 pItECfzyvurrE0a2Ts+8Kv9gLhcqRqB1kkxkiOdDFGol2U04/2BJD/XZT w==;
X-CSE-ConnectionGUID: DNXkiIG2QCqHuz8SKxZ7lw==
X-CSE-MsgGUID: zrdB9tWESYesQ6XuL/6vGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9511877"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9511877"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 04:11:20 -0700
X-CSE-ConnectionGUID: osQBWA0mS7+gHCZDxTwzrQ==
X-CSE-MsgGUID: WFaDhE3XSxyxmanEfo8oIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24725452"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 24 Apr 2024 04:11:08 -0700
Received: from [10.252.46.168] (unknown [10.252.46.168])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7A68728780
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 12:11:02 +0100 (IST)
Message-ID: <a1d46bf1-216a-4bb8-a1f4-52fdea42f803@intel.com>
Date: Wed, 24 Apr 2024 13:11:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_PF=3A_Expose_GT-?=
 =?UTF-8?Q?level_SR-IOV_details_over_debugfs?=
To: intel-xe@lists.freedesktop.org
References: <20240423131244.2045-1-michal.wajdeczko@intel.com>
 <171393705743.1628979.9214983027961441898@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171393705743.1628979.9214983027961441898@8e613ede5ea5>
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



On 24.04.2024 07:37, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: Expose GT-level SR-IOV details over debugfs
> URL   : https://patchwork.freedesktop.org/series/132777/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf_full -> xe-pw-132777v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-132777v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-132777v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-132777v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all 'regressions' are unrelated to this series, and rather look like
that CI/IGT did something wrong, or Xe native driver is unable to
recover from the resets (issue already seen before)

> 
>   * igt@core_setmaster@master-drop-set-user:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html

<7>[    4.837499] xe 0000:00:02.0: [drm:xe_pci_probe [xe]]
XE_ALDERLAKE_S  4680:000c dgfx:0 gfx:Xe_LP (12.00) media:Xe_M (12.00)
display:yes dma_m_s:39 tc:1 gscfi:0

<7>[   86.775086] [IGT] kms_cursor_crc: executing
<7>[   86.785127] [IGT] kms_cursor_crc: exiting, ret=77
<7>[   86.842315] [IGT] kms_frontbuffer_tracking: executing
<7>[   86.851315] [IGT] kms_frontbuffer_tracking: exiting, ret=77
<7>[   86.897556] [IGT] kms_atomic_transition: executing
<7>[   86.907618] [IGT] kms_atomic_transition: exiting, ret=77
<7>[   87.004599] [IGT] kms_frontbuffer_tracking: executing
<7>[   87.015215] [IGT] kms_frontbuffer_tracking: exiting, ret=77
<7>[   87.061485] [IGT] xe_pm: executing
<7>[   87.071633] [IGT] xe_pm: exiting, ret=77
<7>[   87.119223] [IGT] xe_exec_basic: executing
<7>[   87.128004] [IGT] xe_exec_basic: exiting, ret=77
<7>[   87.186705] [IGT] kms_frontbuffer_tracking: executing
<7>[   87.195120] [IGT] kms_frontbuffer_tracking: exiting, ret=77
<7>[   87.253445] [IGT] xe_exec_basic: executing
<7>[   87.261360] [IGT] xe_exec_basic: exiting, ret=77
<7>[   87.312046] [IGT] xe_evict: executing
<7>[   87.325370] [IGT] xe_evict: exiting, ret=77
<7>[   87.381420] [IGT] core_setmaster: executing
<7>[   87.390741] [IGT] core_setmaster: starting subtest
master-drop-set-user
<7>[   87.412517] [IGT] core_setmaster: finished subtest
master-drop-set-user, FAIL
<7>[   87.412590] [IGT] core_setmaster: exiting, ret=98

(core_setmaster:998) drmtest-WARNING: No card matches the filter!
[pci:vendor=intel,device=discrete,card=0]


> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x256:
>     - shard-adlp:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-256x256.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-256x256.html

<6> [601.119999] xe 0000:00:02.0: [drm] GT0: GuC load failed: status =
0x400000A0
<6> [601.120019] xe 0000:00:02.0: [drm] GT0: GuC status: Reset = 0,
BootROM = 0X50, UKernel = 0X0, MIA = 0X0, Auth = 0X1
<6> [601.120029] xe 0000:00:02.0: [drm] GT0: GuC firmware signature
verification failed

> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-adlp:         NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * {igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-2} (NEW):
>     - {shard-lnl}:        NOTRUN -> [SKIP][6] +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-2.html
> 
>   * {igt@kms_vblank@query-forked-busy@pipe-c-edp-2} (NEW):
>     - {shard-lnl}:        NOTRUN -> [DMESG-WARN][7] +2 other tests dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-3/igt@kms_vblank@query-forked-busy@pipe-c-edp-2.html
> 
>   * {igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-edp-2} (NEW):
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][8] +1 other test incomplete
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-6/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-edp-2.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [INCOMPLETE][9] ([Intel XE#1044] / [Intel XE#1195]) -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@xe_module_load@many-reload.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@xe_module_load@many-reload.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - {shard-lnl}:        [SKIP][11] ([Intel XE#1466]) -> [SKIP][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@bo-too-small:
>     - {shard-lnl}:        [PASS][13] -> [DMESG-WARN][14] +1 other test dmesg-warn
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_addfb_basic@bo-too-small.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-6/igt@kms_addfb_basic@bo-too-small.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - {shard-lnl}:        NOTRUN -> [DMESG-WARN][15]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - {shard-lnl}:        [SKIP][16] ([Intel XE#306]) -> [SKIP][17]
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_chamelium_color@ctm-negative.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - {shard-lnl}:        [SKIP][18] ([Intel XE#373]) -> [SKIP][19]
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x256:
>     - {shard-lnl}:        NOTRUN -> [FAIL][20]
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-256x256.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - {shard-lnl}:        [SKIP][21] ([Intel XE#309]) -> [SKIP][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - {shard-lnl}:        [SKIP][23] ([Intel XE#651]) -> [SKIP][24] +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-rte:
>     - {shard-lnl}:        [SKIP][25] ([Intel XE#656]) -> [SKIP][26] +3 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-rte.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - {shard-lnl}:        [PASS][27] -> [SKIP][28] +14 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - {shard-lnl}:        [PASS][29] -> [INCOMPLETE][30] +3 other tests incomplete
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c-edp-1:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][31] +2 other tests incomplete
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-c-edp-1.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - {shard-lnl}:        [PASS][32] -> [FAIL][33] +2 other tests fail
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - {shard-lnl}:        NOTRUN -> [SKIP][34] +12 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - {shard-lnl}:        [SKIP][35] ([Intel XE#1435]) -> [SKIP][36]
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_setmode@basic-clone-single-crtc.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_vrr@negative-basic:
>     - {shard-lnl}:        [SKIP][37] ([Intel XE#1446]) -> [SKIP][38]
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_vrr@negative-basic.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_pm@d3-mmap-system:
>     - {shard-lnl}:        [FAIL][39] ([Intel XE#1221]) -> [FAIL][40]
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_pm@d3-mmap-system.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-3/igt@xe_pm@d3-mmap-system.html
> 
>   * {igt@xe_pm@s4-vm-bind-userptr}:
>     - shard-adlp:         [FAIL][41] ([Intel XE#1043]) -> [FAIL][42]
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf_full and xe-pw-132777v1_full:
> 
> ### New IGT tests (12) ###
> 
>   * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-edp-2:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [0.73] s
> 
>   * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-b-edp-2:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [1.03] s
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.01] s
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-edp-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-edp-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.00] s
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.02] s
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-edp-2:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.04] s
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-2:
>     - Statuses : 1 incomplete(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_vblank@query-forked-busy@pipe-a-edp-2:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [3.26] s
> 
>   * igt@kms_vblank@query-forked-busy@pipe-c-edp-2:
>     - Statuses : 1 dmesg-warn(s)
>     - Exec time: [3.51] s
> 
>   * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-edp-2:
>     - Statuses : 1 incomplete(s)
>     - Exec time: [0.0] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-132777v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - shard-dg2-set2:     [PASS][43] -> [SKIP][44] ([Intel XE#1136] / [Intel XE#1201])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_atomic@crtc-invalid-params-fence:
>     - shard-adlp:         [PASS][45] -> [DMESG-WARN][46] ([Intel XE#1214])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_atomic@crtc-invalid-params-fence.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_atomic@crtc-invalid-params-fence.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#316])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#1231]) +1 other test fail
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][50] ([Intel XE#1619] / [Intel XE#1689]) +1 other test dmesg-fail
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][51] ([Intel XE#1204])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][52] -> [FAIL][53] ([Intel XE#1204])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][54] ([Intel XE#324])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][55] ([Intel XE#1231]) +1 other test fail
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#619])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#367])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +26 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#787]) +47 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#787]) +118 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +16 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#307])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#308])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][68] -> [DMESG-WARN][69] ([Intel XE#1214]) +3 other tests dmesg-warn
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][70] ([Intel XE#1162])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge:
>     - shard-adlp:         [PASS][71] -> [FAIL][72] ([Intel XE#581])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_cursor_edge_walk@256x256-right-edge.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_cursor_edge_walk@256x256-right-edge.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [PASS][73] -> [DMESG-WARN][74] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][75] -> [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#323])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][78] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#309]) +6 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][80] ([Intel XE#1214]) +1 other test dmesg-warn
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@single-bo@pipe-b:
>     - shard-dg2-set2:     [PASS][81] -> [DMESG-WARN][82] ([Intel XE#1214] / [Intel XE#877])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_cursor_legacy@single-bo@pipe-b.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [i915#3804])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         [PASS][85] -> [DMESG-WARN][86] ([Intel XE#1191] / [Intel XE#1214]) +2 other tests dmesg-warn
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1135] / [Intel XE#1201])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-1/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][89] ([Intel XE#1214]) +2 other tests dmesg-warn
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [FAIL][90] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#455]) +21 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>     - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#1201]) +247 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][94] -> [FAIL][95] ([Intel XE#616]) +4 other tests fail
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#656]) +37 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-adlp:         [PASS][99] -> [SKIP][100] ([Intel XE#1201] / [Intel XE#417])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][101] ([Intel XE#616]) +2 other tests fail
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc:
>     - shard-adlp:         [PASS][102] -> [SKIP][103] ([Intel XE#1201] / [Intel XE#829])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_pipe_crc_basic@hang-read-crc.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][104] ([Intel XE#616]) +6 other tests fail
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][107] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
>     - shard-adlp:         [PASS][108] -> [SKIP][109] ([Intel XE#1201]) +10 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
>     - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#1201] / [i915#2575]) +112 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1201] / [i915#2575]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-2:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-2 (NEW):
>     - {shard-lnl}:        NOTRUN -> [SKIP][117] ([Intel XE#305]) +3 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-2.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-2:
>     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms:
>     - shard-adlp:         [PASS][120] -> [SKIP][121] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_pm_rpm@legacy-planes-dpms.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#836]) +1 other test skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms:
>     - shard-dg2-set2:     [PASS][123] -> [SKIP][124] ([Intel XE#1201] / [Intel XE#1211])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_pm_rpm@universal-planes-dpms.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1201]) +14 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-1/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#929]) +15 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1127] / [Intel XE#1201])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#330])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][131] -> [FAIL][132] ([Intel XE#899])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * {igt@kms_vblank@query-forked-busy@pipe-a-edp-2} (NEW):
>     - {shard-lnl}:        NOTRUN -> [DMESG-WARN][133] ([Intel XE#1537])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-3/igt@kms_vblank@query-forked-busy@pipe-a-edp-2.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_ccs@block-copy-uncompressed:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][135] ([Intel XE#1619]) +3 other tests dmesg-fail
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@xe_ccs@block-copy-uncompressed.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][136] ([Intel XE#1317])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1126] / [Intel XE#1201])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-threads-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#1201] / [Intel XE#261]) +6 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@xe_evict@evict-beng-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][141] -> [TIMEOUT][142] ([Intel XE#1473] / [Intel XE#392])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-small-multi-vm-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@xe_evict@evict-small-multi-vm-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1201] / [Intel XE#688])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#1201] / [Intel XE#1392]) +6 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
>     - shard-adlp:         [PASS][147] -> [DMESG-FAIL][148] ([Intel XE#1069] / [Intel XE#1619])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-9/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#1201] / [Intel XE#979])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][150] ([Intel XE#1173]) +1 other test fail
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@d3-mmap-vram:
>     - shard-dg2-set2:     [PASS][151] -> [FAIL][152] ([Intel XE#1221])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@xe_pm@d3-mmap-vram.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@xe_pm@d3-mmap-vram.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [PASS][153] -> [DMESG-WARN][154] ([Intel XE#1162] / [Intel XE#1214])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_render_copy@render-vstripes:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1201]) +2 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@xe_render_copy@render-vstripes.html
> 
>   * igt@xe_vm@large-misaligned-binds-268435456:
>     - shard-adlp:         [PASS][157] -> [DMESG-FAIL][158] ([Intel XE#1088] / [Intel XE#1330])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@xe_vm@large-misaligned-binds-268435456.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@xe_vm@large-misaligned-binds-268435456.html
> 
>   * igt@xe_vm@large-userptr-split-binds-67108864:
>     - shard-adlp:         [PASS][159] -> [DMESG-FAIL][160] ([Intel XE#1619]) +2 other tests dmesg-fail
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@xe_vm@large-userptr-split-binds-67108864.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@xe_vm@large-userptr-split-binds-67108864.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_getversion@basic:
>     - shard-dg2-set2:     [FAIL][161] -> [PASS][162]
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@core_getversion@basic.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@core_getversion@basic.html
> 
>   * igt@kms_atomic@test-only:
>     - shard-adlp:         [DMESG-WARN][163] ([Intel XE#1214]) -> [PASS][164] +3 other tests pass
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_atomic@test-only.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_atomic@test-only.html
> 
>   * igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1:
>     - {shard-lnl}:        [DMESG-WARN][165] ([Intel XE#324]) -> [PASS][166] +1 other test pass
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-8/igt@kms_atomic_interruptible@legacy-cursor@pipe-a-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][167] ([Intel XE#1388]) -> [PASS][168] +1 other test pass
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - {shard-lnl}:        [DMESG-FAIL][169] ([Intel XE#1619]) -> [PASS][170] +2 other tests pass
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_color@ctm-0-25@pipe-d:
>     - shard-adlp:         [INCOMPLETE][171] ([Intel XE#1195]) -> [PASS][172] +3 other tests pass
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_color@ctm-0-25@pipe-d.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_color@ctm-0-25@pipe-d.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - {shard-lnl}:        [DMESG-WARN][173] ([Intel XE#1595]) -> [PASS][174] +1 other test pass
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_edge_walk@128x128-left-edge:
>     - shard-adlp:         [FAIL][175] ([Intel XE#581]) -> [PASS][176]
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-left-edge.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_cursor_edge_walk@128x128-left-edge.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][177] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][178]
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][179] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][180]
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [i915#2575]) -> [PASS][182] +107 other tests pass
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1:
>     - {shard-lnl}:        [DMESG-WARN][183] ([Intel XE#1330]) -> [PASS][184] +5 other tests pass
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-8/igt@kms_flip@absolute-wf_vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@basic-plain-flip:
>     - {shard-lnl}:        [DMESG-WARN][185] ([Intel XE#1330] / [Intel XE#1537]) -> [PASS][186]
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@kms_flip@basic-plain-flip.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-3/igt@kms_flip@basic-plain-flip.html
>     - shard-adlp:         [DMESG-WARN][187] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330]) -> [PASS][188]
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_flip@basic-plain-flip.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_flip@basic-plain-flip.html
> 
>   * igt@kms_flip@dpms-off-confusion-interruptible:
>     - shard-adlp:         [SKIP][189] ([Intel XE#1201]) -> [PASS][190] +5 other tests pass
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201]) -> [PASS][192] +240 other tests pass
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         [FAIL][193] ([Intel XE#616]) -> [PASS][194] +1 other test pass
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-rte:
>     - shard-adlp:         [DMESG-FAIL][195] ([Intel XE#1619]) -> [PASS][196] +4 other tests pass
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
> 
>   * igt@kms_plane_alpha_blend@alpha-7efc:
>     - {shard-lnl}:        [DMESG-WARN][197] ([Intel XE#1603]) -> [PASS][198]
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-7efc.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-3/igt@kms_plane_alpha_blend@alpha-7efc.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64:
>     - {shard-lnl}:        [FAIL][199] ([Intel XE#1471]) -> [PASS][200] +1 other test pass
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-1/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-64.html
> 
>   * igt@kms_pm_rpm@drm-resources-equal:
>     - shard-adlp:         [SKIP][201] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][202]
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html
>     - {shard-lnl}:        [SKIP][203] ([Intel XE#1211]) -> [PASS][204]
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_pm_rpm@drm-resources-equal.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [FAIL][207] ([Intel XE#899]) -> [PASS][208]
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_universal_plane@universal-plane-pageflip-windowed:
>     - shard-adlp:         [SKIP][209] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][210] +1 other test pass
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_universal_plane@universal-plane-pageflip-windowed.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-1/igt@kms_universal_plane@universal-plane-pageflip-windowed.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][211] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][212]
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4:
>     - shard-dg2-set2:     [DMESG-WARN][213] ([Intel XE#1214]) -> [PASS][214]
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-dp-4.html
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1:
>     - {shard-lnl}:        [SKIP][215] -> [PASS][216] +2 other tests pass
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-edp-1.html
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1:
>     - shard-adlp:         [SKIP][217] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][218] +1 other test pass
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][219] ([Intel XE#1473] / [Intel XE#821]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][221] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][222] +1 other test pass
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@xe_evict@evict-threads-large.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
>     - shard-adlp:         [ABORT][223] ([Intel XE#1304]) -> [PASS][224]
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr:
>     - {shard-lnl}:        [INCOMPLETE][225] ([Intel XE#1330]) -> [PASS][226]
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_exec_fault_mode@many-bindexecqueue-userptr.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-invalid-fault:
>     - {shard-lnl}:        [INCOMPLETE][227] -> [PASS][228] +3 other tests pass
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_exec_fault_mode@many-invalid-fault.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-basic-prefetch:
>     - {shard-lnl}:        [DMESG-FAIL][229] ([Intel XE#1537]) -> [PASS][230]
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@xe_exec_fault_mode@twice-basic-prefetch.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-8/igt@xe_exec_fault_mode@twice-basic-prefetch.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race:
>     - {shard-lnl}:        [DMESG-FAIL][231] ([Intel XE#1069] / [Intel XE#1619]) -> [PASS][232]
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-7/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
>     - shard-adlp:         [DMESG-FAIL][233] ([Intel XE#1069] / [Intel XE#1619]) -> [PASS][234]
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr:
>     - {shard-lnl}:        [FAIL][235] ([Intel XE#1256]) -> [PASS][236]
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - {shard-lnl}:        [FAIL][237] -> [PASS][238]
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_gt_freq@freq_low_max.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-6/igt@xe_gt_freq@freq_low_max.html
>     - shard-adlp:         [FAIL][239] ([Intel XE#1204]) -> [PASS][240]
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_gt_freq@freq_low_max.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@xe_gt_freq@freq_low_max.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-adlp:         [DMESG-WARN][241] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][242]
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-adlp:         [SKIP][243] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][244]
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_live_ktest@xe_dma_buf.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf.html
>     - {shard-lnl}:        [SKIP][245] ([Intel XE#1647]) -> [PASS][246]
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_live_ktest@xe_dma_buf.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_pat@pat-index-all:
>     - {shard-lnl}:        [DMESG-WARN][247] -> [PASS][248] +1 other test pass
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-7/igt@xe_pat@pat-index-all.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-6/igt@xe_pat@pat-index-all.html
> 
>   * igt@xe_vm@large-userptr-split-misaligned-binds-2097152:
>     - {shard-lnl}:        [DMESG-WARN][249] ([Intel XE#1537]) -> [PASS][250]
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-lnl-6/igt@xe_vm@large-userptr-split-misaligned-binds-2097152.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-lnl-8/igt@xe_vm@large-userptr-split-misaligned-binds-2097152.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-adlp:         [INCOMPLETE][251] ([Intel XE#1195]) -> [ABORT][252] ([Intel XE#1538] / [Intel XE#1689])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html
>     - shard-dg2-set2:     [DMESG-FAIL][253] ([Intel XE#1548]) -> [SKIP][254] ([Intel XE#1201]) +1 other test skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@core_setmaster@master-drop-set-root:
>     - shard-dg2-set2:     [FAIL][255] -> [DMESG-WARN][256] ([Intel XE#1214])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][258] ([Intel XE#1201] / [i915#2575])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [SKIP][259] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][260] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][262] ([Intel XE#1201]) +4 other tests skip
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#1201]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-adlp:         [SKIP][265] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][266] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
>     - shard-adlp:         [FAIL][267] ([Intel XE#616]) -> [DMESG-FAIL][268] ([Intel XE#1619])
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][270] ([Intel XE#1201])
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         [FAIL][271] ([Intel XE#616]) -> [SKIP][272] ([Intel XE#1201] / [Intel XE#829])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201]) -> [SKIP][274] ([Intel XE#1124] / [Intel XE#1201]) +16 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201]) -> [SKIP][276] ([Intel XE#1201] / [Intel XE#607])
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#610])
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][279] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][280] ([Intel XE#1201]) +17 other tests skip
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][281] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][282] ([Intel XE#1201])
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_big_joiner@basic.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#346])
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_big_joiner@invalid-modeset.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][286] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [i915#2575]) -> [SKIP][288] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
>     - shard-adlp:         [SKIP][289] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#829])
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][292] ([Intel XE#1201]) +17 other tests skip
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][293] ([Intel XE#1201]) -> [SKIP][294] ([Intel XE#1201] / [Intel XE#1252])
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201]) -> [SKIP][296] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +16 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-adlp:         [SKIP][297] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][298] ([Intel XE#1201] / [Intel XE#829])
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
>     - shard-adlp:         [SKIP][299] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][300] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [FAIL][301] ([Intel XE#616]) -> [SKIP][302] ([Intel XE#1201])
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201]) -> [SKIP][304] ([Intel XE#1201] / [Intel XE#314])
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][305] ([Intel XE#1201] / [i915#2575]) -> [SKIP][306] ([Intel XE#1201] / [Intel XE#306])
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][307] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][308] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_chamelium_color@ctm-limited-range.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-adlp:         [SKIP][309] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][310] ([Intel XE#1201])
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-adlp:         [SKIP][311] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][312] ([Intel XE#1201]) +1 other test skip
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     [SKIP][313] ([Intel XE#1201] / [i915#2575]) -> [SKIP][314] ([Intel XE#1201] / [Intel XE#373]) +18 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-adlp:         [SKIP][315] ([Intel XE#1201]) -> [SKIP][316] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][318] ([Intel XE#1201] / [i915#2575]) +12 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][319] ([Intel XE#1201] / [i915#2575]) -> [SKIP][320] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     [FAIL][321] ([Intel XE#1178]) -> [SKIP][322] ([Intel XE#1201] / [i915#2575])
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_content_protection@legacy.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     [FAIL][323] ([Intel XE#1204]) -> [SKIP][324] ([Intel XE#1201] / [i915#2575])
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_content_protection@lic-type-0.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201] / [i915#2575]) -> [SKIP][326] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][327] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][328] ([Intel XE#1201] / [i915#2575]) +1 other test skip
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-dg2-set2:     [SKIP][329] ([Intel XE#1201] / [i915#2575]) -> [DMESG-FAIL][330] ([Intel XE#1162])
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_crc@cursor-suspend.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html
>     - shard-adlp:         [DMESG-WARN][331] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][332] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201] / [i915#2575]) -> [SKIP][334] ([Intel XE#1201] / [Intel XE#323]) +2 other tests skip
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][335] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [SKIP][336] ([Intel XE#1201] / [i915#2575])
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - shard-dg2-set2:     [SKIP][337] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][338] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-adlp:         [SKIP][339] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][340] ([Intel XE#1201]) +1 other test skip
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][341] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][342] ([Intel XE#1201] / [i915#2575]) +4 other tests skip
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][343] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][344] ([Intel XE#1201] / [i915#2575]) +1 other test skip
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@single-bo:
>     - shard-dg2-set2:     [DMESG-WARN][345] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][346] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877])
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_cursor_legacy@single-bo.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_cursor_legacy@single-bo.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2-set2:     [SKIP][347] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][348] ([Intel XE#1201]) +5 other tests skip
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][349] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][350] ([Intel XE#1201] / [i915#2575])
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_feature_discovery@chamelium.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][351] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][352] ([Intel XE#1201] / [i915#2575])
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][353] ([Intel XE#1201] / [i915#2575]) -> [SKIP][354] ([Intel XE#1137] / [Intel XE#1201])
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_feature_discovery@dp-mst.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-dg2-set2:     [SKIP][355] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][356] ([Intel XE#1214])
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][357] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][358] ([Intel XE#1195] / [Intel XE#927])
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][359] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][360] ([Intel XE#1195])
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-adlp:         [SKIP][361] ([Intel XE#1201]) -> [SKIP][362] ([Intel XE#1201] / [Intel XE#455])
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][363] ([Intel XE#1201]) -> [SKIP][364] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-adlp:         [SKIP][365] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][366] ([Intel XE#1201]) +2 other tests skip
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201]) -> [SKIP][368] ([Intel XE#1201] / [Intel XE#651]) +40 other tests skip
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][369] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][370] ([Intel XE#1201]) +39 other tests skip
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         [INCOMPLETE][371] ([Intel XE#1195]) -> [FAIL][372] ([Intel XE#616])
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2-set2:     [SKIP][373] ([Intel XE#1201]) -> [FAIL][374] ([Intel XE#616])
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][375] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][376] ([Intel XE#1201])
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-adlp:         [SKIP][377] ([Intel XE#1201]) -> [SKIP][378] ([Intel XE#1201] / [Intel XE#651])
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-adlp:         [SKIP][379] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][380] ([Intel XE#1201]) +5 other tests skip
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][381] ([Intel XE#1201]) -> [SKIP][382] ([Intel XE#1158] / [Intel XE#1201])
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         [SKIP][383] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][384] ([Intel XE#1201]) +3 other tests skip
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][385] ([Intel XE#1201]) -> [SKIP][386] ([Intel XE#1201] / [Intel XE#653]) +35 other tests skip
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][387] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][388] ([Intel XE#1201]) +35 other tests skip
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][389] ([Intel XE#1201] / [i915#2575]) -> [SKIP][390] ([Intel XE#1201] / [Intel XE#417])
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2-set2:     [SKIP][391] ([Intel XE#1201] / [i915#2575]) -> [FAIL][392] ([Intel XE#616])
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_hdr@static-toggle-suspend.html
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-adlp:         [DMESG-WARN][393] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][394] ([Intel XE#1195] / [Intel XE#927])
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][395] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][396] ([Intel XE#1195])
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane@pixel-format:
>     - shard-dg2-set2:     [FAIL][397] ([Intel XE#650]) -> [SKIP][398] ([Intel XE#1201] / [i915#2575])
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_plane@pixel-format.html
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_plane@pixel-format.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         [INCOMPLETE][399] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927]) -> [SKIP][400] ([Intel XE#1201] / [Intel XE#829])
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html
>     - shard-dg2-set2:     [FAIL][401] ([Intel XE#616]) -> [SKIP][402] ([Intel XE#1201] / [i915#2575]) +1 other test skip
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-adlp:         [FAIL][403] ([Intel XE#361]) -> [SKIP][404] ([Intel XE#1201] / [Intel XE#455])
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_plane_scaling@intel-max-src-size.html
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-6/igt@kms_plane_scaling@intel-max-src-size.html
>     - shard-dg2-set2:     [FAIL][405] ([Intel XE#361]) -> [SKIP][406] ([Intel XE#1201] / [Intel XE#455])
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][407] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][408] ([Intel XE#1201] / [i915#2575])
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][409] ([Intel XE#1201] / [i915#2575]) -> [SKIP][410] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>     - shard-dg2-set2:     [TIMEOUT][411] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][412] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [TIMEOUT][413] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][414] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][415] ([Intel XE#1201] / [i915#2575]) -> [INCOMPLETE][416] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
>     - shard-dg2-set2:     [TIMEOUT][417] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909]) -> [SKIP][418] ([Intel XE#1201] / [i915#2575])
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][419] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][420] ([Intel XE#1201] / [i915#2575]) +1 other test skip
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][421] ([Intel XE#1201] / [i915#2575]) -> [SKIP][422] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][423] ([Intel XE#1201]) -> [SKIP][424] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     [SKIP][425] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][426] ([Intel XE#1201]) +1 other test skip
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][427] ([Intel XE#1201]) -> [SKIP][428] ([Intel XE#1122] / [Intel XE#1201])
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][429] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][430] ([Intel XE#1201]) +1 other test skip
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][431] ([Intel XE#1201]) -> [SKIP][432] ([Intel XE#1201] / [Intel XE#908])
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-dg2-set2:     [SKIP][433] ([Intel XE#1201] / [Intel XE#1211]) -> [SKIP][434] ([Intel XE#1201])
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][435] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][436] ([Intel XE#1201])
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-dg2-set2:     [SKIP][437] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][438] ([Intel XE#1201]) +26 other tests skip
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][439] ([Intel XE#1201]) -> [SKIP][440] ([Intel XE#1201] / [Intel XE#929]) +28 other tests skip
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_psr@psr-dpms.html
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-adlp:         [SKIP][441] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][442] ([Intel XE#1201]) +2 other tests skip
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-2/igt@kms_psr@psr2-suspend.html
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][443] ([Intel XE#1201]) -> [SKIP][444] ([Intel XE#1149] / [Intel XE#1201])
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][445] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][446] ([Intel XE#1201])
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     [SKIP][447] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][448] ([Intel XE#1201] / [i915#2575]) +1 other test skip
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][449] ([Intel XE#1201] / [i915#2575]) -> [SKIP][450] ([Intel XE#1127] / [Intel XE#1201])
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][451] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][452] ([Intel XE#1201] / [i915#2575]) +1 other test skip
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][453] ([Intel XE#1201] / [i915#2575]) -> [SKIP][454] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-dg2-set2:     [SKIP][455] ([Intel XE#1201] / [i915#2575]) -> [SKIP][456] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_scaling_modes@scaling-mode-full.html
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-adlp:         [SKIP][457] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][458] ([Intel XE#1201] / [Intel XE#578])
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@kms_setmode@basic-clone-single-crtc.html
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][459] ([Intel XE#1201]) -> [SKIP][460] ([Intel XE#1201] / [i915#2575])
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][461] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][462] ([Intel XE#1201] / [i915#2575])
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-dg2-set2:     [SKIP][463] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][464] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][465] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][466] ([Intel XE#1201] / [i915#2575]) +8 other tests skip
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@kms_vrr@flip-dpms.html
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-adlp:         [SKIP][467] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][468] ([Intel XE#1201]) +3 other tests skip
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-4/igt@kms_vrr@negative-basic.html
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-9/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][469] ([Intel XE#1201] / [i915#2575]) -> [SKIP][470] ([Intel XE#1201] / [Intel XE#756])
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-set2:     [SKIP][471] ([Intel XE#1201] / [i915#2575]) -> [SKIP][472] ([Intel XE#1091] / [Intel XE#1201])
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@sriov_basic@bind-unbind-vf.html
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     [SKIP][473] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][474] ([Intel XE#1201] / [i915#2575])
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-dg2-set2:     [FAIL][475] ([Intel XE#1050]) -> [SKIP][476] ([Intel XE#1201])
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-463/igt@xe_compute@ccs-mode-basic.html
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-dg2-set2:     [SKIP][477] ([Intel XE#1201]) -> [FAIL][478] ([Intel XE#1050])
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_compute@ccs-mode-compute-kernel.html
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     [SKIP][479] ([Intel XE#1201]) -> [FAIL][480] ([Intel XE#1317])
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt:
>     - shard-dg2-set2:     [SKIP][481] ([Intel XE#1201]) -> [SKIP][482] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455])
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][483] ([Intel XE#1201]) -> [SKIP][484] ([Intel XE#1123] / [Intel XE#1201])
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][485] ([Intel XE#1201]) -> [SKIP][486] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][487] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][488] ([Intel XE#1201])
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [SKIP][489] ([Intel XE#1201]) -> [DMESG-FAIL][490] ([Intel XE#821])
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [SKIP][491] ([Intel XE#1201]) -> [INCOMPLETE][492] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
>     - shard-dg2-set2:     [SKIP][493] ([Intel XE#1201]) -> [SKIP][494] ([Intel XE#1201] / [Intel XE#288]) +21 other tests skip
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][495] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][496] ([Intel XE#1201]) +24 other tests skip
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-adlp:         [DMESG-WARN][497] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330]) -> [DMESG-WARN][498] ([Intel XE#1214])
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-2/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - shard-dg2-set2:     [FAIL][499] ([Intel XE#1045] / [Intel XE#1204]) -> [SKIP][500] ([Intel XE#1201])
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@xe_gt_freq@freq_low_max.html
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@xe_gt_freq@freq_low_max.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][501] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][502] ([Intel XE#1201])
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     [SKIP][503] ([Intel XE#1061] / [Intel XE#1201]) -> [FAIL][504] ([Intel XE#1173]) +1 other test fail
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_peer2peer@read.html
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3-mmap-system:
>     - shard-adlp:         [FAIL][505] ([Intel XE#1221]) -> [FAIL][506] ([Intel XE#1257])
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-6/igt@xe_pm@d3-mmap-system.html
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-8/igt@xe_pm@d3-mmap-system.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][507] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][508] ([Intel XE#1201])
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-adlp:         [FAIL][509] ([Intel XE#1257]) -> [INCOMPLETE][510] ([Intel XE#1195] / [Intel XE#1358])
>    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-adlp-8/igt@xe_pm@s3-basic.html
>    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-adlp-1/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][511] ([Intel XE#1201]) -> [SKIP][512] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
>    [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-dg2-set2:     [FAIL][513] ([Intel XE#1043] / [Intel XE#845]) -> [SKIP][514] ([Intel XE#1201])
>    [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-466/igt@xe_pm@s4-basic.html
>    [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-dg2-set2:     [SKIP][515] ([Intel XE#1201]) -> [FAIL][516] ([Intel XE#1043] / [Intel XE#845])
>    [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_pm@s4-basic-exec.html
>    [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-435/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     [SKIP][517] ([Intel XE#1201]) -> [SKIP][518] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
>    [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-436/igt@xe_query@multigpu-query-config.html
>    [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-433/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     [SKIP][519] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][520] ([Intel XE#1201]) +3 other tests skip
>    [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf/shard-dg2-435/igt@xe_query@multigpu-query-cs-cycles.html
>    [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>   [Intel XE#1257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
>   [Intel XE#1317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1317
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
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
>   [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
>   [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
>   [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>   [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
>   [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
>   [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1646]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646
>   [Intel XE#1647]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1647
>   [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
>   [Intel XE#1689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689
>   [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/578
>   [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7818 -> IGT_7819
>   * Linux: xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf -> xe-pw-132777v1
> 
>   IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7819: 98e0d03839ce31141328a2935eb193361eca61e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1162-e1dc9638bb47a28181fee1a9a180445ca2a8b9cf: e1dc9638bb47a28181fee1a9a180445ca2a8b9cf
>   xe-pw-132777v1: 132777v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132777v1/index.html
> 
