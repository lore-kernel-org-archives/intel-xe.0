Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9132FD0C5F4
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 09:40:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610E810E3EC;
	Fri, 25 Oct 2024 09:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OW83a0je";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4C110E3EC;
 Fri, 25 Oct 2024 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729849240; x=1761385240;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pry1QQERvbmPd6jD1dgrTjMkalztI1QKXWT5bUbE/As=;
 b=OW83a0jeSO+Wyb4nFAdaY/6GSP1P14yaYKkTGe7EmPjZfeUTndLJOAPy
 ZNgyXyjuV0qwVvQ5cTJ+Ktfgs46kZMXHshL21n7Nvtb0+YpTirgi6Waz1
 0+sYOx1jCTTuKoJuzPQah9+vQbI05I7jL34fRcsxTovO7MwqqG0YLHjri
 Pc9Kf7yRAlso/GEjmjIKeTOTvDjwRE6NpYA5WhFAwlJLCQYnKWzaOYzg8
 vNljzlgpLNRv/nsJTG3Dd1V3Ta+wBs8CU6o6JsWhvtC9DDEETWa610WVb
 0oyGjHHgzov5eYP++YeR53edmesQvt1OCEuJ3CARLoHcH8eXMCz2pPMnl g==;
X-CSE-ConnectionGUID: +eSD/SMmQMiGruUFrER6Vg==
X-CSE-MsgGUID: RfBhbKYZSNysMvgJLDvsSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="54915716"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="54915716"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:40:40 -0700
X-CSE-ConnectionGUID: D6rmzoeARrGQCj6+V9EQNg==
X-CSE-MsgGUID: k2yn9IGkRZaixflPfIlIIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="111681862"
Received: from zzombora-mobl1.ti.intel.com (HELO localhost) ([10.245.246.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:40:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: I915-ci-infra@lists.freedesktop.org, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= CI.BAT: failure for drm/i915/display: use
 x100 version for full version and release
In-Reply-To: <172982692454.1330677.7967849802036028891@2413ebb6fbb6>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241024171104.2427750-1-jani.nikula@intel.com>
 <172982692454.1330677.7967849802036028891@2413ebb6fbb6>
Date: Fri, 25 Oct 2024 12:40:33 +0300
Message-ID: <87h690r04u.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 25 Oct 2024, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: drm/i915/display: use x100 version for full version and release
> URL   : https://patchwork.freedesktop.org/series/140455/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4_BAT -> xe-pw-140455v1_BAT
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-140455v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-140455v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
>
>   
>
> Participating hosts (9 -> 9)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in xe-pw-140455v1_BAT:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
>     - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>
>   * igt@xe_exec_reset@cm-close-fd-no-exec:
>     - bat-pvc-2:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>
>   * igt@xe_live_ktest@xe_bo:
>     - bat-pvc-2:          [PASS][5] -> [SKIP][6] +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

Unrelated, please re-report.

BR,
Jani.

>
>   
> #### Warnings ####
>
>   * igt@xe_exec_threads@threads-mixed-basic:
>     - bat-dg2-oem2:       [SKIP][7] ([Intel XE#1130]) -> [DMESG-WARN][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
>
>   
> Known issues
> ------------
>
>   Here are the changes found in xe-pw-140455v1_BAT that come from known issues:
>
> ### IGT changes ###
>
> #### Possible fixes ####
>
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-dg2-oem2:       [SKIP][9] ([Intel XE#1885]) -> [PASS][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>
>   * igt@fbdev@nullptr:
>     - bat-dg2-oem2:       [SKIP][11] ([Intel XE#2134]) -> [PASS][12] +4 other tests pass
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@fbdev@nullptr.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@fbdev@nullptr.html
>
>   * igt@kms_addfb_basic@bad-pitch-128:
>     - bat-dg2-oem2:       [SKIP][13] ([Intel XE#2423] / [i915#2575]) -> [PASS][14] +50 other tests pass
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [FAIL][15] ([Intel XE#1861]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>     - bat-dg2-oem2:       [SKIP][17] ([Intel XE#2351]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
>
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - bat-lnl-1:          [DMESG-WARN][19] -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
>
>   * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
>     - bat-pvc-2:          [DMESG-WARN][21] -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - bat-dg2-oem2:       [SKIP][23] ([Intel XE#2229]) -> [PASS][24] +1 other test pass
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
>
>   * igt@xe_module_load@load:
>     - bat-dg2-oem2:       [FAIL][25] ([Intel XE#2136]) -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_module_load@load.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@xe_module_load@load.html
>
>   * igt@xe_prime_self_import@basic-with_fd_dup:
>     - bat-dg2-oem2:       [SKIP][27] ([Intel XE#1130]) -> [PASS][28] +156 other tests pass
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
>
>   
> #### Warnings ####
>
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-oem2:       [SKIP][29] ([Intel XE#2423] / [i915#2575]) -> [SKIP][30] ([Intel XE#623])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-oem2:       [SKIP][31] ([Intel XE#2351]) -> [SKIP][32] ([Intel XE#455])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-oem2:       [SKIP][33] ([Intel XE#2423] / [i915#2575]) -> [SKIP][34] ([i915#5274])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-dg2-oem2:       [SKIP][35] ([Intel XE#2351]) -> [SKIP][36] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - bat-dg2-oem2:       [SKIP][37] ([Intel XE#2423] / [i915#2575]) -> [SKIP][38] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
>     - bat-dg2-oem2:       [SKIP][39] ([Intel XE#1130]) -> [SKIP][40] ([Intel XE#288]) +32 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
>
>   * igt@xe_huc_copy@huc_copy:
>     - bat-dg2-oem2:       [SKIP][41] ([Intel XE#1130]) -> [SKIP][42] ([Intel XE#255])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>
>   * igt@xe_pat@pat-index-xe2:
>     - bat-dg2-oem2:       [SKIP][43] ([Intel XE#1130]) -> [SKIP][44] ([Intel XE#2839] / [Intel XE#977])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-dg2-oem2:       [SKIP][45] ([Intel XE#1130]) -> [SKIP][46] ([Intel XE#2838] / [Intel XE#979])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>
>   * igt@xe_pat@pat-index-xelpg:
>     - bat-dg2-oem2:       [SKIP][47] ([Intel XE#1130]) -> [SKIP][48] ([Intel XE#979])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
>
>   
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>
>
> Build changes
> -------------
>
>   * Linux: xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4 -> xe-pw-140455v1
>
>   IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4: 75eab7b9ee32a121d95a42ac704b679097f1fac4
>   xe-pw-140455v1: 140455v1
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140455v1/index.html

-- 
Jani Nikula, Intel
