Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578DECE7B0E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 14:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F6D10EA7A;
	Fri, 14 Nov 2025 14:07:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4GW91ee";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D76010EA79
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 14:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763129257; x=1794665257;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=gEawhwi9WXRUMkWteLOkIe++U3FotnsQNjv3EgeJbK0=;
 b=k4GW91ee9YzbumsLs4UwvB3pRBMUqo1RhTSZQNgHkOR2YaRXb5iMPcaY
 WdgPtYjvptCm2va/N/8HSkQBgg8nK9OGgfBYEr0JyAuTrFnrRwc4+ZAsZ
 bjRt4cXj01gYH5DVLobv/CdXCuAHOASMS9iiSRP1xEYIT2kuREEvi2SOD
 r1KA2esKQAqkG0Z8vq7kqeyb+/+KmpmBvwOn5DhEKL16ckEgF5/oIY5uH
 VNAtoeU89sJM0CRGpMLDkftNWe8C1oq9No4e+5JjV8ILrjJKWCMezABje
 dUgb0gZpV3OWMPYmCftxjAHG2Uz3JAvicPMyqKyeI12W3BsLGc4WufRZS A==;
X-CSE-ConnectionGUID: Kt44nIElRVKLoqWZkQ2uWQ==
X-CSE-MsgGUID: sswqrM8XTa+DVFuZ9ZVoSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65126663"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="65126663"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:07:37 -0800
X-CSE-ConnectionGUID: F7RsYVdQTyqXs6kK9pImXg==
X-CSE-MsgGUID: PMmAmUpUTO65YPnmj1oLKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="189980729"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.26])
 ([10.245.244.26])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:07:35 -0800
Message-ID: <9bdaca79-15ea-45c7-9c90-64ce38dec423@intel.com>
Date: Fri, 14 Nov 2025 14:07:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/pat: Add helper to query compression enable
 status
From: Matthew Auld <matthew.auld@intel.com>
To: Xin Wang <x.wang@intel.com>, intel-xe@lists.freedesktop.org
Cc: shuicheng.lin@intel.com, alex.zuo@intel.com, nitin.r.gote@intel.com,
 sanjay.kumar.yadav@intel.com, matthew.d.roper@intel.com
References: <20251110221458.1864507-1-x.wang@intel.com>
 <20251110221458.1864507-2-x.wang@intel.com>
 <c2fd04e5-5d34-4a22-a2e8-03021d4eed55@intel.com>
Content-Language: en-GB
In-Reply-To: <c2fd04e5-5d34-4a22-a2e8-03021d4eed55@intel.com>
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

On 11/11/2025 09:40, Matthew Auld wrote:
> On 10/11/2025 22:14, Xin Wang wrote:
>> Add xe_pat_index_get_comp_en() helper function to check whether
>> compression is enabled for a given PAT index by extracting the
>> XE2_COMP_EN bit from the PAT table entry.
> 
> Just wondering if we should mention that multiple upcoming series are 
> going to directly use this, in case someone wonders why we are adding a 
> function with no user.
> 
>>
>> CC: Nitin Gote <nitin.r.gote@intel.com>
>> CC: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> CC: Matt Roper <matthew.d.roper@intel.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Xin Wang <x.wang@intel.com>
> 
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Now pushed.

> 
>> ---
>>   drivers/gpu/drm/xe/xe_pat.c |  6 ++++++
>>   drivers/gpu/drm/xe/xe_pat.h | 10 ++++++++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 68171cceea18..1b4d5d3def0f 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -196,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device 
>> *xe, u16 pat_index)
>>       return xe->pat.table[pat_index].coh_mode;
>>   }
>> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
>> +{
>> +    WARN_ON(pat_index >= xe->pat.n_entries);
>> +    return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
>> +}
>> +
>>   static void program_pat(struct xe_gt *gt, const struct 
>> xe_pat_table_entry table[],
>>               int n_entries)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index 05dae03a5f54..b8559120989e 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -58,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct 
>> drm_printer *p);
>>    */
>>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>> +/**
>> + * xe_pat_index_get_comp_en - Extract the compression enable flag for
>> + * the given pat_index.
>> + * @xe: xe device
>> + * @pat_index: The pat_index to query
>> + *
>> + * Return: true if compression is enabled for this pat_index, false 
>> otherwise.
>> + */
>> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
>> +
>>   #endif
> 

