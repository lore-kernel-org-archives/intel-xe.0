Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CD2C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 26 Mar 2024 11:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8F810E6CA;
	Tue, 26 Mar 2024 11:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjYT7aDO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E547110E5DA
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Mar 2024 11:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711451202; x=1742987202;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sQXo9VlCUqTBL3sca2HB4lSYaIPAW20JWhMkzrHThKw=;
 b=jjYT7aDOzE91CJ1Pw+yrhRrvueq0nJst/yWLPQFlZEQ4aN2ftxaKvXte
 vRcu4RGfGbKaYMS06D3qeKXIZHeF4gqOjJ72/iqC+bDMq76QN4wYNk+rP
 j8ShrE+Dijj89gd7C9EVO56tV3V69ID9AtvDtdRQ6RfXnGARW9PSn4PyN
 Mst1zROf0dpWNZAHTDaZP2wPYL34mOnO3eXUkI+ZeP+OaoozMjA/eBdhq
 E8daXez3//wPpLh6mLOutbVPCwDxnXO9DZlCre5hSB3Fb+ZLT1rZkJE0y
 jrTasfpV4ElTvBXjicH8iT/XX0yDC1aI7c4pniXHfScEXprtCLj+NcLvf g==;
X-CSE-ConnectionGUID: KmaMG89lQeuusiDRnXwCbA==
X-CSE-MsgGUID: tKOkceHgRJSsI6PQ6Lb2zA==
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6360358"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6360358"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 04:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="16585117"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 26 Mar 2024 04:06:39 -0700
Received: from [10.249.156.251] (unknown [10.249.156.251])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 39C9A27BD5;
 Tue, 26 Mar 2024 11:06:38 +0000 (GMT)
Message-ID: <9a9bfee1-c4c4-4307-a2e7-e6f496f48cc2@intel.com>
Date: Tue, 26 Mar 2024 12:06:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/guc: Add support for w/a KLVs
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, lucas.demarchi@intel.com,
 matthew.d.roper@intel.com, daniele.ceraolospurio@intel.com
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
 <20240325150435.2967536-2-badal.nilawar@intel.com>
 <b772d2dc-25d6-48de-b745-e61b2c218460@intel.com>
 <d218bc8f-f1cb-4ddd-a587-5d41cd7a9432@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d218bc8f-f1cb-4ddd-a587-5d41cd7a9432@intel.com>
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



On 25.03.2024 19:55, John Harrison wrote:
> On 3/25/2024 08:19, Michal Wajdeczko wrote:
>> On 25.03.2024 16:04, Badal Nilawar wrote:
>>> To prevent running out of bits, new w/a enable flags are being added
>> nit: shouldn't we spell out "workaround" or use "W/A" as acronym ?
> 
> On the i915 side, we always used 'w/a'. It is more abbreviation than
> acronym, certainly it is not an acronym for a proper noun. But yes, the
> first instance in any description or comment should be written out in
> full and only after that should abbreviations be used.
> 
>>
>>> via a KLV system instead of a 32 bit flags word.
>>>
>>> v2: GuC version check > 70.10 is not needed as xe will not be supporting
>>>      anything below < 70.19 (John Harrison)
>>> v3: Use 64 bit ggtt address for future
>>>      compatibility (John Harrison/Daniele)
>>>
>>> Cc: John Harrison <John.C.Harrison@intel.com>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_ads.c       | 62 ++++++++++++++++++++++++++-
>>>   drivers/gpu/drm/xe/xe_guc_ads_types.h |  2 +
>>>   drivers/gpu/drm/xe/xe_guc_fwif.h      |  5 ++-
>>>   3 files changed, 66 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> index df2bffb7e220..a98344a0ff4b 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>>> @@ -80,6 +80,10 @@ ads_to_map(struct xe_guc_ads *ads)
>>>    *      +---------------------------------------+
>>>    *      | padding                               |
>>>    *      +---------------------------------------+ <== 4K aligned
>>> + *      | w/a KLVs                              |
>>> + *      +---------------------------------------+
>>> + *      | padding                               |
>>> + *      +---------------------------------------+ <== 4K aligned
>>>    *      | capture lists                         |
>>>    *      +---------------------------------------+
>>>    *      | padding                               |
>>> @@ -131,6 +135,11 @@ static size_t guc_ads_golden_lrc_size(struct
>>> xe_guc_ads *ads)
>>>       return PAGE_ALIGN(ads->golden_lrc_size);
>>>   }
>>>   +static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
>>> +{
>>> +    return PAGE_ALIGN(ads->ads_waklv_size);
>> btw, shouldn't we start using ALIGN(xx, SZ_4K)
>>
>>> +}
>>> +
>>>   static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>>>   {
>>>       /* FIXME: Allocate a proper capture list */
>>> @@ -167,12 +176,22 @@ static size_t guc_ads_golden_lrc_offset(struct
>>> xe_guc_ads *ads)
>>>       return PAGE_ALIGN(offset);
>>>   }
>>>   +static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
>>> +{
>>> +    u32 offset;
>>> +
>>> +    offset = guc_ads_golden_lrc_offset(ads) +
>>> +         guc_ads_golden_lrc_size(ads);
>>> +
>>> +    return PAGE_ALIGN(offset);
>>> +}
>>> +
>>>   static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>>>   {
>>>       size_t offset;
>>>   -    offset = guc_ads_golden_lrc_offset(ads) +
>>> -        guc_ads_golden_lrc_size(ads);
>>> +    offset = guc_ads_waklv_offset(ads) +
>>> +         guc_ads_waklv_size(ads);
>>>         return PAGE_ALIGN(offset);
>>>   }
>>> @@ -260,6 +279,42 @@ static size_t calculate_golden_lrc_size(struct
>>> xe_guc_ads *ads)
>>>       return total_size;
>>>   }
>>>   +static void guc_waklv_init(struct xe_guc_ads *ads)
>>> +{
>>> +    u64 addr_ggtt;
>>> +    u32 offset, remain, size;
>>> +
>>> +    offset = guc_ads_waklv_offset(ads);
>>> +    remain = guc_ads_waklv_size(ads);
>>> +
>>> +    /*
>>> +     * Add workarounds here:
>>> +     *
>>> +     * if (want_wa_<name>) {
>>> +     *      size = guc_waklv_<name>(guc, offset, remain);
>>> +     *      offset += size;
>>> +     *      remain -= size;
>> maybe just asserting the used size will work ?
>>
>>         used += guc_waklv_NAME(guc, offset + used);
>>         xe_gt_assert(gt, used <= guc_ads_waklv_size(ads));
>>
>>> +     * }
>>> +     */
>>> +
>>> +    size = guc_ads_waklv_size(ads) - remain;
>>> +    if (!size)
>>> +        return;
> Hmm. This test would be much more obvious as to its purpose if it was
> simply "if(!used)". Not sure if the rest of the code is overall simpler
> or more complex, though?
> 
> It would be nice if the "used += ...; xe_asert(used < size);" could be
> done in a loop that just takes an array of all the KLV ids. Not sure how
> to achieve that with the w/a enable test, though. At least not without
> the code just getting overly complicated. I guess it's not that much of
> an issue to replicate the assert line for each w/a entry.
> 

this array of KLVs may look like this:

static const struct {
	bool (*need_wa)(struct xe_gt*);
	u32 (*add_klv)(struct xe_gt*, u32 offset);
}

but maybe leave it until we will have more than one W/A to handle

> 
>>> +
>>> +    offset = guc_ads_waklv_offset(ads);
>>> +    addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>>> +
>>> +    ads_blob_write(ads, ads.wa_klv_addr_lo, lower_32_bits(addr_ggtt));
>>> +    ads_blob_write(ads, ads.wa_klv_addr_hi, upper_32_bits(addr_ggtt));
>>> +    ads_blob_write(ads, ads.wa_klv_size, size);
>>> +}
>>> +
>>> +static int calculate_waklv_size(struct xe_guc_ads *ads)
>>> +{
>>> +    /* Fudge something chunky for now: */
>>> +    return PAGE_SIZE;
>> maybe SZ_4K ?
> Technically, it is specifically a page not an arbitrary size that
> happens to be page. However, it is really the GuC page size rather than
> the host page size. At least, there is a requirement for the address
> given to GuC to be page aligned as the lower bits are discarded. Whether
> there is also any requirement on the host side for allocations to be
> page aligned because they are going to be rounded up anyway by the
> internal allocation mechanism is another matter. I believe that was the
> case on i915 but not sure about Xe? So maybe it is both GT page size and
> host page size?
> 
> Is there any host architecture which has a page size that is not a
> multiple of 4KB? If so, then maybe we need some fancy calculation that
> is the lowest common factor of host page size and GT page size. But that
> seems unlikely. In which the host page size seems the simplest valid
> definition. If you want to be really paranoid, you could maybe add a
> global compile time assert somewhere that PAGE_SIZE is a multiple of 4K?

still, if GuC always expects 4K "page size" why we insist to use host
PAGE_SIZE that could be a different size ? even if it will be multiple
of 4K and it will eventually work on GuC side, why do we want to waste a
GGTT space for unnecessary padding ?

anyway, just an idea, not a blocker

> 
>>
>> and is it really a 'calculate' helper ?
>>
>> if so then maybe add template comment how this will be calculated using
>> want_wa_<name> and guc_waklv_<name> tuples
> I suspect the calculation will be more like "if(IPVER >= 100) size =
> PAGE * 10; else if(IPVER >= 50) size = PAGE * 2; else size = PAGE;". So
> yes it is a calculation, but for the foreseeable future the calculation
> is trivial. A single page is both the minimum size possible and is
> sufficiently large enough for all current platforms. It may be worth
> using that last sentence as the comment instead?

this still sounds more like an 'estimate' than 'calculate' but let it be

> 
>>
>>> +}
>>> +
>>>   #define MAX_GOLDEN_LRC_SIZE    (SZ_4K * 64)
>>>     int xe_guc_ads_init(struct xe_guc_ads *ads)
>>> @@ -271,6 +326,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>>         ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>>>       ads->regset_size = calculate_regset_size(gt);
>>> +    ads->ads_waklv_size = calculate_waklv_size(ads);
>>>         bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads)
>>> + MAX_GOLDEN_LRC_SIZE,
>>>                         XE_BO_CREATE_SYSTEM_BIT |
>>> @@ -598,6 +654,8 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>>>       guc_mapping_table_init(gt, &info_map);
>>>       guc_capture_list_init(ads);
>>>       guc_doorbell_init(ads);
>>> +    /* Workaround KLV list */
>> drop useless comment ...
>>
>>> +    guc_waklv_init(ads);
>>>         if (xe->info.has_usm) {
>>>           guc_um_init_params(ads);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>> b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>> index 4afe44bece4b..62235b2a6fe3 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
>>> @@ -20,6 +20,8 @@ struct xe_guc_ads {
>>>       size_t golden_lrc_size;
>>>       /** @regset_size: size of register set passed to GuC for
>>> save/restore */
>>>       u32 regset_size;
>>> +    /** @ads_waklv_size: waklv size */
>> ... instead improve comment here
>>
>>> +    u32 ads_waklv_size;
>>>   };
>>>     #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> index c281fdbfd2d6..52503719d2aa 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
>>> @@ -207,7 +207,10 @@ struct guc_ads {
>>>       u32
>>> capture_instance[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>>       u32
>>> capture_class[GUC_CAPTURE_LIST_INDEX_MAX][GUC_MAX_ENGINE_CLASSES];
>>>       u32 capture_global[GUC_CAPTURE_LIST_INDEX_MAX];
>>> -    u32 reserved[14];
>>> +    u32 wa_klv_addr_lo;
>>> +    u32 wa_klv_addr_hi;
>>> +    u32 wa_klv_size;
>> maybe it's worth to add a comment from which GuC version these new
>> fields are redefined
> Not necessary. Xe does not support any GuC version which does not
> support a w/a KLV. Therefore this is simply baseline support same as all
> the other fields here.

ok, I missed series that sets baseline version for xe, but maybe still
worth to add some comment to the commit message that this is already
supported by all our baseline GuC firmwares ?

> 
> John.
> 
>>
>>> +    u32 reserved[11];
>>>   } __packed;
>>>     /* Engine usage stats */
> 
