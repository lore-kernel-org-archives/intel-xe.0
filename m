Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BE8C48297
	for <intel-xe@archiver.kernel.org>; Fri,  9 Feb 2024 09:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D9E10EE00;
	Fri,  9 Feb 2024 09:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZKYvTGI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1646210EE00
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Feb 2024 09:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707472460; x=1739008460;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lrHewAwK7CuQIJ6dFW2uoFm02wHbdaKq9qRHXXahWxQ=;
 b=BZKYvTGI988LlNauWiQXnwPmQTNWNnT134qjz/jvdGNjn/hVXx7OtrpD
 2IjI3cupTGUg4jX1ATu7CKR3mbSQyhG+r/mSgEFqQQ2QUhZ4wh80XP7Nb
 nJI4bxp5lpOwCsjz5StgCn1ff+/2M1gYoTPxD7Jz8PwlOgCwRAk8K1iIX
 ZeF3v4FCIEGZ01ZhXxsnorr1E1i9MA7nB3VwCDdlFMLddIq9IOXWy2Uij
 V8IUawxvJyREoLYYsrWmEvkAmzYH1ZROuoGOXtjbknpRvNiZNUbzDIEcT
 ZBKtNZK03AhdPNarzIIRNci2Syy0DiT/9k3G3GVhdkJjKwajr949pxXNL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1256185"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1256185"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 01:54:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6548437"
Received: from vdegtyar-mobl1.ger.corp.intel.com (HELO [10.252.20.246])
 ([10.252.20.246])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 01:54:18 -0800
Message-ID: <bfad7b8e-fc66-4724-a28e-3798c4fa860b@intel.com>
Date: Fri, 9 Feb 2024 09:54:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: fix i915_gem_object_is_shmem() wrapper
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240205153110.38340-2-matthew.auld@intel.com>
 <SN7PR11MB67500DE40555B0DC3825C781E34B2@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <SN7PR11MB67500DE40555B0DC3825C781E34B2@SN7PR11MB6750.namprd11.prod.outlook.com>
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

On 09/02/2024 08:39, Kandpal, Suraj wrote:
>> Subject: [PATCH] drm/xe/display: fix i915_gem_object_is_shmem() wrapper
>>
>> shmem ensures the memory is cleared on allocation, however here we are
>> using TTM, which doesn't natively support shmem (other than for swap), but
>> instead just allocates normal system memory. And we only zero such memory
>> for userspace allocations. In the case of intel_fbdev we are missing the
>> memset_io().
>>
> 
> LGTM
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

Thanks. Going to push with Fixes: 44e694958b95 ("drm/xe/display: 
Implement display support"), since this appears to fix display 
corruption seen with fbdev.

> 
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/compat-i915-
>> headers/gem/i915_gem_object.h b/drivers/gpu/drm/xe/compat-i915-
>> headers/gem/i915_gem_object.h
>> index 68d9f6116bdf..777c20ceabab 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h
>> @@ -10,7 +10,7 @@
>>
>>   #include "xe_bo.h"
>>
>> -#define i915_gem_object_is_shmem(obj) ((obj)->flags &
>> XE_BO_CREATE_SYSTEM_BIT)
>> +#define i915_gem_object_is_shmem(obj) (0) /* We don't use shmem */
>>
>>   static inline dma_addr_t i915_gem_object_get_dma_address(const struct
>> xe_bo *bo, pgoff_t n)  {
>> --
>> 2.43.0
> 
