Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87345C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 17:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE8610E044;
	Fri,  5 May 2023 17:01:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A7710E044
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 17:01:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A29863F50;
 Fri,  5 May 2023 17:01:35 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 94E1BC433D2;
 Fri,  5 May 2023 17:01:33 +0000 (UTC)
Date: Fri, 5 May 2023 13:01:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFU2a1jj+FpCp5KE@rdvivi-mobl4>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-8-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429062332.354139-8-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 7/7] drm/xe: Fix indent in
 xe_hw_engine_print_state()
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

On Fri, Apr 28, 2023 at 11:23:32PM -0700, Lucas De Marchi wrote:
> Fix the indent to align with open parenthesis, following the coding
> style.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

if this lands first I change my devcoredump one...
Otherwise this will likely not get needed because I hope
that I'm fixing this there...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 66 +++++++++++++++----------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index e62662bc3a86..ca98160dc5ee 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -516,70 +516,70 @@ void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
>  		return;
>  
>  	drm_printf(p, "%s (physical), logical instance=%d\n", hwe->name,
> -		hwe->logical_instance);
> +		   hwe->logical_instance);
>  	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> -		hwe->domain,
> -		xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
> +		   hwe->domain,
> +		   xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
>  	drm_printf(p, "\tMMIO base: 0x%08x\n", hwe->mmio_base);
>  
>  	drm_printf(p, "\tHWSTAM: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_HWSTAM(0)));
> +		   hw_engine_mmio_read32(hwe, RING_HWSTAM(0)));
>  	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_HWS_PGA(0)));
> +		   hw_engine_mmio_read32(hwe, RING_HWS_PGA(0)));
>  
>  	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0)));
> +		   hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0)));
>  	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0)));
> +		   hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0)));
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe,
> +		   hw_engine_mmio_read32(hwe,
>  					 RING_EXECLIST_SQ_CONTENTS_LO(0)));
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe,
> +		   hw_engine_mmio_read32(hwe,
>  					 RING_EXECLIST_SQ_CONTENTS_HI(0)));
>  	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0)));
> +		   hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0)));
>  
>  	drm_printf(p, "\tRING_START: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_START(0)));
> +		   hw_engine_mmio_read32(hwe, RING_START(0)));
>  	drm_printf(p, "\tRING_HEAD:  0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR);
> +		   hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR);
>  	drm_printf(p, "\tRING_TAIL:  0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR);
> +		   hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR);
>  	drm_printf(p, "\tRING_CTL: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_CTL(0)));
> +		   hw_engine_mmio_read32(hwe, RING_CTL(0)));
>  	drm_printf(p, "\tRING_MODE: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_MI_MODE(0)));
> +		   hw_engine_mmio_read32(hwe, RING_MI_MODE(0)));
>  	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_MODE(0)));
> +		   hw_engine_mmio_read32(hwe, RING_MODE(0)));
>  
>  	drm_printf(p, "\tRING_IMR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_IMR(0)));
> +		   hw_engine_mmio_read32(hwe, RING_IMR(0)));
>  	drm_printf(p, "\tRING_ESR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_ESR(0)));
> +		   hw_engine_mmio_read32(hwe, RING_ESR(0)));
>  	drm_printf(p, "\tRING_EMR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EMR(0)));
> +		   hw_engine_mmio_read32(hwe, RING_EMR(0)));
>  	drm_printf(p, "\tRING_EIR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EIR(0)));
> -
> -        drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0)),
> -		hw_engine_mmio_read32(hwe, RING_ACTHD(0)));
> -        drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0)),
> -		hw_engine_mmio_read32(hwe, RING_BBADDR(0)));
> -        drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0)),
> -		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0)));
> +		   hw_engine_mmio_read32(hwe, RING_EIR(0)));
> +
> +	drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
> +		   hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0)),
> +		   hw_engine_mmio_read32(hwe, RING_ACTHD(0)));
> +	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
> +		   hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0)),
> +		   hw_engine_mmio_read32(hwe, RING_BBADDR(0)));
> +	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
> +		   hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0)),
> +		   hw_engine_mmio_read32(hwe, RING_DMA_FADD(0)));
>  
>  	drm_printf(p, "\tIPEIR: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, IPEIR(0)));
> +		   hw_engine_mmio_read32(hwe, IPEIR(0)));
>  	drm_printf(p, "\tIPEHR: 0x%08x\n\n",
> -		hw_engine_mmio_read32(hwe, IPEHR(0)));
> +		   hw_engine_mmio_read32(hwe, IPEHR(0)));
>  
>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> -			xe_mmio_read32(hwe->gt, RCU_MODE));
> +			   xe_mmio_read32(hwe->gt, RCU_MODE));
>  
>  }
>  
> -- 
> 2.40.1
> 
