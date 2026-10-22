Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F6C60A5BE3
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 13:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZOoCsIa8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E587112649;
	Thu, 22 Oct 2026 13:47:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1AE112664
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792676816; x=1824212816;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yV8XX6WhGMGFh7n+OvetCW7+8G2xuBfQDMt2XGpPdro=;
 b=ZOoCsIa8gcBl4n3x1bmH8780cLWf/ShxHbrZMgXDdn1qQDQNIhI6/Ppb
 +50EuzlCGXJYo7TipzEy/Gv9Qh1tGs/KH7MS38+G2qFs8TPUj9yUwQZX9
 /Ak1FXEQvgC14Y8ZPQg9cgImxM/l85Ypa2ZKcYqGxhShMZg71L65ufOpk
 suXz1Yq3O8y86xSNuGVTijRbrlnzezAXwIp1yURFEFAKK71Ng2gfvDdPc
 mtuvHRUAVOcXPbvdfZTlurLmCq7f94Fo++3fW7WDdWpfNlA8KqYbOvFwe
 siauH/ZJXCpRlZdpCy/9kBhGZ9ZB0hzGadomlxm5/OCZBvpqztXFNOPME Q==;
X-CSE-ConnectionGUID: l5Btp6YKTWWN4I1RiFoGxg==
X-CSE-MsgGUID: ptETapyNR42m1EJQ3MShfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1315255"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1315255"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:46:55 -0700
X-CSE-ConnectionGUID: 3rSzR0j1Qb60dKGq2L4uQg==
X-CSE-MsgGUID: ELvI7/4BSvywJ+KLnBVAmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3297887"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.245.243])
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 06:46:54 -0700
Message-ID: <3afd42cd-d251-4bb3-9925-06078f35306c@intel.com>
Date: Thu, 22 Oct 2026 14:46:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe/pat: always check is_valid() when querying
 an index
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
References: <20261022120915.138606-5-matthew.auld@intel.com>
 <20261022120915.138606-8-matthew.auld@intel.com>
 <DS0PR11MB871825975B301935CD33606381652@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DS0PR11MB871825975B301935CD33606381652@DS0PR11MB8718.namprd11.prod.outlook.com>
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

On 22/10/2026 13:41, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: 22 October 2026 17:39
>> To: intel-xe@lists.freedesktop.org
>> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Upadhyay,
>> Tejas <tejas.upadhyay@intel.com>
>> Subject: [PATCH v3 3/3] drm/xe/pat: always check is_valid() when querying an
>> index
>>
>> Make the bevaviour consistent. If trying to extract comp or l3 on an unknown
>> index, just treat as a programmer error, like we already do for coh_mode
>> (implicit).
>>
>> v2 (Tejas):
>>    - Make is_valid() return false for an index which is out of range, to
>>      avoid multiple WARNs.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pat.c | 10 ++++++----  drivers/gpu/drm/xe/xe_pat.h
>> |  6 ++++--
>>   2 files changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c index
>> d239693b803b..53c5f4030bf8 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -297,13 +297,15 @@ static const struct xe_pat_table_entry
>> xe3p_lpg_pat_table[] = {
>>
>>   bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index)  {
>> -	WARN_ON(pat_index >= xe->pat.n_entries);
>> +	if (WARN_ON(pat_index >= xe->pat.n_entries))
>> +		return false;
>> +
>>   	return xe->pat.table[pat_index].valid;  }
>>
>>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)  {
>> -	WARN_ON(pat_index >= xe->pat.n_entries);
>> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
> 
> With that we need something like below right or else still we will have 2 warns for same check, let me know your view :

I'm not really fan tbh. It's a basically just a BUG_ON() level event if 
we get here and not something we should see in production. Trying to 
then add fallbacks might not be helping much (also no test coverage).

> u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
> {
>      if (!xe_pat_index_is_valid(xe, pat_index))
>          return XE_COH_NONE;
> 
>      WARN_ON(!xe->pat.table[pat_index].coh_mode ||
>          xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
>      return xe->pat.table[pat_index].coh_mode;
> }
> 
> bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
> {
>      if (!xe_pat_index_is_valid(xe, pat_index))
>          return false;
> 
>      return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
> }
> 
> u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
> {
>      if (!xe_pat_index_is_valid(xe, pat_index))
>          return XE_L3_POLICY_UC;
> 
>      return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
> }
> 
> Tejas
>>   	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
>>   		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
>>   	return xe->pat.table[pat_index].coh_mode;
>> @@ -311,13 +313,13 @@ u16 xe_pat_index_get_coh_mode(struct xe_device
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
>> b/drivers/gpu/drm/xe/xe_pat.h index f6b0fac2000a..16beda6db97e 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -57,7 +57,8 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer
>> *p);  int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
>>
>>   /**
>> - * xe_pat_index_is_valid - Check whether the given pat_index is valid.
>> + * xe_pat_index_is_valid - Check whether the given pat_index is valid.
>> + Index
>> + * must be within valid range.
>>    * @xe: xe device
>>    * @pat_index: The pat_index to query
>>    *
>> @@ -75,7 +76,7 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe,
>> u16 pat_index);
>>
>>   /**
>>    * xe_pat_index_get_comp_en - Extract the compression enable flag for
>> - * the given pat_index.
>> + * the given pat_index. Index must be valid for the hw.
>>    * @xe: xe device
>>    * @pat_index: The pat_index to query
>>    *
>> @@ -88,6 +89,7 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe,
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

