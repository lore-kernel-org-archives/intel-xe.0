Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBCCCD98F0
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 11:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0783110EFB9;
	Wed, 17 Jun 2026 11:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fz2uZKLo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D81E10EFBA
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781695858; x=1813231858;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=wQMFachsPTzio+xbakAsP1VGHte0VuzaMtunlwwpvyo=;
 b=fz2uZKLo2wExSPD/MokEpgnjR2PB407i99NFoCC1H8mcURzefSGBQ8JP
 qWZ83QfYiV1gVi4QB49aVl1S/bdV790cMA3bAWU4wbykVoxO+YFkm+lGE
 8MKerUGkfHqN6zWxvwb2UsNGYmCE+zeNP7TDp7uQqrqpSrgJEaNV6MqHR
 CdjNvseu2qKvALP2LQvL9NW9KKHvbtEHJEe1cMczmsQerARSFAd86bYLv
 J11N3PCplhjhbDYGm+XWeAlYOxRjSku8NSc/au4z8A95DZlx7I8z0qkFA
 qjPrCwN8hJePFSAu7awkmHvDHiiYxz10wv/zYmV3XjAjDsK6Neua985Az Q==;
X-CSE-ConnectionGUID: 3Vk/b3EIRmeZ6wztZ+/b9w==
X-CSE-MsgGUID: y13GYTw+Sm6D032i//MLGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="105290761"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="105290761"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:30:58 -0700
X-CSE-ConnectionGUID: IVV1f6BpRLe9dyqUx0GVag==
X-CSE-MsgGUID: VlV9ijkpRTerYAfH1YXqAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="249948724"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.158])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:30:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
In-Reply-To: <20260617082104.610620-2-tejas.upadhyay@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260617082104.610620-2-tejas.upadhyay@intel.com>
Date: Wed, 17 Jun 2026 14:30:53 +0300
Message-ID: <0fbd905b226bfa9224991fa8d414edb8c94222a2@intel.com>
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

On Wed, 17 Jun 2026, Tejas Upadhyay <tejas.upadhyay@intel.com> wrote:
> A circular locking dependency is reported between xe_pm_block_map and
> dev->clientlist_mutex:
>
>   &dev->clientlist_mutex --> &vm->lock --> xe_pm_block_map --> &dev->clientlist_mutex
>
> The dependency chain is:
> 1. xe_pm_suspend() calls xe_pm_block_begin_signalling(), then
>    xe_display_pm_suspend() which calls drm_client_dev_suspend()
>    acquiring clientlist_mutex. (xe_pm_block_map -> clientlist_mutex)
>
> 2. drm_client_dev_unregister() -> drm_file_free() -> xe_file_close() ->
>    prelim_xe_eudebug_file_close() acquires discovery_lock.
>    (clientlist_mutex -> discovery_lock)
>
> 3. xe_vm_close_and_put() acquires vm->lock under discovery_lock.
>    (discovery_lock -> vm->lock)
>
> 4. xe_exec_ioctl() holds vm->lock and calls xe_pm_block_on_suspend()
>    which waits on xe_pm_block_map. (vm->lock -> xe_pm_block_map)
>
> Fix this by moving drm_client_dev_suspend() before
> xe_pm_block_begin_signalling() in xe_pm_suspend(), and
> drm_client_dev_resume() after xe_pm_block_end_signalling() in
> xe_pm_resume(). This breaks the xe_pm_block_map -> clientlist_mutex
> edge in the dependency chain.
>
> The drm_client_dev_suspend/resume calls are safe to move because they
> only blank/unblank the fbdev console and don't depend on display power
> state or any operations within the block signalling scope.

What baseline are you using?

See f597d4b2fd0d ("drm/{i915, xe}: move more calls inside
intel_display_driver_pm_resume()"), pushed almost two weeks ago.

The direction must be to move display related calls to display, and
neither i915 nor xe core driver should be messing with anything to do
with display directly.

Need to find another solution.

BR,
Jani.

>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 3 ---
>  drivers/gpu/drm/xe/xe_pm.c              | 5 +++++
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 810d93fefcbc..ec65dcbc3fdc 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -304,7 +304,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  	 * properly.
>  	 */
>  	intel_display_power_disable(display);
> -	drm_client_dev_suspend(&xe->drm);
>  
>  	if (intel_display_device_present(display)) {
>  		drm_kms_helper_poll_disable(&xe->drm);
> @@ -461,8 +460,6 @@ void xe_display_pm_resume(struct xe_device *xe)
>  
>  	intel_opregion_resume(display);
>  
> -	drm_client_dev_resume(&xe->drm);
> -
>  	intel_display_power_enable(display);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 99562f691080..d00c620d0926 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -10,6 +10,7 @@
>  #include <linux/suspend.h>
>  #include <linux/dmi.h>
>  
> +#include <drm/drm_client_event.h>
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_placement.h>
>  
> @@ -177,6 +178,7 @@ int xe_pm_suspend(struct xe_device *xe)
>  	int err;
>  
>  	drm_dbg(&xe->drm, "Suspending device\n");
> +	drm_client_dev_suspend(&xe->drm);
>  	xe_pm_block_begin_signalling();
>  	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>  
> @@ -219,6 +221,7 @@ int xe_pm_suspend(struct xe_device *xe)
>  err:
>  	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>  	xe_pm_block_end_signalling();
> +	drm_client_dev_resume(&xe->drm);
>  	return err;
>  }
>  
> @@ -292,10 +295,12 @@ int xe_pm_resume(struct xe_device *xe)
>  
>  	drm_dbg(&xe->drm, "Device resumed\n");
>  	xe_pm_block_end_signalling();
> +	drm_client_dev_resume(&xe->drm);
>  	return 0;
>  err:
>  	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
>  	xe_pm_block_end_signalling();
> +	drm_client_dev_resume(&xe->drm);
>  	return err;
>  }

-- 
Jani Nikula, Intel
