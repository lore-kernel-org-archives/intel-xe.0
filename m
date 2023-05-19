Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C4FC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 14:51:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A16210E47E;
	Fri, 19 May 2023 14:51:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F22110E5DB
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 14:51:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 89E1865839;
 Fri, 19 May 2023 14:51:32 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id D5BB4C433D2;
 Fri, 19 May 2023 14:51:30 +0000 (UTC)
Date: Fri, 19 May 2023 10:51:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <ZGeM8H4wUZkFdgmm@rdvivi-mobl4>
References: <20230518215651.502159-1-gustavo.sousa@intel.com>
 <20230518215651.502159-2-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518215651.502159-2-gustavo.sousa@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Call drmm_add_action_or_reset()
 early in xe_device_create()
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

On Thu, May 18, 2023 at 06:56:50PM -0300, Gustavo Sousa wrote:
> Otherwise no cleanup is actually done if we branch to err_put.
> 
> This works for now: currently we do know that, once inside
> xe_device_destroy(), ttm_device_init() was successful so we can safely
> call ttm_device_fini(); and, for xe->ordered_wq, there is an upcoming
> commit to check its value before calling destroy_workqueue().
> 
> However, we might need change this in the future if we have more
> initializers called that can fail in a way that we can not know which
> one was it once inside xe_device_destroy().
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f7f6a6a97757..4614bb791fb0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -187,6 +187,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (WARN_ON(err))
>  		goto err_put;
>  
> +	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
> +	if (err)
> +		goto err_put;
> +
>  	xe->info.devid = pdev->device;
>  	xe->info.revid = pdev->revision;
>  	xe->info.enable_guc = enable_guc;
> @@ -212,10 +216,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	if (WARN_ON(err))
>  		goto err_put;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
> -	if (err)
> -		goto err_put;
> -
>  	return xe;
>  
>  err_put:
> -- 
> 2.40.1
> 
