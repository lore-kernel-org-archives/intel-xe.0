Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BF9C2BA15
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 11:22:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E7F10EC48;
	Wed, 19 Jun 2024 11:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cg4u3u+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FE410E144;
 Wed, 19 Jun 2024 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718796173; x=1750332173;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=9JsA6xBqjLIr2cMMbdWVpL8Je+3Z/yvgizN4l/JM6t8=;
 b=cg4u3u+Aj1BwTdZWIwZ0eaT9SXN33acpfsiyXfmgQZUoRFnQVwiy13Tu
 FPJou37OKXLIvFGp7QMkGYF584kvGTtgOrxSloEXqnJ4vy3BShOmmjaTK
 Gxd57vRX3oL9wo6remHl/waeF9vzeiOtaF91uyGYQB7Sl9dU1m9omTBOw
 zhvVPWpPyj3A7aoHPQnzHbAvnf6/EdV6dJmWuH34pA4WGPyfPL4pUqFZ8
 6gaQHobssCc/4Ni2LU7ru7zEJSn6FX6QS2DyY4HICtcz3ZFPOZ5KdnB1U
 UWdkkOYFC0TbPjJrFaxq9m7JXwL06QGq/Ri56e1reYi6jj/Nh+6sZda8B w==;
X-CSE-ConnectionGUID: 7/A7GQC1TFqeYQLEoXOdXQ==
X-CSE-MsgGUID: Sepdu7HpR1Gt6/huHPNgxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27146677"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="27146677"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 04:22:53 -0700
X-CSE-ConnectionGUID: IUiIo0cPRESEN9aPIgBgHQ==
X-CSE-MsgGUID: fZoUB8BrRzqMkA0zyxndCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="41996535"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 19 Jun 2024 04:22:44 -0700
Received: from [10.245.119.62] (unknown [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BEEBF125B8;
 Wed, 19 Jun 2024 12:22:40 +0100 (IST)
Message-ID: <4b574e74-9ff5-4cd2-9e09-8cb21c100553@intel.com>
Date: Wed, 19 Jun 2024 13:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Use_tt?=
 =?UTF-8?Q?m=5Funcached_for_BO_with_NEEDS=5FUC_flag_=28rev2=29?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240618104947.729-1-michal.wajdeczko@intel.com>
 <171875079027.104452.10464386326577013893@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171875079027.104452.10464386326577013893@a6498e030952>
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



On 19.06.2024 00:46, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Use ttm_uncached for BO with NEEDS_UC flag (rev2)
> URL   : https://patchwork.freedesktop.org/series/134580/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165_full -> xe-pw-134580v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134580v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134580v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-134580v2_full:
> 
> ### IGT changes ###

unrelated (the NEEDS_UC flag is currently used only by the VFs)

> 
> #### Possible regressions ####
> 
>   * igt@xe_evict@evict-threads-small-multi-vm:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@xe_evict@evict-threads-small-multi-vm.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@xe_evict@evict-threads-small-multi-vm.html

<5> [423.743440] xe 0000:03:00.0: [drm] GT0: Timedout job:
seqno=4294967169, lrc_seqno=4294967169, guc_id=4142, flags=0x0
<6> [423.743871] xe 0000:03:00.0: [drm] GT0: reset started
...
<3> [423.790531] xe 0000:03:00.0: [drm] *ERROR* GT0: GuC PC Start failed
<4> [423.790623] ------------[ cut here ]------------
<4> [423.790626] WARNING: CPU: 18 PID: 1065 at
drivers/gpu/drm/xe/xe_guc.c:1129 xe_guc_start+0x2e/0x40 [xe]
<4> [423.790822] Workqueue: gt-ordered-wq gt_reset_worker [xe]
<4> [423.790872] RIP: 0010:xe_guc_start+0x2e/0x40 [xe]
<4> [423.790947] Call Trace:
<4> [423.790948]  <TASK>
<4> [423.790951]  ? show_regs+0x67/0x70
<4> [423.790957]  ? __warn+0x94/0x1b0
<4> [423.790962]  ? xe_guc_start+0x2e/0x40 [xe]
<4> [423.791013]  ? report_bug+0x1b7/0x1d0
<4> [423.791019]  ? handle_bug+0x46/0x80
<4> [423.791023]  ? exc_invalid_op+0x19/0x70
<4> [423.791027]  ? asm_exc_invalid_op+0x1b/0x20
<4> [423.791036]  ? _raw_spin_unlock_irqrestore+0x5c/0x80
<4> [423.791039]  ? xe_guc_start+0x2e/0x40 [xe]
<4> [423.791089]  ? xe_guc_start+0x1a/0x40 [xe]
<4> [423.791138]  xe_uc_start+0x28/0x30 [xe]
<4> [423.791366]  do_gt_restart+0x108/0x530 [xe]

but "Timedout job" issue started much earlier in:

<7>[  410.738375] [IGT] xe_exec_reset: executing
<7>[  410.742816] [IGT] xe_exec_reset: starting subtest gt-reset-stress
<5>[  410.745067] xe 0000:03:00.0: [drm] GT0: Timedout job:
seqno=4294967169, lrc_seqno=4294967169, guc_id=4, flags=0x0
<5>[  410.745390] xe 0000:03:00.0: [drm] GT0: Timedout job:
seqno=4294967169, lrc_seqno=4294967169, guc_id=5, flags=0x0
<5>[  410.745597] xe 0000:03:00.0: [drm] GT0: Timedout job:
seqno=4294967169, lrc_seqno=4294967169, guc_id=6, flags=0x0

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:
>     - {shard-lnl}:        NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - {shard-lnl}:        [PASS][4] -> [DMESG-WARN][5] +6 other tests dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-lnl-6/igt@kms_psr@psr2-suspend.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-lnl-8/igt@kms_psr@psr2-suspend.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134580v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
>     - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] ([Intel XE#1033] / [Intel XE#1214]) +1 other test dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
> 
>   * igt@kms_atomic@test-only:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201]) +47 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_atomic@test-only.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>     - shard-dg2-set2:     [PASS][9] -> [INCOMPLETE][10] ([Intel XE#1195]) +1 other test incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][13] ([Intel XE#1231])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#367])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#367])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +6 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#1252])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#306])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-436/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][25] ([Intel XE#1178]) +1 other test fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) +1 other test dmesg-warn
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-435/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-dg2-set2:     [PASS][29] -> [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [PASS][31] -> [DMESG-WARN][32] ([Intel XE#282]) +3 other tests dmesg-warn
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@display-1x:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#702])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_feature_discovery@display-1x.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#1195] / [Intel XE#2049])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][37] ([Intel XE#1195])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@bd-hdmi-a6-dp4.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#656]) +10 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#417])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane@plane-panning-top-left:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_plane@plane-panning-top-left.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#870])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#734])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1122] / [Intel XE#1201])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@psr-cursor-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_psr@psr-cursor-blt.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1149] / [Intel XE#1201])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][51] -> [FAIL][52] ([Intel XE#771] / [Intel XE#899])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#899]) +1 other test fail
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][55] -> [FAIL][56] ([Intel XE#899])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#756])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#1932])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@xe_ccs@ctrl-surf-copy:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1123] / [Intel XE#1201])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_evict@evict-beng-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@xe_evict@evict-beng-small-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_exec_basic@many-execqueues-null:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][63] ([Intel XE#1214]) +20 other tests dmesg-warn
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@xe_exec_basic@many-execqueues-null.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-basic-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-436/igt@xe_exec_fault_mode@once-basic-imm.html
> 
>   * igt@xe_exec_reset@virtual-close-fd:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][67] ([Intel XE#1214] / [Intel XE#358]) +1 other test dmesg-warn
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@xe_exec_reset@virtual-close-fd.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [PASS][68] -> [FAIL][69] ([Intel XE#1414])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1192] / [Intel XE#1201])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_module_load@load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#378])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@xe_module_load@load.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][72] ([Intel XE#1214])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-436/igt@xe_module_load@reload-no-display.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1061] / [Intel XE#1201])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#366])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][75] ([Intel XE#1191] / [Intel XE#1214])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][76] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1727])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][77] ([Intel XE#1162] / [Intel XE#1214])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [PASS][78] -> [DMESG-WARN][79] ([Intel XE#1214])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@xe_query@multigpu-query-hwconfig.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - {shard-lnl}:        [FAIL][81] ([Intel XE#1659]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][83] ([Intel XE#282]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][85] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][86] +3 other tests pass
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-435/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-edp1:
>     - {shard-lnl}:        [FAIL][87] ([Intel XE#886]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>     - {shard-lnl}:        [DMESG-WARN][89] -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][91] ([Intel XE#1214]) -> [PASS][92] +3 other tests pass
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-464/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-adlp:         [DMESG-WARN][93] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1:
>     - {shard-lnl}:        [FAIL][95] -> [PASS][96] +1 other test pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-lnl-8/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-lnl-3/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
>     - shard-dg2-set2:     [INCOMPLETE][97] ([Intel XE#1195]) -> [PASS][98] +1 other test pass
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][99] ([Intel XE#899]) -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][101] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][103] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_exec_threads@threads-mixed-userptr-invalidate-race:
>     - {shard-lnl}:        [FAIL][105] ([Intel XE#1069]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-lnl-5/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-lnl-6/igt@xe_exec_threads@threads-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-adlp:         [DMESG-WARN][107] ([Intel XE#1214] / [Intel XE#1975]) -> [PASS][108]
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-4/igt@xe_gt_freq@freq_reset_multiple.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-9/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_pm@s4-mocs:
>     - {shard-lnl}:        [ABORT][109] ([Intel XE#1794]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-lnl-2/igt@xe_pm@s4-mocs.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-lnl-5/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [DMESG-WARN][111] ([Intel XE#1214]) -> [PASS][112] +1 other test pass
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [FAIL][113] ([Intel XE#958]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][116] ([Intel XE#623])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#873]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#873])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#316]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][122] ([Intel XE#316]) +1 other test skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][123] ([Intel XE#1231]) -> [DMESG-FAIL][124] ([Intel XE#324])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][126] ([Intel XE#1124]) +9 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1124]) -> [SKIP][128] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#619]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#619])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][132] ([Intel XE#610])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][134] ([Intel XE#346])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_big_joiner@basic.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#367]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][138] ([Intel XE#367]) +2 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#787]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][143] ([Intel XE#1195]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][146] ([Intel XE#1252])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][148] ([Intel XE#787]) +97 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][150] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][152] ([Intel XE#306]) +2 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_chamelium_color@gamma.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#373]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][156] ([Intel XE#373]) +7 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][158] ([Intel XE#307]) +2 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][160] ([Intel XE#308]) +1 other test skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#308]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#308])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][163] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][164] ([Intel XE#1214])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom:
>     - shard-dg2-set2:     [DMESG-WARN][165] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][166] ([Intel XE#282]) +8 other tests dmesg-warn
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_cursor_edge_walk@256x256-top-bottom.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][168] ([Intel XE#323]) +1 other test skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][169] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][170] ([Intel XE#282] / [Intel XE#910])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][171] ([Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][172] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][173] ([Intel XE#282]) -> [DMESG-WARN][174] ([Intel XE#1214] / [Intel XE#282]) +9 other tests dmesg-warn
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-a.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-a.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#323]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#323])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][178] ([Intel XE#701])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][180] ([Intel XE#1135])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_feature_discovery@psr2.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][181] ([Intel XE#1551]) -> [DMESG-WARN][182] ([Intel XE#1214] / [Intel XE#1551]) +1 other test dmesg-warn
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#455]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#651]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][188] ([Intel XE#651]) +28 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][190] ([Intel XE#658])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][192] ([Intel XE#653]) +28 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#653]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#653]) +18 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][196] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +2 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][198] ([Intel XE#305] / [Intel XE#455])
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][200] ([Intel XE#305]) +2 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][202] ([Intel XE#455]) +22 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#305]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][206] ([Intel XE#870])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_pm_backlight@fade.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#1129]) -> [SKIP][208] ([Intel XE#1129] / [Intel XE#1201])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][210] ([Intel XE#1129])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#929]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#929]) +10 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1122]) -> [SKIP][214] ([Intel XE#1122] / [Intel XE#1201])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][216] ([Intel XE#929]) +18 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_psr@pr-cursor-plane-onoff.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#1149]) -> [SKIP][218] ([Intel XE#1149] / [Intel XE#1201])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][220] ([Intel XE#1127])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#327]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][224] ([Intel XE#327]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][226] ([Intel XE#1500])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#756]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#756])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][230] ([Intel XE#756]) +1 other test skip
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][232] ([Intel XE#1091])
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@sriov_basic@bind-unbind-vf.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     [SKIP][233] ([Intel XE#1123]) -> [SKIP][234] ([Intel XE#1123] / [Intel XE#1201])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][236] ([Intel XE#1126])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][238] ([Intel XE#288]) +22 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-imm:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#288]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#288]) +17 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-imm.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-imm.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][242] ([Intel XE#1337])
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#366]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#366])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][246] ([Intel XE#366]) +1 other test skip
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-adlp:         [DMESG-WARN][247] ([Intel XE#1214]) -> [DMESG-WARN][248] ([Intel XE#1191] / [Intel XE#1214])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-6/igt@xe_pm@s3-basic-exec.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-1/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-dg2-set2:     [DMESG-WARN][249] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][250] ([Intel XE#1551] / [Intel XE#569])
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [DMESG-WARN][251] ([Intel XE#1214]) -> [WARN][252] ([Intel XE#1639])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#944]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][256] ([Intel XE#944]) +2 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-WARN][257] ([Intel XE#1760]) -> [DMESG-WARN][258] ([Intel XE#1214] / [Intel XE#1760])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165/shard-dg2-432/igt@xe_wedged@wedged-at-any-timeout.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
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
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1639]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#1975]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1975
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165 -> xe-pw-134580v2
> 
>   IGT_7890: a137e386eba9f46f838315f5d93b87561691d45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1489-b3cee15446d95e97d9d663cdcbc611e698354165: b3cee15446d95e97d9d663cdcbc611e698354165
>   xe-pw-134580v2: 134580v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134580v2/index.html
> 
