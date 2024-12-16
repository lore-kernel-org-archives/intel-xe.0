Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BC4E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 10:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284AE10E58B;
	Mon, 16 Dec 2024 10:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWvS272o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AAB10E58A
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 10:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734345737; x=1765881737;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Uf5P7SzfFGor3PHHj4sRmWQ7EDCJUVUs0cbdRY5MoLQ=;
 b=WWvS272o21F0ri9aeU3oG42zj95l9/W8uWSF9Q7u3ofOswFs3YoUbVUt
 CgzgBXn0dj6Ih2ST44+u8kIganEsaKGzb2scaLA8ou+xcI4FulgX5kv4Q
 Bx7R5wSyfT0pOA4vxZVY+NadkmT5hPjqmzD3fVodrMEAKHq0lwKxoFMxy
 NlAzZxay6DXQcRF1uS7iJTyfZ9RmCklg+hpQN7K2ohlYjV7zYa+4srqrM
 kzAiasr6Xhovzuw29tBzpLmtkzRqFJjT5hUC9HhFuPCkUhH3BeergikQS
 koZvgV66Z8wQJYTw5W+fmBXgFAJs92GFfWcmFQlEKXUkmkErAG+Kcso05 w==;
X-CSE-ConnectionGUID: gCot0FVoStqixdxpVGRE/w==
X-CSE-MsgGUID: 0PVHhd+oTVWfylzgZcb8Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46133160"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="46133160"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 02:42:17 -0800
X-CSE-ConnectionGUID: Yx8nAmkSQJqvJtx0tBemNA==
X-CSE-MsgGUID: W6IphF6ET0OH4hT33Dzyrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="97031917"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.245])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 02:42:14 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, aravind.iddamsetty@intel.com
Subject: Re: [PATCH 2/2] RFC drm/xe: Enable Boot Survivability mode
In-Reply-To: <20241212054945.1091894-3-riana.tauro@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241212054945.1091894-1-riana.tauro@intel.com>
 <20241212054945.1091894-3-riana.tauro@intel.com>
Date: Mon, 16 Dec 2024 12:42:11 +0200
Message-ID: <878qsfucxo.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 12 Dec 2024, Riana Tauro <riana.tauro@intel.com> wrote:
> Enable boot survivability mode if pcode initialization fails and
> if boot status indicates a failure. In this mode, drm card is not
> exposed and driver probe returns success after loading the bare minimum
> to allow firmware to be flashed via mei.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c             |  9 +++++++--
>  drivers/gpu/drm/xe/xe_pci.c                | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_survivability_mode.c |  3 +++
>  3 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 56d4ffb650da..50ed980e1db9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -51,6 +51,7 @@
>  #include "xe_pm.h"
>  #include "xe_query.h"
>  #include "xe_sriov.h"
> +#include "xe_survivability_mode.h"
>  #include "xe_tile.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
> @@ -585,8 +586,12 @@ int xe_device_probe_early(struct xe_device *xe)
>  	update_device_info(xe);
>  
>  	err = xe_pcode_probe_early(xe);
> -	if (err)
> -		return err;
> +	if (err) {
> +		if (xe->info.platform == XE_BATTLEMAGE && xe_survivability_mode_required(xe))

Why the platform check here? Doesn't this stuff belong abstracted inside
the survivability mode?

> +			xe_survivability_mode_init(xe);
> +
> +		return xe->survivability.mode ? 0 : err;

Is it a good idea to start looking at survivability guts from all over
the place? I mean xe->survivability.mode. Even its value should be an
implementation detail, and this is using it to decide whether the
previous call succeeded.

I think this would benefit from hiding stuff better and providing
interfaces. This is one of the things i915 sucks at, and it's really
hard and tedious work to fix afterwards.

Just imagine xe->survavibility is an opaque pointer (even if it isn't)
and implement stuff based on that. It will make a world of difference in
future maintainability.


BR,
Jani.


> +	}
>  
>  	err = wait_for_lmem_ready(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7d146e3e8e21..b9dcd36de06d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -30,6 +30,7 @@
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
> +#include "xe_survivability_mode.h"
>  #include "xe_tile.h"
>  
>  enum toggle_d3cold {
> @@ -768,6 +769,9 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  	if (IS_SRIOV_PF(xe))
>  		xe_pci_sriov_configure(pdev, 0);
>  
> +	if (xe->survivability.mode)
> +		return xe_survivability_mode_remove(xe);
> +
>  	xe_device_remove(xe);
>  	xe_pm_runtime_fini(xe);
>  	pci_set_drvdata(pdev, NULL);
> @@ -840,6 +844,15 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		return err;
>  
>  	err = xe_device_probe_early(xe);
> +
> +	/*
> +	 * In Boot Survivability mode, no drm card is exposed
> +	 * and driver is loaded with bare minimum to allow
> +	 * for firmware to be flashed through mei
> +	 */
> +	if (!err && xe->survivability.mode)
> +		return 0;
> +
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 7e36989efd68..6c1e79b5c15f 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -176,7 +176,10 @@ bool xe_survivability_mode_required(struct xe_device *xe)
>   */
>  void xe_survivability_mode_remove(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
>  	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
> +	pci_set_drvdata(pdev, NULL);
>  }
>  
>  /**

-- 
Jani Nikula, Intel
