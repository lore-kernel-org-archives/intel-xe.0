Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF604D116F1
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 03:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8128B10E247;
	Fri,  5 Dec 2025 03:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUFGLltj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B1710E247
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 03:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764905214; x=1796441214;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=3+4fwLotRtVts3WynTx0sM0biY9IKV7+8q6Hpuiejls=;
 b=PUFGLltjYiJ5PE6duD20HyPKqAs0hTCnSa3tGpjm3I2uBxkMZqHRCdnU
 ejNxHu3O++hWpjNGu0OMH51YHudJHIRQhwH7wBeY7LrAUpFJ3JiNpHxOg
 hXluqXr0wnnmM7CgKlv4E7dYXfgCsg3eFvmaO2SR5AfbBXXjsfhsL4A1q
 zjWdrpQjod1fargyKS98/9QS1nBa/Rs+e4i7Gf/N9OynXo+fSjfW+Tier
 ai+XboHylerrK/sMOFBKQDUsKOrgofa4iqWa/kCMF0Az8gX7/Pcj13Z09
 LiRNWIPNCOC/JEq//ny8U4eV48htnYDgu1rtsEL46qpQulOjyLGy0Tkoo Q==;
X-CSE-ConnectionGUID: kY0yIVm/TdSvm6FdaW5RQg==
X-CSE-MsgGUID: kPeciLNhRA+Ih2UFeQJtCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78291686"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="78291686"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 19:26:53 -0800
X-CSE-ConnectionGUID: d6AD7WqeRGmHejqn8qxr8Q==
X-CSE-MsgGUID: tb8V2Kh1Rh6L1aG5QgQjZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="195201412"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 19:26:53 -0800
Date: Fri, 5 Dec 2025 04:26:49 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe=2Fguc=5Fct?= =?utf-8?Q?=3A?= Assert on credits
 mismatch during runtime suspend
Message-ID: <aTJQ-Z2EaZpYJMGe@black.igk.intel.com>
References: <20251202083334.554045-1-raag.jadav@intel.com>
 <176467946776.50139.10853510874280589620@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176467946776.50139.10853510874280589620@a3b018990fe9>
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

On Tue, Dec 02, 2025 at 12:44:27PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc_ct: Assert on credits mismatch during runtime suspend
> URL   : https://patchwork.freedesktop.org/series/158366/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65_FULL -> xe-pw-158366v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-158366v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-158366v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-158366v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@modeset-transition:

The failures seem like from display component and unrelated to the patch.

Raag

>     - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@kms_atomic_transition@modeset-transition.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_atomic_transition@modeset-transition.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a3.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-adlp:         [ABORT][6] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-158366v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124]) +7 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [FAIL][10] ([Intel XE#1874])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +6 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][12] -> [FAIL][13] ([Intel XE#1231] / [Intel XE#6699])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#367]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1512])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2887]) +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#3442])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#3432])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#787]) +32 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@hdmi-aspect-ratio:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#373]) +6 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#6704]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_dec_enc.html
> 
>   * igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#6704]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@kms_colorop@plane-xr24-xr24-ctm_3x4_bt709_enc_dec.html
> 
>   * igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#6704]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@kms_colorop@plane-xr30-xr30-ctm_3x4_bt709_enc.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          NOTRUN -> [FAIL][29] ([Intel XE#6707]) +1 other test fail
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2320]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2321])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#308])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#309])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][34] -> [FAIL][35] ([Intel XE#6715])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#323])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2286])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2244])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#4422])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         NOTRUN -> [ABORT][40] ([Intel XE#6675]) +3 other tests abort
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#702])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-8/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1137])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#310]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [ABORT][44] ([Intel XE#6675]) +7 other tests abort
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1421])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-8/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@dpms-vs-vblank-race:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][46] ([Intel XE#5208])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_flip@dpms-vs-vblank-race.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2293]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1397] / [Intel XE#1745])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1397])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1401] / [Intel XE#1745])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1401])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [FAIL][52] ([Intel XE#4683]) +1 other test fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#6312]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#651]) +4 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#4141]) +4 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1151])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#651]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2311]) +10 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1469])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#656]) +22 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#653]) +8 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#656]) +6 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2313]) +5 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#455]) +9 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@kms_hdr@bpc-switch.html
>     - shard-bmg:          NOTRUN -> [ABORT][66] ([Intel XE#6740]) +1 other test abort
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][67] ([Intel XE#6675])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-dg2-435/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
>     - shard-lnl:          [PASS][68] -> [ABORT][69] ([Intel XE#6675])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#5624])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-1/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1129])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-8/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_rpm@system-suspend-idle:
>     - shard-dg2-set2:     [PASS][72] -> [ABORT][73] ([Intel XE#6675])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-dg2-436/igt@kms_pm_rpm@system-suspend-idle.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-dg2-464/igt@kms_pm_rpm@system-suspend-idle.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1122] / [Intel XE#1406] / [Intel XE#5580])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-primary-render:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +6 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@kms_psr@fbc-psr-primary-render.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1406])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-8/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1127]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2330])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#3414]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-3:
>     - shard-bmg:          [PASS][83] -> [FAIL][84] ([Intel XE#6361]) +2 other tests fail
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_setmode@basic@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_sharpness_filter@filter-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#6503])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_sharpness_filter@filter-dpms.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#362])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-adlp:         [PASS][87] -> [ABORT][88] ([Intel XE#6675]) +6 other tests abort
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#1499])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@testdisplay:
>     - shard-bmg:          [PASS][90] -> [ABORT][91] ([Intel XE#6740])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@testdisplay.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@testdisplay.html
> 
>   * igt@xe_ccs@block-multicopy-compressed:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) +2 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-1/igt@xe_ccs@block-multicopy-compressed.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many-all-ram:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#6360])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1123])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-matrix-copy-2x2:
>     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#5300]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@xe_copy_basic@mem-matrix-copy-2x2.html
> 
>   * igt@xe_eu_stall@blocking-read:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#5626]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@xe_eu_stall@blocking-read.html
> 
>   * igt@xe_eudebug@basic-vm-access-faultable:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#4837] / [Intel XE#5565]) +6 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@xe_eudebug@basic-vm-access-faultable.html
> 
>   * igt@xe_eudebug@basic-vm-bind-extended-discovery:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#4837]) +3 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
> 
>   * igt@xe_eudebug_online@pagefault-read-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#6665])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-8/igt@xe_eudebug_online@pagefault-read-stress.html
> 
>   * igt@xe_eudebug_online@set-breakpoint:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4837]) +4 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#688]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-large-external:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#261] / [Intel XE#5564]) +1 other test skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@xe_evict@evict-large-external.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#261]) +3 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-8/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_exec_basic@many-execqueues-rebind:
>     - shard-adlp:         [PASS][105] -> [INCOMPLETE][106] ([Intel XE#3876])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-3/igt@xe_exec_basic@many-execqueues-rebind.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-6/igt@xe_exec_basic@many-execqueues-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2322]) +5 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1392] / [Intel XE#5575]) +5 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1392]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@xe_exec_basic@multigpu-once-null-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#288] / [Intel XE#5561]) +16 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
>     - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#2360])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#4915]) +185 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-1/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge:
>     - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#4943]) +2 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#4943]) +8 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>     - shard-adlp:         [PASS][115] -> [DMESG-FAIL][116] ([Intel XE#3876])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-3/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-6/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#2229])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141]) -> ([PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [SKIP][164], [PASS][165], [PASS][166]) ([Intel XE#2457])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@xe_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@xe_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@xe_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-3/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-3/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-5/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@xe_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@xe_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@xe_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-4/igt@xe_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@xe_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@xe_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-3/igt@xe_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-4/igt@xe_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-3/igt@xe_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-4/igt@xe_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-5/igt@xe_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-5/igt@xe_module_load@load.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-5/igt@xe_module_load@load.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-5/igt@xe_module_load@load.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-5/igt@xe_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-4/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-5/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-4/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-4/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-4/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@invalid-oa-format-id:
>     - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#3573]) +3 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@xe_oa@invalid-oa-format-id.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#1061])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@xe_peer2peer@read.html
>     - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2427])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3hot-i2c:
>     - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#5742])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_pm@d3hot-i2c.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-bmg:          [PASS][171] -> [ABORT][172] ([Intel XE#6675])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2284])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-90:
>     - shard-lnl:          [PASS][174] -> [FAIL][175] ([Intel XE#6251]) +4 other tests fail
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
>     - shard-lnl:          NOTRUN -> [ABORT][176] ([Intel XE#6675]) +1 other test abort
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
>     - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#4733])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>     - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#4733] / [Intel XE#5594])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-adlp:         NOTRUN -> [SKIP][179] ([Intel XE#944]) +2 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-1/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#944])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_render_copy@render-stress-1-copies:
>     - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#4814] / [Intel XE#5614])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-3/igt@xe_render_copy@render-stress-1-copies.html
> 
>   * igt@xe_spin_batch@spin-mem-copy:
>     - shard-adlp:         NOTRUN -> [SKIP][182] ([Intel XE#4821])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-8/igt@xe_spin_batch@spin-mem-copy.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-bmg:          NOTRUN -> [FAIL][183] ([Intel XE#5937])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-bmg:          NOTRUN -> [FAIL][184] ([Intel XE#6569])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][185] ([Intel XE#1231]) -> [PASS][186]
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-bmg:          [SKIP][187] ([Intel XE#2316]) -> [PASS][188] +1 other test pass
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
>     - shard-bmg:          [ABORT][189] ([Intel XE#1727]) -> [PASS][190] +1 other test pass
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-lnl:          [ABORT][191] ([Intel XE#6675]) -> [PASS][192] +3 other tests pass
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-adlp:         [ABORT][193] ([Intel XE#6675]) -> [PASS][194] +6 other tests pass
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-bmg:          [ABORT][195] ([Intel XE#6675]) -> [PASS][196] +3 other tests pass
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@xe_pm@s3-multiple-execs.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0:
>     - shard-lnl:          [FAIL][197] ([Intel XE#6251]) -> [PASS][198]
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][199] ([Intel XE#1231]) -> [FAIL][200] ([Intel XE#1231] / [Intel XE#6699]) +4 other tests fail
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-bmg:          [SKIP][201] ([Intel XE#2316]) -> [ABORT][202] ([Intel XE#6675])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][203] ([Intel XE#2312]) -> [SKIP][204] ([Intel XE#2311]) +3 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
>     - shard-bmg:          [SKIP][205] ([Intel XE#2312]) -> [SKIP][206] ([Intel XE#4141])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][207] ([Intel XE#2312]) -> [SKIP][208] ([Intel XE#2313]) +3 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-bmg:          [SKIP][209] ([Intel XE#346]) -> [SKIP][210] ([Intel XE#346] / [Intel XE#6590]) +1 other test skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-3/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-bmg:          [SKIP][211] ([Intel XE#2927]) -> [SKIP][212] ([Intel XE#2927] / [Intel XE#6590])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          [SKIP][213] ([Intel XE#2934]) -> [SKIP][214] ([Intel XE#2934] / [Intel XE#6590])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-WARN][215] ([Intel XE#3868]) -> [DMESG-FAIL][216] ([Intel XE#3868])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-3/igt@xe_exec_reset@cm-cat-error.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          [ABORT][217] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][218] ([Intel XE#5466] / [Intel XE#5530] / [Intel XE#5545])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-adlp:         [SKIP][219] ([Intel XE#2284] / [Intel XE#366]) -> [TIMEOUT][220] ([Intel XE#3876])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65/shard-adlp-3/igt@xe_pm@d3cold-mmap-system.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/shard-adlp-6/igt@xe_pm@d3cold-mmap-system.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4683]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
>   [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
>   [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
>   [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
>   [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
>   [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
>   [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
>   [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6675]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6675
>   [Intel XE#6699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6699
>   [Intel XE#6704]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6704
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
>   [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65 -> xe-pw-158366v1
> 
>   IGT_8647: 8647
>   xe-4178-639f325d8cbdc690de963db2fe5840444ac7ea65: 639f325d8cbdc690de963db2fe5840444ac7ea65
>   xe-pw-158366v1: 158366v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158366v1/index.html
