Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4D8C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 19:38:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B77910E161;
	Tue, 25 Jun 2024 19:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePhuDilv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EAA10E161
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 19:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719344283; x=1750880283;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4laU7iIILkYQtEJRqXyQh37dohz9l2FkXGVRW9cJ3Ok=;
 b=ePhuDilvNwPihfphvgEozotkAPHnG98tP76WtN0mggncExRJlJWt96ZP
 NqjAkUhfjm2MdsotrTICJUzVagAS/tYG/p2h8Sc21QpHQkQfeogdyI/UU
 S+8seDws9wjJOUMaqLSCg96nhyQuAHlKcLlLsNa4vgustFSgdlqV8nemi
 8p7TffH3r+CMe4rd5FiqMF+cO7btOf+Wp/eIZGbhk5Ez7EPXXwUWiSFHu
 yODOG78fisN0tIBOBCaiGZzK66hSM19IfHaEFMTJ5RWmTNkbo7NSoxN16
 Qpxe6zXPt8VfoGR24qGdc0R/6m7YNleM9M1Dd+vSLcSmIzY3x4vSBiJij w==;
X-CSE-ConnectionGUID: mNKPIKfPSjmkrOYWFXed+Q==
X-CSE-MsgGUID: zyvOnzRYQW2GwtZRJUfKdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="12244536"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="12244536"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 12:38:02 -0700
X-CSE-ConnectionGUID: rooknBK9TT6TYmZvHFxgQg==
X-CSE-MsgGUID: 3wi94neeSLui0NBtax6tFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43730328"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 25 Jun 2024 12:37:58 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 17510284ED
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 20:37:37 +0100 (IST)
Message-ID: <a9fb6636-2af6-423d-b31b-434de6b4941e@intel.com>
Date: Tue, 25 Jun 2024 21:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Small_GuC_improv?=
 =?UTF-8?Q?ements?=
To: intel-xe@lists.freedesktop.org
References: <20240625141258.1257-1-michal.wajdeczko@intel.com>
 <171933389245.157680.1063075008952287326@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171933389245.157680.1063075008952287326@a6498e030952>
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



On 25.06.2024 18:44, Patchwork wrote:
> == Series Details ==
> 
> Series: Small GuC improvements
> URL   : https://patchwork.freedesktop.org/series/135365/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3_full -> xe-pw-135365v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135365v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135365v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135365v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_multiple@tiling-none@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_plane_multiple@tiling-none@pipe-a-hdmi-a-6.html

seems unrelated, series is not touching any of KMS code

> 
>   
> #### Warnings ####
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][2] ([Intel XE#1214]) -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@xe_pm@s4-basic-exec.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@xe_pm@s4-basic-exec.html

<3> [299.504070] xe 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x2
-> 0x0)
<4> [299.504241] ------------[ cut here ]------------
<4> [299.504243] xe 0000:00:02.0: [drm] Unexpected DBuf power power
state (0x00000000, expected 0x00000001)
<4> [299.504268] WARNING: CPU: 10 PID: 980 at
drivers/gpu/drm/i915/display/intel_display_power_well.c:957
gen9_disable_dc_states+0x1b3/0x200 [xe]


> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1:
>     - {shard-lnl}:        [PASS][4] -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-lnl-4/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-edp-1.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135365v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>     - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] ([Intel XE#1033] / [Intel XE#1214])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1124])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#367])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-436/igt@kms_chamelium_audio@hdmi-audio.html
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#373])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_chamelium_audio@hdmi-audio.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#306])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#306])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#307])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#308])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][21] -> [DMESG-WARN][22] ([Intel XE#1214]) +1 other test dmesg-warn
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#310])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][25] -> [FAIL][26] ([Intel XE#1874]) +1 other test fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#656]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#658])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1158] / [Intel XE#1201])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#653])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][34] -> [DMESG-WARN][35] ([Intel XE#1162] / [Intel XE#1214])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][36] -> [FAIL][37] ([Intel XE#361])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#870])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#836])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1122] / [Intel XE#1201])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1122] / [Intel XE#1201])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1149] / [Intel XE#1201])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#455])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1123] / [Intel XE#1201])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][47] ([Intel XE#1473] / [Intel XE#392])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][48] -> [TIMEOUT][49] ([Intel XE#1473] / [Intel XE#392])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#688])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#288])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#1045] / [Intel XE#1204])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_gt_freq@freq_low_max.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@xe_gt_freq@freq_low_max.html
> 
>   * igt@xe_mmap@vram:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1008] / [Intel XE#1201])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@xe_mmap@vram.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [PASS][56] -> [ABORT][57] ([Intel XE#1358])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-6/igt@xe_pm@s4-basic.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-9/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#366])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-436/igt@xe_pm@s4-d3cold-basic-exec.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [PASS][59] -> [FAIL][60] ([Intel XE#958])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#944])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#944])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@single-bo@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][63] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][64] +1 other test pass
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-463/igt@kms_cursor_legacy@single-bo@pipe-b.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][65] ([Intel XE#886]) -> [PASS][66] +1 other test pass
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-435/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-463/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][67] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][68] +1 other test pass
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>     - shard-adlp:         [FAIL][69] ([Intel XE#1874]) -> [PASS][70] +2 other tests pass
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     [DMESG-WARN][71] ([Intel XE#1214]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_plane_cursor@viewport:
>     - shard-adlp:         [INCOMPLETE][73] ([Intel XE#1195]) -> [PASS][74] +3 other tests pass
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-2/igt@kms_plane_cursor@viewport.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-6/igt@kms_plane_cursor@viewport.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [FAIL][75] ([Intel XE#771] / [Intel XE#899]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-adlp:         [FAIL][77] ([Intel XE#899]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][79] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-466/igt@xe_evict@evict-threads-large.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-rebind-err:
>     - {shard-lnl}:        [ABORT][81] -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-lnl-1/igt@xe_exec_threads@threads-hang-userptr-rebind-err.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-dg2-set2:     [FAIL][83] ([Intel XE#1414]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@xe_gt_freq@freq_fixed_exec.html
>     - shard-adlp:         [FAIL][85] ([Intel XE#1414]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - {shard-lnl}:        [ABORT][87] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-lnl-6/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-dg2-set2:     [INCOMPLETE][89] ([Intel XE#1195]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][92] ([Intel XE#316]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][93] ([Intel XE#316]) -> [SKIP][94] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][95] ([Intel XE#619]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#619])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][97] ([Intel XE#1124]) -> [SKIP][98] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][100] ([Intel XE#607])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][101] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][102] ([Intel XE#1124]) +4 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][103] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][104] ([Intel XE#367]) +1 other test skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][105] ([Intel XE#367]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][107] ([Intel XE#787]) -> [SKIP][108] ([Intel XE#1201] / [Intel XE#787]) +83 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][110] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][112] ([Intel XE#787]) +55 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][113] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_audio@dp-audio-edid:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][116] ([Intel XE#373]) +6 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_chamelium_audio@dp-audio-edid.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#306]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#306])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][120] ([Intel XE#306]) +1 other test skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_chamelium_color@gamma.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@dp-crc-multiple:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#373]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-multiple.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@kms_chamelium_frames@dp-crc-multiple.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [INCOMPLETE][123] ([Intel XE#1195] / [Intel XE#2075]) -> [FAIL][124] ([Intel XE#1178])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_content_protection@srm.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-463/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     [DMESG-FAIL][125] -> [FAIL][126] ([Intel XE#1178])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][128] ([Intel XE#308])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#308]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#308])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][132] ([Intel XE#323])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#323]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#323])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#455]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#455]) +16 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#776]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#776])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#1138]) -> [SKIP][140] ([Intel XE#1138] / [Intel XE#1201])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#1135]) -> [SKIP][142] ([Intel XE#1135] / [Intel XE#1201])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][143] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][144] ([Intel XE#1551])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][145] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][146] ([Intel XE#1214] / [Intel XE#1551])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][147] ([Intel XE#1214] / [Intel XE#1551]) -> [DMESG-WARN][148] ([Intel XE#1551])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][150] ([Intel XE#455]) +7 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#651]) -> [SKIP][152] ([Intel XE#1201] / [Intel XE#651]) +29 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#658]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#658])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][156] ([Intel XE#651]) +18 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][158] ([Intel XE#653]) +19 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#653]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#653]) +30 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][162] ([Intel XE#605])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#417]) -> [SKIP][164] ([Intel XE#1201] / [Intel XE#417])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][166] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][168] ([Intel XE#498]) +2 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#498]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#305]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#870]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#908]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#908])
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][182] ([Intel XE#1489]) +1 other test skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#1489]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#1489]) +2 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1122]) -> [SKIP][186] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][188] ([Intel XE#929]) +12 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@kms_psr@fbc-pr-no-drrs.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#929]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#327]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#327])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1500]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#1500])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][196] ([Intel XE#1091])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@sriov_basic@bind-unbind-vf.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1091]) -> [SKIP][198] ([Intel XE#1091] / [Intel XE#1201]) +1 other test skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1123]) -> [SKIP][200] ([Intel XE#1123] / [Intel XE#1201])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1126]) -> [SKIP][202] ([Intel XE#1126] / [Intel XE#1201])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][203] ([Intel XE#1041]) -> [FAIL][204] ([Intel XE#1600])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][206] ([Intel XE#288]) +15 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#288]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#512]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#512])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_mmap@small-bar.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1337]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#1337])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][214] ([Intel XE#977])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][216] ([Intel XE#979])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#366]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-435/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#579]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#579])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#944]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][224] ([Intel XE#944])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3/shard-dg2-436/igt@xe_query@multigpu-query-invalid-size.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2075
>   [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
>   [Intel XE#2131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2131
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3 -> xe-pw-135365v1
> 
>   IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1525-61dfb30a52fac9b1bb455a250799611682334cc3: 61dfb30a52fac9b1bb455a250799611682334cc3
>   xe-pw-135365v1: 135365v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135365v1/index.html
> 
