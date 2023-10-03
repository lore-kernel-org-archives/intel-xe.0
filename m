Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AACE75438
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 09:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8929810E029;
	Tue,  3 Oct 2023 09:23:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE6C10E029
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696324984; x=1727860984;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xdAYVo9dTSk5I+bG+JWRK2S5A7TeGjhlcJR0iO/Uch8=;
 b=DWzaXbjN35LCKeCyMd/Q8g7iUYCc5t2gmUcDUBt9cjJadJkNJcQHK1pi
 CHvcFtThglszAPyskaP3H4Pt878/9mAp8GYe9r/QCCQRHFWfOBuZ9IJpq
 +5xGodpWP1t80M6kuIVlRKfrYybpBBgINZzV8387J46B58Lj82FYbgnmL
 vAb/D08Obb4KSDmhuHqTx74asFr66Gl9/a042SigWlVQ5KfJNvY/LzSvn
 3GJGHy/dgRYMjBpHRctvUrOzbUgXN0AmqebrNrUeoYnHwAL9TKkje9LP/
 q3EYYZufMfa1/j/f9ANbhMAFscWjAInzMLhlOIkRZx/BkUwJJq41NGZgq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367879731"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="367879731"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 02:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="821170965"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; d="scan'208";a="821170965"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.28.81])
 ([10.213.28.81])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 02:22:43 -0700
Message-ID: <c8cbb865-0dc1-4e9b-a9ab-365a43eff80e@intel.com>
Date: Tue, 3 Oct 2023 11:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230927074607.3027012-1-andrzej.hajda@intel.com>
 <03993d91-737d-43ff-bd9f-d1b981caf707@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <03993d91-737d-43ff-bd9f-d1b981caf707@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: implement driver initiated
 functional reset
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



On 03.10.2023 10:14, Daniele Ceraolo Spurio wrote:
>
>
> On 9/27/2023 9:46 AM, Andrzej Hajda wrote:
>> Driver initiated functional reset (FLR) is the highest level of reset
>
> Just to be pedantic, FLR means "function-level" reset (as in PCI 
> function), and not "functional" reset. Just making the distinction 
> because the meaning is different.

OK

>
>> that we can trigger from within the driver. In contrast to PCI FLR it
>> doesn't require re-enumeration of PCI BAR. It can be useful in case
>> GT fails to reset. It is also the only way to trigger GSC reset from
>> the driver and can be used in future addition of GSC support.
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> ---
>> Hi all,
>>
>> This is initial attempt to implement Driver-FLR in xe. Implementation
>> is copied from i915. I've skipped comments, but I can re-add them if
>> requested.
>> In i915 Driver-FLR is performed on driver unload if GSC was used.
>> In xe GSC is not yet supported, but I have added trigger to perform FLR
>> in case GT fails to reset, I guess this could be proper use-case and
>> of course this is prerequisite to GSC support.
>>
>> Since this is my 1st patch to xe please be merciful in comments :)
>>
>> Regards
>> Andrzej
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 +++++
>>   drivers/gpu/drm/xe/xe_gt.c           |  2 ++
>>   drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
>>   drivers/gpu/drm/xe/xe_mmio.c         | 38 ++++++++++++++++++++++++++++
>>   4 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index e13fbbdf6929ea..769a8fd005931a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -359,6 +359,12 @@
>>   #define RCU_MODE                XE_REG(0x14800, XE_REG_OPTION_MASKED)
>>   #define   RCU_MODE_CCS_ENABLE            REG_BIT(0)
>>   +#define GU_CNTL                    XE_REG(0x101010)
>> +#define   LMEM_INIT                REG_BIT(7)
>
> this is already defined in xe_regs.h
>
>> +#define   DRIVERFLR REG_BIT(31)
>> +#define GU_DEBUG                XE_REG(0x101018)
>> +#define   DRIVERFLR_STATUS            REG_BIT(31)
>> +
>>   #define FORCEWAKE_ACK_GT            XE_REG(0x130044)
>>   #define   FORCEWAKE_KERNEL            BIT(0)
>>   #define   FORCEWAKE_USER            BIT(1)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 1aa44d4f9ac1c8..1e0b76000ed46b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -604,6 +604,8 @@ static int gt_reset(struct xe_gt *gt)
>> xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
>>                      gt_to_tile(gt)->id, gt->info.id);
>>   +    gt->needs_flr_on_fini = true;
>> +
>>       return err;
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_gt_types.h 
>> b/drivers/gpu/drm/xe/xe_gt_types.h
>> index d4310be3e1e7c8..dc194e9656abd5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -347,6 +347,9 @@ struct xe_gt {
>>           /** @oob: bitmap with active OOB workaroudns */
>>           unsigned long *oob;
>>       } wa_active;
>> +
>> +    /** @needs_flr_on_fini: requests functional reset on fini */
>> +    bool needs_flr_on_fini;
>
> The FLR is a device-level reset, so it shouldn't be tracked at the 
> GT-level (all GTs are reset when we do an FLR). In i915 we tracked the 
> uncore at the GT level so we had to work with that, but in Xe IMO 
> better to store the flag under xe->mmio.needs_flr_on_fini

It makes sense, thanks for explanation.

>
>>   };
>>     #endif
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 3ccc0af4430be4..593ecc98cdfe8a 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -4,6 +4,7 @@
>>    */
>>     #include <linux/minmax.h>
>> +#include <linux/units.h>
>>     #include "xe_mmio.h"
>>   @@ -364,9 +365,46 @@ static void xe_mmio_probe_tiles(struct 
>> xe_device *xe)
>>       }
>>   }
>>   +static void driver_initiated_flr(struct xe_gt *gt)
>> +{
>> +    const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 
>> 3s wait */
>> +    struct xe_device *xe = gt->tile->xe;
>> +    int ret;
>> +
>> +    drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>> +
>> +    ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, 
>> NULL, false);
>> +    if (ret) {
>> +        drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! 
>> %d\n", ret);
>> +        return;
>> +    }
>> +    xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
>> +    xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
>> +    ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, 
>> NULL, false);
>> +    if (ret) {
>> +        drm_err(&xe->drm, "Driver-FLR-teardown wait completion 
>> failed! %d\n", ret);
>> +        return;
>> +    }
>> +    ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, 
>> DRIVERFLR_STATUS,
>> +                 flr_timeout, NULL, false);
>> +    if (ret) {
>> +        drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! 
>> %d\n", ret);
>> +        return;
>> +    }
>> +
> This block could do with some extra blank lines and some more comments 
> to explain what each reg access does (you can copy those from i915).


I have skipped them initially as the code seemed to me already 
self-explanatory, but no objections to re-add them.

>
>> +    /* Clear sticky completion status */
>> +    xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
>> +}
>> +
>>   static void mmio_fini(struct drm_device *drm, void *arg)
>>   {
>>       struct xe_device *xe = arg;
>> +    struct xe_gt *gt;
>> +    u8 id;
>> +
>> +    for_each_gt(gt, xe, id)
>> +        if (gt->needs_flr_on_fini)
>> +            driver_initiated_flr(gt);
>
> As mentioned above, the FLR is a global reset so there is no need to 
> do it multiple times if multiple GTs have failed and require it. 
> Tracking with a global flag as suggested before should fix this as well.

OK, will fix it.
Thanks for review.

Regards
Andrzej

>
> Daniele
>
>> pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>>       if (xe->mem.vram.mapping)
>

