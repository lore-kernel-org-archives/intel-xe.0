Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F585CD128A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 09:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191E210EF8F;
	Thu, 11 Apr 2024 09:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsVKWO19";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E1310EF9C
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 09:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712827627; x=1744363627;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ALE7nJRM+08zGSvcM2T4shRk9EHuojotYumSuzIowDM=;
 b=dsVKWO19RzGY0wztmW3l9NWdnXvW+O0BabETFGEbGXx2btXgpmwoAHT1
 c02wgx9dVHhYmKrnUCzldmiNTnm2GCe6x0fzFvmv0W0wa77orqUytZDEn
 RezWl67Fj/Het2VDlEMptLCajcqLyNBuNziJt+Bps0YTOwbpGwLxbGy79
 DStxWZ2N7uBKMFbXHpbU1vZ9TJSYdpCvR/elNZzHufM0+8eBGY8LCVYSl
 mujFN6IaU9dmCPH7vxrYxTQ81aWYncoYAIMZMexCSoydJ53nV4vscnuLv
 sPM2R3PV894U+MCfwUF9B+aQzaOVYVF6cx0eXLOLICmDS3poxVYB6gp3Z A==;
X-CSE-ConnectionGUID: Ef/H8NOcQnyGhr3GF0cHdg==
X-CSE-MsgGUID: 958X7x5CTNuZO6RegoF3uA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8103791"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8103791"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 02:27:07 -0700
X-CSE-ConnectionGUID: J2qupAvfRT2dqC9wCii5HA==
X-CSE-MsgGUID: mdFnPmCCTLSDkj4Hi7VxhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25326049"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 11 Apr 2024 02:27:00 -0700
Received: from [10.252.43.192] (mwajdecz-MOBL.ger.corp.intel.com
 [10.252.43.192])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 3858527BBC
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 10:26:53 +0100 (IST)
Message-ID: <ca6ebc13-0972-42c6-8f29-ca3a61806887@intel.com>
Date: Thu, 11 Apr 2024 11:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_PF=3A_Add_suppor?=
 =?UTF-8?Q?t_to_configure_GuC_SR-IOV_policies_=28rev2=29?=
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20240410170338.1199-1-michal.wajdeczko@intel.com>
 <171280020465.1338936.10408015358899452102@8e613ede5ea5>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171280020465.1338936.10408015358899452102@8e613ede5ea5>
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



On 11.04.2024 03:50, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: Add support to configure GuC SR-IOV policies (rev2)
> URL   : https://patchwork.freedesktop.org/series/132271/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9_full -> xe-pw-132271v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-132271v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-132271v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-132271v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-adlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

unrelated, actual problems started much earlier:

<7>[  263.854271] [IGT] xe_exec_balancer: starting subtest
many-execqueues-virtual-userptr-invalidate-race
<3>[  264.104151] xe 0000:00:02.0: [drm] *ERROR* GT0: TLB invalidation
time'd out, seqno=7, recv=2

followed by series of restarts

<4>[  266.572154] xe 0000:00:02.0: [drm] Pending enable failed to respond
<6>[  266.572979] xe 0000:00:02.0: [drm] GT0: trying reset
<6>[  266.573652] xe 0000:00:02.0: [drm] GT0: reset queued
<6>[  266.573848] xe 0000:00:02.0: [drm] GT0: reset started
...
<6>[  266.816625] xe 0000:00:02.0: [drm] GT0: GuC load failed: status =
0x400000A0
<6>[  266.816649] xe 0000:00:02.0: [drm] GT0: GuC status: Reset = 0,
BootROM = 0X50, UKernel = 0X0, MIA = 0X0, Auth = 0X1
<6>[  266.816663] xe 0000:00:02.0: [drm] GT0: GuC firmware signature
verification failed
<3>[  266.876003] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC mmio request
0x508: no reply 0x508
<3>[  266.876093] xe 0000:00:02.0: [drm] *ERROR* Failed to enable CT (-110)
<3>[  266.876140] xe 0000:00:02.0: [drm] *ERROR* GuC PC reset: -ENODEV


> 
>   * igt@xe_gt_freq@throttle_basic_api:
>     - shard-adlp:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@xe_gt_freq@throttle_basic_api.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@xe_gt_freq@throttle_basic_api.html

unrelated, maybe some mess from previous test core_hotunplug ?

(xe_gt_freq:1556) drmtest-DEBUG: Condition stat(path, &new) != 0
occurred in function _is_already_opened, file
../../../usr/src/igt-gpu-tools/lib/drmtest.c:374
(xe_gt_freq:1556) drmtest-INFO: Opened device: /dev/dri/card1
(xe_gt_freq:1556) drmtest-DEBUG: Test requirement passed: !(fd<0)
(xe_gt_freq:1556) CRITICAL: Test assertion failure function get_freq,
file ../../../usr/src/igt-gpu-tools/tests/intel/xe_gt_freq.c:61:
(xe_gt_freq:1556) CRITICAL: Failed assertion: gt_fd >= 0
(xe_gt_freq:1556) CRITICAL: Last errno: 2, No such file or directory

> 
>   
> #### Warnings ####
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-adlp:         [SKIP][5] ([Intel XE#1201] / [Intel XE#1341]) -> [ABORT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@kms_getfb@getfb-reject-ccs.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - {shard-lnl-2}:      NOTRUN -> [DMESG-WARN][7] +1 other test dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-2/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@core_hotunplug@hotunbind-rebind:
>     - {shard-lnl-3}:      NOTRUN -> [DMESG-WARN][8] +1 other test dmesg-warn
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-3/igt@core_hotunplug@hotunbind-rebind.html
> 
>   * igt@kms_atomic_interruptible@legacy-pageflip:
>     - {shard-lnl-5}:      NOTRUN -> [DMESG-WARN][9] +9 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-5/igt@kms_atomic_interruptible@legacy-pageflip.html
> 
>   * igt@kms_atomic_transition@modeset-transition-fencing:
>     - {shard-lnl-1}:      NOTRUN -> [SKIP][10] +17 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-fencing.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - {shard-lnl-8}:      NOTRUN -> [FAIL][11]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - {shard-lnl-1}:      [SKIP][12] ([Intel XE#309]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - {shard-lnl-2}:      NOTRUN -> [INCOMPLETE][14]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - {shard-lnl-1}:      [SKIP][15] ([Intel XE#656]) -> [SKIP][16] +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - {shard-lnl-1}:      [PASS][17] -> [SKIP][18] +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-lnl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@xe_exec_basic@twice-basic-defer-bind:
>     - {shard-lnl-5}:      NOTRUN -> [DMESG-FAIL][19] +2 other tests dmesg-fail
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-5/igt@xe_exec_basic@twice-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch:
>     - {shard-lnl-5}:      NOTRUN -> [INCOMPLETE][20] +2 other tests incomplete
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-5/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-prefetch.html
> 
>   * igt@xe_exec_reset@cm-gt-reset:
>     - {shard-lnl-5}:      [FAIL][21] ([Intel XE#1068]) -> [DMESG-FAIL][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-lnl-5/igt@xe_exec_reset@cm-gt-reset.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-5/igt@xe_exec_reset@cm-gt-reset.html
> 
>   * igt@xe_gt_freq@throttle_basic_api:
>     - {shard-lnl-5}:      NOTRUN -> [FAIL][23] +1 other test fail
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-5/igt@xe_gt_freq@throttle_basic_api.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - {shard-lnl-1}:      NOTRUN -> [DMESG-WARN][24]
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-1/igt@xe_module_load@reload-no-display.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-132271v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124] / [Intel XE#1201]) +10 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#619])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][27] ([Intel XE#1204])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][28] ([Intel XE#1231]) +1 other test fail
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#316]) +5 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [PASS][31] -> [FAIL][32] ([Intel XE#1231])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#367])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +45 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#787]) +71 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#787]) +66 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#650]) +7 other tests fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#314])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-1/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1152] / [Intel XE#1201] / [Intel XE#455])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_cdclk@plane-scaling.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1152] / [Intel XE#1201]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_frames@dp-crc-multiple:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#373]) +8 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-multiple.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#308])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#309]) +5 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-dg2-set2:     [PASS][48] -> [DMESG-WARN][49] ([Intel XE#1214] / [Intel XE#282]) +5 other tests dmesg-warn
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][50] ([Intel XE#1191] / [Intel XE#1214]) +3 other tests dmesg-warn
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#776])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#703])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-busy-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#310]) +5 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_flip@2x-busy-flip.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][54] -> [DMESG-WARN][55] ([Intel XE#1214]) +1 other test dmesg-warn
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#1235])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a7:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][57] ([Intel XE#1214]) +10 other tests dmesg-warn
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a7.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [FAIL][58] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#455]) +22 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#656]) +44 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         [PASS][61] -> [FAIL][62] ([Intel XE#616]) +2 other tests fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [PASS][63] -> [SKIP][64] ([Intel XE#1201]) +6 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1151] / [Intel XE#1201])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     [PASS][70] -> [SKIP][71] ([Intel XE#1201] / [Intel XE#417])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
>     - shard-adlp:         [PASS][72] -> [SKIP][73] ([Intel XE#1201] / [Intel XE#417])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-4/igt@kms_hdmi_inject@inject-audio.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_lease@lease-invalid-crtc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_lease@lease-invalid-crtc.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-a:
>     - shard-adlp:         [PASS][75] -> [INCOMPLETE][76] ([Intel XE#1195]) +1 other test incomplete
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-1/igt@kms_plane@plane-position-hole@pipe-a.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_plane@plane-position-hole@pipe-a.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][77] ([Intel XE#616]) +3 other tests fail
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][79] ([Intel XE#361]) +1 other test fail
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][80] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][81] ([Intel XE#904] / [Intel XE#909])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#305]) +8 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#870])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#870])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1129] / [Intel XE#1201])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - shard-adlp:         [PASS][90] -> [FAIL][91] ([Intel XE#1203])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_pm_rpm@basic-rte.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#836])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_prop_blob@blob-prop-core:
>     - shard-dg2-set2:     [PASS][93] -> [SKIP][94] ([Intel XE#1201] / [Intel XE#780])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-436/igt@kms_prop_blob@blob-prop-core.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_prop_blob@blob-prop-core.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201]) +7 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-pr-cursor-render:
>     - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#929]) +17 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_psr@fbc-pr-cursor-render.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1149] / [Intel XE#1201])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation:
>     - shard-adlp:         NOTRUN -> [FAIL][99] ([Intel XE#616]) +19 other tests fail
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#362])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#756])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
>     - shard-adlp:         NOTRUN -> [FAIL][103] ([Intel XE#1080]) +9 other tests fail
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html
> 
>   * igt@xe_ccs@block-copy-compressed-inc-dimension:
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488]) +2 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@xe_ccs@block-copy-compressed-inc-dimension.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#1447])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1123] / [Intel XE#1201])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1126] / [Intel XE#1201])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [PASS][108] -> [TIMEOUT][109] ([Intel XE#1473] / [Intel XE#392])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-435/igt@xe_evict@evict-cm-threads-large.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-large-multi-vm:
>     - shard-dg2-set2:     [PASS][110] -> [INCOMPLETE][111] ([Intel XE#1195] / [Intel XE#1473])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-463/igt@xe_evict@evict-cm-threads-large-multi-vm.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-436/igt@xe_evict@evict-cm-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     [PASS][112] -> [DMESG-FAIL][113] ([Intel XE#821])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#261]) +6 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-small-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@xe_evict@evict-small-external-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#688]) +2 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
> 
>   * igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race:
>     - shard-adlp:         [PASS][117] -> [DMESG-FAIL][118] ([Intel XE#1088] / [Intel XE#1330])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-1/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@xe_exec_balancer@many-execqueues-virtual-userptr-invalidate-race.html
> 
>   * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
>     - shard-adlp:         [PASS][119] -> [DMESG-FAIL][120] ([Intel XE#1069] / [Intel XE#1088] / [Intel XE#1330])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-4/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][123] ([Intel XE#1068])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:
>     - shard-dg2-set2:     [PASS][124] -> [TIMEOUT][125] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [PASS][126] -> [SKIP][127] ([Intel XE#1192] / [Intel XE#1201])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-435/igt@xe_live_ktest@xe_bo.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@xe_live_ktest@xe_bo.html
>     - shard-adlp:         [PASS][128] -> [SKIP][129] ([Intel XE#1192] / [Intel XE#1201])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-4/igt@xe_live_ktest@xe_bo.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#512])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_mmap@vram:
>     - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1008] / [Intel XE#1201])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@xe_mmap@vram.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1201] / [Intel XE#379])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_pm@s3-basic:
>     - shard-adlp:         [PASS][133] -> [INCOMPLETE][134] ([Intel XE#1195] / [Intel XE#1358])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@xe_pm@s3-basic.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@xe_pm@s3-basic.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [PASS][135] -> [DMESG-WARN][136] ([Intel XE#1162] / [Intel XE#1214]) +2 other tests dmesg-warn
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#366])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-463/igt@xe_pm@s3-d3cold-basic-exec.html
>     - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#1201] / [Intel XE#366])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@xe_pm@s3-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-adlp:         [PASS][139] -> [DMESG-WARN][140] ([Intel XE#1191] / [Intel XE#1214])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         NOTRUN -> [FAIL][141] ([Intel XE#1043] / [Intel XE#845]) +2 other tests fail
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#1201] / [Intel XE#944]) +4 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_vm@bind-flag-invalid:
>     - shard-adlp:         NOTRUN -> [FAIL][143] ([Intel XE#1559])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@xe_vm@bind-flag-invalid.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_addfb_basic@bad-pitch-32:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [i915#6077]) -> [PASS][145] +2 other tests pass
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_addfb_basic@bad-pitch-32.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-463/igt@kms_addfb_basic@bad-pitch-32.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-180:
>     - shard-adlp:         [SKIP][146] ([Intel XE#1177] / [Intel XE#1201]) -> [PASS][147] +6 other tests pass
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_big_fb@linear-8bpp-rotate-180.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_big_fb@linear-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][149] +4 other tests pass
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][150] ([Intel XE#1231]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * {igt@kms_big_joiner@basic-force-joiner}:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#1201]) -> [PASS][153]
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-464/igt@kms_big_joiner@basic-force-joiner.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@kms_big_joiner@basic-force-joiner.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#1226]) -> [PASS][155] +13 other tests pass
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#1214]) -> [PASS][157] +6 other tests pass
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-463/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][158] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][159] +3 other tests pass
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_plane_multiple@tiling-none:
>     - shard-adlp:         [SKIP][160] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][161]
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_plane_multiple@tiling-none.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_plane_multiple@tiling-none.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][162] ([Intel XE#361]) -> [PASS][163]
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-adlp:         [SKIP][164] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][165] +1 other test pass
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-4/igt@kms_pm_rpm@dpms-lpsp.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-1/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@legacy-planes:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][167] +1 other test pass
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-464/igt@kms_pm_rpm@legacy-planes.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-434/igt@kms_pm_rpm@legacy-planes.html
> 
>   * igt@kms_sequence@queue-busy:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1234]) -> [PASS][169]
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_sequence@queue-busy.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-435/igt@kms_sequence@queue-busy.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][170] ([Intel XE#1214] / [i915#10142]) -> [PASS][171]
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][172] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][173]
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][174] ([Intel XE#1473]) -> [PASS][175]
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_balancer@once-virtual-userptr-invalidate-race:
>     - shard-adlp:         [FAIL][176] -> [PASS][177]
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-8/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@xe_exec_balancer@once-virtual-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@many-execqueues-userptr:
>     - shard-adlp:         [DMESG-WARN][178] ([Intel XE#1214]) -> [PASS][179]
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-1/igt@xe_exec_basic@many-execqueues-userptr.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-1/igt@xe_exec_basic@many-execqueues-userptr.html
> 
>   * igt@xe_exec_basic@twice-basic:
>     - shard-adlp:         [FAIL][180] ([Intel XE#1257]) -> [PASS][181] +2 other tests pass
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-8/igt@xe_exec_basic@twice-basic.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@xe_exec_basic@twice-basic.html
> 
>   * igt@xe_exec_compute_mode@twice-userptr-invalidate:
>     - {shard-lnl-1}:      [DMESG-FAIL][182] ([Intel XE#1069]) -> [PASS][183]
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
> 
>   * igt@xe_exec_store@cachelines:
>     - shard-dg2-set2:     [FAIL][184] ([Intel XE#1270]) -> [PASS][185]
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-434/igt@xe_exec_store@cachelines.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-435/igt@xe_exec_store@cachelines.html
> 
>   * igt@xe_exec_threads@threads-fd-userptr-rebind:
>     - shard-dg2-set2:     [TIMEOUT][186] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][187]
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-463/igt@xe_exec_threads@threads-fd-userptr-rebind.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@xe_exec_threads@threads-fd-userptr-rebind.html
> 
>   * igt@xe_exec_threads@threads-mixed-basic:
>     - shard-adlp:         [FAIL][188] ([Intel XE#1069]) -> [PASS][189] +3 other tests pass
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-8/igt@xe_exec_threads@threads-mixed-basic.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@xe_exec_threads@threads-mixed-basic.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [ABORT][190] ([Intel XE#1216]) -> [PASS][191]
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-464/igt@xe_module_load@many-reload.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-435/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-adlp:         [DMESG-WARN][192] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][193]
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-6/igt@xe_pm@s3-exec-after.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-1/igt@xe_pm@s3-exec-after.html
> 
>   * igt@xe_prime_self_import@basic-llseek-size:
>     - {shard-lnl-8}:      [DMESG-WARN][194] -> [PASS][195]
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-lnl-8/igt@xe_prime_self_import@basic-llseek-size.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-lnl-8/igt@xe_prime_self_import@basic-llseek-size.html
> 
>   * igt@xe_vm@large-misaligned-binds-2147483648:
>     - shard-adlp:         [SKIP][196] ([Intel XE#1201]) -> [PASS][197] +35 other tests pass
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@xe_vm@large-misaligned-binds-2147483648.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotrebind:
>     - shard-adlp:         [DMESG-WARN][198] ([Intel XE#1214]) -> [DMESG-WARN][199] ([Intel XE#1214] / [Intel XE#1352])
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@core_hotunplug@hotrebind.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@core_hotunplug@hotrebind.html
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-adlp:         [INCOMPLETE][200] ([Intel XE#1195] / [Intel XE#1538]) -> [ABORT][201] ([Intel XE#1538])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-1/igt@core_hotunplug@hotreplug-lateclose.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [SKIP][202] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][203] ([Intel XE#1124] / [Intel XE#1201])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-adlp:         [SKIP][204] ([Intel XE#1201]) -> [SKIP][205] ([Intel XE#1124] / [Intel XE#1201])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>     - shard-adlp:         [SKIP][206] ([Intel XE#1201]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#316])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [SKIP][208] ([Intel XE#1201] / [Intel XE#829]) -> [FAIL][209] ([Intel XE#1204])
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
>     - shard-adlp:         [SKIP][210] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#316])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-adlp:         [SKIP][212] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#316])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][214] ([Intel XE#1231]) -> [FAIL][215] ([Intel XE#1242])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][217] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-adlp:         [SKIP][218] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][219] ([Intel XE#1124] / [Intel XE#1201])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-adlp:         [SKIP][222] ([Intel XE#1201]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#367])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#829])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
>     - shard-adlp:         [SKIP][228] ([Intel XE#1201]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-adlp:         [SKIP][230] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-adlp:         [SKIP][232] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#1252])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#1252])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][237] ([Intel XE#1201]) +1 other test skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-435/igt@kms_chamelium_color@gamma.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][239] ([Intel XE#1201])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-463/igt@kms_chamelium_frames@hdmi-frame-dump.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-dg2-set2:     [ABORT][240] -> [FAIL][241] ([Intel XE#1178]) +1 other test fail
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-463/igt@kms_content_protection@atomic-dpms.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-adlp:         [SKIP][242] ([Intel XE#1201]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#308])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][244] ([Intel XE#1214] / [Intel XE#282]) -> [SKIP][245] ([Intel XE#1201])
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-adlp:         [SKIP][246] ([Intel XE#1201]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#309])
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_dsc@dsc-with-bpc.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-adlp:         [SKIP][250] ([Intel XE#1201]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#310]) +3 other tests skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#1226]) -> [DMESG-WARN][253] ([Intel XE#1162] / [Intel XE#1214])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][254] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142]) -> [DMESG-WARN][255] ([Intel XE#1214] / [i915#10142]) +2 other tests dmesg-warn
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         [SKIP][256] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#651])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][258] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][259] ([Intel XE#1201]) +2 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
>     - shard-adlp:         [SKIP][260] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#656]) +1 other test skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>     - shard-adlp:         [SKIP][264] ([Intel XE#1201]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#656]) +7 other tests skip
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
>     - shard-adlp:         [SKIP][266] ([Intel XE#1201]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-adlp:         [SKIP][268] ([Intel XE#1201]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#653]) +6 other tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>     - shard-dg2-set2:     [SKIP][270] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][271] ([Intel XE#1201]) +2 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-adlp:         [SKIP][274] ([Intel XE#1201]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_panel_fitting@legacy.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         [INCOMPLETE][276] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][277] ([Intel XE#1191] / [Intel XE#1214])
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-adlp:         [INCOMPLETE][278] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][279] ([Intel XE#1191] / [Intel XE#1214])
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-adlp:         [SKIP][280] ([Intel XE#1201]) -> [FAIL][281] ([Intel XE#616])
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_plane_cursor@primary.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-dg2-set2:     [DMESG-WARN][282] ([Intel XE#1214] / [Intel XE#324]) -> [SKIP][283] ([Intel XE#1201] / [Intel XE#829])
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_plane_lowres@tiling-4.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
>     - shard-adlp:         [SKIP][284] ([Intel XE#1177] / [Intel XE#1201]) -> [SKIP][285] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>     - shard-adlp:         [SKIP][286] ([Intel XE#1201]) -> [SKIP][287] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>     - shard-dg2-set2:     [SKIP][288] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][289] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-adlp:         [SKIP][290] ([Intel XE#1201] / [Intel XE#1211]) -> [SKIP][291] ([Intel XE#1201] / [Intel XE#836])
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][292] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][293] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][294] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][295] ([Intel XE#1201])
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-466/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr-suspend:
>     - shard-adlp:         [SKIP][296] ([Intel XE#1201]) -> [SKIP][297] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_psr@fbc-psr-suspend.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_psr@fbc-psr-suspend.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-adlp:         [SKIP][298] ([Intel XE#1177] / [Intel XE#1201]) -> [FAIL][299] ([Intel XE#616])
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][300] ([Intel XE#1201] / [Intel XE#869]) -> [SKIP][301] ([Intel XE#1201] / [Intel XE#362])
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-adlp:         [DMESG-WARN][302] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142]) -> [INCOMPLETE][303] ([Intel XE#1034] / [Intel XE#1195])
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][304] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][305] ([Intel XE#1034] / [Intel XE#1195])
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-adlp:         [DMESG-WARN][306] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142]) -> [DMESG-WARN][307] ([Intel XE#1191] / [Intel XE#1214])
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     [SKIP][308] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][309] ([Intel XE#1201])
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-466/igt@kms_vrr@flipline.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@kms_vrr@flipline.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-adlp:         [SKIP][310] ([Intel XE#1201]) -> [SKIP][311] ([Intel XE#1126] / [Intel XE#1201])
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [FAIL][312] ([Intel XE#1259]) -> [TIMEOUT][313] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][314] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][315] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][316] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][317] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-464/igt@xe_evict@evict-threads-large.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-464/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue:
>     - shard-adlp:         [SKIP][318] ([Intel XE#1201]) -> [SKIP][319] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue.html
> 
>   * igt@xe_pm@d3cold-multiple-execs:
>     - shard-adlp:         [FAIL][320] ([Intel XE#1257]) -> [SKIP][321] ([Intel XE#1201] / [Intel XE#366])
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-8/igt@xe_pm@d3cold-multiple-execs.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@xe_pm@d3cold-multiple-execs.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [DMESG-WARN][322] ([Intel XE#1214] / [i915#10142]) -> [INCOMPLETE][323] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-adlp:         [SKIP][324] ([Intel XE#1201]) -> [DMESG-WARN][325] ([Intel XE#1214] / [i915#10142])
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-adlp:         [INCOMPLETE][326] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927]) -> [DMESG-WARN][327] ([Intel XE#1191] / [Intel XE#1214] / [i915#10142])
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-adlp-9/igt@xe_pm@s2idle-multiple-execs.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-dg2-set2:     [DMESG-FAIL][328] ([Intel XE#1162]) -> [FAIL][329] ([Intel XE#1043] / [Intel XE#845])
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/shard-dg2-435/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1080]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1080
>   [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1216]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1216
>   [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
>   [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
>   [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>   [Intel XE#1257]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1257
>   [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
>   [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
>   [Intel XE#1270]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1270
>   [Intel XE#1329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1329
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
>   [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
>   [Intel XE#1352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1352
>   [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1444
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1483
>   [Intel XE#1488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1488
>   [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>   [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
>   [Intel XE#1559]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1559
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
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
>   [Intel XE#869]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/869
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
>   [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#10142]: https://gitlab.freedesktop.org/drm/intel/issues/10142
>   [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7803 -> IGT_7804
>   * Linux: xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9 -> xe-pw-132271v2
> 
>   IGT_7803: 9669a17ae56f1dcd22ba4c5cb39b3cd334a46862 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7804: 7804
>   xe-1069-bf24d40fae19bcceac3e32c4866079b4f10c70f9: bf24d40fae19bcceac3e32c4866079b4f10c70f9
>   xe-pw-132271v2: 132271v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132271v2/index.html
> 
