Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23B5C02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 19:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A73A10E9E3;
	Thu, 16 Jan 2025 19:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSC0cMxZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8FA10E257;
 Thu, 16 Jan 2025 19:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737054414; x=1768590414;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=i9Du3ZKzBu6AjtW2VUiZlcMvT+ps0qaLgt/b/svcTlA=;
 b=GSC0cMxZ8nEtQU8d5T14pQhMIPkef1uYdcrjpcb/ykFNbTKMlNUSYY6v
 FN5vo8SV9oFMcebkth2V+1lk/iApegNhE4rTe9Wz2TsIAC8EkCwHGWxNF
 tosrTqBmPv4k508YsSYcpN5voyMVAD1ZrLOkdMpikHY0AIJoUQvhv+vkF
 2mmoY1LhkK790cdDHzSUcCtDaPsVoByMrjes5rlayctcgj9wpxDbnj1E3
 TxNIcf2X/jYLq039mm6RT5E1Qs8KRnVM/A2INdzsgmYIfPJLmLBe7Sb2o
 je3nO6pZTIkGK0nHL1MOMzXXtI2tgyVHryg1NPefawRWCnGTM3NgFDFHM g==;
X-CSE-ConnectionGUID: /YyOKGRQS1y0aCifhjWp5w==
X-CSE-MsgGUID: mhIZYzbXTXeWoBwnsdfXhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="48856379"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="48856379"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 11:06:53 -0800
X-CSE-ConnectionGUID: 5YvPb7soR+KQeE4uRo43nA==
X-CSE-MsgGUID: BnUCvjl3TLyi1J5We94eBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="110575529"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 11:06:51 -0800
Date: Thu, 16 Jan 2025 21:07:45 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Cc: I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/dp: Enable DP tunneling (rev2)
Message-ID: <Z4lZAZaN5A0GB-z4@ideak-desk.fi.intel.com>
References: <20250113154832.1004369-1-imre.deak@intel.com>
 <173687726174.3666309.4004966183106247364@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173687726174.3666309.4004966183106247364@b555e5b46a47>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 14, 2025 at 05:54:21PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/dp: Enable DP tunneling (rev2)
> URL   : https://patchwork.freedesktop.org/series/143467/
> State : failure

Thanks for the reviews, the patch is pushed to drm-intel-next.

The failures are unrelated, as all the given platforms are without any
(Thunderbolt) DP tunnel present. On DP connectors there is a DP-AUX
based detection on these platforms too, but I can't see how that alone
would lead to any of the failures here.

> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2482-3deaca65541212fd09c8832090815813e6128caa_full -> xe-pw-143467v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-143467v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-143467v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-143467v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-2.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@basic-flip-vs-modeset@a-dp4:
>     - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-436/igt@kms_flip@basic-flip-vs-modeset@a-dp4.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-433/igt@kms_flip@basic-flip-vs-modeset@a-dp4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-2482-3deaca65541212fd09c8832090815813e6128caa_full and xe-pw-143467v2_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_hdr@static-swap@pipe-a-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.91] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-143467v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#2953]) +5 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#2550]) +23 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-2-4-rc-ccs-cc.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#873])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#873])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_async_flips@test-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#664])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_async_flips@test-cursor-atomic.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1407]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +1 other test skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +4 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#316])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1428])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1124]) +4 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1124])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2328])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +6 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2314] / [Intel XE#2894])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2191])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#2191])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2191]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#367])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#367])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#787]) +5 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#787]) +132 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +6 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2652] / [Intel XE#787]) +4 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#3432])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#829])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2887]) +9 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#306])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2325])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#306])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2252]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#373]) +4 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#373]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1178]) +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2390])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#307])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][49] ([Intel XE#1178])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#1188]) +1 other test fail
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2321])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#2321]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2320]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_cursor_crc@cursor-random-256x85.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#309])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#2291]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          [PASS][58] -> [DMESG-WARN][59] ([Intel XE#877])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2291]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#309])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [FAIL][62] ([Intel XE#2141]) +2 other tests fail
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#2244])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#703])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2316]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#301])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][68] -> [FAIL][69] ([Intel XE#2882] / [Intel XE#3820]) +1 other test fail
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][70] -> [FAIL][71] ([Intel XE#3820])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#301]) +4 other tests fail
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1421]) +3 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [PASS][74] -> [SKIP][75] ([Intel XE#2316]) +3 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-8/igt@kms_flip@2x-nonexisting-fb.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate:
>     - shard-bmg:          [PASS][76] -> [FAIL][77] ([Intel XE#2882]) +1 other test fail
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-7/igt@kms_flip@plain-flip-fb-recreate.html
>     - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#2882])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a6:
>     - shard-dg2-set2:     [PASS][80] -> [FAIL][81] ([Intel XE#886]) +1 other test fail
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a6.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a6.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-edp1:
>     - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#886]) +1 other test fail
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
>     - shard-lnl:          NOTRUN -> [FAIL][84] ([Intel XE#886]) +2 other tests fail
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1401]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1397]) +1 other test skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#455]) +9 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2293] / [Intel XE#2380])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2293])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#651]) +16 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#656]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-bmg:          NOTRUN -> [FAIL][94] ([Intel XE#2333]) +6 other tests fail
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2311]) +11 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#651]) +6 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2352])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2312]) +7 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#656]) +13 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#653]) +12 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2313]) +8 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#653])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2934])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#2927])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2493])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][106] -> [FAIL][107] ([Intel XE#361])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][108] ([Intel XE#2566])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2763]) +11 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2763]) +5 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#870])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1122])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2392])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#3309])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_pm_dc@dc5-retention-flops.html
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#3309])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1489]) +5 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#2893])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#1489]) +2 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1489])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-sprite-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1406]) +3 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@kms_psr@fbc-pr-sprite-blt.html
> 
>   * igt@kms_psr@fbc-psr-no-drrs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-blt.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-render:
>     - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_psr@fbc-psr2-cursor-render.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2939])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2414])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#3414] / [Intel XE#3904])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#3414])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_setmode@basic:
>     - shard-lnl:          NOTRUN -> [FAIL][129] ([Intel XE#2883]) +1 other test fail
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#455])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#1499]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [PASS][132] -> [SKIP][133] ([Intel XE#1499])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-1/igt@kms_vrr@negative-basic.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#756])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_eudebug_online@stopped-thread:
>     - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#2905]) +3 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@xe_eudebug_online@stopped-thread.html
> 
>   * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
>     - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#2905]) +4 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][138] -> [TIMEOUT][139] ([Intel XE#1473] / [Intel XE#402])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-threads-large-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#688]) +2 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@xe_evict@evict-beng-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-bmg:          NOTRUN -> [FAIL][141] ([Intel XE#2364])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-bmg:          NOTRUN -> [TIMEOUT][142] ([Intel XE#1473])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#688])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-dg2-set2:     [PASS][144] -> [SKIP][145] ([Intel XE#1392]) +5 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2322]) +1 other test skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1392]) +4 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#288]) +13 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#288]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
> 
>   * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2905]) +6 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [FAIL][151] ([Intel XE#3099]) +1 other test fail
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_mmap@pci-membarrier-bad-object:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#4045])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@xe_mmap@pci-membarrier-bad-object.html
> 
>   * igt@xe_module_load@load:
>     - shard-dg2-set2:     ([PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177]) -> ([PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [SKIP][202], [PASS][203]) ([Intel XE#378])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-434/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-434/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-432/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-432/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-432/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-432/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-432/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-436/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-436/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-433/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-433/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-436/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-434/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-434/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-436/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-433/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-433/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-464/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-464/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-464/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-435/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-435/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-435/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-435/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-435/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-435/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-433/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-435/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-435/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-433/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-435/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-433/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-433/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@invalid-create-userspace-config:
>     - shard-adlp:         NOTRUN -> [SKIP][204] ([Intel XE#2541] / [Intel XE#3573])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@xe_oa@invalid-create-userspace-config.html
> 
>   * igt@xe_oa@non-privileged-access-vaddr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][205] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#1420] / [Intel XE#2838])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#979])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][208] ([Intel XE#1173])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#2284] / [Intel XE#366])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-dg2-set2:     [PASS][210] -> [ABORT][211] ([Intel XE#1358] / [Intel XE#1794]) +2 other tests abort
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-464/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#584]) +1 other test skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-1/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-adlp:         NOTRUN -> [SKIP][213] ([Intel XE#944])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-6/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-bmg:          NOTRUN -> [SKIP][214] ([Intel XE#944]) +1 other test skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#944])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic@plane-invalid-params@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][216] -> [PASS][217] +1 other test pass
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-adlp-3/igt@kms_atomic@plane-invalid-params@pipe-a-hdmi-a-1.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-4/igt@kms_atomic@plane-invalid-params@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [FAIL][218] ([Intel XE#3908]) -> [PASS][219] +1 other test pass
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][220] ([Intel XE#1033]) -> [PASS][221]
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_color@legacy-gamma:
>     - shard-bmg:          [DMESG-WARN][222] ([Intel XE#877]) -> [PASS][223] +1 other test pass
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-8/igt@kms_color@legacy-gamma.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-2/igt@kms_color@legacy-gamma.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][224] ([Intel XE#2291]) -> [PASS][225] +2 other tests pass
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-lnl:          [FAIL][226] ([Intel XE#1475]) -> [PASS][227] +1 other test pass
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [SKIP][228] ([Intel XE#2316]) -> [PASS][229] +4 other tests pass
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][230] -> [PASS][231] +1 other test pass
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-433/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a6-dp4.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][232] ([Intel XE#301]) -> [PASS][233] +1 other test pass
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible:
>     - shard-bmg:          [INCOMPLETE][234] -> [PASS][235] +1 other test pass
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-8/igt@kms_flip@flip-vs-rmfb-interruptible.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_flip@flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][236] ([Intel XE#2953]) -> [PASS][237] +9 other tests pass
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@plain-flip-ts-check:
>     - shard-bmg:          [FAIL][238] ([Intel XE#2882]) -> [PASS][239] +2 other tests pass
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-5/igt@kms_flip@plain-flip-ts-check.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-8/igt@kms_flip@plain-flip-ts-check.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][240] ([Intel XE#886]) -> [PASS][241] +1 other test pass
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-436/igt@kms_flip@plain-flip-ts-check@a-hdmi-a6.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-433/igt@kms_flip@plain-flip-ts-check@a-hdmi-a6.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible:
>     - shard-dg2-set2:     [FAIL][242] ([Intel XE#2882]) -> [PASS][243]
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-433/igt@kms_flip@wf_vblank-ts-check-interruptible.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][244] -> [PASS][245] +2 other tests pass
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-433/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a6.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a6.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][246] ([Intel XE#361]) -> [PASS][247]
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][248] ([Intel XE#899]) -> [PASS][249]
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][250] ([Intel XE#2142]) -> [PASS][251] +1 other test pass
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#1392]) -> [PASS][253]
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-bmg:          [INCOMPLETE][254] ([Intel XE#3592]) -> [PASS][255]
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-4/igt@xe_exec_reset@cm-gt-reset.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-5/igt@xe_exec_reset@cm-gt-reset.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-dg2-set2:     [ABORT][256] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][257] +1 other test pass
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-432/igt@xe_pm@s2idle-basic.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [ABORT][258] ([Intel XE#1358]) -> [PASS][259]
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [ABORT][260] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][261]
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-lnl-2/igt@xe_pm@s4-basic.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-lnl-3/igt@xe_pm@s4-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-adlp:         [DMESG-FAIL][262] ([Intel XE#1033]) -> [DMESG-FAIL][263] ([Intel XE#1033] / [Intel XE#2953])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-bmg:          [SKIP][264] ([Intel XE#2341]) -> [FAIL][265] ([Intel XE#1178])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-3/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][266] ([Intel XE#2312]) -> [SKIP][267] ([Intel XE#2311]) +11 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][268] ([Intel XE#2312]) -> [FAIL][269] ([Intel XE#2333]) +4 other tests fail
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          [FAIL][270] ([Intel XE#2333]) -> [SKIP][271] ([Intel XE#2312]) +4 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][272] ([Intel XE#2311]) -> [SKIP][273] ([Intel XE#2312]) +8 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][274] ([Intel XE#2312]) -> [SKIP][275] ([Intel XE#2313]) +12 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][276] ([Intel XE#2313]) -> [SKIP][277] ([Intel XE#2312]) +9 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][278] ([Intel XE#1729]) -> [SKIP][279] ([Intel XE#2426])
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][280] ([Intel XE#2509]) -> [SKIP][281] ([Intel XE#2426])
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-bmg:          [TIMEOUT][282] ([Intel XE#1473]) -> [FAIL][283] ([Intel XE#1000])
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-8/igt@xe_evict@evict-beng-threads-large.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][284] ([Intel XE#1473]) -> [TIMEOUT][285] ([Intel XE#1473] / [Intel XE#2472])
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-bmg:          [TIMEOUT][286] ([Intel XE#1473] / [Intel XE#2472]) -> [INCOMPLETE][287] ([Intel XE#1473])
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-1/igt@xe_evict@evict-mixed-threads-large.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-6/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-bmg:          [SKIP][288] ([Intel XE#1192]) -> [FAIL][289] ([Intel XE#3099])
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-bmg-6/igt@xe_live_ktest@xe_bo.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-bmg-1/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-dg2-set2:     [SKIP][290] ([Intel XE#1061]) -> [FAIL][291] ([Intel XE#1173])
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2482-3deaca65541212fd09c8832090815813e6128caa/shard-dg2-432/igt@xe_peer2peer@write.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/shard-dg2-434/igt@xe_peer2peer@write.html
> 
>   
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
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
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
>   [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#3592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3592
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3820]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3820
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2482-3deaca65541212fd09c8832090815813e6128caa -> xe-pw-143467v2
> 
>   IGT_8189: e036190dc1730ecb94cb393f88378e734db4b1d6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2482-3deaca65541212fd09c8832090815813e6128caa: 3deaca65541212fd09c8832090815813e6128caa
>   xe-pw-143467v2: 143467v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143467v2/index.html
