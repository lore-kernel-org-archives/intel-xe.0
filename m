Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6C2CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 03:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A698710E402;
	Thu, 12 Oct 2023 03:11:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E3010E402
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 03:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697080268; x=1728616268;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JvMHgVDsLgyMRPZ0zNIYGh5ggWPS2GVd1C4hx3vSDH8=;
 b=lTwKKvYdq22M0tafzBAH/45Azizf45A0fos3JuzmWPQLD2FWSqkdq5G2
 qK5Qj8mfOFWABflNtsNcb2jig8V1fGKgJmS4K8l+8vaP8YYcwdPRPYmML
 3RAYea4zjkG5nft8bykRRHCtW6xabhPhmx2g5FnPWCSdXe+m2dru4JOCT
 iV8h35GMaCMCvx3UYpOaSl5FzVR5dn19kj2wILgRjx9YTsm3NqA131M+g
 TBuDlsBLYLXwIisbMpjA6oU44LBRTfyvGwuJtxLRPgVQRZGwFAEcSOvv6
 j9x/zKfZAB8v367LG/IgoMiMRhVUkzGb90kfP2jT+F0ZTFlRJpq+vZmYs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="365094795"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="365094795"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 20:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="819967924"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="819967924"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 20:10:05 -0700
Message-ID: <9a320ea2-94c0-dd15-d58e-d18dc8a9e5a2@linux.intel.com>
Date: Thu, 12 Oct 2023 08:42:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-7-himal.prasad.ghimiray@intel.com>
 <d2e6ffcb-9a7c-13c2-f48c-027595e90631@linux.intel.com>
 <MW4PR11MB70569F78CD647F840CD2DF0BB3CCA@MW4PR11MB7056.namprd11.prod.outlook.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <MW4PR11MB70569F78CD647F840CD2DF0BB3CCA@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 06/11] drm/xe: Notify userspace about GSC HW
 errors.
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


On 11/10/23 12:55, Ghimiray, Himal Prasad wrote:
>
>> -----Original Message-----
>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Sent: 11 October 2023 12:53
>> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH 06/11] drm/xe: Notify userspace about GSC
>> HW errors.
>>
>>
>> On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
>>> Send uevent incase of nonfatal errors reported by gsc.
>>>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>>  drivers/gpu/drm/xe/xe_hw_error.c     | 20 ++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_hw_error.h     |  3 ++-
>>>  drivers/gpu/drm/xe/xe_irq.c          |  4 ++++
>>>  include/uapi/drm/xe_drm.h            |  9 +++++++++
>>>  5 files changed, 38 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 6aa4f4801d81..ff476a167be4 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -179,6 +179,9 @@ struct xe_tile {
>>>  	struct tile_hw_errors {
>>>  		unsigned long count[XE_TILE_HW_ERROR_MAX];
>>>  	} errors;
>>> +
>>> +	/** @gsc_hw_err_work: worker for uevent to report GSC HW errors
>> */
>>> +	struct work_struct gsc_hw_err_work;
>>>  };
>>>
>>>  /**
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>> index eb76b8e6a338..76ae12df013c 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>> @@ -3,6 +3,8 @@
>>>   * Copyright © 2023 Intel Corporation
>>>   */
>>>
>>> +#include <drm/xe_drm.h>
>>> +
>>>  #include "xe_hw_error.h"
>>>
>>>  #include "regs/xe_regs.h"
>>> @@ -366,6 +368,22 @@ xe_gt_hw_error_handler(struct xe_gt *gt, const
>> enum hardware_error hw_err)
>>>  		xe_gt_hw_error_status_reg_handler(gt, hw_err);  }
>>>
>>> +void xe_gsc_hw_error_work(struct work_struct *work) {
>>> +	struct xe_tile *tile = container_of(work, typeof(*tile),
>> gsc_hw_err_work);
>>> +	char *csc_hw_error_event[4];
>>> +
>>> +	csc_hw_error_event[0] = XE_GSC_HW_HEALTH_UEVENT "=1";
>>> +	csc_hw_error_event[1] = "RESET_REQUIRED=1";
>>> +	csc_hw_error_event[2] = kasprintf(GFP_KERNEL, "TILE_ID=%d", tile-
>>> id);
>>> +	csc_hw_error_event[3] = NULL;
>>> +
>>> +	kobject_uevent_env(&tile->xe->drm.primary->kdev->kobj,
>> KOBJ_CHANGE,
>>> +			   csc_hw_error_event);
>>> +
>>> +	kfree(csc_hw_error_event[2]);
>>> +}
>>> +
>>>  static void
>>>  xe_gsc_hw_error_handler(struct xe_tile *tile, const enum
>>> hardware_error hw_err)  { @@ -423,6 +441,8 @@
>>> xe_gsc_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>> hw_err)
>>>  			drm_err_ratelimited(&tile_to_xe(tile)->drm,
>>>  					    HW_ERR "GSC detected %s %s
>> error, bit[%d] is set\n",
>>>  					    errmsg, hw_err_str, errbit);
>>> +
>>> +			schedule_work(&tile->gsc_hw_err_work);
>>>  		}
>>>  		tile->errors.count[indx]++;
>>>  	}
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h
>>> b/drivers/gpu/drm/xe/xe_hw_error.h
>>> index 155722a0af4c..ee7705b3343b 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>>> @@ -7,6 +7,7 @@
>>>
>>>  #include <linux/stddef.h>
>>>  #include <linux/types.h>
>>> +#include <linux/workqueue.h>
>>>
>>>  /* Error categories reported by hardware */  enum hardware_error { @@
>>> -121,5 +122,5 @@ struct xe_tile;
>>>
>>>  void xe_hw_error_irq_handler(struct xe_tile *tile, const u32
>>> master_ctl);  void xe_process_hw_errors(struct xe_device *xe);
>>> -
>>> +void xe_gsc_hw_error_work(struct work_struct *work);
>>>  #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>> index 06c9b43e2c71..285c657cc789 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>> @@ -586,6 +586,10 @@ int xe_irq_install(struct xe_device *xe)
>>>  	irq_handler_t irq_handler;
>>>  	int err, irq;
>>>
>>> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
>>> +
>>> +	INIT_WORK(&tile->gsc_hw_err_work, xe_gsc_hw_error_work);
>>> +
>>>  	irq_handler = xe_irq_handler(xe);
>>>  	if (!irq_handler) {
>>>  		drm_err(&xe->drm, "No supported interrupt handler"); diff --
>> git
>>> a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
>>> d48d8e3c898c..c45833defcc7 100644
>>> --- a/include/uapi/drm/xe_drm.h
>>> +++ b/include/uapi/drm/xe_drm.h
>>> @@ -16,6 +16,15 @@ extern "C" {
>>>   * subject to backwards-compatibility constraints.
>>>   */
>>>
>>> +/**
>>> + * DOC: uevent generated by xe on it's tile node.
>>> + *
>>> + * XE_GSC_HW_HEALTH_UEVENT - Event is generated when GSC reports
>> HW
>>> + * errors. The value supplied with the event is always
>> "RESET_REQUIRED=1".
>>> + * Additional information supplied is tile id on which error is reported.
>> what is the relevance of tile id if it always reported on tile 0 only.
> Hmm. Ya right. Any other information we would like to send ?
> Instead of DEVICE_STATUS is it ok to send GSC_HW_STATUS ?
I think RESET_REQUIRED is sufficient but may be you have to add more details
to UAPI DOC why RESET is needed.

Thanks,

Aravind.
>> Thanks,
>>
>> Aravind
>>> + */
>>> +#define XE_GSC_HW_HEALTH_UEVENT "DEVICE_STATUS"
>>> +
>>>  /**
>>>   * DOC: uevent generated by xe on it's pci node.
>>>   *
