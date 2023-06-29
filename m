Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BCDEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 09:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083CF10E099;
	Thu, 29 Jun 2023 09:19:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F257810E099
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 09:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688030356; x=1719566356;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=OmbnO0Hj+h118Li9HJ1byMqxvaD2nDztUmBTdQAMbiQ=;
 b=IJ+rzMoHxWNiiQFZeKm8dqMyqK9KbWuNot1GMvH/L77fmGJQzm7x2ae1
 F4/3yC8FowjuFU7Ttq3H+WGBD2cyh+9gEBkMYOhHZTgCe4xb84E6oe5la
 +lX85Wwzssb6m9tElDhrye5X8Vtm650hNOK+djuti+S3zzzqc72iSxHRD
 5uW1TxRCrgfmnv9NJsfcjgJMVVGkghs/L1rLvO5zVJC9QtL88OX3XYdWQ
 idy8o/QttYv2XlRURb1p06u5yXM9lwgowQ4eybsF4/pR4Yp/1iJ0eOFzV
 OHkL8dUTFmO2qj2PJBAHIKPpOfpW4dt5GiZQtTu9nIXWg1mwhnYPf/Wuo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="341645763"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="341645763"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 02:19:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="720505344"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; d="scan'208";a="720505344"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.252.9.206]) ([10.252.9.206])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 02:19:13 -0700
Message-ID: <a74688e3-9e3c-4ff6-1d2c-60012ae50bbc@intel.com>
Date: Thu, 29 Jun 2023 10:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230626105037.43780-15-matthew.auld@intel.com>
 <20230626105037.43780-23-matthew.auld@intel.com>
 <CY5PR11MB621160E01D9FCB9B91E365149524A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <CY5PR11MB621160E01D9FCB9B91E365149524A@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v12 08/13] drm/xe/display: use mem_access
 underneath
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

On 28/06/2023 10:51, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Matthew Auld
>> Sent: Monday, June 26, 2023 4:21 PM
>> To: intel-xe@lists.freedesktop.org
>> Subject: [Intel-xe] [PATCH v12 08/13] drm/xe/display: use mem_access
>> underneath
>>
>> There are places in the display code (i915) doing mmio access.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> index 59bf1d4a61d6..7a43f3af1796 100644
>> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
>> @@ -151,6 +151,7 @@ static inline bool intel_runtime_pm_get(struct
>> xe_runtime_pm *pm)
>>   		xe_pm_runtime_put(xe);
>>   		return false;
>>   	}
>> +	xe_device_mem_access_get(xe);
>>   	return true;
>>   }
>>
>> @@ -158,14 +159,14 @@ static inline bool
>> intel_runtime_pm_get_if_in_use(struct xe_runtime_pm *pm)  {
>>   	struct xe_device *xe = container_of(pm, struct xe_device,
>> runtime_pm);
>>
>> -	return xe_pm_runtime_get_if_active(xe);
>> +	return xe_device_mem_access_get_if_ongoing(xe);
>>   }
>>
>>   static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm
>> *pm)  {
>>   	struct xe_device *xe = container_of(pm, struct xe_device,
>> runtime_pm);
>>
>> -	xe_pm_runtime_put(xe);
>> +	xe_device_mem_access_put(xe);
> This patch does not remove xe_pm_runtime_get() from intel_runtime_pm_get() but removes
> xe_pm_runtime_put() here. It will be unbalanced dev usage_count.

Indeed. Thanks for catching.

> Thanks,
> Anshuman Gupta.
>>   }
>>
>>   static inline void intel_runtime_pm_put(struct xe_runtime_pm *pm, bool
>> wakeref)
>> --
>> 2.41.0
> 
