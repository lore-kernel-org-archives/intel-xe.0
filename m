Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D245DC0015E
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 09:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D8010E087;
	Mon, 24 Jul 2023 09:30:32 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99F510E087
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 09:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690191030; x=1721727030;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jOS9m0EvnWQsbNueAlfA1jwJwTzXeJG1zc55009REsQ=;
 b=mfJ3BjEH4OYYGJ/lfHZbj4fnJFef3R2aKgZ7Gv5P709nctc5M/vRCugm
 IVUSsJxVmNKY+FfE8oFNbYYvvIjJzg9TMNJqbUayhLiWXgrEmfqSUXKRB
 lX1eSuMKoXd2MmiBOlpRSm+k3FrnbKulJmibhxM402T4RSRWT2E5i54xR
 H6o/h+7p7gQjMKlU845uBeVFkHoYYWEGPEVe0nKyFfs3CYoTy1DNpAmZ7
 Y8kLEsJCtzm1Fv7RXjt2+53N6zbKI8MtC7JVOTedUxiTNUsuua0546ptg
 w38nQcY9GtWHv3bGEqCxm5UqWDVlWVEOnx4fzDlxKth+l5zXaGtZGkQEU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="367419776"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="367419776"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:30:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="790898643"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="790898643"
Received: from dmansoco-mobl.ger.corp.intel.com (HELO [10.252.14.189])
 ([10.252.14.189])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 02:30:28 -0700
Message-ID: <c247bc4c-4607-6bc1-4bb6-aa998396eb46@intel.com>
Date: Mon, 24 Jul 2023 10:30:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230721123424.473210-2-matthew.auld@intel.com>
 <ZLrVihPCV44UyP5g@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZLrVihPCV44UyP5g@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: add lockdep annotation for
 xe_device_mem_access_put()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 21/07/2023 19:59, Rodrigo Vivi wrote:
> On Fri, Jul 21, 2023 at 01:34:25PM +0100, Matthew Auld wrote:
>> The main motivation is with d3cold which will make the suspend and
>> resume callbacks even more scary, but is useful regardless. We already
>> have the needed annotation on the acquire side with
>> xe_device_mem_access_get(), and by adding the annotation on the release
>> side we should have a lot more confidence that our locking hierarchy is
>> correct.
> 
> good idea!
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks. After sleeping on this, wondering if both callbacks should 
instead just be wrapped with lock_map_acquire/lock_map_release, and then 
in mem_access_get() we only do lock_map_acquire/lock_map_release at the 
start, without holding it over xe_pm_runtime_get()? I think that makes 
it clearer what why are trying to express:

"Any locks held when calling mem_access_get() are not allowed to be 
grabbed by the rpm suspend-resume callbacks".

Also slightly worried that something in rpm core will get confused by 
the annotation if we are holding it over xe_pm_runtime_get(), since it 
might look like a deadlock if there are more annotations deeper down. 
i.e lock(A) would be our lock_map_acquire in the diagram below.

> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c |  2 +-
>>   drivers/gpu/drm/xe/xe_device.h |  4 ++++
>>   drivers/gpu/drm/xe/xe_pm.c     | 24 ++++++++++++++++++++++++
>>   3 files changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 1c57944014e0..fed3015e2d96 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -36,7 +36,7 @@
>>   #include "xe_wait_user_fence.h"
>>   
>>   #ifdef CONFIG_LOCKDEP
>> -static struct lockdep_map xe_device_mem_access_lockdep_map = {
>> +struct lockdep_map xe_device_mem_access_lockdep_map = {
>>   	.name = "xe_device_mem_access_lockdep_map"
>>   };
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 8b085ffdc5f8..593accb68281 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -16,6 +16,10 @@ struct xe_file;
>>   #include "xe_force_wake.h"
>>   #include "xe_macros.h"
>>   
>> +#ifdef CONFIG_LOCKDEP
>> +extern struct lockdep_map xe_device_mem_access_lockdep_map;
>> +#endif
>> +
>>   static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>>   {
>>   	return container_of(dev, struct xe_device, drm);
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 17a69b7af155..d1b2aa52ea03 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -199,6 +199,29 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   	/* Disable access_ongoing asserts and prevent recursive pm calls */
>>   	xe_pm_write_callback_task(xe, current);
>>   
>> +	/*
>> +	 * The actual xe_device_mem_access_put() is always async underneath, so
>> +	 * exactly where that is called should makes no difference to us. However
>> +	 * we still need to be very careful with the locks that this callback
>> +	 * acquires and the locks that are acquired and held by any callers of
>> +	 * xe_device_mem_access_get(). We already have the matching annotation
>> +	 * on that side, but we also need it here. For example lockdep should be
>> +	 * able to tell us if the following scenario is in theory possible:
>> +	 *
>> +	 * CPU0                          | CPU1 (kworker)
>> +	 * lock(A)                       |
>> +	 *                               | xe_pm_runtime_suspend()
>> +	 *                               |      lock(A)
>> +	 * xe_device_mem_access_get()    |
>> +	 *
>> +	 * This will clearly deadlock since rpm core needs to wait for
>> +	 * xe_pm_runtime_suspend() to complete, but here we are holding lock(A)
>> +	 * on CPU0 which prevents CPU1 making forward progress.  With the
>> +	 * annotation here and in xe_device_mem_access_get() lockdep will see
>> +	 * the potential lock inversion and give us a nice splat.
>> +	 */
>> +	lock_map_acquire(&xe_device_mem_access_lockdep_map);
>> +
>>   	if (xe->d3cold.allowed) {
>>   		err = xe_bo_evict_all(xe);
>>   		if (err)
>> @@ -213,6 +236,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   
>>   	xe_irq_suspend(xe);
>>   out:
>> +	lock_map_release(&xe_device_mem_access_lockdep_map);
>>   	xe_pm_write_callback_task(xe, NULL);
>>   	return err;
>>   }
>> -- 
>> 2.41.0
>>
