Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FDFCDB474
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 06:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACE710E118;
	Mon, 16 Oct 2023 06:04:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E54510E118
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 06:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697436265; x=1728972265;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hKcQRI/YZqroP0L0aexTDbdSYDrWt8xzkr9z8YW8oio=;
 b=nrtlnAE3KUZeKFRFiQ+gYsa9colOLDsVLaeY5TnQBSAY8Cre9k6Tjrtc
 SvoedfSEF68V5oKDn434hnDHu7mmqR/gRW6iMi/oKBjge8ulpRWqkiEg6
 3hZNNiQy+JdiOUqSG+9H5Zk0COK/2wsSfeAsEDuvzVnIxZFfXdA6jlz21
 esFy9fAYPHUxwm6eDeQ03XTvd4OmUMAYYvbs1o9obFyW5YmWlhfOTw0Qy
 cIyLuHwslCJ1XrGtWNr+GDSQL/WhKtLnFQrFzXLX7c3UYh//ARhNM/jE/
 bdP/dnRLaFhPO6+0nxAPn/yX9wb+ZJKhYSJfW7ZOUJMJWp/nY6kq7Sy8J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382677991"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="382677991"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2023 23:04:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846280934"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; d="scan'208";a="846280934"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2023 23:04:24 -0700
Message-ID: <71fb875e-8f1a-279e-8d7c-a45b7ea2a47e@linux.intel.com>
Date: Mon, 16 Oct 2023 11:37:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231013025321.2972772-1-aravind.iddamsetty@linux.intel.com>
 <ZSmnEgxaOCw3XLAc@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <ZSmnEgxaOCw3XLAc@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/pmu: Enable PMU interface
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 14/10/23 01:52, Rodrigo Vivi wrote:
> On Fri, Oct 13, 2023 at 08:23:21AM +0530, Aravind Iddamsetty wrote:
>> Drop interrupt event from PMU as that is not useful and not being used
>> by any UMD.
> Let's make this a standalone patch instead of a fixup, and integrate
> to Francois take 2.

Ok, will make the change and resend.

Thanks,
Aravind.
>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_irq.c       | 18 ------------------
>>  drivers/gpu/drm/xe/xe_pmu.c       |  9 ---------
>>  drivers/gpu/drm/xe/xe_pmu_types.h |  8 --------
>>  include/uapi/drm/xe_drm.h         | 13 ++++++-------
>>  4 files changed, 6 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index def9369eb488..4c22b97047b3 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -27,20 +27,6 @@
>>  #define IIR(offset)				XE_REG(offset + 0x8)
>>  #define IER(offset)				XE_REG(offset + 0xc)
>>  
>> -/*
>> - * Interrupt statistic for PMU. Increments the counter only if the
>> - * interrupt originated from the GPU so interrupts from a device which
>> - * shares the interrupt line are not accounted.
>> - */
>> -static __always_inline void xe_pmu_irq_stats(struct xe_device *xe)
>> -{
>> -	/*
>> -	 * A clever compiler translates that into INC. A not so clever one
>> -	 * should at least prevent store tearing.
>> -	 */
>> -	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1);
>> -}
>> -
>>  static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
>>  {
>>  	u32 val = xe_mmio_read32(mmio, reg);
>> @@ -351,8 +337,6 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>>  
>>  	xe_display_irq_enable(xe, gu_misc_iir);
>>  
>> -	xe_pmu_irq_stats(xe);
>> -
>>  	return IRQ_HANDLED;
>>  }
>>  
>> @@ -449,8 +433,6 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>>  	dg1_intr_enable(xe, false);
>>  	xe_display_irq_enable(xe, gu_misc_iir);
>>  
>> -	xe_pmu_irq_stats(xe);
>> -
>>  	return IRQ_HANDLED;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index abfc0b3aeac4..318bbc9c1c9b 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -114,10 +114,6 @@ config_status(struct xe_device *xe, u64 config)
>>  		return -ENOENT;
>>  
>>  	switch (config_counter(config)) {
>> -	case XE_PMU_INTERRUPTS(0):
>> -		if (gt_id)
>> -			return -ENOENT;
>> -		break;
>>  	case XE_PMU_RENDER_GROUP_BUSY(0):
>>  	case XE_PMU_COPY_GROUP_BUSY(0):
>>  	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> @@ -181,13 +177,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>  	const unsigned int gt_id = config_gt_id(event->attr.config);
>>  	const u64 config = event->attr.config;
>>  	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> -	struct xe_pmu *pmu = &xe->pmu;
>>  	u64 val;
>>  
>>  	switch (config_counter(config)) {
>> -	case XE_PMU_INTERRUPTS(0):
>> -		val = READ_ONCE(pmu->irq_count);
>> -		break;
>>  	case XE_PMU_RENDER_GROUP_BUSY(0):
>>  	case XE_PMU_COPY_GROUP_BUSY(0):
>>  	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> @@ -361,7 +353,6 @@ create_event_attributes(struct xe_pmu *pmu)
>>  		const char *unit;
>>  		bool global;
>>  	} events[] = {
>> -		__global_event(0, "interrupts", NULL),
>>  		__event(1, "render-group-busy", "ns"),
>>  		__event(2, "copy-group-busy", "ns"),
>>  		__event(3, "media-group-busy", "ns"),
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index 4ccc7e9042f6..9cadbd243f57 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -51,14 +51,6 @@ struct xe_pmu {
>>  	 *
>>  	 */
>>  	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> -	/**
>> -	 * @irq_count: Number of interrupts
>> -	 *
>> -	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
>> -	 * 4e9 interrupts are a lot and postprocessing can really deal with an
>> -	 * occasional wraparound easily. It's 32bit after all.
>> -	 */
>> -	unsigned long irq_count;
>>  	/**
>>  	 * @events_attr_group: Device events attribute group.
>>  	 */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index d48d8e3c898c..b183c9693887 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1060,7 +1060,7 @@ struct drm_xe_vm_madvise {
>>   * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>>   * particular event.
>>   *
>> - * For example to open the XE_PMU_INTERRUPTS(0):
>> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>>   *
>>   * .. code-block:: C
>>   *
>> @@ -1074,7 +1074,7 @@ struct drm_xe_vm_madvise {
>>   *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>>   *	attr.use_clockid = 1;
>>   *	attr.clockid = CLOCK_MONOTONIC;
>> - *	attr.config = XE_PMU_INTERRUPTS(0);
>> + *	attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>>   *
>>   *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>>   */
>> @@ -1087,11 +1087,10 @@ struct drm_xe_vm_madvise {
>>  #define ___XE_PMU_OTHER(gt, x) \
>>  	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>>  
>> -#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
>> -#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
>> -#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
>> -#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
>> -#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 0)
>> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 3)
>>  
>>  #if defined(__cplusplus)
>>  }
>> -- 
>> 2.25.1
>>
