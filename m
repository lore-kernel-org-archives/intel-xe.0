Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BFDCDB479
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 15:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFF310F30E;
	Thu, 25 Jun 2026 15:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="fdG2M2ko";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C8210F30E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 15:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1782401704;
 bh=z24GRN6j8dODqspsuZloyATufXP2tQVtm+gI40+hsyg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fdG2M2ko0AYupMFqDl4n0dHdUu8G3mh4WIytr2KD4oU3O4ilZKtBTM02C0Z7R0Iuk
 fROK4Efi1NNoL9mwopsNQ7zOthQeGfrSRe1kkO8SdVrrhtgKWxnXSawYpqFTzVECGq
 FhH74wIbam6M5Q2cu7jbW9UThH412tfgmQBvKVNbPKYcvj0jAf/VFDSJnjAIVnPLB6
 jkR7R+uTWfq+F4AQEOdj06AoyyLgeuOGJsKI4HxSZPP5hgto4M54t1woOwFAkNaF12
 tb+mx8GogjcAGFFwJWFmAfHOTe7a3HxC1mFuIJ+oXICV5koGvo4zD/P8MciAv0J8zW
 +0TRT3SThGzyA==
Message-ID: <d5be431c-8393-4846-95b8-c30cbceed51b@lankhorst.se>
Date: Thu, 25 Jun 2026 17:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: skip FORCE_WC and vm_bound check for
 external dma-bufs
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20260612170501.550816-2-matthew.auld@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260612170501.550816-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hello,

On 6/12/26 19:05, Matthew Auld wrote:
> Currently, xe_display_bo_framebuffer_init() unconditionally attempts to
> apply XE_BO_FLAG_FORCE_WC to the buffer and rejects the FB creation with
> -EINVAL if the BO is already VM_BINDed.
> 
> However, for imported dma-bufs (ttm_bo_type_sg), this check doesn't seem
> to make much sense since CPU caching policy is entirely controlled by
> the exporter. Plus there is no place to set this flag, in the first
> place. Also this is not rejected if not yet vm_binded, but that seems
> arbitrary since setting or not setting FORCE_WC should a noop either
> way, at this stage, and whether it is currently VM_BINDed makes no
> difference.
> 
> Currently if we run an app and offload rendering to an external dGPU,
> like NV or another xe device, the dma-buf passed back to the compositor
> (igpu) will be an actual external import from xe pov, and it will be
> missing FORCE_WC, and if the compositor side did a VM_BIND before
> turning into it into an fb the whole thing gets rejected.
> 
> So it looks like we either need to reject outright, no matter what, or
> this usecase is valid and we need to loosen the restriction for sg
> buffers.  Proposing here to loosen the restriction.
> 
> Assisted-by: Gemini:gemini-3.1-pro-preview
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7919
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/display/xe_display_bo.c | 3 ++-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c     | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
> index 7fbac223b097..8953da0136dc 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
> @@ -48,7 +48,8 @@ static int xe_display_bo_framebuffer_init(struct drm_gem_object *obj,
>  	if (ret)
>  		goto err;
>  
> -	if (!(bo->flags & XE_BO_FLAG_FORCE_WC)) {
> +	if (!(bo->flags & XE_BO_FLAG_FORCE_WC) &&
> +	    bo->ttm.type != ttm_bo_type_sg) {
>  		/*
>  		 * XE_BO_FLAG_FORCE_WC should ideally be set at creation, or is
>  		 * automatically set when creating FB. We cannot change caching
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index f93c98bec5b5..5f4a0cd8deca 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -331,7 +331,8 @@ static struct i915_vma *__xe_pin_fb_vma(struct drm_gem_object *obj, bool is_dpt,
>  	int ret = 0;
>  
>  	/* We reject creating !SCANOUT fb's, so this is weird.. */
> -	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC));
> +	drm_WARN_ON(bo->ttm.base.dev, !(bo->flags & XE_BO_FLAG_FORCE_WC) &&
> +		    bo->ttm.type != ttm_bo_type_sg);
>  
>  	if (!vma)
>  		return ERR_PTR(-ENODEV);

Yeah we cannot actually set the force flag on imported bo's for mmap coherency, but mmap on an imported dma-buf should be forbidden anyway, so that is fine.

Best we can hope for is that dirtyfb is called correctly.

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>

