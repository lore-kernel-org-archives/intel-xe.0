Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5F3C54750
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 08:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D8110E168;
	Wed, 28 Aug 2024 08:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuWVnZ1P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0078210E168
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724834171; x=1756370171;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3S9dB8g/9CfQ0ovoqmRnTnbbmHInJJRyMpsTEfzARrg=;
 b=SuWVnZ1PaYqwkdTPgBJXqCnx1cV8hvr1Xr8k6HV3aZSv+HXEqKoaIJxN
 vrKw88SntHU/jpCANAHLWBDPGwp1scLZEk+zUb5jss8NF5ERxeNGzOkgt
 Zr9JrKUHpajT/LZli1KIE0CFaLNvqGJrU/lPLHhdGqbuCff6jOPzSfEB2
 5uF+3aj0cSM4O8W14moEaCFao77Q/zdmU0cAemsjTw+JbkKLRmft5R3sC
 eWXWWrsCeSj2jn5kq/CKWMjqsLdAat+Um0Wd/XYaFYVJPZeP1Qd+/prlb
 LTtUFmmoeBSa2aeEVSKRZCCyI2pLbq0FMBotWYpMUlI+q+FgxestY2nNb g==;
X-CSE-ConnectionGUID: 8Nzvmb/WRe2PdSE62YUFvA==
X-CSE-MsgGUID: 1c5mVIoYSUCaZhpCmJOH4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23512118"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="23512118"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:36:11 -0700
X-CSE-ConnectionGUID: GmPAn6fdQrqCvu9dDleQpA==
X-CSE-MsgGUID: tuIKFkKERr6zAGDy9TaeRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63193547"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.188])
 ([10.245.244.188])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:36:09 -0700
Message-ID: <3cf2381e-821a-4229-af06-c38a1d6d3435@linux.intel.com>
Date: Wed, 28 Aug 2024 10:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Skip CCS clear for WB type BOs
To: Nirmoy Das <nirmoy.das@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240827154910.24841-1-nirmoy.das@intel.com>
 <757264cd5bd81ed416ad87cc31657ac6e35d5345.camel@linux.intel.com>
 <2fbd6036-b010-4fa3-8365-be193ea52008@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <2fbd6036-b010-4fa3-8365-be193ea52008@intel.com>
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

Hey,

Den 2024-08-28 kl. 10:34, skrev Nirmoy Das:
> 
> On 8/28/2024 10:23 AM, Thomas Hellström wrote:
>> Hi,
>>
>> On Tue, 2024-08-27 at 17:49 +0200, Nirmoy Das wrote:
>>> HW treats any access to 1-way or 2-way coherent memory as compression
>>> disabled memory. So for such BOs there is no need to do CCS clearing.
>>>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index cbe7bf098970..24701272e3af 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -283,6 +283,7 @@ struct xe_ttm_tt {
>>>       struct device *dev;
>>>       struct sg_table sgt;
>>>       struct sg_table *sg;
>>> +    bool skip_ccs_clear:1;
>>>   };
>>>     static int xe_tt_map_sg(struct ttm_tt *tt)
>>> @@ -404,6 +405,8 @@ static struct ttm_tt *xe_ttm_tt_create(struct
>>> ttm_buffer_object *ttm_bo,
>>>       if (ttm_bo->type == ttm_bo_type_device && xe-
>>>> mem.gpu_page_clear_sys)
>>>           page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>>>   +    /* compression is not allowed for cached BO so ccs clear can
>>> be skipped. */
>>> +    tt->skip_ccs_clear = caching == ttm_cached;
>> In theory, BOs that are promoted to fb (not created with the SCANOUT
>> flag) can AFAICT have caching remaining at ttm_cached, yet still sent
>> to the display engine, reading uninitialized ccs.
>>
>> Also I think LNL will be the only HW having the "feature" that clean
>> cache-lines are written back so in the future we might allow 0-coherent
>> with ttm_cached.
> 
> 
> I Just read that no compression for 1,2-way coherent is only for LNL In seems so this is mainly applicable for LNL.
> 
> 
>>
>> So IMO we need to improve the detection of "skip_ccs_clear" here.
> 
> 
> How do I detect when a BO is promoted to FB ?
Either check if scanout flag is set, or just unset that flag in pin_fb. :)

Cheers,
~Maarten
