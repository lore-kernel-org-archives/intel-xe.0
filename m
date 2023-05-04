Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65594C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 16:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4039610E133;
	Thu,  4 May 2023 16:16:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B6C10E133
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 16:15:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2B6663402;
 Thu,  4 May 2023 16:15:57 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id E610BC433D2;
 Thu,  4 May 2023 16:15:55 +0000 (UTC)
Date: Thu, 4 May 2023 12:15:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFPaOtchsqsAINOX@rdvivi-mobl4>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-5-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504073250.1436293-5-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 4/7] drm/xe: Fix Wa_22011802037 annotation
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

On Thu, May 04, 2023 at 12:32:47AM -0700, Lucas De Marchi wrote:
> It was missing one digit, so not showing up as a proper WA number. Add
> the missing number and annotate it with a FIXME as there are more to be
> implemented to consider this WA done: ensure CS is stop before doing a
> reset, wait for pending.
> 
> Also, this WA applies to platforms up to graphics version 1270 (with the
> exception of MTL A*, that are not supported in xe). Fix platform check.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 62b4fcf84acf..f7d32b744247 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -162,9 +162,11 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  		flags |= GUC_WA_DUAL_QUEUE;
>  
>  	/*
> -	 * Wa_2201180203
> +	 * Wa_22011802037:

nice catch!

> FIXME - there's more to be done than simply setting
> +	 * this flag: make sure each CS is stopped when preparing for GT reset
> +	 * and wait for pending MI_FW.

ouch, we need this! Or maybe GuC is doing this for us if we we pass the flag?

>  	 */
> -	if (GRAPHICS_VER(xe) <= 12)
> +	if (GRAPHICS_VERx100(xe) < 1270)

We need this in all the platforms including TGL from what I can see...
Why are you limiting it?

>  		flags |= GUC_WA_PRE_PARSER;
>  
>  	/* Wa_16011777198 */
> -- 
> 2.40.1
> 
