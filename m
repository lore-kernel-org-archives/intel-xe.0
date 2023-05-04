Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A81C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 14:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF2610E169;
	Thu,  4 May 2023 14:09:04 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F43A10E13B
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 14:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683209341; x=1714745341;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jl80rhiOIlh7+AwRzwCpnYszBvykkOzSCOiP+s7qIlE=;
 b=OMfYo6u5pa73KxhoNUGQbqwMzBisyG67SqCgPoXnUUEpiFjc3SbFo25z
 rvpESkeuRnUAlf2F/S4fsiwK73+jNqFPv2NR3w33+Hfv2qW3scOsuqi1A
 gpjQQiMz13WGsmxYjKyRm4NxU+9NRkXMeMDjr2QwiEc7cwqFrTBZ+CnCU
 ZnMerPO7FyRQuNLb5BzPHMlYyU+alHQ83LziLPkIMQbLHVfhyGHQdJxmG
 GPWMWX8CO7YsP8I5TlbDvbShlQEmUQFdogij2RN8wdUTeNKHf7FVtjxt0
 WwyhYxq2SzRHu3+XsQPiRvBaKIbO93VEZgTKmaG+ztOM3xvXidDYulISJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="333333170"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="333333170"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 06:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="761927165"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="761927165"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.80])
 ([10.249.254.80])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 06:39:29 -0700
Message-ID: <cbac018e-ac1a-1fbd-3fae-893ff1695389@linux.intel.com>
Date: Thu, 4 May 2023 15:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20230503152802.49011-1-matthew.auld@intel.com>
 <ZFNDKoO3l8+PZsY3@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZFNDKoO3l8+PZsY3@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix xe_device_mem_access_get() race
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


On 5/4/23 07:31, Matthew Brost wrote:
> On Wed, May 03, 2023 at 04:28:02PM +0100, Matthew Auld wrote:
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
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       | 22 ++++++++++++----------
>>   drivers/gpu/drm/xe/xe_device_types.h |  5 +++++
>>   drivers/gpu/drm/xe/xe_pm.c           |  9 ++-------
>>   drivers/gpu/drm/xe/xe_pm.h           |  2 +-
>>   4 files changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 45d6e5ff47fd..5f6554bb34d2 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -209,6 +209,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>   
>>   	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>>   
>> +	drmm_mutex_init(&xe->drm, &xe->mem_access.lock);
>> +
>>   	err = xe_display_create(xe);
>>   	if (WARN_ON(err))
>>   		goto err_put;
>> @@ -404,26 +406,26 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>>   
>>   void xe_device_mem_access_get(struct xe_device *xe)
>>   {
>> -	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>> -	int ref = atomic_inc_return(&xe->mem_access.ref);
>> +	int ref;
>>   
>> +	mutex_lock(&xe->mem_access.lock);
>> +	ref = atomic_inc_return(&xe->mem_access.ref);
> Drive by comment, if we have a lock then why does this need to be
> atomic?
>
> For the review maybe loop in Maarten because if I recall correctly he
> changed this to an atomic to fix some lockdep splat.
>
> Matt

I also stumbled upon this race some time ago but didn't dig deeper. I 
agree we need a mutex here but unless we access the mem_access.ref 
somewhere without the mutex, doesn't need to be atomic.

An alternative construct is to grab the mutex only on 0->1 and 1->0 
transitions and keep the ref atomic, but I'm not sure how much is gained 
assuming nearly all mutex locks are not contended.

/Thomas


>>   	if (ref == 1)
>> -		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
>> -
>> -	/* The usage counter increased if device was immediately resumed */
>> -	if (resumed)
>> -		xe_pm_runtime_put(xe);
>> +		xe->mem_access.hold_rpm = xe_pm_runtime_resume_and_get(xe);
>> +	mutex_unlock(&xe->mem_access.lock);
>>   
>>   	XE_WARN_ON(ref == S32_MAX);
>>   }
>>   
>>   void xe_device_mem_access_put(struct xe_device *xe)
>>   {
>> -	bool hold = xe->mem_access.hold_rpm;
>> -	int ref = atomic_dec_return(&xe->mem_access.ref);
>> +	int ref;
>>   
>> -	if (!ref && hold)
>> +	mutex_lock(&xe->mem_access.lock);
>> +	ref = atomic_dec_return(&xe->mem_access.ref);
>> +	if (!ref && xe->mem_access.hold_rpm)
>>   		xe_pm_runtime_put(xe);
>> +	mutex_unlock(&xe->mem_access.lock);
>>   
>>   	XE_WARN_ON(ref < 0);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 1cb404e48aaa..e8d320f93852 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -257,6 +257,11 @@ struct xe_device {
>>   	 * triggering additional actions when they occur.
>>   	 */
>>   	struct {
>> +		/**
>> +		 * @lock: Serialize xe_device_mem_access users, and protect the
>> +		 * below internal state.
>> +		 */
>> +		struct mutex lock;
>>   		/** @ref: ref count of memory accesses */
>>   		atomic_t ref;
>>   		/** @hold_rpm: need to put rpm ref back at the end */
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
