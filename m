Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F0EC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 15:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41B110E7A0;
	Wed,  8 Nov 2023 15:38:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FEE10E7A0
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699457909; x=1730993909;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vChcyBWahkofuGNjMrnGBkA90IRha/eFCPLpSTATo4I=;
 b=oAGhl9ZFT+KXzX888YKNJuEP4YVhTI8zcYVOnQaALqKTHdMDccpA1uzl
 zMfsM8oAurs1oWlREsXzurdRhu80GlCbtJ0A+aiUC0NKx3YnEzVfi74l8
 6vWrXd+RoM6tz+3RLwiEorXifniv4KhA64oW/kACn9TI93Owk5wfODyf9
 hKk0mt8pwzBRP6jha3eOnfy+zHyVxREVnFfVUStWUH3agEE6ZCvEvIp7+
 RthcQ+KR7Og42wHtLqkx8jRoG7Xtxq2KCTj4TvcplYrwhXQS0a9A9mT/J
 Grcq92Yu2jOOrwIjwX6AnRWaZeqoMyOV7hbEOKivVKKjxKOMn9GwTdlwa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="11345276"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="11345276"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 07:38:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="756571048"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="756571048"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 08 Nov 2023 07:38:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 Nov 2023 17:38:25 +0200
Date: Wed, 8 Nov 2023 17:38:25 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <ZUurcSAL5alOdjto@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-2-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231108003344.1169016-2-michal.winiarski@intel.com>
X-Patchwork-Hint: comment
Subject: Re: [Intel-xe] [PATCH 01/12] drm/xe: Remove shutdown
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

On Wed, Nov 08, 2023 at 01:33:33AM +0100, Michał Winiarski wrote:
> It's not a required callback,

That doesn't seem right. Display should be turned off, all DMA
should be stopped, etc. here.

> and Xe implementation is empty 

That is certainly true.

> - remove
> it.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 4 ----
>  drivers/gpu/drm/xe/xe_device.h | 1 -
>  drivers/gpu/drm/xe/xe_pci.c    | 6 ------
>  3 files changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 515cdf599fab3..078c92576062a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -476,10 +476,6 @@ void xe_device_remove(struct xe_device *xe)
>  	xe_irq_shutdown(xe);
>  }
>  
> -void xe_device_shutdown(struct xe_device *xe)
> -{
> -}
> -
>  void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q)
>  {
>  	mutex_lock(&xe->persistent_engines.lock);
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index c4232de40ae08..ee89af6b1ea9c 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -39,7 +39,6 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
>  int xe_device_probe(struct xe_device *xe);
>  void xe_device_remove(struct xe_device *xe);
> -void xe_device_shutdown(struct xe_device *xe);
>  
>  void xe_device_add_persistent_exec_queues(struct xe_device *xe, struct xe_exec_queue *q);
>  void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2fae45b9d88e1..007e272d2758f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -748,11 +748,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	return err;
>  }
>  
> -static void xe_pci_shutdown(struct pci_dev *pdev)
> -{
> -	xe_device_shutdown(pdev_to_xe_device(pdev));
> -}
> -
>  #ifdef CONFIG_PM_SLEEP
>  static void d3cold_toggle(struct pci_dev *pdev, enum toggle_d3cold toggle)
>  {
> @@ -892,7 +887,6 @@ static struct pci_driver xe_pci_driver = {
>  	.id_table = pciidlist,
>  	.probe = xe_pci_probe,
>  	.remove = xe_pci_remove,
> -	.shutdown = xe_pci_shutdown,
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> -- 
> 2.42.0

-- 
Ville Syrjälä
Intel
