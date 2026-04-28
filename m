Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0617BFF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 11:05:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD64610E321;
	Tue, 28 Apr 2026 11:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7ps3wlJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D0E10E321
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 11:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777374348; x=1808910348;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=r/Xz08mNdDTV5FJBrnFf5P8m6z2Jd/xpHEo7396t3dY=;
 b=l7ps3wlJFIvh5lNFPETKr0/qyVFybasEMghtJuPblga75SiOzEflNSj1
 8K4vCnW13sEdZQw9crYDDKpIYoSopzh6vLCc2NJ5tiwGNCMYN5MgCFAqR
 dJRFT+3LZY3oiJ00BgWl43KGnl0Xx35RI5/2y0vnIjij8DJeJv/L0Ywy3
 nQFa4PNxysvxuQp6KPminmi0orXqXFNPcI03hyABIPGa9M2UYvX4RKKco
 ui4n87ib9vrlYlLb2NRoaaqDCYFVGbk8NrXrHo9Yc4obPN8AaFJymUGw+
 6xm4/QsGDQ8BmRxG84nz85oYXbI6+fyuNa8LCdr0SbQ8xkfTFkXxd9ki4 Q==;
X-CSE-ConnectionGUID: 3YKTkYh8SMymg0y1gip6UA==
X-CSE-MsgGUID: OxqYAKSyQsyrS7hLj7fJQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="88589466"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="88589466"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:05:48 -0700
X-CSE-ConnectionGUID: TODudEwWS6KAODimNrFBPA==
X-CSE-MsgGUID: wA3WD/cETUei736CxyQo2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="229357634"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.18])
 ([10.245.245.18])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:05:47 -0700
Message-ID: <bfaa816c-bdb3-4830-ab1a-3049a0b66849@intel.com>
Date: Tue, 28 Apr 2026 12:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Destroy mutex on gpu_buddy_init failure in VRAM
 manager init
From: Matthew Auld <matthew.auld@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
References: <20260428103202.3889095-2-tejas.upadhyay@intel.com>
 <d9a80b36-f54f-4ec4-9045-c24d2f493b01@intel.com>
Content-Language: en-GB
In-Reply-To: <d9a80b36-f54f-4ec4-9045-c24d2f493b01@intel.com>
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

On 28/04/2026 11:38, Matthew Auld wrote:
> On 28/04/2026 11:32, Tejas Upadhyay wrote:
>> In __xe_ttm_vram_mgr_init(), if gpu_buddy_init() fails, the function
>> returns early without calling mutex_destroy() on mgr->lock which was
>> previously initialized via mutex_init(). The normal cleanup path in
>> xe_ttm_vram_mgr_fini() is registered via drmm_add_action_or_reset()
>> only after gpu_buddy_init() succeeds, so it never runs for this error
>> case.
>>
>> Add mutex_destroy() before the early return to properly clean up the
>> initialized mutex.
>>
>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM buddy based VRAM 
>> manager")

Wait, where does this commit title come from? How did you generate this?

>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/ 
>> xe/xe_ttm_vram_mgr.c
>> index 5fd0d5506a7e..3189e4b7ad05 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -319,8 +319,10 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, 
>> struct xe_ttm_vram_mgr *mgr,
>>       ttm_resource_manager_init(man, &xe->ttm, size);
>>       err = gpu_buddy_init(&mgr->mm, man->size, default_page_size);
>> -    if (err)
>> +    if (err) {
>> +        mutex_destroy(&mgr->lock);
>>           return err;
>> +    }
> 
> Can we not use drmm_mutex_init() instead? Also can then drop the manual 
> destroy in fini(().
> 
>>       ttm_set_driver_manager(&xe->ttm, mem_type, &mgr->manager);
>>       ttm_resource_manager_set_used(&mgr->manager, true);
> 

