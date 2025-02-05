Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7397EC02192
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 11:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3023010E145;
	Wed,  5 Feb 2025 11:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIbkEHaz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C8810E145
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 11:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738753236; x=1770289236;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/n1HlNU9LnSQ4sqVBf6J6rAfXegmjHUis0eB9iRgsUU=;
 b=HIbkEHazeejw9xmYadXGfvMlMNDlu9bCLLJFtURjZRzhblpcPyQGku6f
 Jh/0psfgsOJQ+TVV/rlkpnGqpeJ5NIiRhoextXF1wZr/z33Yd7YhM4byY
 l4zrJxh+Yok0yUd3XtgUoIssXxQC/FVUqzs9Swx9/tVGaaDHEkhCQwnlC
 5Ug1pZDR1py1tAwEu3y3XW6q0/dvUL+Xp2tQZEuUXMyPpOcBjfKp15xuv
 xjmozYh+lVR7P5OIuF2IKOh0RWBQnvFUJliqi88MS/Wjm3GO+Eb9QGTRS
 U2Rtj4EuJl4DSVBhc/FMIRdRY2694vtuRdg7et9W53YvctjiwUtjxr4Th w==;
X-CSE-ConnectionGUID: L4y6urLORmSZJYxmCcNYDg==
X-CSE-MsgGUID: 6hBq9LEcQ06HYm9oh21y+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39013069"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="39013069"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 03:00:36 -0800
X-CSE-ConnectionGUID: eFgkz/UXQBGwa7Kp1XwSEw==
X-CSE-MsgGUID: 8QQ98ZqzRz+cc6gFGEw//Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="115842936"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.119])
 ([10.246.3.119])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 03:00:35 -0800
Message-ID: <82db9013-ce1d-4ce2-956d-9dfb05a8a43f@linux.intel.com>
Date: Wed, 5 Feb 2025 12:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/vf: Return error code from
 xe_hw_engine_read_timestamp()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250204180522.2327214-1-marcin.bernatowicz@linux.intel.com>
 <20250204180522.2327214-3-marcin.bernatowicz@linux.intel.com>
 <6b7039b2-f123-4a67-93ec-239d14b8f971@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <6b7039b2-f123-4a67-93ec-239d14b8f971@intel.com>
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



On 2/4/2025 7:53 PM, Michal Wajdeczko wrote:
> 
> 
> On 04.02.2025 19:05, Marcin Bernatowicz wrote:
>> Modify xe_hw_engine_read_timestamp() to return an error code instead
>> of a u64 timestamp. Return -EOPNOTSUPP when called from Virtual Function
>> (VF) mode to avoid reading the inaccessible RING_TIMESTAMP register.
>>
>> Update function signature to pass the timestamp via a pointer argument.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hw_engine.c | 10 ++++++++--
>>   drivers/gpu/drm/xe/xe_hw_engine.h |  2 +-
>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index fc447751fe78..ab91c15f3a8b 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -981,9 +981,15 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
>>   	return NULL;
>>   }
>>   
>> -u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>> +int xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe, u64 *gpu_timestamp)
>>   {
>> -	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
>> +	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
>> +		return -EOPNOTSUPP;
> 
> there seems to be 1 caller of this function
> is it worth to make change here instead of fixing the caller ?
> 
Fixing the function seems more reasonable than tracking the caller(s).
However, considering the subsequent comments, this patch should be dropped.

>> +
>> +	*gpu_timestamp = xe_mmio_read64_2x32(&hwe->gt->mmio,
>> +					     RING_TIMESTAMP(hwe->mmio_base));
>> +
>> +	return 0;
>>   }
>>   
>>   enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>> index 6b5f9fa2a594..df377da82770 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>> @@ -73,7 +73,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>>   }
>>   
>>   const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
>> -u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>> +int xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe, u64 *gpu_timestamp);
>>   enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>>   
>>   void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
> 
> and this patch will not compile without 3/3

Indeed, my bad

> 

