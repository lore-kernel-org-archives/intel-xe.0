Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A13C7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 10:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B74510E056;
	Wed, 10 May 2023 10:11:09 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C45C10E056
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683713467; x=1715249467;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9O1SqZSD/c+1yJOvrqz4kfcoymwnr4En9a+OUReyTTo=;
 b=LLJuKCJ6mHqqmpXn7U6GvpGtmmakdlwPav69fnyJ1GEmr3btrrTaj8nx
 rz9giYhZAcSxb1ZPMxxHsfjBChbkM12DNcUqvO0dmFyQFyRd/AzsO0Oy6
 TlRoWHrQ+WZ37f8AmdBomks4IkWk/F+pCNDl1JYJmFOw30jtRjRQk7vrl
 Bc3JGS6h+ZoyyF24mpcPJWPCbC48rAXm7JBio1kTwJtiD1Q5xmR2BfUw8
 7bbRqXDgyzQTdckpaxJeTh4J3dp5fTh2rX6rmL/nbL+NoGFkaubvRQqeo
 Ykl3C/yAfTDwzLw6UH9FrfhwLBrqq3i6TnB660bVEk1L0EIFZD1JjEV+D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="352367781"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="352367781"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 03:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="732101135"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="732101135"
Received: from respir1x-mobl1.ger.corp.intel.com (HELO [10.252.14.125])
 ([10.252.14.125])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 03:11:05 -0700
Message-ID: <c9c3774d-fbce-cc33-a753-c1204b10a194@intel.com>
Date: Wed, 10 May 2023 11:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
References: <20230505144910.317943-1-matthew.auld@intel.com>
 <ZFhH7tppkQlfgZ9t@DUT025-TGLU.fm.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZFhH7tppkQlfgZ9t@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix tlb_invalidation_seqno_past()
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

On 08/05/2023 01:53, Matthew Brost wrote:
> On Fri, May 05, 2023 at 03:49:10PM +0100, Matthew Auld wrote:
>> Checking seqno_recv >= seqno looks like it will incorrectly report true
>> when the seqno has wrapped (not unlikely given
>> TLB_INVALIDATION_SEQNO_MAX). Calling xe_gt_tlb_invalidation_wait() might
>> then return before the flush has been completed by the GuC.
>>
>> Fix this by treating a large negative delta as an indication that the
>> seqno has wrapped around. Similar to how we treat a large positive delta
>> as an indication that the seqno_recv must have wrapped around, but in
>> that case the seqno has likely also signalled.
>>
>> It looks like we could also potentially make the seqno use the full
>> 32bits as supported by the GuC.
> 
> Yea we def could use more of the space but in the end we have the seqno
> wrap issue. I think I set this to a low value to prove the wrapping
> protection worked (it didn't) by triigering wraps more often than the
> wrapping 32 bits.

Ok, make sense.

> 
> With, this patch LGTM.
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks.

> 
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index 604f189dbd70..67822b3dd353 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -251,14 +251,15 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>>   
>>   static bool tlb_invalidation_seqno_past(struct xe_gt *gt, int seqno)
>>   {
>> -	if (gt->tlb_invalidation.seqno_recv >= seqno)
>> -		return true;
>> +	if (seqno - gt->tlb_invalidation.seqno_recv <
>> +	    -(TLB_INVALIDATION_SEQNO_MAX / 2))
>> +		return false;
>>   
>>   	if (seqno - gt->tlb_invalidation.seqno_recv >
>>   	    (TLB_INVALIDATION_SEQNO_MAX / 2))
>>   		return true;
>>   
>> -	return false;
>> +	return gt->tlb_invalidation.seqno_recv >= seqno;
>>   }
>>   
>>   /**
>> -- 
>> 2.40.0
>>
