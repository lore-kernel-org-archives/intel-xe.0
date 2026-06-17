Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1362ECD98F0
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 11:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA8F010EFB4;
	Wed, 17 Jun 2026 11:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTL9LH6Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7136710EFB4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jun 2026 11:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781695536; x=1813231536;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1+n/XI5AkGhZQ6au1uNvcN8XWU9ZbUQBJChh5wGCgsc=;
 b=hTL9LH6YF1wy3wgME8l73Live3fEWXXwnQ603+kN7lx++x8wjoJzPRtv
 SIWIUspEm7kIwq5ZETc1BOJJKDopus8+38UHF/8xtGvt7PNbzEClO+nBg
 9z98N83bfKGXcZLxyZ7V7pBuS5ghDKP1pWd5XBDA6qVVAdkCGw2wvu2Mc
 dnS7DLm0WTqf0ow8shRIwmbt/11IgDyBvTg41FEO/QcVexgJi75OrrQ5R
 9ENlo1/Vz3Zjh/wdEmUoV8GZ8Kcr00xQVmBx1hTGh+/zvBAdW8JnMcMSg
 l28AxYEi7Xcfz0TOigbS1lmNckoyhuX8h3BiCcKxk3XhFYdpRPC+m7Pi9 Q==;
X-CSE-ConnectionGUID: dV+pWhHaS+6G/OnEFIxgeQ==
X-CSE-MsgGUID: uv97qvloQP+BLg6L2m6NVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="92837388"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="92837388"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:25:21 -0700
X-CSE-ConnectionGUID: izBYLmg7SFe2JJ3vzFi/eQ==
X-CSE-MsgGUID: GHVmVryJQJeRq6kyrn8G0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="252343329"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.130])
 ([10.245.245.130])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 04:25:20 -0700
Message-ID: <e8e282bf-c7e5-4fe5-b228-cddcea4f8b35@intel.com>
Date: Wed, 17 Jun 2026 12:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Move drm_client_dev_suspend/resume outside pm
 block signalling
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, Raag Jadav <raag.jadav@intel.com>
References: <20260617082104.610620-2-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260617082104.610620-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 17/06/2026 09:21, Tejas Upadhyay wrote:
> A circular locking dependency is reported between xe_pm_block_map and
> dev->clientlist_mutex:
> 
>    &dev->clientlist_mutex --> &vm->lock --> xe_pm_block_map --> &dev->clientlist_mutex
> 
> The dependency chain is:
> 1. xe_pm_suspend() calls xe_pm_block_begin_signalling(), then
>     xe_display_pm_suspend() which calls drm_client_dev_suspend()
>     acquiring clientlist_mutex. (xe_pm_block_map -> clientlist_mutex)
> 
> 2. drm_client_dev_unregister() -> drm_file_free() -> xe_file_close() ->
>     prelim_xe_eudebug_file_close() acquires discovery_lock.
>     (clientlist_mutex -> discovery_lock)
> 
> 3. xe_vm_close_and_put() acquires vm->lock under discovery_lock.
>     (discovery_lock -> vm->lock)
> 
> 4. xe_exec_ioctl() holds vm->lock and calls xe_pm_block_on_suspend()
>     which waits on xe_pm_block_map. (vm->lock -> xe_pm_block_map)
> 
> Fix this by moving drm_client_dev_suspend() before
> xe_pm_block_begin_signalling() in xe_pm_suspend(), and
> drm_client_dev_resume() after xe_pm_block_end_signalling() in
> xe_pm_resume(). This breaks the xe_pm_block_map -> clientlist_mutex
> edge in the dependency chain.

Is this not just hiding the issue from lockdep though? The pm_begin/end 
are not real locks, they are just there as annotations to teach lockdep 
about the hidden pm dependencies. For example, any locks you grab in rpm 
suspend()/resume() you are not allowed to hold when waking the device 
up, otherwise you can potentially deadlock. So here moving stuff outside 
the annotations probably doesn't really fix anything, it just hides it 
from lockdep so it doesn't complain.

The above looks like it's complaining that clientlist_mutex is held and 
indirectly ends up waiting on something pm related, but the pm side 
itself can also grab that lock? That seems like a legit complaint and 
should be fixed in the upper layers?

> 
> The drm_client_dev_suspend/resume calls are safe to move because they
> only blank/unblank the fbdev console and don't depend on display power
> state or any operations within the block signalling scope.
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_display.c | 3 ---
>   drivers/gpu/drm/xe/xe_pm.c              | 5 +++++
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 810d93fefcbc..ec65dcbc3fdc 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -304,7 +304,6 @@ void xe_display_pm_suspend(struct xe_device *xe)
>   	 * properly.
>   	 */
>   	intel_display_power_disable(display);
> -	drm_client_dev_suspend(&xe->drm);
>   
>   	if (intel_display_device_present(display)) {
>   		drm_kms_helper_poll_disable(&xe->drm);
> @@ -461,8 +460,6 @@ void xe_display_pm_resume(struct xe_device *xe)
>   
>   	intel_opregion_resume(display);
>   
> -	drm_client_dev_resume(&xe->drm);
> -
>   	intel_display_power_enable(display);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 99562f691080..d00c620d0926 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -10,6 +10,7 @@
>   #include <linux/suspend.h>
>   #include <linux/dmi.h>
>   
> +#include <drm/drm_client_event.h>
>   #include <drm/drm_managed.h>
>   #include <drm/ttm/ttm_placement.h>
>   
> @@ -177,6 +178,7 @@ int xe_pm_suspend(struct xe_device *xe)
>   	int err;
>   
>   	drm_dbg(&xe->drm, "Suspending device\n");
> +	drm_client_dev_suspend(&xe->drm);
>   	xe_pm_block_begin_signalling();
>   	trace_xe_pm_suspend(xe, __builtin_return_address(0));
>   
> @@ -219,6 +221,7 @@ int xe_pm_suspend(struct xe_device *xe)
>   err:
>   	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
>   	xe_pm_block_end_signalling();
> +	drm_client_dev_resume(&xe->drm);
>   	return err;
>   }
>   
> @@ -292,10 +295,12 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	drm_dbg(&xe->drm, "Device resumed\n");
>   	xe_pm_block_end_signalling();
> +	drm_client_dev_resume(&xe->drm);
>   	return 0;
>   err:
>   	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
>   	xe_pm_block_end_signalling();
> +	drm_client_dev_resume(&xe->drm);
>   	return err;
>   }
>   

