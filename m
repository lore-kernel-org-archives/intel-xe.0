Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14132C369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 19:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0119A10E3AF;
	Thu, 17 Apr 2025 19:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkczhFNn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BFC10E3AF
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 19:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744919253; x=1776455253;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ThFV93YcIo0llMGuv3EVBe0mYWcs4q/ul97+Ja//exk=;
 b=jkczhFNnIR8Q09MF66O6GnHZHAD8k2u+EoqMqy7/jiIemtCF+5ESnIAc
 0vjdILP06nV/98HDN2m85GPNNtD9RXv1QeeY4BFsJd008n2fjwzNWRnP9
 jByS/VW8RrSxLtjyw7XvTnSBmjz8VKcAynzbpujCeu/743OtQR34cLbZs
 723xwlCILkosq+wdOfb0cagAHAyVRhpv31H3QvqJy+XELcZavozfext88
 zdWYHsrioI1pWF9qVSP+1k1Pr7TxJ+KuYcN+Llnh/MQy2D6/yFi6wY8Y6
 c/fhRmH94lmht0itTWnMrvLLQF6HiKuNEoQXrfmjNvmoJM7pHhZLyYMVE w==;
X-CSE-ConnectionGUID: XuvARGD/R9us9yxftZ9FSA==
X-CSE-MsgGUID: WQCr8Hk1SZCYrA13XQdFwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="45663794"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="45663794"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 12:47:33 -0700
X-CSE-ConnectionGUID: OtJmFd4GT1Wk8qYigC76kg==
X-CSE-MsgGUID: +KcYNL8HRt6bGTfumjGdAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="130873535"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 17 Apr 2025 12:47:32 -0700
Received: from [10.245.81.148] (nowickik-mobl5.ger.corp.intel.com
 [10.245.81.148])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4C76C3497C
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 20:47:31 +0100 (IST)
Message-ID: <404b8102-4270-435f-a606-d27dcf08ef5d@intel.com>
Date: Thu, 17 Apr 2025 21:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_series_star?=
 =?UTF-8?Q?ting_with_=5B1/2=5D_drm/xe/guc=3A_Fix_out-of-bound_while_enabling?=
 =?UTF-8?Q?_engine_activity_stats?=
To: intel-xe@lists.freedesktop.org
References: <20250414202347.1909-1-michal.wajdeczko@intel.com>
 <174468631393.3818.12186056782966217723@b68e5b3b99e1>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <174468631393.3818.12186056782966217723@b68e5b3b99e1>
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



On 15.04.2025 05:05, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [1/2] drm/xe/guc: Fix out-of-bound while enabling engine activity stats
> URL   : https://patchwork.freedesktop.org/series/147717/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2949-e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb_FULL -> xe-pw-147717v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-147717v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-147717v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-147717v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2949-e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147717v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

unrelated

<3> [509.461857] xe 0000:00:02.0: [drm] *ERROR* CPU pipe A FIFO underrun

> 
>   * igt@kms_flip@dpms-off-confusion:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2949-e331ba51493bc26a70408e28bf3b3a6fe2e0ddfb/shard-dg2-432/igt@kms_flip@dpms-off-confusion.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147717v1/shard-dg2-435/igt@kms_flip@dpms-off-confusion.html

see below

> 
>   * igt@kms_flip@dpms-off-confusion@d-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][5] +1 other test fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147717v1/shard-dg2-435/igt@kms_flip@dpms-off-confusion@d-dp4.html

unrelated

(kms_flip:6380) CRITICAL: Test assertion failure function
__run_test_on_crtc_set, file ../tests/kms_flip.c:1610:
(kms_flip:6380) CRITICAL: Failed assertion: !ret
(kms_flip:6380) CRITICAL: Last errno: 22, Invalid argument
...
Dynamic subtest D-DP4: FAIL (0.057s)
Subtest dpms-off-confusion: FAIL (24.444s)


