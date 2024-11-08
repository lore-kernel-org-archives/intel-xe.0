Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AF6D5E145
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 09:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3304E10E94A;
	Fri,  8 Nov 2024 09:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGq2Nv7Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC32010E949;
 Fri,  8 Nov 2024 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731057065; x=1762593065;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=dlsEvKEczrFPmMc9W+UKmH2DpGOwVwOyb6r23TnyqiA=;
 b=LGq2Nv7QnKfRycgj4QVbs53kjHO5D7+I/+G3kVHsuZXVAleFyxgAYX71
 PAKIDHQbMNWvZIN2lOwWSmv2cSarIzX6zcSIUCoaqsQlV+gB6JGki9sjI
 ci/TQjlckwpKlf3eP+ztEM412O5zM4UOUbr5GgG0AQ20x7DyzBZGZwqkD
 iVyfwKVY89vYwv+ExTFSb71wkfh6a/jXWrMX61WA6Kxh7/l64iXZaFcNG
 rmyHGCYKYlQouVgTGtg9hDEvuHMpTZxN/PlK5Uk9oHI2iBcRA/ybFL15I
 Pn/D+yJGMIbISMDhWmoI97Zg/EtXnKrn2rMT+R3yp8/VVylMWJKa/g+Fu g==;
X-CSE-ConnectionGUID: 16JkwYgdQvWolgH2GN+IVQ==
X-CSE-MsgGUID: 5a6+uMSORhOlkEjXu+Zpgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34625716"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34625716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 01:11:04 -0800
X-CSE-ConnectionGUID: pOTSzppITo2dw0AmSk8R9Q==
X-CSE-MsgGUID: i4L3ofW6T2WEWAc6NZYJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="116314526"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 01:11:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= CI.BAT: failure for drm/i915/dp: demote
 source OUI read/write failure logging to debug
In-Reply-To: <173091449754.1418203.1419511222388016206@2413ebb6fbb6>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241106162325.4065078-1-jani.nikula@intel.com>
 <173091449754.1418203.1419511222388016206@2413ebb6fbb6>
Date: Fri, 08 Nov 2024 11:10:59 +0200
Message-ID: <87bjyqf5uk.fsf@intel.com>
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

On Wed, 06 Nov 2024, Patchwork <patchwork@emeril.freedesktop.org> wrote:
> == Series Details ==
>
> Series: drm/i915/dp: demote source OUI read/write failure logging to debug
> URL   : https://patchwork.freedesktop.org/series/141015/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d_BAT -> xe-pw-141015v1_BAT
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-141015v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-141015v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.

Please re-report, both i915 and xe.

BR,
Jani.

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
>   Here are the unknown changes that may have been introduced in xe-pw-141015v1_BAT:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_module_load@load:
>     - bat-dg2-oem2:       [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@xe_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@xe_module_load@load.html
>
>   
> Known issues
> ------------
>
>   Here are the changes found in xe-pw-141015v1_BAT that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([Intel XE#1885])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>
>   * igt@fbdev@nullptr:
>     - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +4 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@fbdev@nullptr.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@fbdev@nullptr.html
>
>   * igt@kms_addfb_basic@bad-pitch-128:
>     - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] ([i915#2575]) +50 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [PASS][9] -> [FAIL][10] ([Intel XE#1861])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>     - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] ([Intel XE#2231])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
>
>   * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
>     - bat-adlp-7:         [PASS][13] -> [INCOMPLETE][14] ([Intel XE#2874]) +1 other test incomplete
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
>
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
>
>   * igt@xe_prime_self_import@basic-with_fd_dup:
>     - bat-dg2-oem2:       [PASS][17] -> [SKIP][18] ([Intel XE#1130]) +157 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
>
>   
> #### Possible fixes ####
>
>   * igt@kms_addfb_basic@bad-pitch-0:
>     - bat-adlp-7:         [DMESG-WARN][19] ([Intel XE#2496]) -> [PASS][20] +31 other tests pass
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
>
>   
> #### Warnings ####
>
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-oem2:       [SKIP][21] ([Intel XE#623]) -> [SKIP][22] ([i915#2575])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-oem2:       [SKIP][23] ([Intel XE#455]) -> [SKIP][24] ([Intel XE#2231])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-oem2:       [SKIP][25] ([i915#5274]) -> [SKIP][26] ([i915#2575])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-dg2-oem2:       [SKIP][27] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][28] ([Intel XE#2231]) +2 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - bat-dg2-oem2:       [SKIP][29] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][30] ([i915#2575]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
>     - bat-dg2-oem2:       [SKIP][31] ([Intel XE#288]) -> [SKIP][32] ([Intel XE#1130]) +32 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
>
>   * igt@xe_huc_copy@huc_copy:
>     - bat-dg2-oem2:       [SKIP][33] ([Intel XE#255]) -> [SKIP][34] ([Intel XE#1130])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>
>   * igt@xe_pat@pat-index-xe2:
>     - bat-dg2-oem2:       [SKIP][35] ([Intel XE#2839] / [Intel XE#977]) -> [SKIP][36] ([Intel XE#1130])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-dg2-oem2:       [SKIP][37] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][38] ([Intel XE#1130])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>
>   * igt@xe_pat@pat-index-xelpg:
>     - bat-dg2-oem2:       [SKIP][39] ([Intel XE#979]) -> [SKIP][40] ([Intel XE#1130])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
>
>   
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
>   [Intel XE#2496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2496
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
>   [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
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
>   * Linux: xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d -> xe-pw-141015v1
>
>   IGT_8099: 27be46dee80b6b0de80f9fa3cd9bb5f55edccaf8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2178-334cc1166d7241367450ee517d933e1dc8b1c96d: 334cc1166d7241367450ee517d933e1dc8b1c96d
>   xe-pw-141015v1: 141015v1
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141015v1/index.html

-- 
Jani Nikula, Intel
