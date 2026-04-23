Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B50F99368
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 11:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDA710F0B5;
	Thu, 23 Apr 2026 11:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CqVKCOVW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513F510F0B5
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 11:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776942546; x=1808478546;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=utZk+JTyk4eDUFflqTFKSrpJKEtNPqrsxBHCQmiLfGU=;
 b=CqVKCOVWb1hbYoevxYKq0nvPtG76JRseC22wlD1fgvf1s85AGKIyPE/F
 1f/cxzcVifgk6yI3e40Ffq2Hf7gRI7YaepHI5QUsE3o6lRJEtN2DZQF5A
 qwZEv6Hmy262uwtBe1r1V005m7Hv1yXOWBCdujBp9uvrDSxZWTd7nsGbv
 OjTEHuJdksjSJjbz0LKLwV5Z3MS8GdfwriCiPvvAc9Ozr/AbyeW+Y0fSE
 XB9lI9Nq8VmRknNr/MejewJW793prvR7XMvx8ADFPevw/nxDjc2ujjSsw
 FQMrbveTjcBNhDyVmNNquA9djr3Ja/LqsKhVvxhMfdVsjVIXoUNHQb6c9 A==;
X-CSE-ConnectionGUID: WZN7oTCzRmGu31KkFHIgeg==
X-CSE-MsgGUID: 8UqwqQAVRmeNZU2xwesB/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81516677"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="81516677"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:09:06 -0700
X-CSE-ConnectionGUID: Ty9DihdsTsWkHFl9qfNMDg==
X-CSE-MsgGUID: gT4OFLQnSjed66xNKq1VHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="237679808"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:09:02 -0700
Date: Thu, 23 Apr 2026 13:09:00 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v3 4/5] drm/xe/xe_drm_ras: Wire get-counter support into
 xe_drm_ras for CRI
Message-ID: <aen9zByGAMBRGYCR@black.igk.intel.com>
References: <20260421145056.253300-7-riana.tauro@intel.com>
 <20260421145056.253300-11-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421145056.253300-11-riana.tauro@intel.com>
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

On Tue, Apr 21, 2026 at 08:21:00PM +0530, Riana Tauro wrote:
> Hook CRI get-counter support to xe_drm_ras to allow userspace to query
> counters if supported. When userspace queries a drm_ras error counter,
> fetch the latest counter value from system controller.
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
>   '{"node-id":1, "error-id":1}'

Nit: Align spacing with above command.

> {'error-id': 1, 'error-name': 'core-compute', 'error-value': 2}
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: split patches (Raag)
> ---
>  drivers/gpu/drm/xe/xe_drm_ras.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_ras.c
> index e07dc23a155e..7040ff0f9539 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -11,19 +11,28 @@
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
> +				  const enum drm_xe_ras_error_severity severity,
>  				  u32 error_id, const char **name, u32 *val)
>  {
> +	struct xe_drm_ras *ras = &xe->ras;
> +	struct xe_drm_ras_counter *info = ras->info[severity];

Use int ret = 0 ...

>  	if (!info || !info[error_id].name)
>  		return -ENOENT;
>  
>  	*name = info[error_id].name;
>  	*val = atomic_read(&info[error_id].counter);

Move this as an else case below and ...

> +	/* Fetch counter from system controller if supported */
> +	if (xe->info.has_sysctrl)
> +		return xe_ras_get_error_counter(xe, severity, error_id, val);

ret = get_counter();

>  	return 0;

return ret;

Raag

>  }
