Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5951C2BA1A
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 14:32:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D82810E9CF;
	Thu, 20 Jun 2024 14:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggmg8wrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE6910E9CF
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 14:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718893954; x=1750429954;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=oyYUapgkOx1iEj9X88MfMbuiWaIzFrb++8M1o8eTVJI=;
 b=ggmg8wrLvlwysUy02zZzJvTZCPvh3mHvscxIYzE2tyyTi+zVP4FNMNmL
 F5DgB7KG1ZW0MOMjrX05V23flQMZGZmRTkkCiJvbcV+lo68QA3yAIwttV
 lmbV4dT+jQcRNCSN8ZG2mmlGuYJ8a1hbjZSEc4BPcinXDpjK/9FJYh/g0
 2DFMWBeudfuyI6vO1NzgzZgOw8n7oKxcV+juwUb/UMq5BWmn7cQzozLRg
 ad0w4H4/xgqnJifhv8EJFnPEmSKD7tfWpooEEUlnwq82QMREyRKSYpyHg
 EeBRPZ4yeZ+90FcoLXNNutJ3ZlA/9HgX35VnZs+2Gcib3TXg+WZMjRAae g==;
X-CSE-ConnectionGUID: HaaDMY4qQS+Qq7mSn4B/2g==
X-CSE-MsgGUID: IIWH41zyShWu49gEPe9S/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="33413834"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="33413834"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 07:32:33 -0700
X-CSE-ConnectionGUID: Cer9TTOAS1OQcOENiBgUPw==
X-CSE-MsgGUID: 9m91gtCXT+i2YcaEFlqhbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="79749626"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 20 Jun 2024 07:32:28 -0700
Received: from [10.246.19.248] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.19.248])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A4FD5312D7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 15:32:24 +0100 (IST)
Message-ID: <3945313d-9f3e-45fd-994a-43e5ee099bbc@intel.com>
Date: Thu, 20 Jun 2024 16:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Adapt_the_driver?=
 =?UTF-8?Q?_to_boot_on_the_VF_device_=28rev3=29?=
To: intel-xe@lists.freedesktop.org
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <171888850974.127478.14078568430084223255@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171888850974.127478.14078568430084223255@a6498e030952>
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



On 20.06.2024 15:01, Patchwork wrote:
> == Series Details ==
> 
> Series: Adapt the driver to boot on the VF device (rev3)
> URL   : https://patchwork.freedesktop.org/series/135080/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357_full -> xe-pw-135080v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-135080v3_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135080v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135080v3_full:
> 
> ### IGT changes ###

unrelated, looks like a sporadic already seen elsewhere

> 
> #### Warnings ####
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][1] ([Intel XE#1214]) -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html

<3> [140.442289] xe 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x2
-> 0x0)
<4> [140.442407] ------------[ cut here ]------------
<4> [140.442410] xe 0000:00:02.0: [drm] Unexpected DBuf power power
state (0x00000000, expected 0x00000001)

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135080v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>     - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#1033] / [Intel XE#1214])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][6] ([Intel XE#1231])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#607])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1124] / [Intel XE#1201])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#367])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#306])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x128:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][14] ([Intel XE#1195]) +1 other test incomplete
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-128x128.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#308])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [PASS][16] -> [DMESG-WARN][17] ([Intel XE#282])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [PASS][18] -> [DMESG-WARN][19] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#282] / [Intel XE#910])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-dg2-set2:     [PASS][22] -> [DMESG-WARN][23] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-464/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#310])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>     - shard-adlp:         [PASS][26] -> [FAIL][27] ([Intel XE#1874]) +2 other tests fail
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#656]) +11 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
>     - shard-adlp:         NOTRUN -> [FAIL][29] ([Intel XE#1861])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#616])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
>     - shard-adlp:         [PASS][33] -> [DMESG-WARN][34] ([Intel XE#1191] / [Intel XE#1214])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-adlp:         [PASS][35] -> [DMESG-WARN][36] ([Intel XE#1214]) +1 other test dmesg-warn
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_plane_lowres@tiling-x:
>     - shard-adlp:         NOTRUN -> [FAIL][37] ([Intel XE#1874]) +2 other tests fail
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_plane_lowres@tiling-x.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#734])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms:
>     - shard-adlp:         [PASS][40] -> [SKIP][41] ([Intel XE#1201] / [Intel XE#1211])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-2/igt@kms_pm_rpm@legacy-planes-dpms.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-2/igt@kms_pm_rpm@legacy-planes-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#756])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-threads-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@xe_evict@evict-threads-small-multi-vm.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - shard-adlp:         NOTRUN -> [FAIL][50] ([Intel XE#1999]) +2 other tests fail
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>   * igt@xe_pm@d3hot-basic:
>     - shard-adlp:         [PASS][51] -> [FAIL][52] ([Intel XE#355])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-2/igt@xe_pm@d3hot-basic.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-2/igt@xe_pm@d3hot-basic.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][53] -> [ABORT][54] ([Intel XE#1358])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-6/igt@xe_pm@s4-exec-after.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_addfb_basic@too-wide:
>     - {shard-lnl}:        [INCOMPLETE][56] ([Intel XE#1573]) -> [PASS][57]
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-lnl-2/igt@kms_addfb_basic@too-wide.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-lnl-2/igt@kms_addfb_basic@too-wide.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-adlp:         [DMESG-WARN][58] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][59] +1 other test pass
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][60] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][61] +9 other tests pass
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][62] ([Intel XE#1195]) -> [PASS][63] +1 other test pass
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-434/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-435/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - {shard-lnl}:        [FAIL][64] ([Intel XE#886]) -> [PASS][65] +2 other tests pass
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-dg2-set2:     [FAIL][66] ([Intel XE#301]) -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
>     - shard-dg2-set2:     [FAIL][68] -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][70] ([Intel XE#1214]) -> [PASS][71]
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x:
>     - shard-adlp:         [FAIL][72] ([Intel XE#1874]) -> [PASS][73] +3 other tests pass
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms@plane-77:
>     - shard-adlp:         [ABORT][74] -> [PASS][75] +1 other test pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-4/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@kms_pm_rpm@universal-planes-dpms@plane-77.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][76] ([Intel XE#771] / [Intel XE#899]) -> [PASS][77]
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][78] ([Intel XE#899]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
> 
>   * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
>     - {shard-lnl}:        [DMESG-WARN][80] ([Intel XE#1330]) -> [PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate:
>     - {shard-lnl}:        [INCOMPLETE][82] -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-lnl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-lnl-6/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [ABORT][84] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [FAIL][86] ([Intel XE#958]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][88] ([Intel XE#623]) -> [SKIP][89] ([Intel XE#1201] / [Intel XE#623])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][90] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][91] ([Intel XE#316]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][92] ([Intel XE#316]) -> [SKIP][93] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][94] ([Intel XE#1231]) -> [DMESG-FAIL][95] ([Intel XE#324])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][97] ([Intel XE#607])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][98] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][99] ([Intel XE#610])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][100] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][101] ([Intel XE#1124]) +7 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][102] ([Intel XE#1124]) -> [SKIP][103] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][105] ([Intel XE#367]) +1 other test skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][106] ([Intel XE#367]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][109] ([Intel XE#787]) +48 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][113] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#1252]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#1252])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#787]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#787]) +76 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][119] ([Intel XE#1152]) +3 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-464/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#306]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_chamelium_color@degamma.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-433/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][123] ([Intel XE#373]) +6 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_chamelium_frames@vga-frame-dump.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg2-set2:     [SKIP][124] ([Intel XE#373]) -> [SKIP][125] ([Intel XE#1201] / [Intel XE#373]) +10 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][127] ([Intel XE#307])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][128] ([Intel XE#1178]) -> [TIMEOUT][129] ([Intel XE#2080]) +1 other test timeout
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-4.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-433/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#308]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][132] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][133] ([Intel XE#282]) +5 other tests dmesg-warn
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][135] ([Intel XE#308])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom:
>     - shard-dg2-set2:     [DMESG-WARN][136] ([Intel XE#282]) -> [DMESG-WARN][137] ([Intel XE#1214] / [Intel XE#282]) +9 other tests dmesg-warn
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_cursor_edge_walk@256x256-top-bottom.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-top-bottom.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][138] ([Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][139] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#323]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#323])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#455]) -> [SKIP][143] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][145] ([Intel XE#1135])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_feature_discovery@psr1.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][146] -> [DMESG-WARN][147] ([Intel XE#1214]) +1 other test dmesg-warn
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][148] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][149] ([Intel XE#1214]) +3 other tests dmesg-warn
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][151] ([Intel XE#455]) +10 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#651]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#651]) +27 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][155] ([Intel XE#651]) +23 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#658]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#658]) +1 other test skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][159] ([Intel XE#653]) +20 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#653]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#653]) +30 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#605]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#605])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][165] ([Intel XE#417])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][167] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#498]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#305]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][175] ([Intel XE#870])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][177] ([Intel XE#1129])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][179] ([Intel XE#929]) +13 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#929]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#929]) +20 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_psr@psr-dpms.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-436/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][183] ([Intel XE#1149])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][185] ([Intel XE#1127])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#327]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][189] ([Intel XE#327]) +2 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [FAIL][190] ([Intel XE#1729]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#362])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#1500]) -> [SKIP][193] ([Intel XE#1201] / [Intel XE#1500])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][195] ([Intel XE#756])
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@kms_writeback@writeback-check-output.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#1126]) -> [SKIP][197] ([Intel XE#1126] / [Intel XE#1201])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][198] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][199] ([Intel XE#1473] / [Intel XE#392]) +1 other test incomplete
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-435/igt@xe_evict@evict-threads-large.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#288]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][203] ([Intel XE#288]) +17 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#255]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#255])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#560]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#560])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@xe_media_fill@media-fill.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#979]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#979])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#366]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#366]) +2 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s3-d3hot-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][212] ([Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][213] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-dg2-set2:     [DMESG-WARN][214] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569]) -> [DMESG-WARN][215] ([Intel XE#1551] / [Intel XE#569])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [DMESG-WARN][216] ([Intel XE#1214]) -> [ABORT][217] ([Intel XE#1358])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][219] ([Intel XE#944]) +1 other test skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-436/igt@xe_query@multigpu-query-topology.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#944]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#944])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1573
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>   [Intel XE#2034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034
>   [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2080
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
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
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
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
>   * Linux: xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357 -> xe-pw-135080v3
> 
>   IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1504-65ef303b3a8a20609f394e0a823ade01cb4f1357: 65ef303b3a8a20609f394e0a823ade01cb4f1357
>   xe-pw-135080v3: 135080v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v3/index.html
> 
