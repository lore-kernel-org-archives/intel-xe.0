Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FEAC25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 06:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E4210E29C;
	Fri, 31 May 2024 06:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fR/d4hek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C23D10EA7B
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 06:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717138035; x=1748674035;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=U6MlmJoBiq36FOLEoxbmxESOi6itvX73wds71jkx6Hg=;
 b=fR/d4hekExA45BkCOSu/h0YtK/Koy6s76ZioRY34+cAu63eOTgAmGPwo
 vWyVz4vNrzwq7HojL3ayxSzwRJ+1QH2qLiM0XKoc+tldauRLuPb0wYoHs
 462ZMjeKw0B7O1zPt1vT11rjsxld/fYkYyHXnWlpQ5aqmd9521myFFTAu
 EFV6qouZ/VbPjYGRxj1+nhSl3jUcys7Nh2huaRSnQ9dp+Cwx+jOlY9qYB
 h3xjmqIOWjo/pq6qYN1tiduizi/EFZf/KykrIuNSACBFd+clPpK5BSHFO
 V8RKUujZWHPO77QqtZwEN1c05LmXaltQH9J/i6BGgswEF59/UX/unggjj w==;
X-CSE-ConnectionGUID: LHbvwqZDQUSi5yk9mfe/yA==
X-CSE-MsgGUID: M2ngNvnbQ9KuR9/OK090GA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17497749"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="17497749"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 23:47:15 -0700
X-CSE-ConnectionGUID: gWGYN87mS9GpW4rVLHuOyA==
X-CSE-MsgGUID: zCaMJH4jTjuhtvFNlKNMYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36145455"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 30 May 2024 23:47:12 -0700
Received: from [10.94.248.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8B8D8125AB;
 Fri, 31 May 2024 07:47:09 +0100 (IST)
Message-ID: <054523a8-bbe1-480a-ad07-4a4693ab9493@intel.com>
Date: Fri, 31 May 2024 08:47:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add kernel-doc to some xe_lrc interfaces
To: Matthew Brost <matthew.brost@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240530181100.18188-1-niranjana.vishwanathapura@intel.com>
 <ZlllMXXx6s6ADWBi@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZlllMXXx6s6ADWBi@DUT025-TGLU.fm.intel.com>
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



On 31.05.2024 07:50, Matthew Brost wrote:
> On Thu, May 30, 2024 at 11:11:00AM -0700, Niranjana Vishwanathapura wrote:
>> Add kernel-doc to xe_lrc_create/destroy and xe_lrc_get/put
>> interfaces.
>>
>> Fixes: 264eecdba211 ("drm/xe: Decouple xe_exec_queue and xe_lrc")
> 
> I missed kernel doc in initial review too.
> 
> I don't think you need a fixes tag though.
> 
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_lrc.c | 18 ++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_lrc.h | 13 +++++++++++++
>>  2 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index 26922e1bac82..215a1c27665d 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -945,6 +945,17 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>  	return err;
>>  }
>>  
>> +/**
>> + * xe_lrc_create - Create a LRC
>> + * @hwe: Hardware Engine
>> + * @vm: The VM (address space)
>> + * @ring_size: LRC ring size
>> + *
>> + * Allocate and initialize the Logical Ring Context (LRC).
>> + *
>> + * Return pointer to created LRC upon success. Return -ve error code
> 
> -ve? Typo?

I guess it supposed to be a shortcut for "negative" but it is still
wrong as it should rather say "Return error pointer on failure" as
function is not returning an 'int'

> 
> With typo fixed and dropping fixes tag:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
>> + * upon failure.
>> + */
>>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>>  			     u32 ring_size)
>>  {
>> @@ -964,6 +975,13 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>>  	return lrc;
>>  }
>>  
>> +/**
>> + * xe_lrc_destroy - Destroy the LRC
>> + * @ref: reference to LRC
>> + *
>> + * Called when ref == 0, release resources held by the Logical Ring Context
>> + * (LRC) and free the LRC memory.
>> + */
>>  void xe_lrc_destroy(struct kref *ref)
>>  {
>>  	struct xe_lrc *lrc = container_of(ref, struct xe_lrc, refcount);
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index ebe0e362e434..882c3437ba5c 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -26,12 +26,25 @@ struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>>  			     u32 ring_size);
>>  void xe_lrc_destroy(struct kref *ref);
>>  
>> +/**
>> + * xe_lrc_get - Get reference to the LRC
>> + * @lrc: Logical Ring Context
>> + *
>> + * Increment reference count of @lrc
>> + */
>>  static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
>>  {
>>  	kref_get(&lrc->refcount);
>>  	return lrc;
>>  }
>>  
>> +/**
>> + * xe_lrc_put - Put reference of the LRC
>> + * @lrc: Logical Ring Context
>> + *
>> + * Decrement reference count of @lrc, call xe_lrc_destroy when
>> + * reference count reaches 0.
>> + */
>>  static inline void xe_lrc_put(struct xe_lrc *lrc)
>>  {
>>  	kref_put(&lrc->refcount, xe_lrc_destroy);
>> -- 
>> 2.43.0
>>
