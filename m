Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F32C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 20:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B339910E159;
	Wed, 26 Jun 2024 20:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eD+803Y6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A1410E159
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719434011; x=1750970011;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=1t4rzQDlc0flXzt2a6WYuyTlpxuYZ/2kb0DltBdy9TI=;
 b=eD+803Y6juHjCSu8RYSg/eo9Gn2he+FLknfgyOEu5tQFQXZJlCl0sOFt
 Att7wS6eznhgOOxccBWY21vAJi+ROzFKm1DhrFX1As1o3w5iJ5nVkIxwZ
 I3pGKQor/hvlyYsi4gl6bxBAl/JUbziRu6RvXl9IJ/KauE+dblxNn1ZDQ
 rM10uxJ5Nd6sCtSIliQr4ANuuHH9A9LfBielHJdiQ36900T5eI6DuvyJt
 fpbdtms5PXZalbefDrJsI1fbDAEHhNRIrqGltvvaeBvrM9LKHze3HOra4
 x73L/xZhg4WDCPVG2MHXY0/iuSxIF2PdxBICBJ0mLuR47th0rudFltcsS g==;
X-CSE-ConnectionGUID: rP0pUPVDSnqjmBCwybbscg==
X-CSE-MsgGUID: 0WKqtrjNQ7+IIwDrnxpqhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="33984034"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="33984034"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 13:33:31 -0700
X-CSE-ConnectionGUID: 6iXCcl88ShKjvouf89r+QA==
X-CSE-MsgGUID: LGko2bjfRrmXnSffBH4fbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="49043493"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 26 Jun 2024 13:33:22 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 455902879E
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 21:33:18 +0100 (IST)
Message-ID: <99360f7b-63d7-478f-abda-849d21bcd9f9@intel.com>
Date: Wed, 26 Jun 2024 22:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/vf=3A_Tra?=
 =?UTF-8?Q?ck_writes_to_inaccessible_registers_from_VF_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240626084304.1345-1-michal.wajdeczko@intel.com>
 <171940349853.160231.3537609587214374499@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171940349853.160231.3537609587214374499@a6498e030952>
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



On 26.06.2024 14:04, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/vf: Track writes to inaccessible registers from VF (rev2)
> URL   : https://patchwork.freedesktop.org/series/135295/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1_full -> xe-pw-135295v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135295v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135295v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135295v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-7:
>     - shard-adlp:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-1/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-7.html

unrelated: exposing existing driver issue

BUG: MAX_LOCKDEP_KEYS too low!

> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
>     - shard-adlp:         NOTRUN -> [FAIL][2] +2 other tests fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-9/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

unrelated: test bug

(sriov_basic:956) igt_device-WARNING: Couldn't find PCI device 0000:00:02:02
(sriov_basic:956) igt_sriov_device-CRITICAL: Test assertion failure
function __igt_sriov_bind_vf_drm_driver, file
../../../usr/src/igt-gpu-tools/lib/igt_sriov_device.c:310:
(sriov_basic:956) igt_sriov_device-CRITICAL: Failed assertion: pci_dev
(sriov_basic:956) igt_sriov_device-CRITICAL: Last errno: 2, No such file
or directory
(sriov_basic:956) igt_sriov_device-CRITICAL: No PCI device for given VF
number: 2

> 
>   
> #### Warnings ####

> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][3] ([Intel XE#1214]) -> [DMESG-WARN][4] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

<3> [165.641199] xe 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x2
-> 0x0)
<7> [165.641240] xe 0000:03:00.0: [drm:xe_migrate_copy [xe]] Pass 3,
sizes: 983040 & 983040
<4> [165.641275] ------------[ cut here ]------------
<4> [165.641277] xe 0000:00:02.0: [drm] Unexpected DBuf power power
state (0x00000000, expected 0x00000001)

> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-adlp:         [SKIP][5] ([Intel XE#1201] / [Intel XE#1932]) -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

BUG: MAX_LOCKDEP_KEYS too low!

> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-adlp:         [SKIP][7] ([Intel XE#1201] / [Intel XE#1932]) -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-6/igt@sriov_basic@enable-vfs-bind-unbind-each.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-9/igt@sriov_basic@enable-vfs-bind-unbind-each.html

(sriov_basic:956) igt_device-WARNING: Couldn't find PCI device 0000:00:02:02

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - {shard-lnl}:        [PASS][9] -> [INCOMPLETE][10] +1 other test incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-lnl-4/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * {igt@kms_vrr@cmrr}:
>     - shard-dg2-set2:     [SKIP][11] ([Intel XE#1201]) -> [SKIP][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_vrr@cmrr.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_vrr@cmrr.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135295v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1033] / [Intel XE#1214])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][16] ([Intel XE#1231])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][18] ([Intel XE#324])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +23 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@flip-vs-rmfb@a-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][26] ([Intel XE#1195]) +1 other test incomplete
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_flip@flip-vs-rmfb@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
>     - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1195])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         NOTRUN -> [FAIL][30] ([Intel XE#1874]) +8 other tests fail
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#656]) +24 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1158] / [Intel XE#1201])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][35] ([Intel XE#1035] / [Intel XE#1195])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][36] -> [FAIL][37] ([Intel XE#361]) +2 other tests fail
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1129] / [Intel XE#1201])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201]) +15 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@psr2-primary-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_psr@psr2-primary-blt.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#327])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][47] -> [FAIL][48] ([Intel XE#899]) +1 other test fail
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1126] / [Intel XE#1201])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-small:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_evict@evict-cm-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][52] -> [TIMEOUT][53] ([Intel XE#1473])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-small.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-simple:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-userptr.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-basic:
>     - shard-dg2-set2:     [PASS][57] -> [DMESG-WARN][58] ([Intel XE#1214]) +1 other test dmesg-warn
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-basic.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-basic.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#512])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#1337])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][62] -> [ABORT][63] ([Intel XE#1358])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-6/igt@xe_pm@s4-exec-after.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [PASS][64] -> [ABORT][65] ([Intel XE#1794])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_query@multigpu-query-engines.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][67] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
> 
>   * igt@kms_fbcon_fbt@fbc:
>     - {shard-lnl}:        [FAIL][69] -> [PASS][70]
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-lnl-2/igt@kms_fbcon_fbt@fbc.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-lnl-4/igt@kms_fbcon_fbt@fbc.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - {shard-lnl}:        [FAIL][71] ([Intel XE#886]) -> [PASS][72] +2 other tests pass
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1:
>     - {shard-lnl}:        [DMESG-WARN][73] ([Intel XE#2052]) -> [PASS][74] +3 other tests pass
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-lnl-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-lnl-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][75] ([Intel XE#899]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - {shard-lnl}:        [FAIL][77] ([Intel XE#899]) -> [PASS][78] +1 other test pass
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-adlp:         [SKIP][79] ([Intel XE#1201] / [Intel XE#1932]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
>     - {shard-lnl}:        [FAIL][81] ([Intel XE#1069]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-lnl-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-lnl-4/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][83] ([Intel XE#2097]) -> [PASS][84] +1 other test pass
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-lnl-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-lnl-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-dg2-set2:     [FAIL][85] ([Intel XE#1414]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@xe_gt_freq@freq_fixed_exec.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_pat@pat-index-xelp@dw:
>     - shard-dg2-set2:     [DMESG-WARN][87] ([Intel XE#1214]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@xe_pat@pat-index-xelp@dw.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-436/igt@xe_pat@pat-index-xelp@dw.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [ABORT][89] ([Intel XE#1358]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [ABORT][91] ([Intel XE#1794]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-9/igt@xe_pm@s4-mocs.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [ABORT][93] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     [SKIP][95] ([Intel XE#801]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][97] ([Intel XE#316]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][100] ([Intel XE#316]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][101] ([Intel XE#1124]) -> [SKIP][102] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][103] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][104] ([Intel XE#1124]) +8 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][105] ([Intel XE#607]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#607])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][107] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][108] ([Intel XE#367]) +2 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][109] ([Intel XE#367]) -> [SKIP][110] ([Intel XE#1201] / [Intel XE#367])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][112] ([Intel XE#787]) +62 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     [SKIP][113] ([Intel XE#787]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][116] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][120] ([Intel XE#306]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#306]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#373]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][126] ([Intel XE#373]) +4 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_chamelium_frames@hdmi-frame-dump.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][128] ([Intel XE#308]) +2 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#308]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][132] ([Intel XE#1137])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [DMESG-WARN][133] ([Intel XE#1214] / [Intel XE#1551]) -> [INCOMPLETE][134] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#455]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][138] ([Intel XE#651]) +20 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#651]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][142] ([Intel XE#658])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#653]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][146] ([Intel XE#653]) +22 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#498]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][152] ([Intel XE#305] / [Intel XE#455])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][154] ([Intel XE#305]) +2 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][156] ([Intel XE#455]) +14 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#870]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#870])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][160] ([Intel XE#870])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_pm_backlight@fade.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#1129]) -> [SKIP][162] ([Intel XE#1129] / [Intel XE#1201])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][164] ([Intel XE#1489]) +3 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1489]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1122]) -> [SKIP][168] ([Intel XE#1122] / [Intel XE#1201])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][170] ([Intel XE#1122]) +1 other test skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr2-dpms:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][172] ([Intel XE#929]) +9 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@kms_psr@fbc-psr2-dpms.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#929]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#1127]) -> [SKIP][176] ([Intel XE#1127] / [Intel XE#1201])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][178] ([Intel XE#327])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][180] ([Intel XE#1127])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#327]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#327])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][183] ([Intel XE#1551]) -> [DMESG-WARN][184] ([Intel XE#1214] / [Intel XE#1551]) +1 other test dmesg-warn
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1091]) -> [SKIP][186] ([Intel XE#1091] / [Intel XE#1201])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1126]) -> [SKIP][188] ([Intel XE#1126] / [Intel XE#1201])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][190] ([Intel XE#1126]) +1 other test skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][192] ([Intel XE#288]) +17 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#288]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][196] ([Intel XE#1337])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#366]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#366]) +3 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][199] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][200] ([Intel XE#1551] / [Intel XE#569])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][202] ([Intel XE#944]) +1 other test skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-436/igt@xe_query@multigpu-query-config.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-432/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#944]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-WARN][205] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][206] ([Intel XE#1760])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-adlp:         [DMESG-WARN][207] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][208] ([Intel XE#1760])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
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
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
>   [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
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
>   * Linux: xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1 -> xe-pw-135295v2
> 
>   IGT_7901: dceed442a14a0abd09065cbade94cefe11e00422 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1529-eeab54efcc91d572f99ea6ee3d9f562bb79a08d1: eeab54efcc91d572f99ea6ee3d9f562bb79a08d1
>   xe-pw-135295v2: 135295v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/index.html
> 
