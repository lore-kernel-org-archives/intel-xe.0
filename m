Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F81CDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 05:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBEF10E47B;
	Thu, 19 Oct 2023 05:59:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478CA10E47B
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 05:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697695151; x=1729231151;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=D37x6eIOXKKGSoUywDNKlfE0fQiY2s5PzJX1oCW5zw4=;
 b=cLlU/gVURUn72wm7g/fgHnmMPoz15tubjJqrSjonBboYX0nCJUikJi9m
 VmPeCVSaShtXaWEgKeXuCLZz3xFUnVfBuHk3+/LZhnz8ZRvrcWwSPDRqJ
 WCDuAvjldaevfMWvLnCyULGky9O5pyO4wd5ivmU8b7A5FufFAXFiv/bxh
 Ai1lBSdFVq1Tqy9qv7fcbVL7WNu6yinIRcHdKHBdhXHp6MqQ3Jx9ti4Oz
 LZNwDM7beVo/Q8K2Q07meGKLg+u5+SQ6qnnhyQojFqQ6Fx5coktTJT6Bd
 iRAbqIOSUlabX3UTjri/bwIevTyrUb85o2SRk619J5vhI66eYB4DyRROa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="371244797"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="371244797"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 22:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822710324"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="822710324"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 22:59:09 -0700
Message-ID: <b5456a04-312e-5ea9-d0d4-fa628beeb557@linux.intel.com>
Date: Thu, 19 Oct 2023 11:32:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
 <20231018040033.1227494-6-himal.prasad.ghimiray@intel.com>
 <be063286-ae1e-460c-80f2-89f86485a9c7@intel.com>
 <MW4PR11MB705661DB0BF942C87D8CBA75B3D4A@MW4PR11MB7056.namprd11.prod.outlook.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <MW4PR11MB705661DB0BF942C87D8CBA75B3D4A@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 05/10] drm/xe: Notify userspace about GSC
 HW errors.
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


On 19/10/23 11:06, Ghimiray, Himal Prasad wrote:
> Hi Brian,
>
>> -----Original Message-----
>> From: Welty, Brian <brian.welty@intel.com>
>> Sent: 19 October 2023 06:22
>> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH v2 05/10] drm/xe: Notify userspace about GSC
>> HW errors.
>>
>>
>>
>> On 10/17/2023 9:00 PM, Himal Prasad Ghimiray wrote:
>>> Send uevent incase of nonfatal errors reported by gsc.
>>>
>>> v2
>>> - No need to provide tile info in uevent because error is accepted
>>> only in tile0. (Aravind)
>> This is user API.  Don't we need to demonstrate user-space consumer of this
>> before merge?  Do we at least have IGT?  Also see question below.
> https://one-api.gitlab-pages.devtools.intel.com/level_zero/sysman/api.html#_CPPv441ZES_EVENT_TYPE_FLAG_DEVICE_RESET_REQUIRED is the consumer for this uevent.
> The hardware error injection via IGT is not possible. It explicitly needs python SV and ITP.
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>>   drivers/gpu/drm/xe/xe_hw_error.c     | 16 ++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_hw_error.h     |  3 ++-
>>>   drivers/gpu/drm/xe/xe_irq.c          |  4 ++++
>>>   include/uapi/drm/xe_drm.h            |  8 ++++++++
>>>   5 files changed, 33 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 2998ee517f0d..d2ee5549d20c 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -196,6 +196,9 @@ struct xe_tile {
>>>   	struct tile_hw_errors {
>>>   		struct xarray hw_error;
>>>   	} errors;
>>> +
>>> +	/** @gsc_hw_err_work: worker for uevent to report GSC HW errors
>> */
>>> +	struct work_struct gsc_hw_err_work;
>>>   };
>>>
>>>   /**
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>> index 1e94ee72a34f..9ac817c1dd03 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>> @@ -3,6 +3,8 @@
>>>    * Copyright © 2023 Intel Corporation
>>>    */
>>>
>>> +#include <drm/xe_drm.h>
>>> +
>>>   #include "xe_hw_error.h"
>>>
>>>   #include "regs/xe_regs.h"
>>> @@ -387,6 +389,19 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const
>> enum hardware_error hw_err)
>>>   		xe_gt_hw_error_log_vector_reg(gt, hw_err);
>>>   }
>>>
>>> +void xe_gsc_hw_error_work(struct work_struct *work) {
>>> +	struct xe_tile *tile = container_of(work, typeof(*tile),
>> gsc_hw_err_work);
>>> +	char *csc_hw_error_event[3];
>>> +
>>> +	csc_hw_error_event[0] = XE_GSC_HW_HEALTH_UEVENT "=1";
>>> +	csc_hw_error_event[1] = "RESET_REQUIRED=1";
>>> +	csc_hw_error_event[2] = NULL;
>>> +
>>> +	kobject_uevent_env(&tile->xe->drm.primary->kdev->kobj,
>> KOBJ_CHANGE,
>>> +			   csc_hw_error_event);
>>> +}
>>> +
>> ...
>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>> index d48d8e3c898c..06f6fce1531d 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -16,6 +16,14 @@ extern "C" {
>>>    * subject to backwards-compatibility constraints.
>>>    */
>>>
>>> +/**
>>> + * DOC: uevent generated by xe on it's tile node.
>> What does 'tile node' mean?  If I'm not mistaken, isn't
>> tile->xe->drm.primary->kdev->kobj just the device node?
> Miss from my end. It should be device node.
>>> + *
>>> + * XE_GSC_HW_HEALTH_UEVENT - Event is generated when GSC reports
>> HW
>>> + * errors. The value supplied with the event is always
>> "RESET_REQUIRED=1".
>>> + */
>>> +#define XE_GSC_HW_HEALTH_UEVENT "DEVICE_STATUS"
>> So both XE_RESET_FAILED_UEVENT and XE_GSC_HW_HEALTH_UEVENT are
>> defined as "DEVICE_STATUS".  Should be unique or isn't this going to be
>> confusing to the user reading these events?
> The values provided are different and uevents are on different nodes. 
> XE_RESET_FAILED_UEVENT is at pci node of xe device whereas XE_GSC_HW_HEALTH_UEVENT
> Is at device node.
the reset that you expect here to recover the device is a PCIe level reset same as in
XE_RESET_FAILED_UEVENTso why should this be with drm device node.

also the uevent doesn't seem to  convey the cause.

with XE_GSC_HW_HEALTH_UEVENT userspace will see:

DEVICE_STATUS=1

RESET_REQUIRED=1

TILE_ID=0

while for XE_RESET_FAILED_UEVENT:

DEVICE_STATUS=NEEDS_RESET

RESET_REQUIRED=1

TILE_ID=0

GT_ID=0

I would rather say we define one UEVENT UAPI

XE_RESET_REQUIRED "RESET_REQUIRED"

add event specific details like:

CSC_HW_ERROR = 1

or

GT_RESET_FAILED = 1

or like RESET_REASON="CSC_HW_ERROR/GT_RESET_FAILED"

and add additional details like tile and GT.

Thanks,
Aravind.
>
> BR
> Himal 
>> -Brian
>>
>>
>>> +
>>>   /**
>>>    * DOC: uevent generated by xe on it's pci node.
>>>    *
