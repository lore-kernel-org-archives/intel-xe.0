Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24BFC25B76
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 16:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6966B10E084;
	Sat,  8 Jun 2024 16:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jiIiPTmP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE69310E084
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717863266; x=1749399266;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0l+9zcEtJEjBTnsGcglmLwIChQBf65XTSTmOoNSqiX4=;
 b=jiIiPTmPI16C9tHz3OPew9NvBf0ctd0gYztMUpvF8CfM+cn+unLmuJiE
 X7EY0pckkyf4SsKmFOiDHeookYLY/2ti6SrF0Bj4U9oPM6r0EiWzNgfvR
 OHYtzCsuv5zq++N3m559qVrdtxC1e2Dtcr/6BsoylAZXKeTP5D2DgEd4U
 x5RIXsCex5vKJSa5GHrbdxB0JJc0rcwvlv8taEYszSnajtJcPAABjrwPw
 R2utqaBG92bsZjsCwcORb8iGMc0t9qPFMAiA6ncy58Ka6Ozra+nWq7N8e
 A49wjG+ejfE9ajjWnY0JVC5WgxDpJt/gPrT++0B43P4MYYRedI/U+7MeM Q==;
X-CSE-ConnectionGUID: 2Jq6dYhvRJqNtGejTad5hQ==
X-CSE-MsgGUID: pWeLpOdhR4u4X3Z/8KFsgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14755964"
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; d="scan'208";a="14755964"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2024 09:14:25 -0700
X-CSE-ConnectionGUID: LYFX9prxR9aDN45UHIRiUg==
X-CSE-MsgGUID: uNYXSs8ETjuxHxCwwVm5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,223,1712646000"; d="scan'208";a="69796475"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 08 Jun 2024 09:14:21 -0700
Received: from [10.245.82.128] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.82.128])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7AE9733E80
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 17:14:13 +0100 (IST)
Message-ID: <bb912a41-7a0d-4b83-a5d5-04d68d1319b4@intel.com>
Date: Sat, 8 Jun 2024 18:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_Ass?=
 =?UTF-8?Q?ert_LMEM_provisioning_is_done_only_on_DGFX?=
To: intel-xe@lists.freedesktop.org
References: <20240607153155.1592-1-michal.wajdeczko@intel.com>
 <171781327544.29291.9365382546029107727@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171781327544.29291.9365382546029107727@a6498e030952>
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



On 08.06.2024 04:21, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Assert LMEM provisioning is done only on DGFX
> URL   : https://patchwork.freedesktop.org/series/134625/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9_full -> xe-pw-134625v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134625v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134625v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-134625v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated, patch is PF mode specific, while below regressions are kms

> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

	
<3> [206.504162] xe 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x2
-> 0x0)
<4> [206.504264] ------------[ cut here ]------------
<4> [206.504270] xe 0000:00:02.0: [drm] Unexpected DBuf power power
state (0x00000000, expected 0x00000001)
...
<6> [208.659678] PM: suspend entry (deep)
<6> [208.661195] Filesystems sync: 0.001 seconds

EOF

> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html

<3> [206.504162] xe 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x2
-> 0x0)
<4> [206.504264] ------------[ cut here ]------------
<4> [206.504270] xe 0000:00:02.0: [drm] Unexpected DBuf power power
state (0x00000000, expected 0x00000001)

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - {shard-lnl}:        NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_invalid_mode:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-lnl-5/igt@kms_invalid_mode.html
> 
>   * igt@xe_gt_freq@freq_basic_api:
>     - {shard-lnl}:        [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-lnl-4/igt@xe_gt_freq@freq_basic_api.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-lnl-1/igt@xe_gt_freq@freq_basic_api.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9_full and xe-pw-134625v1_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@xe_query:
>     - Statuses :
>     - Exec time: [None] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134625v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1125] / [Intel XE#1201])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1124])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#346])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_big_joiner@invalid-modeset.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#346])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#367])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#1252])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#306])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#306])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_frames@dp-frame-dump:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_chamelium_frames@dp-frame-dump.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#373])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_chamelium_frames@dp-frame-dump.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-466/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [PASS][28] -> [DMESG-WARN][29] ([Intel XE#282] / [Intel XE#910]) +1 other test dmesg-warn
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][30] -> [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-436/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-436/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][33] ([Intel XE#282])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][34] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@forked-move@all-pipes:
>     - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#282])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_cursor_legacy@forked-move@all-pipes.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_cursor_legacy@forked-move@all-pipes.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#323])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#323])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1137] / [Intel XE#1201])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][40] ([Intel XE#1195]) +2 other tests incomplete
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@kms_flip@flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][41] ([Intel XE#1608]) +4 other tests dmesg-fail
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][48] ([Intel XE#1191] / [Intel XE#1608])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][49] ([Intel XE#2028])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][50] ([Intel XE#1191])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][51] -> [FAIL][52] ([Intel XE#361])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_rpm@drm-resources-equal:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#1211])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_pm_rpm@drm-resources-equal.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#929]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@pr-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_psr@pr-dpms.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1127] / [Intel XE#1201])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1126] / [Intel XE#1201])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1126] / [Intel XE#1201])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#1600])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#1392])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#288]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
> 
>   * igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-226x226:
>     - shard-dg2-set2:     [PASS][73] -> [INCOMPLETE][74] ([Intel XE#1195]) +1 other test incomplete
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-434/igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-226x226.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-463/igt@xe_exercise_blt@fast-copy-inc-dimension@tile64-vram01-vram01-226x226.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1192] / [Intel XE#1201])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#378])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [PASS][77] -> [INCOMPLETE][78] ([Intel XE#1195] / [Intel XE#1358])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-adlp-1/igt@xe_pm@s4-d3hot-basic-exec.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-adlp:         NOTRUN -> [FAIL][79] ([Intel XE#2009])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#944])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#944])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@xe_query@multigpu-query-topology.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - {shard-lnl}:        [FAIL][82] ([Intel XE#1659]) -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][84] ([Intel XE#282]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-6.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_cursor_crc@cursor-dpms@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-256x256:
>     - {shard-lnl}:        [FAIL][86] -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-256x256.html
> 
>   * igt@kms_cursor_legacy@single-bo@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][88] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][89] +4 other tests pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_cursor_legacy@single-bo@pipe-a.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-436/igt@kms_cursor_legacy@single-bo@pipe-a.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - {shard-lnl}:        [FAIL][90] ([Intel XE#480] / [Intel XE#886]) -> [PASS][91] +1 other test pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][92] -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
>     - {shard-lnl}:        [DMESG-WARN][94] -> [PASS][95] +4 other tests pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_plane_cursor@overlay:
>     - shard-dg2-set2:     [INCOMPLETE][96] ([Intel XE#1195]) -> [PASS][97] +2 other tests pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_plane_cursor@overlay.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_plane_cursor@overlay.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-180:
>     - {shard-lnl}:        [FAIL][98] ([Intel XE#1491]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-180.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-lnl-8/igt@kms_rotation_crc@sprite-rotation-180.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][100] ([Intel XE#899]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][102] ([Intel XE#1473]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-463/igt@xe_evict@evict-beng-threads-large.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1195] / [Intel XE#1473]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-dg2-set2:     [INCOMPLETE][106] ([Intel XE#1195] / [Intel XE#1358]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-435/igt@xe_pm@s2idle-multiple-execs.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [DMESG-WARN][108] ([Intel XE#1214]) -> [PASS][109] +1 other test pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#801]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#316]) -> [SKIP][113] ([Intel XE#1201] / [Intel XE#316])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][115] ([Intel XE#316]) +1 other test skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][116] ([Intel XE#1231]) -> [DMESG-WARN][117] ([Intel XE#1214] / [Intel XE#324])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#607]) -> [SKIP][119] ([Intel XE#1201] / [Intel XE#607])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1124]) -> [SKIP][121] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][123] ([Intel XE#1124]) +2 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#367]) -> [SKIP][125] ([Intel XE#1201] / [Intel XE#367])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][127] ([Intel XE#367]) +1 other test skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#787]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][131] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1252]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#1252])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][137] ([Intel XE#787]) +41 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#306]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#306])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_chamelium_color@ctm-max.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][141] ([Intel XE#373]) +4 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#373]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#307]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#307])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][147] ([Intel XE#307])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][149] ([Intel XE#308])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#308]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][152] ([Intel XE#282]) -> [DMESG-WARN][153] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][154] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][155] ([Intel XE#282]) +4 other tests dmesg-warn
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#323]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#323])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#455] / [Intel XE#929]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#1927]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#1927])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][163] ([Intel XE#1138])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_feature_discovery@display-4x.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#1135]) -> [SKIP][165] ([Intel XE#1135] / [Intel XE#1201])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_feature_discovery@psr1.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][166] ([Intel XE#1551]) -> [DMESG-WARN][167] ([Intel XE#1551])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
>     - shard-adlp:         [INCOMPLETE][168] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-FAIL][169] ([Intel XE#1608] / [Intel XE#2034])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][171] ([Intel XE#455]) +12 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - shard-dg2-set2:     [SKIP][172] ([i915#5274]) -> [SKIP][173] ([Intel XE#1201] / [i915#5274])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][175] ([Intel XE#651]) +12 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#651]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][179] ([Intel XE#658])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#653]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][183] ([Intel XE#653]) +13 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-suspend.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#305]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][189] ([Intel XE#305] / [Intel XE#455])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][191] ([Intel XE#305]) +2 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][193] ([Intel XE#1122])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][195] ([Intel XE#929]) +6 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#929]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_psr@psr-dpms.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][199] ([Intel XE#1149])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#327]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#1500])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#455]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_vrr@flipline.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_vrr@flipline.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#756]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#756])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][209] ([Intel XE#1091])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@sriov_basic@bind-unbind-vf.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#288]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-basic:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][215] ([Intel XE#288]) +9 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@xe_exec_fault_mode@once-basic.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@xe_exec_fault_mode@once-basic.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-adlp:         [DMESG-FAIL][216] ([Intel XE#1608] / [Intel XE#2034]) -> [INCOMPLETE][217] ([Intel XE#1195])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#255]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#255])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [DMESG-WARN][220] -> [DMESG-WARN][221] ([Intel XE#1214])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@xe_module_load@reload.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@xe_module_load@reload.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][223] ([Intel XE#1337])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-adlp:         [DMESG-FAIL][224] ([Intel XE#1608] / [Intel XE#2034]) -> [INCOMPLETE][225] ([Intel XE#1195] / [Intel XE#1358])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-adlp:         [INCOMPLETE][226] ([Intel XE#1195]) -> [DMESG-FAIL][227] ([Intel XE#1608]) +1 other test dmesg-fail
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-adlp:         [DMESG-FAIL][228] ([Intel XE#1608]) -> [INCOMPLETE][229] ([Intel XE#1195] / [Intel XE#1358])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-adlp-4/igt@xe_pm@s3-basic-exec.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-9/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#366]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-adlp:         [DMESG-FAIL][232] ([Intel XE#1191]) -> [INCOMPLETE][233] ([Intel XE#1195])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-adlp-2/igt@xe_pm@s3-vm-bind-prefetch.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-9/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     [DMESG-WARN][234] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941]) -> [DMESG-WARN][235] ([Intel XE#1162] / [Intel XE#1941])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [ABORT][236] ([Intel XE#1794]) -> [INCOMPLETE][237] ([Intel XE#1195])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#944]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-432/igt@xe_query@multigpu-query-config.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-434/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][241] ([Intel XE#944])
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-FAIL][242] ([Intel XE#1760]) -> [DMESG-WARN][243] ([Intel XE#1214] / [Intel XE#1760])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
>   [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
>   [Intel XE#1927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1927
>   [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>   [Intel XE#2009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2009
>   [Intel XE#2016]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2016
>   [Intel XE#2024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2024
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
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
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9 -> xe-pw-134625v1
> 
>   IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9: b5a9ff6572c2849d2e02c8595b24639fdf1864a9
>   xe-pw-134625v1: 134625v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/index.html
> 
