Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E986C7EE22
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 16:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08B210E044;
	Fri,  5 May 2023 16:55:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439EA10E638
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 16:55:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6D23612A8;
 Fri,  5 May 2023 16:55:48 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id A6148C433D2;
 Fri,  5 May 2023 16:55:46 +0000 (UTC)
Date: Fri, 5 May 2023 12:55:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFU1EHrK03hNawMW@rdvivi-mobl4>
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429062332.354139-2-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/7] fixup! drm/xe: Drop gen afixes from
 registers
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

On Fri, Apr 28, 2023 at 11:23:26PM -0700, Lucas De Marchi wrote:
> Maybe an abuse of fixup, but easy enough not to deserve a separate
> commit.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 566b62815dab..795302bcd3ae 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -573,7 +573,7 @@ void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
>  		hw_engine_mmio_read32(hwe, IPEHR(0).reg));
>  
>  	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> -		drm_printf(p, "\tGEN12_RCU_MODE: 0x%08x\n",
> +		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>  			xe_mmio_read32(hwe->gt, RCU_MODE.reg));
>  
>  }
> -- 
> 2.40.1
> 
