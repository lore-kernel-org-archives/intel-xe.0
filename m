Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C5CD3000A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 13:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E9510E91D;
	Fri, 18 Oct 2024 13:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgP/+c7M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D99610E91D
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 13:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729258338; x=1760794338;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FkxiOm6gvQJ/dYfYtCjsClsJPQWuRCfrZw+e/BMzIr0=;
 b=RgP/+c7MtUh37KyQec23cKf+3sSODjbybAmWF/KPp2Dcb6xbCEbVaLab
 0VmgPJnk89ZrKATBkk0rC3fOWK7JOkI5PdXg8OuyrUdxHc/6W5RmsROYk
 X5rOzgpifISx/v0x3ick9Bau7cRClDgOfmXfgUrEzSfE50MIhOzBS98OS
 capj5zSogzmslZclCwgAbScZS18Jef2iRctBjqzZmwaM4XpoHBYTxpPUe
 qclrLH7fZGDKRYHEzDLu+WSPNPlh2D8Y8g38wLPcmYw1t5BWtUVb+Q2nr
 qaB+zi0WLa9/igMpFNEBQpYAlEAVGp84dDXKHy3ljby3E/dru3X+t73OC Q==;
X-CSE-ConnectionGUID: mkbJKMvHT5K0uFHyUnObYA==
X-CSE-MsgGUID: dsCYjghfRumJurPJ4zmILw==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="31653618"
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="31653618"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 06:32:18 -0700
X-CSE-ConnectionGUID: mRiAnU57SZKFYZCYrOYtuw==
X-CSE-MsgGUID: XHaD5+cvQpm++kZUUyOe0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="82840160"
Received: from rkapilut-mobl1.ger.corp.intel.com (HELO [10.245.162.46])
 ([10.245.162.46])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 06:32:16 -0700
Message-ID: <5a331e93-1d0f-4245-aa45-5f2eb08605b6@linux.intel.com>
Date: Fri, 18 Oct 2024 15:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/ufence: Kick ufence immediately when possible
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
References: <20241017094237.279327-1-nirmoy.das@intel.com>
 <ZxGjg+DwLbDhiNOX@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZxGjg+DwLbDhiNOX@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 10/18/2024 1:53 AM, Matthew Brost wrote:
> On Thu, Oct 17, 2024 at 11:42:37AM +0200, Nirmoy Das wrote:
>> If the backing fence is signaled then signal ufence soon with
>> system_wq. This should reduce load from the xe ordered_wq and also
>> won't block signaling a ufence which doesn't require any serialization.
>>
>> v2: fix system_wq typo
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> gc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_sync.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index c6cf227ead40..1a7907293088 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -89,10 +89,14 @@ static void user_fence_worker(struct work_struct *w)
>>  	user_fence_put(ufence);
>>  }
>>  
>> -static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>> +static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence,
>> +			bool signaled)
> Predantic but maybe replace 'bool signaled' which a flag. We really want
> to avoid bools if possible.
>
> e.g.
>
> #define UFENCE_FLAG_SIGNALED	BIT(0)
>
> static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence,
> 			unsigned int flags)
> {
> 	...
> 	if (flags & UFENCE_FLAG_SIGNALED)
> 		...
> 	else
> 		...
> 	...	
> }
>
>>  {
>>  	INIT_WORK(&ufence->worker, user_fence_worker);
>> -	queue_work(ufence->xe->ordered_wq, &ufence->worker);
>> +	if (signaled)
>> +		queue_work(system_wq, &ufence->worker);
> I don't think you need the work queue here, just call the work func directly.


Ok, then I think we don't need flag either. Send a v3, let me know how that looks :)


Thanks,

Nirmoy

>
> s/queue_work(system_wq, &ufence->worker)/user_fence_worker(&ufence->worker)
>
> Matt
>
>> +	else
>> +		queue_work(ufence->xe->ordered_wq, &ufence->worker);
>>  	dma_fence_put(fence);
>>  }
>>  
>> @@ -100,7 +104,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>  {
>>  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
>>  
>> -	kick_ufence(ufence, fence);
>> +	kick_ufence(ufence, fence, false);
>>  }
>>  
>>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>> @@ -236,7 +240,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>>  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
>>  					     user_fence_cb);
>>  		if (err == -ENOENT) {
>> -			kick_ufence(sync->ufence, fence);
>> +			kick_ufence(sync->ufence, fence, true);
>>  		} else if (err) {
>>  			XE_WARN_ON("failed to add user fence");
>>  			user_fence_put(sync->ufence);
>> -- 
>> 2.46.0
>>
