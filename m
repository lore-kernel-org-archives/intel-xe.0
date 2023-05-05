Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB10C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 16:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3558810E638;
	Fri,  5 May 2023 16:45:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF5F10E044
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 16:44:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B63D261453;
 Fri,  5 May 2023 16:44:57 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 60730C4339B;
 Fri,  5 May 2023 16:44:55 +0000 (UTC)
Date: Fri, 5 May 2023 12:44:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZFUyhLPt8MmBi+A8@rdvivi-mobl4>
References: <20230505153854.343944-1-matthew.auld@intel.com>
 <20230505153854.343944-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230505153854.343944-2-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: fix xe_device_mem_access_get()
 race
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 04:38:53PM +0100, Matthew Auld wrote:
> It looks like there is at least one race here, given that the
> pm_runtime_suspended() check looks to return false if we are in the
> process of suspending the device (RPM_SUSPENDING vs RPM_SUSPENDED). We
> later also do xe_pm_runtime_get_if_active(), but since the device is
> suspending or has now suspended, this doesn't do anything either.
> Following from this we can potentially return from
> xe_device_mem_access_get() with the device suspended or about to be,
> leading to broken behaviour.
> 
> Attempt to fix this by always grabbing the runtime ref when our internal
> ref transitions from 0 -> 1, and then wrap the whole thing with a lock
> to ensure callers are serialized.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 11 +++--------
>  drivers/gpu/drm/xe/xe_device_types.h |  5 ++++-
>  drivers/gpu/drm/xe/xe_pm.c           |  9 ++-------
>  drivers/gpu/drm/xe/xe_pm.h           |  2 +-
>  4 files changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 01c497bcf9a5..0a18b41a0e1a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -406,17 +406,12 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>  
>  void xe_device_mem_access_get(struct xe_device *xe)
>  {
> -	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
> -
>  	mutex_lock(&xe->mem_access.lock);
> -	if (xe->mem_access.ref++ == 0)
> -		xe->mem_access.hold_rpm = xe_pm_runtime_get_if_active(xe);
> +	if (xe->mem_access.ref == 0)
> +		xe->mem_access.hold_rpm = xe_pm_runtime_resume_and_get(xe);
> +	xe->mem_access.ref++;

my memory is good to the point that I have tried this before...
but not good enough to remember the issues that I got with this
approach :(

>  	mutex_unlock(&xe->mem_access.lock);
>  
> -	/* The usage counter increased if device was immediately resumed */
> -	if (resumed)
> -		xe_pm_runtime_put(xe);
> -
>  	XE_WARN_ON(xe->mem_access.ref == S32_MAX);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 59462933f67a..9e37189d5745 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -256,7 +256,10 @@ struct xe_device {
>  	 * triggering additional actions when they occur.
>  	 */
>  	struct {
> -		/** @lock: protect the ref count */
> +		/**
> +		 * @lock: Serialize xe_device_mem_access users,
> +		 * and protect the below internal state, like @ref.
> +		 */
>  		struct mutex lock;
>  		/** @ref: ref count of memory accesses */
>  		s32 ref;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index b7b57f10ba25..b2ffa001e6f7 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -210,14 +210,9 @@ int xe_pm_runtime_put(struct xe_device *xe)
>  	return pm_runtime_put_autosuspend(xe->drm.dev);
>  }
>  
> -/* Return true if resume operation happened and usage count was increased */
> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe)
> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
>  {
> -	/* In case we are suspended we need to immediately wake up */
> -	if (pm_runtime_suspended(xe->drm.dev))
> -		return !pm_runtime_resume_and_get(xe->drm.dev);
> -
> -	return false;
> +	return !pm_runtime_resume_and_get(xe->drm.dev);

now with similar name I feel strange that we are not aligned with their
return. Although I prefer our one...

Anyway, the code is right... if you are testing and it is working well
let's move with this.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
(for the series)

but let's get an Ack from Maarten since he was kept as author on patch 3
and it is modified from his merged one.

>  }
>  
>  int xe_pm_runtime_get_if_active(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 6a885585f653..1b4c15b5e71a 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -19,7 +19,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe);
>  int xe_pm_runtime_resume(struct xe_device *xe);
>  int xe_pm_runtime_get(struct xe_device *xe);
>  int xe_pm_runtime_put(struct xe_device *xe);
> -bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
> +bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
>  int xe_pm_runtime_get_if_active(struct xe_device *xe);
>  
>  #endif
> -- 
> 2.40.0
> 
