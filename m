Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73713C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 07:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3EB10E7A7;
	Wed, 26 Jun 2024 07:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="asokQKCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312FB10E7A6
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719387709; x=1750923709;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ftUMT4PtkeIy1nXMsWA2LWbtP/4x56B44RkKAXPsDjQ=;
 b=asokQKCjBviNaQoSz0JUIstPDw9bP4MgvFe4AEI1zAaA6b1TeSoBfz/V
 4x5Aqm3Cq50xtYU4wAOoGn7M1KknUVNCNIfaWZJRoUyXobpQcv7fiYcVE
 EdAecEPbsDU6y+H1U5SB8Cl6pvIHycK2RqnspQ6uwm00eucxfbWii6/Ae
 W90YqfDM5mftnu0FPjAq6jeEpR01sRd7mBTvIy7jp+B4XcXLdCi2QH6es
 gdZjr8BguwP0Yir+sIY16avkdZiaw877gAxEHCcL5hH2ZrUxKvTNeI0go
 Isuqm4YPu/b/l9RCMJgzbwOddqydl3oUj7m2vtpaQTl7c+AlmeeIIiqVd A==;
X-CSE-ConnectionGUID: U9cZL52fS9qvUSaWoiAJ5A==
X-CSE-MsgGUID: UMNGKg0FSYSzihyeb05ABA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27849922"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="27849922"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 00:41:49 -0700
X-CSE-ConnectionGUID: BVF+qmImTDmSKcuqOGXt3w==
X-CSE-MsgGUID: l6vktc0HTRSzXYcOaNfUpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="44630875"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 26 Jun 2024 00:41:41 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 586C4125B4
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 08:41:39 +0100 (IST)
Message-ID: <eb351cc6-566b-4b4c-b416-c7d6d796672d@intel.com>
Date: Wed, 26 Jun 2024 09:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_PF=3A_Trigger_ex?=
 =?UTF-8?Q?plicit_FLR_while_disabling_VFs?=
To: intel-xe@lists.freedesktop.org
References: <20240625194546.1301-1-michal.wajdeczko@intel.com>
 <171936091385.158964.9104657623954165077@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171936091385.158964.9104657623954165077@a6498e030952>
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



On 26.06.2024 02:15, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: Trigger explicit FLR while disabling VFs
> URL   : https://patchwork.freedesktop.org/series/135380/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328_full -> xe-pw-135380v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-135380v1_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135380v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135380v1_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][1] ([Intel XE#1204]) -> [TIMEOUT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

<4> [512.423150] [IGT] Per-test timeout exceeded. Killing the current
test with SIGQUIT.

but must be unrelated as it was seen on native run, while patch is PF
specific

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_plane_lowres@tiling-none:
>     - {shard-lnl}:        [SKIP][3] ([Intel XE#599]) -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-lnl-4/igt@kms_plane_lowres@tiling-none.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-lnl-7/igt@kms_plane_lowres@tiling-none.html
> 
>   * {igt@kms_vrr@cmrr}:
>     - shard-dg2-set2:     [SKIP][5] ([Intel XE#1201]) -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_vrr@cmrr.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_vrr@cmrr.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328_full and xe-pw-135380v1_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@core_hotunplug:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135380v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [FAIL][8] ([Intel XE#1874])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#610])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#607])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_joiner@invalid-modeset-force-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201]) +4 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_big_joiner@invalid-modeset-force-joiner.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#787]) +26 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#306])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_edid@vga-edid-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-435/igt@kms_chamelium_edid@vga-edid-read.html
> 
>   * igt@kms_chamelium_frames@dp-crc-multiple:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#373]) +10 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-multiple.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][26] ([Intel XE#1178]) +1 other test fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#323])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#776])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#701])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1137] / [Intel XE#1201])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
>     - shard-adlp:         [PASS][34] -> [FAIL][35] ([Intel XE#301]) +1 other test fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
>     - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#1195]) +2 other tests incomplete
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][39] -> [FAIL][40] ([Intel XE#1874]) +2 other tests fail
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#651]) +18 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#653]) +18 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#656]) +31 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#356])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][47] ([Intel XE#616]) +3 other tests fail
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1129] / [Intel XE#1201])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#836])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1149] / [Intel XE#1201])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1127] / [Intel XE#1201])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#327])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#756]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1123] / [Intel XE#1201]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1123] / [Intel XE#1201])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1126] / [Intel XE#1201])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#1600])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][66] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#1392]) +7 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@xe_exec_fault_mode@once-basic.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-rebind-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#288]) +21 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-rebind-prefetch.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][72] ([Intel XE#1173]) +1 other test fail
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#366])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][74] ([Intel XE#1214] / [Intel XE#569])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][75] -> [ABORT][76] ([Intel XE#1794]) +1 other test abort
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#579])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         NOTRUN -> [FAIL][78] ([Intel XE#958])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#944])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#944])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-466/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_vm@mixed-binds-1611661312:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][81] ([Intel XE#1214]) +1 other test dmesg-warn
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-8/igt@xe_vm@mixed-binds-1611661312.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][82] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][83] +1 other test pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][84] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [INCOMPLETE][86] ([Intel XE#1195]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][88] ([Intel XE#1195]) -> [PASS][89] +3 other tests pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][90] ([Intel XE#1874]) -> [PASS][91] +2 other tests pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
>     - {shard-lnl}:        [INCOMPLETE][92] ([Intel XE#2050]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html
> 
>   * igt@kms_pipe_crc_basic@hang-read-crc:
>     - shard-dg2-set2:     [INCOMPLETE][94] ([Intel XE#1150] / [Intel XE#1195]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-436/igt@kms_pipe_crc_basic@hang-read-crc.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-466/igt@kms_pipe_crc_basic@hang-read-crc.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][96] ([Intel XE#1473]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_basic@many-null-defer-mmap:
>     - {shard-lnl}:        [INCOMPLETE][98] -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-lnl-7/igt@xe_exec_basic@many-null-defer-mmap.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-lnl-5/igt@xe_exec_basic@many-null-defer-mmap.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [ABORT][100] ([Intel XE#1794]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-9/igt@xe_pm@s4-mocs.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [ABORT][102] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][104] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][105] ([Intel XE#1033] / [Intel XE#1214])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][106] ([Intel XE#873]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#873])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#316]) -> [SKIP][109] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][111] ([Intel XE#316]) +1 other test skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][113] ([Intel XE#619])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][115] ([Intel XE#1124]) +5 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][116] ([Intel XE#324]) -> [FAIL][117] ([Intel XE#1231])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][118] ([Intel XE#1231]) -> [DMESG-FAIL][119] ([Intel XE#324])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1124]) -> [SKIP][121] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#367]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][125] ([Intel XE#367]) +2 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][126] ([Intel XE#787]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][129] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][133] ([Intel XE#787]) +48 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][135] ([Intel XE#1252])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#306]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][139] ([Intel XE#306]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#373]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][143] ([Intel XE#373]) +7 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][145] ([Intel XE#307])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     [FAIL][146] ([Intel XE#1204]) -> [TIMEOUT][147] ([Intel XE#2080])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][149] ([Intel XE#308])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_cursor_crc@cursor-random-512x512.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#307]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][153] ([Intel XE#1135])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_feature_discovery@psr1.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [DMESG-WARN][154] ([Intel XE#1214] / [Intel XE#1551]) -> [INCOMPLETE][155] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][157] ([Intel XE#455]) +10 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#651]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][161] ([Intel XE#651]) +21 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][163] ([Intel XE#653]) +21 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#653]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][167] ([Intel XE#356])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][169] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][171] ([Intel XE#498]) +2 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][173] ([Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][175] ([Intel XE#305]) +2 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#305]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#870]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#870])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         [SKIP][182] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][183] ([Intel XE#1204])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#908]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#908])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][187] ([Intel XE#1489]) +2 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1489]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#1489])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#1122]) -> [SKIP][191] ([Intel XE#1122] / [Intel XE#1201])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][193] ([Intel XE#929]) +9 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#929]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_psr@psr-dpms.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][197] ([Intel XE#1149])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#327]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#327])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#1127]) -> [SKIP][201] ([Intel XE#1127] / [Intel XE#1201]) +1 other test skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][203] ([Intel XE#327]) +1 other test skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#1500])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][206] ([Intel XE#1214] / [Intel XE#1551]) -> [DMESG-WARN][207] ([Intel XE#1551]) +1 other test dmesg-warn
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#455]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_vrr@flipline.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-433/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#756]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#756])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][213] ([Intel XE#756])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][215] ([Intel XE#1091])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][217] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][219] ([Intel XE#288]) +17 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#288]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#288]) +19 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-FAIL][222] ([Intel XE#358]) -> [DMESG-FAIL][223] ([Intel XE#1962])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][225] ([Intel XE#378])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-433/igt@xe_module_load@force-load.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][227] ([Intel XE#979])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#979]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#979])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#366]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][232] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][233] ([Intel XE#1551] / [Intel XE#569])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-adlp:         [INCOMPLETE][234] ([Intel XE#1195] / [Intel XE#1358]) -> [DMESG-WARN][235] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1727])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-1/igt@xe_pm@s3-d3hot-basic-exec.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#944]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#944])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][239] ([Intel XE#944]) +2 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-WARN][240] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][241] ([Intel XE#1760])
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-adlp:         [DMESG-FAIL][242] ([Intel XE#1760]) -> [DMESG-WARN][243] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
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
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2080
>   [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
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
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328 -> xe-pw-135380v1
> 
>   IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328: c7f3ccc0f957750deeba044da72581ec1bf5e328
>   xe-pw-135380v1: 135380v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/index.html
> 
