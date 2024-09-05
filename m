Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4699CCD5BCB
	for <intel-xe@archiver.kernel.org>; Thu,  5 Sep 2024 15:13:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD8F10E900;
	Thu,  5 Sep 2024 15:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X71RllZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED2810E900
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 15:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725549216; x=1757085216;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6ltLENXkZMuLoeHvkmKRBHA5cN1VSkznKWhHKETZ7PI=;
 b=X71RllZ9k8gvycGRSF7ebEs6xsX2lEXjUQbWKE5DuJ6xATxixjE54k4Q
 fN4C9Mvd4sCdbxUpTfF7DRR/EYPE+R258u+86rIkw+oZZVze4Xzm94wFZ
 KYPI5C6dvykQADJ7o0P4bObtEho14EpBkpksmJHVzsXqjIAi55NizjaAJ
 phLcKA5LeuUyqYjv3gDcJiMFcri5WTwzWhps7NFvH4AmXBFX5SgW/jyzD
 lLltU5QhbvpCxJ4xHEpyrmMNINgWuIOliYN9ylzVXIVxpu/p9TW16Ncuy
 QdgXuUi7Cv6BZSWgBvAatcmgkXzM8qnWecX9OJbhRBXigPMkPOH9Y+9bx A==;
X-CSE-ConnectionGUID: yJWQP/GMQe2T3AN6pMODXQ==
X-CSE-MsgGUID: wl/Oz8SxSlyDbhOwfK8I9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="46804513"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="46804513"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 08:13:35 -0700
X-CSE-ConnectionGUID: 7iPMqPS2R92Ii3gf+P22Xg==
X-CSE-MsgGUID: sabRjRKhQQuzjTnwHGSilQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="65359804"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 05 Sep 2024 08:13:34 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 1021134EE7
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Sep 2024 16:13:32 +0100 (IST)
Message-ID: <99291baf-3d11-40de-a18d-306d78be266b@intel.com>
Date: Thu, 5 Sep 2024 17:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/pf=3A_Sani?=
 =?UTF-8?Q?tize_VF_scratch_registers_on_FLR?=
To: intel-xe@lists.freedesktop.org
References: <20240902192953.1792-1-michal.wajdeczko@intel.com>
 <172530990530.908431.16385326892500773298@2413ebb6fbb6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <172530990530.908431.16385326892500773298@2413ebb6fbb6>
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



On 02.09.2024 22:45, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Sanitize VF scratch registers on FLR
> URL   : https://patchwork.freedesktop.org/series/138113/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30_BAT -> xe-pw-138113v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138113v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138113v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-138113v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

unrelated, series is about VF FLR, while "regression" is in KMS

> 
>   * igt@kms_addfb_basic@addfb25-4-tiled:
>     - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/bat-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-4-tiled.html

<6> [302.207037] xe 0000:00:02.0: [drm] GT0: Engine reset:
engine_class=bcs, logical_mask: 0x2, guc_id=0
<5> [302.207126] xe 0000:00:02.0: [drm] GT0: Timedout job:
seqno=4294967169, lrc_seqno=4294967169, guc_id=0, flags=0x13 in no
process [-1]
<6> [302.207883] xe 0000:00:02.0: [drm] Xe device coredump has been created
<6> [302.207885] xe 0000:00:02.0: [drm] Check your
/sys/class/drm/card0/device/devcoredump/data
<4> [302.208583] ------------[ cut here ]------------
<4> [302.208585] xe 0000:00:02.0: [drm] GT0: Kernel-submitted job timed out
<4> [302.208603] WARNING: CPU: 2 PID: 11 at
drivers/gpu/drm/xe/xe_guc_submit.c:1190
guc_exec_queue_timedout_job+0x8be/0xc00 [xe]
<7> [302.208643] xe 0000:00:02.0: [drm:drm_mode_addfb2 [drm]] [FB:190]

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-138113v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#1861])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - bat-lnl-1:          [PASS][5] -> [SKIP][6] ([Intel XE#1192]) +2 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-lnl-1:          [FAIL][7] ([Intel XE#886]) -> [PASS][8] +2 other tests pass
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1879-0c71de2cc65c5f4ee75046f1c04fdf56ea7c5f30/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138113v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
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
