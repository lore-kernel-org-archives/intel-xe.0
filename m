Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA2BC25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 11:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F82B10E0BB;
	Wed, 15 May 2024 11:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qi/UinA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530DD10E0BB
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715774050; x=1747310050;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Uv8JdjRTpY7Peu5CBrNuZW+XqSK6EmB4GdnLjjWrAWg=;
 b=Qi/UinA0EaW/EliCCSyfBNhHW/29QAWIs6gfljfoM2zcTTTZLft7Vfnm
 +6NqPlkdAHpNTXmBfDpVyORitTTxgoLzi2xBH8OreGp16W8folZXX+6/J
 6igFYlbVgSh4ErH9Vt92DhPmJSkPg913nTWdaPZaV4kjc5B5/Tbq9UN5i
 jxscnGqhRfHQdhRufeKnwQeU8y0XhKvbOi8owP1DvcTxgpIdQgUKxs3p+
 v9TeX5cDuB28GM5uASvNFieiT95Y27faD0JAiguCEnQnj1BGmM5Y/nUOu
 f2vrcq1bzQtHs+iqcjEjVj3plxz9JwacvyjzHCftw5vkCG7KzvX+VTlGZ A==;
X-CSE-ConnectionGUID: sHPTQRC0S1CjkbbNv109Sg==
X-CSE-MsgGUID: YmLjPn3WRjmsN3dayEXgGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11760756"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11760756"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 04:54:10 -0700
X-CSE-ConnectionGUID: ejiAzmqBRtW61Qs91EvEtg==
X-CSE-MsgGUID: bF4+JfClQ76dJ87Hs2ODBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="30852859"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 15 May 2024 04:54:04 -0700
Received: from [10.245.119.62] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4973227BB0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 12:54:01 +0100 (IST)
Message-ID: <b37952fe-167d-40ef-9b82-0c6d79fe5093@intel.com>
Date: Wed, 15 May 2024 13:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_PF=3A_Support_fo?=
 =?UTF-8?Q?r_adverse_events_notifications_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240514190015.2172-1-michal.wajdeczko@intel.com>
 <171571949434.2116354.4479907251377432967@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171571949434.2116354.4479907251377432967@8e613ede5ea5>
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



On 14.05.2024 22:44, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: Support for adverse events notifications (rev2)
> URL   : https://patchwork.freedesktop.org/series/133236/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123_full -> xe-pw-133236v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-133236v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-133236v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-133236v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

but not related to this PF specific series

> 
>   * igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@vcs:
>     - shard-adlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-8/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@vcs.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@vcs.html
> 

Dynamic subtest vcs: SUCCESS (0.003s)

This test caused an abort condition: Lockdep not active

note that there were several WARNs before that test:

<4>[  294.791003] xe 0000:00:02.0: drm_WARN_ON(!timeout_expected)
<4>[  294.799854] xe 0000:00:02.0: drm_WARN_ON(__intel_de_wait_for_set(
<4>[  331.863398] xe 0000:00:02.0: drm_WARN_ON(tc->mode !=
TC_PORT_DISCONNECTED)
<4>[  331.865668] xe 0000:00:02.0: drm_WARN_ON(tc->lock_wakeref)
<4>[  422.100922] DEBUG_LOCKS_WARN_ON(debug_atomic_read(nr_unused_locks)
!= nr_unused)


>   
> #### Warnings ####
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][3] ([Intel XE#1201]) -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - {shard-lnl}:        NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-lnl-6/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123_full and xe-pw-133236v2_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_plane:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-133236v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-dg2-set2:     [PASS][6] -> [FAIL][7] ([Intel XE#827]) +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1124] / [Intel XE#1201])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#306])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_frames@dp-crc-multiple:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#373])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@kms_chamelium_frames@dp-crc-multiple.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#1195]) +1 other test incomplete
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-434/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-433/igt@kms_cursor_crc@cursor-random-64x64@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#282])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-a:
>     - shard-dg2-set2:     [PASS][22] -> [DMESG-WARN][23] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-a.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#323])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@single-bo:
>     - shard-adlp:         [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@kms_cursor_legacy@single-bo.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-6/igt@kms_cursor_legacy@single-bo.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
>     - shard-adlp:         [PASS][29] -> [FAIL][30] ([Intel XE#616]) +1 other test fail
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [FAIL][32] ([Intel XE#616])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#656]) +3 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1151] / [Intel XE#1201])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][36] ([Intel XE#616]) +3 other tests fail
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-436/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#498]) +5 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#870])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#870])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-8/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#908])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-8/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#771] / [Intel XE#899])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#899])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [PASS][48] -> [TIMEOUT][49] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][50] -> [TIMEOUT][51] ([Intel XE#1473] / [Intel XE#392])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@xe_exec_basic@multigpu-once-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#1562])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_queue_property@timeslice_duration_us-property-min-max:
>     - shard-adlp:         [PASS][56] -> [ABORT][57] ([Intel XE#1553])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-8/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max.html
> 
>   * igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@vecs:
>     - shard-adlp:         [PASS][58] -> [DMESG-WARN][59] ([Intel XE#1214] / [Intel XE#1553])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-8/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@vecs.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@vecs.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-fd-rebind:
>     - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#1169] / [Intel XE#1356])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@xe_exec_threads@threads-bal-mixed-fd-rebind.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
>     - shard-adlp:         [PASS][62] -> [SKIP][63] ([Intel XE#1201]) +11 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#366])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [PASS][65] -> [DMESG-WARN][66] ([Intel XE#1214])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-8/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#944])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@xe_query@multigpu-query-gt-list.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][68] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][70] -> [PASS][71] +1 other test pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - {shard-lnl}:        [FAIL][72] ([Intel XE#1659]) -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - {shard-lnl}:        [DMESG-WARN][74] ([Intel XE#1830]) -> [PASS][75] +1 other test pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-lnl-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][77] +1 other test pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-dg2-set2:     [DMESG-WARN][78] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][79] +4 other tests pass
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@single-move@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][80] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-b.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-466/igt@kms_cursor_legacy@single-move@pipe-b.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][82] ([Intel XE#616]) -> [PASS][83] +1 other test pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - {shard-lnl}:        [SKIP][84] ([Intel XE#1211]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - {shard-lnl}:        [INCOMPLETE][86] -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-lnl-5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][88] ([Intel XE#1041]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][90] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][92] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@xe_evict@evict-threads-large.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_basic@once-null-rebind:
>     - shard-dg2-set2:     [SKIP][94] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@xe_exec_basic@once-null-rebind.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@xe_exec_basic@once-null-rebind.html
> 
>   * igt@xe_exec_reset@close-execqueues-close-fd:
>     - shard-dg2-set2:     [INCOMPLETE][96] ([Intel XE#1195]) -> [PASS][97] +3 other tests pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@xe_exec_reset@close-execqueues-close-fd.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@xe_exec_reset@close-execqueues-close-fd.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - {shard-lnl}:        [FAIL][98] ([Intel XE#1081]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-6/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-lnl-8/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - {shard-lnl}:        [SKIP][100] -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-2/igt@xe_live_ktest@xe_mocs.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-lnl-6/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - {shard-lnl}:        [DMESG-WARN][102] ([Intel XE#1595]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-6/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-lnl-8/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358] / [Intel XE#569]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@xe_pm@s3-d3hot-basic-exec.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - {shard-lnl}:        [ABORT][106] ([Intel XE#1794]) -> [PASS][107] +1 other test pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
>     - shard-adlp:         [DMESG-WARN][108] ([Intel XE#1214]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-adlp:         [ABORT][110] ([Intel XE#1538] / [Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760]) -> [INCOMPLETE][111] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1760])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-adlp:         [ABORT][112] ([Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760]) -> [INCOMPLETE][113] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1451] / [Intel XE#1717])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-adlp:         [SKIP][114] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][115] ([Intel XE#1201])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#316]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [INCOMPLETE][118] ([Intel XE#1150] / [Intel XE#1195]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#316])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][121] ([Intel XE#316]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][123] ([Intel XE#1124]) +1 other test skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][125] ([Intel XE#607])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][126] ([Intel XE#1124]) -> [SKIP][127] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][128] ([Intel XE#324]) -> [FAIL][129] ([Intel XE#1231])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-WARN][130] ([Intel XE#1214] / [Intel XE#324]) -> [FAIL][131] ([Intel XE#1231])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#619]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#619])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][135] ([Intel XE#610])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-adlp:         [SKIP][136] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][137] ([Intel XE#1201])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][139] ([Intel XE#367])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#367]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#787]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][145] ([Intel XE#787]) +41 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][147] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1252]) -> [SKIP][149] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>     - shard-adlp:         [SKIP][150] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][151] ([Intel XE#1201]) +1 other test skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][153] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#314]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#314])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][157] ([Intel XE#373]) +5 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_audio@dp-audio-edid:
>     - shard-adlp:         [SKIP][158] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][159] ([Intel XE#1201])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_chamelium_audio@dp-audio-edid.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_chamelium_audio@dp-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#306]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#306])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#373]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#307]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#307])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][167] ([Intel XE#308]) +1 other test skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#308]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-adlp:         [SKIP][170] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][171] ([Intel XE#1201])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#282]) -> [DMESG-WARN][173] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][174] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][175] ([Intel XE#282]) +4 other tests dmesg-warn
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#323]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#323])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_cursor_legacy@single-move:
>     - shard-dg2-set2:     [DMESG-WARN][178] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [DMESG-WARN][179] ([Intel XE#1214] / [Intel XE#282])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_cursor_legacy@single-move.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-466/igt@kms_cursor_legacy@single-move.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929]) -> [SKIP][181] ([Intel XE#455] / [Intel XE#929])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-adlp:         [SKIP][182] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][183] ([Intel XE#1201])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_display_modes@mst-extended-mode-negative.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#455]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#455]) +15 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#776]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#776])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-adlp:         [SKIP][188] ([Intel XE#1201] / [Intel XE#310]) -> [SKIP][189] ([Intel XE#1201])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][190] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][191] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][192] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][193] ([Intel XE#1214] / [Intel XE#1608])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][194] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][195] ([Intel XE#1214] / [Intel XE#1608])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][196] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][197] ([Intel XE#1191] / [Intel XE#1214])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-adlp:         [SKIP][198] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][199] ([Intel XE#1201])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2-set2:     [SKIP][200] ([i915#5274]) -> [SKIP][201] ([Intel XE#1201] / [i915#5274])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][203] ([Intel XE#651]) +12 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
>     - shard-adlp:         [SKIP][204] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][205] ([Intel XE#1201]) +1 other test skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-adlp:         [SKIP][206] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][207] ([Intel XE#1201])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201]) -> [INCOMPLETE][209] ([Intel XE#1195])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#658]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#658])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#651]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#651]) +28 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render:
>     - shard-adlp:         [SKIP][214] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][215] ([Intel XE#1201])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][217] ([Intel XE#653]) +12 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#653]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#653]) +28 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][221] ([Intel XE#605])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#417]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#417])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#305]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][229] ([Intel XE#305] / [Intel XE#455])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][231] ([Intel XE#305]) +2 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][233] ([Intel XE#1122])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][235] ([Intel XE#929]) +7 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-pr-dpms:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#929]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#929]) +18 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1149]) -> [SKIP][239] ([Intel XE#1149] / [Intel XE#1201])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#327]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#1127]) -> [SKIP][243] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][244] ([Intel XE#1162]) -> [DMESG-WARN][245] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][247] ([Intel XE#455]) +8 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@kms_vrr@flipline.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][249] ([Intel XE#756])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-463/igt@kms_writeback@writeback-check-output.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#756]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#756])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#1091]) -> [SKIP][253] ([Intel XE#1091] / [Intel XE#1201])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][255] ([Intel XE#1126])
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#1126]) -> [SKIP][257] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][258] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][259] ([Intel XE#1473] / [Intel XE#392])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-small:
>     - shard-adlp:         [SKIP][260] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) -> [SKIP][261] ([Intel XE#1201])
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@xe_evict@evict-cm-threads-small.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@xe_evict@evict-cm-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-adlp:         [SKIP][262] ([Intel XE#1201] / [Intel XE#1392]) -> [SKIP][263] ([Intel XE#1201])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#288]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#288]) +22 other tests skip
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][267] ([Intel XE#288]) +8 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     [SKIP][268] ([Intel XE#1562]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#1562])
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [SKIP][270] ([Intel XE#1192]) -> [SKIP][271] ([Intel XE#1192] / [Intel XE#1201])
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_live_ktest@xe_bo.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#560]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#560])
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_media_fill@media-fill.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][275] ([Intel XE#512])
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-435/igt@xe_mmap@small-bar.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-432/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][276] ([Intel XE#977]) -> [SKIP][277] ([Intel XE#1201] / [Intel XE#977])
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@d3-mmap-vram:
>     - shard-adlp:         [SKIP][278] ([Intel XE#1008] / [Intel XE#1201]) -> [SKIP][279] ([Intel XE#1201])
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@xe_pm@d3-mmap-vram.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@xe_pm@d3-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][280] ([Intel XE#366]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#366])
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-adlp:         [INCOMPLETE][282] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927]) -> [DMESG-WARN][283] ([Intel XE#1214] / [Intel XE#1608])
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-adlp:         [DMESG-WARN][284] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][285] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [INCOMPLETE][286] ([Intel XE#1195]) -> [DMESG-WARN][287] ([Intel XE#1214])
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     [SKIP][288] ([Intel XE#579]) -> [SKIP][289] ([Intel XE#1201] / [Intel XE#579])
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     [SKIP][290] ([Intel XE#944]) -> [SKIP][291] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_query@multigpu-query-config.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-435/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     [SKIP][292] ([Intel XE#1731]) -> [SKIP][293] ([Intel XE#1201] / [Intel XE#1731])
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-432/igt@xe_wedged@basic-wedged.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-464/igt@xe_wedged@basic-wedged.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-FAIL][294] ([Intel XE#1760]) -> [DMESG-WARN][295] ([Intel XE#1214] / [Intel XE#1760])
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-adlp:         [DMESG-WARN][296] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-FAIL][297] ([Intel XE#1760])
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/shard-adlp-9/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
>   [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1488
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>   [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
>   [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
>   [Intel XE#1562]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1562
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1598]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1598
>   [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
>   [Intel XE#1606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1606
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
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
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123 -> xe-pw-133236v2
> 
>   IGT_7853: b6c459b99abc85cad050b0b04faaca9fc3568a69 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1285-a0c161037de0a89c0a9ea744f60099a4f94cc123: a0c161037de0a89c0a9ea744f60099a4f94cc123
>   xe-pw-133236v2: 133236v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133236v2/index.html
> 
