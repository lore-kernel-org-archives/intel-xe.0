Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED891C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 17:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F0910E29D;
	Fri, 24 May 2024 17:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4vYfe2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BB210E172;
 Fri, 24 May 2024 17:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716571552; x=1748107552;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=rjjK78sIkwmKRjX2uNcV1Q/HXyQU2Y9Zg1yPJoMSxr4=;
 b=A4vYfe2GQFxT6QqgDNqBsppYujnmvRU1xhmngvZE1BjC0dxuCVwF5fxv
 UorEbjFW+uLBIXTm/RL4eSVtDCAC/6psjk37pTaG4WTla8D2nRnYXygIj
 pPaFSlJxX9xNbu4hgT1vGZ7VTl3GXD8l+XNK0xgrXlolhr3zhzzCw4FSm
 kR8Kw85Hjc/nwafKueJiyWaWwPLag/dKCbBqGM9XeofCEJYE1qf+zqo54
 Y1m7UqYmAMtl2jvazaa5/e+5EXCZJumV+5bZd87HDR7q72fBZHSIvVGg4
 Y8NAxDLCReiQLcIcwJir3P+ypdurDhndUcbJPVh0QNMpUQHU5hCF599Lw Q==;
X-CSE-ConnectionGUID: tWJkpqkKQy6m8LyvWbDZsg==
X-CSE-MsgGUID: qDwhyRWhT86eN0LD6yNuBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="30495636"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="30495636"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 10:25:52 -0700
X-CSE-ConnectionGUID: lHU6uYroT2qOhwm/JMwq3A==
X-CSE-MsgGUID: b/R4qjOTSzGYp13+R7AkLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="38875089"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 24 May 2024 10:25:50 -0700
Received: from [10.246.49.231] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.49.231])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8934433EA9;
 Fri, 24 May 2024 18:25:48 +0100 (IST)
Message-ID: <fd2ec68c-a988-46dd-90e3-77196fce3540@intel.com>
Date: Fri, 24 May 2024 19:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_Add_DRM-managed_d?=
 =?UTF-8?B?cm1fbW1faW5pdCgp?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240524133518.976-1-michal.wajdeczko@intel.com>
 <171656091377.2171858.15958220205850908430@8e613ede5ea5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171656091377.2171858.15958220205850908430@8e613ede5ea5>
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



On 24.05.2024 16:28, Patchwork wrote:
> == Series Details ==
> 
> Series: Add DRM-managed drm_mm_init()
> URL   : https://patchwork.freedesktop.org/series/134021/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1340-20495a62e9c3838fda495585fb4bda8e38cc1c6f_BAT -> xe-pw-134021v1_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134021v1_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134021v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 5)
> ------------------------------
> 
>   Additional (1): bat-adlp-7 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-134021v1_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_compute_mode@twice-preempt-fence-early:
>     - bat-atsm-2:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1340-20495a62e9c3838fda495585fb4bda8e38cc1c6f/bat-atsm-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134021v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

this looks like XE#1908

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134021v1_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#455])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134021v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         NOTRUN -> [DMESG-FAIL][4] ([Intel XE#324])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134021v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   * igt@xe_evict@evict-small-cm:
>     - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134021v1/bat-adlp-7/igt@xe_evict@evict-small-cm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-simple:
>     - bat-adlp-7:         NOTRUN -> [SKIP][6] ([Intel XE#688]) +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134021v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
>     - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#288]) +32 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134021v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
> 
>   * igt@xe_mmap@vram:
>     - bat-adlp-7:         NOTRUN -> [SKIP][8] ([Intel XE#1008])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134021v1/bat-adlp-7/igt@xe_mmap@vram.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - bat-adlp-7:         NOTRUN -> [SKIP][9] ([Intel XE#977])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134021v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - bat-adlp-7:         NOTRUN -> [SKIP][10] ([Intel XE#979]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134021v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
> 
>   
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1340-20495a62e9c3838fda495585fb4bda8e38cc1c6f -> xe-pw-134021v1
> 
>   IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1340-20495a62e9c3838fda495585fb4bda8e38cc1c6f: 20495a62e9c3838fda495585fb4bda8e38cc1c6f
>   xe-pw-134021v1: 134021v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134021v1/index.html
> 
