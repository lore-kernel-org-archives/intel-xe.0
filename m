Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2E5EE498F
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 10:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1BC10E83F;
	Wed, 11 Sep 2024 10:41:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQx37V6D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DE010E83F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 10:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726051281; x=1757587281;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TgrTUqvKBWuNsQ7XlVMSYq0sROyRRtw3oeDcy86Ed4s=;
 b=AQx37V6DMEaG2LsZXyP9qCWRMfZobKXvrpcpqTv4/MVTFTimpLZfIyvs
 t5kTQbvjpa43MwK9wHPLRv9JGFk3vJ+TgFyaFe+TD3E4Pj1HE9dslR5iz
 bffJVSMoQ5wZUmAePzeUOl8oUxrFkz+qtOvVD+v5+0y7llIPM3JGwmueY
 +ShMLTXitYenhEgb7g12OC6YHLqwQpgnfG+JmbnpU90BFMMWiwoDu82Lb
 ULQzjzM9wYK6huubmYF7JZatfXki+tQNikPI6YfoxDusqQGxkcbqaVPcS
 ZyQ4ZgVJ3yUPiEKEp1QO50xdkei+nv+AQVS0AfTxa7f5eF9xP8cYcX63F A==;
X-CSE-ConnectionGUID: l1622oE1RSKmRZvhj0631Q==
X-CSE-MsgGUID: iKcL+R5fRSSwyIv1sp9GjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24778542"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24778542"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:41:20 -0700
X-CSE-ConnectionGUID: E7ULdMuLS62gKykwOuSKJA==
X-CSE-MsgGUID: fb3D4x2hTKWTtukbyT+0kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="71935860"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.102])
 ([10.245.244.102])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:41:19 -0700
Message-ID: <40fb2baf-ca16-4d76-a672-48bd6e2d76de@intel.com>
Date: Wed, 11 Sep 2024 11:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pm: Move xe_rpm_lockmap_acquire
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240911093026.643605-1-suraj.kandpal@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240911093026.643605-1-suraj.kandpal@intel.com>
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

On 11/09/2024 10:30, Suraj Kandpal wrote:
> Move xe_rpm_lockmap_acquire after display_pm_suspend and resume
> funtions to avoid cirular locking dependency because of locks
> being taken in intel_fbdev, intel_dp_mst_mgr suspend and resume
> functions.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Can you provide the full lockdep splat or a link to it? We also need to 
give some solid analysis on why we think the splat is a false positive.

> ---
>   drivers/gpu/drm/xe/xe_pm.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index a3d1509066f7..7f33e553728a 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -363,6 +363,18 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	/* Disable access_ongoing asserts and prevent recursive pm calls */
>   	xe_pm_write_callback_task(xe, current);
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
>   	/*
>   	 * The actual xe_pm_runtime_put() is always async underneath, so
>   	 * exactly where that is called should makes no difference to us. However
> @@ -386,18 +398,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>   	 */
>   	xe_rpm_lockmap_acquire(xe);
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
>   	if (xe->d3cold.allowed) {
>   		err = xe_bo_evict_all(xe);
>   		if (err)
> @@ -438,8 +438,6 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   	/* Disable access_ongoing asserts and prevent recursive pm calls */
>   	xe_pm_write_callback_task(xe, current);
>   
> -	xe_rpm_lockmap_acquire(xe);
> -
>   	if (xe->d3cold.allowed) {
>   		err = xe_pcode_ready(xe, true);
>   		if (err)
> @@ -463,6 +461,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_display_pm_runtime_resume(xe);
>   
> +	xe_rpm_lockmap_acquire(xe);
> +
>   	if (xe->d3cold.allowed) {
>   		err = xe_bo_restore_user(xe);
>   		if (err)
