Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B74D1171C
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 07:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D5E10EA1B;
	Fri, 25 Oct 2024 07:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Npp/MEK5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DDD10EA1C;
 Fri, 25 Oct 2024 07:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729843047; x=1761379047;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZWHQFAYZWZx1aY++/LuQvi6u+5woaion/YJ7FH7HppU=;
 b=Npp/MEK51SVotxH7wiHXF1DkaYAtXBnU+f/q//Dy3ee4UAmlk54jpteH
 G2fZ+e/jha3Oa2YyuYVDz6mlbxq+O1gYXbqUAvbj5+7cTHXUC/X0BIWTM
 bx64ZhFZxyc+imFgHXBn7z3GT8BoJfQ6sBs8YXL4yZ/vN59DXnc7936fW
 /Kkh8l+gjsQPANz0j7Pr580G3VBIh/uopJUtOiljUlari2zQfRZpyjjID
 0BgnuRjp4aTHJe9aiRiPCB2C+0KQ3Lo2dCYjndKgSwHVt9dHGsTQIRwAp
 m5bhb1GSp36il1zPW1Vl2ZQAv0AIGEZLTiz1+YlGCr5hxNmBYqm2yMYHM g==;
X-CSE-ConnectionGUID: fVbcoOikTWKdjR+c6CznPw==
X-CSE-MsgGUID: NxLikmetTiCQh5TBy44a/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29282864"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29282864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 00:57:26 -0700
X-CSE-ConnectionGUID: aXjW/hP0TDeVuZJnyg/zDA==
X-CSE-MsgGUID: NQISk0PrQY2JGUIbTvTYJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="84806953"
Received: from zzombora-mobl1.ti.intel.com (HELO localhost) ([10.245.246.193])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 00:57:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: I915-ci-infra@lists.freedesktop.org, Patchwork
 <patchwork@emeril.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>
Subject: Re: =?utf-8?Q?=E2=9C=97?= CI.BAT: failure for drm/i915/display:
 platform identification with display->platform.<platform> (rev3)
In-Reply-To: <172981565466.1330037.6238046952250769671@2413ebb6fbb6>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1729773149.git.jani.nikula@intel.com>
 <172981565466.1330037.6238046952250769671@2413ebb6fbb6>
Date: Fri, 25 Oct 2024 10:57:20 +0300
Message-ID: <87wmhwr4wv.fsf@intel.com>
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
> Series: drm/i915/display: platform identification with display->platform.<platform> (rev3)
> URL   : https://patchwork.freedesktop.org/series/139301/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-2122-4a625fda23b27dd0fc6007ac5ba422a0fe6dfe48_BAT -> xe-pw-139301v3_BAT
> ====================================================
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with xe-pw-139301v3_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-139301v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.

Unrelated, please re-report.

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
>   Here are the unknown changes that may have been introduced in xe-pw-139301v3_BAT:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_exec_threads@threads-mixed-fd-basic:
>     - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2122-4a625fda23b27dd0fc6007ac5ba422a0fe6dfe48/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v3/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html
>
>   
> Known issues
> ------------
>
>   Here are the changes found in xe-pw-139301v3_BAT that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>   * igt@xe_live_ktest@xe_migrate:
>     - bat-atsm-2:         [PASS][3] -> [SKIP][4] ([Intel XE#1192]) +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2122-4a625fda23b27dd0fc6007ac5ba422a0fe6dfe48/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v3/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
>
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][5] ([Intel XE#2229]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v3/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>
>   
> #### Possible fixes ####
>
>   * igt@xe_exec_reset@cm-close-fd-no-exec:
>     - bat-adlp-vf:        [DMESG-WARN][6] -> [PASS][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2122-4a625fda23b27dd0fc6007ac5ba422a0fe6dfe48/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v3/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
>
>   * igt@xe_exec_threads@threads-mixed-fd-basic:
>     - bat-atsm-2:         [DMESG-WARN][8] -> [PASS][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2122-4a625fda23b27dd0fc6007ac5ba422a0fe6dfe48/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v3/bat-atsm-2/igt@xe_exec_threads@threads-mixed-fd-basic.html
>
>   * igt@xe_live_ktest@xe_bo:
>     - bat-adlp-vf:        [SKIP][10] ([Intel XE#1192]) -> [PASS][11] +2 other tests pass
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2122-4a625fda23b27dd0fc6007ac5ba422a0fe6dfe48/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v3/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
>
>   
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>
>
> Build changes
> -------------
>
>   * Linux: xe-2122-4a625fda23b27dd0fc6007ac5ba422a0fe6dfe48 -> xe-pw-139301v3
>
>   IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2122-4a625fda23b27dd0fc6007ac5ba422a0fe6dfe48: 4a625fda23b27dd0fc6007ac5ba422a0fe6dfe48
>   xe-pw-139301v3: 139301v3
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v3/index.html

-- 
Jani Nikula, Intel
