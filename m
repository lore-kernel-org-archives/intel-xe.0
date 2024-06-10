Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42559C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 16:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EB010E269;
	Mon, 10 Jun 2024 16:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QVVGoRHo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8847C10E171;
 Mon, 10 Jun 2024 16:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718038517; x=1749574517;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kNi1DbS/03xcBqe8lTifb8OeOixSjDss9zprJJWVn2U=;
 b=QVVGoRHoxLQLnSExZPDbrJSggU7HxHfuGGPAKubeWO0ax8BzptUiqHDB
 qvzO+a94iTZ179sOPeIomFP0HzgFmpORC8RykCIsHhAPMUN3PUrSje6nl
 aFOkio4lTkLY/2DPU3OHFn2uH+8blU39Dty1+yDhxqwr0yrlwoQnVcCkf
 CQqtlz1YGT7xjDmbmJA9j8Jr++WcOT6/FO/686u80v6h5th/xP/v0OwXG
 N7+FCenJjyDIlIrSO63GiRXbdLj3mQbDppsNYvb1eE1Er4MWzDKqQpLNK
 NEoDRswIbsCY/3L63v1PtWw5oxGk1UgKSlO+BBr7BNRRKLIwYZWnDoem+ g==;
X-CSE-ConnectionGUID: /znFRgmFSBWOyVQpJaC3uA==
X-CSE-MsgGUID: fQYSSG7fTrOAVaqiTZUn+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14541479"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14541479"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 09:55:16 -0700
X-CSE-ConnectionGUID: mwkWwh9qSfu0KSdT71nxyA==
X-CSE-MsgGUID: HK3UGf3ZTnOzg3Q4uQ4oWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43551679"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2024 09:55:09 -0700
Received: from [10.246.1.253] (unknown [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6C4B6312E9;
 Mon, 10 Jun 2024 17:55:06 +0100 (IST)
Message-ID: <9666e58b-a5bc-4aed-a3f6-d657c7b13ac6@intel.com>
Date: Mon, 10 Jun 2024 18:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Fixup_GuC_ABI?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240610120411.1768-1-michal.wajdeczko@intel.com>
 <171803232786.32166.7440747604909417119@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171803232786.32166.7440747604909417119@a6498e030952>
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



On 10.06.2024 17:12, Patchwork wrote:
> == Series Details ==
> 
> Series: Fixup GuC ABI
> URL   : https://patchwork.freedesktop.org/series/134674/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b_full -> xe-pw-134674v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134674v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134674v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-134674v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

must be unrelated as series is about dead-definitions removal and
kernel-doc update

> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][3] ([Intel XE#1214]) -> [DMESG-WARN][4] +4 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a6.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1:
>     - {shard-lnl}:        [FAIL][5] ([Intel XE#2028]) -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-lnl-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-lnl-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-edp-1.html
> 
>   * {igt@kms_plane@pixel-format@pipe-a-plane-3}:
>     - shard-adlp:         NOTRUN -> [WARN][7] +1 other test warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_plane@pixel-format@pipe-a-plane-3.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>     - {shard-lnl}:        [PASS][8] -> [ABORT][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134674v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1125] / [Intel XE#1201])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#346])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#346])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-434/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#367])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#787]) +20 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +23 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][25] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_cursor_edge_walk@256x256-right-edge@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1214] / [Intel XE#282])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][29] ([Intel XE#1195])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#323])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#776]) +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#310])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-4/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][33] ([Intel XE#1214] / [Intel XE#1551]) +1 other test dmesg-warn
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][34] ([Intel XE#1608]) +7 other tests dmesg-fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][35] ([Intel XE#324]) +1 other test dmesg-fail
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#656]) +13 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][37] ([Intel XE#1608] / [Intel XE#2034])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1158] / [Intel XE#1201])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_plane@pixel-format:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][43] ([Intel XE#1035] / [Intel XE#1195])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_plane@pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_rpm@drm-resources-equal:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#1211])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_pm_rpm@drm-resources-equal.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1122] / [Intel XE#1201])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][51] ([Intel XE#294]) +1 other test fail
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#327])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1127] / [Intel XE#1201])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][54] -> [FAIL][55] ([Intel XE#771] / [Intel XE#899])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
>     - shard-adlp:         [PASS][56] -> [FAIL][57] ([Intel XE#899])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1126] / [Intel XE#1201])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1126] / [Intel XE#1201])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][60] -> [FAIL][61] ([Intel XE#1600])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-436/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-small-external:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@xe_evict@evict-beng-small-external.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#1392]) +3 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-basic-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-434/igt@xe_exec_fault_mode@once-basic-imm.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [PASS][67] -> [FAIL][68] ([Intel XE#1414])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1192] / [Intel XE#1201])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#378])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@d3hot-basic-exec:
>     - shard-adlp:         NOTRUN -> [FAIL][71] ([Intel XE#355])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-4/igt@xe_pm@d3hot-basic-exec.html
> 
>   * igt@xe_pm@mocs-rpm:
>     - shard-adlp:         NOTRUN -> [FAIL][72] ([Intel XE#2043])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@xe_pm@mocs-rpm.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-adlp:         NOTRUN -> [FAIL][73] ([Intel XE#2009])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#944])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][76] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][77] +1 other test pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][78] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][79] +8 other tests pass
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-463/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-435/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][80] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][81] +1 other test pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-435/igt@kms_cursor_legacy@torture-bo@pipe-b.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-b.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][82] -> [PASS][83] +1 other test pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - {shard-lnl}:        [FAIL][84] ([Intel XE#480] / [Intel XE#886]) -> [PASS][85] +1 other test pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][86] ([Intel XE#361]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - {shard-lnl}:        [SKIP][88] ([Intel XE#1211]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-lnl-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][90] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_compute_mode@once-userptr-invalidate:
>     - {shard-lnl}:        [FAIL][92] ([Intel XE#1069]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-lnl-3/igt@xe_exec_compute_mode@once-userptr-invalidate.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-lnl-5/igt@xe_exec_compute_mode@once-userptr-invalidate.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-dg2-set2:     [DMESG-WARN][94] ([Intel XE#1214] / [Intel XE#1638]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-466/igt@xe_exec_reset@gt-reset-stress.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-436/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-dg2-set2:     [FAIL][96] ([Intel XE#1081]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-dg2-set2:     [FAIL][98] ([Intel XE#1414]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-435/igt@xe_gt_freq@freq_fixed_exec.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-435/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_pm@mocs-rpm:
>     - {shard-lnl}:        [FAIL][100] ([Intel XE#2043]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-lnl-8/igt@xe_pm@mocs-rpm.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-lnl-4/igt@xe_pm@mocs-rpm.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - {shard-lnl}:        [ABORT][102] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-lnl-2/igt@xe_pm@s4-exec-after.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-lnl-8/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - {shard-lnl}:        [ABORT][104] ([Intel XE#1794]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
>     - {shard-lnl}:        [FAIL][106] ([Intel XE#1081]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-lnl-4/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-lnl-4/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][109] ([Intel XE#623])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][110] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) -> [DMESG-WARN][111] ([Intel XE#1033] / [Intel XE#1214])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_async_flips@test-cursor:
>     - shard-dg2-set2:     [DMESG-WARN][112] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][113] ([Intel XE#282]) +7 other tests dmesg-warn
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_async_flips@test-cursor.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_async_flips@test-cursor.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#316]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][117] ([Intel XE#316]) +2 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][118] ([Intel XE#324]) -> [FAIL][119] ([Intel XE#1231])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][121] ([Intel XE#1124]) +6 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#610]) -> [SKIP][123] ([Intel XE#1201] / [Intel XE#610])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][124] ([Intel XE#1231]) -> [DMESG-FAIL][125] ([Intel XE#324]) +1 other test dmesg-fail
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][126] ([Intel XE#1242]) -> [DMESG-FAIL][127] ([Intel XE#324])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#619]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#619])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#607]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#607])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][133] ([Intel XE#610])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1124]) -> [SKIP][135] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][137] ([Intel XE#367]) +1 other test skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#367]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#1252]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#1252])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#787]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][147] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][149] ([Intel XE#787]) +69 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#314]) -> [SKIP][151] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][153] ([Intel XE#306])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#373]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][157] ([Intel XE#373]) +6 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#307]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#307])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-1.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#308]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#323]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][164] ([Intel XE#282]) -> [INCOMPLETE][165] ([Intel XE#1195])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@forked-bo@all-pipes:
>     - shard-dg2-set2:     [DMESG-WARN][166] ([Intel XE#282]) -> [DMESG-WARN][167] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_cursor_legacy@forked-bo@all-pipes.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         [DMESG-FAIL][168] ([Intel XE#1608]) -> [INCOMPLETE][169] ([Intel XE#1195] / [Intel XE#927])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-1/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#776]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#776])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][173] ([Intel XE#1135])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_feature_discovery@psr2.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [INCOMPLETE][174] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-FAIL][175] ([Intel XE#1608] / [Intel XE#2034])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-1/igt@kms_flip@flip-vs-suspend.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#455]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][179] ([Intel XE#455]) +9 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][181] ([Intel XE#651]) +22 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#658]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#658]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#651]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][187] ([Intel XE#653]) +22 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#653]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#653]) +22 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#417]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#417])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#305]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][197] ([Intel XE#870]) +1 other test skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#929]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#1122]) -> [SKIP][201] ([Intel XE#1122] / [Intel XE#1201])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][203] ([Intel XE#929]) +13 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#327]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][207] ([Intel XE#1127])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][209] ([Intel XE#327]) +1 other test skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][210] ([Intel XE#1214] / [Intel XE#1551]) -> [DMESG-WARN][211] ([Intel XE#1551]) +2 other tests dmesg-warn
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-FAIL][212] ([Intel XE#1608]) -> [INCOMPLETE][213] ([Intel XE#1034] / [Intel XE#1195]) +1 other test incomplete
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][214] -> [DMESG-WARN][215] ([Intel XE#1214]) +1 other test dmesg-warn
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#756]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1091]) -> [SKIP][219] ([Intel XE#1091] / [Intel XE#1201])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1123]) -> [SKIP][221] ([Intel XE#1123] / [Intel XE#1201])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#288]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][225] ([Intel XE#288]) +18 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-adlp:         [DMESG-WARN][226] ([Intel XE#1214] / [Intel XE#1638]) -> [INCOMPLETE][227] ([Intel XE#1195])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-1/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][229] ([Intel XE#512])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-433/igt@xe_mmap@small-bar.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#977]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#977])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#979]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#979])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#366]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-adlp:         [INCOMPLETE][236] ([Intel XE#1195] / [Intel XE#1358]) -> [DMESG-FAIL][237] ([Intel XE#1608])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-1/igt@xe_pm@s3-basic.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-4/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-adlp:         [DMESG-FAIL][238] ([Intel XE#1608]) -> [INCOMPLETE][239] ([Intel XE#1195] / [Intel XE#1358])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-8/igt@xe_pm@s3-exec-after.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-9/igt@xe_pm@s3-exec-after.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-adlp:         [INCOMPLETE][240] ([Intel XE#1195]) -> [DMESG-FAIL][241] ([Intel XE#1608]) +1 other test dmesg-fail
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-9/igt@xe_pm@s3-mocs.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-adlp:         [INCOMPLETE][242] ([Intel XE#1195]) -> [DMESG-FAIL][243] ([Intel XE#1191] / [Intel XE#2034])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-9/igt@xe_pm@s3-vm-bind-prefetch.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-8/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [DMESG-WARN][244] ([Intel XE#1214]) -> [INCOMPLETE][245] ([Intel XE#1195])
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#944]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][249] ([Intel XE#944]) +2 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [DMESG-WARN][250] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][251] ([Intel XE#1760])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1622
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1796]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1796
>   [Intel XE#1829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1829
>   [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
>   [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
>   [Intel XE#2009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2009
>   [Intel XE#2016]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2016
>   [Intel XE#2022]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2022
>   [Intel XE#2024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2024
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034
>   [Intel XE#2043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2043
>   [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
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
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
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
>   * Linux: xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b -> xe-pw-134674v1
> 
>   IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1430-8ede6459491820fdcda73f76f70c6dee6d348f3b: 8ede6459491820fdcda73f76f70c6dee6d348f3b
>   xe-pw-134674v1: 134674v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134674v1/index.html
> 
