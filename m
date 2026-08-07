Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB255C5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 09:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6D910E3FF;
	Fri,  7 Aug 2026 09:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBFn5+SD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A9910E3FF
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786093236; x=1817629236;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=abSVL+xjdhr8h/X8M95jTn0N0sfx6BA24h2zP7mZxbY=;
 b=LBFn5+SDF1E6taIaMAlef3laU/1vGoWXWnkLD/HaS44BMHKZ6KgxGE9K
 HaHl7d8LrTTILvu0SGabELU4q7WNNoBfu28yw0UM6jZTxh6ERjNtBbkOa
 tKJBuSELIOW67GZW82fPNCMtBI3rFveIMnof4nF0cCJvXE1kyXRRcIRVi
 DHfRlgbXDrF+sPBRNxSltIdKSh7rFE1BnYcJV+WKa2lgvFp1hSHm1ihdC
 LUPpSvrmQnHEqA2WTmK4KZz7Kx71TLTwpgYsVg+9T4MzsvHRS4UdQ50PO
 zyIqyVRvNrjFrcvR86E3nelKv74fw7IpQ8k8C5DSMcrrP5fZ++4KZVQpm Q==;
X-CSE-ConnectionGUID: knKeZMsqSxKNUaU5O2SbgQ==
X-CSE-MsgGUID: fLFvTN1HQt+oDXBooJNC6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98210240"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="98210240"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 02:00:36 -0700
X-CSE-ConnectionGUID: Flo/xSAlRa21///kwcMZrw==
X-CSE-MsgGUID: bH4pQ+MmRnKPdKeOynusBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="259018382"
Received: from unknown (HELO [10.94.249.102]) ([10.94.249.102])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 02:00:35 -0700
Message-ID: <4148722f-49de-4782-b8fd-978dee57f886@linux.intel.com>
Date: Fri, 7 Aug 2026 11:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Restore_default_PF_scheduling_on_failed_VF_enable?=
To: intel-xe@lists.freedesktop.org
References: <20260806095046.1360538-1-marcin.bernatowicz@linux.intel.com>
 <178604672370.26709.2639313439020757015@61270ab9df2a>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <178604672370.26709.2639313439020757015@61270ab9df2a>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 8/6/2026 10:05 PM, Patchwork wrote:
> == Series Details ==
>
> Series: drm/xe/pf: Restore default PF scheduling on failed VF enable
> URL   : https://patchwork.freedesktop.org/series/171722/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from xe-5552-8d11ccdc98daac5e969243b42907fd060a650091_FULL -> xe-pw-171722v1_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with xe-pw-171722v1_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in xe-pw-171722v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in xe-pw-171722v1_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap:
>      - shard-bmg:          [PASS][1] -> [FAIL][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5552-8d11ccdc98daac5e969243b42907fd060a650091/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171722v1/shard-bmg-10/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-dontunmap.html

Not related to the change.

marcin

>    
> Known issues
> ------------
>
>    Here are the changes found in xe-pw-171722v1_FULL that come from known issues:
>
> ### IGT changes ###
[...]
> Build changes
> -------------
>
>    * IGT: IGT_9041 -> IGT_9042
>    * Linux: xe-5552-8d11ccdc98daac5e969243b42907fd060a650091 -> xe-pw-171722v1
>
>    IGT_9041: 9041
>    IGT_9042: 9042
>    xe-5552-8d11ccdc98daac5e969243b42907fd060a650091: 8d11ccdc98daac5e969243b42907fd060a650091
>    xe-pw-171722v1: 171722v1
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171722v1/index.html
>
