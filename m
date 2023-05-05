Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA946C77B7F
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 19:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707D810E665;
	Fri,  5 May 2023 19:04:23 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7166D10E666
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 19:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683313461; x=1714849461;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sfM8xi7pF9/NNEm+V7WbHpgeymva7oLvOPjgSIpOSyA=;
 b=TyiSnivov8q+ymL5Rq3MTFH/GcL3okJb7CEzVk+O87S/7KX153dvnOZ0
 M83oRlZPPkZ4I/R2n3S1yuwSby7CTCqIpFDXGHhWcaDz5XmuZYi+JygFc
 eW8qaHPL8gzMxc5cj+Osii9lcfaKDBYJrkvbGA7tDf34Thbjzt8z/casS
 rDSvwJDqaE4dwtjN5eOu8NPNpjpqkw+yo4FiZ2x0iOLXSWcnGEP3BPGrT
 7rCpTcMRqbRafKxL11vo3KmQsT51yj4PTJCiWVKkIz9dfVNKOI4Sj4JY2
 jWzzk0Xg4o6rro/wE8iO1+Mts2TgkZqHRJQP3FNCDBXLFWgRJNzutJRi4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="412519644"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="412519644"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 12:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="787266312"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="787266312"
Received: from jbrophy1-mobl1.amr.corp.intel.com (HELO [10.252.12.254])
 ([10.252.12.254])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 12:04:18 -0700
Message-ID: <21ffd92b-a7fe-b5e5-f01e-c21bd7a51b0a@intel.com>
Date: Fri, 5 May 2023 20:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
References: <20230505180349.367572-1-matthew.auld@intel.com>
 <20230505180349.367572-2-matthew.auld@intel.com>
 <ZFVI1JUi7UqBUks7@rdvivi-mobl4>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZFVI1JUi7UqBUks7@rdvivi-mobl4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 2/3] drm/xe: fix
 xe_device_mem_access_get() race
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 05/05/2023 19:20, Rodrigo Vivi wrote:
> On Fri, May 05, 2023 at 07:03:48PM +0100, Matthew Auld wrote:
>> It looks like there is at least one race here, given that the
>> pm_runtime_suspended() check looks to return false if we are in the
>> process of suspending the device (RPM_SUSPENDING vs RPM_SUSPENDED). We
>> later also do xe_pm_runtime_get_if_active(), but since the device is
>> suspending or has now suspended, this doesn't do anything either.
>> Following from this we can potentially return from
>> xe_device_mem_access_get() with the device suspended or about to be,
>> leading to broken behaviour.
>>
>> Attempt to fix this by always grabbing the runtime ref when our internal
>> ref transitions from 0 -> 1, and then wrap the whole thing with a lock
>> to ensure callers are serialized.
>>
>> v2:
>>    - ct->lock looks to be primed with fs_reclaim, so holding that and
>>      then allocating memory will cause lockdep to complain. Now that we
>>      unconditionally grab the mem_access.lock around mem_access_{get,put},
>>      we need to change the ordering wrt to grabbing the ct->lock, since
>>      some of the runtime_pm routines can allocate memory (or at least
>>      that's what lockdep seems to suggest). Hopefully not a big deal.
>>      It might be that there were already issues with this, just that the
>>      atomics where "hiding" the potential issues.
> 
> it could've be done with a separated patch coming before, but anyway,

Yeah, something is still very broken with lockdep though according to 
CI...now it's complaining about a different lock. Will look again at 
this next week.

> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c              | 11 +++--------
>>   drivers/gpu/drm/xe/xe_device_types.h        |  5 ++++-
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++++
>>   drivers/gpu/drm/xe/xe_guc_ct.c              | 13 +++++++------
>>   drivers/gpu/drm/xe/xe_pm.c                  |  9 ++-------
>>   drivers/gpu/drm/xe/xe_pm.h                  |  2 +-
>>   6 files changed, 21 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 01c497bcf9a5..0a18b41a0e1a 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -406,17 +406,12 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>>   
>>   void xe_device_mem_access_get(struct xe_device *xe)
>>   {
>> -	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>> -
>>   	mutex_lock(&xe->mem_access.lock);
>> -	if (xe->mem_access.ref++ == 0)
>> -		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
>> +	if (xe->mem_access.ref == 0)
>> +		xe->mem_access.hold_rpm = xe_pm_runtime_resume_and_get(xe);
>> +	xe->mem_access.ref++;
>>   	mutex_unlock(&xe->mem_access.lock);
>>   
>> -	/* The usage counter increased if device was immediately resumed */
>> -	if (resumed)
>> -		xe_pm_runtime_put(xe);
>> -
>>   	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 59462933f67a..9e37189d5745 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -256,7 +256,10 @@ struct xe_device {
>>   	 * triggering additional actions when they occur.
>>   	 */
>>   	struct {
>> -		/** @lock: protect the ref count */
>> +		/**
>> +		 * @lock: Serialize xe_device_mem_access users,
>> +		 * and protect the below internal state, like @ref.
>> +		 */
>>   		struct mutex lock;
>>   		/** @ref: ref count of memory accesses */
>>   		s32 ref;
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index 604f189dbd70..e769af7e7cdb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -5,6 +5,7 @@
>>   
>>   #include "xe_gt_tlb_invalidation.h"
>>   
>> +#include "xe_device.h"
>>   #include "xe_gt.h"
>>   #include "xe_guc.h"
>>   #include "xe_guc_ct.h"
>> @@ -112,6 +113,8 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>   	 * in order which they currently are, if that changes the algorithm will
>>   	 * need to be updated.
>>   	 */
>> +
>> +	xe_device_mem_access_get(gt->xe);
>>   	mutex_lock(&guc->ct.lock);
>>   	seqno = gt->tlb_invalidation.seqno;
>>   	if (fence) {
>> @@ -140,6 +143,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>   	if (ret < 0 && fence)
>>   		invalidation_fence_signal(fence);
>>   	mutex_unlock(&guc->ct.lock);
>> +	xe_device_mem_access_put(gt->xe);
>>   
>>   	return ret;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 9055ff133a7c..579d7f341f13 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -494,26 +494,22 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>   		}
>>   	}
>>   
>> -	xe_device_mem_access_get(ct_to_xe(ct));
>>   retry:
>>   	ret = has_room(ct, len + GUC_CTB_HDR_LEN, g2h_len);
>>   	if (unlikely(ret))
>> -		goto put_wa;
>> +		goto out;
>>   
>>   	ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno : 0,
>>   			!!g2h_fence);
>>   	if (unlikely(ret)) {
>>   		if (ret == -EAGAIN)
>>   			goto retry;
>> -		goto put_wa;
>> +		goto out;
>>   	}
>>   
>>   	g2h_reserve_space(ct, g2h_len, num_g2h);
>>   	xe_guc_notify(ct_to_guc(ct));
>> -put_wa:
>> -	xe_device_mem_access_put(ct_to_xe(ct));
>>   out:
>> -
>>   	return ret;
>>   }
>>   
>> @@ -535,6 +531,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   
>>   	XE_BUG_ON(g2h_len && g2h_fence);
>>   	lockdep_assert_held(&ct->lock);
>> +	xe_device_assert_mem_access(ct_to_xe(ct));
>>   
>>   try_again:
>>   	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
>> @@ -602,10 +599,14 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   
>>   	XE_BUG_ON(g2h_len && g2h_fence);
>>   
>> +	xe_device_mem_access_get(ct_to_xe(ct));
>> +
>>   	mutex_lock(&ct->lock);
>>   	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
>>   	mutex_unlock(&ct->lock);
>>   
>> +	xe_device_mem_access_put(ct_to_xe(ct));
>> +
>>   	return ret;
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index b7b57f10ba25..b2ffa001e6f7 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -210,14 +210,9 @@ int xe_pm_runtime_put(struct xe_device *xe)
>>   	return pm_runtime_put_autosuspend(xe->drm.dev);
>>   }
>>   
>> -/* Return true if resume operation happened and usage count was increased */
>> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
>> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
>>   {
>> -	/* In case we are suspended we need to immediately wake up */
>> -	if (pm_runtime_suspended(xe->drm.dev))
>> -		return !pm_runtime_resume_and_get(xe->drm.dev);
>> -
>> -	return false;
>> +	return !pm_runtime_resume_and_get(xe->drm.dev);
>>   }
>>   
>>   int xe_pm_runtime_get_if_active(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index 6a885585f653..1b4c15b5e71a 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -19,7 +19,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe);
>>   int xe_pm_runtime_resume(struct xe_device *xe);
>>   int xe_pm_runtime_get(struct xe_device *xe);
>>   int xe_pm_runtime_put(struct xe_device *xe);
>> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>>   
>>   #endif
>> -- 
>> 2.40.0
>>
