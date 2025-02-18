Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2191C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 13:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C46D10E6AB;
	Tue, 18 Feb 2025 13:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8QyD0lo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B23810E6AF
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Feb 2025 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739883695; x=1771419695;
 h=message-id:date:mime-version:from:subject:to:references:
 in-reply-to:content-transfer-encoding;
 bh=BPTZazBoCxZchmOs+QyjAAo5HMTQyq3SUgc2ASB8UXw=;
 b=F8QyD0loFx2xSpyouGCRIi1004tLk1lBtLVVsfAez4wO5RWMgYAkbCqb
 WowO0LW20WxQ4XMmrkBG+zanbP2YF5YzZoys9qblX/g4/XlhviybvH1xE
 CHM7biEKdiZLwbYTK4DfTNXORrQDM7F+00XLJ1/K5HAL0AHhGzNr1fkY5
 gvkNppLSYUfyz3m+S4WF4k/o3mGoTkCtx7X4C8resk2Dw2ukGTAY27MkG
 ONHNgxivZ4ciPcK6SukaqO+k3zrrRujkYoSSGQGjSmkZrqZ5r2z7N/+oV
 wvYiTHA9GWkbF7YMGOcUkcn8Tk7hDUC/JUXiZfZdwFmbcfiJHHiWHZbLR A==;
X-CSE-ConnectionGUID: JszmJkirSGi/VLwUMSe7Vw==
X-CSE-MsgGUID: iAoJPj1SQ8mIGDMv0W2ZQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="43408441"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="43408441"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 05:01:34 -0800
X-CSE-ConnectionGUID: WZK6iQBAQb2asaVWg5yHiQ==
X-CSE-MsgGUID: TfVO9dwpTpSpzEDE2rflUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118521152"
Received: from tkazmi-mobl.gar.corp.intel.com (HELO [10.247.148.17])
 ([10.247.148.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 05:01:32 -0800
Message-ID: <105700ca-29b7-4765-a4da-d9bd3ee29130@intel.com>
Date: Tue, 18 Feb 2025 18:31:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGU6IEFk?=
 =?UTF-8?Q?d_and_refactor_workarounds_=28rev3=29?=
To: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20250130055939.282988-1-aradhya.bhatia@intel.com>
 <173830898879.3131849.16717142904884443222@b555e5b46a47>
Content-Language: en-US
In-Reply-To: <173830898879.3131849.16717142904884443222@b555e5b46a47>
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

Hi Himal. Tejas,

The failures here do not seem to be related to my patch.
Could this series be merged?

Regards
Aradhya

On 31-01-2025 13:06, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Add and refactor workarounds (rev3)
> URL   : https://patchwork.freedesktop.org/series/143594/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b_full -> xe-pw-143594v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-143594v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-143594v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-143594v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_color@ctm-0-25@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
>     - shard-dg2-set2:     [PASS][2] -> [DMESG-WARN][3] +4 other tests dmesg-warn
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-adlp:         [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-8/igt@kms_pm_rpm@modeset-lpsp.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-2/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-143594v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@nullptr:
>     - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#2134])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@fbdev@nullptr.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@fbdev@nullptr.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-4:
>     - shard-dg2-set2:     [PASS][8] -> [FAIL][9] ([Intel XE#827]) +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-4.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-4.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#2550] / [Intel XE#3767]) +15 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#607]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#316]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][15] ([Intel XE#1033])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124]) +4 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#2191])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#367])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +33 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +216 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#2907]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#787]) +14 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2669]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2887]) +2 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#3442])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][32] ([Intel XE#3862])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][34] ([Intel XE#1033] / [Intel XE#2625])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#2705] / [Intel XE#4010])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][37] -> [INCOMPLETE][38] ([Intel XE#4010])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1152]) +3 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#373]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_audio@dp-audio-edid:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#373])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_chamelium_audio@dp-audio-edid.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#306])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178]) +1 other test fail
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_content_protection@atomic@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#1178]) +1 other test fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#3278])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#1188]) +1 other test fail
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1424]) +2 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-bmg:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#4172]) +9 other tests dmesg-warn
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_cursor_crc@cursor-suspend.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2291]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#309])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          [PASS][54] -> [DMESG-WARN][55] ([Intel XE#877])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#309])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2425])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2244])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#776])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1138])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-8/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>     - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#2423] / [i915#2575]) +7 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][64] ([Intel XE#2049])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#310]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>     - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2316]) +7 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][68] -> [FAIL][69] ([Intel XE#3321]) +2 other tests fail
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1421]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][71] ([Intel XE#3321]) +1 other test fail
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#301]) +5 other tests fail
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate:
>     - shard-bmg:          [PASS][74] -> [FAIL][75] ([Intel XE#2882]) +2 other tests fail
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible:
>     - shard-lnl:          [PASS][76] -> [FAIL][77] ([Intel XE#3149] / [Intel XE#886])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1:
>     - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#886])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
>     - shard-dg2-set2:     [PASS][80] -> [SKIP][81] ([Intel XE#2136]) +6 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1401] / [Intel XE#1745])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1401])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293]) +4 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>     - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#2136]) +4 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2380])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#455]) +10 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#651]) +14 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#656]) +11 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
>     - shard-adlp:         [PASS][91] -> [DMESG-WARN][92] ([Intel XE#4173]) +3 other tests dmesg-warn
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#651]) +3 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#656]) +2 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#455]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#653]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#653]) +10 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#346])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2927])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][101] ([Intel XE#4172]) +1 other test dmesg-warn
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][102] ([Intel XE#1033]) +5 other tests dmesg-warn
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane@pixel-format:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][103] ([Intel XE#1035])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_plane@pixel-format.html
> 
>   * igt@kms_plane@pixel-format@pipe-a-plane-3:
>     - shard-adlp:         NOTRUN -> [WARN][104] ([Intel XE#2078]) +1 other test warn
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_plane@pixel-format@pipe-a-plane-3.html
> 
>   * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2423] / [i915#2575]) +10 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][106] ([Intel XE#616]) +2 other tests fail
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#2571])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2763]) +14 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2763]) +7 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1129])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#3309])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-dg2-set2:     [PASS][114] -> [SKIP][115] ([Intel XE#2446]) +1 other test skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1489]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1489]) +2 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2136]) +11 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html
> 
>   * igt@kms_psr@pr-dpms:
>     - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1406]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_psr@pr-dpms.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-4/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#2423]) +22 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [PASS][124] -> [FAIL][125] ([Intel XE#899]) +2 other tests fail
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2168])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-lnl:          NOTRUN -> [FAIL][127] ([Intel XE#1522]) +1 other test fail
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@kms_vrr@flip-basic.html
> 
>   * igt@xe_eudebug@basic-vm-access-parameters-userptr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#3889])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>     - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#3889])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>   * igt@xe_eudebug@vma-ufence:
>     - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2905]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-8/igt@xe_eudebug@vma-ufence.html
> 
>   * igt@xe_eudebug_online@set-breakpoint:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#2905]) +3 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_eudebug_online@set-breakpoint.html
> 
>   * igt@xe_eudebug_online@single-step-one:
>     - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#2905]) +1 other test skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@xe_eudebug_online@single-step-one.html
> 
>   * igt@xe_evict@evict-beng-small-external:
>     - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#261] / [Intel XE#688])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-4/igt@xe_evict@evict-beng-small-external.html
> 
>   * igt@xe_evict@evict-beng-small-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#688])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@xe_evict@evict-beng-small-external-cm.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1392]) +2 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1392])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue:
>     - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#1392]) +1 other test skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
> 
>   * igt@xe_exec_basic@once-userptr-invalidate-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#1130]) +17 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@xe_exec_basic@once-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race:
>     - shard-bmg:          [PASS][140] -> [SKIP][141] ([Intel XE#1130]) +42 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#288]) +4 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#288]) +11 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-pagesize:
>     - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#1130]) +22 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_mmap@pci-membarrier-bad-pagesize.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@xe_mmap@pci-membarrier-bad-pagesize.html
> 
>   * igt@xe_module_load@load:
>     - shard-dg2-set2:     ([PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170]) -> ([PASS][171], [PASS][172], [SKIP][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196]) ([Intel XE#378])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_module_load@load.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-466/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-466/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-466/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-466/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-466/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-466/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_module_load@load.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#379])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-4/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_oa@non-system-wide-paranoid:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#2541] / [Intel XE#3573])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_oa@non-system-wide-paranoid.html
> 
>   * igt@xe_oa@non-zero-reason:
>     - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#2541] / [Intel XE#3573])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@xe_oa@non-zero-reason.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#979])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-8/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-dg2-set2:     [PASS][201] -> [ABORT][202] ([Intel XE#1358])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-dg2-set2:     [PASS][203] -> [ABORT][204] ([Intel XE#1358] / [Intel XE#1794])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-436/igt@xe_pm@s4-basic-exec.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-lnl:          [PASS][205] -> [ABORT][206] ([Intel XE#1358] / [Intel XE#1607])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-4/igt@xe_pm@s4-d3hot-basic-exec.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][207] -> [ABORT][208] ([Intel XE#1358] / [Intel XE#1607])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@xe_pm@s4-exec-after.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [PASS][209] -> [ABORT][210] ([Intel XE#1358] / [Intel XE#1794])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-3/igt@xe_pm@s4-mocs.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-9/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#944]) +1 other test skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-adlp:         NOTRUN -> [SKIP][212] ([Intel XE#944])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-bmg:          [SKIP][213] ([Intel XE#2136]) -> [PASS][214] +21 other tests pass
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@core_hotunplug@hotreplug.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@core_hotunplug@hotreplug.html
> 
>   * igt@core_setmaster@master-drop-set-user:
>     - shard-dg2-set2:     [FAIL][215] ([Intel XE#3249]) -> [PASS][216]
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@core_setmaster@master-drop-set-user.html
> 
>   * igt@fbdev@info:
>     - shard-bmg:          [SKIP][217] ([Intel XE#2134]) -> [PASS][218] +2 other tests pass
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@fbdev@info.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@fbdev@info.html
> 
>   * igt@fbdev@write:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#2134]) -> [PASS][220] +2 other tests pass
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@fbdev@write.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@fbdev@write.html
> 
>   * igt@kms_atomic@plane-invalid-params-fence:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#2423] / [i915#2575]) -> [PASS][222] +122 other tests pass
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_atomic@plane-invalid-params-fence.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_atomic@plane-invalid-params-fence.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          [SKIP][223] ([Intel XE#2291]) -> [PASS][224] +1 other test pass
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [SKIP][225] ([Intel XE#2373]) -> [PASS][226]
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][227] ([Intel XE#3321]) -> [PASS][228] +2 other tests pass
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          [SKIP][229] ([Intel XE#2423]) -> [PASS][230] +108 other tests pass
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-bmg:          [SKIP][231] ([Intel XE#2316]) -> [PASS][232] +2 other tests pass
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-lnl:          [FAIL][233] ([Intel XE#886]) -> [PASS][234] +3 other tests pass
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [DMESG-WARN][235] ([Intel XE#2953]) -> [PASS][236] +1 other test pass
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][237] ([Intel XE#4173]) -> [PASS][238]
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate:
>     - shard-dg2-set2:     [FAIL][239] ([Intel XE#2882]) -> [PASS][240]
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2:
>     - shard-dg2-set2:     [FAIL][241] -> [PASS][242] +2 other tests pass
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][244] +12 other tests pass
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#2136]) -> [PASS][246] +30 other tests pass
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d:
>     - shard-bmg:          [DMESG-WARN][247] ([Intel XE#4172]) -> [PASS][248] +3 other tests pass
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-d.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
>     - shard-adlp:         [DMESG-WARN][249] -> [PASS][250] +2 other tests pass
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-3/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d:
>     - shard-dg2-set2:     [DMESG-WARN][251] ([Intel XE#1033]) -> [PASS][252] +1 other test pass
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-d.html
> 
>   * igt@kms_pm_rpm@cursor-dpms:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#2446]) -> [PASS][254] +3 other tests pass
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_pm_rpm@cursor-dpms.html
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-bmg:          [SKIP][255] ([Intel XE#2446]) -> [PASS][256] +1 other test pass
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_rpm@universal-planes.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_pm_rpm@universal-planes.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-bmg:          [SKIP][257] ([Intel XE#1435]) -> [PASS][258]
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][259] ([Intel XE#2159]) -> [PASS][260] +1 other test pass
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@xe_ccs@ctrl-surf-copy-new-ctx:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#1130]) -> [PASS][262] +223 other tests pass
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#1392]) -> [PASS][264] +2 other tests pass
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [SKIP][265] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][266] +1 other test pass
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-dg2-set2:     [SKIP][267] ([Intel XE#2229]) -> [PASS][268]
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - shard-bmg:          [FAIL][269] ([Intel XE#1999]) -> [PASS][270] +2 other tests pass
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-bmg:          [FAIL][271] ([Intel XE#3546]) -> [PASS][272]
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_module_load@many-reload.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [FAIL][273] ([Intel XE#3546]) -> [PASS][274]
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_module_load@reload.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_module_load@reload.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          [ABORT][275] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][276]
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-2/igt@xe_pm@s4-exec-after.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-8/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [ABORT][277] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][278]
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-lnl-2/igt@xe_pm@s4-mocs.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-lnl-3/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [ABORT][279] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][280] +1 other test pass
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-dg2-set2:     [ABORT][281] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][282]
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-463/igt@xe_pm@s4-vm-bind-userptr.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
>     - shard-bmg:          [SKIP][283] ([Intel XE#1130]) -> [PASS][284] +232 other tests pass
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-dg2-set2:     [SKIP][285] ([Intel XE#2136]) -> [DMESG-WARN][286] ([Intel XE#1033]) +2 other tests dmesg-warn
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@core_hotunplug@hotreplug-lateclose.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][287] ([Intel XE#623]) -> [SKIP][288] ([Intel XE#2423] / [i915#2575])
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic:
>     - shard-bmg:          [SKIP][289] ([Intel XE#2423]) -> [SKIP][290] ([Intel XE#3768])
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_async_flips@invalid-async-flip-atomic.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_async_flips@invalid-async-flip-atomic.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-bmg:          [SKIP][291] ([Intel XE#2423]) -> [SKIP][292] ([Intel XE#2385])
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-bmg:          [SKIP][293] ([Intel XE#2423]) -> [SKIP][294] ([Intel XE#2370])
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][295] ([Intel XE#2136]) -> [SKIP][296] ([Intel XE#316]) +2 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][297] ([Intel XE#316]) -> [SKIP][298] ([Intel XE#2136] / [Intel XE#2351])
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-bmg:          [SKIP][299] ([Intel XE#2136]) -> [SKIP][300] ([Intel XE#2327]) +4 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-bmg:          [SKIP][301] ([Intel XE#2327]) -> [SKIP][302] ([Intel XE#2136]) +1 other test skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][303] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][304] ([Intel XE#316]) +1 other test skip
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][305] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][306] ([Intel XE#1124]) +4 other tests skip
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-bmg:          [SKIP][307] ([Intel XE#2328]) -> [SKIP][308] ([Intel XE#2136])
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][310] ([Intel XE#607])
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][311] ([Intel XE#610]) -> [SKIP][312] ([Intel XE#2136])
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][313] ([Intel XE#1124]) -> [SKIP][314] ([Intel XE#2136] / [Intel XE#2351])
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-bmg:          [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#1124]) +15 other tests skip
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#1124]) +10 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][319] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][320] ([Intel XE#619])
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-bmg:          [SKIP][321] ([Intel XE#1124]) -> [SKIP][322] ([Intel XE#2136])
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     [SKIP][323] ([Intel XE#1124]) -> [SKIP][324] ([Intel XE#2136])
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][325] ([Intel XE#2423] / [i915#2575]) -> [SKIP][326] ([Intel XE#2191]) +1 other test skip
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          [SKIP][327] ([Intel XE#2423]) -> [SKIP][328] ([Intel XE#2314] / [Intel XE#2894]) +2 other tests skip
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [SKIP][329] ([Intel XE#367]) -> [SKIP][330] ([Intel XE#2423])
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          [SKIP][331] ([Intel XE#2423]) -> [SKIP][332] ([Intel XE#367]) +2 other tests skip
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][333] ([Intel XE#2423] / [i915#2575]) -> [SKIP][334] ([Intel XE#367]) +3 other tests skip
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][335] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][336] ([Intel XE#2136] / [Intel XE#2351])
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][337] ([Intel XE#2136]) -> [SKIP][338] ([Intel XE#2652] / [Intel XE#787])
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          [SKIP][339] ([Intel XE#2887]) -> [SKIP][340] ([Intel XE#2136]) +2 other tests skip
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][341] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][342] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [SKIP][343] ([Intel XE#2136]) -> [INCOMPLETE][344] ([Intel XE#3862])
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [DMESG-WARN][345] ([Intel XE#1033]) -> [ABORT][346] ([Intel XE#1033] / [Intel XE#2625])
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][347] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][348] ([Intel XE#2136]) +1 other test skip
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-bmg:          [SKIP][349] ([Intel XE#3432]) -> [SKIP][350] ([Intel XE#2136])
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-bmg:          [SKIP][351] ([Intel XE#2136]) -> [SKIP][352] ([Intel XE#3432])
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          [SKIP][353] ([Intel XE#2136]) -> [SKIP][354] ([Intel XE#2887]) +20 other tests skip
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][355] ([Intel XE#2136]) -> [SKIP][356] ([Intel XE#2907]) +3 other tests skip
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][357] ([Intel XE#2136]) -> [SKIP][358] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][359] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][360] ([Intel XE#314])
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-bmg:          [SKIP][361] ([Intel XE#2136]) -> [SKIP][362] ([Intel XE#2724])
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cdclk@plane-scaling.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-bmg:          [SKIP][363] ([Intel XE#2325]) -> [SKIP][364] ([Intel XE#2423])
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     [SKIP][365] ([Intel XE#2423] / [i915#2575]) -> [SKIP][366] ([Intel XE#306]) +1 other test skip
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          [SKIP][367] ([Intel XE#2423]) -> [SKIP][368] ([Intel XE#2325]) +1 other test skip
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_chamelium_color@degamma.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-bmg:          [SKIP][369] ([Intel XE#2423]) -> [SKIP][370] ([Intel XE#2252]) +13 other tests skip
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-resolution-list.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
>     - shard-bmg:          [SKIP][371] ([Intel XE#2252]) -> [SKIP][372] ([Intel XE#2423]) +1 other test skip
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-dg2-set2:     [SKIP][373] ([Intel XE#373]) -> [SKIP][374] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][375] ([Intel XE#2423] / [i915#2575]) -> [SKIP][376] ([Intel XE#373]) +18 other tests skip
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     [SKIP][377] ([Intel XE#2423] / [i915#2575]) -> [SKIP][378] ([Intel XE#307]) +1 other test skip
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [SKIP][379] ([Intel XE#2423]) -> [FAIL][380] ([Intel XE#1178]) +1 other test fail
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_content_protection@legacy.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-bmg:          [SKIP][381] ([Intel XE#2423]) -> [SKIP][382] ([Intel XE#2341])
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_content_protection@lic-type-1.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [FAIL][383] ([Intel XE#1178]) -> [SKIP][384] ([Intel XE#2341])
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_content_protection@srm.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_content_protection@srm.html
>     - shard-dg2-set2:     [SKIP][385] ([Intel XE#2423] / [i915#2575]) -> [FAIL][386] ([Intel XE#1178])
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_content_protection@srm.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          [SKIP][387] ([Intel XE#2423]) -> [SKIP][388] ([Intel XE#2321])
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][389] ([Intel XE#2423] / [i915#2575]) -> [SKIP][390] ([Intel XE#308]) +1 other test skip
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-bmg:          [SKIP][391] ([Intel XE#2321]) -> [SKIP][392] ([Intel XE#2423]) +1 other test skip
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-bmg:          [SKIP][393] ([Intel XE#2423]) -> [SKIP][394] ([Intel XE#2320]) +4 other tests skip
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x32:
>     - shard-bmg:          [SKIP][395] ([Intel XE#2320]) -> [SKIP][396] ([Intel XE#2423])
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-32x32.html
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-dg2-set2:     [SKIP][397] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][398] ([Intel XE#1033]) +8 other tests dmesg-warn
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend.html
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-bmg:          [SKIP][399] ([Intel XE#2286]) -> [SKIP][400] ([Intel XE#2423])
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][401] ([Intel XE#2423]) -> [SKIP][402] ([Intel XE#2291]) +1 other test skip
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][403] ([Intel XE#2423] / [i915#2575]) -> [SKIP][404] ([Intel XE#323])
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-bmg:          [SKIP][405] ([Intel XE#2423]) -> [SKIP][406] ([Intel XE#2286])
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-bmg:          [SKIP][407] ([Intel XE#2136]) -> [SKIP][408] ([Intel XE#1508])
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-bmg:          [SKIP][409] ([Intel XE#2136]) -> [SKIP][410] ([Intel XE#2244]) +1 other test skip
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_dsc@dsc-basic.html
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-dg2-set2:     [SKIP][411] ([Intel XE#455]) -> [SKIP][412] ([Intel XE#2136] / [Intel XE#2351])
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2-set2:     [SKIP][413] ([Intel XE#2136]) -> [SKIP][414] ([Intel XE#455]) +4 other tests skip
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - shard-bmg:          [SKIP][415] ([Intel XE#2136]) -> [SKIP][416] ([Intel XE#4156])
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_fbcon_fbt@fbc.html
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][417] ([Intel XE#2136]) -> [SKIP][418] ([Intel XE#776])
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][419] ([Intel XE#2423] / [i915#2575]) -> [SKIP][420] ([Intel XE#703])
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_feature_discovery@display-3x.html
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][421] ([Intel XE#2423] / [i915#2575]) -> [SKIP][422] ([Intel XE#1137])
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-bmg:          [SKIP][423] ([Intel XE#2374]) -> [SKIP][424] ([Intel XE#2423])
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_feature_discovery@psr1.html
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-dg2-set2:     [SKIP][425] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][426] ([Intel XE#2049])
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank.html
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-bmg:          [DMESG-WARN][427] ([Intel XE#4172]) -> [SKIP][428] ([Intel XE#2316])
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-dg2-set2:     [SKIP][429] ([Intel XE#2423] / [i915#2575]) -> [FAIL][430] ([Intel XE#301])
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-bmg:          [SKIP][431] ([Intel XE#2423]) -> [SKIP][432] ([Intel XE#2316]) +2 other tests skip
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-bmg:          [SKIP][433] ([Intel XE#2423]) -> [FAIL][434] ([Intel XE#3321])
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank.html
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-bmg:          [SKIP][435] ([Intel XE#2136]) -> [SKIP][436] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-bmg:          [SKIP][437] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][438] ([Intel XE#2136])
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-bmg:          [SKIP][439] ([Intel XE#2136]) -> [SKIP][440] ([Intel XE#2380])
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-dg2-set2:     [SKIP][441] ([Intel XE#455]) -> [SKIP][442] ([Intel XE#2136])
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][443] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][444] ([Intel XE#455]) +3 other tests skip
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][445] ([Intel XE#2311]) -> [SKIP][446] ([Intel XE#2136]) +6 other tests skip
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>     - shard-bmg:          [SKIP][447] ([Intel XE#2136]) -> [SKIP][448] ([Intel XE#2312]) +7 other tests skip
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][449] ([Intel XE#651]) -> [SKIP][450] ([Intel XE#2136]) +3 other tests skip
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][451] ([Intel XE#2312]) -> [SKIP][452] ([Intel XE#2311]) +11 other tests skip
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][453] ([Intel XE#2311]) -> [SKIP][454] ([Intel XE#2312]) +15 other tests skip
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][455] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][456] ([Intel XE#651]) +14 other tests skip
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][457] ([Intel XE#2136]) -> [SKIP][458] ([Intel XE#651]) +29 other tests skip
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
>     - shard-bmg:          [SKIP][459] ([Intel XE#2136]) -> [SKIP][460] ([Intel XE#2311]) +34 other tests skip
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][461] ([Intel XE#2136]) -> [SKIP][462] ([Intel XE#4141]) +11 other tests skip
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][463] ([Intel XE#2312]) -> [SKIP][464] ([Intel XE#4141]) +7 other tests skip
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][465] ([Intel XE#4141]) -> [SKIP][466] ([Intel XE#2312]) +5 other tests skip
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
>     - shard-bmg:          [SKIP][467] ([Intel XE#4141]) -> [SKIP][468] ([Intel XE#2136]) +1 other test skip
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][469] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][470] ([Intel XE#658])
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     [SKIP][471] ([Intel XE#651]) -> [SKIP][472] ([Intel XE#2136] / [Intel XE#2351])
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][473] ([Intel XE#2136]) -> [SKIP][474] ([Intel XE#2313]) +33 other tests skip
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][475] ([Intel XE#2313]) -> [SKIP][476] ([Intel XE#2312]) +14 other tests skip
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][477] ([Intel XE#2312]) -> [SKIP][478] ([Intel XE#2313]) +10 other tests skip
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-bmg:          [SKIP][479] ([Intel XE#2136]) -> [SKIP][480] ([Intel XE#2352])
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][481] ([Intel XE#2136]) -> [SKIP][482] ([Intel XE#653]) +29 other tests skip
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][483] ([Intel XE#2313]) -> [SKIP][484] ([Intel XE#2136]) +6 other tests skip
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][485] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][486] ([Intel XE#653]) +9 other tests skip
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][487] ([Intel XE#653]) -> [SKIP][488] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
>     - shard-dg2-set2:     [SKIP][489] ([Intel XE#653]) -> [SKIP][490] ([Intel XE#2136])
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][491] ([Intel XE#2423] / [i915#2575]) -> [SKIP][492] ([Intel XE#605])
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][493] ([Intel XE#2423]) -> [SKIP][494] ([Intel XE#1503])
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          [SKIP][495] ([Intel XE#2136]) -> [SKIP][496] ([Intel XE#2927])
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html
>     - shard-dg2-set2:     [SKIP][497] ([Intel XE#2136]) -> [SKIP][498] ([Intel XE#2927])
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-dg2-set2:     [SKIP][499] ([Intel XE#2136]) -> [SKIP][500] ([Intel XE#346])
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          [SKIP][501] ([Intel XE#2423]) -> [SKIP][502] ([Intel XE#2501])
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-dg2-set2:     [SKIP][503] ([Intel XE#2423] / [i915#2575]) -> [FAIL][504] ([Intel XE#616])
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_plane_cursor@primary.html
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][505] ([Intel XE#2423] / [i915#2575]) -> [SKIP][506] ([Intel XE#2763] / [Intel XE#455]) +4 other tests skip
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-bmg:          [SKIP][507] ([Intel XE#2423]) -> [SKIP][508] ([Intel XE#2763]) +1 other test skip
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     [SKIP][509] ([Intel XE#2136]) -> [SKIP][510] ([Intel XE#870])
>    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html
>    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-bmg:          [SKIP][511] ([Intel XE#870]) -> [SKIP][512] ([Intel XE#2136])
>    [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html
>    [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-bmg:          [SKIP][513] ([Intel XE#2136]) -> [SKIP][514] ([Intel XE#2391])
>    [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-bmg:          [SKIP][515] ([Intel XE#2136]) -> [SKIP][516] ([Intel XE#3309])
>    [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html
>    [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-bmg:          [SKIP][517] ([Intel XE#2392]) -> [SKIP][518] ([Intel XE#2136])
>    [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
>    [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][519] ([Intel XE#2136]) -> [SKIP][520] ([Intel XE#908])
>    [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
>    [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          [SKIP][521] ([Intel XE#2136]) -> [SKIP][522] ([Intel XE#2499])
>    [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html
>    [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-bmg:          [SKIP][523] ([Intel XE#2446]) -> [SKIP][524] ([Intel XE#1439] / [Intel XE#836])
>    [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-dg2-set2:     [SKIP][525] ([Intel XE#2446]) -> [DMESG-WARN][526] ([Intel XE#1033] / [Intel XE#2042])
>    [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
>    [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][527] ([Intel XE#2136]) -> [SKIP][528] ([Intel XE#1489]) +11 other tests skip
>    [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
>    [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          [SKIP][529] ([Intel XE#2136]) -> [SKIP][530] ([Intel XE#1489]) +11 other tests skip
>    [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
>    [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][531] ([Intel XE#1489]) -> [SKIP][532] ([Intel XE#2136])
>    [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
>    [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          [SKIP][533] ([Intel XE#1489]) -> [SKIP][534] ([Intel XE#2136]) +2 other tests skip
>    [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
>    [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-bmg:          [SKIP][535] ([Intel XE#2136]) -> [SKIP][536] ([Intel XE#2387])
>    [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html
>    [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][537] ([Intel XE#2136]) -> [SKIP][538] ([Intel XE#1122]) +2 other tests skip
>    [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
>    [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-cursor-blt:
>     - shard-bmg:          [SKIP][539] ([Intel XE#2136]) -> [SKIP][540] ([Intel XE#2234] / [Intel XE#2850]) +18 other tests skip
>    [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_psr@fbc-pr-cursor-blt.html
>    [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_psr@fbc-pr-cursor-blt.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-bmg:          [SKIP][541] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][542] ([Intel XE#2136]) +2 other tests skip
>    [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@kms_psr@fbc-pr-primary-page-flip.html
>    [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][543] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][544] ([Intel XE#2136] / [Intel XE#2351])
>    [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html
>    [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][545] ([Intel XE#2136]) -> [SKIP][546] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
>    [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][547] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][548] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>    [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr@psr-dpms.html
>    [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][549] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][550] ([Intel XE#2939])
>    [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          [SKIP][551] ([Intel XE#2423]) -> [SKIP][552] ([Intel XE#2330])
>    [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>     - shard-dg2-set2:     [SKIP][553] ([Intel XE#2423] / [i915#2575]) -> [SKIP][554] ([Intel XE#1127]) +1 other test skip
>    [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2-set2:     [SKIP][555] ([Intel XE#2423] / [i915#2575]) -> [SKIP][556] ([Intel XE#3414]) +4 other tests skip
>    [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html
>    [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-bmg:          [SKIP][557] ([Intel XE#2423]) -> [SKIP][558] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>    [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-bmg:          [SKIP][559] ([Intel XE#2423]) -> [SKIP][560] ([Intel XE#2413])
>    [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html
>    [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][561] ([Intel XE#2423]) -> [SKIP][562] ([Intel XE#2426])
>    [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
>    [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][563] ([Intel XE#2426]) -> [SKIP][564] ([Intel XE#2509])
>    [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     - shard-dg2-set2:     [SKIP][565] ([Intel XE#2423] / [i915#2575]) -> [SKIP][566] ([Intel XE#1500])
>    [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-dg2-set2:     [SKIP][567] ([Intel XE#2423] / [i915#2575]) -> [SKIP][568] ([Intel XE#2168])
>    [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_vrr@cmrr.html
>    [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-dg2-set2:     [SKIP][569] ([Intel XE#455]) -> [SKIP][570] ([Intel XE#2423] / [i915#2575]) +1 other test skip
>    [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@kms_vrr@flip-basic-fastset.html
>    [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          [SKIP][571] ([Intel XE#2423]) -> [SKIP][572] ([Intel XE#1499]) +1 other test skip
>    [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_vrr@flip-suspend.html
>    [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][573] ([Intel XE#2423] / [i915#2575]) -> [SKIP][574] ([Intel XE#455]) +9 other tests skip
>    [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_vrr@flipline.html
>    [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          [SKIP][575] ([Intel XE#2423]) -> [SKIP][576] ([Intel XE#2168])
>    [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_vrr@lobf.html
>    [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@kms_vrr@lobf.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-bmg:          [SKIP][577] ([Intel XE#2423]) -> [SKIP][578] ([Intel XE#756])
>    [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     [SKIP][579] ([Intel XE#2423] / [i915#2575]) -> [SKIP][580] ([Intel XE#756]) +1 other test skip
>    [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
>    [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-bmg:          [SKIP][581] ([Intel XE#2423]) -> [SKIP][582] ([Intel XE#1091] / [Intel XE#2849])
>    [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     [SKIP][583] ([Intel XE#2423] / [i915#2575]) -> [SKIP][584] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
>    [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-dg2-set2:     [ABORT][585] ([Intel XE#2625]) -> [SKIP][586] ([Intel XE#1130])
>    [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_ccs@suspend-resume.html
>    [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][587] ([Intel XE#1130]) -> [SKIP][588] ([Intel XE#1126]) +2 other tests skip
>    [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_eudebug@basic-connect:
>     - shard-dg2-set2:     [SKIP][589] ([Intel XE#2905]) -> [SKIP][590] ([Intel XE#1130])
>    [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_eudebug@basic-connect.html
>    [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@xe_eudebug@basic-connect.html
> 
>   * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>     - shard-bmg:          [SKIP][591] ([Intel XE#1130]) -> [SKIP][592] ([Intel XE#2905]) +11 other tests skip
>    [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
>    [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
>     - shard-bmg:          [SKIP][593] ([Intel XE#1130]) -> [SKIP][594] ([Intel XE#3889])
>    [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
>    [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
> 
>   * igt@xe_eudebug_online@stopped-thread:
>     - shard-bmg:          [SKIP][595] ([Intel XE#2905]) -> [SKIP][596] ([Intel XE#1130]) +2 other tests skip
>    [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html
>    [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@xe_eudebug_online@stopped-thread.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic:
>     - shard-bmg:          [SKIP][597] ([Intel XE#2322]) -> [SKIP][598] ([Intel XE#1130]) +1 other test skip
>    [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic.html
>    [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-bmg:          [SKIP][599] ([Intel XE#1130]) -> [SKIP][600] ([Intel XE#2322]) +11 other tests skip
>    [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
>    [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-rebind:
>     - shard-dg2-set2:     [SKIP][601] ([Intel XE#1392]) -> [SKIP][602] ([Intel XE#1130]) +1 other test skip
>    [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html
>    [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate:
>     - shard-dg2-set2:     [SKIP][603] ([Intel XE#288]) -> [SKIP][604] ([Intel XE#1130]) +2 other tests skip
>    [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html
>    [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][605] ([Intel XE#1130]) -> [SKIP][606] ([Intel XE#288]) +36 other tests skip
>    [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_reset@spin:
>     - shard-dg2-set2:     [SKIP][607] ([Intel XE#1130]) -> [DMESG-WARN][608] ([Intel XE#1033]) +1 other test dmesg-warn
>    [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_exec_reset@spin.html
>    [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@xe_exec_reset@spin.html
> 
>   * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>     - shard-dg2-set2:     [SKIP][609] ([Intel XE#1130]) -> [SKIP][610] ([Intel XE#2905]) +16 other tests skip
>    [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
>    [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][611] ([Intel XE#1130]) -> [SKIP][612] ([Intel XE#255])
>    [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
>    [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     [SKIP][613] ([Intel XE#1130]) -> [SKIP][614] ([Intel XE#2541] / [Intel XE#3573]) +11 other tests skip
>    [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_oa@closed-fd-and-unmapped-access.html
>    [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-dg2-set2:     [SKIP][615] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][616] ([Intel XE#1130])
>    [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
>    [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][617] ([Intel XE#1130]) -> [SKIP][618] ([Intel XE#1337])
>    [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html
>    [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][619] ([Intel XE#1130]) -> [SKIP][620] ([Intel XE#977])
>    [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
>    [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][621] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][622] ([Intel XE#1130])
>    [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
>    [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][623] ([Intel XE#1130]) -> [SKIP][624] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
>    [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html
>    [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-bmg:          [SKIP][625] ([Intel XE#1130]) -> [SKIP][626] ([Intel XE#2284]) +1 other test skip
>    [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html
>    [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-dg2-set2:     [SKIP][627] ([Intel XE#1130]) -> [ABORT][628] ([Intel XE#1358])
>    [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html
>    [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-bmg:          [SKIP][629] ([Intel XE#579]) -> [SKIP][630] ([Intel XE#1130])
>    [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html
>    [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-dg2-set2:     [SKIP][631] ([Intel XE#1130]) -> [SKIP][632] ([Intel XE#944]) +4 other tests skip
>    [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>    [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - shard-bmg:          [SKIP][633] ([Intel XE#944]) -> [SKIP][634] ([Intel XE#1130])
>    [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
>    [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-bmg:          [SKIP][635] ([Intel XE#1130]) -> [SKIP][636] ([Intel XE#944]) +2 other tests skip
>    [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-4/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
>     - shard-bmg:          [SKIP][637] ([Intel XE#4130]) -> [SKIP][638] ([Intel XE#1130])
>    [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
>    [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-dg2-set2:     [SKIP][639] ([Intel XE#1130]) -> [SKIP][640] ([Intel XE#3342]) +1 other test skip
>    [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_sriov_flr@flr-vf1-clear.html
>    [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-dg2-set2:     [SKIP][641] ([Intel XE#1130]) -> [ABORT][642] ([Intel XE#3075] / [Intel XE#3084])
>    [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
>    [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>   [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>   [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b -> xe-pw-143594v3
> 
>   IGT_8214: 7a8a3744466fbb89127201077f030033c72df948 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2572-c2a5da40b8b1c5af77dcdabed8516069949fea3b: c2a5da40b8b1c5af77dcdabed8516069949fea3b
>   xe-pw-143594v3: 143594v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v3/index.html
> 

