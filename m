Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C82DC83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 17:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE94D10E8B6;
	Thu,  3 Jul 2025 17:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALeT2Kxj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4364B10E8B6
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 17:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751564549; x=1783100549;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UTsAkaYk8Fb2HH1TPU+S/kzqHUdGP5SLM/1DukjeObo=;
 b=ALeT2KxjRnJkBGRkU/ZrRTxeM74zaAyioFTzvehrxS4q3l2HymPNJj53
 +BW2NoStzY1+V2jHVKZ+EsWHjR6D8a2QJi79LFjgQsbyDbOAWnmO9Xhc4
 AbzndDLTpKi48EMuhXthZIEMAWlozOEURIzBxosc0uLv3Vt6YguTO2bYd
 V6ASn3jGTF0Sc9gmyyme/3jJBvWlMnxHjW6QcQ35vDMW+r1hN1UFLoGOU
 Kza0XZczhKN7kG0ZegyQhoSNCDI94DEVzdYjcFpAAdGfK+KvSKlBf+6m8
 K3oaYhPx3KwcH73o9laqb43Ozkn+5p3R1bXZftameslkHcbwmvjRduM6m g==;
X-CSE-ConnectionGUID: aQZIUXz8QL+GNNpBk1eEFg==
X-CSE-MsgGUID: /ueg9jbrS2S4fypMSUtNUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="71472192"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="71472192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 10:42:29 -0700
X-CSE-ConnectionGUID: jbOvD+YaQ+OksPImIbeHJQ==
X-CSE-MsgGUID: L5huA1xtSf2BHjQpS8hcqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="158783955"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa003.jf.intel.com with ESMTP; 03 Jul 2025 10:42:27 -0700
Received: from [10.245.112.168] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.112.168])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id D6F3A32CB9;
 Thu,  3 Jul 2025 18:42:25 +0100 (IST)
Message-ID: <ff5eb344-f619-402f-ad37-4287a10f4288@intel.com>
Date: Thu, 3 Jul 2025 19:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250702223041.1700-1-michal.wajdeczko@intel.com>
 <20250702223041.1700-3-michal.wajdeczko@intel.com>
 <aGa+YbxiJSW7EjbI@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aGa+YbxiJSW7EjbI@lstrano-desk.jf.intel.com>
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



On 03.07.2025 19:31, Matthew Brost wrote:
> On Thu, Jul 03, 2025 at 12:30:40AM +0200, Michal Wajdeczko wrote:
>> Invalidate LMTT immediately after removing VF's LMTT page tables
>> and clearing root PTE in the LMTT PD to avoid any invalid access
>> by the hardware (and VF) due to stale data.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.h              |  4 ++
>>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 35 +++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 +
>>  drivers/gpu/drm/xe/xe_lmtt.c                | 56 +++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_lmtt.h                |  1 +
>>  5 files changed, 98 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index e4da797a984b..a7acd899aa76 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -130,6 +130,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
>>  	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
>>  		for_each_if((tile__) = &(xe__)->tiles[(id__)])
>>  
>> +#define for_each_gt_on_tile(gt__, tile__, id__) \
>> +	for ((id__) = 0; (id__) < XE_MAX_GT_PER_TILE; (id__)++) \
>> +		for_each_if((gt__) = xe_tile_get_gt((tile__), (id__)))
>> +
>>  /*
>>   * FIXME: This only works for now since multi-tile and standalone media
>>   * happen to be mutually exclusive.  Future platforms may change this...
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index 6088df8e159c..4fdd5b300265 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -330,6 +330,41 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>>  	return 0;
>>  }
>>  
>> +static int send_tlb_invalidation_all(struct xe_gt *gt,
>> +				     struct xe_gt_tlb_invalidation_fence *fence)
>> +{
>> +	u32 action[] = {
>> +		XE_GUC_ACTION_TLB_INVALIDATION_ALL,
>> +		0,  /* seqno, replaced in send_tlb_invalidation */
>> +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
>> +	};
>> +
>> +	return send_tlb_invalidation(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
>> +}
>> +
>> +/**
>> + * xe_gt_tlb_invalidation_all_async - Invalidate all TLBs across PF and all VFs.
>> + * @gt: the &xe_gt structure
>> + * @fence: the &xe_gt_tlb_invalidation_fence to be signaled on completion
>> + *
>> + * Send a request to invalidate all TLBs across PF and all VFs.
>> + *
>> + * Return: 0 on success, negative error code on error
>> + */
>> +int xe_gt_tlb_invalidation_all_async(struct xe_gt *gt,
>> +				     struct xe_gt_tlb_invalidation_fence *fence)
> 
> I'd drop _async part of the naming as I think it is implied with the
> fence argument that is this async, like xe_gt_tlb_invalidation_range.

this suffix is here because initially I was also having this variant:

	int xe_gt_tlb_invalidation_all(struct xe_gt *gt);

which actually was waiting for the TLB fence inside - like it is done in
the xe_gt_tlb_invalidation_ggtt() - but finally dropped it from this
patch as not used in current code

> 
> All the changes around GT TLB invalidations look correct (for now, this
> whole layer needs rework).

yes, please ;)

> 
> Matt 
> 
