Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B8ECD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 15:34:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8598C89BAC;
	Mon, 11 May 2026 15:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7o2xNRs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3181C89CFA
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 15:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778513697; x=1810049697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wGFFQ+VW65tG61pI694mzsZHZkuBXnL+inVxyaPjHPE=;
 b=l7o2xNRslKMltY3XPwMPi+ma9aK45DVvN++K0RSzxq8s7ABUpARKIjhQ
 RKqG9uZoDKSjNfNONdE3Gbuf499Ebfl8+o1U1au/2zpLErZXl9MT/nrp3
 vH0oiY1tZoHyKODUW8xcM9F/93X7yToylad2+K1tE+nzShrodTvcykWP6
 XWw029ugflNot2keugPO90zhsgQuzxgUaVEicd0EibdJUqDiUEdPG9SS8
 o0Nvr0lcB9PdFBPnlwgc3g4Wj3QH0S/8FWv7JY0gnfUiMwoSl1Qq/luOk
 c1GvbdH7XQDVFYLZTRBmWFRkPBDeS5Ra/iJRz8HhViFCEV+vTcu7PVON/ Q==;
X-CSE-ConnectionGUID: VIhQsLxTS6Swuri9cbf9nQ==
X-CSE-MsgGUID: mbIc5BSERA+I8bO6RltP4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79350539"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79350539"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:34:55 -0700
X-CSE-ConnectionGUID: gCqSxzcAQgO/coXqn0DILA==
X-CSE-MsgGUID: +FE7K8G0Q9eFRaMe+hYJhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="236631857"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:34:53 -0700
Date: Mon, 11 May 2026 17:34:49 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v5 4/6] drm/xe/xe_drm_ras: Wire get-error-counter and
 clear-error-counter support for CRI
Message-ID: <agH3Gaw434-z508w@black.igk.intel.com>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-12-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504065614.3832331-12-riana.tauro@intel.com>
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

On Mon, May 04, 2026 at 12:26:19PM +0530, Riana Tauro wrote:
> Hook CRI get-error-counter and clear-error-counter support to
> xe_drm_ras to allow userspace to query and clear counters if supported.
> When userspace requests for a drm_ras error counter, query the system
> controller to get/clear the value.
> 
> Integrate this with xe_drm_ras.
> 
> Usage :
> 
> Query all error counter value using ynl
> 
> $ sudo ynl --family drm_ras --dump get-error-counter --json \
> '{"node-id":0}'
> [{'error-id': 1, 'error-name': 'core-compute', 'error-value': 0},
>  {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0},
>  {'error-id': 3, 'error-name': 'device-memory', 'error-value': 0},
>  {'error-id': 4, 'error-name': 'pcie', 'error-value': 0},
>  {'error-id': 5, 'error-name': 'fabric', 'error-value': 0}]
> 
> Query single error counter value using ynl
> 
> $ sudo ynl --family drm_ras  --do get-error-counter --json \
> '{"node-id":1, "error-id":1}'
> {'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}
> 
> Clear counter using ynl
> 
> $ sudo ynl --family drm_ras  --do clear-error-counter --json '\
> {"node-id":1, "error-id":1}'
> None
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: split patches (Raag)
> 
> v3: fix early return 
>     align spacing in commit message (Raag)
>     integrate clear counter with drm_ras
> 
> v4: rebase
> ---
>  drivers/gpu/drm/xe/xe_drm_ras.c | 39 +++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index c21c8b428de6..e7bd3f09a762 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -11,27 +11,46 @@
>  
>  #include "xe_device_types.h"
>  #include "xe_drm_ras.h"
> +#include "xe_ras.h"
>  
>  static const char * const error_components[] = DRM_XE_RAS_ERROR_COMPONENT_NAMES;
>  static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>  
> -static int hw_query_error_counter(struct xe_drm_ras_counter *info,
> +static int hw_query_error_counter(struct xe_device *xe,
> +				  enum drm_xe_ras_error_severity severity,
>  				  u32 error_id, const char **name, u32 *val)
>  {
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[severity];
> +
>  	if (!info || !info[error_id].name)
>  		return -ENOENT;
>  
>  	*name = info[error_id].name;
> +
> +	/* Fetch counter from system controller if supported */
> +	if (xe->info.has_sysctrl)

Curious. Should we check this inside xe_ras_get_counter()? We'll probably
end up doing it at some point anyway.

> +		return xe_ras_get_counter(xe, severity, error_id, val);
> +
>  	*val = atomic_read(&info[error_id].counter);
>  
>  	return 0;
>  }
>  
> -static int hw_clear_error_counter(struct xe_drm_ras_counter *info, u32 error_id)
> +static int hw_clear_error_counter(struct xe_device *xe,
> +				  enum drm_xe_ras_error_severity severity,
> +				  u32 error_id)
>  {
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[severity];
> +
>  	if (!info || !info[error_id].name)
>  		return -ENOENT;
>  
> +	/* Clear counter from system controller if supported */
> +	if (xe->info.has_sysctrl)

Ditto.

Raag

> +		return xe_ras_clear_counter(xe, severity, error_id);
> +
>  	atomic_set(&info[error_id].counter, 0);
>  
>  	return 0;
> @@ -41,38 +60,30 @@ static int query_uncorrectable_error_counter(struct drm_ras_node *ep, u32 error_
>  					     const char **name, u32 *val)
>  {
>  	struct xe_device *xe = ep->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
>  
> -	return hw_query_error_counter(info, error_id, name, val);
> +	return hw_query_error_counter(xe, DRM_XE_RAS_ERR_SEV_UNCORRECTABLE, error_id, name, val);
>  }
>  
>  static int clear_uncorrectable_error_counter(struct drm_ras_node *node, u32 error_id)
>  {
>  	struct xe_device *xe = node->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE];
>  
> -	return hw_clear_error_counter(info, error_id);
> +	return hw_clear_error_counter(xe, DRM_XE_RAS_ERR_SEV_UNCORRECTABLE, error_id);
>  }
>  
>  static int query_correctable_error_counter(struct drm_ras_node *ep, u32 error_id,
>  					   const char **name, u32 *val)
>  {
>  	struct xe_device *xe = ep->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>  
> -	return hw_query_error_counter(info, error_id, name, val);
> +	return hw_query_error_counter(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id, name, val);
>  }
>  
>  static int clear_correctable_error_counter(struct drm_ras_node *node, u32 error_id)
>  {
>  	struct xe_device *xe = node->priv;
> -	struct xe_drm_ras *ras = &xe->ras;
> -	struct xe_drm_ras_counter *info = ras->info[DRM_XE_RAS_ERR_SEV_CORRECTABLE];
>  
> -	return hw_clear_error_counter(info, error_id);
> +	return hw_clear_error_counter(xe, DRM_XE_RAS_ERR_SEV_CORRECTABLE, error_id);
>  }
>  
>  static struct xe_drm_ras_counter *allocate_and_copy_counters(struct xe_device *xe)
> -- 
> 2.47.1
> 
