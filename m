Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D33C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 18:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAFE10E1CE;
	Thu, 16 May 2024 18:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltSmJ2Sb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A0E10E1CE
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 18:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883270; x=1747419270;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fwQ/5TJFpjky8mA08zyFbCDfdAcDY76dDonBThvlLec=;
 b=ltSmJ2Sb8/DhLh5PFtSv1c9fZtZlgiAz+Txr9lMMyyBDavooG1Gpj6XX
 BMOTKbuh/0wGfHRL6azoMotPgGYUR8IdVIKKBLO3phyt7ZOe8pcXvUkgu
 4+Jj8syt2b4KEVJmTAdyDwCi59/5/ySuHd6AB0sk3MVP+LwiG7HYl5PV3
 ogC4NUrYtcYRXNasQYb1S/dHMN6ds+BmNbgdHHTs5dFf14/DC7aM8RYTf
 XYYcTFrRJHBBZtDdLP+jSr1oVELWob89B9q4t8GfkyE+bWKxyNKIu4psU
 WNAydzHRd2zJmbdufUC4rYNt8IGg6ooPL2y9g09FgzrofM4iQKTMel+YF Q==;
X-CSE-ConnectionGUID: FufXFs3rQJOtSxdq6nsKHg==
X-CSE-MsgGUID: vleSUsWKTaeelZ3vHLPIRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11829231"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="11829231"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:14:29 -0700
X-CSE-ConnectionGUID: rl+7guT+Txi1KXCcAfyrIA==
X-CSE-MsgGUID: Pr7a9S8vQZaI/chtGSQtBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31451533"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 16 May 2024 11:14:17 -0700
Received: from [10.246.25.139] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.25.139])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2CAAC33BE0
 for <intel-xe@lists.freedesktop.org>; Thu, 16 May 2024 19:14:13 +0100 (IST)
Message-ID: <9882dcba-c1fd-43f2-96fe-cd3960a701ae@intel.com>
Date: Thu, 16 May 2024 20:14:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Add_support_for_?=
 =?UTF-8?Q?VF_to_query_its_configuration_=28rev2=29?=
To: intel-xe@lists.freedesktop.org
References: <20240516110546.2216-1-michal.wajdeczko@intel.com>
 <171586614375.2121816.17153044910516553725@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171586614375.2121816.17153044910516553725@8e613ede5ea5>
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



On 16.05.2024 15:29, Patchwork wrote:
> == Series Details ==
> 
> Series: Add support for VF to query its configuration (rev2)
> URL   : https://patchwork.freedesktop.org/series/133509/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab_full -> xe-pw-133509v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-133509v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-133509v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-133509v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

whatever it was it can't be related to this series, which is about
inactive and VF specific code

> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-adlp:         NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

<1> [188.524986] BUG: kernel NULL pointer dereference, address:
0000000000000480
<4> [188.525120] RIP: 0010:__mutex_lock+0x63/0xe60
<4> [188.525245] Call Trace:
<4> [188.525251]  <TASK>
<4> [188.525256]  ? show_regs+0x67/0x70
<4> [188.525264]  ? __die_body+0x20/0x70
<4> [188.525270]  ? __die+0x2b/0x40
<4> [188.525276]  ? page_fault_oops+0x153/0x4b0
<4> [188.525284]  ? __lock_acquire+0xa22/0x30a0
<4> [188.525293]  ? do_user_addr_fault+0x416/0xa80
<4> [188.525301]  ? exc_page_fault+0x87/0x2a0
<4> [188.525309]  ? asm_exc_page_fault+0x27/0x30
<4> [188.525317]  ? drm_modeset_lock_all+0x40/0x1e0 [drm]
<4> [188.525365]  ? __mutex_lock+0x63/0xe60
<4> [188.525371]  ? kmemleak_alloc+0x4b/0x80
<4> [188.525379]  ? drm_modeset_lock_all+0x40/0x1e0 [drm]
<4> [188.525415]  ? kmalloc_trace+0x311/0x3c0
<4> [188.525424]  mutex_lock_nested+0x1b/0x30
<4> [188.525435]  ? mutex_lock_nested+0x1b/0x30
<4> [188.526042]  drm_modeset_lock_all+0x40/0x1e0 [drm]
<4> [188.526762]  i915_audio_component_bind+0x83/0x120 [xe]
<4> [188.527445]  component_bind_all+0x10d/0x280
<4> [188.527999]  hdac_component_master_bind+0x3a/0xf0 [snd_hda_core]

> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4:
>     - shard-dg2-set2:     [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_flip@flip-vs-suspend@c-dp4.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@c-dp4.html

no useful logs

> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     [DMESG-WARN][4] ([Intel XE#1162] / [Intel XE#1214]) -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

<3> [251.007557] xe 0000:00:02.0: [drm] *ERROR* DC state mismatch (0x2
-> 0x0)
<4> [251.007569] ------------[ cut here ]------------
<4> [251.007572] xe 0000:00:02.0: Unexpected DBuf power power state
(0x00000000, expected 0x00000001)
<4> [251.007609] WARNING: CPU: 18 PID: 936 at
drivers/gpu/drm/i915/display/intel_display_power_well.c:957
gen9_disable_dc_states+0x1b3/0x200 [xe]

<4> [251.008080] Call Trace:
<4> [251.008083]  <TASK>
<4> [251.008087]  ? show_regs+0x67/0x70
<4> [251.008093]  ? gen9_disable_dc_states+0x1b3/0x200 [xe]
<4> [251.008189]  ? __warn+0x8e/0x1b0
<4> [251.008197]  ? gen9_disable_dc_states+0x1b3/0x200 [xe]
<4> [251.008294]  ? report_bug+0x1b7/0x1d0
<4> [251.008305]  ? handle_bug+0x46/0x80
<4> [251.008311]  ? exc_invalid_op+0x19/0x70
<4> [251.008318]  ? asm_exc_invalid_op+0x1b/0x20
<4> [251.008335]  ? gen9_disable_dc_states+0x1b3/0x200 [xe]
<4> [251.008441]  gen9_dc_off_power_well_enable+0xe/0x20 [xe]
<4> [251.008538]  intel_power_well_enable+0x5c/0x70 [xe]
<4> [251.008638]  intel_power_well_get+0x20/0x30 [xe]
<4> [251.008735]  __intel_display_power_get_domain.part.0+0x59/0x90 [xe]
<4> [251.008843]  intel_display_power_get+0x4c/0x70 [xe]
<4> [251.008946]  intel_power_domains_disable+0x27/0x80 [xe]
<4> [251.009046]  xe_display_pm_suspend+0x3b/0x100 [xe]
<4> [251.009167]  xe_pm_suspend+0x218/0x430 [xe]
<4> [251.009269]  xe_pci_suspend+0x19/0x60 [xe]
<4> [251.009365]  pci_pm_suspend+0x87/0x1b0
<4> [251.009372]  ? __pfx_pci_pm_suspend+0x10/0x10
<4> [251.009380]  dpm_run_callback+0x6c/0x200
<4> [251.009392]  device_suspend+0x182/0x610

> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][6] ([Intel XE#1201]) -> [SKIP][7] +40 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
	
No KMS driver or no outputs, pipes: 0, outputs: 0

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_color@ctm-signed:
>     - {shard-lnl}:        [PASS][8] -> [INCOMPLETE][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-lnl-1/igt@kms_color@ctm-signed.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-lnl-1/igt@kms_color@ctm-signed.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-133509v2_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#316])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#619])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#367])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#1252])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#307])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
>     - shard-dg2-set2:     [PASS][20] -> [DMESG-WARN][21] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#309])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
> 
>   * igt@kms_cursor_legacy@single-bo@pipe-a:
>     - shard-dg2-set2:     [PASS][23] -> [DMESG-WARN][24] ([Intel XE#282])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_cursor_legacy@single-bo@pipe-a.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cursor_legacy@single-bo@pipe-a.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1195]) +5 other tests incomplete
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend@bc-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@absolute-wf_vblank@d-hdmi-a1:
>     - shard-adlp:         [PASS][28] -> [INCOMPLETE][29] ([Intel XE#1195]) +1 other test incomplete
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_flip@absolute-wf_vblank@d-hdmi-a1.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_flip@absolute-wf_vblank@d-hdmi-a1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>     - shard-adlp:         [PASS][30] -> [FAIL][31] ([Intel XE#1874]) +2 other tests fail
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#656]) +15 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#1201] / [Intel XE#455])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-464/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][37] ([Intel XE#1191] / [Intel XE#1214]) +6 other tests dmesg-warn
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#870])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201]) +2 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-pr-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@kms_psr@fbc-pr-suspend.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-adlp:         NOTRUN -> [FAIL][41] ([Intel XE#1174])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#330])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#1447])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1126] / [Intel XE#1201])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-beng-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_evict@evict-beng-small-multi-vm.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-null.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-userptr:
>     - shard-dg2-set2:     [PASS][50] -> [DMESG-WARN][51] ([Intel XE#1214] / [Intel XE#1238])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@xe_exec_threads@threads-bal-mixed-userptr.html
> 
>   * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#1081])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-463/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-433/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
> 
>   * igt@xe_intel_bb@add-remove-objects:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][54] ([Intel XE#1330] / [Intel XE#1638] / [Intel XE#1760])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_intel_bb@add-remove-objects.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-adlp:         [PASS][55] -> [SKIP][56] ([Intel XE#1192] / [Intel XE#1201])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_live_ktest@xe_dma_buf.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-4/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#378])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-adlp:         [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-1/igt@xe_pm@s2idle-basic.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-1/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][60] ([Intel XE#1214] / [Intel XE#1608])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_pm@s2idle-d3hot-basic-exec.html
>     - shard-dg2-set2:     [PASS][61] -> [INCOMPLETE][62] ([Intel XE#1195] / [Intel XE#1358])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][63] -> [DMESG-WARN][64] ([Intel XE#1214]) +1 other test dmesg-warn
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-4/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][65] -> [ABORT][66] ([Intel XE#1358])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-1/igt@xe_pm@s4-exec-after.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][67] ([Intel XE#1033] / [Intel XE#1214]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][70] +2 other tests pass
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-434/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-433/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@2x-flip-vs-panning:
>     - shard-dg2-set2:     [DMESG-WARN][71] ([Intel XE#1214] / [Intel XE#877]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning.html
> 
>   * igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][73] ([Intel XE#1214]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-435/igt@kms_flip@2x-flip-vs-panning@ac-hdmi-a6-dp4.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [FAIL][75] ([Intel XE#1874]) -> [PASS][76] +1 other test pass
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][77] ([Intel XE#361]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][79] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][80] +1 other test pass
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large-multi-vm:
>     - shard-dg2-set2:     [TIMEOUT][81] ([Intel XE#1473]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large-multi-vm.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large-multi-vm.html
> 
>   * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate:
>     - {shard-lnl}:        [DMESG-WARN][83] ([Intel XE#1330]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-lnl-5/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [DMESG-WARN][85] ([Intel XE#1214]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - {shard-lnl}:        [FAIL][87] ([Intel XE#1442]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-lnl-3/igt@xe_pm_residency@gt-c6-freeze.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-adlp:         [ABORT][89] ([Intel XE#1538] / [Intel XE#1548] / [Intel XE#1717] / [Intel XE#1760]) -> [INCOMPLETE][90] ([Intel XE#1195] / [Intel XE#1365] / [Intel XE#1538] / [Intel XE#1717] / [Intel XE#1760])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_addfb_basic@bad-pitch-0:
>     - shard-dg2-set2:     [SKIP][91] ([Intel XE#1201] / [i915#6077]) -> [SKIP][92] ([i915#6077])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_addfb_basic@bad-pitch-0.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_addfb_basic@bad-pitch-0.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][93] ([Intel XE#316]) -> [SKIP][94] ([Intel XE#1201] / [Intel XE#316])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][95] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][96] ([Intel XE#316]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-90.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][97] ([Intel XE#1231]) -> [DMESG-FAIL][98] ([Intel XE#324]) +1 other test dmesg-fail
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][100] ([Intel XE#829]) +11 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][101] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][102] ([Intel XE#1124]) +2 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][103] ([Intel XE#1124]) -> [SKIP][104] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][105] ([Intel XE#367]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][107] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][108] ([Intel XE#367]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][109] ([Intel XE#787]) -> [SKIP][110] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][112] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][113] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][114] ([Intel XE#787]) +34 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][115] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#314]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][120] ([Intel XE#1152]) +3 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][122] ([Intel XE#373]) +3 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#373]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-storm.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][125] ([Intel XE#1178]) -> [INCOMPLETE][126] ([Intel XE#1195]) +1 other test incomplete
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-464/igt@kms_content_protection@atomic@pipe-a-dp-4.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-433/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#308]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#308])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cursor_crc@cursor-random-512x170.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][130] ([Intel XE#308])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#282]) -> [DMESG-WARN][132] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [Intel XE#1234]) -> [SKIP][134] ([Intel XE#1234])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][135] ([Intel XE#282]) -> [DMESG-WARN][136] ([Intel XE#1214] / [Intel XE#282])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#323]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#323])
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_cursor_legacy@single-bo@all-pipes:
>     - shard-dg2-set2:     [DMESG-WARN][139] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][140] ([Intel XE#282]) +2 other tests dmesg-warn
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_cursor_legacy@single-bo@all-pipes.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_cursor_legacy@single-bo@all-pipes.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-dg2-set2:     [SKIP][141] ([Intel XE#455]) -> [SKIP][142] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4:
>     - shard-dg2-set2:     [SKIP][143] ([Intel XE#455] / [Intel XE#929]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#929])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-dp-4.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][145] -> [SKIP][146] ([Intel XE#1201])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][147] ([i915#3804]) -> [SKIP][148] ([Intel XE#1201] / [i915#3804])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][149] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][150] ([Intel XE#1162]) +3 other tests dmesg-warn
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][152] ([Intel XE#651]) +9 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#651]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#651]) +12 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][156] ([Intel XE#653]) +13 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][157] ([Intel XE#653]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_getfb@getfb-handle-closed:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#687]) -> [SKIP][160] ([Intel XE#687]) +1 other test skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_getfb@getfb-handle-closed.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_getfb@getfb-handle-closed.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     [DMESG-WARN][161] ([Intel XE#1162]) -> [DMESG-WARN][162] ([Intel XE#1162] / [Intel XE#1214]) +1 other test dmesg-warn
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][164] ([Intel XE#870])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#870]) -> [SKIP][166] ([Intel XE#1201] / [Intel XE#870])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_pm_backlight@fade-with-suspend.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1122]) -> [SKIP][168] ([Intel XE#1122] / [Intel XE#1201])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][170] ([Intel XE#908])
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-adlp:         [SKIP][171] ([Intel XE#1201] / [Intel XE#1210]) -> [SKIP][172] ([Intel XE#1201])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_prop_blob@invalid-set-prop-any:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#780]) -> [SKIP][174] ([Intel XE#780])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_prop_blob@invalid-set-prop-any.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_prop_blob@invalid-set-prop-any.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][176] ([Intel XE#1122])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@kms_psr2_su@page_flip-xrgb8888.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#929]) -> [SKIP][178] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_psr@psr-dpms.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][180] ([Intel XE#929]) +7 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@kms_psr@psr-sprite-plane-onoff.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#327]) -> [SKIP][182] ([Intel XE#1201] / [Intel XE#327])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-adlp:         [DMESG-WARN][183] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][184] ([Intel XE#1034] / [Intel XE#1195])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][185] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][186] ([Intel XE#1034] / [Intel XE#1195])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-adlp:         [DMESG-WARN][187] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][188] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][189] ([Intel XE#1191] / [Intel XE#1214]) -> [DMESG-WARN][190] ([Intel XE#1214] / [Intel XE#1608])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][192] ([Intel XE#455]) +9 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-435/igt@kms_vrr@flip-dpms.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@kms_vrr@flip-dpms.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][194] ([Intel XE#1091])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][196] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_compute_preempt@compute-preempt-many:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][200] ([Intel XE#1123])
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#1126]) -> [SKIP][202] ([Intel XE#1126] / [Intel XE#1201])
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][203] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][204] ([Intel XE#1473] / [Intel XE#392])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-433/igt@xe_evict@evict-threads-large.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:
>     - shard-adlp:         [ABORT][205] -> [DMESG-WARN][206] ([Intel XE#1214] / [Intel XE#1330])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-8/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][208] ([Intel XE#288]) +15 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-imm:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#288]) -> [SKIP][210] ([Intel XE#1201] / [Intel XE#288]) +9 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-imm.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr-imm.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-adlp:         [DMESG-WARN][211] ([Intel XE#1162] / [Intel XE#1214]) -> [DMESG-WARN][212] ([Intel XE#1191] / [Intel XE#1214])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_gt_freq@freq_suspend.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-4/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1192] / [Intel XE#1201]) -> [SKIP][214] ([Intel XE#1192])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-432/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#512]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#512])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_mmap@small-bar.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_pm@s2idle-mocs:
>     - shard-adlp:         [INCOMPLETE][217] ([Intel XE#1195]) -> [DMESG-WARN][218] ([Intel XE#1214])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-1/igt@xe_pm@s2idle-mocs.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-8/igt@xe_pm@s2idle-mocs.html
> 
>   * igt@xe_pm@s2idle-vm-bind-userptr:
>     - shard-adlp:         [DMESG-WARN][219] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][220] ([Intel XE#1195])
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-userptr.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-userptr.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [ABORT][221] ([Intel XE#1358]) -> [DMESG-WARN][222] ([Intel XE#1214])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-adlp-2/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#579]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#579])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/shard-dg2-463/igt@xe_pm@vram-d3cold-threshold.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
>   [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
>   [Intel XE#1388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1388
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
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1442
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>   [Intel XE#1548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1548
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1606
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
>   [Intel XE#1663]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1663
>   [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
>   [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1818
>   [Intel XE#1830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1830
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
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
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab -> xe-pw-133509v2
> 
>   IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1300-3b6a503228b84c010794599203ac3e1e3d349bab: 3b6a503228b84c010794599203ac3e1e3d349bab
>   xe-pw-133509v2: 133509v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133509v2/index.html
> 
