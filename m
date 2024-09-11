Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4A9EE4998
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 11:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CAB10E9BC;
	Wed, 11 Sep 2024 11:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjQoO14M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9C610E9BC
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726054473; x=1757590473;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=xsOZNcf9voTsklGTRdHj0+Yw1h7tJnQB9VSJn9xEhKI=;
 b=BjQoO14MoFQwr/b4ePYNWyEv7Jcjn3ZLjzH++V0/Y+ima2bLD0x2z0G7
 fVNY6FufNf2TVJk61KQJmo7XhCiC1lHUYhBSqEcwCq6gqCazVAPf37Ewh
 1EJiTtyjKjSuVb5StzLE3NCMr26s1M6P3Ytomg4hl5AKHtDSsZ2hoPeP3
 DGYle7MHAxGeQwYFxabkMj5lAyWknTEwmggfsYbwaqC9JCKU8VqJcjLaT
 Slbn+qwRq8v9sJD8TWp5yeOPCxpl5UWcksj4skQog68e3h/rmPQ6euY2R
 LBChfgdta8TZDUufuOpVX2LoISw/U+iyAcMMHcsoXZ0p0hkcyF65bwQIY g==;
X-CSE-ConnectionGUID: LGWIGZRVQPmV6GGuKV6xpQ==
X-CSE-MsgGUID: tj/3tC2PSGiJhP4JSgm+oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="50261721"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="50261721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 04:34:33 -0700
X-CSE-ConnectionGUID: mlYZrrFfTseSeBkmcLaTQg==
X-CSE-MsgGUID: eFyawfN8Q/yqFFIBp/jqEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="71715602"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 04:34:32 -0700
Date: Wed, 11 Sep 2024 14:34:54 +0300
From: Imre Deak <imre.deak@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com
Subject: Re: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
Message-ID: <ZuGAXqmtrLOnjAGs@ideak-desk.fi.intel.com>
References: <20240911093026.643605-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911093026.643605-1-suraj.kandpal@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 11, 2024 at 03:00:25PM +0530, Suraj Kandpal wrote:
> Move xe_rpm_lockmap_acquire after display_pm_suspend and resume
> funtions to avoid cirular locking dependency because of locks
> being taken in intel_fbdev, intel_dp_mst_mgr suspend and resume
> functions.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

The actual problem is that MST is being suspended during runtime
suspend. This is not required (adding only unnecessary overhead) but
also incorrect as it involves AUX transfers which itself depends on the
device being runtime resumed. This is what lockdep is also trying to
say.

So the solution would be not to suspend/resume MST during runtime
suspend/resume.

> ---
>  drivers/gpu/drm/xe/xe_pm.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a3d1509066f7..7f33e553728a 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -363,6 +363,18 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	/* Disable access_ongoing asserts and prevent recursive pm calls */
>  	xe_pm_write_callback_task(xe, current);
>  
> +	/*
> +	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
> +	 * also checks and delets bo entry from user fault list.
> +	 */
> +	mutex_lock(&xe->mem_access.vram_userfault.lock);
> +	list_for_each_entry_safe(bo, on,
> +				 &xe->mem_access.vram_userfault.list, vram_userfault_link)
> +		xe_bo_runtime_pm_release_mmap_offset(bo);
> +	mutex_unlock(&xe->mem_access.vram_userfault.lock);
> +
> +	xe_display_pm_runtime_suspend(xe);
> +
>  	/*
>  	 * The actual xe_pm_runtime_put() is always async underneath, so
>  	 * exactly where that is called should makes no difference to us. However
> @@ -386,18 +398,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	 */
>  	xe_rpm_lockmap_acquire(xe);
>  
> -	/*
> -	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
> -	 * also checks and delets bo entry from user fault list.
> -	 */
> -	mutex_lock(&xe->mem_access.vram_userfault.lock);
> -	list_for_each_entry_safe(bo, on,
> -				 &xe->mem_access.vram_userfault.list, vram_userfault_link)
> -		xe_bo_runtime_pm_release_mmap_offset(bo);
> -	mutex_unlock(&xe->mem_access.vram_userfault.lock);
> -
> -	xe_display_pm_runtime_suspend(xe);
> -
>  	if (xe->d3cold.allowed) {
>  		err = xe_bo_evict_all(xe);
>  		if (err)
> @@ -438,8 +438,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	/* Disable access_ongoing asserts and prevent recursive pm calls */
>  	xe_pm_write_callback_task(xe, current);
>  
> -	xe_rpm_lockmap_acquire(xe);
> -
>  	if (xe->d3cold.allowed) {
>  		err = xe_pcode_ready(xe, true);
>  		if (err)
> @@ -463,6 +461,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_display_pm_runtime_resume(xe);
>  
> +	xe_rpm_lockmap_acquire(xe);
> +
>  	if (xe->d3cold.allowed) {
>  		err = xe_bo_restore_user(xe);
>  		if (err)
> -- 
> 2.43.2
> 
