Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8793BEE49B0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 13:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2814510E078;
	Wed, 11 Sep 2024 13:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OgD2MV89";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD0710E078
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 13:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726063079; x=1757599079;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=VNv/hX1WpltFlpSqlZiHGv8eF5gyrMH6/rCVdP2Swyw=;
 b=OgD2MV89/VP5XgTlnicPXwB6IQCTdusdcL5+X7j7jTg8RsVyPLKfLTyk
 bXZq9SnqAjDcKKfndoXBcgnhg9cjWd8jrGAT/p/b7uTkXEzkpGA+21+1B
 sLXuwFTDP7oTzDx37xsTyznuc9rVTPcg3ze2oVdHiyv+YjEGr4V7NW2S2
 ftTLpbaJEnvpStFTYP/nyD8s0AVkhaAk3jm2qKFS0gcCg3y2PjnL3AkUu
 O78dtAjcqvJrSWV5c3tuWY+4nb0iL6zU20zwEh/C/fILn6HycnhrniRRK
 hiJubTv+P4pVFIc7R0o2PxSc2FY7MOpg1yl6UkvQehFvYEaQVc/fi+ly2 A==;
X-CSE-ConnectionGUID: sOA2ZUm3QSiM1/ujdNGT7Q==
X-CSE-MsgGUID: YvEmtZwaTl+EYsG3C+P4qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25000590"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="25000590"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 06:57:58 -0700
X-CSE-ConnectionGUID: 3iL5D+WIRaKqv9/dpS4Okw==
X-CSE-MsgGUID: jr//acvzTFmqV9LB/lbxrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67095045"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.178.53])
 ([10.245.178.53])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 06:57:56 -0700
Message-ID: <2e3a1891-bc57-4e25-9982-be3af6eda05e@linux.intel.com>
Date: Wed, 11 Sep 2024 15:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/xe2hpg=3A?=
 =?UTF-8?Q?_Add_Wa=5F15016589081_=28rev2=29?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
References: <20240904101333.2049655-1-tejas.upadhyay@intel.com>
 <172562011712.954119.3572481336019595457@2413ebb6fbb6>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <172562011712.954119.3572481336019595457@2413ebb6fbb6>
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


On 9/6/2024 12:55 PM, Patchwork wrote:
> == Series Details ==
>
> Series: drm/xe/xe2hpg: Add Wa_15016589081 (rev2)
> URL   : https://patchwork.freedesktop.org/series/137889/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea_full -> xe-pw-137889v2_full
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-137889v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-137889v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-137889v2_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-3/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

Looks unrelated.


Merged to drm-xe-next


>
>   
> #### Suppressed ####
>
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
>
>   * igt@kms_cdclk@mode-transition:
>     - {shard-bmg}:        [FAIL][3] ([Intel XE#2435]) -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-1/igt@kms_cdclk@mode-transition.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-bmg-8/igt@kms_cdclk@mode-transition.html
>
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - {shard-bmg}:        [SKIP][5] ([Intel XE#314]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html
>
>   * igt@kms_cdclk@plane-scaling:
>     - {shard-bmg}:        [FAIL][7] ([Intel XE#2429]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-bmg-1/igt@kms_cdclk@plane-scaling.html
>
>   
> Known issues
> ------------
>
>   Here are the changes found in xe-pw-137889v2_full that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
>     - shard-adlp:         [PASS][9] -> [DMESG-WARN][10] ([Intel XE#1033])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
>
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [PASS][11] -> [DMESG-WARN][12] ([Intel XE#324]) +1 other test dmesg-warn
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [PASS][13] -> [FAIL][14] ([Intel XE#1426]) +1 other test fail
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
>     - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#1426]) +3 other tests fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
>
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
>
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][19] -> [DMESG-FAIL][20] ([Intel XE#324])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-adlp:         NOTRUN -> [FAIL][21] ([Intel XE#1874])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1428])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][23] ([Intel XE#1204]) +1 other test fail
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#787]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html
>
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html
>
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#1252])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1399]) +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
>
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#306])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-7/igt@kms_chamelium_color@ctm-0-25.html
>
>   * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
>
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#373])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-single.html
>
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#309])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#323])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>
>   * igt@kms_feature_discovery@chamelium:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#701])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-8/igt@kms_feature_discovery@chamelium.html
>
>   * igt@kms_feature_discovery@display-4x:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1138] / [Intel XE#1201])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-1/igt@kms_feature_discovery@display-4x.html
>
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#310])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-6/igt@kms_flip@2x-absolute-wf_vblank.html
>
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1421]) +2 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
>
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1195] / [Intel XE#2049] / [Intel XE#2597])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
>
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1195] / [Intel XE#2049])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html
>
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][42] -> [FAIL][43] ([Intel XE#1874]) +9 other tests fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#651]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
>
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         [PASS][45] -> [FAIL][46] ([Intel XE#1861])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
>
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
>
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#656]) +6 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
>
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#656]) +6 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
>
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
>
>   * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
>     - shard-lnl:          [PASS][51] -> [DMESG-FAIL][52] ([Intel XE#324]) +2 other tests dmesg-fail
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
>
>   * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
>     - shard-lnl:          [PASS][53] -> [DMESG-WARN][54] ([Intel XE#324]) +1 other test dmesg-warn
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
>
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [PASS][55] -> [FAIL][56] ([Intel XE#616]) +1 other test fail
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#870])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-4/igt@kms_pm_backlight@fade-with-suspend.html
>
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#1430])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
>
>   * igt@kms_psr@fbc-pr-sprite-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1406]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-move.html
>
>   * igt@kms_psr@pr-sprite-render:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-6/igt@kms_psr@pr-sprite-render.html
>
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-9/igt@kms_scaling_modes@scaling-mode-center.html
>
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1435])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc.html
>
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][64] -> [FAIL][65] ([Intel XE#899])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>
>   * igt@kms_vblank@accuracy-idle:
>     - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#1523]) +1 other test fail
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_vblank@accuracy-idle.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-4/igt@kms_vblank@accuracy-idle.html
>
>   * igt@kms_vrr@max-min:
>     - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#2443]) +1 other test fail
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@kms_vrr@max-min.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-6/igt@kms_vrr@max-min.html
>
>   * igt@kms_writeback@writeback-check-output:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#756])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-4/igt@kms_writeback@writeback-check-output.html
>
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@xe_evict@evict-beng-cm-threads-large.html
>
>   * igt@xe_evict@evict-beng-small-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#688])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-5/igt@xe_evict@evict-beng-small-external-cm.html
>
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#1000])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@xe_evict@evict-threads-large.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-466/igt@xe_evict@evict-threads-large.html
>
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1392]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
>
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#1392])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
>
>   * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
>     - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#1069])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-2/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
>
>   * igt@xe_exec_fault_mode@once-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-4/igt@xe_exec_fault_mode@once-basic.html
>
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#2711])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html
>
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-lnl:          [PASS][82] -> [SKIP][83] ([Intel XE#1192])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@xe_live_ktest@xe_dma_buf.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-7/igt@xe_live_ktest@xe_dma_buf.html
>
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#2229])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [PASS][85] -> [FAIL][86] ([Intel XE#2136])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@xe_module_load@reload.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@xe_module_load@reload.html
>
>   * igt@xe_oa@stress-open-close:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@xe_oa@stress-open-close.html
>
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-dg2-set2:     [PASS][88] -> [INCOMPLETE][89] ([Intel XE#1694])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>
>   * igt@xe_pm@s4-basic:
>     - shard-lnl:          [PASS][90] -> [ABORT][91] ([Intel XE#1358] / [Intel XE#1607])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-8/igt@xe_pm@s4-basic.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-2/igt@xe_pm@s4-basic.html
>
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][92] -> [ABORT][93] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
>
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#944])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>
>   
> #### Possible fixes ####
>
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][95] ([Intel XE#1033]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][97] ([Intel XE#1231]) -> [PASS][98] +1 other test pass
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][99] ([Intel XE#1204]) -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][101] ([Intel XE#324]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
>     - {shard-bmg}:        [FAIL][103] ([Intel XE#2436]) -> [PASS][104] +2 other tests pass
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
>
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-lnl:          [FAIL][105] ([Intel XE#2668]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-6/igt@kms_fbcon_fbt@fbc-suspend.html
>
>   * igt@kms_flip@wf_vblank-ts-check@b-edp1:
>     - shard-lnl:          [FAIL][107] ([Intel XE#886]) -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
>
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-adlp:         [FAIL][109] ([Intel XE#1861]) -> [PASS][110] +1 other test pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
>
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][111] ([Intel XE#2019]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-suspend.html
>
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - {shard-bmg}:        [DMESG-WARN][113] ([Intel XE#877]) -> [PASS][114] +6 other tests pass
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-bmg-5/igt@kms_plane@plane-panning-bottom-right-suspend.html
>
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         [FAIL][115] ([Intel XE#1874]) -> [PASS][116] +3 other tests pass
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:
>     - {shard-bmg}:        [FAIL][117] ([Intel XE#899]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
>
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-adlp:         [FAIL][119] ([Intel XE#899]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][121] ([Intel XE#1473]) -> [PASS][122] +1 other test pass
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
>
>   * igt@xe_evict@evict-mixed-threads-large:
>     - {shard-bmg}:        [TIMEOUT][123] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html
>
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - {shard-bmg}:        [TIMEOUT][125] ([Intel XE#2105]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html
>
>   * igt@xe_oa@mmio-triggered-reports:
>     - {shard-bmg}:        [FAIL][127] ([Intel XE#2249]) -> [PASS][128] +1 other test pass
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html
>     - shard-lnl:          [FAIL][129] ([Intel XE#2249]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@mmio-triggered-reports.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-7/igt@xe_oa@mmio-triggered-reports.html
>
>   * igt@xe_oa@oa-regs-whitelisted:
>     - shard-lnl:          [FAIL][131] ([Intel XE#2514]) -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-1/igt@xe_oa@oa-regs-whitelisted.html
>     - {shard-bmg}:        [FAIL][133] ([Intel XE#2514]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-bmg-2/igt@xe_oa@oa-regs-whitelisted.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted.html
>
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [ABORT][135] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-9/igt@xe_pm@s4-basic.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@xe_pm@s4-basic.html
>
>   * igt@xe_pm@s4-exec-after:
>     - shard-lnl:          [ABORT][137] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-lnl-2/igt@xe_pm@s4-exec-after.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-lnl-1/igt@xe_pm@s4-exec-after.html
>
>   * igt@xe_pm_residency@idle-residency:
>     - shard-dg2-set2:     [FAIL][139] ([Intel XE#2710]) -> [PASS][140] +1 other test pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@xe_pm_residency@idle-residency.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-434/igt@xe_pm_residency@idle-residency.html
>
>   
> #### Warnings ####
>
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#316]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][144] ([Intel XE#316]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][146] ([Intel XE#1124]) +5 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][147] ([Intel XE#324]) -> [FAIL][148] ([Intel XE#1231]) +1 other test fail
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#619]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#619])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html
>
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#607]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#607])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1124]) -> [SKIP][154] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#346]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#346])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-463/igt@kms_big_joiner@invalid-modeset.html
>
>   * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#367]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
>
>   * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][160] ([Intel XE#2191])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
>
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#2191]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#2191])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][164] ([Intel XE#367]) +2 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][166] ([Intel XE#787]) +55 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
>
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][168] ([Intel XE#1252])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][170] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1252]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#787]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
>
>   * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#314]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
>
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][180] ([Intel XE#373]) +2 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#373]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#307]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#307])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html
>
>   * igt@kms_content_protection@mei-interface:
>     - shard-adlp:         [SKIP][185] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][186] ([Intel XE#1201])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-1/igt@kms_content_protection@mei-interface.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-8/igt@kms_content_protection@mei-interface.html
>
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][188] ([Intel XE#323])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#323]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#323])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][192] ([Intel XE#701])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_feature_discovery@chamelium.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
>
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1135]) -> [SKIP][194] ([Intel XE#1135] / [Intel XE#1201])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-435/igt@kms_feature_discovery@psr2.html
>
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][196] ([Intel XE#455]) +8 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
>
>   * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#651]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#651]) +17 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][200] ([Intel XE#651]) +15 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
>
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#658]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#658])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#653]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#653]) +17 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
>
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][206] ([Intel XE#658])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][208] ([Intel XE#653]) +14 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#455]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
>
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][212] ([Intel XE#2318]) +2 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
>
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][214] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#1489]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][218] ([Intel XE#1489]) +1 other test skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
>
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][220] ([Intel XE#1122])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>
>   * igt@kms_psr@fbc-psr-cursor-plane-onoff:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][222] ([Intel XE#929]) +5 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
>
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#929]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#1149]) -> [SKIP][226] ([Intel XE#1149] / [Intel XE#1201])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#327]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#327])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html
>
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][230] ([Intel XE#327])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
>
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][232] ([Intel XE#1127])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][234] ([Intel XE#756])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#1123]) -> [SKIP][236] ([Intel XE#1123] / [Intel XE#1201])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#1126]) -> [SKIP][238] ([Intel XE#1126] / [Intel XE#1201])
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][240] ([Intel XE#288]) +16 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#288]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][244] ([Intel XE#2360])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#2360]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#2360])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][248] ([Intel XE#255])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
>
>   * igt@xe_module_load@many-reload:
>     - shard-adlp:         [TIMEOUT][249] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026]) -> [TIMEOUT][250] ([Intel XE#1961] / [Intel XE#2026])
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-adlp-8/igt@xe_module_load@many-reload.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-adlp-8/igt@xe_module_load@many-reload.html
>
>   * igt@xe_oa@oa-regs-whitelisted:
>     - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][252] ([Intel XE#2541]) +3 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-434/igt@xe_oa@oa-regs-whitelisted.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@xe_oa@oa-regs-whitelisted.html
>
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#2541]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_oa@polling-small-buf.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-435/igt@xe_oa@polling-small-buf.html
>
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#979]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#979]) +1 other test skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html
>
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][258] ([Intel XE#2284] / [Intel XE#366])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea/shard-dg2-433/igt@xe_pm@d3cold-basic.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/shard-dg2-432/igt@xe_pm@d3cold-basic.html
>
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>   [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
>   [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>   [Intel XE#2429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2429
>   [Intel XE#2435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2435
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2668]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2668
>   [Intel XE#2710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2710
>   [Intel XE#2711]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2711
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
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
>   * IGT: IGT_8004 -> IGT_8005
>   * Linux: xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea -> xe-pw-137889v2
>
>   IGT_8004: 0e443bec0ccfb56c2754437b465fc197ee4fd481 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8005: fc3113c8c1e99797b2d4769aaf02265be64a7589 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1890-c72d3ffc0308b71024de6f80c3596668991c67ea: c72d3ffc0308b71024de6f80c3596668991c67ea
>   xe-pw-137889v2: 137889v2
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137889v2/index.html
>
