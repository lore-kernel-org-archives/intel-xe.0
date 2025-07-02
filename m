Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8F0C8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 11:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7923E10E6E2;
	Wed,  2 Jul 2025 11:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KjF38lK/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A0810E6E2
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751454153; x=1782990153;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=UYyARoFcl9mWhZya+cM0/ty7OVY3B9b/CQkx3NzmHgI=;
 b=KjF38lK/J+2JVcM7BtRK13to1Ik4GOi74I3POB8YkahncHH7F8qyrZiS
 m5lF7iRAWx0m4hlBarMFlXf84CGHvIh8yO/3tNaHFfUCJJR/iCVCgDTTe
 cKMcj0GRjRl6Ax5WVQdgqtojaAyOdWjXbs8XSibJe4f/urn3UwkoIfKDq
 CICHF5ND2B6rZszhLSu9Je7/TxxuQ5uIb+NP57PhPsifiaLH5nYtS+xPH
 WZKVfUrzyPEHrioiVNzARfsogKyR75TRVX0GGxvXKk+IcQB8XrRo758yo
 rsjYdDtUzAbLV2kaDQx3Afke6U+2mo601wUo+C9NVmFPak4wFYDi/XgBk A==;
X-CSE-ConnectionGUID: Mw5CEOy5T+2e0ye10vSCdg==
X-CSE-MsgGUID: jgp+XjQpSlyPokqayFnDTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79183752"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="79183752"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 04:02:33 -0700
X-CSE-ConnectionGUID: nOKuXjnLQraowZUfXVWCAg==
X-CSE-MsgGUID: EFSgMFq0R3SaQovkQUG+0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="154376836"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 02 Jul 2025 04:02:32 -0700
Received: from [10.245.112.168] (unknown [10.245.112.168])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 41B7E28762
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 12:02:31 +0100 (IST)
Message-ID: <a5822a88-2d8f-4c28-8aab-59c4d62abe6c@intel.com>
Date: Wed, 2 Jul 2025 13:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/test?=
 =?UTF-8?Q?s=3A_Add_legacy_IP_descriptors_to_param_generators?=
To: intel-xe@lists.freedesktop.org
References: <20250627181110.1436-1-michal.wajdeczko@intel.com>
 <175140786694.126241.7429975888018584817@1538d3639d33>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <175140786694.126241.7429975888018584817@1538d3639d33>
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



On 02.07.2025 00:11, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/tests: Add legacy IP descriptors to param generators
> URL   : https://patchwork.freedesktop.org/series/150895/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f_FULL -> xe-pw-150895v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-150895v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-150895v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-150895v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3324-f286b243950bff50335f38f30ee72e82cb33c60f/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150895v1/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html

can't be related, patch is for kunit test only


