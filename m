Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45796CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 16:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FDE10EA48;
	Thu, 28 Aug 2025 16:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QHffrYua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B7A10EA48
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 16:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756398453; x=1787934453;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Gzmlsz0c+uAb7yG+44ZDMHsMhRsRJFrqq/GsdUtnYFc=;
 b=QHffrYuakWApHJ+I60QrRYpExAcozOzj1hqLurEeeqepskhgzwoLRvkK
 KnBvsmnCNBNLAS9iVMfPlVxCalf7nI7i41yn+CCWj/ftPOlttUdor+mgJ
 FR7IGTG68RQGxhHJqghUdIzbL/s2jZPSiiXXg8DhTnTV+RzSZWgnWiWy5
 ZSJLKKfVLNwcJ4/J/iwFjWWLwUUOAvq8ObQHcpQVLbShO9xkwvguQxohB
 M1vgyVhtFD0Vh5I/aQVMSvCi3XuITzpKGhTaB8dVa9s228r9f/NMvnke+
 c7FMWBx+LrsZx12Rf0aTdhnUzwLlEIeFL5T6iayuU4DlpdLVOG1tdcVNg Q==;
X-CSE-ConnectionGUID: a5m8vminRwKA/wagOBkyFQ==
X-CSE-MsgGUID: q5/MuavCTyWA/oRfF+Q55g==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76276380"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="76276380"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:27:32 -0700
X-CSE-ConnectionGUID: ITO9GkawTg6J0OIi22IjKw==
X-CSE-MsgGUID: S2lf7kAYSAS6sSuKOVvm4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="175432494"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.84])
 ([10.245.245.84])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:27:31 -0700
Message-ID: <45c42d43-658e-452f-8aeb-e7a32f4838b2@intel.com>
Date: Thu, 28 Aug 2025 17:27:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Attempt to bring bos back to VRAM after eviction
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
References: <20250828154219.4889-1-thomas.hellstrom@linux.intel.com>
 <8621165a-68d0-467b-8fe5-c28b500c0d5e@intel.com>
 <ba4a969ad501922974c796e354292b7d5451dac4.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ba4a969ad501922974c796e354292b7d5451dac4.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 28/08/2025 17:06, Thomas Hellström wrote:
> Hi,
> 
> On Thu, 2025-08-28 at 16:59 +0100, Matthew Auld wrote:
>> On 28/08/2025 16:42, Thomas Hellström wrote:
>>> VRAM+TT bos that are evicted from VRAM to TT may remain in
>>> TT also after a revalidation following eviction or suspend.
>>>
>>> This manifests itself as applications becoming sluggish
>>> after buffer objects get evicted or after a resume from
>>> suspend or hibernation.
>>>
>>> If the bo supports placement in both VRAM and TT, and
>>> we are on DGFX, mark the TT placement as fallback. This means
>>> that it is tried only after VRAM + eviction.
>>>
>>> This flaw has probably been present since the xe module was
>>> upstreamed but use a Fixes: commit below where backporting is
>>> likely to be simple. For earlier versions we need to open-
>>> code the fallback algorithm in the driver.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5995
>>> Fixes: a78a8da51b36 ("drm/ttm: replace busy placement with flags
>>> v6")
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.9+
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_bo.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>> b/drivers/gpu/drm/xe/xe_bo.c
>>> index 4faf15d5fa6d..64dea4e478bd 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -188,6 +188,8 @@ static void try_add_system(struct xe_device
>>> *xe, struct xe_bo *bo,
>>>    
>>>    		bo->placements[*c] = (struct ttm_place) {
>>>    			.mem_type = XE_PL_TT,
>>> +			.flags = (IS_DGFX(xe) && (bo_flags &
>>> XE_BO_FLAG_VRAM_MASK)) ?
>>
>> I suppose we could drop the dgfx check here?
> 
> Thanks for reviewing. From a quick look it looks like the VRAM_MASK
> bits can be set also on IGFX? And if so, then it's not ideal to mark
> the primary placement as FALLBACK. But I might have missed a rejection
> somewhere.

I was sweating bullets for a second there, but it looks like it gets 
rejected in the ioctl with:

if (XE_IOCTL_DBG(xe, (args->placement & ~xe->info.mem_region_mask)
      return -EINVAL;

The flags get converted from the args->placement, and VRAM should never 
appear in the mem_region_mask on igpu. If we allowed it I think it would 
crash in add_vram() since the vram manager does not exist so 
ttm_manager_type() would be NULL, AFAICT.

> 
> /Thomas
> 
> 
>>
>> Either way,
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
>>> +			TTM_PL_FLAG_FALLBACK : 0,
>>>    		};
>>>    		*c += 1;
>>>    	}
>>
> 

