Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68974C77B7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 18:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8ED10E657;
	Fri,  5 May 2023 18:20:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D5A10E657
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 18:20:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46C8360C51;
 Fri,  5 May 2023 18:20:09 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 03546C433D2;
 Fri,  5 May 2023 18:20:06 +0000 (UTC)
Date: Fri, 5 May 2023 14:20:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZFVI1JUi7UqBUks7@rdvivi-mobl4>
References: <20230505180349.367572-1-matthew.auld@intel.com>
 <20230505180349.367572-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230505180349.367572-2-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 2/3] drm/xe: fix
 xe_device_mem_access_get() race
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

On Fri, May 05, 2023 at 07:03:48PM +0100, Matthew Auld wrote:
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
> v2:
>   - ct->lock looks to be primed with fs_reclaim, so holding that and
>     then allocating memory will cause lockdep to complain. Now that we
>     unconditionally grab the mem_access.lock around mem_access_{get,put},
>     we need to change the ordering wrt to grabbing the ct->lock, since
>     some of the runtime_pm routines can allocate memory (or at least
>     that's what lockdep seems to suggest). Hopefully not a big deal.
>     It might be that there were already issues with this, just that the
>     atomics where "hiding" the potential issues.

it could've be done with a separated patch coming before, but anyway,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/258
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c              | 11 +++--------
>  drivers/gpu/drm/xe/xe_device_types.h        |  5 ++++-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  4 ++++
>  drivers/gpu/drm/xe/xe_guc_ct.c              | 13 +++++++------
>  drivers/gpu/drm/xe/xe_pm.c                  |  9 ++-------
>  drivers/gpu/drm/xe/xe_pm.h                  |  2 +-
>  6 files changed, 21 insertions(+), 23 deletions(-)
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
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 604f189dbd70..e769af7e7cdb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_gt_tlb_invalidation.h"
>  
> +#include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> @@ -112,6 +113,8 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	 * in order which they currently are, if that changes the algorithm will
>  	 * need to be updated.
>  	 */
> +
> +	xe_device_mem_access_get(gt->xe);
>  	mutex_lock(&guc->ct.lock);
>  	seqno = gt->tlb_invalidation.seqno;
>  	if (fence) {
> @@ -140,6 +143,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	if (ret < 0 && fence)
>  		invalidation_fence_signal(fence);
>  	mutex_unlock(&guc->ct.lock);
> +	xe_device_mem_access_put(gt->xe);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 9055ff133a7c..579d7f341f13 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -494,26 +494,22 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		}
>  	}
>  
> -	xe_device_mem_access_get(ct_to_xe(ct));
>  retry:
>  	ret = has_room(ct, len + GUC_CTB_HDR_LEN, g2h_len);
>  	if (unlikely(ret))
> -		goto put_wa;
> +		goto out;
>  
>  	ret = h2g_write(ct, action, len, g2h_fence ? g2h_fence->seqno : 0,
>  			!!g2h_fence);
>  	if (unlikely(ret)) {
>  		if (ret == -EAGAIN)
>  			goto retry;
> -		goto put_wa;
> +		goto out;
>  	}
>  
>  	g2h_reserve_space(ct, g2h_len, num_g2h);
>  	xe_guc_notify(ct_to_guc(ct));
> -put_wa:
> -	xe_device_mem_access_put(ct_to_xe(ct));
>  out:
> -
>  	return ret;
>  }
>  
> @@ -535,6 +531,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  	XE_BUG_ON(g2h_len && g2h_fence);
>  	lockdep_assert_held(&ct->lock);
> +	xe_device_assert_mem_access(ct_to_xe(ct));
>  
>  try_again:
>  	ret = __guc_ct_send_locked(ct, action, len, g2h_len, num_g2h,
> @@ -602,10 +599,14 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  
>  	XE_BUG_ON(g2h_len && g2h_fence);
>  
> +	xe_device_mem_access_get(ct_to_xe(ct));
> +
>  	mutex_lock(&ct->lock);
>  	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
>  	mutex_unlock(&ct->lock);
>  
> +	xe_device_mem_access_put(ct_to_xe(ct));
> +
>  	return ret;
>  }
>  
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
