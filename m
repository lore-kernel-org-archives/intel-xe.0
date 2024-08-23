Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D46FC52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 15:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973FB10EC4D;
	Fri, 23 Aug 2024 15:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNTXYFkz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FB410EC24
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 15:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724427613; x=1755963613;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n5+gWJ3vZkdcZjLmq/o1JE6vnKB0NiMH+EzI3pHOlMo=;
 b=JNTXYFkzaFHrbeR1eVkQOSaAwyFwb0ccYQdfBQsaW/Oxsw32uyTc7YOt
 COZlKmGRj/aKPTpjIKO4UlYiIpwNV53nKTocWgyghburPb4Os5LFj+h8D
 RtwU8bcAX4ofDNieYAwhh2M3yNEcGrQSoMCx2JoGTo+ql0yhSk62M20Pv
 PKwMDR72lnlWatwN+NkqKPFxse7JKTBfBAwD+3D9yTHKAkSnz1j4Ac1Ti
 2MrlaXSRaVsXLsfgOWug9Vd4dWPw7QTcIeq+GsONdtSb1pGPC9FPoWYdR
 cCIGRqiblKPlnpdOT1G/gRR5czHmQCMTA+MqC3vEDwg2wgCUWMu2YsNo5 A==;
X-CSE-ConnectionGUID: aqjWKnbLQreWkpBITnzHFQ==
X-CSE-MsgGUID: TzNlev4mR7KMtEaP3ZUGlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22498528"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="22498528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:40:13 -0700
X-CSE-ConnectionGUID: RTAU9fukQSiTbioGbqDuEg==
X-CSE-MsgGUID: YMIzczohQTafEgsPGES4fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="66147868"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.40])
 ([10.245.245.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:40:12 -0700
Message-ID: <cc26ce82-88cf-4a99-9136-5bc5e43313c9@intel.com>
Date: Fri, 23 Aug 2024 16:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use separate rpm lockdep map for
 non-d3cold-capable devices
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240823135906.78899-1-thomas.hellstrom@linux.intel.com>
 <Zsif_XiAGPRvAIHa@intel.com>
 <4c75e56030c904cebea2c74544024e308f65bd68.camel@linux.intel.com>
 <ed1f0a1ffb6f199e61c509f4c98fec97983a084b.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ed1f0a1ffb6f199e61c509f4c98fec97983a084b.camel@linux.intel.com>
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

On 23/08/2024 16:20, Thomas Hellström wrote:
> On Fri, 2024-08-23 at 17:15 +0200, Thomas Hellström wrote:
>> Hi, Rodrigo.
>>
>> On Fri, 2024-08-23 at 10:43 -0400, Rodrigo Vivi wrote:
>>> On Fri, Aug 23, 2024 at 03:59:06PM +0200, Thomas Hellström wrote:
>>>
>>> Hi Thomas, first of all, please notice that you used the wrong
>>> address from our mailing list ;)
>>
>> You're right. Well it's friday afternoon here...
>>
>>>
>>> but a few more comments below...
>>>
>>>> For non-d3cold-capable devices we'd like to be able to wake up
>>>> the
>>>> device from reclaim. In particular, for Lunar Lake we'd like to
>>>> be
>>>> able to blit CCS metadata to system at shrink time; at least from
>>>> kswapd where it's reasonable OK to wait for rpm resume and a
>>>> preceding rpm suspend.
>>>>
>>>> Therefore use a separate lockdep map for such devices and prime
>>>> it
>>>> reclaim-tainted.
>>>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>
>>>>
>>>> Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Thomas Hellström
>>>> <thomas.hellstrom@linux.intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_pm.c | 45 +++++++++++++++++++++++++++++++-
>>>> --
>>>> ----
>>>>   1 file changed, 37 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c
>>>> b/drivers/gpu/drm/xe/xe_pm.c
>>>> index 9f3c14fd9f33..2e9fdb5da8bb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -70,11 +70,29 @@
>>>>    */
>>>>   
>>>>   #ifdef CONFIG_LOCKDEP
>>>> -static struct lockdep_map xe_pm_runtime_lockdep_map = {
>>>> -	.name = "xe_pm_runtime_lockdep_map"
>>>> +static struct lockdep_map xe_pm_runtime_d3cold_map = {
>>>> +	.name = "xe_rpm_d3cold_map"
>>>> +};
>>>> +
>>>> +static struct lockdep_map xe_pm_runtime_nod3cold_map = {
>>>> +	.name = "xe_rpm_nod3cold_map"
>>>>   };
>>>>   #endif
>>>>   
>>>> +static void xe_pm_runtime_acquire(const struct xe_device *xe)
>>>
>>> I believe this should have a different name.
>>> runtime_acquire and runtime_release sounds like runtime_get and
>>> runtime_put...
>>>
>>> since it is static perhaps we should only call it
>>> xe_rpm_lockmap_acquire
>>> and xe_rpm_lockmap_release
>>
>> Sure, I'll fix
>>
>>>
>>> or
>>> d3_lockmap_acquire
>>> d3_lockmap_release ?
>>>
>>> or something like that...
>>>
>>>> +{
>>>> +	lock_map_acquire(xe->d3cold.capable ?
>>>> +			 &xe_pm_runtime_d3cold_map :
>>>> +			 &xe_pm_runtime_nod3cold_map);
>>>> +}
>>>> +
>>>> +static void xe_pm_runtime_release(const struct xe_device *xe)
>>>> +{
>>>> +	lock_map_release(xe->d3cold.capable ?
>>>> +			 &xe_pm_runtime_d3cold_map :
>>>> +			 &xe_pm_runtime_nod3cold_map);
>>>> +}
>>>> +
>>>>   /**
>>>>    * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0-
>>>>> S2idle
>>>>    * @xe: xe device instance
>>>> @@ -354,7 +372,7 @@ int xe_pm_runtime_suspend(struct xe_device
>>>> *xe)
>>>>   	 * annotation here and in xe_pm_runtime_get() lockdep
>>>> will
>>>> see
>>>>   	 * the potential lock inversion and give us a nice
>>>> splat.
>>>>   	 */
>>>> -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>>> +	xe_pm_runtime_acquire(xe);
>>>>   
>>>>   	/*
>>>>   	 * Applying lock for entire list op as xe_ttm_bo_destroy
>>>> and xe_bo_move_notify
>>>> @@ -386,7 +404,7 @@ int xe_pm_runtime_suspend(struct xe_device
>>>> *xe)
>>>>   out:
>>>>   	if (err)
>>>>   		xe_display_pm_resume(xe, true);
>>>> -	lock_map_release(&xe_pm_runtime_lockdep_map);
>>>> +	xe_pm_runtime_release(xe);
>>>>   	xe_pm_write_callback_task(xe, NULL);
>>>>   	return err;
>>>>   }
>>>> @@ -407,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device
>>>> *xe)
>>>>   	/* Disable access_ongoing asserts and prevent recursive
>>>> pm
>>>> calls */
>>>>   	xe_pm_write_callback_task(xe, current);
>>>>   
>>>> -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>>> +	xe_pm_runtime_acquire(xe);
>>>>   
>>>>   	if (xe->d3cold.allowed) {
>>>>   		err = xe_pcode_ready(xe, true);
>>>> @@ -437,7 +455,7 @@ int xe_pm_runtime_resume(struct xe_device
>>>> *xe)
>>>>   			goto out;
>>>>   	}
>>>>   out:
>>>> -	lock_map_release(&xe_pm_runtime_lockdep_map);
>>>> +	xe_pm_runtime_release(xe);
>>>>   	xe_pm_write_callback_task(xe, NULL);
>>>>   	return err;
>>>>   }
>>>> @@ -458,8 +476,19 @@ int xe_pm_runtime_resume(struct xe_device
>>>> *xe)
>>>>    */
>>>>   static void pm_runtime_lockdep_prime(void)
>>>>   {
>>>> -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>>>> -	lock_map_release(&xe_pm_runtime_lockdep_map);
>>>> +	struct dma_resv lockdep_resv;
>>>> +
>>>> +	dma_resv_init(&lockdep_resv);
>>>> +	lock_map_acquire(&xe_pm_runtime_d3cold_map);
>>>> +	/* D3Cold takes the dma_resv locks to evict bos */
>>>> +	dma_resv_lock(&lockdep_resv, NULL);
>>>> +	fs_reclaim_acquire(GFP_KERNEL);
>>>> +	/* Shrinkers like to wake up the device under reclaim.
>>>> */
>>>> +	lock_map_acquire(&xe_pm_runtime_nod3cold_map);
>>>> +	lock_map_release(&xe_pm_runtime_nod3cold_map);
>>>> +	fs_reclaim_release(GFP_KERNEL);
>>>> +	dma_resv_unlock(&lockdep_resv);
>>>> +	lock_map_release(&xe_pm_runtime_d3cold_map);
>>>
>>> do we really need this entire sequence? or checking for d3capable
>>> here could have 2 different smaller sequences?
>>
>> Hm. I forgot to check when this function was called. I was assuming
>> it
>> was called only once per driver instance and in that case we need it
>> all since we can have multiple devices with different capabilities,
>> but
>> it seems to be called on each runtime_get(). Is that intentional?
> 
> Otherwise I'd like to change that to be called at module init?

hmm, don't we want to record the locks that are held when calling into 
the sync rpm get? We then make sure those locks are never grabbed in 
either of the callbacks. At least that was the original intention.

> 
> /Thomas
> 
> 
> 
>>
>> /Thomas
>>
>>
>>>
>>>>   }
>>>>   
>>>>   /**
>>>> -- 
>>>> 2.44.0
>>>>
>>
> 
