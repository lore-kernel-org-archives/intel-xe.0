Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC414D0C5F4
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 09:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5C710EA4A;
	Fri, 25 Oct 2024 09:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFKBUwg5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6430F10EA4A;
 Fri, 25 Oct 2024 09:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729849158; x=1761385158;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PIKlyjTKfbYhFtxnfv5gDTpSC3/Lv3o3Z+ticDPLQaw=;
 b=IFKBUwg5EsyqPZ4dmPFa5v+BfoYlM/+LtZvdBwKFEAfn/B/QlgJsKNPj
 bMUk7/NSDeushnoNeVHwOPiNzNA0gFeIXgT7vbIqnwArHKh3IttmJ2ius
 l/u6HupMOo5RLKorcCtQCMSd/e4354pmkX+9K25rujxxSN/sb5osFkgu9
 HlH1RoRwUv9JlItdaF3k4cxBB17lqE/ecZqUbLUAvx5I+X6xUgSYQuFwF
 smPkqs7hc261JhVdnbGDv7pZ94cSo8HmA0qXTZGRGo9Caf2U/3y1X0NXB
 efwRV/zjQtVoFEoKKqwqeaZZ5WP/UU7r/S1GmB36fApis5VFsO49zJoH4 w==;
X-CSE-ConnectionGUID: kH/+KWj7Q/er08dgG4HlEQ==
X-CSE-MsgGUID: ea5harh1Sf6kXRlmLRpZbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29291556"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29291556"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 02:39:18 -0700
X-CSE-ConnectionGUID: Fen/6yGcQYKZQLJDr6Gdug==
X-CSE-MsgGUID: banNzi7jRJiZnJ3XBetIRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80466269"
Received: from zzombora-mobl1.ti.intel.com (HELO localhost) ([10.245.246.193])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:39:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: I915-ci-infra@lists.freedesktop.org, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= CI.BAT: failure for drm/i915/display:
 bunch of struct intel_display conversions (rev2)
In-Reply-To: <172981849964.1330038.16133455483045565936@2413ebb6fbb6>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1729776384.git.jani.nikula@intel.com>
 <172981849964.1330038.16133455483045565936@2413ebb6fbb6>
Date: Fri, 25 Oct 2024 12:39:11 +0300
Message-ID: <87jzdwr074.fsf@intel.com>
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
> Series: drm/i915/display: bunch of struct intel_display conversions (rev2)
> URL   : https://patchwork.freedesktop.org/series/140323/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-2123-526c63710d1e43d3bf56ed9260f69412533de182_BAT -> xe-pw-140323v2_BAT
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-140323v2_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-140323v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-140323v2_BAT:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_exec_fault_mode@twice-invalid-fault:
>     - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
>     - bat-bmg-2:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
>
>   * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
>     - bat-pvc-2:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>
>   * igt@xe_exec_reset@cm-close-fd-no-exec:
>     - bat-bmg-1:          [PASS][7] -> [DMESG-WARN][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
>     - bat-dg2-oem2:       [PASS][9] -> [DMESG-WARN][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-bmg-1:          [PASS][11] -> [SKIP][12] +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

Unrelated, please re-report.

BR,
Jani.

>
>   
> Known issues
> ------------
>
>   Here are the changes found in xe-pw-140323v2_BAT that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
>     - bat-adlp-7:         NOTRUN -> [SKIP][13] ([Intel XE#2229]) +2 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
>
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-dg2-oem2:       [PASS][14] -> [SKIP][15] ([Intel XE#1192]) +2 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
>
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - bat-pvc-2:          NOTRUN -> [SKIP][16] ([Intel XE#2229]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - bat-lnl-1:          NOTRUN -> [SKIP][17] ([Intel XE#2229]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>
>   
> #### Possible fixes ####
>
>   * igt@kms_psr@psr-cursor-plane-move:
>     - bat-adlp-7:         [SKIP][18] ([Intel XE#455]) -> [PASS][19] +1 other test pass
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
>
>   * igt@kms_psr@psr-primary-page-flip@edp-1:
>     - bat-adlp-7:         [DMESG-FAIL][20] ([Intel XE#2871]) -> [PASS][21] +1 other test pass
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
>
>   * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
>     - bat-bmg-2:          [DMESG-WARN][22] -> [PASS][23]
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
>
>   * igt@xe_exec_reset@cm-close-fd-no-exec:
>     - bat-pvc-2:          [DMESG-WARN][24] -> [PASS][25]
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
>     - bat-lnl-1:          [DMESG-WARN][26] -> [PASS][27]
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
>     - bat-adlp-7:         [DMESG-WARN][28] -> [PASS][29]
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
>
>   * igt@xe_exec_threads@threads-mixed-basic:
>     - bat-bmg-1:          [DMESG-WARN][30] -> [PASS][31]
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-bmg-1/igt@xe_exec_threads@threads-mixed-basic.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-bmg-1/igt@xe_exec_threads@threads-mixed-basic.html
>
>   * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
>     - bat-dg2-oem2:       [DMESG-WARN][32] -> [PASS][33]
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
>
>   * igt@xe_live_ktest@xe_bo:
>     - bat-lnl-1:          [SKIP][34] ([Intel XE#1192]) -> [PASS][35] +2 other tests pass
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
>     - bat-pvc-2:          [SKIP][36] -> [PASS][37] +2 other tests pass
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
>
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-adlp-7:         [SKIP][38] ([Intel XE#1192]) -> [PASS][39] +2 other tests pass
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
>
>   
> #### Warnings ####
>
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - bat-adlp-7:         [SKIP][40] ([Intel XE#455]) -> [DMESG-FAIL][41] ([Intel XE#2871]) +1 other test dmesg-fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2123-526c63710d1e43d3bf56ed9260f69412533de182/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html
>
>   
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2871]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>
>
> Build changes
> -------------
>
>   * Linux: xe-2123-526c63710d1e43d3bf56ed9260f69412533de182 -> xe-pw-140323v2
>
>   IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2123-526c63710d1e43d3bf56ed9260f69412533de182: 526c63710d1e43d3bf56ed9260f69412533de182
>   xe-pw-140323v2: 140323v2
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140323v2/index.html

-- 
Jani Nikula, Intel
