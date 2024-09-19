Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966C1CE8D5C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 08:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658B010E69E;
	Thu, 19 Sep 2024 08:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VCnAv6Mt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10B710E69E
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 08:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726734632; x=1758270632;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JZZAP2uTfcKlKThdLjc3+25fbLfxlQvD8y0HE8saqj8=;
 b=VCnAv6MtgtxtJ+pi4CJUppM4SCtCVUNvFMweTQqEVfjzitjrbrQsfIIa
 QCntU9P9gyGzn5yKXB5cWM7HD3xu8FfRQRhDGceqRm8nTufQc3Wv6jZCN
 iZiMMkaVtGq1yeEMqzvMNZa7Hr/6d1Gp+HIFxUaNvmUuZ3w1T7xl6DkoU
 VlIjAswDSACl1wYfIgQ21Fsx6SmpVMx7KvW5JRKHD4Zp76flDSdQNzluy
 M/P6RzHwLzZpK3/rIkA85mVVYS53z6IhGLNykrkh0kBKQBuyVcp6XnzVK
 3eWIe3GDLsuBvczl8wWBa3fH2VxoXZYoZUUHcg5WbFR46d7f/JFQwtS/z Q==;
X-CSE-ConnectionGUID: pQpNSJ67TMiYLCHZqThikw==
X-CSE-MsgGUID: cIFw+7PfRKms7xaIgPw/sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25509263"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25509263"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:30:31 -0700
X-CSE-ConnectionGUID: OBbo9dl0TeiSGusFJKUIsA==
X-CSE-MsgGUID: 0ql0XLB/QYyqf2LyhIIYhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74837015"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 19 Sep 2024 01:30:28 -0700
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8EF38312C7;
 Thu, 19 Sep 2024 09:30:26 +0100 (IST)
Message-ID: <8726eff3-e38b-4589-8845-f5f47d9a3177@intel.com>
Date: Thu, 19 Sep 2024 10:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_memirq_infra_cha?=
 =?UTF-8?Q?nges_=28rev8=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>, Ilia Levi <ilia.levi@intel.com>
References: <20240918053942.1331811-1-illevi@habana.ai>
 <172669000564.1027924.15351854987727780678@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172669000564.1027924.15351854987727780678@2413ebb6fbb6>
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



On 18.09.2024 22:06, Patchwork wrote:
> == Series Details ==
> 
> Series: memirq infra changes (rev8)
> URL   : https://patchwork.freedesktop.org/series/137643/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9_full -> xe-pw-137643v8_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-137643v8_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-137643v8_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-137643v8_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-463/igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-435/igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-4.html

this is unrelated

<3> [266.587170] xe 0000:03:00.0: [drm] *ERROR* GT0: GuC PC Start failed
<4> [266.587284] ------------[ cut here ]------------
<4> [266.587286] xe 0000:03:00.0: [drm] GT0: Failed to start GuC PC: -EIO

and series was pushed to drm-xe/drm-xe-next

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_cursor_legacy@single-move@pipe-b:
>     - {shard-bmg}:        [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-bmg-2/igt@kms_cursor_legacy@single-move@pipe-b.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-bmg-3/igt@kms_cursor_legacy@single-move@pipe-b.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-137643v8_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#324]) +2 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#599]) +5 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [FAIL][8] ([Intel XE#1659])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1399]) +2 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#373])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#373])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1424]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#309])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-466/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#886]) +3 other tests fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#352])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#651])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#658])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#651]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#651])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#656]) +5 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][26] -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-433/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-a-plane-2:
>     - shard-lnl:          [PASS][28] -> [DMESG-FAIL][29] ([Intel XE#324])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-2.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-a-plane-2.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
>     - shard-lnl:          [PASS][30] -> [DMESG-WARN][31] ([Intel XE#324]) +1 other test dmesg-warn
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][32] -> [FAIL][33] ([Intel XE#1874])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][34] -> [FAIL][35] ([Intel XE#361])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#2763]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2763]) +2 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1406])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#929])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr2-cursor-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#929])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_psr@psr2-cursor-render.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1435]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [PASS][43] -> [FAIL][44] ([Intel XE#771] / [Intel XE#899])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][45] -> [FAIL][46] ([Intel XE#899])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][47] -> [FAIL][48] ([Intel XE#899])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-lnl:          [PASS][49] -> [INCOMPLETE][50] ([Intel XE#2712]) +1 other test incomplete
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-5/igt@kms_vblank@ts-continuation-suspend.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-7/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#688]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1392])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#378])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@xe_module_load@load.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-adlp:         [PASS][54] -> [TIMEOUT][55] ([Intel XE#2026])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-9/igt@xe_module_load@many-reload.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-9/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#979])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [PASS][57] -> [ABORT][58] ([Intel XE#1358] / [Intel XE#1607])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          [PASS][59] -> [ABORT][60] ([Intel XE#1358] / [Intel XE#1607])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-8/igt@xe_pm@s4-exec-after.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-2/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [PASS][61] -> [FAIL][62] ([Intel XE#958])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-lnl:          [DMESG-WARN][63] ([Intel XE#2317]) -> [PASS][64]
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-2/igt@core_hotunplug@hotreplug.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-3/igt@core_hotunplug@hotreplug.html
> 
>   * igt@kms_plane@pixel-format@pipe-b-plane-0:
>     - {shard-bmg}:        [DMESG-WARN][65] ([Intel XE#877]) -> [PASS][66] +5 other tests pass
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-bmg-4/igt@kms_plane@pixel-format@pipe-b-plane-0.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-bmg-1/igt@kms_plane@pixel-format@pipe-b-plane-0.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>     - shard-lnl:          [DMESG-WARN][67] ([Intel XE#324]) -> [PASS][68] +2 other tests pass
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-5/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
>     - shard-lnl:          [DMESG-FAIL][69] ([Intel XE#324]) -> [PASS][70] +3 other tests pass
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1:
>     - shard-adlp:         [FAIL][71] ([Intel XE#1874]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [FAIL][73] ([Intel XE#1430]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-lnl:          [FAIL][75] -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-8/igt@kms_pm_rpm@system-suspend-modeset.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-8/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
>     - {shard-bmg}:        [INCOMPLETE][77] -> [PASS][78] +2 other tests pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-bmg-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-bmg-3/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-adlp:         [FAIL][79] ([Intel XE#899]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - {shard-bmg}:        [FAIL][81] ([Intel XE#2364]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-bmg-3/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>     - shard-dg2-set2:     [FAIL][83] ([Intel XE#1600]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [FAIL][85] ([Intel XE#1000]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_exec_compute_mode@once-userptr-invalidate:
>     - shard-lnl:          [FAIL][87] ([Intel XE#1069]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-2/igt@xe_exec_compute_mode@once-userptr-invalidate.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@xe_exec_compute_mode@once-userptr-invalidate.html
> 
>   * igt@xe_exec_reset@cat-error:
>     - shard-adlp:         [DMESG-WARN][89] ([Intel XE#358]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-9/igt@xe_exec_reset@cat-error.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-9/igt@xe_exec_reset@cat-error.html
> 
>   * igt@xe_oa@oa-exponents:
>     - shard-lnl:          [FAIL][91] ([Intel XE#2723]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-8/igt@xe_oa@oa-exponents.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-8/igt@xe_oa@oa-exponents.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-lnl:          [ABORT][93] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][95] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][96] ([Intel XE#316]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][97] ([Intel XE#316]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#1124]) -> [SKIP][100] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][101] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][102] ([Intel XE#1124]) +6 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][103] ([Intel XE#324]) -> [FAIL][104] ([Intel XE#1242])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][105] ([Intel XE#1242]) -> [FAIL][106] ([Intel XE#1231])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][107] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][108] ([Intel XE#619])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][109] ([Intel XE#346]) -> [SKIP][110] ([Intel XE#1201] / [Intel XE#346])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_big_joiner@basic.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][112] ([Intel XE#367]) +2 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][113] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][114] ([Intel XE#2191]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#2191]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#2191]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#367]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#787]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#787]) +90 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][122] ([Intel XE#1252]) +1 other test skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][124] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#1252]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#1252])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][128] ([Intel XE#787]) +48 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#306]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#306])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][134] ([Intel XE#306]) +1 other test skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][136] ([Intel XE#373]) +5 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#373]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][140] ([Intel XE#323])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#323]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#323])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][144] ([Intel XE#307])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#455]) -> [SKIP][146] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][148] ([Intel XE#776])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#651]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#651]) +24 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][152] ([Intel XE#651]) +19 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#653]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][156] ([Intel XE#653]) +19 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#658]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#658])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][160] ([Intel XE#605])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#2763]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#2763]) +2 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][166] ([Intel XE#870])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1129]) -> [SKIP][168] ([Intel XE#1129] / [Intel XE#1201])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][170] ([Intel XE#1489]) +1 other test skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#1489]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#1489]) +4 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][174] ([Intel XE#1122])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][176] ([Intel XE#929]) +9 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr-sprite-render:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#929]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1149]) -> [SKIP][180] ([Intel XE#1149] / [Intel XE#1201])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#327]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#1127]) -> [SKIP][184] ([Intel XE#1127] / [Intel XE#1201])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#362])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][188] ([Intel XE#2168])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-433/igt@kms_vrr@cmrr.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][190] ([Intel XE#455]) +13 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@kms_vrr@flipline.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#1091]) -> [SKIP][192] ([Intel XE#1091] / [Intel XE#1201])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1123]) -> [SKIP][194] ([Intel XE#1123] / [Intel XE#1201])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][196] ([Intel XE#1123]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1126]) -> [SKIP][198] ([Intel XE#1126] / [Intel XE#1201])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#288]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#288]) +20 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][202] ([Intel XE#288]) +17 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@xe_exec_fault_mode@twice-invalid-fault.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@xe_exec_fault_mode@twice-invalid-fault.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#2360]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#2360])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][206] ([Intel XE#2360])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#255]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#255])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][210] ([Intel XE#560])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@xe_media_fill@media-fill.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][212] ([Intel XE#2541]) +6 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#2541]) -> [SKIP][214] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#979]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#979])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][218] ([Intel XE#2284] / [Intel XE#366])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-436/igt@xe_pm@d3cold-basic.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][222] ([Intel XE#944]) +1 other test skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-433/igt@xe_query@multigpu-query-topology.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#944]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2712
>   [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9 -> xe-pw-137643v8
> 
>   IGT_8024: 15f8ad0bce184e96d171dfe19c06bdef93e7cf72 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1966-692d461fa9a48c6600df07421a99308f49cf00a9: 692d461fa9a48c6600df07421a99308f49cf00a9
>   xe-pw-137643v8: 137643v8
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137643v8/index.html
> 
