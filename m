Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86013C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 08:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A5310E323;
	Wed, 29 May 2024 08:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dM3bhrqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D040710E323
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 08:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716971710; x=1748507710;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZaD52N4S5CCW1rD+BHTKXlbZjNtGNUU1p4EuhSpb+a8=;
 b=dM3bhrqofw8i+xD90iuxGEyYW8KpR7mk3KiW1RGqcwrfHG7+0Sf/N57q
 VbJdGrzl2ck+IDhy8XdoO2zz8rzL2xrEGyVY0eVmlQPCx8Nme/oaq6gfo
 IhEazjwoJwPcHdhnGwtsdoxoTGqxRzm0OlUexhaJmt8djWMCMFKQBAl+V
 hKOmHa2Lz/FowELLhqtjg7W9TgDSoVhg8kK9LgZT5ncA8MUNZXCc3frhT
 IR7i7e4bXhb7u3ePjQBNGCJy/o+tRfjO5IKpp9vzn2KDj6sanF7nn5Czw
 /rpwo46m68aLolo39vyDSCP77ybYqd4DifRvPhy6lnsV96RMS9HMNk+XW Q==;
X-CSE-ConnectionGUID: H23238QrS+u1NSc0xJi1pw==
X-CSE-MsgGUID: 8dZeYfcQSW+u0zk5JAOq0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11745222"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="11745222"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 01:35:08 -0700
X-CSE-ConnectionGUID: BRPhyQLIT3aPRj5TV83HEA==
X-CSE-MsgGUID: bRcg8op/Siu2uq1fFrw6qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="39879674"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.33.194])
 ([10.246.33.194])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 01:35:07 -0700
Message-ID: <67033edc-db6b-47ba-bac8-2069ff8558af@linux.intel.com>
Date: Wed, 29 May 2024 10:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check empty pinned BO list with lock held.
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240528115408.22094-1-nirmoy.das@intel.com>
 <ZlZE5Sf4ambwtrIo@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZlZE5Sf4ambwtrIo@DUT025-TGLU.fm.intel.com>
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

Hi Matt,

On 5/28/2024 10:56 PM, Matthew Brost wrote:
> On Tue, May 28, 2024 at 01:54:08PM +0200, Nirmoy Das wrote:
>> Use lock that is meant to use for accessing the BO pin list.
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Agree with this patch removing removing micro optimization of bypassing
> &xe->pinned.lock, we should avoid thing like this.
>
> Curious if this was an actual problem (i.e. was their a bug report which
> lead to this change)?


There was a warning from static analyzer tool so no real bug report yet.

>
> Anyways the patch LGTM. With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Thanks,

Nirmoy

>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 10 ++++------
>>   1 file changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 03f7fe7acf8c..2bae01ce4e5b 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1758,11 +1758,10 @@ void xe_bo_unpin_external(struct xe_bo *bo)
>>   	xe_assert(xe, xe_bo_is_pinned(bo));
>>   	xe_assert(xe, xe_bo_is_user(bo));
>>   
>> -	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link)) {
>> -		spin_lock(&xe->pinned.lock);
>> +	spin_lock(&xe->pinned.lock);
>> +	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link))
>>   		list_del_init(&bo->pinned_link);
>> -		spin_unlock(&xe->pinned.lock);
>> -	}
>> +	spin_unlock(&xe->pinned.lock);
>>   
>>   	ttm_bo_unpin(&bo->ttm);
>>   
>> @@ -1785,9 +1784,8 @@ void xe_bo_unpin(struct xe_bo *bo)
>>   		struct ttm_place *place = &(bo->placements[0]);
>>   
>>   		if (mem_type_is_vram(place->mem_type)) {
>> -			xe_assert(xe, !list_empty(&bo->pinned_link));
>> -
>>   			spin_lock(&xe->pinned.lock);
>> +			xe_assert(xe, !list_empty(&bo->pinned_link));
>>   			list_del_init(&bo->pinned_link);
>>   			spin_unlock(&xe->pinned.lock);
>>   		}
>> -- 
>> 2.42.0
>>
