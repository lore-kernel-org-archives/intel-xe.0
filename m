Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB37C3DA4B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 15:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03EA10E3FB;
	Mon, 15 Jul 2024 15:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCcQd85I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581328914B;
 Mon, 15 Jul 2024 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721056600; x=1752592600;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=S1HmonM54k0AmE6iD8KLQju67y7kxgGFbkGS2Zmjw7Y=;
 b=lCcQd85IXXfG7as5n5xLnTSQL6oi4a9lu4oJXN2G0xxunJIv4q/lor9T
 Pm3bnhAI3HfNqPEG41dvg3nVER9A0X+7lZuX4JMpeV2fWRZqufP5un1yo
 coUbYDWqikZzvGUK8X1Dsv5+BYKzXVHwXcazZTJ0Og7RGzzQyZsVdldvV
 pSf5xoPQTKDm52R2/wTHDoJVo7ypwiQIQ8YRVn+qOZtee65iyFyKs688M
 1hfNj0cNnx+GKjQ0WVWutEWFTLiee8xT4N1afoHU9Cuxg3KZkhnxt6oI6
 7XZ0IuJxte1zH+vTNKlQGxECW2ARfwKtEPTF6f+STqgptbeI6wOQZNFC5 Q==;
X-CSE-ConnectionGUID: ebTGys9cR5e425G4PIDYbA==
X-CSE-MsgGUID: pCIHqUrzTjK1hTytv02yfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22207620"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="22207620"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 08:16:39 -0700
X-CSE-ConnectionGUID: SKRA+LkBSe6NgxWQpivZxQ==
X-CSE-MsgGUID: kAb1wcVwSIeGAoEw7gPNRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="54023175"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 15 Jul 2024 08:16:36 -0700
Received: from [10.94.248.120] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.120])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0ACEF32CA9;
 Mon, 15 Jul 2024 16:16:34 +0100 (IST)
Message-ID: <fefa47c8-2cac-435b-8f1b-17e02c3741ce@intel.com>
Date: Mon, 15 Jul 2024 17:16:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_Res?=
 =?UTF-8?Q?tore_TotalVFs?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240715114052.1330-1-michal.wajdeczko@intel.com>
 <172105161810.231691.10013063413963771160@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172105161810.231691.10013063413963771160@2413ebb6fbb6>
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



On 15.07.2024 15:53, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Restore TotalVFs
> URL   : https://patchwork.freedesktop.org/series/136089/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6_full -> xe-pw-136089v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-136089v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136089v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-136089v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated, change is related to driver cleanup/exit code, while failures
are within test

> 
>   * igt@xe_exec_reset@virtual-close-fd:
>     - shard-adlp:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-6/igt@xe_exec_reset@virtual-close-fd.html

<6> [268.808526] xe 0000:00:02.0: [drm] GT0: Engine reset:
engine_class=vcs, logical_mask: 0x3, guc_id=2
<4> [268.808632] Oops: general protection fault, probably for
non-canonical address 0x6b6b6b6b6b6b6bc3: 0000 [#1] PREEMPT SMP NOPTI
<4> [268.808652] CPU: 6 PID: 1291 Comm: kworker/u80:89 Tainted: G     U
           6.10.0-rc7-xe #1
<4> [268.808664] Hardware name: Intel Corporation Alder Lake Client
Platform/AlderLake-P DDR5 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723
01/20/2023
<4> [268.808678] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
<4> [268.808691] RIP: 0010:guc_exec_queue_timedout_job+0xc4/0xc60 [xe]

> 
>   * igt@xe_gt_freq@freq_range_exec:
>     - shard-adlp:         [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-1/igt@xe_gt_freq@freq_range_exec.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-6/igt@xe_gt_freq@freq_range_exec.html

<4> [201.434726] Oops: general protection fault, probably for
non-canonical address 0x74756d5f74735f64: 0000 [#1] PREEMPT SMP NOPTI
<4> [201.434748] CPU: 9 PID: 1078 Comm: kworker/u80:57 Tainted: G     U
           6.10.0-rc7-xe #1
<4> [201.434762] Hardware name: Intel Corporation Alder Lake Client
Platform/AlderLake-P DDR5 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723
01/20/2023
<4> [201.434785] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
<4> [201.434802] RIP: 0010:get_pid_task+0x62/0x180

> 
>   
> #### Warnings ####
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][4] ([Intel XE#2105]) -> [ABORT][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136089v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1466])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#660])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#1033])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>     - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#324])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#1407])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-6/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1467])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#367])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1399]) +9 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#306])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-read.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#373]) +5 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#307])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-1/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#599]) +2 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-8/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1424]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#308]) +2 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64:
>     - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1195]) +1 other test incomplete
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#309])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-lnl:          [PASS][32] -> [DMESG-WARN][33] ([Intel XE#877]) +1 other test dmesg-warn
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1138])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1421]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#310])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1397] / [Intel XE#1745])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1397])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1401]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#352])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_force_connector_basic@force-connector-state.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#651]) +3 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#656]) +16 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-suspend:
>     - shard-lnl:          [PASS][44] -> [INCOMPLETE][45] ([Intel XE#2050])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#656]) +6 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#356])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane@plane-position-hole-dpms:
>     - shard-lnl:          [PASS][49] -> [DMESG-WARN][50] ([Intel XE#324])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#498]) +3 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#305]) +3 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c-edp-1.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          NOTRUN -> [FAIL][55] ([Intel XE#718])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         NOTRUN -> [FAIL][56] ([Intel XE#718])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1406]) +2 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#929])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - shard-lnl:          [PASS][60] -> [FAIL][61] ([Intel XE#899]) +1 other test fail
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#756])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-8/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#1447])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][64] -> [INCOMPLETE][65] ([Intel XE#1195] / [Intel XE#1473])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#688]) +2 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-1/igt@xe_evict@evict-cm-threads-small.html
> 
>   * igt@xe_evict@evict-cm-threads-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#261])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-6/igt@xe_evict@evict-cm-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][68] -> [TIMEOUT][69] ([Intel XE#1473] / [Intel XE#392])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#688])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#1392]) +2 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-8/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#288]) +4 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
> 
>   * igt@xe_mmap@vram:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1416])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-1/igt@xe_mmap@vram.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#979])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#366])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-8/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [PASS][77] -> [ABORT][78] ([Intel XE#1358] / [Intel XE#1794])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-1/igt@xe_pm@s4-multiple-execs.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][79] -> [ABORT][80] ([Intel XE#1794])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-lnl:          [PASS][81] -> [ABORT][82] ([Intel XE#1794])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][83] ([Intel XE#1033]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-lnl:          [FAIL][85] ([Intel XE#1659]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - shard-lnl:          [DMESG-WARN][87] ([Intel XE#2052]) -> [PASS][88] +1 other test pass
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-7/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [ABORT][89] ([Intel XE#1553]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [ABORT][91] -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [DMESG-WARN][93] ([Intel XE#1553]) -> [PASS][94]
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@b-edp1:
>     - shard-lnl:          [FAIL][95] ([Intel XE#886]) -> [PASS][96] +2 other tests pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][97] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][98]
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][99] ([Intel XE#1473]) -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@once-userptr:
>     - shard-adlp:         [DMESG-WARN][101] -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-4/igt@xe_exec_basic@once-userptr.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-2/igt@xe_exec_basic@once-userptr.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-adlp:         [ABORT][103] -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_exec_reset@parallel-cat-error:
>     - shard-adlp:         [DMESG-WARN][105] ([Intel XE#358]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-4/igt@xe_exec_reset@parallel-cat-error.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-2/igt@xe_exec_reset@parallel-cat-error.html
> 
>   * igt@xe_pm@s2idle-exec-after:
>     - shard-lnl:          [INCOMPLETE][107] ([Intel XE#1358]) -> [PASS][108]
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-5/igt@xe_pm@s2idle-exec-after.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-1/igt@xe_pm@s2idle-exec-after.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-lnl:          [ABORT][109] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-lnl-8/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [ABORT][111] ([Intel XE#1794]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][113] ([Intel XE#1033]) -> [DMESG-WARN][114] ([Intel XE#1033] / [Intel XE#324])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][116] ([Intel XE#1729])
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [DMESG-WARN][117] ([Intel XE#1760]) -> [DMESG-WARN][118] ([Intel XE#1330] / [Intel XE#1760])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6/shard-adlp-1/igt@xe_wedged@wedged-at-any-timeout.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/shard-adlp-9/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6 -> xe-pw-136089v1
> 
>   IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1610-2a1af781369347d1a4077a51f32c331cba1589b6: 2a1af781369347d1a4077a51f32c331cba1589b6
>   xe-pw-136089v1: 136089v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136089v1/index.html
> 
