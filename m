Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFC4C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 18:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0092C10E5D9;
	Wed, 12 Jun 2024 18:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WiK59EfS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABB710E5D9
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 18:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718215414; x=1749751414;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Rh4zUGFDBKWeZzhM4AQxSXzaWJpXn1pSVTAAP46Eh3Y=;
 b=WiK59EfSn5AHojaa+urPoaGkyrXdjJ/TyFKMsF0Tg3QPTZhVBO1l8xRS
 WMbOUNrdgE5ng1D8OeWaHUeaR3eOQWXWUIO7zsPs/MUO06prccvbfFgx1
 kR2NtQDXl2akcxg2MbW3lls5mEiX1lqnMIDWYzUcRDShOxbf00jl1ssm6
 3/diKw8dlMZRmQA0ekOTis4xK8B7mSA0+OvxNT51QG7GK8gnWhPb74rKx
 Rl4/tI8JK6TDVfhfiuSwxC3ikoWy0dJF1/q4otiHwizkUsEcajEOXtEdc
 bm2oXN1WN1Oxg68EnxU71fX6h1T69HIjGaGkCK/ppnfn0zGYAbK6dstOU g==;
X-CSE-ConnectionGUID: bxSOS+9zQhOBYtjbkZ3kCQ==
X-CSE-MsgGUID: sZpI7GbuQgS2QJUbca/W/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25579432"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="25579432"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 11:03:33 -0700
X-CSE-ConnectionGUID: 23UqWBEHQtyxCLFxhTPa0Q==
X-CSE-MsgGUID: DKHRF+BnRnK97jgkKx92Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40345088"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa006.jf.intel.com with ESMTP; 12 Jun 2024 11:03:31 -0700
Received: from [10.245.119.62] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 54E1328198;
 Wed, 12 Jun 2024 19:03:25 +0100 (IST)
Message-ID: <1b002473-552a-4392-b2b4-b0bdff61c59c@intel.com>
Date: Wed, 12 Jun 2024 20:03:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
References: <20240606195630.1548-1-michal.wajdeczko@intel.com>
 <3dd4733f3cc7f322f25354c3e9d4a2dd363d2331.camel@linux.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <3dd4733f3cc7f322f25354c3e9d4a2dd363d2331.camel@linux.intel.com>
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

Hi Thomas,

On 11.06.2024 14:47, Thomas Hellström wrote:
> Hi, Michal,
> 
> On Thu, 2024-06-06 at 21:56 +0200, Michal Wajdeczko wrote:
>> We should honor requested uncached mode also at the TTM layer.
>> Otherwise, we risk losing updates to the memory based interrupts
>> source or status vectors, as those require uncached memory.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 2bae01ce4e5b..2573cc118f29 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -378,6 +378,9 @@ static struct ttm_tt *xe_ttm_tt_create(struct
>> ttm_buffer_object *ttm_bo,
>>  	    (xe->info.graphics_verx100 >= 1270 && bo->flags &
>> XE_BO_FLAG_PAGETABLE))
>>  		caching = ttm_write_combined;
>>  
>> +	if (bo->flags & XE_BO_FLAG_NEEDS_UC)
>> +		caching = ttm_uncached;
>> +
>>  	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
>> extra_pages);
>>  	if (err) {
>>  		kfree(tt);
> 
> To me the preferred method is to teach bo->cpu_caching about the
> uncached mode and then include it in the switch statement above.
> 

but bo->cpu_caching is currently documented as:

/**
 * @cpu_caching: CPU caching mode. Currently only used for userspace
 * objects.
 */

and value 0 is implicitly reserved as kind of default, so 'teaching'
would likely mean either extending uapi with something like:

  #define DRM_XE_GEM_CPU_CACHING_WB                      1
  #define DRM_XE_GEM_CPU_CACHING_WC                      2
+ #define DRM_XE_GEM_CPU_CACHING_UC                      3

which will introduce lot of undesired right now code changes, or we will
introduce internal only flag:

+ #define XE_CPU_CACHING_UC                      ((u16)~0)

but that doesn't look like a clean solution.


OTOH, just above this new diff chunk, there is already a code that
updates caching mode outside the "switch statement above":

	if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
	    (xe->info.graphics_verx100 >= 1270 &&
	     bo->flags & XE_BO_FLAG_PAGETABLE))
		caching = ttm_write_combined;

so maybe as a short term solution we can keep this patch as it's doing
similar last resort stuff and return to 'preferred way' later:

	if (!bo->cpu_caching && bo->flags & XE_BO_FLAG_NEEDS_UC)
		caching = ttm_uncached;

Michal
