Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5751EC3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 13:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945F410E3A7;
	Mon, 15 Jul 2024 13:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7fhUWSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D792510E3A4;
 Mon, 15 Jul 2024 13:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721048708; x=1752584708;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xX1WJ2YCeeVjWPBYITA9b+Izs/G45vQ2I06bHjKyjcQ=;
 b=h7fhUWSgE8MQAmgmy6poKhHMZwRT9/1FqwX9qBjiEp8XyJnboXcT1LVU
 ywQoP2Fo4QekrMLgj20P+rSwcy8Y53S1hys1rbIHLlVngWH5X1D6Qijh8
 ljTYhP7rp/DYbD6j2n6MrYMtrPmURHYQlPFsvCmYTMtVoHZ3hq/Y72PWW
 KoxbA0FxZjbXdYl+z1k2xpUoxjT2vm3kG/jbPzaoWipmqZtYH2nVSe7PB
 ccub8eQ2CbQI0UcndTVfEoMKtf9pWJ8FLv/FwGdj28X742whi9zwAfKDV
 NS7DIR+OQ3VaXLWj9Dc98DhGD8xSwy/d8Ue95JS9WNfuT7UgZ1Vw3aa6Y A==;
X-CSE-ConnectionGUID: SmH9TZgkRNe7MAz4bIwKaA==
X-CSE-MsgGUID: UpJ0+ayDT2ymQ5WF7JTQtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="21338893"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="21338893"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 06:05:06 -0700
X-CSE-ConnectionGUID: TYvxqMQXQPCCxElFJedJSg==
X-CSE-MsgGUID: 6xG4qZ45T/yT31+u9VDS5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49505680"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 15 Jul 2024 06:05:02 -0700
Received: from [10.94.248.120] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.120])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DD0F332C91;
 Mon, 15 Jul 2024 14:04:59 +0100 (IST)
Message-ID: <ac3b8d1f-b73f-4a46-954d-13b293dbde0a@intel.com>
Date: Mon, 15 Jul 2024 15:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/vf=3A_Tra?=
 =?UTF-8?Q?ck_writes_to_inaccessible_registers_from_VF_=28rev3=29?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240713142643.1242-1-michal.wajdeczko@intel.com>
 <172088716984.199580.5634502246605499494@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172088716984.199580.5634502246605499494@2413ebb6fbb6>
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



On 13.07.2024 18:12, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/vf: Track writes to inaccessible registers from VF (rev3)
> URL   : https://patchwork.freedesktop.org/series/135295/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678_full -> xe-pw-135295v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135295v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135295v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135295v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

must be unrelated as all below 'regressions' were seen on the platforms
that have no has_sriov flag set, while series touches only VF code

> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

(kms_frontbuffer_tracking:1731) CRITICAL: Test assertion failure
function do_status_assertions, file
../../../usr/src/igt-gpu-tools/tests/intel/kms_frontbuffer_tracking.c:2719:
(kms_frontbuffer_tracking:1731) CRITICAL: Failed assertion:
fbc_wait_for_compression()

> 
>   * igt@xe_exec_reset@close-fd:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-lnl-1/igt@xe_exec_reset@close-fd.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-8/igt@xe_exec_reset@close-fd.html

<1> [122.689977] BUG: kernel NULL pointer dereference, address:
0000000000000058
<1> [122.690019] #PF: supervisor read access in kernel mode
<1> [122.690046] #PF: error_code(0x0000) - not-present page
<6> [122.690074] PGD 117b2a067 P4D 117b2a067 PUD 0
<4> [122.690101] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
<4> [122.690128] CPU: 3 PID: 898 Comm: kworker/u32:10 Tainted: G     U
          6.10.0-rc7-xe #1
<4> [122.690171] Hardware name: Intel Corporation Lunar Lake Client
Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3220.D84.2406180657 06/18/2024
<4> [122.690264] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
<4> [122.690321] RIP: 0010:guc_exec_queue_timedout_job+0xc4/0xc60 [xe]

> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-dg2-set2:     [PASS][5] -> [ABORT][6] +2 other tests abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-463/igt@xe_exec_reset@gt-reset-stress.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html

Subtest gt-reset-stress: SUCCESS (1.028s)

This test caused an abort condition: Lockdep not active

<4> [184.203352] Oops: general protection fault, probably for
non-canonical address 0x6b6b6b6b6b6b6bc3: 0000 [#1] PREEMPT SMP NOPTI
<4> [184.203359] CPU: 9 PID: 1022 Comm: kworker/u80:68 Tainted: G     U
           6.10.0-rc7-xe #1
<4> [184.203362] Hardware name: Micro-Star International Co., Ltd.
MS-7D25/PRO Z690-A DDR4(MS-7D25), BIOS 1.10 12/13/2021
<4> [184.203365] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
<4> [184.203371] RIP: 0010:guc_exec_queue_timedout_job+0xc4/0xc60 [xe]

> 
>   * igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:
>     - shard-lnl:          NOTRUN -> [ABORT][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html

Subtest mmap-style-bind-either-side-partial-split-page-hammer: SUCCESS
(0.499s)

This test caused an abort condition: Lockdep not active

<1> [269.643471] BUG: kernel NULL pointer dereference, address:
0000000000000058
<1> [269.643486] #PF: supervisor read access in kernel mode
<1> [269.643493] #PF: error_code(0x0000) - not-present page
<6> [269.643498] PGD 0 P4D 0
<4> [269.643505] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
<4> [269.643512] CPU: 3 PID: 829 Comm: kworker/u32:58 Tainted: G     U
          6.10.0-rc7-xe #1
<4> [269.643521] Hardware name: Intel Corporation Lunar Lake Client
Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3220.D84.2406180657 06/18/2024
<4> [269.643529] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
<4> [269.643542] RIP: 0010:guc_exec_queue_timedout_job+0xc4/0xc60 [xe]

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135295v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#1659])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +4 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-6/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][14] ([Intel XE#1204])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][15] ([Intel XE#1231]) +2 other tests fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +10 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#610])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#346])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#367])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +21 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#787]) +32 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1399]) +14 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#1252]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#1252])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#306])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-436/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#373]) +7 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@dp-crc-single:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@kms_chamelium_frames@dp-crc-single.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#307])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#307])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@kms_content_protection@lic-type-1.html
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#599]) +6 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-4/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1413]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#308])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1424]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#323]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#309]) +5 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#323])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-dg2-set2:     [PASS][43] -> [DMESG-WARN][44] ([Intel XE#877]) +1 other test dmesg-warn
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-466/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-434/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#702])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#310])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1421]) +3 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-edp1:
>     - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#886]) +1 other test fail
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1397] / [Intel XE#1745])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1397])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1401]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#352])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-5/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#651]) +10 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#656]) +13 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][58] ([Intel XE#1861]) +1 other test fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1469])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#651]) +9 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#656]) +26 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_getfb@getfb2-accept-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#1339])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_getfb@getfb2-accept-ccs.html
> 
>   * igt@kms_hdmi_inject@inject-4k:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1470])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][67] -> [DMESG-WARN][68] ([Intel XE#2019])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          NOTRUN -> [DMESG-FAIL][69] ([Intel XE#324])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#305]) +7 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c-edp-1.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1439])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#1489])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-463/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@plane-move-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1122] / [Intel XE#1201])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-cursor-render:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_psr@fbc-pr-cursor-render.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_psr@pr-primary-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1406]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-5/igt@kms_psr@pr-primary-blt.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1149] / [Intel XE#1201])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1127])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#327])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-270.html
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1437])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1435])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-4/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-adlp:         NOTRUN -> [FAIL][83] ([Intel XE#1174])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#330])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [PASS][85] -> [FAIL][86] ([Intel XE#771] / [Intel XE#899])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#899]) +1 other test fail
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][89] -> [FAIL][90] ([Intel XE#899]) +1 other test fail
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1091])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_ccs@block-multicopy-inplace:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@xe_ccs@block-multicopy-inplace.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1123] / [Intel XE#1201])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#688]) +6 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-6/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][95] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#261]) +4 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@xe_evict@evict-small-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#688])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#1392]) +5 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-null-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1392]) +7 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-rebind-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#378])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-6/igt@xe_module_load@force-load.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#379])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#977])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1061] / [Intel XE#1201])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#366])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][108] ([Intel XE#569])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@xe_pm@s3-vm-bind-prefetch.html
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#584]) +1 other test skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-4/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][110] ([Intel XE#1551] / [Intel XE#569])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-463/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [PASS][111] -> [ABORT][112] ([Intel XE#1794]) +1 other test abort
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-adlp-6/igt@xe_pm@s4-mocs.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-9/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [PASS][113] -> [ABORT][114] ([Intel XE#1358] / [Intel XE#1794])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-4/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#944])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-463/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#944])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@xe_query@multigpu-query-topology.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-lnl:          [FAIL][118] ([Intel XE#827]) -> [PASS][119] +1 other test pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-lnl-8/igt@kms_async_flips@alternate-sync-async-flip.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-6/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][120] ([Intel XE#1033]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64:
>     - shard-dg2-set2:     [INCOMPLETE][122] ([Intel XE#1195]) -> [PASS][123] +1 other test pass
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-64x64.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-adlp:         [INCOMPLETE][124] ([Intel XE#1195]) -> [PASS][125]
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@single-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][126] ([Intel XE#877]) -> [PASS][127] +1 other test pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-464/igt@kms_cursor_legacy@single-move@pipe-a.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-463/igt@kms_cursor_legacy@single-move@pipe-a.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][128] ([Intel XE#2019]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-edp1:
>     - shard-lnl:          [FAIL][130] ([Intel XE#886]) -> [PASS][131] +3 other tests pass
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-lnl-1/igt@kms_flip@blocking-wf_vblank@a-edp1.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-5/igt@kms_flip@blocking-wf_vblank@a-edp1.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][132] ([Intel XE#1162]) -> [PASS][133]
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [DMESG-FAIL][134] ([Intel XE#324]) -> [PASS][135] +1 other test pass
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-lnl-8/igt@kms_plane@plane-position-hole.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-5/igt@kms_plane@plane-position-hole.html
> 
>   * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3}:
>     - shard-lnl:          [DMESG-WARN][136] ([Intel XE#324]) -> [PASS][137] +3 other tests pass
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][138] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@once-userptr:
>     - shard-adlp:         [DMESG-WARN][140] -> [PASS][141] +1 other test pass
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-adlp-4/igt@xe_exec_basic@once-userptr.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-2/igt@xe_exec_basic@once-userptr.html
> 
>   * igt@xe_exec_reset@parallel-cat-error:
>     - shard-adlp:         [DMESG-WARN][142] ([Intel XE#358]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-adlp-4/igt@xe_exec_reset@parallel-cat-error.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-2/igt@xe_exec_reset@parallel-cat-error.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
>     - shard-dg2-set2:     [ABORT][144] -> [PASS][145] +1 other test pass
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [ABORT][146] ([Intel XE#1358]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-adlp-9/igt@xe_pm@s4-exec-after.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@xe_pm@s4-exec-after.html
>     - shard-lnl:          [ABORT][148] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-lnl-2/igt@xe_pm@s4-exec-after.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-7/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_waitfence@exec_queue-reset-wait:
>     - shard-lnl:          [ABORT][150] -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-lnl-8/igt@xe_waitfence@exec_queue-reset-wait.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-lnl-5/igt@xe_waitfence@exec_queue-reset-wait.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-adlp:         [DMESG-WARN][152] ([Intel XE#1760]) -> [DMESG-WARN][153] ([Intel XE#1330] / [Intel XE#1760])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678/shard-adlp-9/igt@xe_wedged@wedged-at-any-timeout.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/shard-adlp-8/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
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
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678 -> xe-pw-135295v3
> 
>   IGT_7926: 9c28c27d4d48cecf8b7692a2975bde1cc1632096 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1606-95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678: 95bc5b7d7ee2ab9fa2bdd637a957e8cfa8ca2678
>   xe-pw-135295v3: 135295v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v3/index.html
> 
