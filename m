Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EF2C55165
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 12:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAC410E160;
	Thu, 30 Jul 2026 12:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKyyCpbi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F2910E160
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785414914; x=1816950914;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oLQSwepFcey2YeHATUp5i1v1c56bPaR3pHqy1wA8N9Q=;
 b=MKyyCpbiw/Pq+WHQF5BOudjXDv6hP8mg1hu6p+9JMKvrDImZgdVxhVID
 pprDmoJvD2SG5a2J9VqtZPICRggQR7oF/BW/lfF5w71XDoiJlD5cWhJ12
 KyyZATXcd889qkFrF6QyDmgIjQl/srsaLqKnvil9g280aw3Yh/TSCYWgm
 USKCjXJeP68MjvpwWpCUTBke/XquCMpXLUAfF6A39ehjeUpBxXereifcd
 aGj8NzJfqNPiwkE+t1xdk94bWFNOCS/VmNkvOXqXWJlWpd7iC9vw5zdB2
 VWfO0Tp6lW99X6mjhnWCj6ivagjwWhS5j6Rn4mKtdI5UzO8408uhM6Cb9 g==;
X-CSE-ConnectionGUID: MRyDXzL4QTaMLgNDsERxuQ==
X-CSE-MsgGUID: nxxNuTXlSgOV/7bP9swung==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86109934"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86109934"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 05:35:14 -0700
X-CSE-ConnectionGUID: fXiJxOymQZuCwmJdrRvyMw==
X-CSE-MsgGUID: L+p40tkvSXqerhDgomdQ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="264563458"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.197])
 ([10.245.245.197])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 05:35:12 -0700
Message-ID: <cb07be16-b69a-4ff5-b56a-78050d2e364a@intel.com>
Date: Thu, 30 Jul 2026 13:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
To: Nitin Gote <nitin.r.gote@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20260730053635.1515929-2-nitin.r.gote@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260730053635.1515929-2-nitin.r.gote@intel.com>
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

On 30/07/2026 06:36, Nitin Gote wrote:
> After hot-unplug, device_del() disables runtime PM. A deferred fd close
> can still run later during process exit and destroy remaining exec queues,
> which may call xe_pm_runtime_get_noresume().
> 
> At this point pm_runtime_get_if_in_use() fails because runtime PM has
> already been disabled, so xe_pm_runtime_get_noresume() warns with
> "Missing outer runtime PM protection". This is expected after hot-unplug
> and does not indicate a missing outer runtime PM guard from the caller.

Is the code that calls xe_pm_runtime_get_noresume(), not trying to 
protect some kind of hw access to ensure the device stays awake? I think 
post unplug hw access is not allowed outside of the devm teardown 
sequence. Did you also double check that where this fires, we don't then 
touch the hw?

> 
> Skip the warning when the DRM device is already unplugged.
> 
> Observed with new IGT core_hotunplug subtests:
>    igt@core_hotunplug@hotreplug-with-load
>    igt@core_hotunplug@hotunplug-rescan-with-load
> 
> v2: Drop the drm_dev_is_unplugged() bypass from guc_exec_queue_destroy()
>      and instead exclude hot-unplug from the WARN in
>      xe_pm_runtime_get_noresume(). (Matthew Brost)
> 
> Link: https://patchwork.freedesktop.org/patch/725773/?series=166744&rev=4
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a5289a9df8d2..a038687d5b2c 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -10,6 +10,7 @@
>   #include <linux/suspend.h>
>   #include <linux/dmi.h>
>   
> +#include <drm/drm_drv.h>
>   #include <drm/drm_managed.h>
>   #include <drm/ttm/ttm_placement.h>
>   
> @@ -914,7 +915,9 @@ void xe_pm_runtime_get_noresume(struct xe_device *xe)
>   
>   	if (!ref) {
>   		pm_runtime_get_noresume(xe->drm.dev);
> -		drm_WARN(&xe->drm, !xe_pm_suspending_or_resuming(xe),
> +		drm_WARN(&xe->drm,
> +			 !drm_dev_is_unplugged(&xe->drm) &&
> +			 !xe_pm_suspending_or_resuming(xe),
>   			 "Missing outer runtime PM protection\n");
>   	}
>   }

