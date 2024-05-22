Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FBDC25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 21:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A848810E028;
	Wed, 22 May 2024 21:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyESvE/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82AE10E028
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 21:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716413887; x=1747949887;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=09p+K2zZ+jl9k6eG5hqcds6jz7ay7jZG+PysAGDm1XY=;
 b=cyESvE/9dFjN/fPPIcBMMqgBwTvyILAvBdNIPyKfPJYozCt13jgP3Pyh
 yucC6xI81sDITmzZ2m4hbs/FMtMMoH1i1xp4jlJpTQRJsjRryDVZAKtvW
 KSYIi23ErcbusmU2KZAXPv9AdFdWIIQ2NsCqbtZzWyNdfLSSAEhIOvodh
 yA9fqQRmglWZj9m/vhzRexMmEoohebE5hDOQKhbxaRio+uXLSMc6CSC3r
 yKzLevMf/ocWO6sKlOtS+7iDWqWjaAQ+vUL1uSGh4zXA0FrNtia+DALNA
 MscFtgZwj8Gsuq/7LWSPvCgySd4O46eziBgrjDVsycUd2NoJalmvTMgxh Q==;
X-CSE-ConnectionGUID: ONNxYjq4SrKsmI+PzQLRTw==
X-CSE-MsgGUID: LEpWP61oRy2/dFu0eZfIzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="30228133"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="30228133"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 14:38:06 -0700
X-CSE-ConnectionGUID: fUOrsWT+SK2KlVWOyHHSCA==
X-CSE-MsgGUID: Odxv7ufDTCafuFZYClg48A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33408043"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 22 May 2024 14:37:59 -0700
Received: from [10.246.25.139] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 16F84332BC
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 22:37:44 +0100 (IST)
Message-ID: <bc7d1263-2313-412f-a673-bb678dbb9d95@intel.com>
Date: Wed, 22 May 2024 23:37:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Store_platform_n?=
 =?UTF-8?Q?ame_in_xe=5Fdevice=2Einfo?=
To: intel-xe@lists.freedesktop.org
References: <20240521142257.756-1-michal.wajdeczko@intel.com>
 <171633201918.2165162.15817436502888620183@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171633201918.2165162.15817436502888620183@8e613ede5ea5>
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



On 22.05.2024 00:53, Patchwork wrote:
> == Series Details ==
> 
> Series: Store platform name in xe_device.info
> URL   : https://patchwork.freedesktop.org/series/133880/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad_full -> xe-pw-133880v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-133880v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-133880v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-133880v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all unrelated to this series

> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x256:
>     - shard-adlp:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html

<3> [269.992309] xe 0000:00:02.0: [drm] *ERROR* GT0: TLB invalidation
time'd out, seqno=3, recv=2

> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [ABORT][2] +1 other test abort
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html

This test caused an abort condition: Lockdep not active

<3> [190.197131]
=============================================================================
<3> [190.197816] BUG kmalloc-1k (Tainted: G     U  W         ): Poison
overwritten
<3> [190.197822]
-----------------------------------------------------------------------------
<3> [190.197826] 0xffff88813bf79de8-0xffff88813bf79dea @offset=7656.
First byte 0xa7 instead of 0x6b
<3> [190.197831] Allocated in xe_file_open+0x2c/0x140 [xe] age=9685
cpu=6 pid=1121
<4> [190.197904]  kmalloc_trace+0x389/0x3c0
<4> [190.197910]  xe_file_open+0x2c/0x140 [xe]
<4> [190.197964]  drm_file_alloc+0x1d6/0x2b0 [drm]
<4> [190.198008]  drm_open_helper+0x7f/0x160 [drm]
<4> [190.198047]  drm_open+0x74/0x120 [drm]
<4> [190.198086]  drm_stub_open+0xb0/0x120 [drm]
<4> [190.198122]  chrdev_open+0xab/0x1f0
<4> [190.198125]  do_dentry_open+0x17b/0x580
<4> [190.198128]  vfs_open+0x33/0x40
<4> [190.198130]  path_openat+0x6e1/0xa70
<4> [190.198134]  do_filp_open+0xb0/0x120
<4> [190.198137]  do_sys_openat2+0x250/0x2a0
<4> [190.198139]  do_sys_open+0x46/0x80
<4> [190.198142]  __x64_sys_openat+0x20/0x30
<4> [190.198145]  x64_sys_call+0x1b0c/0x20c0
<4> [190.198148]  do_syscall_64+0x88/0x140
<3> [190.198152] Freed in xe_file_close+0x19a/0x1e0 [xe] age=9283 cpu=8
pid=1121
<4> [190.198208]  kfree+0x2aa/0x320
<4> [190.198211]  xe_file_close+0x19a/0x1e0 [xe]
<4> [190.198258]  drm_file_free+0x21a/0x290 [drm]
<4> [190.198293]  drm_close_helper.isra.0+0x73/0x80 [drm]
<4> [190.198327]  drm_release_noglobal+0x25/0x80 [drm]
<4> [190.198360]  __fput+0xb9/0x310
<4> [190.198362]  __fput_sync+0x1a/0x20
<4> [190.198365]  __x64_sys_close+0x3e/0x80
<4> [190.198367]  x64_sys_call+0x18e6/0x20c0
<4> [190.198369]  do_syscall_64+0x88/0x140

but that already seen elsewhere

> 
>   * igt@kms_universal_plane@universal-plane-functional@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][3] -> [ABORT][4] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_universal_plane@universal-plane-functional@pipe-a-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_universal_plane@universal-plane-functional@pipe-a-hdmi-a-1.html

same here

> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>     - shard-dg2-set2:     [PASS][5] -> [ABORT][6] +8 other tests abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

and here

> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         NOTRUN -> [WARN][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html

(xe_pm:1281) igt_pm-WARNING: timeout: pm_status expected:suspended,
got:active

> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-adlp:         [SKIP][8] ([Intel XE#1201] / [Intel XE#316]) -> [ABORT][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_color@legacy-gamma:
>     - {shard-lnl}:        [PASS][10] -> [ABORT][11] +2 other tests abort
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-4/igt@kms_color@legacy-gamma.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-8/igt@kms_color@legacy-gamma.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - {shard-lnl}:        NOTRUN -> [FAIL][12] +2 other tests fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt:
>     - {shard-lnl}:        [SKIP][13] ([Intel XE#651]) -> [ABORT][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_pm_rpm@legacy-planes:
>     - {shard-lnl}:        NOTRUN -> [SKIP][15]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-8/igt@kms_pm_rpm@legacy-planes.html
> 
>   * igt@kms_vblank@query-idle-hang:
>     - {shard-lnl}:        NOTRUN -> [ABORT][16] +2 other tests abort
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-4/igt@kms_vblank@query-idle-hang.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][17]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-8/igt@xe_live_ktest@xe_mocs.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-133880v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][18] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1451])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@core_hotunplug@hotunplug-rescan.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#660])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@crc@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][20] -> [INCOMPLETE][21] ([Intel XE#1195])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_async_flips@crc@pipe-b-hdmi-a-6.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_async_flips@crc@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#873])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#610])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [ABORT][25] ([Intel XE#1760])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][27] ([Intel XE#1231]) +1 other test fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1124]) +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][29] ([Intel XE#1214] / [Intel XE#324])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1124] / [Intel XE#1201]) +14 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#619])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#607])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#346])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#367]) +6 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +53 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#1252])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#787]) +111 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#787]) +80 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][42] ([Intel XE#1850])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][43] ([Intel XE#1713])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +27 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#314])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#373]) +18 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#373]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#1178]) +1 other test fail
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#307])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#307])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#308])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][56] -> [DMESG-WARN][57] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][58] ([Intel XE#1195]) +1 other test incomplete
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-128x128@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][59] ([Intel XE#1214] / [Intel XE#282]) +10 other tests dmesg-warn
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [PASS][60] -> [DMESG-WARN][61] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#323])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [PASS][64] -> [DMESG-WARN][65] ([Intel XE#282])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#1201])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#309]) +7 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#776])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1137] / [Intel XE#1201])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1137] / [Intel XE#1201])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#310]) +12 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][75] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#455]) +34 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][77] ([Intel XE#324]) +3 other tests dmesg-fail
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#651]) +3 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#651]) +22 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][80] ([Intel XE#1861]) +2 other tests fail
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#651]) +26 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#653]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1151] / [Intel XE#1201])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#656]) +67 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#417])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][88] -> [SKIP][89] ([Intel XE#1201] / [Intel XE#455])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     [PASS][90] -> [DMESG-WARN][91] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#455]) +3 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#305]) +14 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +9 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#305]) +2 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#870]) +2 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1201] / [Intel XE#836])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#929]) +4 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201]) +11 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1122] / [Intel XE#1201])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1201] / [Intel XE#929]) +19 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1149] / [Intel XE#1201])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-adlp:         NOTRUN -> [FAIL][110] ([Intel XE#1874]) +10 other tests fail
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#1127] / [Intel XE#1201])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1127])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-adlp:         NOTRUN -> [FAIL][115] ([Intel XE#1174])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#362])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][117] -> [FAIL][118] ([Intel XE#771] / [Intel XE#899])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-dg2-set2:     NOTRUN -> [FAIL][119] ([Intel XE#771] / [Intel XE#899])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][120] -> [FAIL][121] ([Intel XE#899])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][122] ([Intel XE#899])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_universal_plane@universal-plane-functional:
>     - shard-dg2-set2:     [PASS][123] -> [ABORT][124] ([Intel XE#1205])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_universal_plane@universal-plane-functional.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_universal_plane@universal-plane-functional.html
>     - shard-adlp:         [PASS][125] -> [ABORT][126] ([Intel XE#1205])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_universal_plane@universal-plane-functional.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_universal_plane@universal-plane-functional.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +1 other test skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][130] ([Intel XE#1050])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1123] / [Intel XE#1201])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1123])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1126] / [Intel XE#1201])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][136] -> [INCOMPLETE][137] ([Intel XE#1195] / [Intel XE#1473])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1201] / [Intel XE#261]) +8 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-small-multi-vm-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +5 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@xe_evict@evict-small-multi-vm-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#1201] / [Intel XE#688]) +3 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#1201] / [Intel XE#1392]) +15 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#288]) +1 other test skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#288]) +32 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - shard-adlp:         NOTRUN -> [FAIL][145] ([Intel XE#1068])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@xe_exec_reset@cm-gt-reset.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-adlp:         [PASS][146] -> [INCOMPLETE][147] ([Intel XE#1195])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1192] / [Intel XE#1201])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_module_load@load:
>     - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#1201] / [Intel XE#378])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@xe_module_load@load.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1201] / [Intel XE#1337])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1201] / [Intel XE#979])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#1061] / [Intel XE#1201])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3-mmap-vram:
>     - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#1008] / [Intel XE#1201])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@xe_pm@d3-mmap-vram.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1201] / [Intel XE#366])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s2idle-vm-bind-userptr:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][155] ([Intel XE#1214] / [Intel XE#1608]) +2 other tests dmesg-warn
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-userptr.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][156] ([Intel XE#1191] / [Intel XE#1214]) +7 other tests dmesg-warn
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][157] ([Intel XE#1214]) +2 other tests dmesg-warn
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-adlp:         [PASS][158] -> [DMESG-WARN][159] ([Intel XE#1191] / [Intel XE#1214])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [PASS][160] -> [FAIL][161] ([Intel XE#958])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#1201] / [Intel XE#944]) +6 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#1201] / [Intel XE#944])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-query.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][164] ([Intel XE#1214] / [Intel XE#1760])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@xe_wedged@basic-wedged.html
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][165] ([Intel XE#1214] / [Intel XE#1760])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@xe_wedged@basic-wedged.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][166] ([Intel XE#1760])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][168] +3 other tests pass
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - {shard-lnl}:        [INCOMPLETE][169] ([Intel XE#1330] / [Intel XE#1602] / [Intel XE#1760]) -> [PASS][170]
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - {shard-lnl}:        [INCOMPLETE][171] ([Intel XE#1602] / [Intel XE#1760]) -> [PASS][172]
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201]) -> [PASS][174] +13 other tests pass
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-64x64.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][175] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][176] +4 other tests pass
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-a.html
> 
>   * igt@kms_cursor_legacy@torture-move:
>     - shard-dg2-set2:     [DMESG-WARN][177] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [PASS][178]
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_cursor_legacy@torture-move.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@kms_cursor_legacy@torture-move.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][179] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][180]
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-wc:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#1234]) -> [PASS][182]
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_draw_crc@draw-method-mmap-wc.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-436/igt@kms_draw_crc@draw-method-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
>     - shard-adlp:         [ABORT][183] -> [PASS][184]
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [ABORT][185] -> [PASS][186] +3 other tests pass
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render:
>     - {shard-lnl}:        [SKIP][187] ([Intel XE#1134]) -> [PASS][188] +1 other test pass
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-render.html
> 
>   * igt@kms_invalid_mode@bad-vtotal:
>     - {shard-lnl}:        [SKIP][189] ([Intel XE#1733]) -> [PASS][190]
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@kms_invalid_mode@bad-vtotal.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-3/igt@kms_invalid_mode@bad-vtotal.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         [FAIL][191] ([Intel XE#1874]) -> [PASS][192] +3 other tests pass
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-adlp:         [SKIP][193] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][194] +1 other test pass
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@kms_pm_rpm@dpms-lpsp.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][195] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][196]
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_evict@evict-threads-large.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_atomic@basic-inc-all:
>     - {shard-lnl}:        [SKIP][197] ([Intel XE#1699]) -> [PASS][198] +13 other tests pass
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@xe_exec_atomic@basic-inc-all.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-1/igt@xe_exec_atomic@basic-inc-all.html
> 
>   * igt@xe_exec_threads@threads-userptr:
>     - {shard-lnl}:        [ABORT][199] -> [PASS][200] +3 other tests pass
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-4/igt@xe_exec_threads@threads-userptr.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-3/igt@xe_exec_threads@threads-userptr.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][202]
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - {shard-lnl}:        [SKIP][203] ([Intel XE#1192]) -> [PASS][204]
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@xe_live_ktest@xe_migrate.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-adlp:         [DMESG-WARN][205] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@xe_pm@s2idle-basic.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-dg2-set2:     [ABORT][207] ([Intel XE#1694]) -> [PASS][208]
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-adlp:         [DMESG-WARN][209] ([Intel XE#1214]) -> [PASS][210] +1 other test pass
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@xe_pm@s3-vm-bind-prefetch.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     [DMESG-WARN][211] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][212] +1 other test pass
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_vm@large-userptr-split-binds-33554432:
>     - {shard-lnl}:        [SKIP][213] ([Intel XE#1130] / [Intel XE#1699]) -> [PASS][214] +1 other test pass
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-lnl-3/igt@xe_vm@large-userptr-split-binds-33554432.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-lnl-3/igt@xe_vm@large-userptr-split-binds-33554432.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-adlp:         [INCOMPLETE][215] ([Intel XE#1195] / [Intel XE#1667]) -> [DMESG-WARN][216] ([Intel XE#1214] / [Intel XE#1667])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-1/igt@core_hotunplug@hotrebind-lateclose.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_async_flips@crc:
>     - shard-dg2-set2:     [ABORT][217] -> [INCOMPLETE][218] ([Intel XE#1195])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_async_flips@crc.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_async_flips@crc.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#455])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][222] ([Intel XE#316]) +2 other tests skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][223] ([Intel XE#1231]) -> [DMESG-FAIL][224] ([Intel XE#324])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][225] ([Intel XE#1231]) -> [FAIL][226] ([Intel XE#1242]) +1 other test fail
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#1124]) -> [SKIP][228] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][230] ([Intel XE#1124]) +4 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][232] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][234] ([Intel XE#346])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_big_joiner@basic.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#367]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#367])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][238] ([Intel XE#367]) +2 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#787]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][242] ([Intel XE#1201] / [Intel XE#829])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][246] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][248] ([Intel XE#787]) +34 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][252] ([Intel XE#373]) +4 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#373])
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_chamelium_hpd@dp-hpd-storm.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#373]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201]) -> [SKIP][258] ([Intel XE#373])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-dpms:
>     - shard-dg2-set2:     [ABORT][259] -> [DMESG-WARN][260] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_cursor_crc@cursor-dpms.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_cursor_crc@cursor-dpms.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#308]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][263] ([Intel XE#1195]) -> [DMESG-WARN][264] ([Intel XE#1191] / [Intel XE#1214])
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-9/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom:
>     - shard-dg2-set2:     [DMESG-WARN][265] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][266] ([Intel XE#282]) +2 other tests dmesg-warn
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-436/igt@kms_cursor_edge_walk@256x256-top-bottom.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][267] ([Intel XE#282]) -> [DMESG-WARN][268] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@forked-bo@all-pipes:
>     - shard-dg2-set2:     [DMESG-WARN][269] ([Intel XE#282]) -> [DMESG-WARN][270] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@all-pipes.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][272] ([Intel XE#1201])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [i915#3804]) -> [SKIP][274] ([i915#3804])
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race:
>     - shard-adlp:         [ABORT][275] -> [SKIP][276] ([Intel XE#1201] / [Intel XE#310])
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-8/igt@kms_flip@2x-dpms-vs-vblank-race.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [DMESG-WARN][277] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][278] ([Intel XE#1195] / [Intel XE#927])
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][279] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][280] ([Intel XE#1195])
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][281] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][282] ([Intel XE#1162]) +1 other test dmesg-warn
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][284] ([Intel XE#455]) +7 other tests skip
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#1234])
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][288] ([Intel XE#651]) +15 other tests skip
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-adlp:         [INCOMPLETE][289] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][290] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][291] ([Intel XE#651]) -> [SKIP][292] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     [SKIP][293] ([Intel XE#1201]) -> [SKIP][294] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][296] ([Intel XE#653]) +13 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201]) -> [SKIP][298] ([Intel XE#653]) +1 other test skip
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][299] ([Intel XE#653]) -> [SKIP][300] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-dg2-set2:     [SKIP][301] ([Intel XE#1201]) -> [SKIP][302] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-suspend.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][303] ([Intel XE#616]) -> [DMESG-FAIL][304] ([Intel XE#1811]) +1 other test dmesg-fail
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-adlp:         [FAIL][305] ([Intel XE#361]) -> [SKIP][306] ([Intel XE#1201] / [Intel XE#455])
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-2/igt@kms_plane_scaling@intel-max-src-size.html
>     - shard-dg2-set2:     [FAIL][307] ([Intel XE#361]) -> [SKIP][308] ([Intel XE#1201] / [Intel XE#455])
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
>     - shard-dg2-set2:     [INCOMPLETE][309] ([Intel XE#1195] / [Intel XE#909]) -> [TIMEOUT][310] ([Intel XE#295] / [Intel XE#380] / [Intel XE#909])
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][311] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909]) -> [TIMEOUT][312] ([Intel XE#904] / [Intel XE#909])
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][313] ([Intel XE#1201]) -> [SKIP][314] ([Intel XE#305] / [Intel XE#455])
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][315] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][316] ([Intel XE#305] / [Intel XE#455])
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][317] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][318] ([Intel XE#305]) +2 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][319] ([Intel XE#870]) -> [SKIP][320] ([Intel XE#1201] / [Intel XE#870])
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     [SKIP][321] ([Intel XE#1201]) -> [SKIP][322] ([Intel XE#870])
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_pm_backlight@basic-brightness.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][323] ([Intel XE#908]) -> [SKIP][324] ([Intel XE#1201] / [Intel XE#908])
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         [SKIP][325] ([Intel XE#1201] / [Intel XE#734]) -> [FAIL][326] ([Intel XE#1204])
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][327] ([Intel XE#1201]) -> [SKIP][328] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-move.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-464/igt@kms_psr@fbc-pr-sprite-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-dg2-set2:     [SKIP][329] ([Intel XE#929]) -> [SKIP][330] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][331] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][332] ([Intel XE#929]) +8 other tests skip
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][334] ([Intel XE#327])
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][335] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][336] ([Intel XE#1127])
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][337] ([Intel XE#327]) -> [SKIP][338] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-adlp:         [INCOMPLETE][339] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][340] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][341] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][342] ([Intel XE#1191] / [Intel XE#1214])
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-dg2-set2:     [SKIP][343] ([Intel XE#455]) -> [SKIP][344] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_vrr@seamless-rr-switch-vrr.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][345] ([Intel XE#1201]) -> [SKIP][346] ([Intel XE#756])
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-464/igt@kms_writeback@writeback-check-output.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][347] ([Intel XE#756]) -> [SKIP][348] ([Intel XE#1201] / [Intel XE#756])
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-set2:     [SKIP][349] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][350] ([Intel XE#1091])
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-435/igt@sriov_basic@bind-unbind-vf.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][351] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][352] ([Intel XE#1195] / [Intel XE#1473])
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][353] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][354] ([Intel XE#288]) +13 other tests skip
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     [SKIP][355] ([Intel XE#288]) -> [SKIP][356] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][357] ([Intel XE#366]) -> [SKIP][358] ([Intel XE#1201] / [Intel XE#366])
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [DMESG-WARN][359] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][360] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-adlp:         [INCOMPLETE][361] ([Intel XE#1195] / [Intel XE#1694]) -> [DMESG-WARN][362] ([Intel XE#1214] / [Intel XE#1608])
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][363] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][364] ([Intel XE#366]) +1 other test skip
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     [SKIP][365] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][366] ([Intel XE#944]) +1 other test skip
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-463/igt@xe_query@multigpu-query-engines.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>     - shard-dg2-set2:     [SKIP][367] ([Intel XE#944]) -> [SKIP][368] ([Intel XE#1201] / [Intel XE#944])
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
>   [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
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
>   [Intel XE#1444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1444
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
>   [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
>   [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
>   [Intel XE#1699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1699
>   [Intel XE#1713]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1713
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1733
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>   [Intel XE#1811]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1811
>   [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
>   [Intel XE#1850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1850
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1899
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#295]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/295
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
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
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
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7865 -> IGT_7866
>   * Linux: xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad -> xe-pw-133880v1
> 
>   IGT_7865: 3578243d16f1ea5055f7baa0b1fe7f520538c4ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7866: 2b7701838c3ebaa3c717b6521cafafe3b9ae4a4f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1317-39e2349c88dab7b39cf2c9549783e9b1e03311ad: 39e2349c88dab7b39cf2c9549783e9b1e03311ad
>   xe-pw-133880v1: 133880v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133880v1/index.html
> 
