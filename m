Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBA3C7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 17:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9AE10E3AA;
	Thu, 18 May 2023 17:51:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2267510E3AA
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 17:51:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 774426446C;
 Thu, 18 May 2023 17:51:35 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id A41FFC433A1;
 Thu, 18 May 2023 17:51:33 +0000 (UTC)
Date: Thu, 18 May 2023 13:51:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZGZlo1LHe2jHrdtq@rdvivi-mobl4>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-15-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-15-matthew.d.roper@intel.com>
Subject: Re: [Intel-xe] [PATCH 14/26] drm/xe: Move display IRQ postinstall
 out of GT function
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

On Wed, May 10, 2023 at 08:47:10PM -0700, Matt Roper wrote:
> Display interrupts are unrelated to the GT (and are also only relevant
> to the root tile).  Move the postinstall call up a level in the
> callstack.

good catch!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 806121009102..494ec5567e50 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -490,8 +490,6 @@ void xe_gt_irq_postinstall(struct xe_gt *gt)
>  		dg1_irq_postinstall(xe, gt);
>  	else
>  		xelp_irq_postinstall(xe, gt);
> -
> -	xe_display_irq_postinstall(xe, gt);
>  }
>  
>  static void xe_irq_postinstall(struct xe_device *xe)
> @@ -501,6 +499,8 @@ static void xe_irq_postinstall(struct xe_device *xe)
>  
>  	for_each_gt(gt, xe, id)
>  		xe_gt_irq_postinstall(gt);
> +
> +	xe_display_irq_postinstall(xe, xe_primary_mmio_gt(xe));
>  }
>  
>  static irq_handler_t xe_irq_handler(struct xe_device *xe)
> -- 
> 2.40.0
> 
