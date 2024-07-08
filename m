Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8805FC3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 17:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3865610E135;
	Mon,  8 Jul 2024 17:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ass/6nPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C4310E135
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 17:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720460252; x=1751996252;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Pr5iqkF9vBgKmcWyUHnw9ao7w5AoIGjYW9ve28gVGE4=;
 b=Ass/6nPRFTutdPBHwcckWoZs0id2wBgJWF5GMLQfzFtBYelrbokVlwRJ
 3xyHYO/zoP0cbeT70+VmJt8ewRoheCGBLKncTi89ow/OzcTaAdJ8JMbdC
 Z2RHTkUHI97yFDTBL3gOIO60nhJ6fm8Q6VYXugSuuKLgtAXlcB10MJK9I
 lqxgGpRgYpKS9jSxPUoVXEJbkzH+4ZTwi3ib4NMwQBVfuKsKCc7A0Y0xK
 f2YshNvGCfA6ZF+9C/1bzy12l9vL6UMTdZGld4Vhdgk8Fu57fY/BII1BJ
 QiPrdjTHLtOmdiXNryeigWqS96iEKHPDdr22QPJwSg+Xx4xIdeZCSDYRO A==;
X-CSE-ConnectionGUID: Afgu/QfyT269I+F49e00YQ==
X-CSE-MsgGUID: MTj9mH6jS8OalHtyAeYQ+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17384491"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="17384491"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 10:37:32 -0700
X-CSE-ConnectionGUID: Rj1KWZW0RRG0Ue0ym+/3XA==
X-CSE-MsgGUID: T3+QoTJSSuShNrwBitb9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="48240905"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 08 Jul 2024 10:37:29 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 703C228778
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 18:37:27 +0100 (IST)
Message-ID: <07266f34-ae43-4cd6-acbf-846719515878@intel.com>
Date: Mon, 8 Jul 2024 19:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/kunit=3A_?=
 =?UTF-8?Q?Simplify_live_tests_code_layout?=
To: intel-xe@lists.freedesktop.org
References: <20240708111210.1154-1-michal.wajdeczko@intel.com>
 <172044727249.49182.1720192954034851815@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172044727249.49182.1720192954034851815@2413ebb6fbb6>
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



On 08.07.2024 16:01, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/kunit: Simplify live tests code layout
> URL   : https://patchwork.freedesktop.org/series/135839/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf_full -> xe-pw-135839v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135839v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135839v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135839v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated, series introduces no functional changes, just test code reorg

> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a6-dp4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-hdmi-a6-dp4.html

Dynamic subtest AB-HDMI-A6-DP4: SUCCESS (5.431s)

This test caused an abort condition: Lockdep not active

> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html

Starting subtest: freq_fixed_exec
(xe_gt_freq:1155) CRITICAL: Test assertion failure function
test_freq_fixed, file
../../../usr/src/igt-gpu-tools/tests/intel/xe_gt_freq.c:203:
(xe_gt_freq:1155) CRITICAL: Failed assertion: get_freq(fd, gt_id, "act")
== rpe(fd, gt_id)
Subtest freq_fixed_exec failed.

> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         [SKIP][5] ([Intel XE#1201] / [Intel XE#656]) -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-pgflip-blt.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_psr@fbc-psr-suspend@edp-1:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][7] +1 other test incomplete
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-lnl-4/igt@kms_psr@fbc-psr-suspend@edp-1.html
> 
>   * {igt@xe_oa@unprivileged-single-ctx-counters}:
>     - {shard-lnl}:        NOTRUN -> [SKIP][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-lnl-6/igt@xe_oa@unprivileged-single-ctx-counters.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135839v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#660])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#1214] / [Intel XE#324]) +1 other test dmesg-warn
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][13] -> [FAIL][14] ([Intel XE#1204])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [PASS][15] -> [FAIL][16] ([Intel XE#1231]) +1 other test fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#346])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#306])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@kms_chamelium_hpd@dp-hpd-storm.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][27] ([Intel XE#1178]) +1 other test fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-434/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#307])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1195])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#776])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#701])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-dg2-set2:     [PASS][35] -> [ABORT][36] ([Intel XE#1553])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1214] / [Intel XE#1553])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-hdmi-a6-dp4.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ac-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [PASS][39] -> [DMESG-WARN][40] ([Intel XE#1214] / [Intel XE#1551]) +1 other test dmesg-warn
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][41] ([Intel XE#324]) +1 other test dmesg-fail
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#656]) +16 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [FAIL][44] ([Intel XE#1861])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#653])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][49] -> [DMESG-WARN][50] ([Intel XE#1162] / [Intel XE#1214])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane@pixel-format:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][51] ([Intel XE#1035] / [Intel XE#1195])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_plane@pixel-format.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][52] -> [FAIL][53] ([Intel XE#1874]) +1 other test fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][54] -> [FAIL][55] ([Intel XE#361])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
>     - shard-adlp:         [PASS][58] -> [SKIP][59] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [FAIL][60] ([Intel XE#1204])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms:
>     - shard-adlp:         [PASS][61] -> [SKIP][62] ([Intel XE#1201]) +6 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-1/igt@kms_pm_rpm@legacy-planes-dpms.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_pm_rpm@legacy-planes-dpms.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
>     - shard-adlp:         NOTRUN -> [FAIL][65] ([Intel XE#1874]) +3 other tests fail
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#327])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#455])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-434/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#756])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-9/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#1447])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][71] -> [INCOMPLETE][72] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm.html
> 
>   * igt@xe_evict@evict-small-multi-vm-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@xe_evict@evict-small-multi-vm-cm.html
> 
>   * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][75] ([Intel XE#1214])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap:
>     - shard-adlp:         [PASS][76] -> [DMESG-WARN][77] ([Intel XE#1214]) +3 other tests dmesg-warn
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-2/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#1392]) +5 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#288])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
>     - shard-adlp:         [PASS][81] -> [DMESG-WARN][82] ([Intel XE#1214] / [Intel XE#1727] / [Intel XE#358])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-6/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html
> 
>   * igt@xe_mmap@vram:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1008] / [Intel XE#1201])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@xe_mmap@vram.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#378])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#366])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     [PASS][86] -> [DMESG-WARN][87] ([Intel XE#1214] / [Intel XE#569])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][88] -> [ABORT][89] ([Intel XE#1358] / [Intel XE#1794]) +1 other test abort
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-dg2-set2:     [PASS][90] -> [DMESG-WARN][91] ([Intel XE#1214]) +4 other tests dmesg-warn
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@xe_pm@s4-mocs.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-436/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [PASS][92] -> [ABORT][93] ([Intel XE#1794])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_addfb_basic@bad-pitch-256:
>     - shard-adlp:         [DMESG-WARN][95] ([Intel XE#1214]) -> [PASS][96] +1 other test pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-2/igt@kms_addfb_basic@bad-pitch-256.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_addfb_basic@bad-pitch-256.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][97] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - {shard-lnl}:        [FAIL][99] ([Intel XE#1659]) -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][101] ([Intel XE#1231]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][103] ([Intel XE#1204]) -> [PASS][104] +1 other test pass
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256:
>     - shard-adlp:         [SKIP][105] ([Intel XE#1201]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-256x256.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_cursor_crc@cursor-sliding-256x256.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [INCOMPLETE][107] ([Intel XE#1195]) -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-466/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
>     - shard-adlp:         [FAIL][109] ([Intel XE#301]) -> [PASS][110] +1 other test pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [DMESG-FAIL][111] ([Intel XE#324]) -> [PASS][112] +3 other tests pass
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][113] ([Intel XE#1874]) -> [PASS][114] +11 other tests pass
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         [FAIL][115] ([Intel XE#1861]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     [DMESG-WARN][119] ([Intel XE#1214]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_plane_alpha_blend@alpha-7efc:
>     - shard-adlp:         [SKIP][121] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-2/igt@kms_plane_alpha_blend@alpha-7efc.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@kms_plane_alpha_blend@alpha-7efc.html
> 
>   * igt@kms_plane_cursor@viewport:
>     - {shard-lnl}:        [FAIL][123] ([Intel XE#1471]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-lnl-2/igt@kms_plane_cursor@viewport.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-lnl-8/igt@kms_plane_cursor@viewport.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128:
>     - {shard-lnl}:        [FAIL][125] -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-lnl-2/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-lnl-8/igt@kms_plane_cursor@viewport@pipe-b-edp-1-size-128.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][127] ([Intel XE#1600]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [INCOMPLETE][129] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][131] ([Intel XE#1473]) -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_basic@once-null-rebind:
>     - shard-adlp:         [TIMEOUT][133] -> [PASS][134] +1 other test pass
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-1/igt@xe_exec_basic@once-null-rebind.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@xe_exec_basic@once-null-rebind.html
> 
>   * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
>     - shard-dg2-set2:     [DMESG-FAIL][135] -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-434/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-fd-userptr:
>     - shard-adlp:         [INCOMPLETE][137] ([Intel XE#1169] / [Intel XE#1195]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-1/igt@xe_exec_threads@threads-fd-userptr.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-9/igt@xe_exec_threads@threads-fd-userptr.html
> 
>   * igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:
>     - shard-dg2-set2:     [DMESG-FAIL][139] ([Intel XE#1069]) -> [PASS][140]
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-433/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-dg2-set2:     [INCOMPLETE][141] ([Intel XE#1195] / [Intel XE#1358]) -> [PASS][142]
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-434/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-435/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][143] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [PASS][144]
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-434/igt@xe_pm@s3-basic-exec.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [ABORT][145] ([Intel XE#1358]) -> [PASS][146]
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - {shard-lnl}:        [ABORT][147] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][148]
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - {shard-lnl}:        [ABORT][149] ([Intel XE#1794]) -> [PASS][150]
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - {shard-lnl}:        [FAIL][151] ([Intel XE#958]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][153] ([Intel XE#1033] / [Intel XE#1214]) -> [DMESG-WARN][154] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][155] ([Intel XE#1033] / [Intel XE#1214]) -> [DMESG-WARN][156] ([Intel XE#1214] / [Intel XE#324])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][157] ([Intel XE#324]) -> [FAIL][158] ([Intel XE#1231])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][159] ([Intel XE#1231]) -> [DMESG-FAIL][160] ([Intel XE#324])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][161] ([Intel XE#1242]) -> [FAIL][162] ([Intel XE#1231])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-adlp:         [SKIP][163] ([Intel XE#1201]) -> [SKIP][164] ([Intel XE#1124] / [Intel XE#1201])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
>     - shard-adlp:         [SKIP][165] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][166] ([Intel XE#1201])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-1/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-adlp:         [SKIP][167] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][168] ([Intel XE#1201])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         [SKIP][169] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][170] ([Intel XE#1201]) +4 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
>     - shard-adlp:         [SKIP][171] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][172] ([Intel XE#1201]) +2 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         [SKIP][173] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][174] ([Intel XE#1201]) +1 other test skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-adlp:         [FAIL][175] -> [SKIP][176] ([Intel XE#1201] / [Intel XE#653])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-adlp:         [SKIP][177] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][178] ([Intel XE#1201]) +1 other test skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-6/igt@kms_hdr@invalid-metadata-sizes.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-dg2-set2:     [FAIL][179] ([Intel XE#616]) -> [DMESG-FAIL][180] ([Intel XE#1551]) +1 other test dmesg-fail
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-adlp:         [SKIP][181] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][182] ([Intel XE#1201])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-90.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-2/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [FAIL][183] ([Intel XE#1729]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#362])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-adlp:         [SKIP][185] ([Intel XE#1201]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#455])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-2/igt@kms_vrr@flip-basic.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-6/igt@kms_vrr@flip-basic.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][187] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][188] ([Intel XE#1195] / [Intel XE#1473])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][189] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][190] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][192] ([Intel XE#1214] / [Intel XE#1760])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-434/igt@xe_wedged@basic-wedged.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-433/igt@xe_wedged@basic-wedged.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-FAIL][193] ([Intel XE#1760]) -> [DMESG-WARN][194] ([Intel XE#1214] / [Intel XE#1760])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-adlp:         [DMESG-WARN][195] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-WARN][196] ([Intel XE#1214] / [Intel XE#1760])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
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
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
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
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7918 -> IGT_7919
>   * Linux: xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf -> xe-pw-135839v1
> 
>   IGT_7918: aab1a4b6a9b7855fe6e38ea3b3987a1399ee5816 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7919: 2c50c98273c55882bdc209fed77d0e40b24431f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf: 414cc5961337b50dd261349b4ed7aa0013044ccf
>   xe-pw-135839v1: 135839v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/index.html
> 
