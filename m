Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C629AC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 07:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3D010E3DA;
	Fri, 24 May 2024 07:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cs5HyQAy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4767610E3DA;
 Fri, 24 May 2024 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716537058; x=1748073058;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KBLW5x02gxcpVSAnhDNzs6Vko2UOWHqZ9DJ4uVxIxZE=;
 b=Cs5HyQAyyjpwCr1wC4raW5kGaX5o6rGGHrGSOldcs0E5vlrpFCyXYAA6
 mAWQ2iMsUmeJFwl86K+p8t7KzOwQsf0NWCZAzWGeQfcpulmcjqv0en69L
 tBOw62ER4cFN8E0UXg0hk+e2RpQNJMoQ6Q213ciJJq+P2yndeEaW0vykc
 Dqiu2VBpqBSapdsRY5AsgWzEIGu92+XfQk6fbbUDYcW5pbru10kFu1i6h
 A16tm8v2FwUpDFUhV1/TgCeGiLUPDDt8gqCLiCNX3+y5n0rPLkf8aJt14
 W55Bu11cD3kajFds526rWvPh9kD7Yd16F9kLkmJpypCMlJvIalRPuyaof Q==;
X-CSE-ConnectionGUID: 9fz5OriRTgyR9a7gDnXazQ==
X-CSE-MsgGUID: +l1r09a7QSOqzgQOYvZVAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="15845736"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="15845736"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 00:50:57 -0700
X-CSE-ConnectionGUID: 9e7h8AYjSRK9HdvZvVTnSg==
X-CSE-MsgGUID: D42Y8OvDR8iejL5/rZDbRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="33953424"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 24 May 2024 00:50:51 -0700
Received: from [10.246.49.231] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.49.231])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 89F462FAE;
 Fri, 24 May 2024 08:50:50 +0100 (IST)
Message-ID: <9c6e0690-c8bd-4b7a-8e54-ad6feeb2fbfd@intel.com>
Date: Fri, 24 May 2024 09:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_VF=3A_Use_the_ru?=
 =?UTF-8?Q?ntime_registers_=28rev2=29?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
 <171651662185.2170280.13793749888936481040@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171651662185.2170280.13793749888936481040@8e613ede5ea5>
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



On 24.05.2024 04:10, Patchwork wrote:
> == Series Details ==
> 
> Series: VF: Use the runtime registers (rev2)
> URL   : https://patchwork.freedesktop.org/series/133989/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09_full -> xe-pw-133989v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-133989v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-133989v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 

unrelated

series is for driver running in SR-IOV VF mode (that is not enabled yet)

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
>   Here are the unknown changes that may have been introduced in xe-pw-133989v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1:
>     - shard-adlp:         [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-6/igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-2/igt@kms_flip@nonexisting-fb-interruptible@a-hdmi-a1.html

This test caused an abort condition: Lockdep not active

<3> [514.816806]
=============================================================================
<3> [514.817292] BUG kmalloc-1k (Tainted: G     U  W         ): Poison
overwritten
<3> [514.817295]
-----------------------------------------------------------------------------
<3> [514.817297] 0xffff88817f8935e8-0xffff88817f8935ea @offset=13800.
First byte 0x33 instead of 0x6b
<3> [514.817300] Allocated in xe_file_open+0x2c/0x140 [xe] age=3368
cpu=2 pid=1547
<4> [514.817367]  kmalloc_trace+0x389/0x3c0
<4> [514.817371]  xe_file_open+0x2c/0x140 [xe]
<4> [514.817404]  drm_file_alloc+0x1d6/0x2b0 [drm]
<4> [514.817434]  drm_open_helper+0x7f/0x160 [drm]
<4> [514.817456]  drm_open+0x74/0x120 [drm]
<4> [514.817478]  drm_stub_open+0xb0/0x120 [drm]
<4> [514.817498]  chrdev_open+0xab/0x1f0
<4> [514.817501]  do_dentry_open+0x17b/0x580
<4> [514.817503]  vfs_open+0x33/0x40
<4> [514.817505]  path_openat+0x6e1/0xa70
<4> [514.817507]  do_filp_open+0xb0/0x120
<4> [514.817510]  do_sys_openat2+0x250/0x2a0
<4> [514.817511]  do_sys_open+0x46/0x80
<4> [514.817513]  __x64_sys_openat+0x20/0x30
<4> [514.817515]  x64_sys_call+0x1b0c/0x20c0
<4> [514.817518]  do_syscall_64+0x88/0x140
<3> [514.817520] Freed in xe_file_close+0x19a/0x1e0 [xe] age=3094 cpu=5
pid=1547
<4> [514.817555]  kfree+0x2aa/0x320
<4> [514.817558]  xe_file_close+0x19a/0x1e0 [xe]
<4> [514.817589]  drm_file_free+0x21a/0x290 [drm]
<4> [514.817611]  drm_close_helper.isra.0+0x73/0x80 [drm]
<4> [514.817632]  drm_release_noglobal+0x25/0x80 [drm]

but that was already seen elsewhere

> 
>   * igt@kms_flip@plain-flip-fb-recreate@a-dp4:
>     - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate@a-dp4.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_flip@plain-flip-fb-recreate@a-dp4.html

same here

> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2-set2:     [FAIL][5] ([Intel XE#1188]) -> [INCOMPLETE][6] +1 other test incomplete
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@kms_content_protection@uevent.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_content_protection@uevent.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_plane@plane-panning-top-left@pipe-b:
>     - {shard-lnl}:        NOTRUN -> [ABORT][7] +1 other test abort
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-lnl-3/igt@kms_plane@plane-panning-top-left@pipe-b.html
> 
>   * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1:
>     - {shard-lnl}:        [PASS][8] -> [ABORT][9] +4 other tests abort
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-lnl-8/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-lnl-6/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - {shard-lnl}:        NOTRUN -> [SKIP][10]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-lnl-2/igt@xe_pm@d3cold-mmap-vram.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-133989v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#367])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#367])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#1252])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#306])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-463/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#306])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#307])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#308])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_edge_walk@128x128-right-edge:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#581])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-right-edge.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#309])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][28] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>     - shard-dg2-set2:     [PASS][29] -> [DMESG-WARN][30] ([Intel XE#282])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@forked-bo@all-pipes:
>     - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-434/igt@kms_cursor_legacy@forked-bo@all-pipes.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1135] / [Intel XE#1201])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-463/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-dg2-set2:     [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1195]) +1 other test incomplete
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-436/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@b-dp4:
>     - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1214])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@kms_flip@plain-flip-fb-recreate@b-dp4.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_flip@plain-flip-fb-recreate@b-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201]) +31 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#656]) +9 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#417])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#417])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#829]) +5 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@kms_plane_lowres@tiling-x:
>     - shard-adlp:         NOTRUN -> [FAIL][49] ([Intel XE#1874]) +2 other tests fail
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@kms_plane_lowres@tiling-x.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#734])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - shard-adlp:         [PASS][53] -> [FAIL][54] ([Intel XE#1203])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-4/igt@kms_pm_rpm@basic-rte.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html
> 
>   * igt@kms_prop_blob@blob-prop-validate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#780])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_prop_blob@blob-prop-validate.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-pr-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@kms_psr@fbc-pr-sprite-blt.html
> 
>   * igt@kms_psr@psr2-primary-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-435/igt@kms_psr@psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#327])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         NOTRUN -> [FAIL][60] ([Intel XE#771] / [Intel XE#899])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][61] ([Intel XE#899])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@xe_ccs@block-copy-compressed:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@xe_ccs@block-copy-compressed.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1126] / [Intel XE#1201])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][64] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@xe_evict@evict-cm-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][66] ([Intel XE#1473] / [Intel XE#392])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#688])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-435/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_module_load@unload:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][71] ([Intel XE#1162] / [Intel XE#1214])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@xe_module_load@unload.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-adlp:         [PASS][72] -> [INCOMPLETE][73] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][74] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][75] ([Intel XE#1195] / [Intel XE#1358])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [PASS][76] -> [DMESG-WARN][77] ([Intel XE#1214]) +1 other test dmesg-warn
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#944])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-433/igt@xe_query@multigpu-query-invalid-query.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#944])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
>     - shard-adlp:         [DMESG-WARN][80] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [ABORT][82] -> [PASS][83] +5 other tests pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][84] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][86] ([Intel XE#282]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-dg2-set2:     [DMESG-WARN][88] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][89] +5 other tests pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - {shard-lnl}:        [DMESG-WARN][90] ([Intel XE#1830]) -> [PASS][91] +2 other tests pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-dg2-set2:     [INCOMPLETE][92] ([Intel XE#1195]) -> [PASS][93] +1 other test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-434/igt@kms_flip@blocking-wf_vblank.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-463/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render:
>     - {shard-lnl}:        [ABORT][94] -> [PASS][95] +3 other tests pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-render.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][96] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-466/igt@xe_evict@evict-threads-large.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-434/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
>     - {shard-lnl}:        [ABORT][98] ([Intel XE#1908]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-lnl-1/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-lnl-3/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind:
>     - shard-adlp:         [INCOMPLETE][100] ([Intel XE#1195]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-9/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@xe_exec_basic@many-execqueues-many-vm-null-defer-bind.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
>     - shard-adlp:         [ABORT][102] ([Intel XE#1908]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
> 
>   * igt@xe_exec_threads@threads-cm-basic:
>     - shard-adlp:         [ABORT][104] -> [PASS][105] +1 other test pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-8/igt@xe_exec_threads@threads-cm-basic.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@xe_exec_threads@threads-cm-basic.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - shard-dg2-set2:     [FAIL][106] ([Intel XE#1045] / [Intel XE#1204]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-463/igt@xe_gt_freq@freq_low_max.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [DMESG-WARN][108] ([Intel XE#1214]) -> [PASS][109] +1 other test pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][110] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][111] ([Intel XE#1033] / [Intel XE#1214])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][113] ([Intel XE#316]) +2 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#1124]) -> [SKIP][115] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][117] ([Intel XE#1124]) +3 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][119] ([Intel XE#367]) +1 other test skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#787]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [ABORT][124] -> [INCOMPLETE][125] ([Intel XE#1195])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][127] ([Intel XE#787]) +27 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][129] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#306]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_chamelium_color@ctm-0-75.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#373]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#307]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#307])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-max-size:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][137] ([Intel XE#455]) +3 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-max-size.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom:
>     - shard-dg2-set2:     [DMESG-WARN][138] ([Intel XE#282]) -> [DMESG-WARN][139] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-top-bottom.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#455] / [Intel XE#929]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#1927]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#1927])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         [DMESG-WARN][144] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][145] ([Intel XE#1195] / [Intel XE#927])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-2/igt@kms_fbcon_fbt@fbc-suspend.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#776]) -> [SKIP][147] ([Intel XE#1201] / [Intel XE#776])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][149] ([Intel XE#1138])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@kms_feature_discovery@display-4x.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][150] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][151] ([Intel XE#1162]) +2 other tests dmesg-warn
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-WARN][152] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][153] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][154] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][155] ([Intel XE#1214] / [Intel XE#1608]) +1 other test dmesg-warn
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][156] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][157] ([Intel XE#1214] / [Intel XE#1608])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#455]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#651]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-adlp:         [DMESG-WARN][162] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][163] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#658]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#658])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][167] ([Intel XE#651]) +11 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-adlp:         [SKIP][168] ([Intel XE#1201]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#1210]) +2 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#653]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][173] ([Intel XE#653]) +8 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][175] ([Intel XE#305] / [Intel XE#455]) +2 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +2 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#305]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][181] ([Intel XE#305]) +5 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#908]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#908])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-adlp:         [SKIP][184] ([Intel XE#1201] / [Intel XE#836]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#1211])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#929]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][189] ([Intel XE#929]) +4 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#327]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#327])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][193] ([Intel XE#327])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#362])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#330]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#330])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1091]) -> [SKIP][199] ([Intel XE#1091] / [Intel XE#1201]) +1 other test skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][201] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-imm:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][205] ([Intel XE#288]) +8 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-imm.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#288]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][209] ([Intel XE#512])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-464/igt@xe_mmap@small-bar.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-432/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#979]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#979])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-adlp:         [INCOMPLETE][212] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358]) -> [ABORT][213] ([Intel XE#1191] / [Intel XE#1358])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-1/igt@xe_pm@s3-basic-exec.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-4/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-adlp:         [DMESG-WARN][214] ([Intel XE#1214]) -> [INCOMPLETE][215] ([Intel XE#1195])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-4/igt@xe_pm@s3-mocs.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#944]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#944])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-dg2-466/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [DMESG-WARN][218] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760]) -> [DMESG-WARN][219] ([Intel XE#1214] / [Intel XE#1760])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09/shard-adlp-9/igt@xe_wedged@wedged-at-any-timeout.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>   [Intel XE#1927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1927
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09 -> xe-pw-133989v2
> 
>   IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1338-1385623a20ad940dab90bfaa4bc01fe599506e09: 1385623a20ad940dab90bfaa4bc01fe599506e09
>   xe-pw-133989v2: 133989v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133989v2/index.html
> 
