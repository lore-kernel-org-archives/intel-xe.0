Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BE9C4828D
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 09:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C8010E838;
	Mon,  5 Feb 2024 09:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMTM6L9g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A2810E838
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 09:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707126935; x=1738662935;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mfwT62iOegg5JixMZIpaL0rVFwTyMyUgANfmpxPHK4U=;
 b=JMTM6L9gwNT5L483Oa6c/Pgl8WlTDhRYE//UGq9x+XK153bZBxtsG0cB
 RhnN2dpIjn04+jYEFaLcD6hHhaMnYl1pXNKhhIrjtDIxVjLKRPeQvXGmi
 CB+o3wM68hgOeTlwzEVBS0BgBZ4hh7J2jnDqTZbh5X/7E7H66GNqktF4J
 CgApa7CcEcogGkTH7zXR9wNPiD3yNNaNJf68fOg8R8xdsEY0NYbB/HidT
 B5TBAzTnqKR+OPUhLme/KAff3uvxyjNKCnXoaLXX9tr91x70LnWijLw1j
 sQSdttNkMDFhvwUIGwt+005E83NPB3MWlTaLl8mNck1Qh+6GPD1GhyK2g A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11076526"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="11076526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:55:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="38089204"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:55:32 -0800
Message-ID: <6390f3f6-e9ac-4bdd-b868-035db4356996@intel.com>
Date: Mon, 5 Feb 2024 09:55:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/34] drm/xe: Convert mem_access assertion towards the
 runtime_pm state
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-8-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-8-rodrigo.vivi@intel.com>
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
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
> index 6faa7865b1aa..01db34f06a7d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -653,9 +653,20 @@ bool xe_device_mem_access_ongoing(struct xe_device *xe)
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

s/continue awake/remain awake/ ?

> + * functions might be added to the outer bound of the memory access, while
> + * this check is intended for inner usage to splat some warning if the worst
> + * case has just happened.
> + */
>   void xe_device_assert_mem_access(struct xe_device *xe)
>   {
> -	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
> +	XE_WARN_ON(xe_pm_runtime_suspended(xe));

I guess could also check if we are inside a callback and it doesn't 
match current? Sorry if that was already suggested, and there were good 
reasons to avoid.

>   }
>   
>   bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 9910b748adab..3ef14937d5d2 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -252,6 +252,22 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>   	return READ_ONCE(xe->pm_callback_task);
>   }
>   
> +/**
> + * xe_pm_runtime_suspended - Inspect the current runtime_pm state.

"Check if runtime_pm state is suspended" ?

> + * @xe: xe device instance
> + *
> + * This does not provide any guarantee that the device is going to continue
> + * suspended as it might be racing with the runtime state transitions.

s/continue suspended/remain suspended/ ?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> + * It can be used only as a non-reliable assertion, to ensure that we are not in
> + * the sleep state while trying to access some memory for instance.
> + *
> + * Returns true if PCI device is suspended, false otherwise.
> + */
> +bool xe_pm_runtime_suspended(struct xe_device *xe)
> +{
> +	return pm_runtime_suspended(xe->drm.dev);
> +}
> +
>   /**
>    * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index ecb19ee10db6..a672adffd0e1 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -23,6 +23,7 @@ int xe_pm_resume(struct xe_device *xe);
>   void xe_pm_init_early(struct xe_device *xe);
>   void xe_pm_init(struct xe_device *xe);
>   void xe_pm_runtime_fini(struct xe_device *xe);
> +bool xe_pm_runtime_suspended(struct xe_device *xe);
>   int xe_pm_runtime_suspend(struct xe_device *xe);
>   int xe_pm_runtime_resume(struct xe_device *xe);
>   void xe_pm_runtime_get(struct xe_device *xe);
