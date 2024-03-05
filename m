Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C82BC54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 11:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB21C112A30;
	Tue,  5 Mar 2024 11:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n2LYe4TO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5413C112A30
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709636862; x=1741172862;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hB+3Cts8Jp60FhZ+wX+w1itIoX7S2KiIAwVyrB+eLCE=;
 b=n2LYe4TOGjKU5eaLZc98q/DrMf4gDbWefvT1j6mjEs1KvSVDPKI/sdjz
 q2CCOt9/bQTroPv4SPsLmctnNi71dfkkxsHyOmCjSpecd+YYdXU6F9tlJ
 u/1mHQoRXGmhkei6nn+pHdYcRWbyBE6I/Yr9UDf8N++0uvjfOEb5ZxLxO
 YvLy83odgkv11MT3YN7qHhEi6qnzhjYyUM6QG/60QbkgOwKdeZCEFEi4S
 TKUXbhtUOQYFiZmwXQvUreLZlcTndOhlvVd91BokCl6FVPWrpP6AoHDoa
 u2TEQUPKmIQkyem/3XoAEDpzKcC50JrRRprcpuG/+fe1PhZJOreYSWy8S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4341921"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4341921"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 03:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="40336888"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 03:07:40 -0800
Message-ID: <13054dd0-51cd-4dd4-8b14-4587037acf2f@intel.com>
Date: Tue, 5 Mar 2024 11:07:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/xe: Move xe_irq runtime suspend and resume out of
 lockdep
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-4-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240304182154.42611-4-rodrigo.vivi@intel.com>
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

On 04/03/2024 18:21, Rodrigo Vivi wrote:
> Now that mem_access xe_pm_runtime_lockdep_map was moved to protect all
> the sync resume calls lockdep is saying:
> 
>   Possible unsafe locking scenario:
> 
>         CPU0                    CPU1
>         ----                    ----
>    lock(xe_pm_runtime_lockdep_map);
>                                 lock(&power_domains->lock);
>                                 lock(xe_pm_runtime_lockdep_map);
>    lock(&power_domains->lock);
> 
> -> #1 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
>         xe_pm_runtime_resume_and_get+0x6a/0x190 [xe]
>         release_async_put_domains+0x26/0xa0 [xe]
>         intel_display_power_put_async_work+0xcb/0x1f0 [xe]
> 
> -> #0 (&power_domains->lock){+.+.}-{4:4}:
>         __lock_acquire+0x3259/0x62c0
>         lock_acquire+0x19b/0x4c0
>         __mutex_lock+0x16b/0x1a10
>         intel_display_power_is_enabled+0x1f/0x40 [xe]
>         gen11_display_irq_reset+0x1f2/0xcc0 [xe]
>         xe_irq_reset+0x43d/0x1cb0 [xe]
>         xe_irq_resume+0x52/0x660 [xe]
>         xe_pm_runtime_resume+0x7d/0xdc0 [xe
> 
> This is likely a false positive.
> 
> This lockdep is created to protect races from the inner callers

There is no real lock here so it doesn't protect anything AFAIK. It is 
just about mapping the hidden dependencies between locks held when 
waking up the device and locks acquired in the resume and suspend callbacks.

> of get-and-resume-sync that are within holding various memory access locks
> with the resume and suspend itself that can also be trying to grab these
> memory access locks.
> 
> This is not the case here, for sure. The &power_domains->lock seems to be
> sufficient to protect any race and there's no counter part to get deadlocked
> with.

What is meant by "race" here? The lockdep splat is saying that one or 
both of the resume or suspend callbacks is grabbing some lock, but that 
same lock is also held when potentially waking up the device. From 
lockdep POV that is a potential deadlock.

If we are saying that it is impossible to actually wake up the device in 
this particular case then can we rather make caller use _noresume() or 
ifactive()?

> 
> Also worth to mention that on i915, intel_display_power_put_async_work
> also gets and resume synchronously and the runtime pm get/put
> also resets the irq and that code was never problematic.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b534a194a9ef..919250e38ae0 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -347,7 +347,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   			goto out;
>   	}
>   
> +	lock_map_release(&xe_pm_runtime_lockdep_map);
>   	xe_irq_suspend(xe);
> +	xe_pm_write_callback_task(xe, NULL);
> +	return 0;
>   out:
>   	lock_map_release(&xe_pm_runtime_lockdep_map);
>   	xe_pm_write_callback_task(xe, NULL);
> @@ -369,6 +372,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	/* Disable access_ongoing asserts and prevent recursive pm calls */
>   	xe_pm_write_callback_task(xe, current);
>   
> +	xe_irq_resume(xe);
> +
>   	lock_map_acquire(&xe_pm_runtime_lockdep_map);
>   
>   	/*
> @@ -395,8 +400,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   			goto out;
>   	}
>   
> -	xe_irq_resume(xe);
> -
>   	for_each_gt(gt, xe, id)
>   		xe_gt_resume(gt);
>   
