Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1CB606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eOJKIvxo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E7710E400;
	Thu, 22 Oct 2026 10:39:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84AC10E400
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 10:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792665554; x=1824201554;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0HBS3ROxyiLuYg5DopCHvWnf6hIayuPEMq2LZ6XQeWU=;
 b=eOJKIvxoxqooSt4GSA7sKBb4Llmt7a6WEMAgkmEHUezYpuPVCTUDQkS4
 Nvm3SviUSZTMFxSWs8tz6eHfnUNNs9T+z9KmRuDpiQ5C4dEQkN4d/3h7F
 ByiFoY/I3Sl3hnKwTK2hOGxb4moPT2AIgo2uiTH9I4hQjrB38B0+/YV0i
 2uAadJPPx7GxpeblsWFPeCHP/ykC6ghzC3nl55JzjrI2Dilf8+hDKoodQ
 dKmuFM98UI+e7XhcVcCn3tJzO2F8tuV+gATU9KIEGp/MrGz0qBRO6ikXz
 cy1jg7N6fEaoiD9nFr7+6p5/PUxvQtvmX0F/FTD6+7HQJ7E5pWboFbjpi Q==;
X-CSE-ConnectionGUID: xfTwNtdITV2mSBPxdaYZGA==
X-CSE-MsgGUID: 9/aImn3+SKOdJ0vyoX5gTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1310581"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1310581"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 03:39:13 -0700
X-CSE-ConnectionGUID: O+rtXN3MSl+M4wPaX1QUGw==
X-CSE-MsgGUID: kjue5AWaS52tLQuqDsLHVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3211225"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.245.243])
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 03:39:13 -0700
Message-ID: <1d3b59b9-fe5a-427d-af24-6777e45f4849@intel.com>
Date: Thu, 22 Oct 2026 11:39:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/pat: always check is_valid() when querying
 an index
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
References: <20261015154553.483229-5-matthew.auld@intel.com>
 <20261015154553.483229-8-matthew.auld@intel.com>
 <DS0PR11MB87185E444C2C6085230F750681652@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DS0PR11MB87185E444C2C6085230F750681652@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 08:02, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: 15 October 2026 21:16
>> To: intel-xe@lists.freedesktop.org
>> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Upadhyay,
>> Tejas <tejas.upadhyay@intel.com>
>> Subject: [PATCH v2 3/3] drm/xe/pat: always check is_valid() when querying an
>> index
>>
>> Make the bevaviour consistent. If trying to extract comp or l3 on an unknown
>> index, just treat as a programmer error, like we already do for coh_mode
>> (implicit).
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pat.c | 6 +++---
>>   drivers/gpu/drm/xe/xe_pat.h | 3 ++-
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c index
>> d239693b803b..1189d7255c12 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -303,7 +303,7 @@ bool xe_pat_index_is_valid(struct xe_device *xe, u16
>> pat_index)
>>
>>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)  {
>> -	WARN_ON(pat_index >= xe->pat.n_entries);
>> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
> 
> Multiple WARN_ON!
> Should we change API:
> bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index)
> {
>      if (WARN_ON(pat_index >= xe->pat.n_entries))
>          return false;
>      return xe->pat.table[pat_index].valid;
> }

Yeah, good point.

> 
> Tejas
> 
>>   	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
>>   		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
>>   	return xe->pat.table[pat_index].coh_mode;
>> @@ -311,13 +311,13 @@ u16 xe_pat_index_get_coh_mode(struct xe_device
>> *xe, u16 pat_index)
>>
>>   bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)  {
>> -	WARN_ON(pat_index >= xe->pat.n_entries);
>> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
>>   	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);  }
>>
>>   u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)  {
>> -	WARN_ON(pat_index >= xe->pat.n_entries);
>> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
>>
>>   	return REG_FIELD_GET(XE2_L3_POLICY, xe-
>>> pat.table[pat_index].value);  } diff --git a/drivers/gpu/drm/xe/xe_pat.h
>> b/drivers/gpu/drm/xe/xe_pat.h index f6b0fac2000a..de4d57ef9a4e 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -75,7 +75,7 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe,
>> u16 pat_index);
>>
>>   /**
>>    * xe_pat_index_get_comp_en - Extract the compression enable flag for
>> - * the given pat_index.
>> + * the given pat_index. Index must be valid for the hw.
>>    * @xe: xe device
>>    * @pat_index: The pat_index to query
>>    *
>> @@ -88,6 +88,7 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe,
>> u16 pat_index);
>>   #define XE_L3_POLICY_UC		3 /* Uncached */
>>   /**
>>    * xe_pat_index_get_l3_policy - Extract the L3 policy for the given pat_index.
>> + * Index must be valid for the hw.
>>    * @xe: xe device
>>    * @pat_index: The pat_index to query
>>    */
>> --
>> 2.56.0
> 

