Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94187E77180
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 15:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEC410E0A1;
	Tue, 10 Dec 2024 15:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1imzBFH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747DA10E0A1
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733845140; x=1765381140;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Yrb3yG6TmtINv89SjNBJPEwRb5ueiDKtKnTOmw8qKvo=;
 b=b1imzBFHFJ+H8CPg2Yo/e/4MpqTIRVBSqfpp1Pq/jzBD8PP4IR72ietC
 PgoHiFap6J/Lr93MAMIRqLkURVzF87ObnhO+aaPyXayugRxH21mkkMIT6
 L3sDAbEcgWZpK3JW3i4Q+ypuRFQdMLClOy+PkAYeurA9g6AtIKFrlqMQl
 TNuIUrPV9WOmgzjsHgIw1xKXLfMJ/8r+BFcSaooLltmvy+wItoIYBi5Gu
 rk9LLz/o65BUdgioIJYMrU19zhDRLtJcqDSpN3vtvH/Rd5YeMYX2j7DjC
 0dFe4z1SY7MlNFNCh6pQ/rhNKbQyogiDUXnuoaWMcaIBLuh2SqDq4z3uu w==;
X-CSE-ConnectionGUID: mc1VErX9REeYVHjUn2vZNA==
X-CSE-MsgGUID: WSZUAPzpThK8UaaVoxFa1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34077865"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="34077865"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:39:00 -0800
X-CSE-ConnectionGUID: 4/3v7p/ISJKcnZeyTDYSQA==
X-CSE-MsgGUID: +HjiT3xqRLe14PY8Gp1m+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="100506727"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.171])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:38:59 -0800
Date: Tue, 10 Dec 2024 07:38:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, 
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/xe: Wait for migration job before unmapping
 pages
Message-ID: <6vthulgckq2jpfwn2amux5ssijwhxbjp44g2xwp44r626ttrkh@ofwboiylc7eh>
References: <20241205120253.2015537-1-nirmoy.das@intel.com>
 <20241205120253.2015537-2-nirmoy.das@intel.com>
 <5eb91aa3-6d84-47a9-9f07-1742fe723c41@intel.com>
 <695c408b-c077-44c1-9861-0af54148cc86@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <695c408b-c077-44c1-9861-0af54148cc86@linux.intel.com>
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

On Thu, Dec 05, 2024 at 03:33:46PM +0100, Nirmoy Das wrote:
>
>On 12/5/2024 1:40 PM, Matthew Auld wrote:
>> On 05/12/2024 12:02, Nirmoy Das wrote:
>>> There could be still migration job going on while doing
>>> xe_tt_unmap_sg() which could trigger GPU page faults. Fix this by
>>> waiting for the migration job to finish.
>>>
>>> v2: Use intr=false(Matt A)
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3466
>>> Fixes: 75521e8b56e8 ("drm/xe: Perform dma_map when moving system buffer objects to TT")
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.11+
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>
>> Ok, so this is something like ttm_bo_move_to_ghost() doing a pipeline move for tt -> system, but we then do xe_tt_unmap_sg() too early which tears down the IOMMU (if enabled) mappings whilst the job is in progress?
>Yes, this exactly what is happening for this issue.
>>
>> Maybe add some more info to the commit message?
>
>I will add more details.

Are you going to send a new version? Once this is fixed, please also
send a revert MR to the kconfig workaround
3940181b1bad @ gitlab.freedesktop.org/drm/xe/ci.git

Lucas De Marchi

>
>
>> I think this for sure fixes it. Just wondering if it's somehow possible to keep the mapping until the job is done, since all tt -> sys moves are now synced here?
>>
>> Unless Thomas has a better idea here,
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>
>Thanks,
>
>Nirmoy
>
>>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 10 +++++++++-
>>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index b2aa368a23f8..c906a5529db0 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -857,8 +857,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>>     out:
>>>       if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
>>> -        ttm_bo->ttm)
>>> +        ttm_bo->ttm) {
>>> +        long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
>>> +                             DMA_RESV_USAGE_BOOKKEEP,
>>> +                             false,
>>> +                             MAX_SCHEDULE_TIMEOUT);
>>> +        if (timeout < 0)
>>> +            ret = timeout;
>>> +
>>>           xe_tt_unmap_sg(ttm_bo->ttm);
>>> +    }
>>>         return ret;
>>>   }
>>
