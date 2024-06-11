Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B20C27C75
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 21:14:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7214810E0DE;
	Tue, 11 Jun 2024 21:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0GE9eRr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003D810E0DE
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 21:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718140493; x=1749676493;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u6ggmhHQubUwp1RDC2N/2i61YBQZF88h5atR2Y/NYYE=;
 b=a0GE9eRrjEv9SM0ZGnC4ZQy4Zh3TefwOcSC35ZvuhTNnPMvVD/8D63s8
 ljZlCAlhSGDf6GXkxIweDw3jxhhIkCSXG5i7WxMH49Fhu7t2mylDgrSiu
 7SrYnGp1z55sGmIUfncRNl6tikO6eHt6iqDRes94IPIIAm/+TZykm9HeW
 C664T+CZhrCtUcaBmQ3XRx0HFH+c41zq0fimWFsBKNfV4OI4A5KCgNwxR
 wQpoj5uSvgplQNoQw1Bz2SuU45dwbghQGrrzfyjkeycdCmr6vO7Rgd9qN
 eCTzpEQFymTMuc7MEUYQk789qmKNfB7drahBSk2jWpB+V8i/OBdcgTqBy g==;
X-CSE-ConnectionGUID: yiv5xpv1TiCiGI5AGYn86g==
X-CSE-MsgGUID: NCqUxwAaTzy48jw6aPOf5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15006324"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="15006324"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 14:14:52 -0700
X-CSE-ConnectionGUID: v/9y19SvQcuNdzF/7ltVFw==
X-CSE-MsgGUID: Oht8lS51RYKUOY49Plne2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="77025704"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa001.jf.intel.com with ESMTP; 11 Jun 2024 14:14:51 -0700
Received: from [10.94.248.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C23AB33BF0;
 Tue, 11 Jun 2024 22:14:36 +0100 (IST)
Message-ID: <67ea0d7a-1383-46eb-84fe-eb6140063842@intel.com>
Date: Tue, 11 Jun 2024 23:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/guc: Avoid named enum types in GuC KLV ABI
To: John Harrison <john.c.harrison@intel.com>, intel-xe@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>
References: <20240611180735.1988-1-michal.wajdeczko@intel.com>
 <20240611180735.1988-5-michal.wajdeczko@intel.com>
 <ff5024c2-a973-4a04-a41f-d0197ea74561@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ff5024c2-a973-4a04-a41f-d0197ea74561@intel.com>
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



On 11.06.2024 22:16, John Harrison wrote:
> On 6/11/2024 11:07, Michal Wajdeczko wrote:
>> The xe_guc_klv_ids name just for workaround keys is too generic,
> So rename it to xe_guc_wa_klv_ids?

but the idea is to make GuC ABI headers shareable between i915 and xe,
see [1], thus having driver specific prefix in the enum is not desired

what about guc_wa_klv_keys (as we have KEY not ID in the KLV)

[1] https://patchwork.freedesktop.org/series/134722/

> 
>> as workaround keys are not the only keys used by the GuC firmware.
>> Other KLVs keys are defined as plain defines or anonymous enums.
> Just because other instances are done badly doesn't mean we should break
> the good one to match.

all these are ABI definitions so IMO there is nothing wrong with using
plain defines for values expected at the binary interface

also using defines allows to have similarly named related definitions
that we could all place together (like KEY and LEN for each KLV), which
would be hard to achieve if we will have separate enums for those

> Having a named type gives you an extra level of compiler type checks
> that you don't get with a u16.

fine, but at the end you need to convert to u16 anyway

and hopefully there will be no clash when those WA keys will be used
where we use another named enum for KLV keys

> 
> John.
> 
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 2 +-
>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index a0b80c9fc5ef..831a2b57f308 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -346,7 +346,7 @@ enum {
>>   /*
>>    * Workaround keys:
>>    */
>> -enum xe_guc_klv_ids {
>> +enum {
>>      
>> GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED                =
>> 0x9002,
>>       GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING               
>> = 0x9005,
>>      
>> GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE               
>> = 0x9007,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 1c60b685dbc6..a3de00e92b4e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -285,7 +285,7 @@ static size_t calculate_golden_lrc_size(struct
>> xe_guc_ads *ads)
>>   }
>>     static void guc_waklv_enable_one_word(struct xe_guc_ads *ads,
>> -                      enum xe_guc_klv_ids klv_id,
>> +                      u16 klv_id,
>>                         u32 value,
>>                         u32 *offset, u32 *remain)
>>   {
>> @@ -312,7 +312,7 @@ static void guc_waklv_enable_one_word(struct
>> xe_guc_ads *ads,
>>   }
>>     static void guc_waklv_enable_simple(struct xe_guc_ads *ads,
>> -                    enum xe_guc_klv_ids klv_id, u32 *offset, u32
>> *remain)
>> +                    u16 klv_id, u32 *offset, u32 *remain)
>>   {
>>       u32 klv_entry[] = {
>>           /* 16:16 key/length */
> 
