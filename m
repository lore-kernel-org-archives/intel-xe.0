Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BA2E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 09:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5235410E0EE;
	Wed, 18 Dec 2024 09:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHBm+ge6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B377B10E435
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734513305; x=1766049305;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nvZsCkfQemY/1oibMhau7RhWiY/bagMWf692wakDrjc=;
 b=UHBm+ge6sHbtvYvrjxHJ4NEcEPTaIgX1GXad9jdxOOmNegIZ3j6i9k/n
 EnThMaNzz1V1RETSKrTqK82QGLsaaz/0yaiyRoh1i/TMQ+dtfJWQg/oAo
 DVqjvrly6sN1kJ9oU52Sr+qjSx9llsS0hxdOHCoeql7eN2gp9nAtzAHoE
 zpkzdFb3FwaZFX340Btpf4Wc+hxLnbCRrWIcJN5ptpc9rcICz85JFh2xD
 3l7XD2f74vbr+jMaHVR+U/3DMVWaHRxZXV/tBjObKCsJPA4r1WLNq4M99
 HATvf+S2dlKSNO01rxad9WL6QEnmh+olpWr2L+Gew/8iQ9lXU90o5pJMD Q==;
X-CSE-ConnectionGUID: +bmgkVmyQvSxh87VIdp4og==
X-CSE-MsgGUID: Oijz7leVR5CLCP1ftWp1+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="38760693"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="38760693"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 01:15:04 -0800
X-CSE-ConnectionGUID: kBEQmI71R/yfvjij5kjBqw==
X-CSE-MsgGUID: 77BSf5YxQP67a/fmPNoggg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102896512"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.74])
 ([10.245.244.74])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 01:15:04 -0800
Message-ID: <aeec7c51-b04b-4805-82bb-c5f2051178f7@intel.com>
Date: Wed, 18 Dec 2024 09:15:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/sa: Drop hardcoded 4K guard in sub-allocator
To: Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241217222246.863-1-michal.wajdeczko@intel.com>
 <Z2H9sADDJOvFG6j+@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Z2H9sADDJOvFG6j+@lstrano-desk.jf.intel.com>
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

On 17/12/2024 22:39, Matthew Brost wrote:
> On Tue, Dec 17, 2024 at 11:22:46PM +0100, Michal Wajdeczko wrote:
>> Any required prefetch guards are added during batch buffer
>> allocations anyway.
>>
> 
> This should work but I think we actually want to do the opposite of
> this - drop the prefetch pad in BB allocation. This would enable a more
> optimial usage of each suballocation. I think that would work unless we
> have an odd caching issue - if caching is a problem then maybe the BB is
> a cacheline.

Also would be good to update bb_prefetch(), since current prefetch value 
is too small for xe2+ on some engines, so the hardcoded 4K here was 
maybe saving the day.

> 
> I haven't had time to try to out yet but I think we explore the above
> option first. If I'm missing something and the above does not work, then
> agree with this patch.
> 
> Matt
> 
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sa.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
>> index e055bed7ae55..2f69277b1a50 100644
>> --- a/drivers/gpu/drm/xe/xe_sa.c
>> +++ b/drivers/gpu/drm/xe/xe_sa.c
>> @@ -34,7 +34,6 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
>>   struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
>>   {
>>   	struct xe_device *xe = tile_to_xe(tile);
>> -	u32 managed_size = size - SZ_4K;
>>   	struct xe_bo *bo;
>>   	int ret;
>>   
>> @@ -58,11 +57,11 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>>   	sa_manager->bo = bo;
>>   	sa_manager->is_iomem = bo->vmap.is_iomem;
>>   
>> -	drm_suballoc_manager_init(&sa_manager->base, managed_size, align);
>> +	drm_suballoc_manager_init(&sa_manager->base, size, align);
>>   	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
>>   
>>   	if (bo->vmap.is_iomem) {
>> -		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
>> +		sa_manager->cpu_ptr = kvzalloc(size, GFP_KERNEL);
>>   		if (!sa_manager->cpu_ptr) {
>>   			sa_manager->bo = NULL;
>>   			return ERR_PTR(-ENOMEM);
>> -- 
>> 2.47.1
>>

