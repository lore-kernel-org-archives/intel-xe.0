Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F96CC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 07:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E44610F843;
	Fri, 19 Apr 2024 07:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rxudr2/3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1316610F843
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 07:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713512663; x=1745048663;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vfTCnoxL/mqF4CVmgUi+3/npzQDuAXiSBw92DWbScyQ=;
 b=Rxudr2/3X0LEWjxIzFZ2s2d702gk2Tjyq4yUx2ScHkRakuNL5KZc4TIZ
 D6zU/VScNAt68zw4EAPJ7qPtyblZY1LMK/sGiKTuy+X4QRc2Exon0n78N
 vCpVgx0ii8KKPh5/UoiR9jBEDdblN2VopUEnWRtkqTsbfp8oFJ4JfP4rs
 5Trpixh0Gs/8nqjL/2aX3VFZ8tHEaRvJT49pSAaNE+HMpeXoCjgtE4lw2
 HFgeULWPnOcsCWTnSzaf4mKbEh8F5zPGStovJIeabPOPQkIx3ztiW6csd
 hMb07D8iMyKoSO/r6j8kkabUuuZ1Z4z4o6L4x9cQw5y902viXAQVk6xbC g==;
X-CSE-ConnectionGUID: d+bxSG3hRg64DB1qYxCGGg==
X-CSE-MsgGUID: XUgD3NW+T/20rDK2+2+fSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="31584821"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="31584821"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 00:44:22 -0700
X-CSE-ConnectionGUID: unPb+Ky7T0SI07JLsdhOMA==
X-CSE-MsgGUID: VKMSyRtLQhymmXRLyGWKQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="27877480"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.109]) ([10.245.244.109])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 00:44:21 -0700
Message-ID: <2ddfedea-284c-430f-b410-7e2aeca6f1cf@intel.com>
Date: Fri, 19 Apr 2024 08:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/preempt_fence: enlarge the fence critical section
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240418144630.299531-2-matthew.auld@intel.com>
 <ZiF6rw+6AjgMqqHE@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZiF6rw+6AjgMqqHE@DUT025-TGLU.fm.intel.com>
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

On 18/04/2024 20:55, Matthew Brost wrote:
> On Thu, Apr 18, 2024 at 03:46:31PM +0100, Matthew Auld wrote:
>> It is really easy to introduce subtle deadlocks in
>> preempt_fence_work_func() since we operate on single global ordered-wq
>> for signalling our preempt fences behind the scenes, so even though we
>> signal a particular fence, everything in the callback should be in the
>> fence critical section, since blocking in the callback will prevent
>> other published fences from signalling. If we enlarge the fence critical
>> section to cover the entire callback, then lockdep should be able to
>> understand this better, and complain if we grab a sensitive lock like
>> vm->lock, which is also held when waiting on preempt fences.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Thanks for the patch. Assume lockdep complains if [1] is applied?

It gave a big lockdep splat with that patch applied when running 
xe_exec_compute_mode. Just need to confirm if CI is happy.

> 
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks.

> 
> [1] https://patchwork.freedesktop.org/series/132571/
> 
>> ---
>>   drivers/gpu/drm/xe/xe_preempt_fence.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
>> index 7d50c6e89d8e..5b243b7feb59 100644
>> --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
>> +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
>> @@ -23,11 +23,19 @@ static void preempt_fence_work_func(struct work_struct *w)
>>   		q->ops->suspend_wait(q);
>>   
>>   	dma_fence_signal(&pfence->base);
>> -	dma_fence_end_signalling(cookie);
>> -
>> +	/*
>> +	 * Opt for keep everything in the fence critical section. This looks really strange since we
>> +	 * have just signalled the fence, however the preempt fences are all signalled via single
>> +	 * global ordered-wq, therefore anything that happens in this callback can easily block
>> +	 * progress on the entire wq, which itself may prevent other published preempt fences from
>> +	 * ever signalling.  Therefore try to keep everything here in the callback in the fence
>> +	 * critical section. For example if something below grabs a scary lock like vm->lock,
>> +	 * lockdep should complain since we also hold that lock whilst waiting on preempt fences to
>> +	 * complete.
>> +	 */
>>   	xe_vm_queue_rebind_worker(q->vm);
>> -
>>   	xe_exec_queue_put(q);
>> +	dma_fence_end_signalling(cookie);
>>   }
>>   
>>   static const char *
>> -- 
>> 2.44.0
>>
