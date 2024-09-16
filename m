Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFB8C3ABA2
	for <intel-xe@archiver.kernel.org>; Mon, 16 Sep 2024 10:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C10110E0A6;
	Mon, 16 Sep 2024 10:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsjRh+Cu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE64810E0A6
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726484373; x=1758020373;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NGjDTSV+XiNQoFyUUyT/tHjpyf71PIZY9CiswNK2P2E=;
 b=CsjRh+Cuxwh/orhVRfl6h/zTAYnF0abfHcTzvLPvrT7rxtLJUHLfjm/V
 v76EymMHXW51MOJ6q6qbfgfL1YeC+u4qKRRhuuoH+CSU86YOTonZh19LE
 pSm53yNyVgWAUU5S8E319AQGWd0yM5GgL0mc4353x0+6idU8uurzUaCHp
 dSt25CPRMpBOuiwELhwU1UQcIiI3lqEh9d6oKCUrfntKkaKAk6SKJQVCy
 VjQnrNKLiYZF9p23FbCMsycRuIOQ03RkJhXbCTCWdWYOW//gcTfE9/u3h
 8h1N/C9CjAO4Vu9sKSyuN7jkO9EFR1F3U7k3wPbsG+AS05rzuZqELCUK1 A==;
X-CSE-ConnectionGUID: t8FuYaA1TsaoA5VMGsXElQ==
X-CSE-MsgGUID: uOgE42l6TvuIQirOmc4JbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24789339"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="24789339"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 03:59:32 -0700
X-CSE-ConnectionGUID: IEc7RJxxRDKA53dumeeRow==
X-CSE-MsgGUID: G9pJVJ16Rk+MSLaKLaQuxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; d="scan'208";a="68449678"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 16 Sep 2024 03:59:27 -0700
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id AB11B2877B
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Sep 2024 11:59:26 +0100 (IST)
Message-ID: <c252f112-dd71-4a5c-9c30-1fc85790aa62@intel.com>
Date: Mon, 16 Sep 2024 12:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_PF=3A_Initial_su?=
 =?UTF-8?Q?pport_to_save/restore_VF_GuC_state_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240912203817.1880-1-michal.wajdeczko@intel.com>
 <172629773029.999065.10202165481627982057@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172629773029.999065.10202165481627982057@2413ebb6fbb6>
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



On 14.09.2024 09:08, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: Initial support to save/restore VF GuC state (rev2)
> URL   : https://patchwork.freedesktop.org/series/138609/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151_full -> xe-pw-138609v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138609v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138609v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-138609v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b:
>     - shard-lnl:          NOTRUN -> [SKIP][1] +3 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b.html
> 
>   * igt@xe_exec_threads@threads-userptr:
>     - shard-lnl:          [PASS][2] -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-8/igt@xe_exec_threads@threads-userptr.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-1/igt@xe_exec_threads@threads-userptr.html

<3> [284.182102] xe 0000:00:02.0: [drm] *ERROR* GT1: TLB invalidation
fence timeout, seqno=3943 recv=3942

but that's unrelated, since change is strictly PF specific, while there
is no SRIOV on LNL

> 
>   
> #### Warnings ####
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>     - shard-dg2-set2:     [SKIP][4] ([Intel XE#1201]) -> [SKIP][5] +2 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
>     - {shard-bmg}:        [FAIL][6] ([Intel XE#1288]) -> [DMESG-FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-bmg-3/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-bmg-4/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
>     - {shard-bmg}:        NOTRUN -> [INCOMPLETE][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-bmg-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-138609v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking:
>     - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#1701]) +1 other test fail
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#1659])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#316])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#316])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#2191])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1399])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2669]) +7 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#306])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][32] ([Intel XE#1195] / [Intel XE#2715])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#599])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#309])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#323])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1508] / [Intel XE#599])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1421])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1401] / [Intel XE#1745])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1401])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#455]) +11 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][43] -> [FAIL][44] ([Intel XE#1874]) +1 other test fail
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [FAIL][46] ([Intel XE#1861])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#656]) +5 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#656]) +13 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#651])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [PASS][53] -> [DMESG-WARN][54] ([Intel XE#324]) +3 other tests dmesg-warn
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-3/igt@kms_plane@plane-position-covered.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-5/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201]) +3 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#870])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#870])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#1430])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#836])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_psr@fbc-psr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_psr@fbc-psr-primary-page-flip.html
> 
>   * igt@kms_psr@pr-sprite-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@kms_psr@pr-sprite-blt.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-adlp:         NOTRUN -> [FAIL][64] ([Intel XE#1874])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#330])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][67] -> [FAIL][68] ([Intel XE#771] / [Intel XE#899])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-dg2-set2:     [PASS][69] -> [FAIL][70] ([Intel XE#771] / [Intel XE#899])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][71] -> [FAIL][72] ([Intel XE#899]) +1 other test fail
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#899]) +1 other test fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1123] / [Intel XE#1201])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1126] / [Intel XE#1201])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
>     - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#2667])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-7/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@xe_evict@evict-small-multi-vm.html
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#688]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@xe_evict@evict-small-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#688])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#1392])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#2360])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#2360])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#2229]) +1 other test skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>   * igt@xe_oa@mmio-triggered-reports@ccs-0:
>     - shard-lnl:          NOTRUN -> [FAIL][90] ([Intel XE#2249])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-5/igt@xe_oa@mmio-triggered-reports@ccs-0.html
> 
>   * igt@xe_oa@polling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#2541])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@xe_oa@polling.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1061] / [Intel XE#1201])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-lnl:          [PASS][93] -> [ABORT][94] ([Intel XE#1794])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#944])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@xe_query@multigpu-query-mem-usage.html
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#944])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@xe_query@multigpu-query-mem-usage.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][98] ([Intel XE#1033]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [FAIL][100] ([Intel XE#1426]) -> [PASS][101] +1 other test pass
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - {shard-bmg}:        [FAIL][102] ([Intel XE#1426]) -> [PASS][103] +3 other tests pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][104] ([Intel XE#1426]) -> [PASS][105] +3 other tests pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-lnl:          [FAIL][106] ([Intel XE#1659]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - {shard-bmg}:        [FAIL][108] ([Intel XE#2436]) -> [PASS][109] +1 other test pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x128:
>     - {shard-bmg}:        [INCOMPLETE][110] -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x128.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-bmg-4/igt@kms_cursor_crc@cursor-onscreen-128x128.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][112] ([Intel XE#877]) -> [PASS][113] +1 other test pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_flip@2x-plain-flip@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][114] -> [PASS][115] +1 other test pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_flip@2x-plain-flip@ab-hdmi-a6-dp4.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-435/igt@kms_flip@2x-plain-flip@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][116] ([Intel XE#1874]) -> [PASS][117] +3 other tests pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - {shard-bmg}:        [SKIP][118] ([Intel XE#1503]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_lease@page-flip-implicit-plane:
>     - shard-dg2-set2:     [INCOMPLETE][120] ([Intel XE#1195]) -> [PASS][121] +1 other test pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-463/igt@kms_lease@page-flip-implicit-plane.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-466/igt@kms_lease@page-flip-implicit-plane.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     [DMESG-WARN][122] ([Intel XE#1162]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     [DMESG-WARN][124] ([Intel XE#2019]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][126] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - {shard-bmg}:        [TIMEOUT][128] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race:
>     - {shard-bmg}:        [DMESG-WARN][130] ([Intel XE#877]) -> [PASS][131] +6 other tests pass
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-bmg-4/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [DMESG-FAIL][132] ([Intel XE#1620]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-lnl:          [ABORT][134] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html
>     - shard-adlp:         [ABORT][136] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [ABORT][138] ([Intel XE#1794]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#801]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#316]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#316])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][145] ([Intel XE#316])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][146] ([Intel XE#1231]) -> [DMESG-FAIL][147] ([Intel XE#324])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1124]) -> [SKIP][149] ([Intel XE#1124] / [Intel XE#1201]) +11 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-WARN][150] ([Intel XE#324]) -> [DMESG-FAIL][151] ([Intel XE#324])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][153] ([Intel XE#1124]) +7 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#607]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#607])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][157] ([Intel XE#2191])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#2191]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#2191])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][161] ([Intel XE#367]) +3 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#367]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#367]) +4 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +29 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][167] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#787]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#787]) +104 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][171] ([Intel XE#1252]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][173] ([Intel XE#787]) +55 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#306]) -> [SKIP][175] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][177] ([Intel XE#306])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][179] ([Intel XE#373]) +7 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#373]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][183] ([Intel XE#307])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#307]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#307])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#308]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][189] ([Intel XE#308])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#323]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][192] ([i915#3804]) -> [SKIP][193] ([Intel XE#1201] / [i915#3804])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#776]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#776])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2-set2:     [SKIP][196] ([i915#5274]) -> [SKIP][197] ([Intel XE#1201] / [i915#5274])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][199] ([Intel XE#651]) +22 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#651]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#651]) +28 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][203] ([Intel XE#653]) +20 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#653]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#653]) +28 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][207] ([Intel XE#356])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
>     - shard-dg2-set2:     [SKIP][208] -> [SKIP][209] ([Intel XE#1201]) +5 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#870]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#870])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#1129]) -> [SKIP][213] ([Intel XE#1129] / [Intel XE#1201])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         [FAIL][214] ([Intel XE#1204]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#734])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][217] ([Intel XE#908])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1489]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#1489]) +4 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][221] ([Intel XE#1489])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][223] ([Intel XE#1122])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#929]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#929]) +14 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-onoff:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][227] ([Intel XE#929]) +9 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][229] ([Intel XE#1149])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#327]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#327])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][233] ([Intel XE#327])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_rotation_crc@primary-rotation-90.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][235] ([Intel XE#1127])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#362])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][239] ([Intel XE#455]) +18 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@kms_vrr@flip-dpms.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#455]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#455]) +21 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@kms_vrr@flipline.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][243] ([Intel XE#756]) +1 other test skip
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][247] ([Intel XE#1123])
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#1123]) -> [SKIP][249] ([Intel XE#1123] / [Intel XE#1201])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#1126]) -> [SKIP][251] ([Intel XE#1126] / [Intel XE#1201])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-dg2-set2:     [FAIL][252] ([Intel XE#1000]) -> [TIMEOUT][253] ([Intel XE#1473])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][255] ([Intel XE#288]) +20 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#288]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#288]) +25 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][258] ([Intel XE#2360]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#2360])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][261] ([Intel XE#255])
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#512]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#512])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_mmap@small-bar.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@oa-regs-whitelisted:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#2541]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@xe_oa@oa-regs-whitelisted.html
> 
>   * igt@xe_oa@whitelisted-registers-userspace-config:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][267] ([Intel XE#2541]) +4 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][268] ([Intel XE#1337]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#1337])
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][270] ([Intel XE#977]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#977])
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][273] ([Intel XE#2284] / [Intel XE#366])
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@xe_pm@d3cold-multiple-execs.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][274] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-dg2-set2:     [SKIP][276] ([Intel XE#944]) -> [SKIP][277] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-434/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     [SKIP][278] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][279] ([Intel XE#944])
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
>   [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151 -> xe-pw-138609v2
> 
>   IGT_8016: 786f0469afc0665a02dd82bf17544868188fbdeb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1946-d624a4cafbe6227571d2ed755b3ce48918afe151: d624a4cafbe6227571d2ed755b3ce48918afe151
>   xe-pw-138609v2: 138609v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138609v2/index.html
> 
