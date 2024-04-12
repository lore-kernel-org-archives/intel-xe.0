Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90B0C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 12:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513E210E130;
	Fri, 12 Apr 2024 12:48:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+WHFkxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241A710E130
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712926103; x=1744462103;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YdY6r2Ki+sUbyfbWKtZuMUIBUAAa4tdZIl5oxzgbtDc=;
 b=b+WHFkxTL+UIRslAjCqIGezYBUYLv9eCT+s5dFw4576TiPuqDdtw16q4
 VNZ0thYkHGzIjXTwfIN0vgr7gj1jxXJUXywJAJRp73L7Bm7kXcYFatLTz
 LRyR11ibD/L1AONBVa8X6mjrFPaH7REonTTHVVmzTyC9XHGGfuNi9hP3y
 tSaY0xVlwaiHqCiEeD4N0OtYKeh0hbEyiOVlq9oIfsZUcGArgCqrJx+A9
 6iU3M7HsnHyzPZibITN6YezKroCaNDQw2p6OspMMZi58MvKj5/HENREE2
 woAsk+1Q79YPktfnuwJnQKaBvmS4IyYT/hG+g3KibfPtPNLRI2H6IQleW g==;
X-CSE-ConnectionGUID: sqDCOt6ETkq8qw7gVVN4xg==
X-CSE-MsgGUID: 0+WfNt4ZTjKv7dhQH8f7MA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25893487"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25893487"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 05:48:22 -0700
X-CSE-ConnectionGUID: LK7HW46HQcCb9r9My8qCJg==
X-CSE-MsgGUID: HCVD8WgBR0eAXEQO2amovQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="52379877"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.244.44])
 ([10.245.244.44])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 05:48:21 -0700
Message-ID: <8e7025c2-033b-4be0-a32e-f97aed327430@intel.com>
Date: Fri, 12 Apr 2024 13:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use drm_sched_priority enum instead of 0
To: Nirmoy Das <nirmoy.das@linux.intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240412113426.12518-1-nirmoy.das@intel.com>
 <319c54d5-7652-4328-b9fa-d7c808881ca7@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <319c54d5-7652-4328-b9fa-d7c808881ca7@linux.intel.com>
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

On 12/04/2024 13:03, Nirmoy Das wrote:
> Hi Matt,
> 
> 
> Shouldn't this be DRM_SCHED_PRIORITY_NORMAL ?

Looks like this was already sent: 
https://lore.kernel.org/intel-xe/ZgJhpTlz6OfqiaQg@DUT025-TGLU.fm.intel.com/

> 
> Regards,
> 
> Nirmoy
> 
> On 4/12/2024 1:34 PM, Nirmoy Das wrote:
>> Use enum drm_sched_priority, DRM_SCHED_PRIORITY_KERNEL
>> instead of 0.
>>
>> Cc: Matthew Auld<matthew.auld@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_execlist.c      | 3 ++-
>>   drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 +-
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>> index dece2785933c..a8c83b36289f 100644
>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>> @@ -341,7 +341,8 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>>   		goto err_free;
>>   
>>   	sched = &exl->sched;
>> -	err = drm_sched_entity_init(&exl->entity, 0, &sched, 1, NULL);
>> +	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_KERNEL,
>> +				    &sched, 1, NULL);
>>   	if (err)
>>   		goto err_sched;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> index 10c6bb9c9386..1f712f4fc76a 100644
>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>> @@ -63,7 +63,7 @@ static inline int
>>   xe_sched_entity_init(struct xe_sched_entity *entity,
>>   		     struct xe_gpu_scheduler *sched)
>>   {
>> -	return drm_sched_entity_init(entity, 0,
>> +	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_KERNEL,
>>   				     (struct drm_gpu_scheduler **)&sched,
>>   				     1, NULL);
>>   }
