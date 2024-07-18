Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3359CC3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 07:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF2910E586;
	Thu, 18 Jul 2024 07:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGKsM1Cj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8644A10E586
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 07:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721286732; x=1752822732;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+HNwKtSXQIczGVz6/TRe4BBLfKYTRys8B16CuS1hCJE=;
 b=WGKsM1CjfPsxAbrD3j/p29bPtBqviJdfuPlzBN6PzJEOV2Vp9N5eJxUW
 f2nZgRETXrkHprP7P9Rcde8knwwH6Mn2UF9j0kGG7XeBoUG/yjGhqLYjB
 ucebwHIAA76JryU0/Jr9s4OWyx/lahIr272brv7w5FudqpCsBrzGvMsiW
 WLT05DRdRRvqSV1W/gEkGEL5brr+P47l/a0V33ViQn8XpcimLPKHcWSw/
 IYfJcr6jjeV3qSvFasgG+ZaSog4oZ1X5phmTtdo8Jk4ciz958FHKjBRSP
 BhHUpVX+DbAD1tVZlulGUDsc65MsQnBkjzldPPkEdS+SrnhRxFGtxv0L5 A==;
X-CSE-ConnectionGUID: +2uI518XTkCuiyxr7c/ZEQ==
X-CSE-MsgGUID: Ox0DKUaMRlOh2zDnmP3RAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18964813"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="18964813"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 00:11:58 -0700
X-CSE-ConnectionGUID: /CRsy1hHTze3Tt+2cM/jCA==
X-CSE-MsgGUID: UHr6LtimTmWcNe+5wQcH1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="88152193"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 18 Jul 2024 00:11:54 -0700
Received: from [10.246.36.158] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.36.158])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 373EA12591
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 08:11:52 +0100 (IST)
Message-ID: <77784d11-3fea-45d0-8d10-e47850248292@intel.com>
Date: Thu, 18 Jul 2024 09:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Convert_live_tes?=
 =?UTF-8?Q?ts_to_parameterized_style_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <172126759953.271837.430732902791667921@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172126759953.271837.430732902791667921@2413ebb6fbb6>
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



On 18.07.2024 03:53, Patchwork wrote:
> == Series Details ==
> 
> Series: Convert live tests to parameterized style (rev2)
> URL   : https://patchwork.freedesktop.org/series/136163/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f_full -> xe-pw-136163v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-136163v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136163v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-136163v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

unrelated, series is strictly related to live-tests only

> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-lnl:          [PASS][3] -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-5/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

expected, due to using different way to report SKIP:

[ ]     # xe_bo_evict_kunit: Skipping non-discrete device 0000:00:02.0.
[ ]     ok 1 xe_bo_evict_kunit

vs

[ ]         ok 1 0000:00:02.0 # SKIP Skipping non-discrete device
0000:00:02.0.
[ ]     ok 1 xe_bo_evict_kunit # SKIP

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136163v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#623])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#660])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][8] ([Intel XE#1725])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_big_fb@linear-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1407]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][10] ([Intel XE#1231])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#610])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +5 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#346])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#367]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#367])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1399]) +9 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#1252])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#306])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#306])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#373]) +4 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#307])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#307])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#307])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1468])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-max-size:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1424])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#308])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1413]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#309]) +2 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#323])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#309])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-adlp:         [PASS][41] -> [DMESG-WARN][42] ([Intel XE#877]) +1 other test dmesg-warn
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-8/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-2/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1135] / [Intel XE#1201])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1421]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#886]) +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1401]) +3 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1397] / [Intel XE#1745])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1397])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][52] -> [FAIL][53] ([Intel XE#1874]) +1 other test fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#651]) +9 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#656]) +14 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656]) +24 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1469])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1470])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][63] -> [SKIP][64] ([Intel XE#1201] / [Intel XE#455])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][65] -> [DMESG-WARN][66] ([Intel XE#2019]) +1 other test dmesg-warn
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-adlp:         NOTRUN -> [FAIL][67] ([Intel XE#1874]) +4 other tests fail
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#599]) +6 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#498]) +7 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#305]) +3 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1909])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [PASS][74] -> [FAIL][75] ([Intel XE#1430])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#2007])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1439])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#1489])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1122] / [Intel XE#1201])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-lnl:          NOTRUN -> [FAIL][82] ([Intel XE#1649]) +1 other test fail
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@pr-cursor-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1406]) +4 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_psr@pr-cursor-plane-move.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1149] / [Intel XE#1201])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#327])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#327])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1437])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1435])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][90] -> [FAIL][91] ([Intel XE#899]) +1 other test fail
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][92] ([Intel XE#2180]) +1 other test fail
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-433/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#756])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1091])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1123] / [Intel XE#1201])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][97] -> [TIMEOUT][98] ([Intel XE#1473] / [Intel XE#402])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-cm-threads-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#688]) +5 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@xe_evict@evict-cm-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#261])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][101] -> [TIMEOUT][102] ([Intel XE#1473])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][104] -> [TIMEOUT][105] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-435/igt@xe_evict@evict-threads-large.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_balancer@no-exec-parallel-userptr:
>     - shard-lnl:          [PASS][106] -> [INCOMPLETE][107] ([Intel XE#1960])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-5/igt@xe_exec_balancer@no-exec-parallel-userptr.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@xe_exec_balancer@no-exec-parallel-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1392]) +4 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#255])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-adlp:         [PASS][113] -> [SKIP][114] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-8/igt@xe_live_ktest@xe_bo.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-2/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-adlp:         [PASS][115] -> [SKIP][116] ([Intel XE#1201])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#378]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-433/igt@xe_module_load@force-load.html
>     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#378])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#977])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#366]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-lnl:          [PASS][121] -> [INCOMPLETE][122] ([Intel XE#1358])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-7/igt@xe_pm@s2idle-exec-after.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-5/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#584]) +1 other test skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [PASS][124] -> [ABORT][125] ([Intel XE#1794]) +1 other test abort
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-1/igt@xe_pm@s4-mocs.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-9/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm_residency@idle-residency-on-exec:
>     - shard-lnl:          [PASS][126] -> [TIMEOUT][127] ([Intel XE#2155])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-8/igt@xe_pm_residency@idle-residency-on-exec.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#944])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#944]) +2 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-7/igt@xe_query@multigpu-query-invalid-size.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1130] / [Intel XE#1201])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][131] ([Intel XE#1426]) -> [PASS][132] +1 other test pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - shard-lnl:          [FAIL][133] ([Intel XE#1659]) -> [PASS][134] +1 other test pass
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][135] -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-lnl:          [FAIL][137] ([Intel XE#1541]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a6-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][139] ([Intel XE#1195]) -> [PASS][140] +1 other test pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a6-dp4.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@ad-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-lnl:          [FAIL][141] ([Intel XE#886]) -> [PASS][142] +1 other test pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][143] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][144]
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [FAIL][145] ([Intel XE#1874]) -> [PASS][146] +3 other tests pass
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][147] ([Intel XE#1162]) -> [PASS][148]
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
> 
>   * {igt@kms_plane@plane-position-covered@pipe-a-plane-1}:
>     - shard-lnl:          [DMESG-FAIL][149] ([Intel XE#324]) -> [PASS][150] +3 other tests pass
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
> 
>   * {igt@kms_plane@plane-position-covered@pipe-b-plane-1}:
>     - shard-lnl:          [DMESG-WARN][151] ([Intel XE#324]) -> [PASS][152] +1 other test pass
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][153] ([Intel XE#899]) -> [PASS][154]
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][155] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][156] +1 other test pass
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-lnl:          [ABORT][157] ([Intel XE#1794]) -> [PASS][158]
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-lnl-2/igt@xe_pm@s4-mocs.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-lnl-1/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [ABORT][159] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][160]
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [ABORT][161] ([Intel XE#1794]) -> [PASS][162]
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-6/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][163] ([Intel XE#1231]) -> [DMESG-FAIL][164] ([Intel XE#324])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][165] ([Intel XE#324]) -> [FAIL][166] ([Intel XE#1231])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][167] ([Intel XE#1195] / [Intel XE#2019]) -> [DMESG-WARN][168] ([Intel XE#2019])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [FAIL][169] ([Intel XE#1729]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#362])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [FAIL][171] ([Intel XE#1000]) -> [INCOMPLETE][172] ([Intel XE#1195] / [Intel XE#1473])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_reset@close-fd:
>     - shard-dg2-set2:     [ABORT][173] ([Intel XE#2273] / [Intel XE#2309]) -> [ABORT][174] ([Intel XE#2271] / [Intel XE#2309])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-434/igt@xe_exec_reset@close-fd.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-434/igt@xe_exec_reset@close-fd.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][175] ([Intel XE#2105]) -> [ABORT][176] ([Intel XE#2271] / [Intel XE#2309])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_reset@virtual-close-fd:
>     - shard-dg2-set2:     [ABORT][177] ([Intel XE#2271]) -> [ABORT][178] ([Intel XE#2273])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f/shard-dg2-466/igt@xe_exec_reset@virtual-close-fd.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/shard-dg2-463/igt@xe_exec_reset@virtual-close-fd.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
>   [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
>   [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2155
>   [Intel XE#2180]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2180
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
>   [Intel XE#2273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2273
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f -> xe-pw-136163v2
> 
>   IGT_7928: 294a7a487aab103c54b0deeb1559fcba371232d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1620-bd2a84d801982bd4a899a29916b458a8f82cb01f: bd2a84d801982bd4a899a29916b458a8f82cb01f
>   xe-pw-136163v2: 136163v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136163v2/index.html
> 
