Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0359FC02198
	for <intel-xe@archiver.kernel.org>; Sat, 14 Sep 2024 14:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F4610E2B8;
	Sat, 14 Sep 2024 14:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2wcYUiv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80CA10E2B8
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Sep 2024 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726322845; x=1757858845;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pjARW9RUW8SYIhOiFhkn7/bUAWjbkw3MR733Eq0hyiU=;
 b=V2wcYUiv9EvUpWPZuTHn2ZrsfVpAJoV1MHCKOzpccm1csj3xgzT3kN1x
 cVh1vBvPHKB24zeiRcIPwfdsJnmGO8gHd4TQg7AiRfEQ9qdf2psUP0NIf
 EzQsvkGIDK+2RI1q22VZ4ULFt98pmHtWPTzRFEL06XUftyiDILeRO/ghR
 C4uqSaComq8ImEV11Cuqc0AgtmQAU/R2Muj6eD6U0FNOPDVfJc8f+I2eP
 szm0x6VF42upGFihHhY4RG9fxMyf4qH8BTqjkqRxTI/379Em6oEmma05O
 xjc6iXeC4uDT8UQUhfUMEFqRybs1HnNGm5bsxiccKwTViYufgQ3tROvnh A==;
X-CSE-ConnectionGUID: OQhAv1jaRVmy5zpRL4yWnA==
X-CSE-MsgGUID: WWEo5Gn3RtW0K0/KKz48pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="42728943"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; d="scan'208";a="42728943"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2024 07:07:24 -0700
X-CSE-ConnectionGUID: OWmV7Y/UQQ61Azbr/eOrtw==
X-CSE-MsgGUID: V90EyAzrRCizqEB/yAupMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; d="scan'208";a="68646839"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2024 07:07:22 -0700
Received: from [10.245.84.117] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.84.117])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B392C2FC41;
 Sat, 14 Sep 2024 15:07:20 +0100 (IST)
Message-ID: <cdc56d04-2df0-44ce-a446-beaee51c76f3@intel.com>
Date: Sat, 14 Sep 2024 16:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe: memirq handler changes
To: Ilia Levi <illevi@habana.ai>, intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, jonathan.cavitt@intel.com,
 niranjana.vishwanathapura@intel.com, koby.elbaz@intel.com,
 yaron.avizrat@intel.com
References: <20240912085438.737015-1-illevi@habana.ai>
 <20240912085438.737015-4-illevi@habana.ai>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240912085438.737015-4-illevi@habana.ai>
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



On 12.09.2024 10:54, Ilia Levi wrote:
> From: Ilia Levi <ilia.levi@intel.com>
> 
> This patch exposes an interrupt processing handler for a single hw engine.

nit: don't start commit message with "This patch ..."

> This handler also caters for the MSI-X mode, where the hardware engines
> report interrupt source and status to the offset of engine instance zero.
> Refactored code to use this handler from the VF use-case as well.

s/Refactored/Refactor ?

> 
> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 19 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_memirq.c    | 31 ++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_memirq.h    |  1 +
>  3 files changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index a7abc4b67e67..5e82ebb8eb58 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -460,6 +460,20 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  	xe_rtp_process_to_sr(&ctx, engine_entries, &hwe->reg_sr);
>  }
>  
> +static const struct engine_info *find_engine_info(enum xe_engine_class class, int instance)
> +{
> +	const struct engine_info *info;
> +	enum xe_hw_engine_id id;
> +
> +	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
> +		info = &engine_infos[id];
> +		if (info->class == class && info->instance == instance)
> +			return info;
> +	}
> +
> +	return NULL;
> +}
> +
>  static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  				 enum xe_hw_engine_id id)
>  {
> @@ -479,7 +493,10 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	hwe->class = info->class;
>  	hwe->instance = info->instance;
>  	hwe->mmio_base = info->mmio_base;
> -	hwe->irq_offset = info->irq_offset;
> +	/* For MSI-X, hw engines report to offset of engine instance zero */
> +	hwe->irq_offset = xe_device_has_msix(gt_to_xe(gt)) ?
> +		find_engine_info(info->class, 0)->irq_offset :
> +		info->irq_offset;

since find_engine_info() can return NULL you shouldn't use it
unconditionally as that will upset static code analyzers

maybe easiest way would be to introduce small helper:

	static u16 get_msix_irq_offset(c)
	{
		const struct engine_info *info = find_engine_info(c, 0);

		return info ? info->irq_offset ? 0;
	}

and then:

	/* enforces that instance 0 is always defined */
	xe_gt_assert(gt, find_engine_info(info->class, 0));

	hwe->irq_offset = xe_device_has_msix(xe) ?
		get_msix_irq_offset(info->class) : info->irq_offset;

>  	hwe->domain = info->domain;
>  	hwe->name = info->name;
>  	hwe->fence_irq = &gt->fence_irq[info->class];
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index c590dc0dd9f1..f78240b05631 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -404,6 +404,28 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>  }
>  
> +/**
> + * xe_memirq_hwe_handler - Check and process interrupts for a specific HW engine.
> + * @memirq: the &xe_memirq
> + * @hwe: the hw engine to process
> + *
> + * This function reads and dispatches `Memory Based Interrupts` for the provided HW engine.
> + */
> +void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
> +{
> +	u16 offset = hwe->irq_offset;
> +	u16 instance = hw_reports_to_instance_zero(memirq) ? hwe->instance : 0;
> +	struct iosys_map src_offset = IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +							    XE_MEMIRQ_SOURCE_OFFSET(instance));
> +
> +	if (memirq_received(memirq, &src_offset, offset, "SRC")) {
> +		struct iosys_map status_offset =
> +			IOSYS_MAP_INIT_OFFSET(&memirq->bo->vmap,
> +					      XE_MEMIRQ_STATUS_OFFSET(instance) + offset * SZ_16);
> +		memirq_dispatch_engine(memirq, &status_offset, hwe);
> +	}
> +}
> +
>  /**
>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>   * @memirq: the &xe_memirq
> @@ -431,13 +453,8 @@ void xe_memirq_handler(struct xe_memirq *memirq)
>  		if (gt->tile != tile)
>  			continue;
>  
> -		for_each_hw_engine(hwe, gt, id) {
> -			if (memirq_received(memirq, &memirq->source, hwe->irq_offset, "SRC")) {
> -				map = IOSYS_MAP_INIT_OFFSET(&memirq->status,
> -							    hwe->irq_offset * SZ_16);
> -				memirq_dispatch_engine(memirq, &map, hwe);
> -			}
> -		}
> +		for_each_hw_engine(hwe, gt, id)
> +			xe_memirq_hwe_handler(memirq, hwe);
>  	}
>  
>  	/* GuC and media GuC (if present) must be checked separately */
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> index 15efae2a7a55..06130650e9d6 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -20,6 +20,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq);
>  
>  void xe_memirq_reset(struct xe_memirq *memirq);
>  void xe_memirq_postinstall(struct xe_memirq *memirq);
> +void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe);
>  void xe_memirq_handler(struct xe_memirq *memirq);
>  
>  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
