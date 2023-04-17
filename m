Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C65C77B78
	for <intel-xe@archiver.kernel.org>; Mon, 17 Apr 2023 21:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D769010E618;
	Mon, 17 Apr 2023 21:41:57 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E4710E618
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Apr 2023 21:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681767716; x=1713303716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/U0DcWe4/F2pngl1fxVCHLv7fMcA+RVlh+OTvV8waa8=;
 b=HrsEem1qgakZK5955scdjLRXMOnc/EH4Ksxh2p3Jqviq6zuk3bjY9S89
 YShvkDHYDwRPLaZ0m1yPEDVQjCPuaj0mV1CkaIzzbIy3NRc6I5G0roEtK
 mSnSHgDbnBG2tBVnqOHlFlGaHPBxaM17sI/7Szj8Ln5P9hI4Q5qTyTgq0
 Nia6vrTTBPtJZ4BoaGJ5aFsg/vkVIrxOS+sBfo0hCANarqBKRkBZwmO0L
 vv38PlBenayY+ocTkehl6+XxW+8+YK/B5HoQ3vFH8TFlRYSE8LruPC/RV
 aAJRDypp4hwoIA9c7Zm+eAFIvF/GSmhLrcklacWsutXLdjJ0BsrIneHQb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="343766296"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="343766296"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 14:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="721281597"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; d="scan'208";a="721281597"
Received: from sslose-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.56.168])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 14:41:52 -0700
Date: Mon, 17 Apr 2023 23:41:28 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZD29CHxeQSO+iwnM@ashyti-mobl2.lan>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412225248.3229571-2-matthew.d.roper@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 1/8] drm/xe/irq: Cleanup media GT
 interrupt flow
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matt,

On Wed, Apr 12, 2023 at 03:52:41PM -0700, Matt Roper wrote:
> Although platforms like MTL have media exposed as a separate GT, it's
> important to recognize that this second GT is *not* a tile as we see in
> platforms like PVC.  The interrupt registers (including the ones related
> to GT interrupts) reside in the SGunit so there's only a single instance
> on the entire platform; they are not replicated per-GT.  Thus all media
> interrupts are delivered together with the interrupts for the primary
> GT.
> 
> v2:
>  - Also update reset & postinstall routines to skip media GT.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

just a couple of thougths...

> ---
>  drivers/gpu/drm/xe/xe_irq.c | 79 ++++++++++++++++++++++++++++++-------
>  1 file changed, 65 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 13f9f220bca0..7e78eecba62a 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -232,7 +232,40 @@ gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
>  	}
>  }
>  
> -static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
> +static struct xe_gt *find_media_gt(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	int id;
> +
> +	for_each_gt(gt, xe, id)
> +		if (xe_gt_is_media_type(gt))
> +			return gt;
> +
> +	drm_WARN_ONCE(&xe->drm, 1, "Cannot find media GT for interrupt handling\n");
> +	return xe_device_get_gt(xe, 0);

isn't it easier if:

	return ERR_PTR(-ENODEV);

...

> +}
> +
> +static struct xe_gt *pick_engine_gt(struct xe_gt *full_gt,
> +				    enum xe_engine_class class,
> +				    unsigned int instance)
> +{
> +	struct xe_device *xe = gt_to_xe(full_gt);
> +
> +	if (MEDIA_VER(xe) < 13)
> +		return full_gt;
> +
> +	if (class == XE_ENGINE_CLASS_VIDEO_DECODE ||
> +	    class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
> +		return find_media_gt(xe);
> +
> +	if (class == XE_ENGINE_CLASS_OTHER &&
> +	    instance == OTHER_MEDIA_GUC_INSTANCE)
> +		return find_media_gt(xe);
> +
> +	return full_gt;

...
	xe_gt = find_media_gt(xe)

	return PTR_ERR(xe_gt) == -ENODEV ? full_gt : xe_gt;

> +}
> +
> +static void gt_irq_handler(struct xe_device *xe, struct xe_gt *full_gt,
>  			   u32 master_ctl, long unsigned int *intr_dw,
>  			   u32 *identity)
>  {
> @@ -241,27 +274,33 @@ static void gt_irq_handler(struct xe_device *xe, struct xe_gt *gt,
>  	enum xe_engine_class class;
>  	struct xe_hw_engine *hwe;
>  
> +	/*
> +	 * Media GT interrupts are delivered on the primary GT.  This function
> +	 * should never be called on the media GT itself.
> +	 */
> +	drm_WARN_ON_ONCE(&xe->drm, xe_gt_is_media_type(full_gt));

I think this is too drastic, what if...

> +
>  	spin_lock(&xe->irq.lock);
>  
>  	for (bank = 0; bank < 2; bank++) {

...
	if (xe_gt_is_media_type(full_gt))
		goto media_engine;

...

>  		if (!(master_ctl & GT_DW_IRQ(bank)))
>  			continue;
>  
> -		if (!xe_gt_is_media_type(gt)) {
> -			intr_dw[bank] =
> -				xe_mmio_read32(gt, GT_INTR_DW(bank).reg);
> -			for_each_set_bit(bit, intr_dw + bank, 32)
> -				identity[bit] = gt_engine_identity(xe, gt,
> -								   bank, bit);
> -			xe_mmio_write32(gt, GT_INTR_DW(bank).reg,
> -					intr_dw[bank]);
> -		}
> +		intr_dw[bank] = xe_mmio_read32(full_gt, GT_INTR_DW(bank).reg);
> +		for_each_set_bit(bit, intr_dw + bank, 32)
> +			identity[bit] = gt_engine_identity(xe, full_gt,
> +							   bank, bit);
> +		xe_mmio_write32(full_gt, GT_INTR_DW(bank).reg, intr_dw[bank]);

...
	media_enige:

And we avoid all the above "find_media_gt". We use for_each_gt
for GT's and we consider the media engine like an "incomplete"
GT, instead of jumping from GT to GT.

Besides, looking in the future, how is this working with two
tiles and one media GT?

Nevertheless, the patch is correct and I confirm my r-b. My
suggestions are just cosmetics.

Andi

>  
>  		for_each_set_bit(bit, intr_dw + bank, 32) {
> +			struct xe_gt *gt;
> +
>  			class = INTR_ENGINE_CLASS(identity[bit]);
>  			instance = INTR_ENGINE_INSTANCE(identity[bit]);
>  			intr_vec = INTR_ENGINE_INTR(identity[bit]);
>  
> +			gt = pick_engine_gt(full_gt, class, instance);
> +
>  			if (class == XE_ENGINE_CLASS_OTHER) {
>  				gt_other_irq_handler(gt, instance, intr_vec);
>  				continue;
> @@ -369,11 +408,17 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> +		/*
> +		 * The media GT isn't a tile, so its interrupts are delivered
> +		 * as part of the primary GT's flow.
> +		 */
> +		if (xe_gt_is_media_type(gt))
> +			continue;
> +
>  		if ((master_tile_ctl & DG1_MSTR_TILE(gt->info.vram_id)) == 0)
>  			continue;
>  
> -		if (!xe_gt_is_media_type(gt))
> -			master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
> +		master_ctl = xe_mmio_read32(gt, GFX_MSTR_IRQ.reg);
>  
>  		/*
>  		 * We might be in irq handler just when PCIe DPC is initiated
> @@ -386,8 +431,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  			return IRQ_HANDLED;
>  		}
>  
> -		if (!xe_gt_is_media_type(gt))
> -			xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
> +		xe_mmio_write32(gt, GFX_MSTR_IRQ.reg, master_ctl);
> +
>  		gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
>  
>  		/*
> @@ -473,6 +518,9 @@ static void xe_irq_reset(struct xe_device *xe)
>  	u8 id;
>  
>  	for_each_gt(gt, xe, id) {
> +		if (xe_gt_is_media_type(gt))
> +			continue;
> +
>  		if (GRAPHICS_VERx100(xe) >= 1210)
>  			dg1_irq_reset(gt);
>  		else
> @@ -486,6 +534,9 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> +	if (xe_gt_is_media_type(gt))
> +		return;
> +
>  	if (GRAPHICS_VERx100(xe) >= 1210)
>  		dg1_irq_postinstall(xe, gt);
>  	else
> -- 
> 2.39.2
