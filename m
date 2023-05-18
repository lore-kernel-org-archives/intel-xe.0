Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47E2C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 17:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D0E10E53F;
	Thu, 18 May 2023 17:55:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA0D10E545
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 17:55:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1AADC60DDF;
 Thu, 18 May 2023 17:55:17 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 31A6FC433EF;
 Thu, 18 May 2023 17:55:15 +0000 (UTC)
Date: Thu, 18 May 2023 13:55:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZGZmgV9AgVnKN9D3@rdvivi-mobl4>
References: <20230517162918.59058-1-jose.souza@intel.com>
 <ZGZefKnOnVm9rHfY@rdvivi-mobl4>
 <f4a7e0ec905b4e7b74afb9fb7d0588f2bcd37400.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4a7e0ec905b4e7b74afb9fb7d0588f2bcd37400.camel@intel.com>
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 05:28:43PM +0000, Souza, Jose wrote:
> On Thu, 2023-05-18 at 13:21 -0400, Rodrigo Vivi wrote:
> > On Wed, May 17, 2023 at 09:29:18AM -0700, José Roberto de Souza wrote:
> > 
> > The patch itself looks good, but I believe that I might be confused
> > by the commit message. so a few questions here:
> > 
> > > OpenGL stack makes scanout buffers exported as well because usually
> > > it will be exported from client application to compositor.
> > > 
> > > Exported buffers needs to be placed in SMEM so it can be accessed
> > > by different GPUs if needed,
> > 
> > so, if it needs SMEM, why are you migrating to LMEM?
> 
> Display can only scanout from lmem or prime imported buffers.
> 
> > 
> > > so in discrete GPUs it is placed in
> > > SMEM+LMEM.
> > 
> > I see the code migrating to LMEM, but not migrating LMEM to SMEM,
> > what am I missing?
> 
> Don't know this one but probably when accessing the prime buffer somewhere in Xe code the buffer data is migrated from lmem to smem.

Indeed, at xe_dma_buf_pin()

> 
> > 
> > > 
> > > But this combination is causing aplications like kmscube to be able
> > > to create framebuffers.
> > 
> > to be able or to *not* be able? what's the real current issue?
> 
> ops will add the missing "not", here.
> The real issue is that some compositors can't create framebuffers so it fails to initialize leaving user in cli.

with the not, already add

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> > 
> > > 
> > > So here doing the same handling as i915 and allowing bos that can
> > > migrate to lmem0/vram0 to be promoted to framebuffer.
> > 
> > okay, this phrase is why I believe the commit is doing what it should,
> > but the above messages confused me a bit....
> > 
> > > 
> > > At least all current discrete GPUs with display only have one lmem
> > > region, so we don't need to check for vram1 but we might need to
> > > extend it in future.
> > 
> > ack on this part.
> > 
> > > 
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_fb.c | 5 +++--
> > >  drivers/gpu/drm/xe/display/xe_fb_pin.c  | 7 ++++++-
> > >  2 files changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> > > index 015aacbad1b11..feb8a0f5fbdf6 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_fb.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> > > @@ -2121,8 +2121,9 @@ intel_user_framebuffer_create(struct drm_device *dev,
> > >  		return ERR_PTR(-ENOENT);
> > >  
> > >  	obj = gem_to_xe_bo(gem);
> > > -	/* Require vram exclusive objects, but allow dma-buf imports */
> > > -	if (IS_DGFX(i915) && obj->flags & XE_BO_CREATE_SYSTEM_BIT &&
> > > +	/* Require vram placement or dma-buf import */
> > > +	if (IS_DGFX(i915) &&
> > > +	    !xe_bo_can_migrate(gem_to_xe_bo(gem), XE_PL_VRAM0) &&
> > >  	    obj->ttm.type != ttm_bo_type_sg) {
> > >  		drm_gem_object_put(gem);
> > >  		return ERR_PTR(-EREMOTE);
> > > diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > index ed691d28b34d7..c7c4df18e439b 100644
> > > --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> > > @@ -183,6 +183,8 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
> > >  static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> > >  					const struct i915_gtt_view *view)
> > >  {
> > > +	struct drm_device *dev = fb->base.dev;
> > > +	struct xe_device *xe = to_xe_device(dev);
> > >  	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
> > >  	struct xe_bo *bo = intel_fb_obj(&fb->base);
> > >  	int ret;
> > > @@ -204,7 +206,10 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
> > >  	if (ret)
> > >  		goto err;
> > >  
> > > -	ret = xe_bo_validate(bo, NULL, true);
> > > +	if (IS_DGFX(xe))
> > > +		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
> > > +	else
> > > +		ret = xe_bo_validate(bo, NULL, true);
> > >  	if (!ret)
> > >  		ttm_bo_pin(&bo->ttm);
> > >  	ttm_bo_unreserve(&bo->ttm);
> > > -- 
> > > 2.40.1
> > > 
> 
