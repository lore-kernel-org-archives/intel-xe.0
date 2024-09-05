Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EC9CD5BCF
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 16:07:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16510E153;
	Thu,  5 Sep 2024 16:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjcVvZVW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1BE10E153;
 Thu,  5 Sep 2024 16:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725552461; x=1757088461;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3xg6PlVqhHtMAWO82QXKGsSptDqCDM6z7GMNgMPn/jQ=;
 b=YjcVvZVWka5SMwDhC74fQSy0PO0lhdXD+HwLvhcB1PCWCrhhxwLq1utP
 Tkg6bKpcm/7U8U+P9rc+wVHJls3NmVCGkMaEYyo73A4qJsspdzxjW5pcl
 bv4UtDBXqF3ZyfOXxXswr7mjSTNN8zVYRkA6wnczO+EvKGVnNYZCWHvzn
 bq6+/NBH5YaRHRi/6NgOpS1sHD3go2ACJc25xSVeKFfC94BOI29OhfZxg
 szlBZm9QXeguKlVUKgr8pntyZV8eOYAi8jnJPy+OyJviR4YIBrdsAh0t6
 BjmspmboqlLMSXFnrszXavJlq6x8XJJUFHzDIft/bgFFx0wVi+DOE+l79 w==;
X-CSE-ConnectionGUID: xyHp3JGNQkGES+SDVrIS9w==
X-CSE-MsgGUID: PBW4VFXjSFG6m/4sg4Firg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="27208404"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="27208404"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 09:07:40 -0700
X-CSE-ConnectionGUID: 1tzgFB46Rv23osBOnAq/JQ==
X-CSE-MsgGUID: 1CB2JleOQOG+ovVdYqCSIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="65705037"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 05 Sep 2024 09:07:36 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BA7ED34EE8;
 Thu,  5 Sep 2024 17:07:34 +0100 (IST)
Message-ID: <6bde761f-fb7a-4052-8f96-55364b5d6155@intel.com>
Date: Thu, 5 Sep 2024 18:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_San?=
 =?UTF-8?Q?itize_VF_scratch_registers_on_FLR?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240902192953.1792-1-michal.wajdeczko@intel.com>
 <172533383595.909086.4247679310475930460@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172533383595.909086.4247679310475930460@2413ebb6fbb6>
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



On 03.09.2024 05:23, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Sanitize VF scratch registers on FLR
> URL   : https://patchwork.freedesktop.org/series/138113/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30_full -> xe-pw-138113v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138113v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138113v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-138113v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

must be unrelated
series is about VF FLR, while most "regressions" are from KMS

> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][1] +7 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-dg2-set2:     [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_hdr@static-toggle-dpms.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-6.html
> 
>   * igt@xe_exec_basic@twice-basic:
>     - shard-dg2-set2:     [PASS][5] -> [TIMEOUT][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-433/igt@xe_exec_basic@twice-basic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-463/igt@xe_exec_basic@twice-basic.html

this one is interesting, as it looks that the test was run on ADLP,
while shard name says this was a DG2 result

<6> [96.047696] [IGT] xe_exec_basic: executing
<6> [96.053257] [IGT] xe_exec_basic: starting subtest twice-basic
<7> [102.519331] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]]
[CONNECTOR:241:HDMI-A-1]
<7> [102.532128] xe 0000:00:02.0: [drm:xe_gt_resume [xe]] GT0: resuming


> 
>   * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
>     - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-435/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

seen elsewhere ...

<3> [447.789735] xe 0000:03:00.0: [drm] *ERROR* GT0: GuC PC Start failed
<4> [447.789799] ------------[ cut here ]------------
<4> [447.789800] xe 0000:03:00.0: [drm] GT0: Failed to start GuC PC: -EIO
<4> [447.789822] WARNING: CPU: 17 PID: 1770 at
drivers/gpu/drm/xe/xe_guc.c:1138 xe_guc_start+0xa3/0x1b0 [xe]

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@crc@pipe-c-dp-2:
>     - {shard-bmg}:        [FAIL][9] ([Intel XE#1656]) -> [DMESG-FAIL][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-bmg-4/igt@kms_async_flips@crc@pipe-c-dp-2.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-bmg-8/igt@kms_async_flips@crc@pipe-c-dp-2.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
>     - {shard-bmg}:        [INCOMPLETE][11] ([Intel XE#2613]) -> [INCOMPLETE][12] +1 other test incomplete
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - {shard-bmg}:        NOTRUN -> [INCOMPLETE][13]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-null:
>     - {shard-bmg}:        [PASS][14] -> [INCOMPLETE][15]
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-null.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-null.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30_full and xe-pw-138113v1_full:
> 
> ### New IGT tests (5) ###
> 
>   * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.79] s
> 
>   * igt@kms_cursor_crc@cursor-random-256x85@pipe-d-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.62] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-c-dp-2-size-128:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.98] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-c-dp-2-size-256:
>     - Statuses : 1 pass(s)
>     - Exec time: [2.98] s
> 
>   * igt@kms_plane_cursor@viewport@pipe-c-dp-2-size-64:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.03] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-138113v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
>     - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] ([Intel XE#1033])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>     - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#1701]) +1 other test fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>     - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#1659]) +2 other tests fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#316])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#619])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_chamelium_color@ctm-0-75:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#306])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_chamelium_color@ctm-0-75.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#306])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-2/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#373])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#307])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#309])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@single-move:
>     - shard-dg2-set2:     [PASS][34] -> [DMESG-WARN][35] ([Intel XE#877]) +2 other tests dmesg-warn
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@kms_cursor_legacy@single-move.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-433/igt@kms_cursor_legacy@single-move.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1135] / [Intel XE#1201])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1421])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1195] / [Intel XE#2597])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [PASS][42] -> [INCOMPLETE][43] ([Intel XE#2049] / [Intel XE#2597])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
>     - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#2597])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html
> 
>   * igt@kms_flip@wf_vblank-ts-check@a-edp1:
>     - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#886]) +3 other tests fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1401])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#656]) +11 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#651]) +1 other test skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#656]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#605])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_plane@plane-position-hole:
>     - shard-lnl:          [PASS][55] -> [DMESG-WARN][56] ([Intel XE#324]) +5 other tests dmesg-warn
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_plane@plane-position-hole.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_plane@plane-position-hole.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2318]) +3 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][58] -> [INCOMPLETE][59] ([Intel XE#1195]) +3 other tests incomplete
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-hdmi-a-6.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#734])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_psr@pr-primary-page-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-2/igt@kms_psr@pr-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-suspend@edp-1:
>     - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#2028]) +1 other test fail
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-2/igt@kms_psr@psr2-suspend@edp-1.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-7/igt@kms_psr@psr2-suspend@edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#899])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-large-external-cm:
>     - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#261])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@xe_evict@evict-large-external-cm.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][67] -> [TIMEOUT][68] ([Intel XE#1473])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-433/igt@xe_evict@evict-threads-large.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-466/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
> 
>   * igt@xe_exec_balancer@twice-parallel-basic:
>     - shard-dg2-set2:     [PASS][70] -> [DMESG-WARN][71] ([Intel XE#1638] / [Intel XE#358])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-433/igt@xe_exec_balancer@twice-parallel-basic.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-463/igt@xe_exec_balancer@twice-parallel-basic.html
> 
>   * igt@xe_exec_basic@multigpu-once-userptr-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#1392])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-userptr-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_oa@non-privileged-map-oa-buffer:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#2541])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@xe_oa@non-privileged-map-oa-buffer.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-adlp:         [PASS][75] -> [ABORT][76] ([Intel XE#1358] / [Intel XE#1607])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][77] -> [ABORT][78] ([Intel XE#1794]) +1 other test abort
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
>     - shard-lnl:          [PASS][79] -> [ABORT][80] ([Intel XE#1794])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#944])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
>     - {shard-bmg}:        [INCOMPLETE][82] -> [PASS][83] +1 other test pass
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-bmg-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][84] ([Intel XE#1426]) -> [PASS][85] +3 other tests pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [FAIL][86] ([Intel XE#1426]) -> [PASS][87] +3 other tests pass
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>     - {shard-bmg}:        [FAIL][88] ([Intel XE#1426]) -> [PASS][89] +1 other test pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-bmg-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-bmg-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - {shard-bmg}:        [DMESG-WARN][90] ([Intel XE#877]) -> [PASS][91] +2 other tests pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_flip@basic-plain-flip:
>     - shard-lnl:          [SKIP][92] ([Intel XE#2423]) -> [PASS][93] +7 other tests pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_flip@basic-plain-flip.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_flip@basic-plain-flip.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-lnl:          [SKIP][94] ([Intel XE#2351]) -> [PASS][95] +1 other test pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
>     - shard-lnl:          [DMESG-WARN][96] ([Intel XE#324]) -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][98] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [TIMEOUT][100] ([Intel XE#1473]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          [FAIL][102] ([Intel XE#1069]) -> [PASS][103]
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [DMESG-FAIL][104] ([Intel XE#1620] / [Intel XE#1760]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_pm@d3hot-multiple-execs:
>     - {shard-bmg}:        [TIMEOUT][106] -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-bmg-1/igt@xe_pm@d3hot-multiple-execs.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-bmg-5/igt@xe_pm@d3hot-multiple-execs.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [ABORT][108] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-adlp-9/igt@xe_pm@s4-basic.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [ABORT][110] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][111]
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-lnl:          [ABORT][112] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_query@query-config:
>     - shard-lnl:          [SKIP][114] ([Intel XE#1130]) -> [PASS][115] +17 other tests pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@xe_query@query-config.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@xe_query@query-config.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][117] ([Intel XE#316]) +2 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-lnl:          [SKIP][118] ([Intel XE#2351]) -> [SKIP][119] ([Intel XE#1407])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][120] ([Intel XE#316]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-180:
>     - shard-lnl:          [SKIP][122] ([Intel XE#2351]) -> [DMESG-WARN][123] ([Intel XE#1725])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-180.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [FAIL][124] ([Intel XE#1231]) -> [DMESG-FAIL][125] ([Intel XE#324])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
>     - shard-lnl:          [SKIP][126] ([Intel XE#2351]) -> [SKIP][127] ([Intel XE#1124])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][129] ([Intel XE#610])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][131] ([Intel XE#1124]) +4 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][132] ([Intel XE#1231]) -> [FAIL][133] ([Intel XE#1242])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#1124]) -> [SKIP][135] ([Intel XE#1124] / [Intel XE#1201]) +11 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][137] ([Intel XE#619])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#2191]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#2191])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#367]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][143] ([Intel XE#367])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][145] ([Intel XE#787]) +34 other tests skip
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
>     - shard-lnl:          [SKIP][146] ([Intel XE#2351]) -> [SKIP][147] ([Intel XE#1399]) +1 other test skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-dg2-set2:     [SKIP][148] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][149] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-dg2-set2:     [SKIP][150] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][151] ([Intel XE#1252])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][152] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][153] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][154] ([Intel XE#787]) -> [SKIP][155] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][156] ([Intel XE#1252]) -> [SKIP][157] ([Intel XE#1201] / [Intel XE#1252]) +4 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][159] ([Intel XE#306]) +3 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_chamelium_color@ctm-0-50.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][160] ([Intel XE#306]) -> [SKIP][161] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_chamelium_color@gamma.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-mode-timings:
>     - shard-lnl:          [SKIP][162] ([Intel XE#2423]) -> [SKIP][163] ([Intel XE#373]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_chamelium_edid@hdmi-mode-timings.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     [SKIP][164] ([Intel XE#373]) -> [SKIP][165] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][167] ([Intel XE#373]) +4 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-lnl:          [SKIP][168] ([Intel XE#2423]) -> [SKIP][169] ([Intel XE#599])
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_content_protection@srm.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][170] ([Intel XE#308]) -> [SKIP][171] ([Intel XE#1201] / [Intel XE#308])
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][173] ([Intel XE#455]) +9 other tests skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@kms_cursor_crc@cursor-random-max-size.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][175] ([Intel XE#308])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][176] ([Intel XE#323]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#323])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][178] ([Intel XE#455]) -> [SKIP][179] ([Intel XE#1201] / [Intel XE#455]) +16 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][180] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][181] ([Intel XE#701])
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][182] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][183] ([Intel XE#1135])
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_feature_discovery@psr1.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][184] ([Intel XE#1135]) -> [SKIP][185] ([Intel XE#1135] / [Intel XE#1201])
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_feature_discovery@psr2.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-lnl:          [SKIP][186] ([Intel XE#2351]) -> [SKIP][187] ([Intel XE#1401] / [Intel XE#1745])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-slowdraw:
>     - shard-dg2-set2:     [SKIP][188] ([Intel XE#651]) -> [SKIP][189] ([Intel XE#1201] / [Intel XE#651]) +27 other tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
>     - shard-lnl:          [SKIP][190] ([Intel XE#2351]) -> [SKIP][191] ([Intel XE#656]) +6 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
>     - shard-lnl:          [SKIP][192] ([Intel XE#2351]) -> [SKIP][193] ([Intel XE#651])
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][195] ([Intel XE#651]) +13 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][196] ([Intel XE#658]) -> [SKIP][197] ([Intel XE#1201] / [Intel XE#658]) +1 other test skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][198] ([Intel XE#653]) -> [SKIP][199] ([Intel XE#1201] / [Intel XE#653]) +27 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][201] ([Intel XE#653]) +14 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-dg2-set2:     [SKIP][202] ([Intel XE#605]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#605])
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>     - shard-dg2-set2:     [SKIP][204] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#498]) -> [SKIP][207] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][209] ([Intel XE#2318]) +2 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][211] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][213] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#2318]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#870]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#870])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1129]) -> [SKIP][219] ([Intel XE#1129] / [Intel XE#1201])
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][221] ([Intel XE#1489]) +1 other test skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#1489]) -> [SKIP][223] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#1122]) -> [SKIP][225] ([Intel XE#1122] / [Intel XE#1201])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr-no-drrs:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][227] ([Intel XE#929]) +9 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#929]) -> [SKIP][229] ([Intel XE#1201] / [Intel XE#929]) +13 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-lnl:          [SKIP][230] ([Intel XE#2423]) -> [SKIP][231] ([Intel XE#1127])
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#327]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#327])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [FAIL][234] ([Intel XE#1729]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#362])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#1500]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#1500])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#330]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#330])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#2168]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#2168])
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@kms_vrr@cmrr.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][243] ([Intel XE#756])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][245] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][246] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][247] ([Intel XE#1123])
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#1126]) -> [SKIP][249] ([Intel XE#1126] / [Intel XE#1201])
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
>     - shard-lnl:          [SKIP][250] ([Intel XE#1130]) -> [SKIP][251] ([Intel XE#1392]) +1 other test skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][253] ([Intel XE#288]) +13 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#288]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#288]) +22 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#2360]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#2360])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     [SKIP][258] ([Intel XE#255]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#255])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-adlp:         [TIMEOUT][260] ([Intel XE#2026]) -> [TIMEOUT][261] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026])
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-adlp-8/igt@xe_module_load@many-reload.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-adlp-4/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_oa@non-privileged-map-oa-buffer:
>     - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][263] ([Intel XE#2541]) +3 other tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-dg2-set2:     [SKIP][264] ([Intel XE#2541]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#2541]) +5 other tests skip
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-dg2-set2:     [SKIP][266] ([Intel XE#979]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#979])
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][268] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-dg2-set2:     [SKIP][270] ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][271] ([Intel XE#2284])
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@xe_pm@d3cold-mocs.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][273] ([Intel XE#944])
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-dg2-set2:     [SKIP][274] ([Intel XE#944]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/shard-dg2-432/igt@xe_query@multigpu-query-mem-usage.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
>   [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2141
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
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
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30 -> xe-pw-138113v1
> 
>   IGT_8001: d3a77fc98e89cc94b03be2b0903d44f83480b8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30: 0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30
>   xe-pw-138113v1: 138113v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/index.html
> 
