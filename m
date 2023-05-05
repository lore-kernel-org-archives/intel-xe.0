Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F103C77B75
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 16:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DEC10E044;
	Fri,  5 May 2023 16:55:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423F210E044
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 16:55:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FA1F63F5D;
 Fri,  5 May 2023 16:55:33 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 8060FC433EF;
 Fri,  5 May 2023 16:55:31 +0000 (UTC)
Date: Fri, 5 May 2023 12:55:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFU1ANfhoovA6r7I@rdvivi-mobl4>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429062332.354139-3-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/7] drm/xe/guc: Handle RCU_MODE as masked
 from definition
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

On Fri, Apr 28, 2023 at 11:23:27PM -0700, Lucas De Marchi wrote:
> guc_mmio_regset_write() had a flags for the registers to be added to the
> GuC's regset list. The only register actually using that was RCU_MODE,
> but it was setting the flags to a bogus value. From
> struct xe_guc_fwif.h,
> 
> 	#define GUC_REGSET_MASKED               BIT(0)
> 	#define GUC_REGSET_MASKED_WITH_VALUE    BIT(2)
> 	#define GUC_REGSET_RESTORE_ONLY         BIT(3)
> 
> Cross checking with i915, the only flag to set in RCU_MODE is
> GUC_REGSET_MASKED. That can be done automatically from the register, as
> long as the definition is correct.
> 
> Add the XE_REG_OPTION_MASKED annotation to RCU_MODE and kill the "flags"
> field in guc_mmio_regset_write(): guc_mmio_regset_write_one() can decide
> that based on the register being passed.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I'm still trying to get familiarized with XE_REG_OPTION_MASKED
but this patch looks right to me:


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +-
>  drivers/gpu/drm/xe/xe_guc_ads.c      | 31 +++++++++++-----------------
>  2 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 68e89d71cd1c..4d87f1fe010d 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -325,7 +325,7 @@
>  #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>  
> -#define RCU_MODE				XE_REG(0x14800)
> +#define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>  
>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 676137dcb510..84c2d7c624c6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -422,12 +422,12 @@ static void guc_capture_list_init(struct xe_guc_ads *ads)
>  
>  static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
>  				      struct iosys_map *regset_map,
> -				      u32 reg, u32 flags,
> +				      struct xe_reg reg,
>  				      unsigned int n_entry)
>  {
>  	struct guc_mmio_reg entry = {
> -		.offset = reg,
> -		.flags = flags,
> +		.offset = reg.reg,
> +		.flags = reg.masked ? GUC_REGSET_MASKED : 0,
>  		/* TODO: steering */
>  	};
>  
> @@ -446,40 +446,33 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  	unsigned long idx;
>  	unsigned count = 0;
>  	const struct {
> -		u32 reg;
> -		u32 flags;
> +		struct xe_reg reg;
>  		bool skip;
>  	} *e, extra_regs[] = {
> -		{ .reg = RING_MODE(hwe->mmio_base).reg,		},
> -		{ .reg = RING_HWS_PGA(hwe->mmio_base).reg,		},
> -		{ .reg = RING_IMR(hwe->mmio_base).reg,			},
> -		{ .reg = RCU_MODE.reg, .flags = 0x3,
> -		  .skip = hwe != hwe_rcs_reset_domain			},
> +		{ .reg = RING_MODE(hwe->mmio_base),			},
> +		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
> +		{ .reg = RING_IMR(hwe->mmio_base),			},
> +		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain	},
>  	};
>  	u32 i;
>  
>  	BUILD_BUG_ON(ARRAY_SIZE(extra_regs) > ADS_REGSET_EXTRA_MAX);
>  
> -	xa_for_each(&hwe->reg_sr.xa, idx, entry) {
> -		u32 flags = entry->reg.masked ? GUC_REGSET_MASKED : 0;
> -
> -		guc_mmio_regset_write_one(ads, regset_map, idx, flags, count++);
> -	}
> +	xa_for_each(&hwe->reg_sr.xa, idx, entry)
> +		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>  
>  	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>  		if (e->skip)
>  			continue;
>  
> -		guc_mmio_regset_write_one(ads, regset_map,
> -					  e->reg, e->flags, count++);
> +		guc_mmio_regset_write_one(ads, regset_map, e->reg, count++);
>  	}
>  
>  	/* Wa_1607983814 */
>  	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
>  		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
>  			guc_mmio_regset_write_one(ads, regset_map,
> -						  LNCFCMOCS(i).reg, 0,
> -						  count++);
> +						  LNCFCMOCS(i), count++);
>  		}
>  	}
>  
> -- 
> 2.40.1
> 
