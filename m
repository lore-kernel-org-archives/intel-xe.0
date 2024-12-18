Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC906E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 20:53:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F1A10E14A;
	Wed, 18 Dec 2024 20:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EudTL0mB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5E310E14A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 20:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734555224; x=1766091224;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K80ASKqf8uF4zgcikJWS9pCbWiwmHHfK7L+ensY42ww=;
 b=EudTL0mB703Xx9pAq+5gb9on4sMJ0P/y/zM+M8lcbDSs3G3yvubtFrdR
 zqFyc73eClwI0WWO7rdUusoKyNll/zUtFk4p2PaqEY2oUmUEx5JGv85yi
 5qTGAkeYPBtA89g3Y8xjaPEYL89bqhfo9R4lkYY6KZ3Sh5/Rs4AKmOiHW
 q1Z4kwQeKBPg5kKiOPKqX0re6uhaNQ5ttHBX4bFvFgQwlVjvE3aW21hh1
 0x0TrF9ZK86IhxlQ6JPRulGw72ON2DjuCtsbQGGIBL7x6OR+LcePQXi7E
 mlVPd6mREZhyw07ogli2d0+SuUFpA3P1hdzrTNo/bzxQZYz4Fa/zEnsPb w==;
X-CSE-ConnectionGUID: XCiJXwBjThmYcsmOjFhLxg==
X-CSE-MsgGUID: nVz1v5fmRFK/t6Np+HeV4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35080403"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="35080403"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 12:53:43 -0800
X-CSE-ConnectionGUID: Rqe0OWRXRvOPeC7E+XtpSw==
X-CSE-MsgGUID: f7TNSSRgTJOv/jruMrCCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="98530704"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 18 Dec 2024 12:53:42 -0800
Received: from [10.246.0.69] (mwajdecz-MOBL.ger.corp.intel.com [10.246.0.69])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4DFD428794;
 Wed, 18 Dec 2024 20:53:41 +0000 (GMT)
Message-ID: <7141ea96-2eb7-4a7d-86f6-a018475bcb4d@intel.com>
Date: Wed, 18 Dec 2024 21:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] drm/xe/sa: Drop useless is_iomem member
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-5-michal.wajdeczko@intel.com>
 <Z1pUAL6Nh5Jp+3Rd@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Z1pUAL6Nh5Jp+3Rd@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 12.12.2024 04:09, Matthew Brost wrote:
> On Thu, Dec 12, 2024 at 02:01:32AM +0100, Michal Wajdeczko wrote:
>> We can rely on the sa->bo->vmap.is_iomem instead as sa->bo is
>> still available at this moment.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_sa.c       | 3 +--
>>  drivers/gpu/drm/xe/xe_sa_types.h | 1 -
>>  2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
>> index a5e05237b646..b990bd8a49fd 100644
>> --- a/drivers/gpu/drm/xe/xe_sa.c
>> +++ b/drivers/gpu/drm/xe/xe_sa.c
>> @@ -24,7 +24,7 @@ static void sa_bo_manager_fini_bo(void *arg)
>>  {
>>  	struct xe_sa_manager *sa_manager = arg;
>>  
>> -	if (sa_manager->is_iomem)
>> +	if (sa_manager->bo->vmap.is_iomem)
> 
> If we do this anywhere else in the driver (e.g. check bo->vmap.is_iomem)
> then maybe add a BO layer helper for this check. If not, fine with this
> open coded here.

actually there is xe_bo_is_vram() so maybe no need to open code vmap

> 
> Anyways:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

thanks, but without patch 3/13 with additional cleanup at dev removal
time, we can't drop is_iomem since we can't access bo pointer at drm
removal, as bo is already gone

> 
>>  		kvfree(sa_manager->cpu_ptr);
>>  
>>  	sa_manager->cpu_ptr = NULL;
>> @@ -55,7 +55,6 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32
>>  		return ERR_CAST(bo);
>>  	}
>>  	sa_manager->bo = bo;
>> -	sa_manager->is_iomem = bo->vmap.is_iomem;
>>  	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
>>  
>>  	if (bo->vmap.is_iomem) {
>> diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
>> index 2b070ff1292e..2ef896aeca1d 100644
>> --- a/drivers/gpu/drm/xe/xe_sa_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sa_types.h
>> @@ -14,7 +14,6 @@ struct xe_sa_manager {
>>  	struct xe_bo *bo;
>>  	u64 gpu_addr;
>>  	void *cpu_ptr;
>> -	bool is_iomem;
>>  };
>>  
>>  #endif
>> -- 
>> 2.47.1
>>

