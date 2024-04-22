Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38F5C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 17:35:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972CF112C96;
	Mon, 22 Apr 2024 17:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mc6x40vg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8437E10FCFB
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 17:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713807325; x=1745343325;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1ys6whswVT3xJYlWIk4ixdHPjXcgm7OWXDLXamm0Pf8=;
 b=Mc6x40vgfWu6UDQfmNzJK+AZzvNK5Sog6kuRFxKOccY12lwQDk0APBRr
 LdT17ig6LBOx6a1FE5x8CjgQiKFXb3RwGUVTFJQn/NTz2vRQMYef+8dLW
 yK2Pw54E8nFsb8L70dV6Nwi7DdaoR9AEG1JzXdEF2JQAMx8RxuXQLNoT0
 1w2clmP+GcDoqzxCuWYUKqC0IG/rrXCsrHqNeZiNfYmaunYlkA4ocjOwk
 ar3F0zuteJet0ubdI55OEDjhEiOtcYauebzv+3CuXtbKoUeu2jCf+Iibx
 1cxwEBq2EOdjRQ3mzli5UBnwzqOIgbvgbMfAsvrmP8aztH5Ck/LZCVMeB Q==;
X-CSE-ConnectionGUID: 9NKmqNZqQcOdmUXheL0G7A==
X-CSE-MsgGUID: gNdE4NtwQtGNgxV2KRGssw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13147525"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="13147525"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:35:23 -0700
X-CSE-ConnectionGUID: GDwrtXDhQLGOSccWZElb4A==
X-CSE-MsgGUID: x2MynigRQsid/cSDamZREA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="61525641"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 22 Apr 2024 10:35:18 -0700
Received: from [10.252.63.74] (mwajdecz-MOBL.ger.corp.intel.com [10.252.63.74])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1CAD228790
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 18:35:13 +0100 (IST)
Message-ID: <1d0fd3ee-edf7-4c21-a030-ac32f057e6b1@intel.com>
Date: Mon, 22 Apr 2024 19:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_Fix?=
 =?UTF-8?B?IHhlX2d0X3NyaW92X3BmX2NvbmZpZ19wcmludF9hdmFpbGFibGVfZ2d0dCgp?=
To: intel-xe@lists.freedesktop.org
References: <20240419141000.314-1-michal.wajdeczko@intel.com>
 <171368605774.1553548.7471133014322587263@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171368605774.1553548.7471133014322587263@8e613ede5ea5>
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



On 21.04.2024 09:54, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Fix xe_gt_sriov_pf_config_print_available_ggtt()
> URL   : https://patchwork.freedesktop.org/series/132647/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c_full -> xe-pw-132647v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-132647v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-132647v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-132647v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_vm@munmap-style-unbind-userptr-all:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][1] +2 other tests dmesg-fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-6/igt@xe_vm@munmap-style-unbind-userptr-all.html

unrelated, series touches SRIOV code that is inactive on ADLP

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-132647v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][2] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#1201] / [Intel XE#316])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][4] ([Intel XE#1204])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#346])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#787]) +23 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +32 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#787]) +106 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][14] ([Intel XE#650]) +15 other tests fail
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][15] ([Intel XE#616]) +9 other tests fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#1178]) +1 other test fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-463/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x64:
>     - shard-adlp:         NOTRUN -> [FAIL][21] ([Intel XE#1598])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-64x64.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][22] -> [DMESG-WARN][23] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-edge:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][24] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_cursor_edge_walk@256x256-top-edge.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#309])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1195])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2-set2:     [PASS][29] -> [SKIP][30] ([Intel XE#1201])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-435/igt@kms_dp_aux_dev.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#702])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1137] / [Intel XE#1201])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#310]) +5 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][34] ([Intel XE#1214] / [Intel XE#1608]) +3 other tests dmesg-warn
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][37] ([Intel XE#324]) +2 other tests dmesg-fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][38] -> [FAIL][39] ([Intel XE#616]) +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#656]) +24 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1151] / [Intel XE#1201])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#658])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#653]) +17 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     [PASS][47] -> [DMESG-WARN][48] ([Intel XE#1214]) +2 other tests dmesg-warn
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][49] ([Intel XE#1214])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a-hdmi-a-2:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][50] ([Intel XE#1195]) +1 other test incomplete
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1122] / [Intel XE#1201])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1129] / [Intel XE#1201])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#1211])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#1211])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201]) +3 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-463/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr2-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_psr@psr2-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1127] / [Intel XE#1201])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1127] / [Intel XE#1201])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#327])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#327])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#756])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#1447])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][64] ([Intel XE#1050])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1123] / [Intel XE#1201]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][66] ([Intel XE#1473] / [Intel XE#392] / [Intel XE#931])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-large-multi-vm:
>     - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1195] / [Intel XE#1473])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-464/igt@xe_evict@evict-cm-threads-large-multi-vm.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-433/igt@xe_evict@evict-cm-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-cm-threads-small:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@xe_evict@evict-cm-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][71] -> [TIMEOUT][72] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-434/igt@xe_evict@evict-threads-large.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-simple:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#688])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#1392]) +5 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][77] -> [TIMEOUT][78] ([Intel XE#1261] / [Intel XE#1356] / [Intel XE#402])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-cm-fd-basic:
>     - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) +1 other test timeout
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-464/igt@xe_exec_threads@threads-cm-fd-basic.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-433/igt@xe_exec_threads@threads-cm-fd-basic.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][81] -> [INCOMPLETE][82] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356]) +1 other test incomplete
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#1337])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#366])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][85] ([Intel XE#1162] / [Intel XE#1214])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][86] ([Intel XE#1191] / [Intel XE#1214]) +3 other tests dmesg-warn
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][87] ([Intel XE#1043] / [Intel XE#845])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-8/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#944])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][90] ([Intel XE#827]) -> [PASS][91] +1 other test pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][92] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][93] +3 other tests pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][94] ([Intel XE#616]) -> [PASS][95] +4 other tests pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [FAIL][96] ([Intel XE#771] / [Intel XE#899]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][98] ([Intel XE#899]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][100] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][102] ([Intel XE#1473]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-small:
>     - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][105] +1 other test pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-464/igt@xe_evict@evict-beng-threads-small.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-small.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-dg2-set2:     [DMESG-WARN][106] ([Intel XE#1214] / [Intel XE#1329]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-434/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-fd-userptr:
>     - shard-dg2-set2:     [TIMEOUT][108] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][109] +1 other test pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-adlp:         [ABORT][110] ([Intel XE#1538] / [Intel XE#1689]) -> [INCOMPLETE][111] ([Intel XE#1195])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-4/igt@core_hotunplug@hotreplug.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-1/igt@core_hotunplug@hotreplug.html
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-adlp:         [ABORT][112] ([Intel XE#1689]) -> [INCOMPLETE][113] ([Intel XE#1195] / [Intel XE#1365])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-2/igt@core_hotunplug@hotunplug-rescan.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-9/igt@core_hotunplug@hotunplug-rescan.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][114] ([Intel XE#1231]) -> [FAIL][115] ([Intel XE#1242])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][116] ([Intel XE#616]) -> [DMESG-FAIL][117] ([Intel XE#1162]) +1 other test dmesg-fail
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [INCOMPLETE][118] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][119] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-adlp:         [INCOMPLETE][120] ([Intel XE#1195]) -> [DMESG-WARN][121] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][122] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][123] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-adlp:         [DMESG-WARN][124] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][125] ([Intel XE#1191] / [Intel XE#1214])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-adlp:         [INCOMPLETE][126] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][127] ([Intel XE#1191] / [Intel XE#1214])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][128] ([Intel XE#1195]) -> [DMESG-WARN][129] ([Intel XE#1191] / [Intel XE#1214])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 
>   * igt@xe_exec_compute_mode@once-bindexecqueue-rebind:
>     - shard-adlp:         [DMESG-FAIL][130] ([Intel XE#1069]) -> [FAIL][131] ([Intel XE#1069])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-4/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-1/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-adlp:         [DMESG-WARN][132] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][133] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-9/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-adlp:         [DMESG-WARN][134] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][135] ([Intel XE#1195] / [Intel XE#1358])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-8/igt@xe_pm@s3-basic.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-1/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_vm@mixed-userptr-misaligned-binds-1611661312:
>     - shard-adlp:         [INCOMPLETE][136] ([Intel XE#1195] / [Intel XE#1330]) -> [DMESG-FAIL][137] ([Intel XE#1088] / [Intel XE#1330])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c/shard-adlp-9/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/shard-adlp-6/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
>   [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>   [Intel XE#1598]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1598
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c -> xe-pw-132647v1
> 
>   IGT_7814: 7814
>   xe-1126-1f18c620ffc926ec06a545e501848ec9d5e1270c: 1f18c620ffc926ec06a545e501848ec9d5e1270c
>   xe-pw-132647v1: 132647v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132647v1/index.html
> 
