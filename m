Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FC2C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 11:06:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6706789916;
	Tue,  9 Jan 2024 11:06:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E62E89916
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jan 2024 11:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704798384; x=1736334384;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kP7ignV5ETFFe3icXnVRmIaVur4ktxRAGC5UwjkB9eQ=;
 b=ilrhiJfC6WjdMyY3LdOoN0V9QrxfWJnx/MUZ+eu2PmA1HX9VpsLKceDi
 u98agU5mtv99YSkddgDx3UCvxw12QteOimrDIk3LBnl6yCyJhrhoZSSiK
 LKzrEsB3Mbq6DtEgnOKvb7eS1wBAKjwXq+X16sqp9V8bP33rDNkkOfTop
 V+ey3uD8Pg4M56piWt2WpL88lyPgHG5hFqKeywd9RQKT6+BJtqu1Z082m
 OgTfNCIkB3gtn5nQeIne4XMZZtf6eqkItZmpbjfcI7Laac0V8AdBVs5ab
 b7CfmC831CM9kXPcCyFUpiFjoyHUifManVJBoEIYdrPgyv+TBf43WFGYH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="16753476"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="16753476"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:06:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="731443029"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="731443029"
Received: from tpsarve-mobl.ger.corp.intel.com (HELO [10.252.17.61])
 ([10.252.17.61])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 03:06:21 -0800
Message-ID: <1fdd8cef-3fe0-496e-9f0e-51fe5ea2a397@intel.com>
Date: Tue, 9 Jan 2024 11:06:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 06/20] drm/xe: Convert mem_access assertion towards the
 runtime_pm state
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
 <20231228021232.2366249-7-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20231228021232.2366249-7-rodrigo.vivi@intel.com>
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

On 28/12/2023 02:12, Rodrigo Vivi wrote:
> The mem_access helpers are going away and getting replaced by
> direct calls of the xe_pm_runtime_{get,put} functions. However, an
> assertion with a warning splat is desired when we hit the worst
> case of a memory access with the device really in the 'suspended'
> state.
> 
> Also, this needs to be the first step. Otherwise, the upcoming
> conversion would be really noise with warn splats of missing mem_access
> gets.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 13 ++++++++++++-
>   drivers/gpu/drm/xe/xe_pm.c     | 16 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_pm.h     |  1 +
>   3 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 86867d42d5329..dc3721bb37b1e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -631,9 +631,20 @@ bool xe_device_mem_access_ongoing(struct xe_device *xe)
>   	return atomic_read(&xe->mem_access.ref);
>   }
>   
> +/**
> + * xe_device_assert_mem_access - Inspect the current runtime_pm state.
> + * @xe: xe device instance
> + *
> + * To be used before any kind of memory access. It will splat a debug warning
> + * if the device is currently sleeping. But it doesn't guarantee in any way
> + * that the device is going to continue awake. Xe PM runtime get and put
> + * functions might be added to the outer bound of the memory access, while
> + * this check is intended for inner usage to splat some warning if the worst
> + * case has just happened.
> + */
>   void xe_device_assert_mem_access(struct xe_device *xe)
>   {
> -	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> +	XE_WARN_ON(xe_pm_runtime_suspended(xe));
>   }
>   
>   bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index cabed94a21873..45114e4e76a5a 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -246,6 +246,22 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>   	return READ_ONCE(xe->pm_callback_task);
>   }
>   
> +/**
> + * xe_pm_runtime_suspended - Inspect the current runtime_pm state.
> + * @xe: xe device instance
> + *
> + * This does not provide any guarantee that the device is going to continue
> + * suspended as it might be racing with the runtime state transitions.
> + * It can be used only as a non-reliable assertion, to ensure that we are not in
> + * the sleep state while trying to access some memory for instance.
> + *
> + * Returns true if PCI device is suspended, false otherwise.
> + */
> +bool xe_pm_runtime_suspended(struct xe_device *xe)
> +{
> +	return pm_runtime_suspended(xe->drm.dev);

Would it not be better to check for active instead? That way we can 
check for !active above and create a bigger net with SUSPENDING and 
RESUMING states also being invalid i.e another task is about to suspend 
or hasn't fully resumed yet. We might also need to also check the 
callback task though.

> +}
> +
>   /**
>    * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 069f41c61505b..67a9bf3dd379b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -22,6 +22,7 @@ int xe_pm_resume(struct xe_device *xe);
>   
>   void xe_pm_init(struct xe_device *xe);
>   void xe_pm_runtime_fini(struct xe_device *xe);
> +bool xe_pm_runtime_suspended(struct xe_device *xe);
>   int xe_pm_runtime_suspend(struct xe_device *xe);
>   int xe_pm_runtime_resume(struct xe_device *xe);
>   void xe_pm_runtime_get(struct xe_device *xe);
