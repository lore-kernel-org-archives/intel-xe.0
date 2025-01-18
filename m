Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF1C02185
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 23:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709CA10E217;
	Sat, 18 Jan 2025 23:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZPzF+2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAADD10E03A;
 Sat, 18 Jan 2025 23:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737241729; x=1768777729;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WRXZ7UdQV/Mf/YxuYZ99XcZYkkL0+fxYj6IuxnNGLkQ=;
 b=kZPzF+2sy01zdmiLxekQiPtbc55PBqroynua/hC1TZLe5q+9c/iUnDUP
 36PlEy/AsT7BHiJa2ImpLBpfT0YePPjbRVSAV0rF7KaEndIEqG0H7CYBs
 ACDSEFgFFrvE0eCgeeOnU/kkMsWMDnexenVhstN7AYObsWJrPcvHss316
 aLtss2oWQfZaGwCXEKjNyUPHP3f+3ZE80tzC6WXXPd3JPDqMNp2NdVYju
 gMg6++qdUlYnHRxzgNZQl+k+hmbTWMw3CHMVPpyfxW06xoc/yr6zJGYLF
 VUSINzWCDZGq6nbb6LqS5mx/QHRQTA5ZcWK4TXFFFrp0gvTJ9FNMVu6O2 w==;
X-CSE-ConnectionGUID: BEzIdDBkRautkIA7Z0WVdQ==
X-CSE-MsgGUID: /0gTZPmdRuSMXgtNAJK8Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="25243404"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; d="scan'208";a="25243404"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2025 15:08:48 -0800
X-CSE-ConnectionGUID: E7nzzTP7RGyz9kIzYKMbHg==
X-CSE-MsgGUID: ospZcFTdTGq62/YcYZTHAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111235255"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 18 Jan 2025 15:08:46 -0800
Received: from [10.245.96.215] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4537232EA8;
 Sat, 18 Jan 2025 23:08:45 +0000 (GMT)
Message-ID: <582004f8-d3b2-4ada-9c7b-e75323ce39cc@intel.com>
Date: Sun, 19 Jan 2025 00:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBUaGUgeGVfc2Ff?=
 =?UTF-8?Q?manager_based_GuC_Buffer_Cache_=28rev3=29?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241220194205.995-1-michal.wajdeczko@intel.com>
 <173690755415.3792291.15182563029458684105@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173690755415.3792291.15182563029458684105@b555e5b46a47>
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



On 15.01.2025 03:19, Patchwork wrote:
> == Series Details ==
> 
> Series: The xe_sa_manager based GuC Buffer Cache (rev3)
> URL   : https://patchwork.freedesktop.org/series/142458/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2486-172fa6a9ff822aef630db23984a76f7984698198_full -> xe-pw-142458v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-142458v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-142458v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-142458v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142458v3/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-dg2-set2:     [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2486-172fa6a9ff822aef630db23984a76f7984698198/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142458v3/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2486-172fa6a9ff822aef630db23984a76f7984698198/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142458v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][6] +2 other tests fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142458v3/shard-dg2-432/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp2:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][7] +1 other test abort
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142458v3/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp2.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-c-dp-4:
>     - shard-dg2-set2:     [PASS][8] -> [DMESG-WARN][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2486-172fa6a9ff822aef630db23984a76f7984698198/shard-dg2-434/igt@kms_plane_lowres@tiling-4@pipe-c-dp-4.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142458v3/shard-dg2-434/igt@kms_plane_lowres@tiling-4@pipe-c-dp-4.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] +1 other test incomplete
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2486-172fa6a9ff822aef630db23984a76f7984698198/shard-dg2-433/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142458v3/shard-dg2-464/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

all above are unrelated

> 
>   * igt@xe_module_load@many-reload:
>     - shard-bmg:          [PASS][12] -> [ABORT][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2486-172fa6a9ff822aef630db23984a76f7984698198/shard-bmg-2/igt@xe_module_load@many-reload.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142458v3/shard-bmg-6/igt@xe_module_load@many-reload.html

this looks serious but it's also unrelated

<4> [201.260763] Oops: general protection fault, probably for
non-canonical address 0x6b6b6b6b6b6b6b6b: 0000 [#1] PREEMPT SMP NOPTI
<4> [201.260782] CPU: 12 UID: 0 PID: 3932 Comm: kworker/u64:108 Tainted:
G        W          6.13.0-rc7-xe+ #1
<4> [201.260793] Tainted: [W]=WARN
<4> [201.260796] Hardware name: ASUS System Product Name/PRIME Z790-P
WIFI, BIOS 1656 04/18/2024
<4> [201.260804] Workqueue: xe-dp i915_digport_work_func [xe]
<4> [201.260981] RIP: 0010:drm_dp_dpcd_access+0xbf/0x160
[drm_display_helper]
<4> [201.261007] Code: d2 74 19 83 fa 92 74 14 ba 02 00 00 00 be 58 02
00 00 bf f4 01 00 00 e8 df a9 d7 e1 49 8b 87 68 08 00 00 48 8d 75 b8 4c
89 ff <ff> d0 0f 1f 00 89 c2 85 c0 78 be f6 45 bd 03 74 a8 ba fb ff ff ff
<4> [201.261019] RSP: 0018:ffffc900055cbc88 EFLAGS: 00010246
<4> [201.261025] RAX: 6b6b6b6b6b6b6b6b RBX: 0000000000000003 RCX:
0000000000000000
<4> [201.261032] RDX: 0000000000000000 RSI: ffffc900055cbc90 RDI:
ffff88813eb82350
<4> [201.261037] RBP: ffffc900055cbcd8 R08: 0000000000000000 R09:
0000000000000000
<4> [201.261043] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000001
<4> [201.261049] R13: ffff88813eb82ad8 R14: 00000000fffffffa R15:
ffff88813eb82350
<4> [201.261055] FS:  0000000000000000(0000) GS:ffff88885f200000(0000)
knlGS:0000000000000000
<4> [201.261062] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [201.261068] CR2: 000076a2989a7f70 CR3: 000000014e0b0006 CR4:
0000000000f72ef0
<4> [201.261075] PKRU: 55555554
<4> [201.261079] Call Trace:
<4> [201.261082]  <TASK>
<4> [201.261086]  ? show_regs+0x6c/0x80
<4> [201.261094]  ? die_addr+0x37/0xa0
<4> [201.261100]  ? exc_general_protection+0x1c1/0x440
<4> [201.261110]  ? asm_exc_general_protection+0x27/0x30
<4> [201.261121]  ? drm_dp_dpcd_access+0xbf/0x160 [drm_display_helper]
<4> [201.261144]  ? drm_dp_dpcd_access+0xb1/0x160 [drm_display_helper]
<4> [201.261167]  drm_dp_dpcd_probe+0x41/0x100 [drm_display_helper]
<4> [201.261190]  intel_dp_read_dprx_caps+0x85/0xa0 [xe]
<4> [201.261330]  intel_dp_hpd_pulse+0xb6/0x6a0 [xe]
<4> [201.261449]  i915_digport_work_func+0xc9/0x170 [xe]
<4> [201.261553]  process_one_work+0x21c/0x740
<4> [201.261561]  worker_thread+0x1db/0x3c0
<4> [201.261566]  ? __pfx_worker_thread+0x10/0x10
<4> [201.261571]  kthread+0xf3/0x130
<4> [201.261575]  ? __pfx_kthread+0x10/0x10
<4> [201.261579]  ret_from_fork+0x44/0x70
<4> [201.261584]  ? __pfx_kthread+0x10/0x10
<4> [201.261588]  ret_from_fork_asm+0x1a/0x30
<4> [201.261594]  </TASK>



