Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5C1EB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 11:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C383210E126;
	Mon, 19 Jun 2023 11:59:10 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD5B10E126
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687175948; x=1718711948;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6ATqEyp89ggW4aTRln5gAcyXoO613SPCXVGvfiFP9Xw=;
 b=PMV4vsOh/q82WMMTz1nBoUL5STYRaxE1jpgA7RCfU++oEEW9sBYqXbQH
 ZhPF8TJ7mKAoaybv+NuZfQgUowc4adRuNc3p13ZX6x47dAgaFvnKLW5Tv
 muGfFJmMv9CrXskCOw3ZuQXNzjmkDvhIchsVVIdmzrjQDWpHr5XU17has
 +WONioj5mQ7dcUqslWt1vwnvvL5T/WWWK5oOi/cz7on0ffwg9AOxUupv8
 1AmII2VbtoC4AWXrHVG9Q9PlmNdvbahH58wolV6rhEhfQcfm+0Dyrk4TS
 fuse4CgI3fM6ylzF9fgoVx70ngNbzsEjceetqZLD7uniBCo17+4sqpq7J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="349334398"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="349334398"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="837851278"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="837851278"
Received: from yeidelbe-mobl.ger.corp.intel.com (HELO [10.249.254.162])
 ([10.249.254.162])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 04:59:06 -0700
Message-ID: <192ba6c2-694d-2615-4f2a-57cc64ea6c1d@linux.intel.com>
Date: Mon, 19 Jun 2023 13:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
 <20230616095504.17084-5-thomas.hellstrom@linux.intel.com>
 <ZIzH1PtdZ+O5+TTN@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZIzH1PtdZ+O5+TTN@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 4/6] drm/xe/bo: Gracefully handle errors from
 ttm_bo_move_accel_cleanup().
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


On 6/16/23 22:36, Matthew Brost wrote:
> On Fri, Jun 16, 2023 at 11:55:02AM +0200, Thomas Hellström wrote:
>> The function ttm_bo_move_accel_cleanup() attempts to help pipeline a
>> move, and in doing so, needs memory allocations which may fail.
>>
>> Rather than failing in a state where the new resource may freed while
>> accessed by the copy engine, sync uninterruptible and do a failsafe
>> cleanup.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 94dd11066f51..77d5c5710688 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -689,10 +689,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   		if (!move_lacks_source) {
>>   			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
>>   							true, new_mem);
>> -		} else {
>> +			if (ret)
>> +				dma_fence_wait(fence, false);
> Should it be:
> 	if (ret == -ENOMEM)
> 		dma_fence_wait(fence, false);

I think any error code should cause us to sync and reassign the new 
resource, but
also see below.


>
>> +		}
>> +
>> +		if (move_lacks_source || ret) {
> Should it be:
> 		if (move_lacks_source || ret == -ENOMEM) {

Same as above, but indeed we should take care of the error code above 
just after
dma_fence_wait() since dma_resv_add_fence() doesn't bail out early if 
the same fence was already added or if it is signaled.

Will respin,

Thanks,

Thomas


>
> Matt
>
>>   			dma_resv_add_fence(ttm_bo->base.resv, fence,
>>   					   DMA_RESV_USAGE_KERNEL);
>>   			ttm_bo_move_null(ttm_bo, new_mem);
>> +			ret = 0;
>>   		}
>>   
>>   		dma_fence_put(fence);
>> -- 
>> 2.40.1
>>
