Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8B3C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 15:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F7F10E44B;
	Wed, 17 May 2023 15:53:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B84010E44B
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 15:53:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EFA2C63F16;
 Wed, 17 May 2023 15:53:06 +0000 (UTC)
Received: from rdvivi-mobl4 (fmdmzpr02-ext.fm.intel.com [192.55.54.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id E5EC9C433D2;
 Wed, 17 May 2023 15:53:04 +0000 (UTC)
Date: Wed, 17 May 2023 11:53:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZGT4XlIdgV+FqwNx@rdvivi-mobl4>
References: <20230517152244.348171-1-matthew.auld@intel.com>
 <20230517152244.348171-4-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517152244.348171-4-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH v5 4/7] drm/xe: keep pulling mem_access_get
 further back
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

On Wed, May 17, 2023 at 04:22:41PM +0100, Matthew Auld wrote:
> Lockdep is unhappy about ggtt->lock -> mem_access.lock, where it seems
> to think this can somehow get inverted. The ggtt->lock looks like a
> potentially sensitive driver lock, so likely a sensible move to never
> call the runtime_pm routines while holding it. Actually it looks like
> d3cold wants to grab this, so perhaps this can indeed deadlock.

I got me thinking that we should document this, but then
I remembered that we don't even have the mem_access documentation yet :(
My bad... I think I might have in some old branch here a draft
for it while moving mem_access to its own component files.

Anyway, let's put this in a gitlab issue so we don't forget:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/281

and let's move with this...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c      | 12 +++++++-----
>  drivers/gpu/drm/xe/xe_ggtt.c                |  6 ++++++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 --
>  3 files changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index ed691d28b34d..a2ed04ca2421 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -130,9 +130,10 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  	/* TODO: Consider sharing framebuffer mapping?
>  	 * embed i915_vma inside intel_framebuffer
>  	 */
> +	xe_device_mem_access_get(ggtt->gt->xe);
>  	ret = mutex_lock_interruptible(&ggtt->lock);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	align = XE_PAGE_SIZE;
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
> @@ -146,7 +147,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
>  							 align, 0);
>  		if (ret)
> -			goto out;
> +			goto out_unlock;
>  
>  		for (x = 0; x < size; x += XE_PAGE_SIZE)
>  			xe_ggtt_set_pte(ggtt, vma->node.start + x, xe_ggtt_pte_encode(bo, x));
> @@ -160,7 +161,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  		ret = xe_ggtt_insert_special_node_locked(ggtt, &vma->node, size,
>  							 align, 0);
>  		if (ret)
> -			goto out;
> +			goto out_unlock;
>  
>  		ggtt_ofs = vma->node.start;
>  
> @@ -174,9 +175,10 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  	}
>  
>  	xe_ggtt_invalidate(to_gt(xe));
> -
> -out:
> +out_unlock:
>  	mutex_unlock(&ggtt->lock);
> +out:
> +	xe_device_mem_access_put(ggtt->gt->xe);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 546240261e0a..f986e8218820 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -142,12 +142,14 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	u64 start, end;
>  
>  	/* Display may have allocated inside ggtt, so be careful with clearing here */
> +	xe_device_mem_access_get(ggtt->gt->xe);
>  	mutex_lock(&ggtt->lock);
>  	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
>  		xe_ggtt_clear(ggtt, start, end - start);
>  
>  	xe_ggtt_invalidate(ggtt->gt);
>  	mutex_unlock(&ggtt->lock);
> +	xe_device_mem_access_put(ggtt->gt->xe);
>  }
>  
>  int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
> @@ -288,12 +290,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	if (err)
>  		return err;
>  
> +	xe_device_mem_access_get(ggtt->gt->xe);
>  	mutex_lock(&ggtt->lock);
>  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
>  					  alignment, 0, start, end, 0);
>  	if (!err)
>  		xe_ggtt_map_bo(ggtt, bo);
>  	mutex_unlock(&ggtt->lock);
> +	xe_device_mem_access_put(ggtt->gt->xe);
>  
>  	return err;
>  }
> @@ -311,6 +315,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  
>  void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>  {
> +	xe_device_mem_access_get(ggtt->gt->xe);
>  	mutex_lock(&ggtt->lock);
>  
>  	xe_ggtt_clear(ggtt, node->start, node->size);
> @@ -320,6 +325,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>  	xe_ggtt_invalidate(ggtt->gt);
>  
>  	mutex_unlock(&ggtt->lock);
> +	xe_device_mem_access_put(ggtt->gt->xe);
>  }
>  
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 20f8f0aae6b4..1961e9bc79f1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -114,7 +114,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	 * need to be updated.
>  	 */
>  
> -	xe_device_mem_access_get(gt->xe);
>  	mutex_lock(&guc->ct.lock);
>  	seqno = gt->tlb_invalidation.seqno;
>  	if (fence) {
> @@ -143,7 +142,6 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>  	if (ret < 0 && fence)
>  		invalidation_fence_signal(fence);
>  	mutex_unlock(&guc->ct.lock);
> -	xe_device_mem_access_put(gt->xe);
>  
>  	return ret;
>  }
> -- 
> 2.40.1
> 
