Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CE0C7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 16:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B1410E4A5;
	Thu,  4 May 2023 16:12:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9569D10E4A5
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 16:12:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0542663557;
 Thu,  4 May 2023 16:12:25 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id F1D95C433D2;
 Thu,  4 May 2023 16:12:22 +0000 (UTC)
Date: Thu, 4 May 2023 12:12:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFPZZNTyAibWymhz@rdvivi-mobl4>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504073250.1436293-4-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 3/7] drm/xe/guc: Remove special handling for
 PVC A*
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

On Thu, May 04, 2023 at 12:32:46AM -0700, Lucas De Marchi wrote:
> The rest of the driver doesn't really support PVC before B0 stepping.
> Drop the special handling in xe_guc.c.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 89d20faced19..62b4fcf84acf 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -143,8 +143,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  
>  	/* Wa_16011759253 */
>  	/* Wa_22011383443 */
> -	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0) ||
> -	    IS_PLATFORM_STEP(xe, XE_PVC, STEP_A0, STEP_B0))
> +	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_B0))
>  		flags |= GUC_WA_GAM_CREDITS;
>  
>  	/* Wa_14014475959 */
> @@ -164,11 +163,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  
>  	/*
>  	 * Wa_2201180203
> -	 * GUC_WA_PRE_PARSER causes media workload hang for PVC A0 and PCIe
> -	 * errors. Disable this for PVC A0 steppings.
>  	 */
> -	if (GRAPHICS_VER(xe) <= 12 &&
> -	    !IS_PLATFORM_STEP(xe, XE_PVC, STEP_A0, STEP_B0))
> +	if (GRAPHICS_VER(xe) <= 12)
>  		flags |= GUC_WA_PRE_PARSER;
>  
>  	/* Wa_16011777198 */
> @@ -180,9 +176,6 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	/*
>  	 * Wa_22012727170
>  	 * Wa_22012727685
> -	 *
> -	 * This WA is applicable to PVC CT A0, but causes media regressions. 
> -	 * Drop the WA for PVC.
>  	 */
>  	if (IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G10, STEP_A0, STEP_C0) ||
>  	    IS_SUBPLATFORM_STEP(xe, XE_DG2, XE_SUBPLATFORM_DG2_G11, STEP_A0,
> @@ -194,10 +187,9 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
>  
>  	/* Wa_1509372804 */
> -	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_A0, STEP_C0))
> +	if (IS_PLATFORM_STEP(xe, XE_PVC, STEP_B0, STEP_C0))
>  		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>  
> -
>  	return flags;
>  }
>  
> -- 
> 2.40.1
> 
