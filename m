Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459E6CDB465
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 03:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E227410E401;
	Thu, 12 Oct 2023 03:02:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E093B10E401
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 03:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697079750; x=1728615750;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HdsqthNzWqbm79DnvxJygRFGPJo9MX5cYwUEKhTefeE=;
 b=Eo9+IcqgYJ4djqf5Gmy54OwBvwac5/mMXalMHFug2otiZN7iT9zwF1/W
 l/N1UAJLyF4nb7yFI+xCoPAFp8tDMHJ7qFH5k4rfhQA8nAqd3MRHUUrqX
 X053k2/Fj1fJQULgL/GonPYwM8g+g4WikHP9wYklqXmNlC9IQjN7SN0OS
 GfIEuXDQTW3qJ2kVWCjYoHpxrM74krWY7c+oW2KbL+kSczxgB6KBC/vyc
 B2Z4u3ROrq91hpOow770Tro2fnPx4HeEs2yNfy48B31bL/3WtIY6LgC3I
 ffkti5yWQlDCw6j320gdnU60nio8bYUkd/72H6p2VzjXdvObROS7bR0jg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388681077"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="388681077"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 20:02:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927807933"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="927807933"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 20:02:28 -0700
Message-ID: <921c3a4c-54c1-ed62-3fd7-9fd4ba0591b9@linux.intel.com>
Date: Thu, 12 Oct 2023 08:35:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-12-himal.prasad.ghimiray@intel.com>
 <afffc88e-6c18-75b7-a968-67574573fe9b@linux.intel.com>
 <dd3e373e-fa9e-4832-b861-fe6aceb55814@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <dd3e373e-fa9e-4832-b861-fe6aceb55814@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 11/11] drm/xe: Clear all SoC errors post warm
 reset.
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


On 11/10/23 12:29, Ghimiray, Himal Prasad wrote:
>
> On 11-10-2023 12:26, Aravind Iddamsetty wrote:
>> On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
>>> There are scenarios where there are no fatal errors reported
>>> but Non-fatal/correctable errors being reported from the SoC
>>> uncore to IEH and not propogated to SG unit. Clear all previous
>>> SoC errors post warm reset.
>> the commit msg is not very clear, how fatal error reporting is related to other errors.
> Will rephrase it as
>
> There are scenarios where there are errors being reported from the SoC
> uncore to IEH and not propagated to SG unit. Since these errors are not propagated to SG unit,
> driver wont be able to clean them as part of xe_process_hw_error. Hence clear all SoC register post
> xe_process_hw_error.
>
the scenario this patch address is only during boot up so let's mention that.

Thanks,

Aravind.

> Is it ok ?
>
>>
>> Thanks,
>> Aravind.
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_hw_error.c | 37 ++++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_hw_error.h |  1 +
>>>   drivers/gpu/drm/xe/xe_irq.c      |  1 +
>>>   3 files changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>>> index 0bcb1bea7ffb..a777c887a7be 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>> @@ -366,6 +366,43 @@ static void xe_assign_hw_err_regs(struct xe_device *xe)
>>>       }
>>>   }
>>>   +void xe_clear_all_soc_errors(struct xe_device *xe)
>>> +{
>>> +    enum hardware_error hw_err;
>>> +    u32 base, slave_base;
>>> +    struct xe_tile *tile;
>>> +    struct xe_gt *gt;
>>> +    unsigned int i;
>>> +
>>> +    base = SOC_PVC_BASE;
>>> +    slave_base = SOC_PVC_SLAVE_BASE;
>>> +
>>> +    hw_err = HARDWARE_ERROR_CORRECTABLE;
>>> +
>>> +    for_each_tile(tile, xe, i) {
>>> +        gt = tile->primary_gt;
>>> +
>>> +        while (hw_err < HARDWARE_ERROR_MAX) {
>>> +            for (i = 0; i < PVC_NUM_IEH; i++)
>>> +                xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>>> +                        ~REG_BIT(hw_err));
>>> +
>>> +            xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
>>> +                    REG_GENMASK(31, 0));
>>> +            xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
>>> +                    REG_GENMASK(31, 0));
>>> +            xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>>> +                    REG_GENMASK(31, 0));
>>> +            xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>>> +                    REG_GENMASK(31, 0));
>>> +            hw_err++;
>>> +        }
>>> +        for (i = 0; i < PVC_NUM_IEH; i++)
>>> +            xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>>> +                    (HARDWARE_ERROR_MAX << 1) + 1);
>>> +    }
>>> +}
>>> +
>>>   static void
>>>   xe_gt_hw_error_status_reg_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>>>   {
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>>> index a458a90b34a2..7ada7c97c939 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>>> @@ -219,4 +219,5 @@ struct xe_tile;
>>>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>>>   void xe_process_hw_errors(struct xe_device *xe);
>>>   void xe_gsc_hw_error_work(struct work_struct *work);
>>> +void xe_clear_all_soc_errors(struct xe_device *xe);
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>> index 285c657cc789..42a6bb45acba 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>> @@ -597,6 +597,7 @@ int xe_irq_install(struct xe_device *xe)
>>>       }
>>>         xe_process_hw_errors(xe);
>>> +    xe_clear_all_soc_errors(xe);
>>>         xe->irq.enabled = true;
>>>   
