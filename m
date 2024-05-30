Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F801C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 21:45:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158DB1129E1;
	Thu, 30 May 2024 21:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBxy79t4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90D1112984;
 Thu, 30 May 2024 21:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717105542; x=1748641542;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8gRcMpIon/m+Rsp1qD6rIuNGi6cZy/DmUCGmqt1xqkA=;
 b=QBxy79t4BMzS47nSUZ+9rp/eOJdcc2OdQaHvwx5BClvWL7QhSr8WuSMU
 BGCt1+w2nLmkUiW2X37FZdUXnL99jE/ODkpE4TfopamecH+7M2TebwNAv
 vE2rzN3u8pzcmHGimC3ABR6juk6SPiBNxKrxl4bDNzgRsuN+gJZji6fXw
 sMO/M484Zgc/Vg4VXscMeXWMHz+g2ZQxWQC26LGn7AadFGj3/E+VRCFue
 ep0Ywu31IkoAC+EIpslTCc8JqNJ3zxPmWKoSLbNJPq2khSv7g1xf1A/at
 3kuPK+Me4yi22og9gOReiNLeN08nMT3NVZw/z6k0PFiz0kEqu7UcBcatA g==;
X-CSE-ConnectionGUID: RZl1diYxTne8errRR/p97Q==
X-CSE-MsgGUID: sM4bYpnpSV2DBxlnSl6HTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24187660"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="24187660"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 14:45:42 -0700
X-CSE-ConnectionGUID: VIoTkVnzQ9OurRbHtw+Etg==
X-CSE-MsgGUID: mKUbN33aSSmw4KEvk2oupQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="35992985"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 30 May 2024 14:45:34 -0700
Received: from [10.246.25.139] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9D22D28779;
 Thu, 30 May 2024 22:45:29 +0100 (IST)
Message-ID: <e624012e-ac2e-46f5-af23-d06412d96f76@intel.com>
Date: Thu, 30 May 2024 23:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_VF=3A_Setup_VRAM?=
 =?UTF-8?Q?_based_on_received_config_data_=28rev2=29?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240530133527.1328-1-michal.wajdeczko@intel.com>
 <171708889807.2239183.3665040602385539526@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171708889807.2239183.3665040602385539526@8e613ede5ea5>
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



On 30.05.2024 19:08, Patchwork wrote:
> == Series Details ==
> 
> Series: VF: Setup VRAM based on received config data (rev2)
> URL   : https://patchwork.freedesktop.org/series/134097/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468_full -> xe-pw-134097v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134097v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134097v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-134097v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated to this series

> 
>   * igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-6-pipe-d-dp-4:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-6-pipe-d-dp-4.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-433/igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-6-pipe-d-dp-4.html
> 

This test caused an abort condition: Lockdep not active

<7>[  344.244609] [IGT] kms_display_modes: starting dynamic subtest
pipe-A-DP-4-pipe-B-HDMI-A-6
<7>[  344.246586] xe 0000:03:00.0: [drm:drm_mode_addfb2 [drm]] [FB:300]
<7>[  344.257146] xe 0000:03:00.0: [drm:drm_mode_addfb2 [drm]] [FB:301]
<4>[  344.260794] ------------[ cut here ]------------
<4>[  344.260799] DEBUG_LOCKS_WARN_ON(debug_atomic_read(nr_unused_locks)
!= nr_unused)
<4>[  344.260804] WARNING: CPU: 16 PID: 934 at
kernel/locking/lockdep_proc.c:283 lockdep_stats_show+0xb99/0xe30
<4>[  344.260872] RIP: 0010:lockdep_stats_show+0xb99/0xe30
<4>[  344.260897] Call Trace:
<4>[  344.260899]  <TASK>
<4>[  344.260901]  ? show_regs+0x67/0x70
<4>[  344.260904]  ? __warn+0x94/0x1b0
<4>[  344.260908]  ? lockdep_stats_show+0xb99/0xe30
<4>[  344.260911]  ? report_bug+0x1b7/0x1d0
<4>[  344.260914]  ? irq_work_queue+0x10/0x50
<4>[  344.260918]  ? handle_bug+0x46/0x80
<4>[  344.260921]  ? exc_invalid_op+0x19/0x70
<4>[  344.260924]  ? asm_exc_invalid_op+0x1b/0x20
<4>[  344.260928]  ? lockdep_stats_show+0xb99/0xe30
<4>[  344.260931]  ? lockdep_stats_show+0xb99/0xe30
<4>[  344.260933]  ? __kmalloc_node_noprof+0x3e0/0x5a0
<4>[  344.260937]  seq_read_iter+0x129/0x490
<4>[  344.260941]  proc_reg_read_iter+0x62/0x90


>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [INCOMPLETE][3] ([Intel XE#1195]) -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - {shard-lnl}:        [FAIL][5] ([Intel XE#1430]) -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_vblank@query-busy-hang:
>     - {shard-lnl}:        [PASS][7] -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-lnl-6/igt@kms_vblank@query-busy-hang.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-lnl-2/igt@kms_vblank@query-busy-hang.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134097v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][9] -> [FAIL][10] ([Intel XE#827]) +1 other test fail
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#619])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#607])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316]) +9 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][14] ([Intel XE#1204])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201]) +13 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +41 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1152] / [Intel XE#1201] / [Intel XE#455])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1152] / [Intel XE#1201]) +2 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#373]) +14 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#307])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#455]) +28 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1195]) +2 other tests incomplete
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-hdmi-a-6.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-256x256@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][28] ([Intel XE#1195]) +1 other test incomplete
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [PASS][29] -> [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#323]) +2 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#309]) +8 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-dg2-set2:     [PASS][33] -> [ABORT][34] ([Intel XE#1553])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_display_modes@extended-mode-basic.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-433/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_display_modes@extended-mode-basic@pipe-a-dp-4-pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#1214] / [Intel XE#1553])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_display_modes@extended-mode-basic@pipe-a-dp-4-pipe-b-hdmi-a-6.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-433/igt@kms_display_modes@extended-mode-basic@pipe-a-dp-4-pipe-b-hdmi-a-6.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1138] / [Intel XE#1201])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1135] / [Intel XE#1201])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#310]) +6 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][40] ([Intel XE#1195] / [Intel XE#927]) +1 other test incomplete
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][41] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +3 other tests dmesg-warn
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][42] ([Intel XE#1214] / [Intel XE#1608]) +5 other tests dmesg-warn
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][43] ([Intel XE#324]) +2 other tests dmesg-fail
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][44] ([Intel XE#1861]) +1 other test fail
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#651]) +23 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#656]) +56 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#1341])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#356])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane@pixel-format-source-clamping@pipe-a:
>     - shard-adlp:         NOTRUN -> [FAIL][50] ([Intel XE#1331] / [Intel XE#1978]) +2 other tests fail
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#305]) +11 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +7 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#870])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1122] / [Intel XE#1201]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#836]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#1211])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-dg2-set2:     [PASS][57] -> [DMESG-WARN][58] ([Intel XE#1162] / [Intel XE#1214])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@kms_pm_rpm@system-suspend-modeset.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201]) +6 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#929]) +24 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-1/igt@kms_psr@fbc-psr-suspend.html
> 
>   * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][61] ([Intel XE#294]) +1 other test fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#327]) +3 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-adlp:         NOTRUN -> [FAIL][63] ([Intel XE#1874]) +12 other tests fail
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1127] / [Intel XE#1201])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-adlp:         NOTRUN -> [FAIL][65] ([Intel XE#1174])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#330])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#1932])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1126] / [Intel XE#1201])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_evict@evict-large-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#261]) +10 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@xe_evict@evict-large-cm.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][72] -> [TIMEOUT][73] ([Intel XE#1473] / [Intel XE#392])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#1392]) +14 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#288]) +38 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue.html
> 
>   * igt@xe_exec_reset@cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][77] ([Intel XE#1214] / [Intel XE#1638] / [Intel XE#358])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@xe_exec_reset@cat-error.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][78] ([Intel XE#1214] / [Intel XE#1975])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_mmap@vram:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1008] / [Intel XE#1201])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@xe_mmap@vram.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#379])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#979]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1061] / [Intel XE#1201])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-9/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][84] ([Intel XE#1191] / [Intel XE#1214]) +3 other tests dmesg-warn
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][85] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-1/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][86] ([Intel XE#1214])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - {shard-lnl}:        [FAIL][88] ([Intel XE#1659]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][90] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][91] +6 other tests pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][92] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][93] +1 other test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - {shard-lnl}:        [DMESG-WARN][94] ([Intel XE#1830]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][96] ([Intel XE#361]) -> [PASS][97] +1 other test pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][98] ([Intel XE#771] / [Intel XE#899]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][100] ([Intel XE#899]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - {shard-lnl}:        [FAIL][102] ([Intel XE#899]) -> [PASS][103] +1 other test pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][104] ([Intel XE#1761]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-lnl-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
> 
>   * igt@xe_exec_reset@cm-close-fd:
>     - {shard-lnl}:        [DMESG-WARN][106] ([Intel XE#1330]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-lnl-2/igt@xe_exec_reset@cm-close-fd.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-lnl-5/igt@xe_exec_reset@cm-close-fd.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-basic:
>     - shard-dg2-set2:     [FAIL][108] ([Intel XE#1256]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-basic.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-basic.html
> 
>   * igt@xe_gt_freq@freq_reset:
>     - shard-adlp:         [DMESG-WARN][110] ([Intel XE#1214]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-adlp-2/igt@xe_gt_freq@freq_reset.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-8/igt@xe_gt_freq@freq_reset.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - {shard-lnl}:        [DMESG-WARN][112] ([Intel XE#1620]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [ABORT][114] ([Intel XE#1358]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-6/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-mocs:
>     - {shard-lnl}:        [ABORT][116] ([Intel XE#1794]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-lnl-2/igt@xe_pm@s4-mocs.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-lnl-4/igt@xe_pm@s4-mocs.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#623]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#623])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#873]) -> [SKIP][121] ([Intel XE#873])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@kms_async_flips@invalid-async-flip.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#316]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][125] ([Intel XE#316]) +4 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][126] ([Intel XE#607]) -> [SKIP][127] ([Intel XE#1201] / [Intel XE#607])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][129] ([Intel XE#1124]) +9 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][131] ([Intel XE#607])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#1124]) -> [SKIP][133] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][135] ([Intel XE#367]) +3 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][137] ([Intel XE#787]) +69 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#787]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#787]) +90 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +25 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][143] ([Intel XE#1252])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][145] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][147] ([Intel XE#314]) +3 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][149] ([Intel XE#306]) +2 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@kms_chamelium_color@gamma.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#373]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][153] ([Intel XE#373]) +8 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][155] ([Intel XE#307])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-dpms:
>     - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][157] ([Intel XE#282]) +7 other tests dmesg-warn
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@kms_cursor_crc@cursor-dpms.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#308]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#308])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#455]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][163] ([Intel XE#308])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][165] ([Intel XE#323]) +1 other test skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#323]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][168] ([Intel XE#282]) -> [DMESG-WARN][169] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][170] ([i915#3804]) -> [SKIP][171] ([Intel XE#1201] / [i915#3804])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         [DMESG-WARN][172] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][173] ([Intel XE#1195] / [Intel XE#927])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-adlp-6/igt@kms_fbcon_fbt@fbc-suspend.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-9/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][175] ([Intel XE#776])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@kms_fbcon_fbt@psr.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][177] ([Intel XE#703])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@kms_feature_discovery@display-3x.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#651]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][181] ([Intel XE#651]) +28 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][183] ([Intel XE#658]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#1158]) -> [SKIP][185] ([Intel XE#1158] / [Intel XE#1201])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#653]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][189] ([Intel XE#653]) +29 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-suspend.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][191] ([Intel XE#605])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#356]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#356])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     [DMESG-WARN][194] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][195] ([Intel XE#1162]) +1 other test dmesg-warn
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#305]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][201] ([Intel XE#870])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][203] ([Intel XE#1122])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][205] ([Intel XE#929]) +17 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#929]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][209] ([Intel XE#327])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#327]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#327])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][213] ([Intel XE#455]) +23 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@kms_vrr@flipline.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#756]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#756])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][217] ([Intel XE#1091]) +1 other test skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@sriov_basic@bind-unbind-vf.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1123]) -> [SKIP][221] ([Intel XE#1123] / [Intel XE#1201])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][223] ([Intel XE#1123])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][225] ([Intel XE#1126])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][226] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][227] ([Intel XE#1473] / [Intel XE#392])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][229] ([Intel XE#288]) +26 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#288]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][233] ([Intel XE#255])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][235] ([Intel XE#512])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-435/igt@xe_mmap@small-bar.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][237] ([Intel XE#979])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#366]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#366])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][241] ([Intel XE#366]) +1 other test skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-463/igt@xe_pm@d3cold-multiple-execs.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     [DMESG-WARN][242] ([Intel XE#1162] / [Intel XE#1551]) -> [DMESG-WARN][243] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1551])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [DMESG-WARN][244] ([Intel XE#1214]) -> [ABORT][245] ([Intel XE#1358] / [Intel XE#1794])
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][247] ([Intel XE#944]) +2 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-434/igt@xe_query@multigpu-query-config.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#944]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-dg2-set2:     [DMESG-WARN][250] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-WARN][251] ([Intel XE#1760])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468/shard-dg2-464/igt@xe_wedged@basic-wedged.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/shard-dg2-432/igt@xe_wedged@basic-wedged.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1331
>   [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
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
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#1975]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1975
>   [Intel XE#1978]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1978
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
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
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468 -> xe-pw-134097v2
> 
>   IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1376-2673d3bec539b78f4368d00e0bf66d1449d77468: 2673d3bec539b78f4368d00e0bf66d1449d77468
>   xe-pw-134097v2: 134097v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v2/index.html
> 
