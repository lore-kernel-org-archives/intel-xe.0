Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AA3EDE999
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 15:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F30A10E848;
	Tue, 10 Sep 2024 15:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ElXe2DMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167FE10E848
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 15:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725980673; x=1757516673;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=8OwjfaYJQsfTngBHl/p/V/o4CdmPjRuQFPJHCf8l1BU=;
 b=ElXe2DMzWig8s8ZETxqL0Zt5rT/kzoPhJ18CPuRp4M32mIm5SRQmrtxX
 Qoo3AZhAZxyi1QTDpsvRt6aHSPPOoTl0NXf1O0T7gzf//uNGdnh8CF79r
 APVjNIiH8vW+plzqXl4vjC1jRZhWviFaMIOYEnlxp4YSz8jo7rPfS/x4n
 tElj40q9LDFsC9ISSwFFT0Tx4MhqQjDeFHqgiVo5FZUs7ARc4+4Q/XL9o
 n9GVt8K9pwRr6mFhHYedBy5TkVqmihLG3VuIYD+YiHzVp1AlJA94zTX6+
 cfyauaJmosE6I7K7u4fd045AflvGtH1vpe+y8kLtNtQi6DfHgH77fvik4 A==;
X-CSE-ConnectionGUID: gJ6qNw61TUSX1pKKxw3OTw==
X-CSE-MsgGUID: g7axSnnsRCWRgBUJQ2w4ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24548728"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24548728"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP; 10 Sep 2024 08:04:04 -0700
X-CSE-ConnectionGUID: g+Czl6FfT1GEZZcHJBTzbg==
X-CSE-MsgGUID: L/TT54/DTlSkBqWMKAaCHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="97878748"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.215])
 ([10.245.245.215])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 08:04:01 -0700
Message-ID: <7c417b69-1730-44b4-94d6-cb86a7a5d981@intel.com>
Date: Tue, 10 Sep 2024 16:03:58 +0100
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
 <ZuBccDRC0NkcJsux@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZuBccDRC0NkcJsux@DUT025-TGLU.fm.intel.com>
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

On 10/09/2024 15:49, Matthew Brost wrote:
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
>> +{
>> +	might_sleep();
>> +	if (bo) {
>> +#ifdef CONFIG_PROC_FS
>> +		if (bo->client)
>> +			might_lock(&bo->client->bos_lock);
>> +#endif
>> +		if (bo->ggtt_node && bo->ggtt_node->ggtt)
>> +			might_lock(&bo->ggtt_node->ggtt->lock);
> 
> Missed this. We can take dma-resv lock too if we get into the TTM code
> upon this put too, right? We should probably add that annotate too.

Yeah, I was also wondering the same thing, but it looks to only be 
trylock in ttm_bo_release(). AFAICT it will only grab the full dma-resv 
lock from a worker, which it does if the lock is contended, or if there 
are unsignalled fences and we need to wait.

> 
> Matt
> 
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
