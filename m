Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3496C282EC
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 16:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6421D10E487;
	Mon, 10 Mar 2025 16:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7UUh35G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CE910E487;
 Mon, 10 Mar 2025 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741624284; x=1773160284;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JrpbNker09yLLUVPbiBkbpv89e6haPCHDSIH3ug8BZU=;
 b=P7UUh35GgNUE75XHAkFqPjSvNF4yEnS0ulDY0ZkXOHzemVTT5nF5K+Xs
 pDCWRlOGMIVy94umDmi25qSYdZPwnr6TPpzFRGDWL/k1yDmnXZzNv4Qcm
 +FVr6cfPjxQZIxIG++W5T8AQTpdr8RJ+pQ5HMH+TEPSHfbgi3fqUFKikb
 0iLwUY1wfpS4wsEjpOqG8eDGNb6+uO+7ZJEIRVxgred3xEWgXq/GG+Oni
 /Imz7WreC+1rGS8GXs/drh/hbHXmbGlPouA9bPiFEQ36WmujDXBtEqr1n
 BJt6LhNX91IstEaHhAl2tUvf9ivNsGbJoMWhKq93qMATQFWaSCEHT4BFs w==;
X-CSE-ConnectionGUID: l7xxgW1xQd2xOP7Fy4e24g==
X-CSE-MsgGUID: 9QL+kFOCRyKOY9KABZQF4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="65084923"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="65084923"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 09:31:15 -0700
X-CSE-ConnectionGUID: IiGhUct4SV2KFkZdKZQTcg==
X-CSE-MsgGUID: gnuUYrchTVm2eQrrLBY60Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="120062789"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 10 Mar 2025 09:31:14 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E735C34936;
 Mon, 10 Mar 2025 16:31:12 +0000 (GMT)
Message-ID: <888e00f8-dc32-4b6f-a6af-9be62409388a@intel.com>
Date: Mon, 10 Mar 2025 17:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBVc2UgTUlfTUFU?=
 =?UTF-8?Q?H_to_apply_RMW_WA_in_LRC_=28rev3=29?=
To: intel-xe@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250303173522.1822-1-michal.wajdeczko@intel.com>
 <174146681147.6714.9590700088356022715@18a75f3d1eae>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174146681147.6714.9590700088356022715@18a75f3d1eae>
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



On 08.03.2025 21:46, Patchwork wrote:
> == Series Details ==
> 
> Series: Use MI_MATH to apply RMW WA in LRC (rev3)
> URL   : https://patchwork.freedesktop.org/series/145732/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2777-066c46f28642479869d2d1dd27cc6ae476de4abc_full -> xe-pw-145732v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-145732v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-145732v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-145732v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_oa@buffer-size:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2777-066c46f28642479869d2d1dd27cc6ae476de4abc/shard-lnl-5/igt@xe_oa@buffer-size.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145732v3/shard-lnl-6/igt@xe_oa@buffer-size.html

Starting subtest: buffer-size
Starting dynamic subtest: rcs-0-256K
(xe_oa:4458) CRITICAL: Test assertion failure function
test_non_zero_reason, file ../tests/intel/xe_oa.c:2509:
(xe_oa:4458) CRITICAL: Failed assertion: !(oa_status &
DRM_XE_OASTATUS_BUFFER_OVERFLOW)
Dynamic subtest rcs-0-256K failed.

hmm, based on the below, this test should be suppressed, no?

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_oa@buffer-size@rcs-0-256k}:
>     - shard-lnl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2777-066c46f28642479869d2d1dd27cc6ae476de4abc/shard-lnl-5/igt@xe_oa@buffer-size@rcs-0-256k.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145732v3/shard-lnl-6/igt@xe_oa@buffer-size@rcs-0-256k.html
> 
>   
