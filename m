Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6F0E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 15:59:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050EE10E3B4;
	Tue, 10 Dec 2024 15:59:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOSg0HQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFD310E3B4
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 15:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733846375; x=1765382375;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5pjft/W20eUX8JrsDVRJH6EKsIldtGO+hAWKlGzM3pY=;
 b=cOSg0HQ8lTEkq7eyganG2wNAutE1Jo+pAg8uxg3wfe/AhnOIMc/XmVD7
 tffcJiV2LFC1VL449UaDz1P1nbVhw46DDI8ViWibdOxvDFcgFQxvdsnL9
 KoRLEKv/6t5ns1NGPg1YxUpbf1epWTZ9tLrNhUVSoN8oTy5gTiHr0e0dH
 21t+NQQFXFj5d1aEBUCaGymPrCFif0FepUF8W2Jj8jwCPwRLTh6/9nwqb
 rHLfMkEKASbQXdxNzVz6091lYwi0KwJtfSMGSxjSiclnm+0IosfygLL11
 byZF8lR7Cyl0iqO/gSlSePdTONiNRsL5isMoNLAXjgPopwNoZWqqdgB4o w==;
X-CSE-ConnectionGUID: 9czvG9JURGmydlS8qQ2spw==
X-CSE-MsgGUID: 3Z14JWlmTrGPu6H8NKJkrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="51723026"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="51723026"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:59:35 -0800
X-CSE-ConnectionGUID: phBmM0BcQ3OPLrqhoHTywQ==
X-CSE-MsgGUID: DxftFuYYTbKvD2AFdM8+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="100408566"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.15])
 ([10.245.192.15])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:59:33 -0800
Message-ID: <e9d7a359-2c38-4dab-a56e-b406198cf033@linux.intel.com>
Date: Tue, 10 Dec 2024 16:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Wait for migration job before unmapping
 pages
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, Nirmoy Das <nirmoy.das@intel.com>, 
 intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
References: <20241205120253.2015537-1-nirmoy.das@intel.com>
 <20241205120253.2015537-2-nirmoy.das@intel.com>
 <5eb91aa3-6d84-47a9-9f07-1742fe723c41@intel.com>
 <695c408b-c077-44c1-9861-0af54148cc86@linux.intel.com>
 <6vthulgckq2jpfwn2amux5ssijwhxbjp44g2xwp44r626ttrkh@ofwboiylc7eh>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <6vthulgckq2jpfwn2amux5ssijwhxbjp44g2xwp44r626ttrkh@ofwboiylc7eh>
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


On 12/10/2024 4:38 PM, Lucas De Marchi wrote:
> On Thu, Dec 05, 2024 at 03:33:46PM +0100, Nirmoy Das wrote:
>>
>> On 12/5/2024 1:40 PM, Matthew Auld wrote:
>>> On 05/12/2024 12:02, Nirmoy Das wrote:
>>>> There could be still migration job going on while doing
>>>> xe_tt_unmap_sg() which could trigger GPU page faults. Fix this by
>>>> waiting for the migration job to finish.
>>>>
>>>> v2: Use intr=false(Matt A)
>>>>
>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466
>>>> Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system buffer objects to TT")
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: <stable@vger.kernel.org> # v6.11+
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>
>>> Ok, so this is something like ttm_bo_move_to_ghost() doing a pipeline move for tt -> system, but we then do xe_tt_unmap_sg() too early which tears down the IOMMU (if enabled) mappings whilst the job is in progress?
>> Yes, this exactly what is happening for this issue.
>>>
>>> Maybe add some more info to the commit message?
>>
>> I will add more details.
>
> Are you going to send a new version?

Was waiting for more reviews. Sent  out v3 with updated commit message.


> Once this is fixed, please also
> send a revert MR to the kconfig workaround
> 3940181b1bad @ gitlab.freedesktop.org/drm/xe/ci.git

I will do that.


Thanks,

Nirmoy

>
> Lucas De Marchi
>
>>
>>
>>> I think this for sure fixes it. Just wondering if it's somehow possible to keep the mapping until the job is done, since all tt -> sys moves are now synced here?
>>>
>>> Unless Thomas has a better idea here,
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
>>
>> Thanks,
>>
>> Nirmoy
>>
>>>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
>>>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index b2aa368a23f8..c906a5529db0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -857,8 +857,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>>>     out:
>>>>       if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
>>>> -        ttm_bo->ttm)
>>>> +        ttm_bo->ttm) {
>>>> +        long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
>>>> +                             DMA_RESV_USAGE_BOOKKEEP,
>>>> +                             false,
>>>> +                             MAX_SCHEDULE_TIMEOUT);
>>>> +        if (timeout < 0)
>>>> +            ret = timeout;
>>>> +
>>>>           xe_tt_unmap_sg(ttm_bo->ttm);
>>>> +    }
>>>>         return ret;
>>>>   }
>>>
