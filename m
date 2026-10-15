Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86BBCC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 10:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7488410EBC1;
	Thu, 15 Oct 2026 10:17:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCBF10EBC1
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792059421; x=1823595421;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=vyj4agNJiZRxkAKpl5feqeUyiBH/nIfLCcYra2ER/xY=;
 b=C4NlhHgWT0PzAcGypJBlWrPnaJ5z4T30rqAal2gbJyy1VVvHEA+EZ4lu
 Cyrp7xOBurazJKtUHGja14Yi/sdPgqPUhIK+osoFczYS+C3clCCXzkIdo
 cAnbGUF+jkw6lvql+b+91zUN8fGQU0LBacpwjv47WTPEXAZ6Hz8CN05Sj
 82KLzCkVnmsy0tFEpH2SHnECI5R3LE6LPso9a1vkpqoCYXzVQAnv1DE15
 JuZboUd7q3a0gu7/CDpUaiw/1tOS2EdRHumfXDFwyDdfON9b3Bf6H71jJ
 ArazK0aDYDFtk49I4LJSRDb9+FV65ZTDWlu/aU1qLuF5tnONP6RDCFHfg A==;
X-CSE-ConnectionGUID: yvQQcCJ/TROeT6dHEBk/qA==
X-CSE-MsgGUID: l7D6dU7dSDq+EGy++tRO+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="819848"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="819848"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:17:01 -0700
X-CSE-ConnectionGUID: SPqsP8wARDSM8ZrKS7jj1g==
X-CSE-MsgGUID: Nk6m9gnyTu6piARMeYrLsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2015682"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.143])
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:17:00 -0700
Message-ID: <e9796636-3272-440f-9050-fb10a5fa29de@intel.com>
Date: Thu, 15 Oct 2026 11:16:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: revamp hw reserved PAT index checking
To: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
References: <20261015095516.403932-4-matthew.auld@intel.com>
 <20261015095516.403932-6-matthew.auld@intel.com>
 <sashiko-outbox-172627@kernel.org>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <sashiko-outbox-172627@kernel.org>
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

On 15/10/2026 11:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] drm/xe: missing array_index_nospec for pat_index
> --
> 
> commit c33d7dbef37f797548fdacd3eb5da040ca907442
> Author: Matthew Auld <matthew.auld@intel.com>
> 
> drm/xe: revamp hw reserved PAT index checking
> 
> This commit replaces indirect checks of valid PAT indices with a direct
> check of pat.valid. It also adds additional WARN_ON checks to ensure
> coherency modes are valid.
> 
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 18e26f04169ab..d0dac1ebd4784 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
> [ ... ]
>>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
>>   {
>>   	WARN_ON(pat_index >= xe->pat.n_entries);
>> +	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
>> +		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
>>   	return xe->pat.table[pat_index].coh_mode;
>>   }
> 
> [Severity: Low]
> Does this code leak information via a Spectre v1 side channel?
> 
> When handling the MADVISE ioctl with DRM_XE_MEM_RANGE_ATTR_PAT, the raw
> user input args->pat_index.val is passed into check_pat_args_are_sane()
> without being clamped by array_index_nospec():
> 
> xe_vm_madvise_ioctl()
>    check_pat_args_are_sane(xe, &madvise_range, args->pat_index.val)
>      xe_pat_index_get_coh_mode(xe, pat_index)
> 
> Under speculative execution, a user-controlled, out-of-bounds pat_index
> could bypass the earlier bounds check in madvise_args_are_sane(). This
> would cause xe_pat_index_get_coh_mode() to read out-of-bounds memory
> when indexing xe->pat.table[pat_index]. The resulting coh_mode is then
> used in branch conditions in check_pat_args_are_sane(), creating a
> potential side channel.
> 
> Could args->pat_index.val be clamped with array_index_nospec() before
> being passed to check_pat_args_are_sane(), or could the already-clamped
> pat_index local variable be reused in xe_vm_madvise_ioctl()?

Fair, but I would view this as more of a pre-existing issue.

> 

