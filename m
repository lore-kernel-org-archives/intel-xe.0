Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2160DC3065A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 17:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54F610E4B8;
	Mon,  1 Jul 2024 17:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lp4so52+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840B610E4BD
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719854607; x=1751390607;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FWoap5anKJnfdXTkUiZKj/HACH5X0x7L8bMoiYO3HKw=;
 b=lp4so52+DSCFXuEz2KVOT0NSR1MhTCGbOiS/hLX3OHST0whrx9otaYwn
 qKIQh6o7VjaqY5+bYFoPfpJQuTAPkBQ0fv23xg8kQO8iAyM2TO4sBMlQL
 SX6EHZ3BLaOYU/fmRdmpfP/SDcepwzChJ0FXjL/T+Cmc2t/OXahb/OmcY
 Xgr/OdkFVFU5npG8yoq/OnjRD3qaMuWaIUb41e6JYiaPm1VHzDAKE0X7a
 QL6V95y0/dg3CzXXXmWjwWTNKqmEKPCCLYoS/5IjIthMbTqGPxNF2i5bq
 X/t7PQmlnToHmA99CximQ3y8P0HH4Bkj9TZLYv9vRZfE5XOObLunTVSAy A==;
X-CSE-ConnectionGUID: zAoMUI2oRLunnGrHXrWh5A==
X-CSE-MsgGUID: hPiYey+BSAecuFVEJrARyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="28393608"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="28393608"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 10:23:25 -0700
X-CSE-ConnectionGUID: HSMr80GgTEW0dCoWpu629A==
X-CSE-MsgGUID: cUxbkcKMT9OYW3souz2vdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="45410537"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 01 Jul 2024 10:23:22 -0700
Received: from [10.245.82.99] (unknown [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BE2B235447
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 18:23:20 +0100 (IST)
Message-ID: <40036ea0-dc26-4acd-ae73-c425c42c3fa8@intel.com>
Date: Mon, 1 Jul 2024 19:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_PF=3A_Provisioni?=
 =?UTF-8?Q?ng_improvements_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240701102738.934-1-michal.wajdeczko@intel.com>
 <171984692049.2486.11045292000323411092@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171984692049.2486.11045292000323411092@2413ebb6fbb6>
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



On 01.07.2024 17:15, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: Provisioning improvements (rev2)
> URL   : https://patchwork.freedesktop.org/series/135591/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_full -> xe-pw-135591v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135591v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135591v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135591v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-7:
>     - shard-adlp:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-7.html

known issue, reproducible after ~30 driver loads/unloads
	
Starting dynamic subtest: numvfs-7
Dynamic subtest numvfs-7: SUCCESS (3.329s)

This test caused an abort condition: Lockdep not active

<7> [341.112897] BUG: MAX_LOCKDEP_KEYS too low!
<7> [341.112902] turning off the locking correctness validator.


> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
>     - shard-adlp:         NOTRUN -> [FAIL][2] +2 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

known test issue, fix in review [fix]
	
Starting dynamic subtest: numvfs-2
(sriov_basic:962) igt_device-WARNING: Couldn't find PCI device 0000:00:02:02

[fix] https://patchwork.freedesktop.org/series/135476/

> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
>     - shard-adlp:         [SKIP][3] ([Intel XE#1201] / [Intel XE#651]) -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html

unrelated

(kms_frontbuffer_tracking:1321) igt_kms-CRITICAL: Test assertion failure
function intel_pipe_output_combo_valid, file
../../../usr/src/igt-gpu-tools/lib/igt_kms.c:6571:
(kms_frontbuffer_tracking:1321) igt_kms-CRITICAL: Failed assertion: combo
(kms_frontbuffer_tracking:1321) igt_kms-CRITICAL: Last errno: 95,
Operation not supported
(kms_frontbuffer_tracking:1321) igt_kms-CRITICAL: At least one
pipe/output combo needed

> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-adlp:         [SKIP][5] ([Intel XE#1201] / [Intel XE#1932]) -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-on.html

<7> [341.112897] BUG: MAX_LOCKDEP_KEYS too low!
<7> [341.112902] turning off the locking correctness validator.

> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-adlp:         [SKIP][7] ([Intel XE#1201] / [Intel XE#1932]) -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@sriov_basic@enable-vfs-bind-unbind-each.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@sriov_basic@enable-vfs-bind-unbind-each.html

(sriov_basic:962) igt_device-WARNING: Couldn't find PCI device 0000:00:02:02

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p}:
>     - {shard-lnl}:        NOTRUN -> [SKIP][9]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-c-edp-1:
>     - {shard-lnl}:        [PASS][10] -> [DMESG-WARN][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-c-edp-1.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-lnl-3/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-c-edp-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135591v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#623])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][13] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][14] ([Intel XE#1033] / [Intel XE#1214])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][15] ([Intel XE#1214] / [Intel XE#324]) +2 other tests dmesg-warn
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@crc@pipe-d-dp-4:
>     - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#1195]) +1 other test incomplete
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-463/igt@kms_async_flips@crc@pipe-d-dp-4.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-436/igt@kms_async_flips@crc@pipe-d-dp-4.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#619])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#607])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][20] ([Intel XE#1231])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][22] -> [FAIL][23] ([Intel XE#1204])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][24] -> [FAIL][25] ([Intel XE#1231]) +3 other tests fail
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#367])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +22 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#787]) +35 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#306])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_color@ctm-signed:
>     - shard-adlp:         [PASS][36] -> [SKIP][37] ([Intel XE#1201]) +13 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-2/igt@kms_color@ctm-signed.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_color@ctm-signed.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1178]) +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-463/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#307])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1137] / [Intel XE#1201])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1135] / [Intel XE#1201])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#310]) +5 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][46] -> [FAIL][47] ([Intel XE#1874]) +3 other tests fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#656]) +24 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         [PASS][51] -> [FAIL][52] ([Intel XE#1861])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][53] ([Intel XE#1861]) +1 other test fail
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#658])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1151] / [Intel XE#1201])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#417])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_alpha_blend@alpha-7efc:
>     - shard-adlp:         [PASS][59] -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_plane_alpha_blend@alpha-7efc.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_plane_alpha_blend@alpha-7efc.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][61] ([Intel XE#1874]) +3 other tests fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#870])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-4/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1122] / [Intel XE#1201])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#836])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#1489])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-433/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1149] / [Intel XE#1201])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rmfb@close-fd:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#294]) +2 other tests fail
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-464/igt@kms_rmfb@close-fd.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#327])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1127] / [Intel XE#1201])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][72] -> [FAIL][73] ([Intel XE#899]) +1 other test fail
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [PASS][74] -> [DMESG-WARN][75] ([Intel XE#1214] / [Intel XE#1551])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1091] / [Intel XE#1201])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201]) +19 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1126] / [Intel XE#1201])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_create@create-big-vram:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1062] / [Intel XE#1201])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-8/igt@xe_create@create-big-vram.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][81] -> [TIMEOUT][82] ([Intel XE#1473] / [Intel XE#392])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#1392]) +6 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:
>     - shard-adlp:         [PASS][88] -> [DMESG-WARN][89] ([Intel XE#1214] / [Intel XE#1727])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr:
>     - shard-adlp:         [PASS][90] -> [DMESG-WARN][91] ([Intel XE#1214] / [Intel XE#358])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@xe_exec_threads@threads-hang-fd-userptr.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@xe_exec_threads@threads-hang-fd-userptr.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         NOTRUN -> [FAIL][92] ([Intel XE#1414])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-dg2-set2:     [PASS][93] -> [SKIP][94] ([Intel XE#1192] / [Intel XE#1201])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-463/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#378])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-435/igt@xe_module_load@force-load.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#379])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-8/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#366])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#366])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [PASS][99] -> [DMESG-WARN][100] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-dg2-set2:     [PASS][101] -> [DMESG-WARN][102] ([Intel XE#1214]) +2 other tests dmesg-warn
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [PASS][103] -> [ABORT][104] ([Intel XE#1794])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@xe_pm@s4-mocs.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#944])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#944])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_vm@large-split-binds-33554432:
>     - shard-adlp:         [PASS][107] -> [DMESG-WARN][108] ([Intel XE#1214]) +16 other tests dmesg-warn
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@xe_vm@large-split-binds-33554432.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@xe_vm@large-split-binds-33554432.html
> 
>   * igt@xe_vm@unbind-all-2-vmas:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][109] ([Intel XE#1214])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@xe_vm@unbind-all-2-vmas.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-adlp:         [DMESG-WARN][110] ([Intel XE#1214]) -> [PASS][111] +2 other tests pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@core_hotunplug@hotrebind-lateclose.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-2/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][112] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][113] +1 other test pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][114] ([Intel XE#1214]) -> [PASS][115] +1 other test pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][116] ([Intel XE#1214] / [Intel XE#1551]) -> [PASS][117] +1 other test pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [DMESG-FAIL][118] ([Intel XE#324]) -> [PASS][119] +3 other tests pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>     - shard-adlp:         [FAIL][120] ([Intel XE#1874]) -> [PASS][121] +7 other tests pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         [FAIL][122] ([Intel XE#1861]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][124] ([Intel XE#361]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - {shard-lnl}:        [DMESG-WARN][126] ([Intel XE#2052]) -> [PASS][127] +3 other tests pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-lnl-2/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - {shard-lnl}:        [FAIL][128] ([Intel XE#1430]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>     - {shard-lnl}:        [INCOMPLETE][130] -> [PASS][131] +1 other test pass
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-4/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-lnl-4/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][132] ([Intel XE#899]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vblank@query-idle@pipe-d-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][134] ([Intel XE#1195]) -> [PASS][135] +1 other test pass
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_vblank@query-idle@pipe-d-hdmi-a-1.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@kms_vblank@query-idle@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][136] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-433/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][138] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][139] +1 other test pass
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][140] ([Intel XE#2097]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][142] ([Intel XE#2105]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_gt_freq@freq_range_idle:
>     - {shard-lnl}:        [SKIP][144] ([Intel XE#1462]) -> [PASS][145]
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-8/igt@xe_gt_freq@freq_range_idle.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-lnl-3/igt@xe_gt_freq@freq_range_idle.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - {shard-lnl}:        [SKIP][146] ([Intel XE#1192]) -> [PASS][147] +1 other test pass
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-lnl-4/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-dg2-set2:     [INCOMPLETE][148] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#1551] / [Intel XE#569]) -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     [DMESG-WARN][150] ([Intel XE#1214] / [Intel XE#569]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [ABORT][152] ([Intel XE#1358]) -> [PASS][153] +1 other test pass
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-8/igt@xe_pm@s4-exec-after.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [SKIP][154] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][155] ([Intel XE#1201]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][156] ([Intel XE#1231]) -> [DMESG-FAIL][157] ([Intel XE#324])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-adlp:         [FAIL][158] ([Intel XE#1874]) -> [SKIP][159] ([Intel XE#1201])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][160] ([Intel XE#324]) -> [FAIL][161] ([Intel XE#1231]) +1 other test fail
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
>     - shard-adlp:         [SKIP][162] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][163] ([Intel XE#1201]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-adlp:         [SKIP][164] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][165] ([Intel XE#1201])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
>     - shard-adlp:         [SKIP][166] ([Intel XE#1201]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-adlp:         [SKIP][168] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][169] ([Intel XE#1201]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>     - shard-adlp:         [SKIP][170] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][171] ([Intel XE#1201]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>     - shard-adlp:         [FAIL][172] -> [SKIP][173] ([Intel XE#1201] / [Intel XE#651])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-adlp:         [SKIP][174] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][175] ([Intel XE#1201]) +3 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-adlp:         [SKIP][176] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][177] ([Intel XE#1201]) +2 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-dg2-set2:     [FAIL][178] ([Intel XE#616]) -> [DMESG-FAIL][179] ([Intel XE#1551]) +1 other test dmesg-fail
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [DMESG-FAIL][180] -> [FAIL][181] ([Intel XE#718])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         [SKIP][182] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][183] ([Intel XE#1204])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-adlp:         [SKIP][184] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][185] ([Intel XE#1201])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-adlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][186] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][187] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
>   [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
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
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7907 -> IGT_7908
>   * Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -> xe-pw-135591v2
> 
>   IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7908: 7908
>   xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299
>   xe-pw-135591v2: 135591v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135591v2/index.html
> 
