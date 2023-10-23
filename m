Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B45C004C0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 15:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F7510E20E;
	Mon, 23 Oct 2023 15:15:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9696B10E20E
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698074125; x=1729610125;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KGhbBD5mbwu0LbX6iZFAzHvV0RMAJcV1YmqzJqeywFA=;
 b=gt42KhDFIb8BX5r7KZsE0R4WBRu1EEfBNIjh9P/JrmaZ2l5K0dfKckxh
 xuletI4z3gZX6DJToDOWs88cEbf0GhvD0DJPcj6e+J8B9zClA/Gr6SPJG
 pZxx3hkMgPEfcuS/VEddm9i78ES1w8v+2xud9mV/AbE0Uv9I4YCVZmmT3
 Mq2yQHJR/H1QQmdoJ6z3aaU60ZgsOT9dqVruioc0oj4S/njzen3PiXujt
 d6o9/G1y6tb0LD9aHlualYLVRgfipkB0HtBNvGHTiHwk+pcYkLgNhkV/q
 wHjyyC4ySqh7tKuzWFxIM/8ZQz1zamPJT2JUVPRcw3PNfVEUgZl1bV7wH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="386675427"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="386675427"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 08:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="787483828"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="787483828"
Received: from evlad-mobl.ger.corp.intel.com (HELO localhost) ([10.252.47.180])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 08:15:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231017092908.84177-1-aravind.iddamsetty@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231017092908.84177-1-aravind.iddamsetty@linux.intel.com>
Date: Mon, 23 Oct 2023 18:15:18 +0300
Message-ID: <878r7tbcah.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/pmu: Drop interrupt pmu event
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
 Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 17 Oct 2023, Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com> wrote:
> Drop interrupt event from PMU as that is not useful and not being used
> by any UMD.

Is the i915 interrupt event used by anyone? Could it be dropped too?

BR,
Jani.

>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c       | 18 ------------------
>  drivers/gpu/drm/xe/xe_pmu.c       |  9 ---------
>  drivers/gpu/drm/xe/xe_pmu_types.h |  8 --------
>  include/uapi/drm/xe_drm.h         | 13 ++++++-------
>  4 files changed, 6 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 61350ed32c61..29f539f1b94b 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -27,20 +27,6 @@
>  #define IIR(offset)				XE_REG(offset + 0x8)
>  #define IER(offset)				XE_REG(offset + 0xc)
>  
> -/*
> - * Interrupt statistic for PMU. Increments the counter only if the
> - * interrupt originated from the GPU so interrupts from a device which
> - * shares the interrupt line are not accounted.
> - */
> -static __always_inline void xe_pmu_irq_stats(struct xe_device *xe)
> -{
> -	/*
> -	 * A clever compiler translates that into INC. A not so clever one
> -	 * should at least prevent store tearing.
> -	 */
> -	WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1);
> -}
> -
>  static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
>  {
>  	u32 val = xe_mmio_read32(mmio, reg);
> @@ -361,8 +347,6 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
>  
>  	xe_display_irq_enable(xe, gu_misc_iir);
>  
> -	xe_pmu_irq_stats(xe);
> -
>  	return IRQ_HANDLED;
>  }
>  
> @@ -459,8 +443,6 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	dg1_intr_enable(xe, false);
>  	xe_display_irq_enable(xe, gu_misc_iir);
>  
> -	xe_pmu_irq_stats(xe);
> -
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index abfc0b3aeac4..318bbc9c1c9b 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -114,10 +114,6 @@ config_status(struct xe_device *xe, u64 config)
>  		return -ENOENT;
>  
>  	switch (config_counter(config)) {
> -	case XE_PMU_INTERRUPTS(0):
> -		if (gt_id)
> -			return -ENOENT;
> -		break;
>  	case XE_PMU_RENDER_GROUP_BUSY(0):
>  	case XE_PMU_COPY_GROUP_BUSY(0):
>  	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> @@ -181,13 +177,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>  	const unsigned int gt_id = config_gt_id(event->attr.config);
>  	const u64 config = event->attr.config;
>  	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> -	struct xe_pmu *pmu = &xe->pmu;
>  	u64 val;
>  
>  	switch (config_counter(config)) {
> -	case XE_PMU_INTERRUPTS(0):
> -		val = READ_ONCE(pmu->irq_count);
> -		break;
>  	case XE_PMU_RENDER_GROUP_BUSY(0):
>  	case XE_PMU_COPY_GROUP_BUSY(0):
>  	case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
> @@ -361,7 +353,6 @@ create_event_attributes(struct xe_pmu *pmu)
>  		const char *unit;
>  		bool global;
>  	} events[] = {
> -		__global_event(0, "interrupts", NULL),
>  		__event(1, "render-group-busy", "ns"),
>  		__event(2, "copy-group-busy", "ns"),
>  		__event(3, "media-group-busy", "ns"),
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> index 4ccc7e9042f6..9cadbd243f57 100644
> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -51,14 +51,6 @@ struct xe_pmu {
>  	 *
>  	 */
>  	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> -	/**
> -	 * @irq_count: Number of interrupts
> -	 *
> -	 * Intentionally unsigned long to avoid atomics or heuristics on 32bit.
> -	 * 4e9 interrupts are a lot and postprocessing can really deal with an
> -	 * occasional wraparound easily. It's 32bit after all.
> -	 */
> -	unsigned long irq_count;
>  	/**
>  	 * @events_attr_group: Device events attribute group.
>  	 */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 24bf8f0f52e8..be43ef0b92e6 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1041,7 +1041,7 @@ struct drm_xe_vm_madvise {
>   * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>   * particular event.
>   *
> - * For example to open the XE_PMU_INTERRUPTS(0):
> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>   *
>   * .. code-block:: C
>   *
> @@ -1055,7 +1055,7 @@ struct drm_xe_vm_madvise {
>   *	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>   *	attr.use_clockid = 1;
>   *	attr.clockid = CLOCK_MONOTONIC;
> - *	attr.config = XE_PMU_INTERRUPTS(0);
> + *	attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>   *
>   *	fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>   */
> @@ -1068,11 +1068,10 @@ struct drm_xe_vm_madvise {
>  #define ___XE_PMU_OTHER(gt, x) \
>  	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>  
> -#define XE_PMU_INTERRUPTS(gt)			___XE_PMU_OTHER(gt, 0)
> -#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> -#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> -#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 3)
> -#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 4)
> +#define XE_PMU_RENDER_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 0)
> +#define XE_PMU_COPY_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 1)
> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)		___XE_PMU_OTHER(gt, 2)
> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)	___XE_PMU_OTHER(gt, 3)
>  
>  #if defined(__cplusplus)
>  }

-- 
Jani Nikula, Intel
