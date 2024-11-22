Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D098E69181
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 16:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D7E10EC0D;
	Fri, 22 Nov 2024 16:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMRncCmz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C818410EC0D
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732292967; x=1763828967;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=r79UzIHUkSmph9Hpb3ndrXTWKAHkvgtlRJWVnZ4cOVs=;
 b=GMRncCmzmfCJRoueJQaAalWoDk+ZKzZpvsX8EybTmz8Op8P1mYlfuTo0
 PaJWVJJTmSFQstTkOPMBJMeam3w1b1Ow9TrvKvY0Kd5G+jK9dRDVqJGcu
 0AELQED3MYrxfkFYIMU2Sb3pR54PwUJ1fADfPfhlMiUWDICVLdqDa3k6w
 CoLtoZNCmAoECSYyWwGOrC2pOKjSxDPbbKydFpKvlfHDoarzBkZ/m+h4R
 7WJsv5TcKV4AR/VC8o/RIA3DhsGIGBjhp3baH7yw1h5OzkRfCf45MHSAE
 PEbCwHT4jBEQ49uaNXaofaJbCuebdjQ76v/4TlQkwYzKWEzGUpGgnF0Vo g==;
X-CSE-ConnectionGUID: gyX5/3edQgelrI1yx1JORQ==
X-CSE-MsgGUID: bI7Hn62KR5q7pvfhbv32Ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="49971225"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="49971225"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 08:29:25 -0800
X-CSE-ConnectionGUID: xdT1gBeCSWOcEN2kehaWYQ==
X-CSE-MsgGUID: P9vx5utKTsyim3QwXq7IUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="95704527"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 22 Nov 2024 08:29:23 -0800
Received: from [10.245.120.199] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.120.199])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BA5832FC7C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Nov 2024 16:29:22 +0000 (GMT)
Message-ID: <ff3175ed-9522-4abb-882a-dc45f9d5edce@intel.com>
Date: Fri, 22 Nov 2024 17:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Drop_2GiB_limit_of_fair_LMEM_allocation?=
To: intel-xe@lists.freedesktop.org
References: <20241121175754.302-1-michal.wajdeczko@intel.com>
 <173225031401.1553344.11278327773482720772@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173225031401.1553344.11278327773482720772@b555e5b46a47>
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



On 22.11.2024 05:38, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Drop 2GiB limit of fair LMEM allocation
> URL   : https://patchwork.freedesktop.org/series/141673/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380_full -> xe-pw-141673v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-141673v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-141673v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-141673v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

all unrelated

> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141673v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:
>     - shard-bmg:          NOTRUN -> [FAIL][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141673v1/shard-bmg-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-dp4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141673v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible@b-dp4.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-lnl:          [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/shard-lnl-7/igt@kms_pm_backlight@fade-with-dpms.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141673v1/shard-lnl-4/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@xe_drm_fdinfo@utilization-others-full-load:
>     - shard-lnl:          [PASS][6] -> [FAIL][7] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/shard-lnl-3/igt@xe_drm_fdinfo@utilization-others-full-load.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141673v1/shard-lnl-2/igt@xe_drm_fdinfo@utilization-others-full-load.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
>     - shard-adlp:         [PASS][8] -> [DMESG-WARN][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2257-e46649e7764a9f6868ccbcba7b8b23b413303380/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141673v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>     - shard-lnl:          NOTRUN -> [FAIL][10]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141673v1/shard-lnl-4/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
> 
>   * igt@xe_oa@invalid-map-oa-buffer:
>     - shard-adlp:         NOTRUN -> [SKIP][11] +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141673v1/shard-adlp-2/igt@xe_oa@invalid-map-oa-buffer.html
> 
>   
