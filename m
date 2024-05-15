Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F7AC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 12:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DDF10E05A;
	Wed, 15 May 2024 12:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Th3NH49M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33C810E05A
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 12:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715775389; x=1747311389;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2bey6ytwLVs55YwAwhBa+2K5vuFcTp6OUzGYPNbFfC8=;
 b=Th3NH49M3bjlShN4RMpUmAHsl9i/KLo2CYAOUf1rMJFY3AHFr8doLxgH
 e5XWLAnYbabbktMHX1lpVsTVXbYwEh0WQwq64eaazF8mKiDSqhr7BumbN
 s/f+/ALW0lF4V5VA7fdJxgZYQFp8H/q4ed38wMW/FFRyQvyK+E/O3nxHC
 ggae7FLKu4DlEUPA9O48tpGfpZPe5R0vflHaJMRhjfE4ll7UM3R37L3o4
 HhhKy84cFncUA6yCycwfCDo2ebfWlmYH6uH6VdZxIF4YQF/sA0H8vzdl2
 trjWx/OqXufnJnpLnNH2g21C8z7La1P+sRM1UACZhOaxwiuEc3omXcdfw Q==;
X-CSE-ConnectionGUID: GHT/eIO0QFCrmrvzo+5CQA==
X-CSE-MsgGUID: Yx8LLMv4TU+hTknaVsO1lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23218031"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="23218031"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:16:28 -0700
X-CSE-ConnectionGUID: yuUCzFwSRYeDFqlSczSIFg==
X-CSE-MsgGUID: QwZIMuKPTSWAObqEfwDolw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="35500601"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 15 May 2024 05:16:20 -0700
Received: from [10.245.119.62] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A9B7027BD2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 13:16:13 +0100 (IST)
Message-ID: <344878e4-25c1-43f0-b5f5-73716ac524de@intel.com>
Date: Wed, 15 May 2024 14:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_Don?=
 =?UTF-8?Q?=27t_advertise_support_to_enable_VFs_if_not_ready_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240507165757.2835-1-michal.wajdeczko@intel.com>
 <171571754731.2116354.10886748308989587812@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171571754731.2116354.10886748308989587812@8e613ede5ea5>
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



On 14.05.2024 22:12, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Don't advertise support to enable VFs if not ready (rev2)
> URL   : https://patchwork.freedesktop.org/series/133289/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123_full -> xe-pw-133289v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-133289v2_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-133289v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-133289v2_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - shard-dg2-set2:     [SKIP][1] ([Intel XE#1201]) -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@xe_live_ktest@xe_mocs.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@xe_live_ktest@xe_mocs.html

Test requirement not met in function kunit_get_tests, file
../../../usr/src/igt-gpu-tools/lib/igt_kmod.c:1304:
Test requirement: !(igt_kernel_tainted(&taints))

due to some earlier WARNs (unrelated to this series)

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@test-time-stamp:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-1/igt@kms_async_flips@test-time-stamp.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - {shard-lnl}:        NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-6/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   * {igt@xe_pm@mocs-rpm}:
>     - {shard-lnl}:        NOTRUN -> [FAIL][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-3/igt@xe_pm@mocs-rpm.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-133289v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotreplug:
>     - shard-adlp:         NOTRUN -> [ABORT][6] ([Intel XE#1538] / [Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@core_hotunplug@hotreplug.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#1033] / [Intel XE#1214])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#316])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [FAIL][10] ([Intel XE#616]) +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][12] ([Intel XE#1204])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#367])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#787]) +6 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#306])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#306])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_frames@dp-crc-multiple:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_chamelium_frames@dp-crc-multiple.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#373]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#308])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][30] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#282])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#309])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#323])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [PASS][36] -> [DMESG-WARN][37] ([Intel XE#1214] / [Intel XE#282]) +7 other tests dmesg-warn
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][38] ([Intel XE#282])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#323])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1137] / [Intel XE#1201])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [PASS][41] -> [INCOMPLETE][42] ([Intel XE#1195]) +1 other test incomplete
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#656]) +16 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#651]) +4 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1151] / [Intel XE#1201])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#653]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][53] -> [SKIP][54] ([Intel XE#1201] / [Intel XE#455])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
>     - shard-adlp:         [PASS][55] -> [DMESG-WARN][56] ([Intel XE#1191] / [Intel XE#1214])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#616]) +3 other tests fail
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][58] -> [FAIL][59] ([Intel XE#616]) +6 other tests fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#498]) +5 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#305]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#870])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-2/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#908])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201]) +3 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@pr-cursor-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#929])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_psr@pr-cursor-blt.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1149] / [Intel XE#1201])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#771] / [Intel XE#899])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#899]) +1 other test fail
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#1207])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][75] ([Intel XE#1214] / [Intel XE#1608])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [PASS][76] -> [TIMEOUT][77] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#261])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@xe_evict@evict-beng-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-small-multi-vm-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@xe_evict@evict-small-multi-vm-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#688])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#1392]) +4 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#1562])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#288]) +1 other test skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
>     - shard-adlp:         [PASS][86] -> [SKIP][87] ([Intel XE#1201]) +11 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#378])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#366])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#366])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [PASS][91] -> [ABORT][92] ([Intel XE#1358])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@xe_pm@s4-basic.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-9/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][93] ([Intel XE#1214])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#944])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
>     - shard-adlp:         NOTRUN -> [FAIL][95] ([Intel XE#1081])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][96] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][98] -> [PASS][99] +1 other test pass
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - {shard-lnl}:        [FAIL][100] ([Intel XE#1659]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - {shard-lnl}:        [DMESG-WARN][102] ([Intel XE#1830]) -> [PASS][103] +1 other test pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][104] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][106] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][107] +6 other tests pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@single-move@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][108] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-b.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@kms_cursor_legacy@single-move@pipe-b.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - {shard-lnl}:        [FAIL][110] ([Intel XE#480] / [Intel XE#886]) -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][112] ([Intel XE#616]) -> [PASS][113] +6 other tests pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][116] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][117] +1 other test pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][118] ([Intel XE#361]) -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [i915#2575]) -> [PASS][121] +2 other tests pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [FAIL][122] ([Intel XE#718]) -> [PASS][123]
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - {shard-lnl}:        [SKIP][124] ([Intel XE#1211]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - {shard-lnl}:        [INCOMPLETE][126] -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@xe_drm_fdinfo@drm-active:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@xe_drm_fdinfo@drm-active.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@xe_drm_fdinfo@drm-active.html
> 
>   * igt@xe_exec_reset@close-execqueues-close-fd:
>     - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#1195]) -> [PASS][131] +3 other tests pass
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@xe_exec_reset@close-execqueues-close-fd.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@xe_exec_reset@close-execqueues-close-fd.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - {shard-lnl}:        [FAIL][132] ([Intel XE#1081]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - {shard-lnl}:        [DMESG-WARN][134] ([Intel XE#1595]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-6/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-dg2-set2:     [INCOMPLETE][136] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358] / [Intel XE#569]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [DMESG-WARN][138] ([Intel XE#1214]) -> [PASS][139] +1 other test pass
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - {shard-lnl}:        [ABORT][140] ([Intel XE#1794]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [INCOMPLETE][142] ([Intel XE#1195]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-adlp:         [DMESG-WARN][144] ([Intel XE#1214] / [Intel XE#1667]) -> [INCOMPLETE][145] ([Intel XE#1195] / [Intel XE#1667])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_3d:
>     - shard-adlp:         [DMESG-FAIL][146] ([Intel XE#1330] / [Intel XE#1638] / [Intel XE#1760]) -> [ABORT][147] ([Intel XE#1760])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@kms_3d.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-8/igt@kms_3d.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][149] ([Intel XE#316]) +2 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-adlp:         [SKIP][150] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][151] ([Intel XE#1201])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#316]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [INCOMPLETE][154] ([Intel XE#1150] / [Intel XE#1195]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#316])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][156] ([Intel XE#1204]) -> [DMESG-FAIL][157] ([Intel XE#324])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][159] ([Intel XE#1124]) +4 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-464/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#1124]) -> [SKIP][161] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][162] ([Intel XE#324]) -> [FAIL][163] ([Intel XE#1231])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-WARN][164] ([Intel XE#1214] / [Intel XE#324]) -> [FAIL][165] ([Intel XE#1231])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#619]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#619])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][169] ([Intel XE#607])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-adlp:         [SKIP][170] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][171] ([Intel XE#1201])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#367]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][175] ([Intel XE#367]) +2 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#787]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][179] ([Intel XE#787]) +41 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#1252]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>     - shard-adlp:         [SKIP][184] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][185] ([Intel XE#1201]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][189] ([Intel XE#1252])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][191] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#314]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#314])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_audio@dp-audio-edid:
>     - shard-adlp:         [SKIP][194] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][195] ([Intel XE#1201])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_chamelium_audio@dp-audio-edid.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_chamelium_audio@dp-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#306]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#306])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][199] ([Intel XE#306]) +1 other test skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#373]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][203] ([Intel XE#373]) +5 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][205] ([Intel XE#307]) +1 other test skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#307]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#307])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#308]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [i915#2575]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#308])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>     - shard-adlp:         [SKIP][212] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][213] ([Intel XE#1201])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][215] ([Intel XE#455]) +10 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_cursor_crc@cursor-random-max-size.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][216] ([Intel XE#282]) -> [DMESG-WARN][217] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-adlp:         [INCOMPLETE][218] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][219] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][220] ([Intel XE#1195]) -> [DMESG-WARN][221] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][222] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][223] ([Intel XE#1214] / [Intel XE#282])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][225] ([Intel XE#323])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#323]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#323])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_cursor_legacy@single-move:
>     - shard-dg2-set2:     [DMESG-WARN][228] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [DMESG-WARN][229] ([Intel XE#1214] / [Intel XE#282])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_cursor_legacy@single-move.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@kms_cursor_legacy@single-move.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [i915#2575]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#307])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_display_modes@mst-extended-mode-negative.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_display_modes@mst-extended-mode-negative.html
>     - shard-adlp:         [SKIP][232] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][233] ([Intel XE#1201])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_display_modes@mst-extended-mode-negative.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#455]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#455]) +15 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#776]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#776])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][239] ([Intel XE#701])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_feature_discovery@chamelium.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][241] ([Intel XE#1137])
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-adlp:         [SKIP][242] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][243] ([Intel XE#1201])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [DMESG-WARN][244] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][245] ([Intel XE#1195] / [Intel XE#927])
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][246] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][247] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][248] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][249] ([Intel XE#1214] / [Intel XE#1608])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][250] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][251] ([Intel XE#1214] / [Intel XE#1608])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][252] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][253] ([Intel XE#1195])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-adlp:         [SKIP][254] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][255] ([Intel XE#1201])
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2-set2:     [SKIP][256] ([i915#5274]) -> [SKIP][257] ([Intel XE#1201] / [i915#5274])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
>     - shard-adlp:         [SKIP][258] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][259] ([Intel XE#1201]) +1 other test skip
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][261] ([Intel XE#651]) +16 other tests skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201]) -> [INCOMPLETE][263] ([Intel XE#1195])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>     - shard-adlp:         [SKIP][264] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][265] ([Intel XE#1201])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#658]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#658])
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][268] ([Intel XE#651]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#651]) +26 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
>     - shard-adlp:         [SKIP][270] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][271] ([Intel XE#1201])
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][273] ([Intel XE#653]) +16 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][274] ([Intel XE#653]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#653]) +25 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][276] ([Intel XE#417]) -> [SKIP][277] ([Intel XE#1201] / [Intel XE#417])
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][278] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][279] ([Intel XE#904] / [Intel XE#909]) +1 other test incomplete
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][280] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][282] ([Intel XE#305]) -> [SKIP][283] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][284] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][285] ([Intel XE#305]) +2 other tests skip
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][286] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][287] ([Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     [SKIP][288] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][289] ([Intel XE#870])
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         [SKIP][290] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][291] ([Intel XE#1204])
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_psr@fbc-pr-dpms:
>     - shard-dg2-set2:     [SKIP][292] ([Intel XE#929]) -> [SKIP][293] ([Intel XE#1201] / [Intel XE#929]) +15 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@kms_psr@fbc-pr-dpms.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][294] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][295] ([Intel XE#929]) +10 other tests skip
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][296] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][297] ([Intel XE#1149])
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][298] ([Intel XE#1149]) -> [SKIP][299] ([Intel XE#1149] / [Intel XE#1201])
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     [SKIP][300] ([Intel XE#327]) -> [SKIP][301] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][302] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][303] ([Intel XE#1127])
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][304] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][305] ([Intel XE#327])
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][306] ([Intel XE#1127]) -> [SKIP][307] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][308] ([Intel XE#1162]) -> [DMESG-WARN][309] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html
>     - shard-adlp:         [DMESG-WARN][310] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][311] ([Intel XE#1191] / [Intel XE#1214]) +1 other test dmesg-warn
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][312] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][313] ([Intel XE#1191] / [Intel XE#1214])
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-adlp:         [INCOMPLETE][314] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][315] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][316] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][317] ([Intel XE#1191] / [Intel XE#1214])
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][318] ([Intel XE#756]) -> [SKIP][319] ([Intel XE#1201] / [Intel XE#756])
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2-set2:     [SKIP][320] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][321] ([Intel XE#756])
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-set2:     [SKIP][322] ([Intel XE#1091]) -> [SKIP][323] ([Intel XE#1091] / [Intel XE#1201])
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-adlp:         [FAIL][324] ([Intel XE#1080]) -> [SKIP][325] ([Intel XE#1201]) +2 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-dg2-set2:     [SKIP][326] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][327] ([Intel XE#1091])
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][328] ([Intel XE#1126]) -> [SKIP][329] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][330] ([Intel XE#1041]) -> [FAIL][331] ([Intel XE#1600])
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-cm-threads-small:
>     - shard-adlp:         [SKIP][332] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) -> [SKIP][333] ([Intel XE#1201])
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@xe_evict@evict-cm-threads-small.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@xe_evict@evict-cm-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-adlp:         [SKIP][334] ([Intel XE#1201] / [Intel XE#1392]) -> [SKIP][335] ([Intel XE#1201])
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@once-basic:
>     - shard-dg2-set2:     [SKIP][336] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][337] ([Intel XE#288]) +16 other tests skip
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@xe_exec_fault_mode@once-basic.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@xe_exec_fault_mode@once-basic.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][338] ([Intel XE#288]) -> [SKIP][339] ([Intel XE#1201] / [Intel XE#288]) +21 other tests skip
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     [SKIP][340] ([Intel XE#1562]) -> [SKIP][341] ([Intel XE#1201] / [Intel XE#1562])
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [SKIP][342] ([Intel XE#1192]) -> [SKIP][343] ([Intel XE#1192] / [Intel XE#1201])
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_live_ktest@xe_bo.html
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][344] ([Intel XE#560]) -> [SKIP][345] ([Intel XE#1201] / [Intel XE#560])
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_media_fill@media-fill.html
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     [SKIP][346] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][347] ([Intel XE#378])
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@xe_module_load@force-load.html
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][348] ([Intel XE#977]) -> [SKIP][349] ([Intel XE#1201] / [Intel XE#977])
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@d3-mmap-vram:
>     - shard-adlp:         [SKIP][350] ([Intel XE#1008] / [Intel XE#1201]) -> [SKIP][351] ([Intel XE#1201])
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@xe_pm@d3-mmap-vram.html
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@xe_pm@d3-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][352] ([Intel XE#366]) -> [SKIP][353] ([Intel XE#1201] / [Intel XE#366])
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-adlp:         [INCOMPLETE][354] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927]) -> [DMESG-WARN][355] ([Intel XE#1214] / [Intel XE#1608])
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-adlp:         [DMESG-WARN][356] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][357] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][358] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][359] ([Intel XE#366])
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-dg2-set2:     [DMESG-WARN][360] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][361] ([Intel XE#1162])
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@xe_pm@s4-exec-after.html
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     [SKIP][362] ([Intel XE#579]) -> [SKIP][363] ([Intel XE#1201] / [Intel XE#579])
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     [SKIP][364] ([Intel XE#944]) -> [SKIP][365] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_query@multigpu-query-config.html
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-436/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     [SKIP][366] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][367] ([Intel XE#944]) +1 other test skip
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-464/igt@xe_query@multigpu-query-cs-cycles.html
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     [SKIP][368] ([Intel XE#1731]) -> [SKIP][369] ([Intel XE#1201] / [Intel XE#1731])
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_wedged@basic-wedged.html
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@xe_wedged@basic-wedged.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-FAIL][370] ([Intel XE#1760]) -> [DMESG-WARN][371] ([Intel XE#1214] / [Intel XE#1760])
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-adlp:         [DMESG-WARN][372] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-FAIL][373] ([Intel XE#1760])
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1207
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>   [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
>   [Intel XE#1562]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1598]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1598
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1664
>   [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
>   [Intel XE#1699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699
>   [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
>   [Intel XE#1731]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1731
>   [Intel XE#1733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1733
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123 -> xe-pw-133289v2
> 
>   IGT_7853: b6c459b99abc85cad050b0b04faaca9fc3568a69 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123: a0c161037de0a89c0a9ea744f60099a4f94cc123
>   xe-pw-133289v2: 133289v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133289v2/index.html
> 
