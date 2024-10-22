Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77245D2CE12
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 18:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0D910E6FD;
	Tue, 22 Oct 2024 18:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoGfbbjx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8193C10E6FD
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 18:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729620110; x=1761156110;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=gdzxiMCTueok89CR+3tK/qXig92FV9tNdthxR83c+Cg=;
 b=JoGfbbjxCSwDdH6pIX2U29W6EMYifK1PIlJ2NGvA7qhaU5dF9uxW3N3C
 YgB2zO/TO1NZGMXAZvFuv3jLVxId5AXUMxQT4FS1A1HieKUmdZjpw38RB
 RdBX0OCvsuElKxXGYKZkQeZ70rjIs7rnmydSfoNljEAaYNKI8hyS2qy38
 2MOiNT3K37jSn4ruxNmsvALswYW5n0SmV8l3ushtnNKp0FCYizYcIQEyW
 YVHCV7IbMHOy7PyvJKVwpi8mZAizElf4O1ASJK4tyz0QE5rIhf23UI68S
 qPuVlUYYlD5t6EffLYs2LcxSwarQCy0ev8QZBcqq0ZhllDQyR8wfNnuTw w==;
X-CSE-ConnectionGUID: DVH7ByX3QJ68ICCf0fxCwg==
X-CSE-MsgGUID: nueFTcl+Ts+9cq4dHe+KWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="32984249"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="32984249"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 11:01:49 -0700
X-CSE-ConnectionGUID: 2S4UtXdrQLmdTQ8EPeRR1g==
X-CSE-MsgGUID: wDmOknCXQ1+KbZn3/IH3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79867025"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 22 Oct 2024 11:01:47 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 567152878D
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 19:01:46 +0100 (IST)
Message-ID: <2da9a02b-ee65-4a4e-96a8-d1d288e415a9@intel.com>
Date: Tue, 22 Oct 2024 20:01:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_Sho?=
 =?UTF-8?Q?w_VFs_LMEM_provisioning_summary_over_debugfs?=
To: intel-xe@lists.freedesktop.org
References: <20241021201506.1771-1-michal.wajdeczko@intel.com>
 <172956649353.1306981.6684797454418682343@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172956649353.1306981.6684797454418682343@2413ebb6fbb6>
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



On 22.10.2024 05:08, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Show VFs LMEM provisioning summary over debugfs
> URL   : https://patchwork.freedesktop.org/series/140274/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56_full -> xe-pw-140274v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-140274v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-140274v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-140274v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated, series only touches debugfs on the PF

> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-dp2.html
> 
>   * igt@kms_plane@planar-pixel-format-settings:
>     - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] +4 other tests dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-3/igt@kms_plane@planar-pixel-format-settings.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-9/igt@kms_plane@planar-pixel-format-settings.html
> 
>   * igt@kms_pm_rpm@cursor-dpms:
>     - shard-lnl:          [PASS][6] -> [DMESG-WARN][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-5/igt@kms_pm_rpm@cursor-dpms.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-4/igt@kms_pm_rpm@cursor-dpms.html
> 
>   * igt@xe_pm@d3hot-multiple-execs:
>     - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] +1 other test incomplete
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@xe_pm@d3hot-multiple-execs.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-5/igt@xe_pm@d3hot-multiple-execs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][10] ([Intel XE#1231] / [Intel XE#1242]) -> [DMESG-FAIL][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@xe_pm@d3hot-basic-exec:
>     - shard-lnl:          [DMESG-WARN][12] ([Intel XE#3184]) -> [DMESG-WARN][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@xe_pm@d3hot-basic-exec.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-8/igt@xe_pm@d3hot-basic-exec.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-140274v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1125])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#3126])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-1/igt@kms_async_flips@alternate-sync-async-flip.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [PASS][17] -> [FAIL][18] ([Intel XE#1426]) +1 other test fail
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1124]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#877]) +1 other test dmesg-warn
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][22] ([Intel XE#1231] / [Intel XE#1242])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#2890]) +4 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2:
>     - shard-bmg:          [PASS][24] -> [FAIL][25] ([Intel XE#2436]) +2 other tests fail
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-d-dp-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] ([Intel XE#1195] / [Intel XE#3113])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][27] ([Intel XE#1195])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#455])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#1475])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1135])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
>     - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#886])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
>     - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#301]) +1 other test fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
>     - shard-dg2-set2:     [PASS][36] -> [FAIL][37] ([Intel XE#301]) +1 other test fail
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#2953]) +2 other tests dmesg-warn
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][41] -> [FAIL][42] ([Intel XE#1874]) +3 other tests fail
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#651])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#656]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#653]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#1503])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-434/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#2763]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#2446])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms@plane-77:
>     - shard-adlp:         [PASS][52] -> [DMESG-WARN][53] ([Intel XE#3086]) +1 other test dmesg-warn
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-3/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#2850] / [Intel XE#929])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-cursor-render@edp-1:
>     - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#2948]) +3 other tests fail
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-1/igt@kms_psr@psr2-cursor-render@edp-1.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-7/igt@kms_psr@psr2-cursor-render@edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#899]) +2 other tests fail
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#2443]) +1 other test fail
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-4/igt@kms_vrr@flipline.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-8/igt@kms_vrr@flipline.html
> 
>   * igt@xe_drm_fdinfo@virtual-utilization-single-idle:
>     - shard-dg2-set2:     [PASS][61] -> [INCOMPLETE][62] ([Intel XE#1195]) +1 other test incomplete
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-435/igt@xe_drm_fdinfo@virtual-utilization-single-idle.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-433/igt@xe_drm_fdinfo@virtual-utilization-single-idle.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-bmg:          [PASS][63] -> [INCOMPLETE][64] ([Intel XE#1473])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1392])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#288])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@xe_exec_fault_mode@twice-userptr.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1192])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-434/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_oa@oa-regs-whitelisted@ccs-0:
>     - shard-lnl:          NOTRUN -> [FAIL][68] ([Intel XE#2514])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-8/igt@xe_oa@oa-regs-whitelisted@ccs-0.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [PASS][69] -> [ABORT][70] ([Intel XE#1358] / [Intel XE#1607])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@xe_pm@s4-basic.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-9/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [PASS][71] -> [ABORT][72] ([Intel XE#1794])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-3/igt@xe_pm@s4-mocs.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-9/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1130]) +9 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-434/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-full.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][74] ([Intel XE#1195] / [Intel XE#3113]) -> [PASS][75]
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][76] ([Intel XE#1195]) -> [PASS][77]
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_color@ctm-negative:
>     - shard-bmg:          [DMESG-WARN][78] ([Intel XE#877]) -> [PASS][79] +3 other tests pass
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@kms_color@ctm-negative.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-5/igt@kms_color@ctm-negative.html
> 
>   * igt@kms_color@legacy-gamma-reset:
>     - shard-adlp:         [DMESG-WARN][80] -> [PASS][81] +3 other tests pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-4/igt@kms_color@legacy-gamma-reset.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-3/igt@kms_color@legacy-gamma-reset.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>     - shard-lnl:          [FAIL][82] ([Intel XE#1475]) -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][84] ([Intel XE#301]) -> [PASS][85] +7 other tests pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][86] ([Intel XE#301]) -> [PASS][87] +2 other tests pass
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][88] ([Intel XE#1204]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>     - shard-adlp:         [FAIL][90] ([Intel XE#2882]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1:
>     - shard-adlp:         [FAIL][92] -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
>     - shard-bmg:          [INCOMPLETE][94] -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate-interruptible:
>     - shard-lnl:          [FAIL][96] ([Intel XE#886]) -> [PASS][97] +3 other tests pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_hdr@bpc-switch@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][98] -> [PASS][99] +1 other test pass
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-435/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-436/igt@kms_hdr@bpc-switch@pipe-a-dp-4.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-lnl:          [FAIL][100] ([Intel XE#1471] / [Intel XE#1874]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-1/igt@kms_plane_cursor@primary.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-7/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64:
>     - shard-lnl:          [FAIL][102] ([Intel XE#1471]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-1/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-7/igt@kms_plane_cursor@primary@pipe-a-edp-1-size-64.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-lnl:          [DMESG-WARN][104] -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-3/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-lnl:          [DMESG-WARN][106] ([Intel XE#2042]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
> 
>   * igt@kms_pm_rpm@universal-planes@plane-68:
>     - shard-lnl:          [DMESG-WARN][108] ([Intel XE#3184]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-68.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-68.html
> 
>   * igt@kms_psr@psr2-cursor-blt@edp-1:
>     - shard-lnl:          [FAIL][110] ([Intel XE#2948]) -> [PASS][111] +3 other tests pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-6/igt@kms_psr@psr2-cursor-blt@edp-1.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-lnl:          [FAIL][112] ([Intel XE#2443]) -> [PASS][113] +1 other test pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-7/igt@kms_vrr@flip-basic.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-5/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-lnl:          [FAIL][114] -> [PASS][115] +3 other tests pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-5/igt@kms_vrr@flip-dpms.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-4/igt@kms_vrr@flip-dpms.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-bmg:          [FAIL][116] ([Intel XE#2364]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][118] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>     - shard-bmg:          [INCOMPLETE][120] ([Intel XE#1473]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
>     - shard-lnl:          [DMESG-WARN][122] ([Intel XE#2687]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-bmg:          [INCOMPLETE][124] ([Intel XE#2105]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - shard-dg2-set2:     [DMESG-WARN][126] ([Intel XE#358]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_vm@large-split-binds-2097152:
>     - shard-adlp:         [TIMEOUT][128] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@xe_vm@large-split-binds-2097152.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@xe_vm@large-split-binds-2097152.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][130] -> [FAIL][131] ([Intel XE#1231] / [Intel XE#1242])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [TIMEOUT][132] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [FAIL][133] ([Intel XE#1231] / [Intel XE#1242])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][134] -> [FAIL][135] ([Intel XE#1231] / [Intel XE#1242] / [Intel XE#3052])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         [TIMEOUT][136] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][137] ([Intel XE#656])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_properties@connector-properties-legacy:
>     - shard-bmg:          [SKIP][138] ([Intel XE#3189]) -> [SKIP][139] ([Intel XE#3108] / [Intel XE#3189])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-2/igt@kms_properties@connector-properties-legacy.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-5/igt@kms_properties@connector-properties-legacy.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#362]) -> [FAIL][141] ([Intel XE#1729])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][142] ([Intel XE#2426]) -> [SKIP][143] ([Intel XE#2509])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_wedged@wedged-mode-toggle:
>     - shard-dg2-set2:     [ABORT][144] ([Intel XE#3075] / [Intel XE#3084]) -> [DMESG-WARN][145] ([Intel XE#3075] / [Intel XE#3084])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html
> 
>   
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
>   [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
>   [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
>   [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
>   [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
>   [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
>   [Intel XE#3108]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3108
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3126
>   [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
>   [Intel XE#3189]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3189
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56 -> xe-pw-140274v1
> 
>   IGT_8080: 20fcbc59241a16c84d12f4f6ba390fb46fd65a36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2106-aa0898115bcff3eda6d021cc66eb8a1c3b264c56: aa0898115bcff3eda6d021cc66eb8a1c3b264c56
>   xe-pw-140274v1: 140274v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140274v1/index.html
> 

