Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256E7F36BA7
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 07:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC05C10E023;
	Sat, 11 Apr 2026 07:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bh2688gm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC76410E023
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 07:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775894180; x=1807430180;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JteREJ7WkiO0m0CP8vCsZpI1XRvtFa5sm4K82r5ZGBI=;
 b=bh2688gmz8Gq3cI/4KsibiGz0tdOhFz8rpG2FzxiO/oataZvqvxdDocA
 ijAEyDabAai9hdy3XtfiuavlL/PFJf2DtVRZhO27gGr1keoFiByXeeTyN
 rIk/HrQ/odRe8sVUgRgsEWtMraU2O+KiloZ8MBgcop0bV0xuXDQdOGzyw
 HELsL38gEaOFL5yH8hZ0sZNG4VVg3XxIwU7sPkRlZpACsmTUVie62XCEg
 V4j27LOzV1G4a0X4dXpFuZ4ggKARUpRCIFADWD0ZAY1o20iwHdouELBkJ
 rdEUQBgJBRwBoKQf9jV+F9Pj19uw35JoGaB/xPs9YbXWBtLplQbVpS9u5 w==;
X-CSE-ConnectionGUID: mGq5KEMDQX2Kl7qXsfwW5Q==
X-CSE-MsgGUID: WENReeg0Tm2hFXg+d9+wQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="80768845"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="80768845"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 00:56:20 -0700
X-CSE-ConnectionGUID: g9XxDZTAQwqmY3bZegXP5Q==
X-CSE-MsgGUID: N/n004znStiTrtTWH1xZfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="226140158"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 00:56:18 -0700
Date: Sat, 11 Apr 2026 09:56:15 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/ras: Fix error handling in register_nodes()
Message-ID: <adn-n0TPOeXAG8IU@black.igk.intel.com>
References: <20260407225913.3397059-1-shuicheng.lin@intel.com>
 <20260407225913.3397059-2-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407225913.3397059-2-shuicheng.lin@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2026 at 10:59:12PM +0000, Shuicheng Lin wrote:
> Fix two issues in register_nodes():
> 
> 1. When the loop fails mid-way, previously registered nodes are not
>    cleaned up. Add goto-based error unwinding that walks backwards
>    through completed iterations.

Did you check with the author if this is expected behaviour?

> 2. When allocate_and_copy_counters() fails, assign_node_params()
>    leaves ras->info[severity] as an ERR_PTR and returns. The caller
>    then passes that ERR_PTR to kfree() via cleanup_node_param(),
>    causing an invalid free. Fix by making assign_node_params()
>    self-contained on error: NULL out the stale ERR_PTR and free
>    device_name before returning.

Can this be rather fixed using a local pointer?

Raag

> Fixes: b40db12b542f ("drm/xe/xe_drm_ras: Add support for XE DRM RAS")
> Cc: Riana Tauro <riana.tauro@intel.com>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_ras.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index e07dc23a155e..802e4bcb731c 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -73,6 +73,7 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct xe_drm_ras *ras = &xe->ras;
>  	const char *device_name;
> +	int ret;
>  
>  	device_name = kasprintf(GFP_KERNEL, "%04x:%02x:%02x.%d",
>  				pci_domain_nr(pdev->bus), pdev->bus->number,
> @@ -89,8 +90,11 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>  	node->priv = xe;
>  
>  	ras->info[severity] = allocate_and_copy_counters(xe);
> -	if (IS_ERR(ras->info[severity]))
> -		return PTR_ERR(ras->info[severity]);
> +	if (IS_ERR(ras->info[severity])) {
> +		ret = PTR_ERR(ras->info[severity]);
> +		ras->info[severity] = NULL;
> +		goto err_free_name;
> +	}
>  
>  	if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
>  		node->query_error_counter = query_correctable_error_counter;
> @@ -98,6 +102,11 @@ static int assign_node_params(struct xe_device *xe, struct drm_ras_node *node,
>  		node->query_error_counter = query_uncorrectable_error_counter;
>  
>  	return 0;
> +
> +err_free_name:
> +	kfree(device_name);
> +	node->device_name = NULL;
> +	return ret;
>  }
>  
>  static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_error_severity severity)
> @@ -114,26 +123,30 @@ static void cleanup_node_param(struct xe_drm_ras *ras, const enum drm_xe_ras_err
>  static int register_nodes(struct xe_device *xe)
>  {
>  	struct xe_drm_ras *ras = &xe->ras;
> -	int i;
> +	int i, ret;
>  
>  	for_each_error_severity(i) {
>  		struct drm_ras_node *node = &ras->node[i];
> -		int ret;
>  
>  		ret = assign_node_params(xe, node, i);
> -		if (ret) {
> -			cleanup_node_param(ras, i);
> -			return ret;
> -		}
> +		if (ret)
> +			goto err_unwind;
>  
>  		ret = drm_ras_node_register(node);
>  		if (ret) {
>  			cleanup_node_param(ras, i);
> -			return ret;
> +			goto err_unwind;
>  		}
>  	}
>  
>  	return 0;
> +
> +err_unwind:
> +	while (i--) {
> +		drm_ras_node_unregister(&ras->node[i]);
> +		cleanup_node_param(ras, i);
> +	}
> +	return ret;
>  }
>  
>  static void xe_drm_ras_unregister_nodes(struct drm_device *device, void *arg)
> -- 
> 2.43.0
> 
