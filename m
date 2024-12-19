Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8BBE77184
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 23:08:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6B210EE06;
	Thu, 19 Dec 2024 23:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aLc/Qckn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FCE10EE06
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 23:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734649724; x=1766185724;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=0nHB7vA1zc30KGgAsLSUlSQLvhWLnS+BvL5s5zg+3SM=;
 b=aLc/QcknJlQ8+gOJ98ZmDVe+uwtupoUWsAE2gvKzOJLvxcGXLq0EZ9cz
 3Ut++wnPKWKIfdbT5NnTexmKB+EJds6EYDkOSn5KfZpGq1YeHvflE0vGs
 MjZc2jAH9R347Dp2qsdkxKcDhuB0PmyBPI9vo3T2jGAe44wtEVeV1LVrw
 jtQWJcEqFrDuI2euR8qofp7K2B6v61souP1m2aXSRD6X+hRQEy1otx8Mc
 Wo+b6cIIiCAWAHOoDHHNWGJERKlsTlF5y8fOCLwB/gJNGaphxdJO0N3Es
 /QtotJQSY4eNuRAV0VL37X5yqEd9J9uI2jnmvRKDFWPwR6GwyQRg9b0tI g==;
X-CSE-ConnectionGUID: JoqvRcoEQ+iRr6Gi5joWaw==
X-CSE-MsgGUID: JfNR0RcFQuq3zk7RCVm6PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35337235"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="35337235"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 15:08:44 -0800
X-CSE-ConnectionGUID: 4LHnfxoLSfy/qbiH2CBJmA==
X-CSE-MsgGUID: xiDEQ4eDRPe1AY1oeFPZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103342986"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 19 Dec 2024 15:08:41 -0800
Received: from [10.245.96.215] (unknown [10.245.96.215])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id F092C312FF
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Dec 2024 23:08:40 +0000 (GMT)
Message-ID: <0843e016-b545-42ee-96e0-506e08f4eae0@intel.com>
Date: Fri, 20 Dec 2024 00:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Use_correct_function_to_check_LMEM_provisioning?=
To: intel-xe@lists.freedesktop.org
References: <20241216223253.819-1-michal.wajdeczko@intel.com>
 <173442510904.3702663.621131809513776018@b555e5b46a47>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <173442510904.3702663.621131809513776018@b555e5b46a47>
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



On 17.12.2024 09:45, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/pf: Use correct function to check LMEM provisioning
> URL   : https://patchwork.freedesktop.org/series/142678/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd_full -> xe-pw-142678v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-142678v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-142678v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-142678v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 

unrelated (change is PF specific)

>   * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-linear:
>     - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-linear.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-linear.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a6-dp4:
>     - shard-dg2-set2:     [PASS][4] -> [FAIL][5] +2 other tests fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a6-dp4.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/shard-dg2-433/igt@kms_flip@2x-plain-flip-fb-recreate@bc-hdmi-a6-dp4.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3:
>     - shard-bmg:          [PASS][6] -> [FAIL][7] +3 other tests fail
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd/shard-bmg-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/shard-bmg-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-3.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-bmg:          NOTRUN -> [DMESG-FAIL][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-bmg:          [PASS][9] -> [INCOMPLETE][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd/shard-bmg-7/igt@xe_pm@s3-mocs.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/shard-bmg-7/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-bmg:          [PASS][11] -> [ABORT][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142678v1/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   
