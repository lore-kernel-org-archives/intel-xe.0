Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402E7CA9EDE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 19:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83F010E5B8;
	Mon, 12 Oct 2026 19:20:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7CA10E4F6
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 19:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791832800; x=1823368800;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=G0wj9zGF5YysHP0bOTV3iaYBi0nvnMpmD/yJvFHGV6s=;
 b=e/vvrWM5XzbsQ3Az98iwlaU6VSt45pQMeNb1XaMmXnNb9a3Keu8GdaW+
 xST7WixD1uO2eXGkRo+Oihd3PgouMDK2GvfgrPMvRUrosfERKCfoA8b6e
 2+6Eb3HiFSMcpthuovHD4GLJEF/2y/RVegZSS0ditHQ3EiuWmUgOs+mo+
 YkrJvrAAPXkj0rQ3wRShubirGGYdcyk0fAy486NCWS0zVry/IVmGIHJUm
 D2UkxkGpLtGZyS8YomsoP7uNxpVJh+dWQV1Cm1rk58uVPQoVs/Aqx+up1
 k2I8sKi98xJw8u/bHB36ewcJuZ3A74fnGE5sBui8kj9Y6lDMPk42jsrNJ w==;
X-CSE-ConnectionGUID: TzhRrdlWQdedXEOsDeIsZA==
X-CSE-MsgGUID: Fav9VbFZTlG3thnerGEteg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="656983"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="656983"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:19:57 -0700
X-CSE-ConnectionGUID: tXWco0bsQKCXo9nWzabH+Q==
X-CSE-MsgGUID: bL7OqW7iTR6rGvpSlq4/sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="888627"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 12:19:55 -0700
Date: Mon, 12 Oct 2026 21:19:52 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe/ras: Fix sysctrl and drm-ras discrepancy (rev4)
Message-ID: <as0y2Eycy51BSVpk@black.igk.intel.com>
References: <20261012101712.125146-1-raag.jadav@intel.com>
 <179183200417.14266.4020814103619031@221881a7231d>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179183200417.14266.4020814103619031@221881a7231d>
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

On Mon, Oct 12, 2026 at 07:06:44PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/ras: Fix sysctrl and drm-ras discrepancy (rev4)
> URL   : https://patchwork.freedesktop.org/series/173577/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681_FULL -> xe-pw-173577v4_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-173577v4_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-173577v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-173577v4_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute:
>     - shard-ptl:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-ptl-8/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@xe_compute_preempt@compute-preempt-many@engine-drm_xe_engine_class_compute.html

The failure seems to be in vm destroy path and unrelated to the patch.

Raag

> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-173577v4_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1125] / [Intel XE#7312])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-1/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2233])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#5947])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-5/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5901])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#6925])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#7059] / [Intel XE#7085])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-1/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
>     - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5808]) +14 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5851])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1477] / [Intel XE#7361])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +5 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1467] / [Intel XE#7367])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5855])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
>     - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#7679])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-7/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#7679])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#8365])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
>     - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#367])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-5/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#367]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#367])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5823] / [Intel XE#6918]) +9 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2652]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +5 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [ABORT][28] ([Intel XE#9375] / [Intel XE#9406])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#3432]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1:
>     - shard-ptl:          [PASS][30] -> [ABORT][31] ([Intel XE#7084] / [Intel XE#9362]) +1 other test abort
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2887]) +9 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
>     - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#5822]) +19 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#9204] / [Intel XE#9205]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#9205]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#2252]) +7 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2252])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-3/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5824])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7358]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
>     - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#8391]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-5/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2252]) +6 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#373]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:
>     - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#6969]) +7 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-5/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6969]) +15 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-5/igt@kms_color_pipeline@plane-lut3d-green-only.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#6969]) +13 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][48] ([Intel XE#3304] / [Intel XE#7374])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-2/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>     - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#6974]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
> 
>   * igt@kms_content_protection@legacy-hdcp14:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7642]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-7/igt@kms_content_protection@legacy-hdcp14.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#7642]) +2 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-7/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7642])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-max-size:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2320])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1424]) +3 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-1/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#5900]) +5 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-8/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#5846]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - shard-ptl:          [PASS][59] -> [ABORT][60] ([Intel XE#9362]) +5 other tests abort
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-ptl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5962]) +2 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#9530])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_link_training@uhbr-mst-direct-train:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#9527])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-10/igt@kms_dp_link_training@uhbr-mst-direct-train.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4331] / [Intel XE#7227])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#9009])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-8/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#8265]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-5/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#8265]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
>     - shard-ptl:          NOTRUN -> [SKIP][69] ([Intel XE#5907]) +4 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#8680])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-2/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-ptl:          NOTRUN -> [SKIP][71] ([Intel XE#7344])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-7/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1137] / [Intel XE#2375])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-4/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1421]) +2 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-ptl:          NOTRUN -> [SKIP][74] ([Intel XE#2316]) +9 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-7/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [PASS][75] -> [FAIL][76] ([Intel XE#3321]) +1 other test fail
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-wf_vblank-interruptible:
>     - shard-ptl:          NOTRUN -> [FAIL][77] ([Intel XE#3098]) +1 other test fail
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#5828]) +5 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
>     - shard-ptl:          NOTRUN -> [SKIP][81] ([Intel XE#7179])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>     - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#7178]) +3 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
>     - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#5800] / [Intel XE#6312]) +7 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#6312] / [Intel XE#651]) +8 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2311]) +30 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#7061] / [Intel XE#7356])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#6312]) +14 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#4141]) +4 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#6312]) +11 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
>     - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-8/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#7865]) +18 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#7905]) +27 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#7061])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html
>     - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#7061]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-3/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
>     - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#7865]) +30 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2313]) +24 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#5812]) +80 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#656] / [Intel XE#7905]) +26 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1469] / [Intel XE#7399])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#7399])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
>     - shard-ptl:          NOTRUN -> [SKIP][104] ([Intel XE#7399])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#7061]) +3 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html
> 
>   * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
>     - shard-bmg:          [PASS][106] -> [FAIL][107] ([Intel XE#9313])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-10/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html
> 
>   * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
>     - shard-bmg:          NOTRUN -> [FAIL][108] ([Intel XE#9313])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-1/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-ptl:          [PASS][109] -> [SKIP][110] ([Intel XE#7308])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-ptl-5/igt@kms_hdmi_inject@inject-audio.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@kms_hdmi_inject@inject-audio.html
>     - shard-bmg:          [PASS][111] -> [SKIP][112] ([Intel XE#7308])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#1503])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1503]) +1 other test skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#5917] / [Intel XE#6174]) +1 other test skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#6900]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#7086] / [Intel XE#7390])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#6911] / [Intel XE#7378])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
>     - shard-ptl:          NOTRUN -> [SKIP][120] ([Intel XE#7283]) +2 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#7283]) +1 other test skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
>     - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#7283]) +2 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#4596] / [Intel XE#5854])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#4596] / [Intel XE#5854])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5:
>     - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
>     - shard-ptl:          NOTRUN -> [SKIP][126] ([Intel XE#6886]) +9 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
>     - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-9/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-ptl:          NOTRUN -> [SKIP][129] ([Intel XE#1131])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1489]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#4608])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4608] / [Intel XE#7304])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#5858])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>     - shard-ptl:          NOTRUN -> [SKIP][136] ([Intel XE#7304]) +1 other test skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2893] / [Intel XE#7304]) +2 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1128] / [Intel XE#7413])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-3/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-ptl:          NOTRUN -> [SKIP][139] ([Intel XE#7413])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-5/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-pr-sprite-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-blt.html
>     - shard-ptl:          NOTRUN -> [SKIP][141] ([Intel XE#1406]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-8/igt@kms_psr@fbc-pr-sprite-blt.html
> 
>   * igt@kms_psr@fbc-psr2-dpms:
>     - shard-ptl:          NOTRUN -> [SKIP][142] ([Intel XE#1406] / [Intel XE#5835]) +5 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@kms_psr@fbc-psr2-dpms.html
>     - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1406] / [Intel XE#7345])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms.html
> 
>   * igt@kms_psr@fbc-psr2-dpms@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms@edp-1.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#1406]) +1 other test skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2234])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-2/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-ptl:          NOTRUN -> [SKIP][147] ([Intel XE#5821]) +3 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-ptl:          NOTRUN -> [SKIP][148] ([Intel XE#5813])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>     - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#1127] / [Intel XE#5813])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-bmg:          NOTRUN -> [SKIP][150] ([Intel XE#2413])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-ptl:          NOTRUN -> [SKIP][151] ([Intel XE#5910]) +1 other test skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#1435] / [Intel XE#9142])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_sharpness_filter@invalid-filter-with-plane:
>     - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#6503])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-plane.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-bmg:          [PASS][154] -> [DMESG-WARN][155] ([Intel XE#9365] / [Intel XE#9465])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2:
>     - shard-bmg:          [PASS][156] -> [DMESG-WARN][157] ([Intel XE#9365])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-2.html
> 
>   * igt@kms_vrr@cmrr-desktop-mode:
>     - shard-ptl:          NOTRUN -> [SKIP][158] ([Intel XE#9277])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@kms_vrr@cmrr-desktop-mode.html
> 
>   * igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-1:
>     - shard-ptl:          NOTRUN -> [SKIP][159] ([Intel XE#9277] / [Intel XE#9278])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@kms_vrr@cmrr-desktop-mode@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#2168] / [Intel XE#7444])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@kms_vrr@lobf.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1447] / [Intel XE#7469])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-5/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
>     - shard-bmg:          [PASS][162] -> [ABORT][163] ([Intel XE#9279]) +1 other test abort
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_create@create-big-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-6/igt@xe_create@create-big-vram.html
> 
>   * igt@xe_create@multigpu-create-massive-size:
>     - shard-ptl:          NOTRUN -> [SKIP][165] ([Intel XE#5878])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-3/igt@xe_create@multigpu-create-massive-size.html
> 
>   * igt@xe_cw_post_sync@walker-post-sync:
>     - shard-lnl:          NOTRUN -> [SKIP][166] ([Intel XE#8608])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-5/igt@xe_cw_post_sync@walker-post-sync.html
> 
>   * igt@xe_evict@evict-large-external:
>     - shard-ptl:          NOTRUN -> [SKIP][167] ([Intel XE#5764]) +4 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-7/igt@xe_evict@evict-large-external.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-small-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#8370])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-8/igt@xe_evict@evict-small-multi-queue.html
> 
>   * igt@xe_exec_balancer@once-cm-parallel-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][170] ([Intel XE#7482]) +27 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-3/igt@xe_exec_balancer@once-cm-parallel-rebind.html
> 
>   * igt@xe_exec_balancer@once-parallel-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#7482]) +9 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@xe_exec_balancer@once-parallel-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr:
>     - shard-ptl:          NOTRUN -> [SKIP][173] ([Intel XE#5575] / [Intel XE#7484]) +9 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#1392]) +2 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-rebind-imm:
>     - shard-lnl:          NOTRUN -> [SKIP][175] ([Intel XE#8374]) +7 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-3/igt@xe_exec_fault_mode@many-multi-queue-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind:
>     - shard-ptl:          NOTRUN -> [SKIP][176] ([Intel XE#8374]) +13 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#8374]) +7 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr:
>     - shard-ptl:          NOTRUN -> [SKIP][178] ([Intel XE#9003])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-3/igt@xe_exec_mix_modes@exec-multi-queue-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:
>     - shard-ptl:          NOTRUN -> [SKIP][179] ([Intel XE#8364]) +39 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#8364]) +19 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic-smem.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
>     - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#8364]) +21 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-close-fd:
>     - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#8369])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@xe_exec_reset@cm-multi-queue-close-fd.html
> 
>   * igt@xe_exec_reset@cm-multi-queue-gt-reset:
>     - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#8369]) +1 other test skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-gt-reset.html
> 
>   * igt@xe_exec_reset@multi-queue-gt-reset:
>     - shard-ptl:          NOTRUN -> [SKIP][184] ([Intel XE#8369]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-3/igt@xe_exec_reset@multi-queue-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@many-stride-new-prefetch:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][185] ([Intel XE#7098] / [Intel XE#8159])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
>     - shard-ptl:          NOTRUN -> [SKIP][186] ([Intel XE#6196])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:
>     - shard-ptl:          NOTRUN -> [SKIP][187] ([Intel XE#8378]) +8 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#8378]) +3 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-userptr.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#8378]) +6 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind:
>     - shard-bmg:          NOTRUN -> [ABORT][190] ([Intel XE#9463])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create_bind.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-ptl:          NOTRUN -> [SKIP][191] ([Intel XE#5712])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-3/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-ptl:          NOTRUN -> [SKIP][192] ([Intel XE#5830] / [Intel XE#7453])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-1/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mempage_offline@inject-duplicate-page:
>     - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#9203])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@xe_mempage_offline@inject-duplicate-page.html
> 
>   * igt@xe_mmap@pci-membarrier-parallel:
>     - shard-ptl:          NOTRUN -> [SKIP][194] ([Intel XE#5100] / [Intel XE#7408])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-7/igt@xe_mmap@pci-membarrier-parallel.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#6964]) +2 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-3/igt@xe_multigpu_svm@mgpu-pagefault-basic.html
> 
>   * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
>     - shard-ptl:          NOTRUN -> [SKIP][196] ([Intel XE#6964])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html
> 
>   * igt@xe_page_reclaim@random:
>     - shard-ptl:          NOTRUN -> [SKIP][197] ([Intel XE#7793]) +2 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@xe_page_reclaim@random.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-ptl:          NOTRUN -> [SKIP][198] ([Intel XE#5780] / [Intel XE#7590])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-5/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pat@xa-app-transient-media-off:
>     - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#7590] / [Intel XE#7772])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-6/igt@xe_pat@xa-app-transient-media-off.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][200] ([Intel XE#584] / [Intel XE#7369])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-7/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [PASS][201] -> [ABORT][202] ([Intel XE#9362]) +1 other test abort
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-lnl-6/igt@xe_pm@s4-basic-exec.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm_residency@cpg-basic:
>     - shard-ptl:          NOTRUN -> [SKIP][203] ([Intel XE#6867]) +1 other test skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@xe_pm_residency@cpg-basic.html
> 
>   * igt@xe_prefetch_fault@l2-prefetch-fault-svm:
>     - shard-ptl:          NOTRUN -> [SKIP][204] ([Intel XE#8815])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@xe_prefetch_fault@l2-prefetch-fault-svm.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>     - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#4733] / [Intel XE#7417])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-ptl:          NOTRUN -> [SKIP][206] ([Intel XE#6019]) +3 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@xe_query@multigpu-query-oa-units.html
>     - shard-lnl:          NOTRUN -> [SKIP][207] ([Intel XE#944]) +1 other test skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-3/igt@xe_query@multigpu-query-oa-units.html
>     - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#944])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_sriov_admin@sched-priority-vf-write-denied:
>     - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#7174])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-4/igt@xe_sriov_admin@sched-priority-vf-write-denied.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-lnl:          NOTRUN -> [SKIP][210] ([Intel XE#4273])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-6/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput-low-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#8339])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@xe_sriov_scheduling@equal-throughput-low-priority.html
> 
>   * igt@xe_sriov_vram@vf-access-provisioned:
>     - shard-ptl:          NOTRUN -> [SKIP][212] ([Intel XE#6376] / [Intel XE#7422])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-4/igt@xe_sriov_vram@vf-access-provisioned.html
> 
>   * igt@xe_sync_file@sync_file_race:
>     - shard-lnl:          NOTRUN -> [FAIL][213] ([Intel XE#9457])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@xe_sync_file@sync_file_race.html
> 
>   * igt@xe_vm@overcommit-fault-vram-lr:
>     - shard-ptl:          NOTRUN -> [SKIP][214] ([Intel XE#7892])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@xe_vm@overcommit-fault-vram-lr.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3:
>     - shard-bmg:          [ABORT][215] ([Intel XE#9399] / [Intel XE#9409]) -> [PASS][216] +1 other test pass
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-bmg:          [FAIL][217] ([Intel XE#8098] / [Intel XE#9561]) -> [PASS][218] +1 other test pass
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
>     - shard-bmg:          [INCOMPLETE][219] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][220]
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [FAIL][221] ([Intel XE#8399]) -> [PASS][222]
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend:
>     - shard-ptl:          [ABORT][223] ([Intel XE#9362]) -> [PASS][224] +3 other tests pass
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-ptl-8/igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-5/igt@kms_sharpness_filter@filter-suspend@pipe-a-edp-1-suspend.html
> 
>   * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>     - shard-ptl:          [FAIL][225] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][226] +1 other test pass
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-bmg:          [FAIL][227] ([Intel XE#9096]) -> [PASS][228] +1 other test pass
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>     - shard-ptl:          [FAIL][229] ([Intel XE#9096]) -> [PASS][230]
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-ptl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [SKIP][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-2/igt@xe_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-3/igt@xe_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-1/igt@xe_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-1/igt@xe_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-5/igt@xe_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-5/igt@xe_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-4/igt@xe_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-9/igt@xe_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-7/igt@xe_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-6/igt@xe_module_load@load.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-7/igt@xe_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-1/igt@xe_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-8/igt@xe_module_load@load.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-8/igt@xe_module_load@load.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-9/igt@xe_module_load@load.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-2/igt@xe_module_load@load.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-5/igt@xe_module_load@load.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-6/igt@xe_module_load@load.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-6/igt@xe_module_load@load.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-4/igt@xe_module_load@load.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-4/igt@xe_module_load@load.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-7/igt@xe_module_load@load.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-10/igt@xe_module_load@load.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-3/igt@xe_module_load@load.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-10/igt@xe_module_load@load.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-3/igt@xe_module_load@load.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-2/igt@xe_module_load@load.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-10/igt@xe_module_load@load.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-10/igt@xe_module_load@load.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-8/igt@xe_module_load@load.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-10/igt@xe_module_load@load.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-1/igt@xe_module_load@load.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-8/igt@xe_module_load@load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-1/igt@xe_module_load@load.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-7/igt@xe_module_load@load.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-7/igt@xe_module_load@load.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-7/igt@xe_module_load@load.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@xe_module_load@load.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@xe_module_load@load.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-3/igt@xe_module_load@load.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@xe_module_load@load.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-9/igt@xe_module_load@load.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-9/igt@xe_module_load@load.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-2/igt@xe_module_load@load.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-2/igt@xe_module_load@load.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@xe_module_load@load.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@xe_module_load@load.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@xe_module_load@load.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-6/igt@xe_module_load@load.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-5/igt@xe_module_load@load.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@xe_module_load@load.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-lnl:          [ABORT][282] ([Intel XE#9362]) -> [PASS][283] +1 other test pass
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-bmg:          [FAIL][284] ([Intel XE#6569]) -> [PASS][285]
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-4/igt@xe_sriov_flr@flr-twice.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-ptl:          [ABORT][286] ([Intel XE#9387]) -> [ABORT][287] ([Intel XE#9362])
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-ptl-7/igt@kms_async_flips@async-flip-suspend-resume.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-ptl-6/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [ABORT][288] ([Intel XE#9362] / [Intel XE#9393]) -> [ABORT][289] ([Intel XE#9393] / [Intel XE#9406])
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][290] ([Intel XE#3544]) -> [SKIP][291] ([Intel XE#3374] / [Intel XE#3544])
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][292] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][293] ([Intel XE#1729] / [Intel XE#7424])
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][294] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][295] ([Intel XE#2509] / [Intel XE#7437])
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712
>   [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
>   [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
>   [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
>   [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
>   [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
>   [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
>   [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
>   [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
>   [Intel XE#5830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5830
>   [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
>   [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
>   [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
>   [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
>   [Intel XE#5878]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878
>   [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
>   [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
>   [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
>   [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
>   [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
>   [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
>   [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
>   [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
>   [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
>   [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
>   [Intel XE#6925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6925
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
>   [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
>   [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
>   [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
>   [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
>   [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
>   [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
>   [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
>   [Intel XE#7390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
>   [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
>   [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
>   [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
>   [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
>   [Intel XE#7469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7469
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
>   [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
>   [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
>   [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
>   [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#8815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8815
>   [Intel XE#9003]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9003
>   [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
>   [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
>   [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
>   [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
>   [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
>   [Intel XE#9204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9204
>   [Intel XE#9205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9205
>   [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
>   [Intel XE#9278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9278
>   [Intel XE#9279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9279
>   [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
>   [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
>   [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
>   [Intel XE#9375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9375
>   [Intel XE#9387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9387
>   [Intel XE#9393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9393
>   [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
>   [Intel XE#9406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9406
>   [Intel XE#9409]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9409
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#9457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9457
>   [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
>   [Intel XE#9465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9465
>   [Intel XE#9527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527
>   [Intel XE#9530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9530
>   [Intel XE#9561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9138 -> IGT_9139
>   * Linux: xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681 -> xe-pw-173577v4
> 
>   IGT_9138: 9138
>   IGT_9139: 3758ada24b618a59d8a5c66e37f0aadc20145d35 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5929-d91a5390a0d86ac5168cbcfcdd8805414ecac681: d91a5390a0d86ac5168cbcfcdd8805414ecac681
>   xe-pw-173577v4: 173577v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173577v4/index.html
