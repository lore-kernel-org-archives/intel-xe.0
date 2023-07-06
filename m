Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E04BEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 10:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337CA10E4C1;
	Thu,  6 Jul 2023 10:02:39 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BA510E4C1
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688637757; x=1720173757;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wvn4ABWq8sPUkbGVv2JmvwSm7RwyyQdrkbSqYHKMrMA=;
 b=e3vhRD0uzB5IKDnPpIlC5xm/WAr4EoNUbu3dblplATN/bONd1VT34PO0
 iBccAdMH14gHhlcA6Pq2vY5aT5YfdxXp93RFaZxo//OaKlr79srNKnLp7
 Sdo1M5PPZ2rvoWG6ybRW0cm15H0tjTjJ+YjVvClCY88RN020JvwqsYExc
 QJWi17THqZRIYaPWpPk8hzeRchi0/cD4+h3IIZrHKaieZA914NoZ+6kpR
 xAxN9Wvpsf7S6hqVRxTH8p5LKeMGz1cPRZvhxnWK1VDeG1ZjFviu+aIpd
 6jFNsrCDQuo6sR0mprQT284+qipbGt0Y+zDZkrsM3byHY0MhML5mVfdmg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="361034947"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="361034947"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 03:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="749083103"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="749083103"
Received: from fmahon-mobl.ger.corp.intel.com (HELO [10.252.26.229])
 ([10.252.26.229])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 03:02:35 -0700
Message-ID: <87b50115-60b6-d755-8a26-c2db3d8ea8d7@intel.com>
Date: Thu, 6 Jul 2023 11:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-15-matthew.auld@intel.com>
 <ZKY9lG6LMZfugBmd@DUT025-TGLU.fm.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZKY9lG6LMZfugBmd@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 6/7] drm/xe/tlb: also update seqno_recv
 during reset
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

On 06/07/2023 05:05, Matthew Brost wrote:
> On Wed, Jul 05, 2023 at 05:06:09PM +0100, Matthew Auld wrote:
>> We might have various kworkers waiting for TLB flushes to complete which
>> are not tracked with an explicit TLB fence, however at this stage that
>> will never happen since the CT is already disabled, so make sure we
>> signal them here under the assumption that we have completed a full GT
>> reset.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index b38da572d268..51789ec9ad57 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -89,10 +89,26 @@ invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
>>    void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
>>   {
>>   	struct xe_gt_tlb_invalidation_fence *fence, *next;
>> +	struct xe_guc *guc = &gt->uc.guc;
>>   
>> +	/*
>> +	 * CT channel is already disabled at this point. No new TLB requests can
>> +	 * appear.
>> +	 */
>> +
>> +	mutex_lock(&gt->uc.guc.ct.lock);
>>   	cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
>> +	/*
>> +	 * We might have various kworkers waiting for TLB flushes to complete
>> +	 * which are not tracked with an explicit TLB fence, however at this
>> +	 * stage that will never happen since the CT is already disabled, so
>> +	 * make sure we signal them here under the assumption that we have
>> +	 * completed a full GT reset.
>> +	 */
>> +	gt->tlb_invalidation.seqno_recv = gt->tlb_invalidation.seqno;
>> +	smp_wmb();
> 
> The smp_wmb() probably isn't needed, this my mistake and have this wrong
> in a places in the code. Barriers are not my strong point though so
> maybe double check on this.

I think we usually need some kind of barrier on the reader side also, so 
here this would likely be at the start of tlb_invalidation_seqno_past() 
or so, which is called by wait_event_timeout().

But reading[1] under the section "SLEEP AND WAKE-UP FUNCTIONS" it looks 
like wait_event_timeout() and wake_up() will already have the correct 
barriers for us wrt writing seqno_recv before the wake_up() and reading 
it from wait_event_timeout(). I can try to type a patch.

[1] https://www.kernel.org/doc/Documentation/memory-barriers.txt

> 
> Otherwise LGTM.
> 
> With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks.

> 
>> +	wake_up_all(&guc->ct.wq);
>>   
>> -	mutex_lock(&gt->uc.guc.ct.lock);
>>   	list_for_each_entry_safe(fence, next,
>>   				 &gt->tlb_invalidation.pending_fences, link)
>>   		invalidation_fence_signal(fence);
>> -- 
>> 2.41.0
>>
