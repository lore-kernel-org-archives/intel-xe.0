Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628C8E7716D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 14:33:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E4610EE93;
	Thu,  5 Dec 2024 14:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSTegYIc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B636B10EE93
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733409233; x=1764945233;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LlowRok/dH+1SYmF4Zr4S2WYiD5LJL5jllu745nJqHE=;
 b=hSTegYIcl4LE9/yYawSHiBTMBCTQMG/I5Wf5WlcdA5XQ/ZZAPbZEcBfv
 uLXug32SJa9n7VOA6xoA3Z1zCVT0hJ7pFa/PpEYxNteQpSgCcsjUdnZog
 WJ2Sq0zY5e8qgV5wfvDEoIEkSrFVp5dQ9GcTUS//V3G8GaxuwHi2C5Z2q
 dC22oMu/ex0gJVShSh3jZREoX07qiunFf7hJxPqqzGpIdHd91WxtrqLgw
 JHnGL+ivaY3eZltegySztHg/fcXble76bXuwftz7jnZ+nMyxbeu5C0F0R
 qR2h4w2mTkAV1dNLvnoOaiwu9Tt/JM8cJvagaYgdIDayrwu6ve4f/420m A==;
X-CSE-ConnectionGUID: erbPag+sRfanbOOk2dEAmg==
X-CSE-MsgGUID: 3AZg2yzmSKeTsG3aBokOQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33074221"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33074221"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:33:53 -0800
X-CSE-ConnectionGUID: WOBwx1NmQ2G8jdMp50fhZQ==
X-CSE-MsgGUID: MxlQjevzT8m/y1qXblwauQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="93978287"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.163.217])
 ([10.245.163.217])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:33:51 -0800
Message-ID: <695c408b-c077-44c1-9861-0af54148cc86@linux.intel.com>
Date: Thu, 5 Dec 2024 15:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Wait for migration job before unmapping
 pages
To: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org
References: <20241205120253.2015537-1-nirmoy.das@intel.com>
 <20241205120253.2015537-2-nirmoy.das@intel.com>
 <5eb91aa3-6d84-47a9-9f07-1742fe723c41@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <5eb91aa3-6d84-47a9-9f07-1742fe723c41@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 12/5/2024 1:40 PM, Matthew Auld wrote:
> On 05/12/2024 12:02, Nirmoy Das wrote:
>> There could be still migration job going on while doing
>> xe_tt_unmap_sg() which could trigger GPU page faults. Fix this by
>> waiting for the migration job to finish.
>>
>> v2: Use intr=false(Matt A)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466
>> Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system buffer objects to TT")
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.11+
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
> Ok, so this is something like ttm_bo_move_to_ghost() doing a pipeline move for tt -> system, but we then do xe_tt_unmap_sg() too early which tears down the IOMMU (if enabled) mappings whilst the job is in progress?
Yes, this exactly what is happening for this issue.
>
> Maybe add some more info to the commit message? 

I will add more details.


> I think this for sure fixes it. Just wondering if it's somehow possible to keep the mapping until the job is done, since all tt -> sys moves are now synced here?
>
> Unless Thomas has a better idea here,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>


Thanks,

Nirmoy

>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index b2aa368a23f8..c906a5529db0 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -857,8 +857,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>     out:
>>       if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
>> -        ttm_bo->ttm)
>> +        ttm_bo->ttm) {
>> +        long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
>> +                             DMA_RESV_USAGE_BOOKKEEP,
>> +                             false,
>> +                             MAX_SCHEDULE_TIMEOUT);
>> +        if (timeout < 0)
>> +            ret = timeout;
>> +
>>           xe_tt_unmap_sg(ttm_bo->ttm);
>> +    }
>>         return ret;
>>   }
>
