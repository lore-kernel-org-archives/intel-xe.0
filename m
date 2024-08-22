Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1D0C5320E
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 08:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB61910E7E8;
	Thu, 22 Aug 2024 08:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVFg10y9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E2C10E7E8
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 08:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724316898; x=1755852898;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z29+RqsZ0GqdU0X7+LBwG9lMKNgob8ekxh1KxTKsBGA=;
 b=CVFg10y91f2OKmk9COIHlTW48JVPSh33E7Q97GOW6RFnHDfyHt/9fz4O
 WJwqaRi86/EZQDPBZ1fvHPHW9PpVChTVFRWmfBFoyQxhbx9qrG9tKvad2
 Hq2WMCAwDXvFTHeAqtkkXszo8S+VC9G9kBHdKFsh2Qwe5M7w/kgMntVDn
 MLKIGcaoIRFHuN+jQ7sIZl7a8PTGrYktfb4GDHrI/yr30/gtup1b32LIM
 jIHy6aoPRuvwi7zdolIJMe3VSZNidF51C6zWoOLryi37CXkMmeq6586kV
 Ybcwrxt6d5EyPa3UA9xvLQ7u5rHUIZSf2quUl9nF1qim1mJR7aE4TWPBg A==;
X-CSE-ConnectionGUID: LJ6b/nPNRCeVWAhf5MMSHQ==
X-CSE-MsgGUID: JxWWtY49TWum4NpX29Yo0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22897907"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22897907"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 01:54:54 -0700
X-CSE-ConnectionGUID: TND7/JcwQIqIZ+cQCF8zBA==
X-CSE-MsgGUID: kUuc9lS0QNezXyGfkHO9Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="65720353"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.90])
 ([10.245.244.90])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 01:54:52 -0700
Message-ID: <26226783-e6ff-4f68-8b00-ceaadeef9247@intel.com>
Date: Thu, 22 Aug 2024 09:54:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: fixup xe_alloc_pf_queue
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
References: <20240821171917.417386-2-matthew.auld@intel.com>
 <ZsanSW3JhOEmRNfy@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZsanSW3JhOEmRNfy@DUT025-TGLU.fm.intel.com>
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

On 22/08/2024 03:49, Matthew Brost wrote:
> On Wed, Aug 21, 2024 at 06:19:18PM +0100, Matthew Auld wrote:
>> kzalloc expects number of bytes, therefore we should convert the number
>> of dw into bytes, otherwise we are likely just accessing beyond the
>> array causing all kinds of carnage. Also fixup the error handling while
>> we are here.
>>
>> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index 401c0527d914..e4510e56e4a2 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -417,7 +417,10 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
>>   		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
>>   
>>   	pf_queue->gt = gt;
>> -	pf_queue->data = kzalloc(pf_queue->num_dw, GFP_KERNEL);
>> +	pf_queue->data = kzalloc(pf_queue->num_dw * sizeof(u32), GFP_KERNEL);
> 
> I merged this s/kzalloc/kcalloc based on feedback from dim.

Thanks.

> 
> Matt
> 
>> +	if (!pf_queue->data)
>> +		return -ENOMEM;
>> +
>>   	spin_lock_init(&pf_queue->lock);
>>   	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
>>   
>> -- 
>> 2.46.0
>>
