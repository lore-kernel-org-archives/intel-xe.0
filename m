Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30731FF885D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 12:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB49A10EB3C;
	Tue, 28 Apr 2026 12:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b54RhpL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9299810EB3C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777377774; x=1808913774;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6WUNfcPyQdQBFw1BgXpgC8BRbjogmf1H3SWECDZhOVo=;
 b=b54RhpL1fV1JVdVjH1/CMRFAOdl3d7yN2KQl5D1FDPG04sl61zB2RyRa
 NTB7gb8hFFBz/yZSjtkccAlTQvAsQf7MzmrfyEGfLNORbAFnx78KX8DT8
 wi+ybTQ3+kknLYVsUgc9BskPr+Ih1viWXoMFgRPjzMG0meq93kMYfR+vL
 rxQF1Var6eteFYV/R76aEAx1UUEbLZo2QXw8mCoVBM87qOez7uzsdZWFj
 IMxLI2oIvAHVIxtw41/+ZIV5e8gQ2JPNuGAlHDRtCVCJu7GP/yRBTJHTK
 B/kcJV3KZbqbaXkzI/Zai6Qg199WoHlk2NyTEB6oeYgAnj0w/wf2GtbAj A==;
X-CSE-ConnectionGUID: fLpnaxpdTLCqxoaESiBaRA==
X-CSE-MsgGUID: QtKpOLRQQYuLd++bI8THuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78174243"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78174243"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 05:02:53 -0700
X-CSE-ConnectionGUID: /0ueuybnTHyMloY2jAO80w==
X-CSE-MsgGUID: 4LdvHYMzTJ+mrsD4c4k3+g==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.18])
 ([10.245.245.18])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 05:02:51 -0700
Message-ID: <f73ddff4-86af-424b-a1c4-2636057887d7@intel.com>
Date: Tue, 28 Apr 2026 13:02:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM
 manager init
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
References: <20260428103202.3889095-2-tejas.upadhyay@intel.com>
 <d9a80b36-f54f-4ec4-9045-c24d2f493b01@intel.com>
 <bfaa816c-bdb3-4830-ab1a-3049a0b66849@intel.com>
 <SN6PR11MB323249C2BF34D0C8805A2D9B81372@SN6PR11MB3232.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <SN6PR11MB323249C2BF34D0C8805A2D9B81372@SN6PR11MB3232.namprd11.prod.outlook.com>
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

On 28/04/2026 12:40, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: 28 April 2026 16:36
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>;
>> thomas.hellstrom@linux.intel.com; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>
>> Subject: Re: [PATCH] drm/xe: Destroy mutex on gpu_buddy_init failure in
>> VRAM manager init
>>
>> On 28/04/2026 11:38, Matthew Auld wrote:
>>> On 28/04/2026 11:32, Tejas Upadhyay wrote:
>>>> In __xe_ttm_vram_mgr_init(), if gpu_buddy_init() fails, the function
>>>> returns early without calling mutex_destroy() on mgr->lock which was
>>>> previously initialized via mutex_init(). The normal cleanup path in
>>>> xe_ttm_vram_mgr_fini() is registered via drmm_add_action_or_reset()
>>>> only after gpu_buddy_init() succeeds, so it never runs for this error
>>>> case.
>>>>
>>>> Add mutex_destroy() before the early return to properly clean up the
>>>> initialized mutex.
>>>>
>>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM buddy based VRAM
>>>> manager")
>>
>> Wait, where does this commit title come from? How did you generate this?
> 
> Took claude AI recommendation on wording.

Ok, we shouldn't make up new commits that don't exist. The fixes tag 
needs to always match a real commit, including the commit title. Also, 
AFAIK this needs to be labelled with Assisted-by: <>, to be fully 
transparent.

https://docs.kernel.org/process/coding-assistants.html

> 
> Tejas
>>
>>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/
>>>> xe/xe_ttm_vram_mgr.c index 5fd0d5506a7e..3189e4b7ad05 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>> @@ -319,8 +319,10 @@ int __xe_ttm_vram_mgr_init(struct xe_device
>> *xe,
>>>> struct xe_ttm_vram_mgr *mgr,
>>>>        ttm_resource_manager_init(man, &xe->ttm, size);
>>>>        err = gpu_buddy_init(&mgr->mm, man->size, default_page_size);
>>>> -    if (err)
>>>> +    if (err) {
>>>> +        mutex_destroy(&mgr->lock);
>>>>            return err;
>>>> +    }
>>>
>>> Can we not use drmm_mutex_init() instead? Also can then drop the
>>> manual destroy in fini(().
>>>
>>>>        ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
>>>>        ttm_resource_manager_set_used(&mgr->manager, true);
>>>
> 

