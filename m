Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F1D2E9F0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 14:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B8910E4D7;
	Mon, 11 Nov 2024 14:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfICWDFr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE06310E4D7
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Nov 2024 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731336593; x=1762872593;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xciee3nVHoua8DtT7D1MKkd9Ocj0o16fObu62RM+0Kg=;
 b=lfICWDFrx9NtIHEC34S/T1bcc6MbTA3FSvk+INWqH4IHaakntKMxKfCH
 TN9aRgJ6rByrxlZd2UgOzc+uRyRaclOey7vSkI4rOBSQOb0u1DuEm+kZR
 fmv2oJc9qcr4lOdfwfTwwfChL4IZWL1E46L51jWLthVeEuGNxrW9FwaCO
 AkHeBPt3dG86A2sdPBsnmL6iax+cHAIWm+j3Dc9reQFwxZIpl0kgMVUsk
 LeqfzTGIrpdE4D+2ZXcjWfkx6wPsnaMwKqQveoogENmpXw4k2ZWmjufzI
 jVJp2J+E4iL4nem3Xse+giPu9kPaZ7rN+Inrwm9FZ1TDWplkbqtd8zuCP g==;
X-CSE-ConnectionGUID: 2fxT4JecT++6uAhXkac3Bw==
X-CSE-MsgGUID: 6Fl9MgeGQIeo+AKSgMR0HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30996683"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30996683"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 06:49:53 -0800
X-CSE-ConnectionGUID: iPKhibyOSIG4YB77k9lmPg==
X-CSE-MsgGUID: om18w66LToi8NnUUMF3n1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="87736117"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.195.120])
 ([10.245.195.120])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 06:49:51 -0800
Message-ID: <a715989e-313f-4a97-8863-789dacdb02d2@linux.intel.com>
Date: Mon, 11 Nov 2024 15:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/ufence: Signal ufence faster when possible
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
References: <20241018152958.1975994-1-nirmoy.das@intel.com>
 <ZzAtpNKoOGusN0VW@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZzAtpNKoOGusN0VW@lstrano-desk.jf.intel.com>
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


On 11/10/2024 4:51 AM, Matthew Brost wrote:
> On Fri, Oct 18, 2024 at 05:29:58PM +0200, Nirmoy Das wrote:
>> When the backing fence is already signaled, the ufence can be
>> immediately signaled without queuing in the ordered work queue.
>> This should also reduce load from the xe ordered_wq and won't
>> block signaling a ufence which doesn't require any serialization.
>>
>> v2: fix system_wq typo
>> v3: signal immediately instead of queuing in system_wq (Matt B)
>> v4: revert back to v2 of using workqueue because of locking issue
>>     and remote viewing a different mm struct.
>>     Use Xe's unordered_wq which should be less congested than global
>>     one.
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_sync.c | 24 +++++++++++++++++++++---
>>  1 file changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index a90480c6aecf..7a1558c7ce09 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -92,18 +92,27 @@ static void user_fence_worker(struct work_struct *w)
>>  	user_fence_put(ufence);
>>  }
>>  
>> -static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>> +static void kick_ufence_ordered(struct xe_user_fence *ufence,
>> +				struct dma_fence *fence)
>>  {
>>  	INIT_WORK(&ufence->worker, user_fence_worker);
>>  	queue_work(ufence->xe->ordered_wq, &ufence->worker);
>>  	dma_fence_put(fence);
>>  }
>>  
>> +static void kick_ufence_unordered(struct xe_user_fence *ufence,
>> +				  struct dma_fence *fence)
>> +{
>> +	INIT_WORK(&ufence->worker, user_fence_worker);
>> +	queue_work(ufence->xe->unordered_wq, &ufence->worker);
> This doesn't work, if this has been merged it needs to be reverted.


This is not merged.

>
> Consider the case when a user requests two user fence writes to same
> address in the fashion of a seqno (i.e. 2nd write is one more the value
> of the first). If we use an unordered work queue, the 2nd write could
> pass the first resulting in the seqno being incorrect.

OK, yes, this patch will break this behavior. This was to fix the ufence timeout issue which now seems to be

coming for the LNL scheduling issue rather then loaded xe->ordered_wq. I will drop this patch now until there is real need to optimize this path.


Thanks,

Nirmoy

>
> Matt
>
>> +	dma_fence_put(fence);
>> +}
>> +
>>  static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>  {
>>  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
>>  
>> -	kick_ufence(ufence, fence);
>> +	kick_ufence_ordered(ufence, fence);
>>  }
>>  
>>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>> @@ -239,7 +248,16 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>>  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
>>  					     user_fence_cb);
>>  		if (err == -ENOENT) {
>> -			kick_ufence(sync->ufence, fence);
>> +			/*
>> +			 * use unordered_wq to schedule it faster and to keep
>> +			 * the ordered_wq less loaded as serialization is not
>> +			 * needed for when the fence is already signaled.
>> +			 *
>> +			 * This needs to be done with a wq here to avoid locking
>> +			 * issue when a ufence addr is backed by a bo and also
>> +			 * tsk->mm needs to null to call kthread_use_mm().
>> +			 */
>> +			kick_ufence_unordered(sync->ufence, fence);
>>  		} else if (err) {
>>  			XE_WARN_ON("failed to add user fence");
>>  			user_fence_put(sync->ufence);
>> -- 
>> 2.46.0
>>
