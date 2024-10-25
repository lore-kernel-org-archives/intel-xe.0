Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FF5D0C5F7
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 09:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264D810EA51;
	Fri, 25 Oct 2024 09:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYgj7sO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02D310EA50;
 Fri, 25 Oct 2024 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729849085; x=1761385085;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zBQfS45JL2BHrytjMAYRUZYWXzjn29Dk4U7ph40Y7LI=;
 b=SYgj7sO1dDQUNus3LX8rP6nOJHMRNG5HSynOZhuiuWwklE4ZyhM9zMqP
 jsh2EF8KJr65R6gBJgsqqVpobEWUyhM7omy25dCXMta/gxZxm94GyirVu
 a21ZPtcwyaytReut3Mn5ld04FC/aIUN+Eyq21mMHSwdT5okwTI/0qtZM0
 M3vN+7zTeD9xxwrOK6OX46j8nUqY9dU6DEY6jV2uDWoqA6ylld9qRWAhC
 i3IUP+7osB4CHRGLgP0wai4QHcmNzB6NrNjUjrlG8fl0Z5kslxipdfLXL
 UuK/F5umUd/ZBNZv8OsxDonrECyA0MFRXu3JEzTGKjBh93lSAUpoSe/wZ g==;
X-CSE-ConnectionGUID: CygbteyCQV6c8u0lbe2FxQ==
X-CSE-MsgGUID: lLf+7UZmTXqDKdpDdUmHIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33205167"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33205167"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:38:05 -0700
X-CSE-ConnectionGUID: L2162QlMTNqnFMZL2Gn9Xg==
X-CSE-MsgGUID: EWdLk0tHTxCl0puulzu7EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80876157"
Received: from zzombora-mobl1.ti.intel.com (HELO localhost) ([10.245.246.193])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:38:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: I915-ci-infra@lists.freedesktop.org, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= CI.BAT: failure for drm/i915/display:
 convert I915_STATE_WARN() to struct intel_display
In-Reply-To: <172982424447.1330038.18068578951431910244@2413ebb6fbb6>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241024162510.2410128-1-jani.nikula@intel.com>
 <172982424447.1330038.18068578951431910244@2413ebb6fbb6>
Date: Fri, 25 Oct 2024 12:37:58 +0300
Message-ID: <87msisr095.fsf@intel.com>
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
> Series: drm/i915/display: convert I915_STATE_WARN() to struct intel_display
> URL   : https://patchwork.freedesktop.org/series/140450/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4_BAT -> xe-pw-140450v1_BAT
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-140450v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-140450v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-140450v1_BAT:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
>
>   * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
>     - bat-lnl-2:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>
>   * igt@xe_exec_reset@cm-close-fd-no-exec:
>     - bat-lnl-1:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html

Unrelated, please re-report.

BR,
Jani.


>
>   
> #### Warnings ####
>
>   * igt@xe_exec_reset@cm-close-fd-no-exec:
>     - bat-dg2-oem2:       [SKIP][7] ([Intel XE#1130]) -> [DMESG-WARN][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>
>   
> Known issues
> ------------
>
>   Here are the changes found in xe-pw-140450v1_BAT that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-lnl-1:          [PASS][9] -> [FAIL][10] ([Intel XE#886]) +2 other tests fail
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>
>   * igt@xe_live_ktest@xe_bo:
>     - bat-lnl-1:          [PASS][11] -> [SKIP][12] ([Intel XE#1192]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
>
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - bat-adlp-7:         NOTRUN -> [SKIP][13] ([Intel XE#2229]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>     - bat-lnl-2:          NOTRUN -> [SKIP][14] ([Intel XE#2229]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
>
>   
> #### Possible fixes ####
>
>   * igt@core_hotunplug@unbind-rebind:
>     - bat-dg2-oem2:       [SKIP][17] ([Intel XE#1885]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
>
>   * igt@fbdev@nullptr:
>     - bat-dg2-oem2:       [SKIP][19] ([Intel XE#2134]) -> [PASS][20] +4 other tests pass
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@fbdev@nullptr.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@fbdev@nullptr.html
>
>   * igt@kms_addfb_basic@bad-pitch-128:
>     - bat-dg2-oem2:       [SKIP][21] ([Intel XE#2423] / [i915#2575]) -> [PASS][22] +50 other tests pass
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
>
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-dg2-oem2:       [SKIP][23] ([Intel XE#2351]) -> [PASS][24]
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
>
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - bat-lnl-1:          [DMESG-WARN][25] -> [PASS][26]
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
>
>   * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
>     - bat-pvc-2:          [DMESG-WARN][27] -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>
>   * igt@xe_exec_reset@cm-close-fd-no-exec:
>     - bat-adlp-7:         [DMESG-WARN][29] -> [PASS][30]
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
>     - bat-lnl-2:          [DMESG-WARN][31] -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-lnl-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-adlp-7:         [SKIP][33] ([Intel XE#1192]) -> [PASS][34] +2 other tests pass
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
>     - bat-lnl-2:          [SKIP][35] ([Intel XE#1192]) -> [PASS][36] +2 other tests pass
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
>
>   * igt@xe_module_load@load:
>     - bat-dg2-oem2:       [FAIL][37] ([Intel XE#2136]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_module_load@load.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@xe_module_load@load.html
>
>   * igt@xe_prime_self_import@basic-with_fd_dup:
>     - bat-dg2-oem2:       [SKIP][39] ([Intel XE#1130]) -> [PASS][40] +156 other tests pass
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
>
>   
> #### Warnings ####
>
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-oem2:       [SKIP][41] ([Intel XE#2423] / [i915#2575]) -> [SKIP][42] ([Intel XE#623])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-oem2:       [SKIP][43] ([Intel XE#2351]) -> [SKIP][44] ([Intel XE#455])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
>
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-oem2:       [SKIP][45] ([Intel XE#2423] / [i915#2575]) -> [SKIP][46] ([i915#5274])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
>
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-dg2-oem2:       [SKIP][47] ([Intel XE#2351]) -> [SKIP][48] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
>
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - bat-dg2-oem2:       [SKIP][49] ([Intel XE#2423] / [i915#2575]) -> [SKIP][50] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
>
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
>     - bat-dg2-oem2:       [SKIP][51] ([Intel XE#1130]) -> [SKIP][52] ([Intel XE#288]) +32 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
>
>   * igt@xe_huc_copy@huc_copy:
>     - bat-dg2-oem2:       [SKIP][53] ([Intel XE#1130]) -> [SKIP][54] ([Intel XE#255])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
>
>   * igt@xe_pat@pat-index-xe2:
>     - bat-dg2-oem2:       [SKIP][55] ([Intel XE#1130]) -> [SKIP][56] ([Intel XE#2839] / [Intel XE#977])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
>
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-dg2-oem2:       [SKIP][57] ([Intel XE#1130]) -> [SKIP][58] ([Intel XE#2838] / [Intel XE#979])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
>
>   * igt@xe_pat@pat-index-xelpg:
>     - bat-dg2-oem2:       [SKIP][59] ([Intel XE#1130]) -> [SKIP][60] ([Intel XE#979])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
>
>   
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
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
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
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
>   * Linux: xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4 -> xe-pw-140450v1
>
>   IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2125-75eab7b9ee32a121d95a42ac704b679097f1fac4: 75eab7b9ee32a121d95a42ac704b679097f1fac4
>   xe-pw-140450v1: 140450v1
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140450v1/index.html

-- 
Jani Nikula, Intel
