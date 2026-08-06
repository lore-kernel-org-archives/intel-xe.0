Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C61C561E6
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 08:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C2F10E2D4;
	Thu,  6 Aug 2026 08:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eca0zgpB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAF410E2D4
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 08:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786005025; x=1817541025;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kvh/4xU10mRhUhxQ0H2UUvpRgCBfM6mC+TSHebpZyk4=;
 b=eca0zgpBFOpQh5kGmIlBnrDpM+feHDPcFMIR+pUgtP4ulcW3lldtnnit
 n8w/hKkuqNAYNr4owzKijIgNrQV9qesqfycg7Us4shYa8Vi8uDO9wzXaH
 BalvcDvgIKV3NE2oQAtXyI+7adVMpPeaUqlFEWtoN4G0SfXWDsCtC0vRQ
 5mJVs/0uEuGDwWJKnGkafjyos+142f9VvDBSJk75HGrRtFi11yG6tBDpE
 +ZbDJE+6XlPSHkDfjhXur2KolM5EHc6ybXhrDZZ6g91nAkrncWSw3D6Bm
 8mvqQFn9HAstyBANJppKX3CHKg12c8xQexGOrqWEh+qGnlLHwU+/wV7/t w==;
X-CSE-ConnectionGUID: p06yXlQnQWueBgrX6nT7sw==
X-CSE-MsgGUID: dAspK7IQSAKaEHAoOjUyaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="112144099"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="112144099"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 01:30:25 -0700
X-CSE-ConnectionGUID: PHBW1FONSMKU/ihp9NSaFA==
X-CSE-MsgGUID: gYXbxHuDT1uRKpW9DcqLKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="285415249"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 01:30:23 -0700
Date: Thu, 6 Aug 2026 10:30:20 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Message-ID: <anRGHJeae97n3ZwU@black.igk.intel.com>
References: <20260806085711.437110-2-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806085711.437110-2-nitin.r.gote@intel.com>
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

On Thu, Aug 06, 2026 at 02:27:12PM +0530, Nitin Gote wrote:
> Exec queues are owned by user fds and are destroyed when the fd is closed.
> After hot-unplug this can happen from a deferred close during process
> exit, after the device has been removed and runtime PM has been disabled.
> The queue destroy path can call xe_pm_runtime_get_noresume(), and since
> runtime PM is disabled pm_runtime_get_if_in_use() returns no reference,
> so it warns about "Missing outer runtime PM protection".
> 
> This is a false positive for the hot-unplug teardown case. The device is
> already unplugged, and the queue destroy path that triggered this warning
> was checked and does not touch hardware state after unplug. GuC has already
> been sanitized by guc_fini_hw(), so no H2G is sent and the hardware
> teardown path is no longer reachable.
> 
> Skip the warning when the DRM device is already unplugged.
> 
> Observed with new IGT core_hotunplug subtests:
>   igt@core_hotunplug@hotreplug-with-load
>   igt@core_hotunplug@hotunplug-rescan-with-load
> 
> v2:
>  - Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
>    and instead exclude hot-unplug from the WARN in
>    xe_pm_runtime_get_noresume(). (Matthew Brost)
> 
> v3:
>  - Clarify that the queue destroy path was checked and does not touch
>    hardware state after unplug. (Matthew Auld)
> 
> Link: https://patchwork.freedesktop.org/patch/725773/?series=166744&rev=4
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a5289a9df8d2..a038687d5b2c 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -10,6 +10,7 @@
>  #include <linux/suspend.h>
>  #include <linux/dmi.h>
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_placement.h>
>  
> @@ -914,7 +915,9 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe)

From the documentation

 * This function should be used in inner places where it is surely already
 * protected by outer-bound callers of `xe_pm_runtime_get`.

>  	if (!ref) {
>  		pm_runtime_get_noresume(xe->drm.dev);
> -		drm_WARN(&xe->drm, !xe_pm_suspending_or_resuming(xe),
> +		drm_WARN(&xe->drm,
> +			 !drm_dev_is_unplugged(&xe->drm) &&
> +			 !xe_pm_suspending_or_resuming(xe),

So IMO this is more of a band-aid.

Raag

>  			 "Missing outer runtime PM protection\n");
>  	}
>  }
> -- 
> 2.50.1
> 
