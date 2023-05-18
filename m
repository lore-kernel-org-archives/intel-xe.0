Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C5BC7EE23
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 17:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3D110E106;
	Thu, 18 May 2023 17:21:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E4810E108
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 17:21:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E13766510A;
 Thu, 18 May 2023 17:21:03 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id EE449C433D2;
 Thu, 18 May 2023 17:21:01 +0000 (UTC)
Date: Thu, 18 May 2023 13:21:00 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZGZefKnOnVm9rHfY@rdvivi-mobl4>
References: <20230517162918.59058-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517162918.59058-1-jose.souza@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: Allow scanout of bos that can be
 migrated to lmem
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 09:29:18AM -0700, José Roberto de Souza wrote:

The patch itself looks good, but I believe that I might be confused
by the commit message. so a few questions here:

> OpenGL stack makes scanout buffers exported as well because usually
> it will be exported from client application to compositor.
> 
> Exported buffers needs to be placed in SMEM so it can be accessed
> by different GPUs if needed,

so, if it needs SMEM, why are you migrating to LMEM?

> so in discrete GPUs it is placed in
> SMEM+LMEM.

I see the code migrating to LMEM, but not migrating LMEM to SMEM,
what am I missing?

> 
> But this combination is causing aplications like kmscube to be able
> to create framebuffers.

to be able or to *not* be able? what's the real current issue?

> 
> So here doing the same handling as i915 and allowing bos that can
> migrate to lmem0/vram0 to be promoted to framebuffer.

okay, this phrase is why I believe the commit is doing what it should,
but the above messages confused me a bit....

> 
> At least all current discrete GPUs with display only have one lmem
> region, so we don't need to check for vram1 but we might need to
> extend it in future.

ack on this part.

> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb.c | 5 +++--
>  drivers/gpu/drm/xe/display/xe_fb_pin.c  | 7 ++++++-
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 015aacbad1b11..feb8a0f5fbdf6 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -2121,8 +2121,9 @@ intel_user_framebuffer_create(struct drm_device *dev,
>  		return ERR_PTR(-ENOENT);
>  
>  	obj = gem_to_xe_bo(gem);
> -	/* Require vram exclusive objects, but allow dma-buf imports */
> -	if (IS_DGFX(i915) && obj->flags & XE_BO_CREATE_SYSTEM_BIT &&
> +	/* Require vram placement or dma-buf import */
> +	if (IS_DGFX(i915) &&
> +	    !xe_bo_can_migrate(gem_to_xe_bo(gem), XE_PL_VRAM0) &&
>  	    obj->ttm.type != ttm_bo_type_sg) {
>  		drm_gem_object_put(gem);
>  		return ERR_PTR(-EREMOTE);
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index ed691d28b34d7..c7c4df18e439b 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -183,6 +183,8 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>  static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
>  					const struct i915_gtt_view *view)
>  {
> +	struct drm_device *dev = fb->base.dev;
> +	struct xe_device *xe = to_xe_device(dev);
>  	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
>  	struct xe_bo *bo = intel_fb_obj(&fb->base);
>  	int ret;
> @@ -204,7 +206,10 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
>  	if (ret)
>  		goto err;
>  
> -	ret = xe_bo_validate(bo, NULL, true);
> +	if (IS_DGFX(xe))
> +		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
> +	else
> +		ret = xe_bo_validate(bo, NULL, true);
>  	if (!ret)
>  		ttm_bo_pin(&bo->ttm);
>  	ttm_bo_unreserve(&bo->ttm);
> -- 
> 2.40.1
> 
