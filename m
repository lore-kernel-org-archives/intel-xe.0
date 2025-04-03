Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B25C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 04:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6A310E903;
	Thu,  3 Apr 2025 04:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drOM0Cpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9619610E903
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 04:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743655974; x=1775191974;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=5eAFZvRcYJVBczDDsYUbl2DHpwzeDGyBVl8L/o3aa5Y=;
 b=drOM0Cpol+e44n2sD8XvBmX8sP1aKf39mKWDm7C7kZlJ7qyaxvJ4BHye
 9lxcCuW/qdYpggOodvSVJLEzYfvIytuY+zq/24BIezOq/DTtIgH6re84s
 9iXgnkMxMk8E+qaRZs6ap2qBHee9GYFGoCepAT4ZIdoGZl5Hr/Dt5kZR4
 45pRx60QlSwcCnvGI/1Zaz9BmzGk6FeNTAWwfXihq+zU/WH/fuX9v/ZlU
 k8Tord4PQPK44AvG7OC+DVYF+N9lAvHShq7MLW+WZsdV30hfd/O17xFD+
 4DIUWv4VVvbjmhNUKD0N1jeTeWcdAlWmuASU0Kn4abQ5LXWj1wkw6itRW g==;
X-CSE-ConnectionGUID: Z5zFe9bmTxiFVrfs2M6r/g==
X-CSE-MsgGUID: +oy+ozjVQdao0jQlmDDP3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48709929"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="48709929"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 21:52:45 -0700
X-CSE-ConnectionGUID: 8fUehrjoTduHEB5GBaqO5A==
X-CSE-MsgGUID: aa+aQdWuSkKhZYwnAIlpTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127386903"
Received: from unknown (HELO [10.66.116.21]) ([10.66.116.21])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 21:52:43 -0700
Message-ID: <6d0b6fd0-5cbb-4dbf-a1bc-b3852a24ba61@intel.com>
Date: Thu, 3 Apr 2025 10:22:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/xe2hp?=
 =?UTF-8?Q?g=3A_Add_Wa=5F16025250150_=28rev2=29?=
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20250325134421.1489416-1-aradhya.bhatia@intel.com>
 <174308868111.11729.17850280422515808425@e6b6f09ec485>
Content-Language: en-US
Cc: intel-xe@lists.freedesktop.org
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
In-Reply-To: <174308868111.11729.17850280422515808425@e6b6f09ec485>
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

Hi,

On 27-03-2025 20:48, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2hpg: Add Wa_16025250150 (rev2)
> URL   : https://patchwork.freedesktop.org/series/146709/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2859-1e750490a76bbb8bcb8ea8d5fba2a68bf0845def_BAT -> xe-pw-146709v2_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-146709v2_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146709v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): bat-adlp-vm 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-146709v2_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_intel_bb@render@render-xmajor-256:
>     - bat-adlp-vf:        NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146709v2/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
> 
>   

The possible issue does not seem to be related to my patch.
Could this please be merged?

--
Regards
Aradhya
