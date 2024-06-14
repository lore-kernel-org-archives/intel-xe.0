Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0AAC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 09:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215B410E229;
	Fri, 14 Jun 2024 09:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDb6ihav";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC16E10E229;
 Fri, 14 Jun 2024 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718355645; x=1749891645;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=I6MEqSNfgOfkToLR53x49fCNDAGmpIJI2NGlqLlOhT4=;
 b=TDb6ihavL1ZIWWRHVoSBK90YUCX+/Sjhq0I6NtV1TNQBzWLbpVpMziFu
 bZ6DVEEygrn7gKxkdUaGohIckcoeT3iGkFOXci+seSM/g6kPRmVpeAOVq
 cVc4d1cc/XNvuOm/w9Z4XKbfL0m0MCNm6xktCdyXui0Yhp0lcbQNTMDi/
 6hxgMckzBumHOGYLAVZtsOD6YaaG9zcxzP8LFek4x+knQaJAliGjM225m
 OSzh5QTpwtM8QnyhzAsxy5DMt+Ui2zs/eDYeZyJ38WlQcPDkihH0/Wcxz
 EH7Hp2zaIwgZczr99ahXCsYGolYKRvInIskfZOqW7PzSw5f/Ve2G115Cr g==;
X-CSE-ConnectionGUID: ZrBm9NUASIeALDVpcxOD4w==
X-CSE-MsgGUID: pI73R62oT7ac1dxJrn8Orw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15358243"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15358243"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 02:00:45 -0700
X-CSE-ConnectionGUID: Z96sjK0NSSGPTu6WRxbW4Q==
X-CSE-MsgGUID: xowaDGlrRw6NaMzub0Xuxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="45354323"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 14 Jun 2024 02:00:41 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C926A27BCD;
 Fri, 14 Jun 2024 10:00:39 +0100 (IST)
Message-ID: <00847b8d-2a32-4890-a7eb-483fe2312eb7@intel.com>
Date: Fri, 14 Jun 2024 11:00:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/uc=3A_Fix?=
 =?UTF-8?Q?_and_start_using_xe=5Fuc=5Ffw=5Fsanitize=28=29?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240613153424.2120-1-michal.wajdeczko@intel.com>
 <171832093293.76316.13330043436187732434@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171832093293.76316.13330043436187732434@a6498e030952>
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



On 14.06.2024 01:22, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/uc: Fix and start using xe_uc_fw_sanitize()
> URL   : https://patchwork.freedesktop.org/series/134830/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3_full -> xe-pw-134830v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134830v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134830v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-134830v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated

> 
>   * igt@kms_sequence@get-busy@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_sequence@get-busy@pipe-c-hdmi-a-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-2/igt@kms_sequence@get-busy@pipe-c-hdmi-a-1.html

Dynamic subtest pipe-C-HDMI-A-1: SUCCESS (2.341s)

This test caused an abort condition: Lockdep not active


<4>[  109.579562] DEBUG_LOCKS_WARN_ON(debug_atomic_read(nr_unused_locks)
!= nr_unused)
<4>[  109.579567] WARNING: CPU: 2 PID: 888 at
kernel/locking/lockdep_proc.c:283 lockdep_stats_show+0xb99/0xe30
<4>[  109.579645] RIP: 0010:lockdep_stats_show+0xb99/0xe30
<4>[  109.579663] Call Trace:
<4>[  109.579664]  <TASK>
<4>[  109.579666]  ? show_regs+0x67/0x70
<4>[  109.579669]  ? __warn+0x94/0x1b0
<4>[  109.579672]  ? lockdep_stats_show+0xb99/0xe30
<4>[  109.579674]  ? report_bug+0x1b7/0x1d0
<4>[  109.579676]  ? irq_work_queue+0x10/0x50
<4>[  109.579680]  ? handle_bug+0x46/0x80
<4>[  109.579683]  ? exc_invalid_op+0x19/0x70
<4>[  109.579685]  ? asm_exc_invalid_op+0x1b/0x20
<4>[  109.579689]  ? lockdep_stats_show+0xb99/0xe30
<4>[  109.579691]  ? lockdep_stats_show+0xb99/0xe30
<4>[  109.579692]  ? __kmalloc_node_noprof+0x3e0/0x5a0
<4>[  109.579696]  seq_read_iter+0x129/0x490
<4>[  109.579699]  proc_reg_read_iter+0x62/0x90
<4>[  109.579703]  vfs_read+0x252/0x350
<4>[  109.579708]  ksys_read+0x6d/0xf0


> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - {shard-lnl}:        [PASS][3] -> [DMESG-WARN][4] +3 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134830v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1125] / [Intel XE#1201])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#787]) +14 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#306])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-463/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
>     - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#1874])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#656]) +6 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#734])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1127] / [Intel XE#1201])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_sequence@get-busy:
>     - shard-adlp:         [PASS][27] -> [ABORT][28] ([Intel XE#1553])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_sequence@get-busy.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-2/igt@kms_sequence@get-busy.html
> 
>   * igt@kms_sequence@get-busy@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][29] -> [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#1553])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_sequence@get-busy@pipe-d-hdmi-a-1.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-2/igt@kms_sequence@get-busy@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [PASS][31] -> [FAIL][32] ([Intel XE#771] / [Intel XE#899])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][33] -> [FAIL][34] ([Intel XE#899]) +1 other test fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#756])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1123] / [Intel XE#1201])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_evict@evict-cm-threads-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#261])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_evict@evict-cm-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][38] -> [TIMEOUT][39] ([Intel XE#1473] / [Intel XE#392])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-463/igt@xe_evict@evict-threads-large.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-433/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#688])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-rebind-imm.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [PASS][43] -> [FAIL][44] ([Intel XE#1414])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#378])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#979])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-dg2-set2:     [PASS][47] -> [INCOMPLETE][48] ([Intel XE#1195]) +2 other tests incomplete
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@xe_pm@d3hot-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][49] ([Intel XE#1214])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][50] -> [DMESG-WARN][51] ([Intel XE#1214])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][52] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][53] +5 other tests pass
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][54] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][55]
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - {shard-lnl}:        [FAIL][56] ([Intel XE#886]) -> [PASS][57] +1 other test pass
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][58] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-435/igt@kms_hdr@invalid-hdr.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_lease@page-flip-implicit-plane:
>     - shard-adlp:         [ABORT][60] ([Intel XE#1205] / [Intel XE#1553]) -> [PASS][61]
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_lease@page-flip-implicit-plane.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_lease@page-flip-implicit-plane.html
> 
>   * igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1:
>     - shard-adlp:         [ABORT][62] ([Intel XE#1205]) -> [PASS][63]
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_lease@page-flip-implicit-plane@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][64] ([Intel XE#1214] / [Intel XE#1553]) -> [PASS][65]
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_lease@page-flip-implicit-plane@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [FAIL][66] ([Intel XE#616]) -> [PASS][67] +1 other test pass
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-435/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
>     - shard-adlp:         [FAIL][68] ([Intel XE#1874]) -> [PASS][69] +4 other tests pass
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][70] ([Intel XE#361]) -> [PASS][71] +1 other test pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_rpm@drm-resources-equal:
>     - {shard-lnl}:        [FAIL][72] -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-3/igt@kms_pm_rpm@drm-resources-equal.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - {shard-lnl}:        [DMESG-WARN][74] ([Intel XE#2042]) -> [PASS][75]
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modeset.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-1/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms:
>     - shard-adlp:         [SKIP][76] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][77]
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_pm_rpm@universal-planes-dpms.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-4/igt@kms_pm_rpm@universal-planes-dpms.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - {shard-lnl}:        [DMESG-WARN][78] -> [PASS][79] +1 other test pass
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_psr@fbc-psr2-suspend.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@psr2-cursor-plane-onoff:
>     - {shard-lnl}:        [DMESG-WARN][80] ([Intel XE#1622]) -> [PASS][81] +3 other tests pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-3/igt@kms_psr@psr2-cursor-plane-onoff.html
> 
>   * igt@kms_vrr@flipline:
>     - {shard-lnl}:        [INCOMPLETE][82] -> [PASS][83] +1 other test pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-lnl-2/igt@kms_vrr@flipline.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-lnl-1/igt@kms_vrr@flipline.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][84] ([Intel XE#1473]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_basic@many-null-defer-bind:
>     - shard-dg2-set2:     [FAIL][86] -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-434/igt@xe_exec_basic@many-null-defer-bind.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-435/igt@xe_exec_basic@many-null-defer-bind.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - shard-dg2-set2:     [FAIL][88] ([Intel XE#1045] / [Intel XE#1204]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@xe_gt_freq@freq_low_max.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-434/igt@xe_gt_freq@freq_low_max.html
> 
>   * igt@xe_gt_freq@freq_reset:
>     - shard-adlp:         [DMESG-WARN][90] ([Intel XE#1214]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-1/igt@xe_gt_freq@freq_reset.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-6/igt@xe_gt_freq@freq_reset.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][92] ([Intel XE#1033] / [Intel XE#1214]) -> [INCOMPLETE][93] ([Intel XE#1033] / [Intel XE#1150] / [Intel XE#1195])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][94] ([Intel XE#1033] / [Intel XE#1214]) -> [INCOMPLETE][95] ([Intel XE#1033] / [Intel XE#1195])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][96] ([Intel XE#324]) -> [FAIL][97] ([Intel XE#1231])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][98] ([Intel XE#1231]) -> [DMESG-FAIL][99] ([Intel XE#324])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][100] ([Intel XE#1178]) -> [INCOMPLETE][101] ([Intel XE#1195]) +1 other test incomplete
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-435/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][102] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][103] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][104] ([Intel XE#1214] / [Intel XE#282]) -> [INCOMPLETE][105] ([Intel XE#1195]) +1 other test incomplete
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_cursor_legacy@torture-bo:
>     - shard-dg2-set2:     [DMESG-WARN][106] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [DMESG-WARN][107] ([Intel XE#1214] / [Intel XE#282])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-433/igt@kms_cursor_legacy@torture-bo.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][108] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][109] ([Intel XE#1214]) +2 other tests dmesg-warn
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][111] ([Intel XE#1729])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][112] ([Intel XE#1214]) -> [DMESG-WARN][113] ([Intel XE#1191] / [Intel XE#1214])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [DMESG-FAIL][114] ([Intel XE#482]) -> [TIMEOUT][115] ([Intel XE#1473] / [Intel XE#392])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [DMESG-WARN][116] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][117] ([Intel XE#1760])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
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
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
>   [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3 -> xe-pw-134830v1
> 
>   IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1458-da370b38472debe8f38360e3beb4483e13c3e7b3: da370b38472debe8f38360e3beb4483e13c3e7b3
>   xe-pw-134830v1: 134830v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134830v1/index.html
> 
