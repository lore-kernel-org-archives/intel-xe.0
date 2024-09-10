Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C85DEB64DE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 14:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EA510E83A;
	Tue, 10 Sep 2024 14:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmQ7U3xP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E170710E83A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725979951; x=1757515951;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=moHcA6El4Fuu46GTPJSFEtzNOj2mml3kSQCc0AYnBeE=;
 b=TmQ7U3xP+vp1bSTRF3fngc/0hsImnPZFmAPnQ5dtFSWuU87AjTpqm1eS
 thZBPouDnR3F+DZpD4tBqdNz0h3+T5Jhvzw/mDgDwJohgkAGs35RHlyP1
 Ms+L5uKP6He8te4kIMjvuBtlKqdVnwj/sz8NYtYse7BGe7wSLRxobjmbl
 uIKIVHLfr7j7DGnUJcnfwKrLP7+mPBH81iekbY9TFvwj0F3RwyvS2KKsV
 0qJXKLhP/lEpCi6ubqEeITf3mzXSv+d/fsK4/dU7bYSnD1JgksewMZAJH
 WXL4mJs8NXG/ealHoyvG107pvziZaE1GMlRsfBd2+O0rfwTtVxBZPYLdF Q==;
X-CSE-ConnectionGUID: 3ytu0ZUYT4e2QvU5EmR0Cw==
X-CSE-MsgGUID: 2dG5Uq12Sr6xG0SKSYHKkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24924387"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24924387"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:52:31 -0700
X-CSE-ConnectionGUID: GE70YSoQTFC/sStYSy2ywQ==
X-CSE-MsgGUID: X41MQYCxRqWOtA2BC0RDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="97749198"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.215])
 ([10.245.245.215])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 07:52:29 -0700
Message-ID: <62149100-98df-46ea-87d3-9aefb060b655@intel.com>
Date: Tue, 10 Sep 2024 15:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/bo: add some annotations in bo_put()
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240910131145.136984-5-matthew.auld@intel.com>
 <20240910131145.136984-8-matthew.auld@intel.com>
 <ZuBQ1CGPrZkx5/Eh@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZuBQ1CGPrZkx5/Eh@DUT025-TGLU.fm.intel.com>
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

Hi,

On 10/09/2024 14:59, Matthew Brost wrote:
> On Tue, Sep 10, 2024 at 02:11:49PM +0100, Matthew Auld wrote:
>> If the put() triggers bo destroy then there is at least one potential
>> sleeping lock. Also annotate bos_lock and ggtt lock.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 14 ++++++++++++++
>>   drivers/gpu/drm/xe/xe_bo.h |  6 +-----
>>   2 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 53948a965404..4176b302c38d 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -2320,6 +2320,20 @@ void xe_bo_put_commit(struct llist_head *deferred)
>>   		drm_gem_object_free(&bo->ttm.base.refcount);
>>   }
>>   
>> +void xe_bo_put(struct xe_bo *bo)
> 
> These are helpful but thinking we might need a version without asserts
> that can be used in code paths where we know that we have another ref to
> the BO. I can already think of a case in the SVM code where this would
> be needed. In that version maybe we assert the ref count > 1, granted
> that races but probably the best we can there.

Yeah, adding another put() variant or similar for that case should be 
totally fine I think.

> 
> What do you think?
> 
> Asserts look good though.
> 
> Matt
> 
>> +{
>> +	might_sleep();
>> +	if (bo) {
>> +#ifdef CONFIG_PROC_FS
>> +		if (bo->client)
>> +			might_lock(&bo->client->bos_lock);
>> +#endif
>> +		if (bo->ggtt_node && bo->ggtt_node->ggtt)
>> +			might_lock(&bo->ggtt_node->ggtt->lock);
>> +		drm_gem_object_put(&bo->ttm.base);
>> +	}
>> +}
>> +
>>   /**
>>    * xe_bo_dumb_create - Create a dumb bo as backing for a fb
>>    * @file_priv: ...
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index dbfb3209615d..6e4be52306df 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -126,11 +126,7 @@ static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
>>   	return bo;
>>   }
>>   
>> -static inline void xe_bo_put(struct xe_bo *bo)
>> -{
>> -	if (bo)
>> -		drm_gem_object_put(&bo->ttm.base);
>> -}
>> +void xe_bo_put(struct xe_bo *bo);
>>   
>>   static inline void __xe_bo_unset_bulk_move(struct xe_bo *bo)
>>   {
>> -- 
>> 2.46.0
>>
