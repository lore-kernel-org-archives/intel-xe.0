Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1F7C54EE3
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 12:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B2710E438;
	Wed, 28 Aug 2024 12:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkxEEc/k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A94C10E438
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 12:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724846955; x=1756382955;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JIjT+TTx/fQ9Zj5C9xlFdzqyPj83Nz2E2nnwrsc+hCQ=;
 b=dkxEEc/kRpQh4Xn7EqZFhGaE4KN+47l9YDLBZjqAtg3hGssONIhGrB+x
 318ehT3S/SCemnQHdjKP/4dQAb6nLA9kUR1sHMk963IKjiAcP8cRZ4NE4
 ril20AO+if3tIiupSHW4C2BpZEn7ie9KWoFji74GflRpbO0Ic8O9Bhrkx
 uQGfxNxTWff3s5sjmSe81EeRTrBL1jOLJ+D0ikkYHuYJupf6rPVRKG3wF
 k01Ia4K9KG1vgdY0cP0rtyj5gdy48OPjeoRLCXTn3uMTjXkEGEHJqwKlF
 wXAYL+WahCPGuhD8zDlYdVYaiKIyB+M06IaYfTkMItUS13w2kSi40kRNH g==;
X-CSE-ConnectionGUID: RU+j9P0lTkW6D89s2tM2pw==
X-CSE-MsgGUID: FIFcCEAAS5e+eviVWkDzzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33994674"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="33994674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 05:09:15 -0700
X-CSE-ConnectionGUID: R7FuaUNmRLOaJLe2n33V7w==
X-CSE-MsgGUID: DhpYs8FmRNioM7CDdwwWxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="67563475"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 05:09:14 -0700
Message-ID: <194216f3-26f7-4da0-92f8-7e7b3e2a3997@linux.intel.com>
Date: Wed, 28 Aug 2024 14:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Skip CCS clear for WB type BOs
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240827154910.24841-1-nirmoy.das@intel.com>
 <871q29yox1.fsf@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <871q29yox1.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 8/28/2024 11:31 AM, Jani Nikula wrote:
> On Tue, 27 Aug 2024, Nirmoy Das <nirmoy.das@intel.com> wrote:
>> HW treats any access to 1-way or 2-way coherent memory as compression
>> disabled memory. So for such BOs there is no need to do CCS clearing.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index cbe7bf098970..24701272e3af 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -283,6 +283,7 @@ struct xe_ttm_tt {
>>   	struct device *dev;
>>   	struct sg_table sgt;
>>   	struct sg_table *sg;
>> +	bool skip_ccs_clear:1;
> There's no benefit in using a bitfield here, I don't think.


Agree, it can't be packed with any other member.


Thanks,

Nirmoy

>
> BR,
> Jani.
>
>>   };
>>   
>>   static int xe_tt_map_sg(struct ttm_tt *tt)
>> @@ -404,6 +405,8 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>>   	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
>>   		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>>   
>> +	/* compression is not allowed for cached BO so ccs clear can be skipped. */
>> +	tt->skip_ccs_clear = caching == ttm_cached;
>>   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
>>   	if (err) {
>>   		kfree(tt);
>> @@ -664,13 +667,16 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	struct ttm_resource *old_mem = ttm_bo->resource;
>>   	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>>   	struct ttm_tt *ttm = ttm_bo->ttm;
>> +	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
>> +					       ttm);
>>   	struct xe_migrate *migrate = NULL;
>>   	struct dma_fence *fence;
>>   	bool move_lacks_source;
>>   	bool tt_has_data;
>>   	bool needs_clear;
>>   	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>> -				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>> +				  ttm && ttm_tt_is_populated(ttm) &&
>> +				  !xe_tt->skip_ccs_clear) ? true : false;
>>   	bool clear_system_pages;
>>   	int ret = 0;
