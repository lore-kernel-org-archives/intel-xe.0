Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D44C77B7F
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 13:08:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B2D10E5EF;
	Fri,  5 May 2023 13:08:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5899C10E5EF
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 13:08:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57A616130A;
 Fri,  5 May 2023 13:08:50 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 7B4ADC433D2;
 Fri,  5 May 2023 13:08:48 +0000 (UTC)
Date: Fri, 5 May 2023 09:08:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Nirmoy Das <nirmoy.das@intel.com>
Message-ID: <ZFT/0xa2fvYMDv+g@rdvivi-mobl4>
References: <20230505124019.11268-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505124019.11268-1-nirmoy.das@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: Do not sleep in atomic
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 02:40:19PM +0200, Nirmoy Das wrote:
> Set atomic in xe_mmio_wait32() otherwise we would
> be scheduling in atomic context.
> 
> Fixes: b7bcef224bdd ("drm/xe: Remove i915_utils dependency from xe_pcode.")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 55b240a5eaa7..300b4a6968a9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -424,7 +424,7 @@ static void mcr_lock(struct xe_gt *gt)
>  	 */
>  	if (GRAPHICS_VERx100(xe) >= 1270)
>  		ret = xe_mmio_wait32(gt, STEER_SEMAPHORE, 0, 0x1, 10, NULL,
> -				     false);
> +				     true);
>  
>  	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
>  }
> -- 
> 2.39.0
> 
