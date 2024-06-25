Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56C6C30653
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 19:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B3810E080;
	Tue, 25 Jun 2024 19:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lugsWGEK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE9B10E080
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 19:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719343421; x=1750879421;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NPsh2foLQb+2wpEJd5ZFhPwGhMGOz5r7d5i7WWvBn04=;
 b=lugsWGEKen5dGDM9Flw+34Qun8dyh7jxWx9l/xmx5c3vXdWplLLpvbLV
 EC2FPPo++c45qh2RSOOAJJ9hw8ibESHbD6vay8TGgx1C56xoPd3IqXize
 JGVA/xaw6abk2JH/tovHUdATT+dKYHTQ79zSiZXbZqmxB9KUcfw16641t
 j97V7xAHYnyXDOOtn4f2vjCJtlLr4zGL79swZ1sOK4V8PW7Na9NlQJGtU
 OZIH54amjBfHg2yQQGZZ3nAcinoF9EZB3bCsw3KFYA7c2X0lmnuSDGSd9
 U4eYmvz5D4KulrPZtUfYbOLkPUtC1a72V8MT8AyfFgbKnDe46fT0NYCB6 Q==;
X-CSE-ConnectionGUID: Ch3J2lfLQVmnI0szPD7Xow==
X-CSE-MsgGUID: wpsAzrZrSByUSXFpva/MAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20160988"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20160988"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 12:23:40 -0700
X-CSE-ConnectionGUID: BNKYXAamQAihZn5QlRCzgg==
X-CSE-MsgGUID: Gd8LYMjpQF6N9qnF8HR7aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43619911"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 25 Jun 2024 12:23:32 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B3657284ED;
 Tue, 25 Jun 2024 20:23:25 +0100 (IST)
Message-ID: <0af94a5d-894d-4b43-b7db-d35d819a3944@intel.com>
Date: Tue, 25 Jun 2024 21:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_PF=3A_Trigger_ex?=
 =?UTF-8?Q?plicit_FLR_while_disabling_VFs?=
To: intel-xe@lists.freedesktop.org, =?UTF-8?B?xYF1a2FzeiDFgWFndW5h?=
 <lukasz.laguna@intel.com>
References: <20240624205737.1213-1-michal.wajdeczko@intel.com>
 <171927425327.153309.360956677024698327@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171927425327.153309.360956677024698327@a6498e030952>
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



On 25.06.2024 02:10, Patchwork wrote:
> == Series Details ==
> 
> Series: PF: Trigger explicit FLR while disabling VFs
> URL   : https://patchwork.freedesktop.org/series/135321/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b_full -> xe-pw-135321v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135321v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135321v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135321v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

unrelated:

<3> [324.088581] xe 0000:03:00.0: [drm] *ERROR* Potential atomic update
failure on pipe B

> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][3] +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

unrelated:

Test requirement not met in function __igt_unique____real_main1030, file
../../../usr/src/igt-gpu-tools/tests/intel/kms_psr2_sf.c:1083:
Test requirement: pr_psr2_sel_fetch_supported
No output supports selective fetch

> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][4] +1 other test dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html

unrelated:

<3> [323.428719] xe 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x2
-> 0x0)
<4> [323.428865] ------------[ cut here ]------------
<4> [323.428872] xe 0000:00:02.0: [drm] Unexpected DBuf power power
state (0x00000000, expected 0x00000001)
<4> [323.428924] WARNING: CPU: 10 PID: 144 at
drivers/gpu/drm/i915/display/intel_display_power_well.c:957
gen9_disable_dc_states+0x1b3/0x200 [xe]


> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-7:
>     - shard-adlp:         NOTRUN -> [ABORT][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-9/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-7.html

this warning normally results from lock-class leakage or failure to
properly initialize locks, not directly related to this series as we
don't add any locks, it's rather exposure of the existing problem

<7> [271.707448] BUG: MAX_LOCKDEP_KEYS too low!
<7> [271.707454] turning off the locking correctness validator.
<4> [271.707457] CPU: 2 PID: 1537 Comm: sriov_basic Tainted: G     U
        6.10.0-rc5-xe #1
<4> [271.707460] Hardware name: Intel Corporation Alder Lake Client
Platform/AlderLake-P DDR5 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723
01/20/2023
<4> [271.707463] Call Trace:
<4> [271.707465]  <TASK>
<4> [271.707466]  dump_stack_lvl+0x9b/0xf0
<4> [271.707471]  dump_stack+0x10/0x20
<4> [271.707473]  register_lock_class+0x40f/0x4c0
<4> [271.707478]  __lock_acquire+0x7b/0x3070
<4> [271.707481]  ? __lock_acquire+0xa08/0x3070
<4> [271.707484]  lock_acquire+0xd9/0x300
<4> [271.707487]  ? touch_wq_lockdep_map+0x21/0xa0
<4> [271.707490]  ? lockdep_init_map_type+0x4b/0x260
<4> [271.707493]  ? touch_wq_lockdep_map+0x21/0xa0
<4> [271.707495]  touch_wq_lockdep_map+0x41/0xa0
<4> [271.707497]  ? touch_wq_lockdep_map+0x21/0xa0
<4> [271.707499]  __flush_workqueue+0x8e/0x4b0
<4> [271.707503]  drain_workqueue+0xa8/0x150
<4> [271.707505]  destroy_workqueue+0x60/0x3c0
<4> [271.707508]  guc_submit_fini+0x3a/0x60 [xe]
<4> [271.707562]  drm_managed_release+0xa9/0x160 [drm]
<4> [271.707593]  drm_dev_release+0x38/0x50 [drm]
<4> [271.707611]  devm_drm_dev_init_release+0x38/0x60 [drm]
<4> [271.707628]  devm_action_release+0x12/0x20
<4> [271.707632]  release_nodes+0x3d/0x120
<4> [271.707634]  devres_release_all+0x9e/0xe0
<4> [271.707637]  device_unbind_cleanup+0x12/0x80
<4> [271.707640]  device_release_driver_internal+0xdf/0x140
<4> [271.707643]  device_release_driver+0x12/0x20
<4> [271.707646]  pci_stop_bus_device+0x74/0xa0
<4> [271.707649]  pci_stop_and_remove_bus_device+0x13/0x30
<4> [271.707651]  pci_iov_remove_virtfn+0xc5/0x130
<4> [271.707654]  sriov_disable+0x33/0xf0

> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
>     - shard-adlp:         NOTRUN -> [FAIL][6] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-9/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

	
Starting dynamic subtest: numvfs-2
(sriov_basic:1431) igt_device-WARNING: Couldn't find PCI device
0000:00:02:02
(sriov_basic:1431) igt_sriov_device-CRITICAL: Test assertion failure
function __igt_sriov_bind_vf_drm_driver, file
../../../usr/src/igt-gpu-tools/lib/igt_sriov_device.c:310:
(sriov_basic:1431) igt_sriov_device-CRITICAL: Failed assertion: pci_dev
(sriov_basic:1431) igt_sriov_device-CRITICAL: Last errno: 2, No such
file or directory
(sriov_basic:1431) igt_sriov_device-CRITICAL: No PCI device for given VF
number: 2


this seems to be a problem with the test implementation, as it relies on
the libpciaccess that likely can't handle changes in the PCI tree

simple hack in IGT like this:

@@ -212,6 +220,9 @@ struct pci_device *__igt_device_get_pci_device(int
fd, unsigned int vf_id)
        struct igt_pci_addr pci_addr;
        struct pci_device *pci_dev;

+       pci_system_cleanup();
+       pci_system_init();
+

allows the test to move on:

Dynamic subtest numvfs-21: SUCCESS (28.211s)
Starting dynamic subtest: numvfs-22
..


> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     [SKIP][7] ([Intel XE#1201]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-adlp:         [SKIP][9] ([Intel XE#1201] / [Intel XE#1932]) -> [ABORT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-9/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-9/igt@sriov_basic@enable-vfs-autoprobe-on.html

<4> [256.677657] xe 0000:00:02.0: [drm] GT0: H2G retry, action 0x5503,
reason 0
<6> [256.782753] xe 0000:00:02.0: [drm] PF: Disabled 1 VF

this is being addressed by another patch [1]

[1] https://patchwork.freedesktop.org/patch/600831/?series=135365&rev=1


> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-adlp:         [SKIP][11] ([Intel XE#1201] / [Intel XE#1932]) -> [DMESG-FAIL][12] +1 other test dmesg-fail
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-1/igt@sriov_basic@enable-vfs-bind-unbind-each.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-9/igt@sriov_basic@enable-vfs-bind-unbind-each.html

similar to above

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_ccs:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][13]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-lnl-6/igt@kms_ccs.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135321v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1033] / [Intel XE#1214])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1124])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1252])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#787]) +6 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#373])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][22] ([Intel XE#1551]) +1 other test dmesg-fail
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][24] -> [FAIL][25] ([Intel XE#1874]) +2 other tests fail
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#651]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#653]) +3 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][28] ([Intel XE#616]) +1 other test fail
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-464/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-6-size-128:
>     - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1195]) +1 other test incomplete
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-6-size-128.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-d-hdmi-a-6-size-128.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [PASS][31] -> [FAIL][32] ([Intel XE#361])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#305]) +2 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms:
>     - shard-adlp:         [PASS][35] -> [INCOMPLETE][36] ([Intel XE#1195]) +1 other test incomplete
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-6/igt@kms_pm_rpm@universal-planes-dpms.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-1/igt@kms_pm_rpm@universal-planes-dpms.html
> 
>   * igt@kms_psr@fbc-pr-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#929])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_psr@fbc-pr-suspend.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][38] -> [FAIL][39] ([Intel XE#771] / [Intel XE#899])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][40] -> [FAIL][41] ([Intel XE#899])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][42] -> [FAIL][43] ([Intel XE#899])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#756])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][45] ([Intel XE#1214]) +18 other tests dmesg-warn
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-9/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-3.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201]) +13 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-9/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-4.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1126])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][48] -> [TIMEOUT][49] ([Intel XE#1473])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][50] -> [TIMEOUT][51] ([Intel XE#1473] / [Intel XE#392])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#288]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#255])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][54] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][55]
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-dg2-set2:     [FAIL][56] ([Intel XE#886]) -> [PASS][57] +1 other test pass
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][58] ([Intel XE#455]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
>     - shard-adlp:         [FAIL][60] ([Intel XE#1874]) -> [PASS][61] +3 other tests pass
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-4/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - {shard-lnl}:        [DMESG-WARN][62] ([Intel XE#2042]) -> [PASS][63]
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-lnl-8/igt@kms_pm_rpm@system-suspend-modeset.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][64] ([Intel XE#1600]) -> [PASS][65]
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
>     - {shard-lnl}:        [FAIL][66] ([Intel XE#1069]) -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-lnl-2/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-lnl-7/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][68] ([Intel XE#2097]) -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-lnl-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_reset@close-fd:
>     - {shard-lnl}:        [DMESG-WARN][70] ([Intel XE#1638]) -> [PASS][71]
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-lnl-2/igt@xe_exec_reset@close-fd.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-lnl-2/igt@xe_exec_reset@close-fd.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - {shard-lnl}:        [DMESG-WARN][72] ([Intel XE#1796]) -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-lnl-3/igt@xe_gt_freq@freq_fixed_exec.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-lnl-3/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [ABORT][74] ([Intel XE#1794]) -> [PASS][75]
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - {shard-lnl}:        [ABORT][76] ([Intel XE#1794]) -> [PASS][77]
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_pm_residency@toggle-gt-c6:
>     - {shard-lnl}:        [FAIL][78] ([Intel XE#958]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][80] ([Intel XE#623]) -> [SKIP][81] ([Intel XE#1201] / [Intel XE#623])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][82] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][83] ([Intel XE#316]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][84] ([Intel XE#316]) -> [SKIP][85] ([Intel XE#1201] / [Intel XE#316])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [FAIL][86] ([Intel XE#1231]) -> [DMESG-FAIL][87] ([Intel XE#324])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][88] ([Intel XE#1124]) -> [SKIP][89] ([Intel XE#1124] / [Intel XE#1201])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][90] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][91] ([Intel XE#1124]) +5 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][92] ([Intel XE#1231]) -> [FAIL][93] ([Intel XE#1242])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][94] ([Intel XE#610]) -> [SKIP][95] ([Intel XE#1201] / [Intel XE#610])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][96] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][97] ([Intel XE#367])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][98] ([Intel XE#367]) -> [SKIP][99] ([Intel XE#1201] / [Intel XE#367])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][100] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][101] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][102] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][103] ([Intel XE#787]) +41 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][104] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][105] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][106] ([Intel XE#787]) -> [SKIP][107] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#314]) -> [SKIP][109] ([Intel XE#1201] / [Intel XE#314])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     [SKIP][110] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][111] ([Intel XE#306])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][113] ([Intel XE#373]) +4 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][114] ([Intel XE#373]) -> [SKIP][115] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][116] ([Intel XE#1178]) -> [INCOMPLETE][117] ([Intel XE#1195] / [Intel XE#2075]) +1 other test incomplete
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-4.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][119] ([Intel XE#308])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][121] ([Intel XE#776])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][123] ([Intel XE#701])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][124] -> [DMESG-WARN][125] ([Intel XE#1214]) +1 other test dmesg-warn
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [INCOMPLETE][126] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [INCOMPLETE][127] ([Intel XE#1551] / [Intel XE#2049])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][128] ([Intel XE#1214] / [Intel XE#1551]) -> [DMESG-WARN][129] ([Intel XE#1551])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][130] ([Intel XE#1195] / [Intel XE#2049]) -> [INCOMPLETE][131] ([Intel XE#2049])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_flip@flip-vs-suspend@d-dp4.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>     - shard-dg2-set2:     [SKIP][132] ([Intel XE#455]) -> [SKIP][133] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#651]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][137] ([Intel XE#651]) +14 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-rte:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][139] ([Intel XE#653]) +15 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-rte.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#653]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#605]) -> [SKIP][143] ([Intel XE#605])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][145] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][146] ([Intel XE#305]) -> [SKIP][147] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][148] -> [SKIP][149] ([Intel XE#1201])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-pr-no-drrs:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][151] ([Intel XE#929]) +8 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_psr@fbc-pr-no-drrs.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-move:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#929]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-move.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-plane-move.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][155] ([Intel XE#327]) +2 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][157] ([Intel XE#1729])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][158] ([Intel XE#1551]) -> [DMESG-WARN][159] ([Intel XE#1214] / [Intel XE#1551]) +1 other test dmesg-warn
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][161] ([Intel XE#455]) +2 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@kms_vrr@flip-dpms.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@kms_vrr@flip-dpms.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][163] ([Intel XE#1091])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@sriov_basic@bind-unbind-vf.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-adlp:         [SKIP][164] ([Intel XE#1201] / [Intel XE#1932]) -> [DMESG-WARN][165] ([Intel XE#1214])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-adlp-6/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][166] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][167] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_exec_fault_mode@once-basic-imm:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][169] ([Intel XE#288]) +14 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-463/igt@xe_exec_fault_mode@once-basic-imm.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#288]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-FAIL][172] ([Intel XE#1760]) -> [DMESG-WARN][173] ([Intel XE#1214] / [Intel XE#1760])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1796]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1796
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2075
>   [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b -> xe-pw-135321v1
> 
>   IGT_7898: a2600953b16d6628855b89ac40f477b58933b37b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1523-cf83cd8ff370955a504fdf1388ea6e257da76a8b: cf83cd8ff370955a504fdf1388ea6e257da76a8b
>   xe-pw-135321v1: 135321v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135321v1/index.html
> 
