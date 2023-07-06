Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3779DEB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 08:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71E710E47A;
	Thu,  6 Jul 2023 08:29:16 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB2E10E47A
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688632154; x=1720168154;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7Oowf4IHIAbXjRWlS05R+yipBII1RRG+Ntocy3dkK2A=;
 b=jCDs5POJwBzWKU7d3Ii9/+DK8sIg/sqPw5Lu12IJNsy2oddhL9Vy3daX
 N+lWMpxOiPTCMa2ha6eUFOEfQGrD5aVe2RebZc13d7dFzT27cV1uO2+7V
 xI6KWWujL1sEIx0OGIXMM3LCfXWPROkx+MfNHWy5XYer446vtjrFoeROh
 IDcfDP6W88jLSxUiZMIFpCkxGL+/0UfKS1SPTzED4PdMFvKH2G/PrLOpf
 6dgy5fxHIja/kxW6I2zrUiF2pAnciwJhtP+34N4xfyd+Uu2N3OBKHbxxK
 mAvyqUf7+xIv8VC2vtNTTu/DabZJ6nCx6Jwk1/ZxHdOzKi1Ws6998ANhW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="361014086"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="361014086"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 01:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="719510761"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="719510761"
Received: from fmahon-mobl.ger.corp.intel.com (HELO [10.252.26.229])
 ([10.252.26.229])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 01:29:12 -0700
Message-ID: <bedd83b9-3e30-ee31-a61b-4e28fc38a9cc@intel.com>
Date: Thu, 6 Jul 2023 09:29:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-10-matthew.auld@intel.com>
 <ZKY6SHpACikaNmET@DUT025-TGLU.fm.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZKY6SHpACikaNmET@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v4 1/7] drm/xe: hold mem_access.ref for CT
 fast-path
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 06/07/2023 04:51, Matthew Brost wrote:
> On Wed, Jul 05, 2023 at 05:06:04PM +0100, Matthew Auld wrote:
>> Just checking xe_device_mem_access_ongoing() is not enough, we also need
>> to hold the reference otherwise the ref can transition from 1 -> 0 as we
>> enter g2h_read(), leading to warnings. While we can't do a full rpm sync
>> in the IRQ, we can keep the device awake if the ref is non-zero.
>> Introduce a new helper for this and set it to work in for the CT
>> fast-path.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 5 +++++
>>   drivers/gpu/drm/xe/xe_device.h | 1 +
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 5 ++++-
>>   3 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 07ae208af809..94b0089b0dee 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -412,6 +412,11 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>>   		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
>>   }
>>   
>> +bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
>> +{
>> +	return atomic_inc_not_zero(&xe->mem_access.ref);
>> +}
>> +
>>   void xe_device_mem_access_get(struct xe_device *xe)
>>   {
>>   	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 779f71d066e6..8e01bbadb149 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -138,6 +138,7 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
>>   }
>>   
>>   void xe_device_mem_access_get(struct xe_device *xe);
>> +bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
>>   void xe_device_mem_access_put(struct xe_device *xe);
>>   
>>   static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 22bc9ce846db..b7aecc480098 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1038,7 +1038,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>>   	struct xe_device *xe = ct_to_xe(ct);
>>   	int len;
>>   
>> -	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
>> +	if (!xe_device_in_fault_mode(xe) ||
>> +	    !xe_device_mem_access_get_if_ongoing(xe))
>>   		return;
>>   
>>   	spin_lock(&ct->fast_lock);
>> @@ -1048,6 +1049,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
>>   			g2h_fast_path(ct, ct->fast_msg, len);
>>   	} while (len > 0);
>>   	spin_unlock(&ct->fast_lock);
>> +
>> +	xe_device_mem_access_put(xe);
> 
> Can't this sleep if would go from 1->0, i.e. can't xe_pm_runtime_put sleep?

Thanks for the review. The rpm put() in xe_device_mem_access_put() 
always uses RPM_ASYNC underneath, and that is always safe to use from 
atomic context. The kernel-doc for __pm_runtime_suspend() says:

"This routine may be called in atomic context if the RPM_ASYNC flag is set"

It only really queues the work to run our rpm suspend callback, and 
never runs it directly if using RPM_ASYNC.

> 
> Matt
> 
>>   }
>>   
>>   /* Returns less than zero on error, 0 on done, 1 on more available */
>> -- 
>> 2.41.0
>>
