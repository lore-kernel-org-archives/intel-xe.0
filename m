Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AA2C77B75
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 14:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E4710E47E;
	Fri, 19 May 2023 14:49:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D877F10E47E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 14:49:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA956617CF;
 Fri, 19 May 2023 14:49:10 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 2F3CDC433D2;
 Fri, 19 May 2023 14:49:09 +0000 (UTC)
Date: Fri, 19 May 2023 10:49:07 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <ZGeMY/1NMZLIcTMb@rdvivi-mobl4>
References: <20230518215651.502159-1-gustavo.sousa@intel.com>
 <20230518215651.502159-3-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518215651.502159-3-gustavo.sousa@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Fail xe_device_create() if wq
 allocation fails
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

On Thu, May 18, 2023 at 06:56:51PM -0300, Gustavo Sousa wrote:
> Let's make sure we give the driver a valid workqueue.
> 
> While at it, also make sure to call destroy_workqueue() only if the
> workqueue is a valid one. That is necessary because xe_device_destroy()
> is indirectly called as part of the cleanup process of a failed
> xe_device_create().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4614bb791fb0..dd4a4a6e0b94 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_gem_ttm_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
>  #include <drm/xe_drm.h>
>  
>  #include "regs/xe_regs.h"
> @@ -161,7 +162,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> -	destroy_workqueue(xe->ordered_wq);
> +	if (xe->ordered_wq)
> +		destroy_workqueue(xe->ordered_wq);
> +
>  	ttm_device_fini(&xe->ttm);
>  }
>  
> @@ -211,6 +214,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	INIT_LIST_HEAD(&xe->pinned.evicted);
>  
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
> +	if (!xe->ordered_wq) {
> +		drm_err(&xe->drm, "Failed to allocate xe-ordered-wq\n");
> +		err = -ENOMEM;
> +		goto err_put;
> +	}
>  
>  	err = xe_display_create(xe);
>  	if (WARN_ON(err))
> -- 
> 2.40.1
> 
