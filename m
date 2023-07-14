Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879EBEB64DA
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jul 2023 09:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3A910E0EA;
	Fri, 14 Jul 2023 09:02:18 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A7D10E0EA
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jul 2023 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689325335; x=1720861335;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Lh2eI3Kmdi3DJ+8nsIFtYApVND5qJ6hbIoY4EP5yeUI=;
 b=UwWZ+6QSKqp/sJ29YfV5/e7aug9s5QBOgJBezX3jMWtJU84lRpRRTyfL
 YvBz6bs9bicF03L9F2MncNY+JHsc6+5v1PKcZT1EdYhhYaoZ/sRkIX5eP
 RAeIBWkUD8MAMMsPLte5m6aovLeHiTtnZmJT2SE0cm/px6NVJvldmL28e
 YX0ADojTjCqJWO6fFXuJFEL169EkLqMwkDZsYfn1JWjLXFOw5JRE9+Nd7
 /RfrmzUD8hnpqF2RUQIQ3GPLDb9fE1YPS7xE1WVYenXjUwjZdiKbFQVVH
 7ydn/Oa1RAlNWp1PGWHeF9KmOfe2SuPsQ8+U7Vy13ktRm3C7IS0SAQMhc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="451794224"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="451794224"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 02:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1052988673"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; d="scan'208";a="1052988673"
Received: from joejardi-mobl3.ger.corp.intel.com (HELO [10.252.28.242])
 ([10.252.28.242])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 02:02:11 -0700
Message-ID: <a59860ef-fbd6-a3cb-3f3f-3dbb3863d0ec@intel.com>
Date: Fri, 14 Jul 2023 10:02:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@linux.intel.com>, intel-xe@lists.freedesktop.org
References: <20230713094125.326709-5-matthew.auld@intel.com>
 <20230713094125.326709-8-matthew.auld@intel.com>
 <bc7b9c55-0726-0406-4e32-a9c7cd1d031a@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <bc7b9c55-0726-0406-4e32-a9c7cd1d031a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 4/4] drm/xe: add missing bulk_move reset
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

On 13/07/2023 17:05, Nirmoy Das wrote:
> Hi Matt,
> 
> On 7/13/2023 11:41 AM, Matthew Auld wrote:
>> It looks like bulk_move is set during object construction, but is only
>> removed on object close, however in various places we might not yet have
>> an actual fd to close, like on the error paths for the gem_create ioctl,
>> and also one internal user for the evict_test_run_gt() selftest. Try to
>> handle those cases by manually resetting the bulk_move. This should
>> prevent triggering:
>>
>> WARNING: CPU: 7 PID: 8252 at drivers/gpu/drm/ttm/ttm_bo.c:327
>> ttm_bo_release+0x25e/0x2a0 [ttm]
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_bo.c |  7 +++++++
>>   drivers/gpu/drm/xe/xe_bo.c       | 27 ++++++++++++++++++---------
>>   drivers/gpu/drm/xe/xe_bo.h       |  6 ++++++
>>   3 files changed, 31 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c 
>> b/drivers/gpu/drm/xe/tests/xe_bo.c
>> index 21c6dfef8dc7..1a5b48d60c80 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
>> @@ -285,6 +285,10 @@ static int evict_test_run_gt(struct xe_device 
>> *xe, struct xe_gt *gt, struct kuni
>>           xe_bo_unlock(external, &ww);
>>           xe_bo_put(external);
>> +
>> +        xe_bo_lock(bo, &ww, 0, false);
>> +        __xe_bo_unset_bulk_move(bo);
>> +        xe_bo_unlock(bo, &ww);
>>           xe_bo_put(bo);
>>           continue;
>> @@ -295,6 +299,9 @@ static int evict_test_run_gt(struct xe_device *xe, 
>> struct xe_gt *gt, struct kuni
>>   cleanup_external:
>>           xe_bo_put(external);
>>   cleanup_bo:
>> +        xe_bo_lock(bo, &ww, 0, false);
>> +        __xe_bo_unset_bulk_move(bo);
>> +        xe_bo_unlock(bo, &ww);
>>           xe_bo_put(bo);
>>           break;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 6353afa8d846..2ce09ae1d614 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1317,6 +1317,8 @@ xe_bo_create_locked_range(struct xe_device *xe,
>>       return bo;
>>   err_unlock_put_bo:
>> +    if (vm)
> 
> We create bulk  move obj when "vm && !xe_vm_in_fault_mode(vm) && flags & 
> XE_BO_CREATE_USER_BIT"
> 
> So I think we should rather check for the above condition or 
> bo->ttm.bulk_move or even just call __xe_bo_unset_bulk_move().

Yeah, looks like just unconditionally calling __xe_bo_unset_bulk_move() 
should be fine here. Will fix.

> 
> Otherwise Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

Thanks for reviewing the series.

> 
> Regards,
> 
> Nirmoy
> 
>> +        __xe_bo_unset_bulk_move(bo);
>>       xe_bo_unlock_vm_held(bo);
>>       xe_bo_put(bo);
>>       return ERR_PTR(err);
>> @@ -1760,22 +1762,29 @@ int xe_gem_create_ioctl(struct drm_device 
>> *dev, void *data,
>>       bo_flags |= args->flags << (ffs(XE_BO_CREATE_SYSTEM_BIT) - 1);
>>       bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>>                 bo_flags);
>> -    if (vm) {
>> -        xe_vm_unlock(vm, &ww);
>> -        xe_vm_put(vm);
>> +    if (IS_ERR(bo)) {
>> +        err = PTR_ERR(bo);
>> +        goto out_vm;
>>       }
>> -    if (IS_ERR(bo))
>> -        return PTR_ERR(bo);
>> -
>>       err = drm_gem_handle_create(file, &bo->ttm.base, &handle);
>> -    xe_bo_put(bo);
>>       if (err)
>> -        return err;
>> +        goto out_bulk;
>>       args->handle = handle;
>> +    goto out_put;
>> -    return 0;
>> +out_bulk:
>> +    if (vm)
>> +        __xe_bo_unset_bulk_move(bo);
>> +out_put:
>> +    xe_bo_put(bo);
>> +out_vm:
>> +    if (vm) {
>> +        xe_vm_unlock(vm, &ww);
>> +        xe_vm_put(vm);
>> +    }
>> +    return err;
>>   }
>>   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 08ca1d06bf77..72c68facd481 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -135,6 +135,12 @@ static inline void xe_bo_put(struct xe_bo *bo)
>>           drm_gem_object_put(&bo->ttm.base);
>>   }
>> +static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
>> +{
>> +    if (bo)
>> +        ttm_bo_set_bulk_move(&bo->ttm, NULL);
>> +}
>> +
>>   static inline void xe_bo_assert_held(struct xe_bo *bo)
>>   {
>>       if (bo)
