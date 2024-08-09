Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C979EC52D71
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 08:37:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908DC10E0CB;
	Fri,  9 Aug 2024 08:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVoZxRMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB7610E0CB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 08:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723192646; x=1754728646;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7FM1G/qpbRpq/k1R8pg8DmUgXWYixOczwNGPdabd2RU=;
 b=gVoZxRMZQ2mKEhtKzm6UmU3dmo8IHYp+iw2B0lfG4NRXKmCUEVIM44yu
 OaBgI/4HUn3ke86C91ZxvPkUBGjLFR+c3RswrBG7iegw9KcWb2ZVizrTL
 xwXatmCPaX4DUOcoWjjhWpZir50IubQH8Fm4vzzJ7IVrl0vMm4Xu0YyY2
 FlKzKNyWOXXEUNCrBvZ+LyWdsAjrp7yR2MWK9+fd0wpiluGO0M8AbbzB5
 LIhCeMGcDOPxib4+30qweQhP8R3mHEzhBMnbOof4Ajt2gWOAxca+Xq6AX
 ibXmNFvrS6gPd6BPHoF59aRBzZDKxJo/3FJRcn8+s6sMTx3bTdn+fERqy A==;
X-CSE-ConnectionGUID: ighKZOT6T/+1AFrCwIVv6A==
X-CSE-MsgGUID: qWpfVV2rTKegszzlFIRGeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21482090"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="21482090"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 01:37:26 -0700
X-CSE-ConnectionGUID: EUzLEj+HQGaTBsqX38gwmQ==
X-CSE-MsgGUID: 9Malop28SdSycxTN7Ssf6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="58212901"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 09 Aug 2024 01:37:21 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 72F382877D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 09:37:19 +0100 (IST)
Message-ID: <bdfb8508-c41c-43d9-8993-1fc5d8019977@intel.com>
Date: Fri, 9 Aug 2024 10:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_Fix?=
 =?UTF-8?Q?_VF_config_validation_on_multi-GT_platforms?=
To: intel-xe@lists.freedesktop.org
References: <20240806180516.618-1-michal.wajdeczko@intel.com>
 <172298012184.544132.3810884765933607766@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172298012184.544132.3810884765933607766@2413ebb6fbb6>
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



On 06.08.2024 23:35, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Fix VF config validation on multi-GT platforms
> URL   : https://patchwork.freedesktop.org/series/136944/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1722-83eea64f81edb86ed3aa368039520810c154fd94_full -> xe-pw-136944v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-136944v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-136944v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-136944v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated, all from non-SRIOV runs

> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-5/igt@kms_fbcon_fbt@psr-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
>     - shard-lnl:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

<4> [80.249711] ============================================
<4> [80.249713] WARNING: possible recursive locking detected
<4> [80.249715] 6.11.0-rc2-xe #1 Tainted: G     U
<4> [80.249717] --------------------------------------------
<4> [80.249718] kworker/4:1/81 is trying to acquire lock:
<4> [80.249720] ffff8881177871a0 (&ucsi->ppm_lock){+.+.}-{3:3}, at:
ucsi_reset_ppm+0x37/0x1b0 [typec_ucsi]
<4> [80.249730]
but task is already holding lock:
<4> [80.249731] ffff8881177871a0 (&ucsi->ppm_lock){+.+.}-{3:3}, at:
ucsi_send_command_common+0x72/0x350 [typec_ucsi]

> 
>   * igt@xe_pm@d3hot-mocs:
>     - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@xe_pm@d3hot-mocs.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-466/igt@xe_pm@d3hot-mocs.html


<5> [237.874720] xe 0000:03:00.0: [drm] GT0: Timedout job:
seqno=4294967169, lrc_seqno=4294967169, guc_id=2894, flags=0x0 in
xe_exec_reset [1580]
<7> [237.874715] xe 0000:03:00.0: [drm:intel_crtc_state_dump [xe]]
[PLANE:120:plane 5B] fb: [NOFB], visible: no
<7> [237.874771] xe 0000:03:00.0: [drm:intel_crtc_state_dump [xe]]
[PLANE:129:cursor B] fb: [NOFB], visible: no
<5> [237.875436] xe 0000:03:00.0: [drm] GT0: Timedout job:
seqno=4294967169, lrc_seqno=4294967169, guc_id=2895, flags=0x0 in
xe_exec_reset [1580]
<7> [237.875477] xe 0000:03:00.0: [drm:intel_audio_codec_disable [xe]]
[CONNECTOR:264:DP-4][ENCODER:263:DDI C/PHY C] Disable audio codec on
[CRTC:134:pipe B]
<5> [237.876204] xe 0000:03:00.0: [drm] GT0: Timedout job:
seqno=4294967169, lrc_seqno=4294967169, guc_id=2896, flags=0x0 in
xe_exec_reset [1580]
<5> [237.876971] xe 0000:03:00.0: [drm] GT0: Timedout job:
seqno=4294967169, lrc_seqno=4294967169, guc_id=2897, flags=0x0 in
xe_exec_reset [1580]

...


<4> [238.268829] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268828] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268829] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268829] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268831] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268831] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268831] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268831] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268829] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268831] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268829] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268829] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268831] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268830] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268833] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<4> [238.268846] xe 0000:03:00.0: [drm] Missing outer runtime PM protection
<7> [238.268827] xe 0000:03:00.0: [drm:xe_gt_suspend [xe]] GT0: suspending
<4> [238.268852] WARNING: CPU: 14 PID: 961 at
drivers/gpu/drm/xe/xe_pm.c:559 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
<4> [238.268852] WARNING: CPU: 6 PID: 231 at
drivers/gpu/drm/xe/xe_pm.c:559 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
<4> [238.268852] WARNING: CPU: 7 PID: 963 at
drivers/gpu/drm/xe/xe_pm.c:559 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
<4> [238.268852] WARNING: CPU: 11 PID: 979 at
drivers/gpu/drm/xe/xe_pm.c:559 xe_pm_runtime_get_noresume+0x48/0x60 [xe]
<4> [238.268855] WARNING: CPU: 10 PID: 964 at
drivers/gpu/drm/xe/xe_pm.c:559 xe_pm_runtime_get_noresume+0x48/0x60 [xe]


> 
>   
> #### Warnings ####
> 
>   * igt@kms_vrr@lobf:
>     - shard-dg2-set2:     [SKIP][7] ([Intel XE#1201]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@kms_vrr@lobf.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_vrr@lobf.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-dp-2:
>     - {shard-bmg}:        [PASS][9] -> [FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-dp-2.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-b-dp-2.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic:
>     - {shard-bmg}:        NOTRUN -> [INCOMPLETE][11]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html
> 
>   * igt@kms_plane@pixel-format@pipe-b-plane-0:
>     - {shard-bmg}:        [PASS][12] -> [DMESG-WARN][13] +5 other tests dmesg-warn
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-bmg-6/igt@kms_plane@pixel-format@pipe-b-plane-0.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-bmg-8/igt@kms_plane@pixel-format@pipe-b-plane-0.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - {shard-bmg}:        [PASS][14] -> [INCOMPLETE][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-bmg-4/igt@xe_pm@s2idle-basic-exec.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-bmg-5/igt@xe_pm@s2idle-basic-exec.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-136944v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1125])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@intel_hwmon@hwmon-read.html
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1125] / [Intel XE#1201])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>     - shard-adlp:         [PASS][18] -> [DMESG-WARN][19] ([Intel XE#1033])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-adlp:         [PASS][20] -> [FAIL][21] ([Intel XE#1426]) +1 other test fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][22] -> [FAIL][23] ([Intel XE#1426]) +3 other tests fail
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1124] / [Intel XE#1201])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>     - shard-lnl:          NOTRUN -> [FAIL][25] ([Intel XE#1659])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][26] ([Intel XE#1725])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1407])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [FAIL][28] ([Intel XE#1874])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1124]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][30] ([Intel XE#1231])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#2191])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2191])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1399]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#373]) +3 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1468])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#599]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1413])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x32:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1424]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_cursor_crc@cursor-sliding-32x32.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#309]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1421]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_flip@2x-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1401]) +1 other test skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1397] / [Intel XE#1745])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1397])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
>     - shard-adlp:         [PASS][50] -> [FAIL][51] ([Intel XE#1874]) +3 other tests fail
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#352])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#651]) +3 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#656]) +5 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][55] ([Intel XE#1861])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#656]) +15 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][59] -> [DMESG-WARN][60] ([Intel XE#2019])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#2028]) +4 other tests fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-7/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-3:
>     - shard-lnl:          [PASS][63] -> [DMESG-WARN][64] ([Intel XE#324]) +1 other test dmesg-warn
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#2318]) +3 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@kms_psr@pr-primary-page-flip.html
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1406]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1437])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1435]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@xe_ccs@block-multicopy-inplace:
>     - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@xe_ccs@block-multicopy-inplace.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1123] / [Intel XE#1201])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x369.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@xe_evict@evict-beng-large-multi-vm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][74] -> [TIMEOUT][75] ([Intel XE#1473] / [Intel XE#402])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][76] -> [TIMEOUT][77] ([Intel XE#1473])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#688]) +4 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@xe_evict@evict-small-multi-vm.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][80] -> [TIMEOUT][81] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@xe_evict@evict-threads-large.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1392]) +4 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@xe_exec_basic@multigpu-once-userptr-rebind.html
> 
>   * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
>     - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#1069])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-6/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#379])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@xe_noexec_ping_pong.html
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#379])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_oa@rc6-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#2207])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@xe_oa@rc6-disable.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@xe_pm@d3cold-basic-exec.html
>     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#1924] / [Intel XE#2028]) +1 other test fail
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-7/igt@xe_pm@s2idle-basic.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-1/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-dg2-set2:     [PASS][94] -> [INCOMPLETE][95] ([Intel XE#1195] / [Intel XE#1358])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@xe_pm@s2idle-basic-exec.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-463/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [PASS][96] -> [ABORT][97] ([Intel XE#1358])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-6/igt@xe_pm@s4-basic.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-9/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [PASS][98] -> [ABORT][99] ([Intel XE#1794])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-1/igt@xe_pm@s4-mocs.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-9/igt@xe_pm@s4-mocs.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - {shard-bmg}:        [FAIL][100] ([Intel XE#1426]) -> [PASS][101] +1 other test pass
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
>     - {shard-bmg}:        [FAIL][102] -> [PASS][103] +1 other test pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-adlp:         [FAIL][104] ([Intel XE#1426]) -> [PASS][105] +1 other test pass
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - {shard-bmg}:        [DMESG-WARN][106] -> [PASS][107] +3 other tests pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-adlp:         [DMESG-WARN][108] ([Intel XE#877]) -> [PASS][109] +1 other test pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-4/igt@kms_cursor_legacy@torture-bo@pipe-a.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-6/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
>     - shard-adlp:         [FAIL][110] ([Intel XE#1874]) -> [PASS][111] +2 other tests pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - {shard-bmg}:        [SKIP][112] ([Intel XE#1503]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][114] ([Intel XE#1162]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-466/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [DMESG-FAIL][116] ([Intel XE#324]) -> [PASS][117] +3 other tests pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-5/igt@kms_plane@plane-position-hole.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-b-plane-1:
>     - shard-lnl:          [DMESG-WARN][118] ([Intel XE#324]) -> [PASS][119] +2 other tests pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-b-plane-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][120] ([Intel XE#361]) -> [PASS][121]
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_psr@psr-suspend@edp-1:
>     - shard-lnl:          [FAIL][122] ([Intel XE#2028] / [Intel XE#2447]) -> [PASS][123] +1 other test pass
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-1/igt@kms_psr@psr-suspend@edp-1.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-8/igt@kms_psr@psr-suspend@edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - {shard-bmg}:        [FAIL][124] ([Intel XE#899]) -> [PASS][125] +2 other tests pass
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-bmg-3/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-dg2-set2:     [FAIL][126] ([Intel XE#771] / [Intel XE#899]) -> [PASS][127]
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][128] ([Intel XE#899]) -> [PASS][129] +1 other test pass
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][130] ([Intel XE#899]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][132] ([Intel XE#2028]) -> [PASS][133] +4 other tests pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-lnl:          [FAIL][134] ([Intel XE#2443]) -> [PASS][135] +1 other test pass
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-8/igt@kms_vrr@max-min.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-3/igt@kms_vrr@max-min.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - {shard-bmg}:        [TIMEOUT][136] -> [PASS][137] +3 other tests pass
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][138] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][140] ([Intel XE#1473]) -> [PASS][141]
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_reset@cat-error:
>     - shard-adlp:         [DMESG-WARN][142] ([Intel XE#358]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-8/igt@xe_exec_reset@cat-error.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-1/igt@xe_exec_reset@cat-error.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-lnl:          [FAIL][144] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][145]
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-1/igt@xe_pm@s2idle-multiple-execs.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-4/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [ABORT][146] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html
>     - shard-lnl:          [ABORT][148] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][149]
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-lnl:          [ABORT][150] ([Intel XE#1794]) -> [PASS][151]
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#623]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#623])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#316]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-90.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][157] ([Intel XE#316]) +2 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][158] ([Intel XE#1231]) -> [DMESG-FAIL][159] ([Intel XE#324])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#1124]) -> [SKIP][161] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][162] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][163] ([Intel XE#1124]) +10 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#346]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#346])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_big_joiner@basic.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][167] ([Intel XE#367]) +2 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][168] ([Intel XE#2191]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#2191])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][171] ([Intel XE#2191]) +1 other test skip
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#367]) -> [SKIP][173] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][175] ([Intel XE#787]) +83 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#1252]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#1252]) +2 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][179] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][181] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#787]) -> [SKIP][183] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#306]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_chamelium_color@degamma.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][187] ([Intel XE#306]) +1 other test skip
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@kms_chamelium_color@gamma.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][189] ([Intel XE#373]) +8 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][190] ([Intel XE#373]) -> [SKIP][191] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][193] ([Intel XE#307])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][195] ([Intel XE#308]) +1 other test skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#308]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#308])
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#323]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][201] ([Intel XE#323])
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#1137]) -> [SKIP][203] ([Intel XE#1137] / [Intel XE#1201])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#1135]) -> [SKIP][205] ([Intel XE#1135] / [Intel XE#1201])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][207] ([Intel XE#455]) +17 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#455]) -> [SKIP][209] ([Intel XE#1201] / [Intel XE#455]) +15 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#651]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#658]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#658])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][215] ([Intel XE#651]) +29 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#653]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][219] ([Intel XE#653]) +29 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#356]) -> [SKIP][221] ([Intel XE#1201] / [Intel XE#356])
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [DMESG-FAIL][222] ([Intel XE#324]) -> [DMESG-WARN][223] ([Intel XE#324])
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-lnl-3/igt@kms_plane@plane-position-covered.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-lnl-2/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#870]) -> [SKIP][225] ([Intel XE#1201] / [Intel XE#870])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_pm_backlight@fade.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][227] ([Intel XE#908])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][229] ([Intel XE#1129])
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#1489]) -> [SKIP][231] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][233] ([Intel XE#1489]) +2 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][235] ([Intel XE#1122])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1122]) -> [SKIP][237] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_psr2_su@page_flip-nv12.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr-cursor-render:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#929]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-render.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@kms_psr@fbc-psr-cursor-render.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][241] ([Intel XE#929]) +13 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][243] ([Intel XE#1149])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#1127]) -> [SKIP][245] ([Intel XE#1127] / [Intel XE#1201])
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][247] ([Intel XE#327]) +1 other test skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#756]) -> [SKIP][249] ([Intel XE#1201] / [Intel XE#756])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][251] ([Intel XE#756]) +1 other test skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#1091]) -> [SKIP][253] ([Intel XE#1091] / [Intel XE#1201])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][255] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-435/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][257] ([Intel XE#1123])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][258] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][259] ([Intel XE#1126])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfd.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#288]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][263] ([Intel XE#288]) +25 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#1192]) -> [SKIP][265] ([Intel XE#1192] / [Intel XE#1201])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#2229]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#2229])
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][268] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][269] ([Intel XE#512])
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-435/igt@xe_mmap@small-bar.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@closed-fd-and-unmapped-access:
>     - shard-dg2-set2:     [SKIP][270] ([Intel XE#2207]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#2207]) +5 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html
> 
>   * igt@xe_oa@non-privileged-map-oa-buffer:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#2207]) -> [SKIP][273] ([Intel XE#2207]) +5 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][275] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     [SKIP][276] ([Intel XE#2284]) -> [SKIP][277] ([Intel XE#1201] / [Intel XE#2284])
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-435/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-dg2-set2:     [SKIP][278] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][279] ([Intel XE#579])
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-dg2-set2:     [SKIP][280] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][281] ([Intel XE#944]) +2 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     [SKIP][282] ([Intel XE#944]) -> [SKIP][283] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
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
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2058]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2058
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
>   [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
>   [Intel XE#2400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2400
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#2447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2447
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1722-83eea64f81edb86ed3aa368039520810c154fd94 -> xe-pw-136944v1
> 
>   IGT_7958: 5e93c0e266d7ebd74ea12b3b03cb50253a2ab760 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1722-83eea64f81edb86ed3aa368039520810c154fd94: 83eea64f81edb86ed3aa368039520810c154fd94
>   xe-pw-136944v1: 136944v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/index.html
> 
