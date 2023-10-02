Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2925EE7849A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 08:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF70410E221;
	Mon,  2 Oct 2023 08:11:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C385F10E21F
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 08:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696234267; x=1727770267;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tjJW81adsZ6icgyg2dELY9PlqBIIvZeHUeKkCbGyhME=;
 b=lnEs0IEZzGXjPSL/MpvCulgtL91yuDKCcSjXWJiKePy8NeOQXZPOZJR4
 00bces/GfRvmKqOLWtbAMwdPDbxHpH5cxFL/nBoFIshUPkXhtKqeDdGZf
 xgUpURc+YWL5AbGX1f+btz7Vdv4KidXeVuXO0ZDJYz2LQVDuQI/S7aFnc
 zhHwOGhZ3pWdnrQHrXGgB7K2JNb3ZczoCrAlqEwVL6M/Fbaid51z+U8eY
 fjL473jwmWlnJRDBeZHVsA4SUYbM0Blw7DKTp6k89hRnpa2kCZAwJWO58
 ZrlH1tATfTzZEKwcsfrVskj1uMaA2v9YScV1FykMuSERvng5IQaulYONU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="381484686"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="381484686"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 01:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="874281586"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="874281586"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.12.48])
 ([10.213.12.48])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 01:11:05 -0700
Message-ID: <399f4d2c-f502-46fc-b59b-1e750ee9fdf1@intel.com>
Date: Mon, 2 Oct 2023 10:11:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ofir Bitton <obitton@habana.ai>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230927074607.3027012-1-andrzej.hajda@intel.com>
 <eab66481-c899-2ee1-7c32-c9339db87417@habana.ai>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <eab66481-c899-2ee1-7c32-c9339db87417@habana.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 01.10.2023 10:50, Ofir Bitton wrote:
> On 27/09/2023 10:46, Andrzej Hajda wrote:
>> Driver initiated functional reset (FLR) is the highest level of reset
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
>>    drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 +++++
>>    drivers/gpu/drm/xe/xe_gt.c           |  2 ++
>>    drivers/gpu/drm/xe/xe_gt_types.h     |  3 +++
>>    drivers/gpu/drm/xe/xe_mmio.c         | 38 ++++++++++++++++++++++++++++
>>    4 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index e13fbbdf6929ea..769a8fd005931a 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -359,6 +359,12 @@
>>    #define RCU_MODE                            XE_REG(0x14800, XE_REG_OPTION_MASKED)
>>    #define   RCU_MODE_CCS_ENABLE                       REG_BIT(0)
>>
>> +#define GU_CNTL                                      XE_REG(0x101010)
>> +#define   LMEM_INIT                          REG_BIT(7)
>> +#define   DRIVERFLR                          REG_BIT(31)
>> +#define GU_DEBUG                             XE_REG(0x101018)
>> +#define   DRIVERFLR_STATUS                   REG_BIT(31)
>> +
>>    #define FORCEWAKE_ACK_GT                    XE_REG(0x130044)
>>    #define   FORCEWAKE_KERNEL                  BIT(0)
>>    #define   FORCEWAKE_USER                    BIT(1)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 1aa44d4f9ac1c8..1e0b76000ed46b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -604,6 +604,8 @@ static int gt_reset(struct xe_gt *gt)
>>        xe_uevent_gt_reset_failure(to_pci_dev(gt_to_xe(gt)->drm.dev),
>>                                   gt_to_tile(gt)->id, gt->info.id);
>>
>> +     gt->needs_flr_on_fini = true;
>> +
>>        return err;
>>    }
> I think this should be platform dependent and not set to true by default.

Why? Do we have xe supported hw without FLR?
This is kind-of bigger hammer solution - if GT reset fails, lets try FLR.

>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index d4310be3e1e7c8..dc194e9656abd5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -347,6 +347,9 @@ struct xe_gt {
>>                /** @oob: bitmap with active OOB workaroudns */
>>                unsigned long *oob;
>>        } wa_active;
>> +
>> +     /** @needs_flr_on_fini: requests functional reset on fini */
>> +     bool needs_flr_on_fini;
>>    };
>>
>>    #endif
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 3ccc0af4430be4..593ecc98cdfe8a 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -4,6 +4,7 @@
>>     */
>>
>>    #include <linux/minmax.h>
>> +#include <linux/units.h>
>>
>>    #include "xe_mmio.h"
>>
>> @@ -364,9 +365,46 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
>>        }
>>    }
>>
>> +static void driver_initiated_flr(struct xe_gt *gt)
>> +{
>> +     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
>> +     struct xe_device *xe = gt->tile->xe;
>> +     int ret;
>> +
>> +     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
>> +
>> +     ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
>> +     if (ret) {
>> +             drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
>> +             return;
>> +     }
>> +     xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
>> +     xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
>> +     ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
>> +     if (ret) {
>> +             drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
>> +             return;
>> +     }
>> +     ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>> +                          flr_timeout, NULL, false);
>> +     if (ret) {
>> +             drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
>> +             return;
>> +     }
>> +
>> +     /* Clear sticky completion status */
>> +     xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
>> +}
>> +
>>    static void mmio_fini(struct drm_device *drm, void *arg)
>>    {
>>        struct xe_device *xe = arg;
>> +     struct xe_gt *gt;
>> +     u8 id;
>> +
>> +     for_each_gt(gt, xe, id)
>> +             if (gt->needs_flr_on_fini)
>> +                     driver_initiated_flr(gt);
>>
>>        pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>>        if (xe->mem.vram.mapping)
> Not sure mmio_fini is the best place to put this, as this is not mmio
> related.


The reason I have put it there, is that it should be the last action 
before unmapping mmio. What place would you suggest then?

Regards
Andrzej


>
> --
> Ofir
>
>

