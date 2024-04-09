Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3995CD1297
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 16:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC3010FD27;
	Tue,  9 Apr 2024 16:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BS9zTRY/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EEE10FD27
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712680260; x=1744216260;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=iaCDKw7NWvl+gqHUT3i6qA5jy3pB+AV+ENCEStVCSzQ=;
 b=BS9zTRY/XmI/JqKlavhwOQaZQtOGsXaYLUYpLYGBphr5c/veteJfFigH
 KT1Fyo+wcZqR7zV9bbsL2Xm25mAf8kHdsP/z+3ZDVuq5abzBAzNV/n70m
 44Qn6EwjsWoAyVWlr0J9vFbFxfMC6gHDVT7Ab3x5V9WKMOxyBC8wAYNiv
 cTlc7yY1r5O4u6nYScmucF2bPm6X2H2QFh8CGaYP1XSKxuXaTA0eJx60G
 9esJJ1rTRnFE46iKBFdixK2LggkPWo5h9MhpExEIjgfBPAC0xj6gvwmfT
 fDHinHAMlBa6OdBTaOmxGroEjBDrbt8w+LcQNtW5VfjktzjwXbb84pEwf A==;
X-CSE-ConnectionGUID: lr6y5FkTRXa9tYZFmjSuAw==
X-CSE-MsgGUID: JMu9gLhiQuGGz/vkZsE6CA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7864558"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="7864558"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 09:30:59 -0700
X-CSE-ConnectionGUID: dv4m4hXlTq6dMKyGvLVevA==
X-CSE-MsgGUID: mlyWJLHsTWSNhDV3uhCfjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20298073"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 09 Apr 2024 09:30:57 -0700
Received: from [10.249.158.230] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.158.230])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D4086284DE
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 17:30:48 +0100 (IST)
Message-ID: <6a7647ed-3c2b-4129-9922-2fb4c8a41957@intel.com>
Date: Tue, 9 Apr 2024 18:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_?=
 =?UTF-8?Q?with_=5B1/2=5D_drm/xe=3A_Assert_pat=2Eops_function_pointers?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240409105106.1067-1-michal.wajdeczko@intel.com>
 <171266688490.1300821.16712263722354930536@8e613ede5ea5>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171266688490.1300821.16712263722354930536@8e613ede5ea5>
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



On 09.04.2024 14:48, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] drm/xe: Assert pat.ops function pointers
> URL   : https://patchwork.freedesktop.org/series/132205/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d_full -> xe-pw-132205v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with xe-pw-132205v1_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-132205v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-132205v1_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-FAIL][1] ([Intel XE#1068]) -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html

<3> [158.200714] xe 0000:00:02.0: [drm] *ERROR* GuC engine reset request
failed on 0:0 because 0x00000000

unrelated to this series

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-132205v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-adlp:         NOTRUN -> [ABORT][3] ([Intel XE#1538])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>     - shard-adlp:         [PASS][4] -> [DMESG-WARN][5] ([Intel XE#1214] / [Intel XE#324] / [Intel XE#358])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-adlp:         NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][7] ([Intel XE#1214]) +6 other tests dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#607])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#316])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][11] ([Intel XE#1231])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][12] ([Intel XE#324])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#619])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#346])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#787]) +42 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-7.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#1252])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#787]) +35 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +12 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-7.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#307])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#1178]) +2 other tests fail
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][30] ([Intel XE#1195] / [Intel XE#927])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][31] ([Intel XE#1195])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#309]) +4 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [PASS][33] -> [DMESG-WARN][34] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@forked-bo@all-pipes:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][35] ([Intel XE#1214] / [Intel XE#282]) +6 other tests dmesg-warn
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_cursor_legacy@forked-bo@all-pipes.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#323])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-1/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-hdmi-a6:
>     - shard-dg2-set2:     [PASS][38] -> [DMESG-WARN][39] ([Intel XE#1214]) +2 other tests dmesg-warn
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a2:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][40] ([Intel XE#1214])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible@d-hdmi-a2.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>     - shard-adlp:         [PASS][42] -> [FAIL][43] ([Intel XE#616])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#656]) +21 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [FAIL][46] ([Intel XE#616]) +4 other tests fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-rte.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#1339])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#417])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#361]) +1 other test fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#870])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#870])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#836])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr-primary-render:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_psr@fbc-psr-primary-render.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][62] ([Intel XE#1214] / [Intel XE#324])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][63] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#756])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#1447])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1126] / [Intel XE#1201]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
>     - shard-dg2-set2:     [PASS][67] -> [INCOMPLETE][68] ([Intel XE#1195] / [Intel XE#1473])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][69] -> [TIMEOUT][70] ([Intel XE#1473] / [Intel XE#402])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-small-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@xe_evict@evict-beng-small-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#261]) +4 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_threads@threads-cm-fd-userptr-rebind:
>     - shard-dg2-set2:     [PASS][75] -> [INCOMPLETE][76] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-436/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-fd-userptr-invalidate:
>     - shard-dg2-set2:     [PASS][77] -> [TIMEOUT][78] ([Intel XE#1261] / [Intel XE#1356])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-434/igt@xe_exec_threads@threads-fd-userptr-invalidate.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-466/igt@xe_exec_threads@threads-fd-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-mixed-fd-userptr-rebind:
>     - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1206] / [Intel XE#1356])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-433/igt@xe_exec_threads@threads-mixed-fd-userptr-rebind.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-466/igt@xe_exec_threads@threads-mixed-fd-userptr-rebind.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#512])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_module_load@load:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#378])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@xe_module_load@load.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#979])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         NOTRUN -> [FAIL][84] ([Intel XE#1043] / [Intel XE#845])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#944])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-433/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
>     - shard-adlp:         NOTRUN -> [FAIL][87] ([Intel XE#1081])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - shard-adlp:         [ABORT][88] ([Intel XE#1088]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-9/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-adlp:         [DMESG-FAIL][90] ([Intel XE#1033] / [Intel XE#358]) -> [PASS][91] +1 other test pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     [DMESG-WARN][92] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][93] +2 other tests pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-433/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-dg2-set2:     [DMESG-WARN][94] ([Intel XE#1200] / [Intel XE#1214]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-464/igt@kms_display_modes@extended-mode-basic.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-463/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][96] ([Intel XE#616]) -> [PASS][97] +2 other tests pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
>     - shard-dg2-set2:     [TIMEOUT][98] ([Intel XE#1206] / [Intel XE#1259] / [Intel XE#1473]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-beng-small-external-cm:
>     - shard-dg2-set2:     [ABORT][100] ([Intel XE#1304]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-433/igt@xe_evict@evict-beng-small-external-cm.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-463/igt@xe_evict@evict-beng-small-external-cm.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][102] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_threads@threads-bal-fd-userptr:
>     - shard-dg2-set2:     [INCOMPLETE][104] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-434/igt@xe_exec_threads@threads-bal-fd-userptr.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][106] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358]) -> [DMESG-WARN][107] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][108] ([Intel XE#1033] / [Intel XE#1214]) -> [DMESG-WARN][109] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324]) +1 other test dmesg-warn
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][111] ([Intel XE#1178])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-464/igt@kms_content_protection@srm.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-463/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][112] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][113] ([Intel XE#1214] / [Intel XE#282])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a2:
>     - shard-adlp:         [INCOMPLETE][114] ([Intel XE#1195]) -> [DMESG-WARN][115] ([Intel XE#1214]) +1 other test dmesg-warn
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a2.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-4/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a2.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-adlp:         [SKIP][116] ([Intel XE#1201]) -> [SKIP][117] ([Intel XE#1201] / [Intel XE#1210])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-adlp:         [DMESG-WARN][118] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][119] ([Intel XE#1195])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-adlp:         [INCOMPLETE][120] ([Intel XE#1044] / [Intel XE#1195]) -> [DMESG-WARN][121] ([Intel XE#1191] / [Intel XE#1214])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-adlp:         [INCOMPLETE][122] ([Intel XE#1195] / [Intel XE#1349]) -> [DMESG-WARN][123] ([Intel XE#1191] / [Intel XE#1214])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/shard-adlp-1/igt@xe_pm_residency@gt-c6-freeze.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/shard-adlp-8/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1200
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
>   [Intel XE#1210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
>   [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
>   [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
>   [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
>   [Intel XE#1349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1349
>   [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
>   [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
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
>   * Linux: xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d -> xe-pw-132205v1
> 
>   IGT_7802: 7802
>   xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d: eea58bf00b72f3fd0abdf5fb144f988c23056b8d
>   xe-pw-132205v1: 132205v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/index.html
> 
