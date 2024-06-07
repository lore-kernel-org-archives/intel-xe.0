Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A0FC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 10:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ED410E1D5;
	Fri,  7 Jun 2024 10:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXcF8rwU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F6710E1D5
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717755562; x=1749291562;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=h8sZ4GhfzPMr//rZ3YYN8YqOb/hgCHwAejOijdavDUs=;
 b=aXcF8rwUpcWc3SwuJO1Wk5CzZUexpNfU+ghHXglgMqd3o8GXS1jRFO4z
 3UOlyAkABpEizTZJ1+izCW5PBg8GDa5vxOvaFFYbMcTakoFClMxXiGnFI
 6VL8OvEAtIayewwFZ6wDVgyL1bEzsdAV+hewxJ48KVrZjVn/acNalLaWN
 cUyYDoYT1HUQh55u2mtMM+FgZNZAxkZIboIulgMgBLKsnmRaPW5xYpmz8
 mU+KO+hR3sWbBbUUKV7afCQBSqOOXjWqR18WZHyi9wLFy6ydY8J2aLqLr
 vfCz/9Ve0oBH0eD3qeCIf/W3ztQbo9S08EpbK0d+mciCVDLqSSUSNmyY/ A==;
X-CSE-ConnectionGUID: Lsy5sIo2T1qn17Pz4aHZSw==
X-CSE-MsgGUID: oaKT37ioTtSy5x5tbt+I3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25123951"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="25123951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 03:19:20 -0700
X-CSE-ConnectionGUID: cVgqd69qRoqrwqvR1MLKWA==
X-CSE-MsgGUID: HmLBuM5kTFqiN0Sp0WP7iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38275954"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 07 Jun 2024 03:19:10 -0700
Received: from [10.94.248.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9147C27BB3
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 11:19:06 +0100 (IST)
Message-ID: <e15570c2-fb66-486a-87cc-d06577339f0f@intel.com>
Date: Fri, 7 Jun 2024 12:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Allow_CTB_G2H_pr?=
 =?UTF-8?Q?ocessing_without_G2H_IRQ_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240606130639.1504-1-michal.wajdeczko@intel.com>
 <171770452337.24166.6000714511374333556@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171770452337.24166.6000714511374333556@a6498e030952>
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



On 06.06.2024 22:08, Patchwork wrote:
> == Series Details ==
> 
> Series: Allow CTB G2H processing without G2H IRQ (rev2)
> URL   : https://patchwork.freedesktop.org/series/134523/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03_full -> xe-pw-134523v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134523v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134523v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-134523v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated

> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

(kms_pipe_crc_basic:915) igt_core-INFO: [cmd] rtcwake: wakeup from "mem"
using /dev/rtc0 at Thu Jun  6 19:28:09 2024
(kms_pipe_crc_basic:915) igt_core-WARNING: [cmd] rtcwake: write error
(kms_pipe_crc_basic:915) igt_aux-WARNING: rtcwake failed with 1

failures:
  last_failed_dev:	0000:00:1f.6
			0000:00:1f.6
  last_failed_errno:	-2
			-2
  last_failed_step:	suspend
			suspend

> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][2] -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

<3> [72.375275] xe 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x2 ->
0x0)
<4> [72.375364] ------------[ cut here ]------------
<4> [72.375372] xe 0000:00:02.0: Unexpected DBuf power power state
(0x00000000, expected 0x00000001)

> 
>   
> #### Warnings ####
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     [DMESG-WARN][4] ([Intel XE#1214]) -> [DMESG-WARN][5] +1 other test dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - {shard-lnl}:        NOTRUN -> [DMESG-WARN][6] +2 other tests dmesg-warn
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-1/igt@core_hotunplug@hotunplug-rescan.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>     - {shard-lnl}:        [PASS][7] -> [FAIL][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
> 
>   * {igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0}:
>     - shard-adlp:         NOTRUN -> [WARN][9] +1 other test warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - {shard-lnl}:        NOTRUN -> [DMESG-FAIL][10]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134523v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#660])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] ([Intel XE#1214] / [Intel XE#324]) +2 other tests dmesg-warn
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][14] ([Intel XE#1204])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124] / [Intel XE#1201])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][16] ([Intel XE#1231])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#610])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#367])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#787]) +29 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#307])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#308])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#323])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     [PASS][28] -> [DMESG-WARN][29] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][30] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#776])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#703])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1138] / [Intel XE#1201])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1135] / [Intel XE#1201])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#310])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][36] ([Intel XE#1195]) +1 other test incomplete
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#656]) +23 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#651]) +12 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][39] ([Intel XE#1861]) +1 other test fail
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#653])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#455]) +20 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][43] ([Intel XE#2028])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane@pixel-format-source-clamping:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][44] ([Intel XE#1035] / [Intel XE#1195])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][45] ([Intel XE#1608] / [Intel XE#2034]) +1 other test dmesg-fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#361]) +2 other tests fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_pm_rpm@legacy-planes-dpms.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1122] / [Intel XE#1201])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][54] ([Intel XE#294]) +1 other test fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-adlp:         NOTRUN -> [FAIL][55] ([Intel XE#1874]) +3 other tests fail
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#362])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][58] ([Intel XE#1608]) +6 other tests dmesg-fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#1932])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_ccs@block-copy-compressed-inc-dimension:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@xe_ccs@block-copy-compressed-inc-dimension.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#1447])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1126] / [Intel XE#1201])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [PASS][63] -> [INCOMPLETE][64] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-464/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#261]) +5 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][66] -> [TIMEOUT][67] ([Intel XE#1473])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-small:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@xe_evict@evict-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-simple:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#688])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-simple.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#1392]) +7 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#1081])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_exec_threads@threads-hang-rebind-err:
>     - shard-dg2-set2:     [PASS][75] -> [FAIL][76] ([Intel XE#1256]) +1 other test fail
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind-err.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-464/igt@xe_exec_threads@threads-hang-rebind-err.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#378])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#1948])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@xe_pm@d3hot-mmap-vram.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][80] -> [DMESG-WARN][81] ([Intel XE#1214]) +1 other test dmesg-warn
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@xe_query@multigpu-query-invalid-query.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][83] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][85] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][86] +9 other tests pass
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][87] ([Intel XE#282]) -> [PASS][88] +1 other test pass
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - {shard-lnl}:        [FAIL][89] -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@single-bo@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][91] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-434/igt@kms_cursor_legacy@single-bo@pipe-a.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-435/igt@kms_cursor_legacy@single-bo@pipe-a.html
> 
>   * igt@kms_flip@wf_vblank-ts-check:
>     - {shard-lnl}:        [FAIL][93] ([Intel XE#480] / [Intel XE#886]) -> [PASS][94] +1 other test pass
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - {shard-lnl}:        [FAIL][95] ([Intel XE#1430]) -> [PASS][96]
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms:
>     - {shard-lnl}:        [SKIP][97] ([Intel XE#1211]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-1/igt@kms_pm_rpm@legacy-planes-dpms.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-7/igt@kms_pm_rpm@legacy-planes-dpms.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - {shard-lnl}:        [INCOMPLETE][99] -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
>     - {shard-lnl}:        [INCOMPLETE][101] ([Intel XE#1330]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-2/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][103] ([Intel XE#1761]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-invalid-fault:
>     - {shard-lnl}:        [DMESG-WARN][105] ([Intel XE#1638]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-8/igt@xe_exec_fault_mode@many-invalid-fault.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [FAIL][107] ([Intel XE#1414]) -> [PASS][108]
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - {shard-lnl}:        [FAIL][109] ([Intel XE#1045]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-2/igt@xe_gt_freq@freq_low_max.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-1/igt@xe_gt_freq@freq_low_max.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [DMESG-WARN][111] ([Intel XE#1214]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - shard-adlp:         [FAIL][113] ([Intel XE#958]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-9/igt@xe_pm_residency@toggle-gt-c6.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
>     - {shard-lnl}:        [FAIL][115] ([Intel XE#958]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   * igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
>     - {shard-lnl}:        [FAIL][117] ([Intel XE#1081]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-lnl-3/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-lnl-8/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][119] ([Intel XE#1033] / [Intel XE#1214]) -> [DMESG-WARN][120] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#316]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][124] ([Intel XE#316]) +5 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][125] ([Intel XE#324]) -> [FAIL][126] ([Intel XE#1204])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][127] ([Intel XE#1231]) -> [DMESG-FAIL][128] ([Intel XE#324])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#1124]) -> [SKIP][130] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][132] ([Intel XE#1124]) +11 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#367]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#367])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][136] ([Intel XE#367]) +2 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][138] ([Intel XE#787]) +69 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#787]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][142] ([Intel XE#1252])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][146] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][148] ([Intel XE#314])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#306]) -> [SKIP][150] ([Intel XE#1201] / [Intel XE#306])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][152] ([Intel XE#306])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_chamelium_color@degamma.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-multiple:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#373]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-multiple.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_chamelium_frames@hdmi-crc-multiple.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][156] ([Intel XE#373]) +11 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#308]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x512.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][160] ([Intel XE#308])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [INCOMPLETE][161] ([Intel XE#1195]) -> [DMESG-WARN][162] ([Intel XE#1214] / [Intel XE#282])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][164] ([Intel XE#323]) +1 other test skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][165] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][166] ([Intel XE#282]) +9 other tests dmesg-warn
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][167] ([Intel XE#282]) -> [DMESG-WARN][168] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@single-bo:
>     - shard-dg2-set2:     [DMESG-WARN][169] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877]) -> [DMESG-WARN][170] ([Intel XE#1214] / [Intel XE#282])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-434/igt@kms_cursor_legacy@single-bo.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-435/igt@kms_cursor_legacy@single-bo.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#455] / [Intel XE#929]) -> [SKIP][172] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1927]) -> [SKIP][174] ([Intel XE#1201] / [Intel XE#1927])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][175] ([i915#3804]) -> [SKIP][176] ([Intel XE#1201] / [i915#3804])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][178] ([Intel XE#776])
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][180] ([Intel XE#1135]) +1 other test skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_feature_discovery@psr1.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [DMESG-FAIL][181] ([Intel XE#1608]) -> [INCOMPLETE][182] ([Intel XE#1195] / [Intel XE#927])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-adlp:         [DMESG-FAIL][183] ([Intel XE#1608]) -> [INCOMPLETE][184] ([Intel XE#1195])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][186] ([Intel XE#455]) +15 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#651]) -> [SKIP][188] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][190] ([Intel XE#651]) +30 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#653]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#653]) +13 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][194] ([Intel XE#653]) +29 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][196] ([Intel XE#605])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#455]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-adlp:         [INCOMPLETE][199] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-FAIL][200] ([Intel XE#1608])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][201] ([Intel XE#1195]) -> [DMESG-FAIL][202] ([Intel XE#1608])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][204] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][206] ([Intel XE#498]) +2 other tests skip
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][208] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#498]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#305]) -> [SKIP][212] ([Intel XE#305]) +2 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) -> [SKIP][214] ([Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#305]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#870]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#870])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][222] ([Intel XE#1129])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#929]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][226] ([Intel XE#1122])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][228] ([Intel XE#929]) +18 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_psr@fbc-psr2-sprite-plane-move.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][230] ([Intel XE#1127])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][232] ([Intel XE#327]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-adlp:         [INCOMPLETE][233] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-FAIL][234] ([Intel XE#1608])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][235] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-FAIL][236] ([Intel XE#1608])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#756]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#756])
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#1091]) -> [SKIP][240] ([Intel XE#1091] / [Intel XE#1201])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][242] ([Intel XE#1280] / [Intel XE#455]) +3 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][244] ([Intel XE#1123])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0x369.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#1126]) -> [SKIP][246] ([Intel XE#1126] / [Intel XE#1201])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][247] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [DMESG-FAIL][248] ([Intel XE#482])
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][250] ([Intel XE#288]) +23 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     [SKIP][251] ([Intel XE#288]) -> [SKIP][252] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#255]) -> [SKIP][254] ([Intel XE#255])
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - shard-adlp:         [FAIL][255] ([Intel XE#1999]) -> [SKIP][256] ([Intel XE#1192] / [Intel XE#1201])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-6/igt@xe_live_ktest@xe_mocs.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-4/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#977]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#977])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][259] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][260] ([Intel XE#979])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#366]) -> [SKIP][262] ([Intel XE#1201] / [Intel XE#366])
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-vm-bind-userptr:
>     - shard-adlp:         [INCOMPLETE][263] ([Intel XE#1195]) -> [DMESG-FAIL][264] ([Intel XE#1608] / [Intel XE#2034])
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-userptr.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-adlp:         [INCOMPLETE][265] ([Intel XE#1195] / [Intel XE#1358]) -> [DMESG-FAIL][266] ([Intel XE#1608])
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-9/igt@xe_pm@s3-basic-exec.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-8/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][267] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][268] ([Intel XE#366]) +1 other test skip
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [DMESG-WARN][269] ([Intel XE#1214]) -> [ABORT][270] ([Intel XE#1358])
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [DMESG-WARN][271] ([Intel XE#1214]) -> [INCOMPLETE][272] ([Intel XE#1195])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][274] ([Intel XE#944]) +3 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-433/igt@xe_query@multigpu-query-engines.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     [SKIP][275] ([Intel XE#944]) -> [SKIP][276] ([Intel XE#1201] / [Intel XE#944])
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-FAIL][277] ([Intel XE#1760]) -> [DMESG-WARN][278] ([Intel XE#1214] / [Intel XE#1760])
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-adlp:         [DMESG-FAIL][279] ([Intel XE#1760]) -> [DMESG-WARN][280] ([Intel XE#1214] / [Intel XE#1760])
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>   [Intel XE#1817]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1817
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1927
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>   [Intel XE#2023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2023
>   [Intel XE#2024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2024
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034
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
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03 -> xe-pw-134523v2
> 
>   IGT_7879: 08560f766a505e729dfee2846c1c11d28dd0e3d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1408-b8a4e08086ace055e193245cd77a6182936d9f03: b8a4e08086ace055e193245cd77a6182936d9f03
>   xe-pw-134523v2: 134523v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134523v2/index.html
> 
