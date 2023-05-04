Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A62C7EE21
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 16:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8618B10E4A5;
	Thu,  4 May 2023 16:11:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D4010E4A5
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 16:11:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD21561328;
 Thu,  4 May 2023 16:11:42 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 27F80C4339B;
 Thu,  4 May 2023 16:11:41 +0000 (UTC)
Date: Thu, 4 May 2023 12:11:39 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZFPZO/4k4mGIL2sk@rdvivi-mobl4>
References: <20230504073250.1436293-1-lucas.demarchi@intel.com>
 <20230504073250.1436293-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504073250.1436293-3-lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/7] drm/xe: Fix comment on Wa_22013088509
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

On Thu, May 04, 2023 at 12:32:45AM -0700, Lucas De Marchi wrote:
> On i915 the "see comment about Wa_22013088509" referred to the comment
> in the graphics version >= 11 branch, where there were more details
> about it. From the platforms supported by xe, only PVC needs
> Wa_22013088509, but as the comment says, it's simpler to do it for all
> platforms as there is no downside.  Bring the missing comment over from
> i915 and reword it to fit xe better.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 55b240a5eaa7..02afb313bfea 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -461,9 +461,16 @@ static u32 rw_with_mcr_steering(struct xe_gt *gt, struct xe_reg_mcr reg_mcr,
>  	}
>  
>  	/*
> -	 * Always leave the hardware in multicast mode when doing reads
> -	 * (see comment about Wa_22013088509 below) and only change it
> -	 * to unicast mode when doing writes of a specific instance.
> +	 * Always leave the hardware in multicast mode when doing reads and only
> +	 * change it to unicast mode when doing writes of a specific instance.
> +	 *
> +	 * The setting of the multicast/unicast bit usually wouldn't matter for
> +	 * read operations (which always return the value from a single register
> +	 * instance regardless of how that bit is set), but some platforms may
> +	 * have workarounds requiring us to remain in multicast mode for reads,
> +	 * e.g. Wa_22013088509 on PVC.  There's no real downside to this, so
> +	 * we'll just go ahead and do so on all platforms; we'll only clear the
> +	 * multicast bit from the mask when explicitly doing a write operation.
>  	 *
>  	 * No need to save old steering reg value.
>  	 */
> -- 
> 2.40.1
> 
