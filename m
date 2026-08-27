Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B26C61DC2
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 10:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB3E10E3E7;
	Thu, 27 Aug 2026 10:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UAYa/hAJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD0510E3E7
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787828155; x=1819364155;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iVFlQxbAv0uLPpJOplh2ssWG2/L4ZwvY/TYS8EugNoU=;
 b=UAYa/hAJMawHypeRq5VlTSfQSVH90D5EwBuBn29eC8NLvBBbidGaDc4G
 il0MpCaPgBmDX0H/7gV3yPlAyZJGQop/jmUaSmtYvkVLeG7HMC3fXUSEl
 UJuTQVJ9PDNIblA1IKiKlAPsXVqGEKH40qCpfl7xakbsEWWAbHBeiXjuH
 DUf5xihJ63KGsbw2zyHW7r9h0ebDjzOqBft7ExKcxIDC/tY7dMWwOnUQJ
 zZkuYE7LqXMy90Y1O2Pr67hnNGEzFff3ZzkqoFX2rmbr9nhMvjPtpW0st
 1KebQ6bMPUN+HaDNOkUfUDNIbSHokRltN6rS9kOuJLgRDTkebGSOLO/9g w==;
X-CSE-ConnectionGUID: 7gNEwYQRSRSGuNFLn4GZRQ==
X-CSE-MsgGUID: /LaYHVeCTAu0FjzNv3zXGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="92184442"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="92184442"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:55:54 -0700
X-CSE-ConnectionGUID: 7REaWPq6TKSaU68amx95Sg==
X-CSE-MsgGUID: XJlw91kBRjCZnTMJ6/sZXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264600694"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.178.42])
 ([10.247.178.42])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 03:55:51 -0700
Message-ID: <6f8e5f5e-7bd8-4fef-b714-ef077f50812a@linux.intel.com>
Date: Thu, 27 Aug 2026 16:25:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/xe_ras: Add Fabric error handling
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Nilawar, Badal" <badal.nilawar@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 soham.purkait@intel.com
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-5-riana.tauro@intel.com>
 <a063221b-7a11-45a7-bac9-12d19f6a2a76@intel.com> <ao9T2POk0wXbGf4L@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ao9T2POk0wXbGf4L@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 27-08-2026 02:30, Rodrigo Vivi wrote:
> On Tue, Aug 25, 2026 at 08:20:36PM +0530, Nilawar, Badal wrote:
>> On 25-08-2026 19:41, Riana Tauro wrote:
>>> SAF MHB errors are collected and classifed under Fabric error component
>>> by System controller. For SAF_MHB errors, if the cause is data
>>> payload parity error then log and return.
>>>
>>> For all other errors and causes, request a Secondary Bus Reset (SBR)
>>>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
>>>   2 files changed, 24 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index d25d25f77531..586dc28a638a 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>>   }
>>> +static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>>> +{
>>> +	struct xe_ras_error_product *product = &arr->counter.product;
>>> +	struct xe_ras_ieh_error *info = (void *)arr->details;
>>> +
>>> +	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
>>> +	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
>>> +		xe_log_comp_recoverable(xe, FABRIC, &arr->counter, sizeof(arr->counter),
>>> +					"SAF MHB error detected\n");
>>> +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>> +	}
>>> +
>>> +	xe_log_comp_fatal(xe, FABRIC, &arr->counter, sizeof(arr->counter),
>>> +			  "Other errors detected\n");
>> I think this also should go under recoverable.
> The point is that at this moment in time we don't know if the reset will
> indeed be able to recover the device.

I do not think it is right to say that, for any error we sure for know
what is the recovery needed. The respective error handler shall perform
that needed recovery action and anything that is recoverable by a driver
action is to be categorized under RECOVERABLE CPER severity.

The case where driver can't recover the device by itself falls into
FATAL case. Eg: probe failure or wedged cases.

Thanks,
Aravind.
> It is a moment where we are handling a global uncorrectable (fatal) error
> and we will return the reset action in a hope that the PCI subsystem will
> be able to perform an SBR to save the day and we start everything clean
> after that.
>
> So, I believe this approach is correct here.
>
> Aravind, thoughts?
>
>> Thanks,
>> Badal
>>
>>> +	return XE_RAS_RECOVERY_ACTION_RESET;
>>> +}
>>> +
>>>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>>>   				      struct xe_sysctrl_event_response *response)
>>>   {
>>> @@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>>   			case XE_RAS_COMP_DEVICE_MEMORY:
>>>   				action = handle_device_memory_errors(xe, arr);
>>>   				break;
>>> +			case XE_RAS_COMP_FABRIC:
>>> +				action = handle_fabric_errors(xe, arr);
>>> +				break;
>>>   			default:
>>>   				/* For any other component, reset */
>>>   				action = XE_RAS_RECOVERY_ACTION_RESET;
>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>>> index 99b2466e2062..73517fd0d415 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>> @@ -12,6 +12,10 @@
>>>   #define XE_RAS_NUM_ERROR_ARR			3
>>>   /* Error bits in IEH global error status register */
>>>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>>> +/* Bits 16-31 represent individual SAF MHB unit */
>>> +#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
> Riana, please share where I can check to help reviewing these bits.
>
> Thanks,
> Rodrigo.
>
>>> +/* Fabric Data payload parity errors */
>>> +#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
>>>   /* Device memory error categories */
>>>   #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>>>   #define XE_RAS_MEMORY_POISON			BIT(2)
