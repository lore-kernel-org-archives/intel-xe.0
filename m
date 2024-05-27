Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAF2C25B78
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 16:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61E610E240;
	Mon, 27 May 2024 16:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dfnypfQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0296E10E240
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716826416; x=1748362416;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=82ht8c35bw47QMRvwZngYCL2vaZvoq4jd52WHH7QsxY=;
 b=dfnypfQiqcKJXgz+6zZd+N0YQs8mI7T1yMyVLMnPvt8V/BJ0oDgXeFtB
 UB9RORMc70C1Yri3YO7jthAO7jH757DVH+y6f912w+s25dzCRjZHa/FZc
 n+sMCHdUXZ23Av1M7Qrpvjz7V5Pr0fPZjPgVYrueKNtuHAR7v3cE/bYyE
 Hb22Rnxaicyj7YbYvTrFB0V62Zce2RRnDFFUmkBpb0UIgcFDw+tq5oY+E
 hdVuIGJJoODzMEoTCNYargHf5gMFCF5Cn9MWitwz1yLcIkb05CDdCP1bT
 UBvpF0Px8vT4LRSJ5yEzJq5dLP4EGaDK+O70ejag0/y4RZu0l6TxcztR7 g==;
X-CSE-ConnectionGUID: 4RmcWXVAQIOS5ragq3lOIA==
X-CSE-MsgGUID: GSOhppv6RXK4cfCaDryyuA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="12981595"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="12981595"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 09:13:35 -0700
X-CSE-ConnectionGUID: mUtdYmVGThifyj9oOINbsg==
X-CSE-MsgGUID: 30pViXu9QlCfXFN4vIny7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="39245857"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 27 May 2024 09:13:32 -0700
Received: from [10.246.33.240] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.33.240])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id AA69F332BA
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 17:13:31 +0100 (IST)
Message-ID: <5827c515-87d7-46b3-bd81-07fa72f25d73@intel.com>
Date: Mon, 27 May 2024 18:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_VF=3A_Use_only_a?=
 =?UTF-8?Q?ssigned_GGTT_region_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240524113714.932-1-michal.wajdeczko@intel.com>
 <171681483995.2212914.6991481060784006379@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171681483995.2212914.6991481060784006379@8e613ede5ea5>
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



On 27.05.2024 15:00, Patchwork wrote:
> == Series Details ==
> 
> Series: VF: Use only assigned GGTT region (rev2)
> URL   : https://patchwork.freedesktop.org/series/134016/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef_full -> xe-pw-134016v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134016v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134016v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-134016v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated to this series

> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html

<7>[  127.228787] [IGT] xe_exec_reset: starting subtest cm-cat-error
<7>[  127.232144] xe 0000:00:02.0:
[drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] Engine memory cat
error: guc_id=2
...
<3>[  128.233449] xe 0000:00:02.0: [drm] *ERROR* GuC engine reset
request failed on 0:0 because 0x00000000
<6>[  128.234325] xe 0000:00:02.0: [drm] GT0: trying reset

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - {shard-lnl}:        NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-lnl-7/igt@xe_pm@d3cold-mmap-vram.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134016v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#1125] / [Intel XE#1201])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] ([Intel XE#1033] / [Intel XE#1214])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1124] / [Intel XE#1201]) +13 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][7] ([Intel XE#324])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][9] ([Intel XE#1231]) +1 other test fail
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#619])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#610])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +35 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +53 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#373]) +13 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#308])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_edge_walk@128x128-right-edge:
>     - shard-adlp:         NOTRUN -> [FAIL][18] ([Intel XE#581])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_cursor_edge_walk@128x128-right-edge.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#776]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#702])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#703])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#310]) +10 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         [PASS][24] -> [DMESG-WARN][25] ([Intel XE#1214] / [Intel XE#1608])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [ABORT][26] ([Intel XE#1939]) +1 other test abort
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][28] ([Intel XE#1861])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#656]) +46 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201]) +38 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-adlp:         NOTRUN -> [FAIL][32] ([Intel XE#1874]) +9 other tests fail
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#836])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_prop_blob@blob-prop-validate:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#780])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_prop_blob@blob-prop-validate.html
> 
>   * igt@kms_psr@psr-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#929]) +20 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_psr@psr-suspend.html
> 
>   * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][40] ([Intel XE#294]) +1 other test fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1127] / [Intel XE#1201])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#829]) +5 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#362])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#330])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][46] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][47] ([Intel XE#1214] / [Intel XE#1608]) +3 other tests dmesg-warn
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#455]) +38 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#756])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#1932]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#1447])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1123] / [Intel XE#1201])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +3 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-large-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#261]) +7 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@xe_evict@evict-large-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#688])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#1392]) +12 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#288]) +37 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind.html
> 
>   * igt@xe_exec_reset@cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][58] ([Intel XE#1214] / [Intel XE#1638] / [Intel XE#358])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@xe_exec_reset@cat-error.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][59] ([Intel XE#1214] / [Intel XE#1638])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [FAIL][60] ([Intel XE#1069])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-rebind.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#379])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#979])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][63] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s2idle-mocs:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][64] ([Intel XE#1195])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@xe_pm@s2idle-mocs.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][65] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-adlp:         NOTRUN -> [WARN][66] ([Intel XE#1639])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [PASS][67] -> [DMESG-WARN][68] ([Intel XE#1214])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#944]) +5 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][70] ([Intel XE#1214] / [Intel XE#1760])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][71] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][72] +1 other test pass
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - {shard-lnl}:        [FAIL][73] ([Intel XE#1659]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - {shard-lnl}:        [FAIL][75] ([Intel XE#480] / [Intel XE#886]) -> [PASS][76] +3 other tests pass
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - {shard-lnl}:        [DMESG-WARN][77] ([Intel XE#1830]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
>     - {shard-lnl}:        [ABORT][79] ([Intel XE#1939]) -> [PASS][80] +3 other tests pass
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
>     - {shard-lnl}:        [DMESG-WARN][81] ([Intel XE#1330]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-lnl-5/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-lnl-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][83] ([Intel XE#1761]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-lnl-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
> 
>   * igt@xe_pm_residency@idle-residency-on-exec:
>     - {shard-lnl}:        [TIMEOUT][85] ([Intel XE#1865]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-lnl-5/igt@xe_pm_residency@idle-residency-on-exec.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][87] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][88] ([Intel XE#1033] / [Intel XE#1214])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         [INCOMPLETE][89] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][90] ([Intel XE#1191] / [Intel XE#1214])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][91] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][92] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [INCOMPLETE][93] ([Intel XE#1195]) -> [DMESG-WARN][94] ([Intel XE#1214])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-adlp:         [DMESG-WARN][95] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1941]) -> [INCOMPLETE][96] ([Intel XE#1195] / [Intel XE#1349])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef/shard-adlp-8/igt@xe_pm_residency@gt-c6-freeze.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1639]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>   [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1865
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#1939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939
>   [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>   [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef -> xe-pw-134016v2
> 
>   IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1346-b85ab4525f327eceb3ce8df189992582cf5dedef: b85ab4525f327eceb3ce8df189992582cf5dedef
>   xe-pw-134016v2: 134016v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134016v2/index.html
> 
