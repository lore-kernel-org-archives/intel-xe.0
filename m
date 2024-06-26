Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAF8C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 17:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A717210E426;
	Wed, 26 Jun 2024 17:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="joejBbXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5ED10E082
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 17:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719423335; x=1750959335;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=aMDJyTPp7dmMsWijuxdOTKuXnGoWv1ou8NYnf2BvSyg=;
 b=joejBbXRBfWmjrPedyNItxHb7/sFD84/BEjYrWptJlG3G2JY0kz8jEyn
 LQiOAqenyB8XD6bYuvsgixjk5S2wTee+tTx+eK/7MeI3AS94z5w9ex0pK
 T6iLCqxEDqHPh91LnfLZzaZb4XTn0/+M8RAfxfl22vLar9c6LIB5xvJhV
 9gyqaxOXRHBJc5QkH5FAanGjkKURFQoAzT2tKcmuarHyocnoQ4/sR1T63
 czLiRq9xcuXUMCcoHtoOuJeLinjIKaYM0nBu4awphTFIuUcGZY1oqeFV/
 wUOGFDbsZPrUvCUNORwrgO87F4XRXmheAyaMViVjL/XGtUZDJYFPCK0nA w==;
X-CSE-ConnectionGUID: LSZ7aT8mTgalfNtlZluKfw==
X-CSE-MsgGUID: 1DYzdjTrS4uahPnpkiR1Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27913530"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="27913530"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 10:35:35 -0700
X-CSE-ConnectionGUID: K7u1Yee3TC+fTvLGGm6hnA==
X-CSE-MsgGUID: vlKYO1GTSUKuQXNUpUBUYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="67295322"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa002.fm.intel.com with ESMTP; 26 Jun 2024 10:35:30 -0700
Received: from [10.246.34.68] (mwajdecz-MOBL.ger.corp.intel.com [10.246.34.68])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 70D2C28785
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 18:35:28 +0100 (IST)
Message-ID: <05cacecc-940b-4b84-817e-1611165737b3@intel.com>
Date: Wed, 26 Jun 2024 19:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/pf=3A_Dis?=
 =?UTF-8?Q?able_VFs_on_remove?=
To: intel-xe@lists.freedesktop.org
References: <20240626111827.1389-1-michal.wajdeczko@intel.com>
 <171942183181.161869.2850480882923197034@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171942183181.161869.2850480882923197034@a6498e030952>
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



On 26.06.2024 19:10, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Disable VFs on remove
> URL   : https://patchwork.freedesktop.org/series/135423/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356_full -> xe-pw-135423v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135423v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135423v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-135423v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
>     - shard-adlp:         NOTRUN -> [FAIL][1] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-4/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html

(sriov_basic:945) igt_device-WARNING: Couldn't find PCI device 0000:00:02:02
(sriov_basic:945) igt_sriov_device-CRITICAL: Test assertion failure
function __igt_sriov_bind_vf_drm_driver, file
../../../usr/src/igt-gpu-tools/lib/igt_sriov_device.c:310:
(sriov_basic:945) igt_sriov_device-CRITICAL: Failed assertion: pci_dev
(sriov_basic:945) igt_sriov_device-CRITICAL: Last errno: 2, No such file
or directory
(sriov_basic:945) igt_sriov_device-CRITICAL: No PCI device for given VF
number: 2

this is a test issue, see [1] where it was seen for the first time

[1]
https://lore.kernel.org/intel-xe/0af94a5d-894d-4b43-b7db-d35d819a3944@intel.com/

> 
>   
> #### Warnings ####
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each:
>     - shard-adlp:         [SKIP][2] ([Intel XE#1201] / [Intel XE#1932]) -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-adlp-2/igt@sriov_basic@enable-vfs-bind-unbind-each.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-4/igt@sriov_basic@enable-vfs-bind-unbind-each.html

ditto

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_lease@lease-invalid-plane:
>     - {shard-lnl}:        [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-lnl-5/igt@kms_lease@lease-invalid-plane.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-lnl-6/igt@kms_lease@lease-invalid-plane.html
> 
>   * igt@kms_vrr@flipline:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-lnl-5/igt@kms_vrr@flipline.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - {shard-lnl}:        [SKIP][7] ([Intel XE#1091]) -> [INCOMPLETE][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind:
>     - {shard-lnl}:        [PASS][9] -> [ABORT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-lnl-3/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-lnl-5/igt@xe_exec_threads@threads-hang-shared-vm-userptr-rebind.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135423v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
>     - shard-adlp:         [PASS][11] -> [INCOMPLETE][12] ([Intel XE#1195])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#373])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#323])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#776])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#656]) +11 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][26] ([Intel XE#616])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_lowres@tiling-x:
>     - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1195]) +4 other tests incomplete
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-463/igt@kms_plane_lowres@tiling-x.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-463/igt@kms_plane_lowres@tiling-x.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201]) +15 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#771] / [Intel XE#899])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-adlp:         [PASS][35] -> [FAIL][36] ([Intel XE#899])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@xe_ccs@block-copy-compressed:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@xe_ccs@block-copy-compressed.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [PASS][38] -> [TIMEOUT][39] ([Intel XE#1473])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-8/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][41] -> [TIMEOUT][42] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@xe_evict@evict-threads-large.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_reset@cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][45] ([Intel XE#1214] / [Intel XE#358])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@xe_exec_reset@cat-error.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-userptr:
>     - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#1214])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-464/igt@xe_exec_threads@threads-bal-mixed-userptr.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@xe_exec_threads@threads-bal-mixed-userptr.html
> 
>   * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][48] ([Intel XE#1169] / [Intel XE#1195])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-8/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         [PASS][49] -> [FAIL][50] ([Intel XE#1414])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-adlp:         [PASS][51] -> [TIMEOUT][52] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-adlp-1/igt@xe_module_load@many-reload.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#977])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-8/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-dg2-set2:     [PASS][54] -> [INCOMPLETE][55] ([Intel XE#1195] / [Intel XE#1694]) +1 other test incomplete
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-433/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s2idle-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][56] -> [INCOMPLETE][57] ([Intel XE#1195] / [Intel XE#1694])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-adlp:         NOTRUN -> [TIMEOUT][58] ([Intel XE#1358])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-8/igt@xe_pm@s3-exec-after.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][59] ([Intel XE#827]) -> [PASS][60] +1 other test pass
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - {shard-lnl}:        [FAIL][61] ([Intel XE#1659]) -> [PASS][62]
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_psr@fbc-psr-suspend@edp-1:
>     - {shard-lnl}:        [DMESG-WARN][63] ([Intel XE#2052]) -> [PASS][64] +2 other tests pass
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-lnl-2/igt@kms_psr@fbc-psr-suspend@edp-1.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-lnl-1/igt@kms_psr@fbc-psr-suspend@edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][65] ([Intel XE#771] / [Intel XE#899]) -> [PASS][66]
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][67] ([Intel XE#899]) -> [PASS][68]
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][69] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][70] +1 other test pass
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][71] ([Intel XE#1600]) -> [PASS][72]
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-435/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][73] ([Intel XE#2097]) -> [PASS][74] +1 other test pass
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-lnl-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-lnl-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
> 
>   * igt@xe_gt_freq@freq_low_max:
>     - shard-dg2-set2:     [FAIL][75] ([Intel XE#1045] / [Intel XE#1204]) -> [PASS][76]
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@xe_gt_freq@freq_low_max.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@xe_gt_freq@freq_low_max.html
>     - {shard-lnl}:        [FAIL][77] ([Intel XE#1829]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-lnl-1/igt@xe_gt_freq@freq_low_max.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-lnl-8/igt@xe_gt_freq@freq_low_max.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - {shard-lnl}:        [SKIP][79] ([Intel XE#1192]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-lnl-2/igt@xe_live_ktest@xe_mocs.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-lnl-1/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [ABORT][81] ([Intel XE#1794]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_async_flips@invalid-async-flip:
>     - shard-dg2-set2:     [SKIP][83] ([Intel XE#873]) -> [SKIP][84] ([Intel XE#1201] / [Intel XE#873])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][85] ([Intel XE#316]) -> [SKIP][86] ([Intel XE#1201] / [Intel XE#316])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][87] ([Intel XE#1124]) -> [SKIP][88] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][89] ([Intel XE#367]) -> [SKIP][90] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][91] ([Intel XE#787]) -> [SKIP][92] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     [SKIP][93] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][94] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][95] ([Intel XE#1252]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#1252])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-dg2-set2:     [SKIP][97] ([Intel XE#306]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_chamelium_color@ctm-blue-to-red.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#373]) -> [SKIP][100] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-435/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     [SKIP][101] ([Intel XE#307]) -> [SKIP][102] ([Intel XE#1201] / [Intel XE#307])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][103] ([Intel XE#1178]) -> [INCOMPLETE][104] ([Intel XE#1195]) +3 other tests incomplete
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-434/igt@kms_content_protection@legacy@pipe-a-dp-4.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     [SKIP][105] ([Intel XE#308]) -> [SKIP][106] ([Intel XE#1201] / [Intel XE#308])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][107] ([Intel XE#323]) -> [SKIP][108] ([Intel XE#1201] / [Intel XE#323])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][109] ([i915#3804]) -> [SKIP][110] ([Intel XE#1201] / [i915#3804])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-dg2-set2:     [SKIP][111] ([Intel XE#1137]) -> [SKIP][112] ([Intel XE#1137] / [Intel XE#1201])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [DMESG-WARN][113] ([Intel XE#1214]) -> [INCOMPLETE][114] ([Intel XE#1195])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][115] ([Intel XE#1551]) -> [DMESG-WARN][116] ([Intel XE#1214] / [Intel XE#1551]) +1 other test dmesg-warn
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][117] ([Intel XE#455]) -> [SKIP][118] ([Intel XE#1201] / [Intel XE#455]) +18 other tests skip
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-suspend:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#651]) -> [SKIP][120] ([Intel XE#1201] / [Intel XE#651]) +20 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][121] ([Intel XE#653]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][123] ([Intel XE#305] / [Intel XE#455]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][125] ([Intel XE#305]) -> [SKIP][126] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#870]) -> [SKIP][128] ([Intel XE#1201] / [Intel XE#870])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_pm_backlight@fade.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-435/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-dg2-set2:     [SKIP][129] ([Intel XE#1129]) -> [SKIP][130] ([Intel XE#1129] / [Intel XE#1201])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
>     - shard-dg2-set2:     [SKIP][131] ([Intel XE#1489]) -> [SKIP][132] ([Intel XE#1201] / [Intel XE#1489]) +4 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#929]) -> [SKIP][134] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     [SKIP][135] ([Intel XE#327]) -> [SKIP][136] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@kms_rotation_crc@bad-tiling.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@xe_exec_fault_mode@once-basic-imm:
>     - shard-dg2-set2:     [SKIP][137] ([Intel XE#288]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#288]) +18 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-433/igt@xe_exec_fault_mode@once-basic-imm.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#1337]) -> [SKIP][140] ([Intel XE#1201] / [Intel XE#1337])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1829
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
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
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356 -> xe-pw-135423v1
> 
>   IGT_7901: dceed442a14a0abd09065cbade94cefe11e00422 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356: 4e4d42f54537b821c3aea17ef8b669a36ac09356
>   xe-pw-135423v1: 135423v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135423v1/index.html
> 
