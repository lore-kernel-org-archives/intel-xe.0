Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7438EC7618D
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 05:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4958F10EAD9;
	Thu,  6 Apr 2023 05:37:55 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD4210EAD9
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 05:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680759473; x=1712295473;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=I8EPxBOeXn88kqiCFvbTT8VfJCcvwvp/grhMU+PFdik=;
 b=A5oYhuPcYO+hnaasOcBIL5tKbW8fg00tGuU9Y7r3QQxwL3uIznULKx12
 +3z+yNrtNm/GMjHJkumQb23J2tsJtIVJBsU2rlQhQV7PgPz8FaavaG8+g
 z8CyHLY6p9D1h9dsxzUYiYjwLxLHUt/qM15V41KZZiwUn4XhJS5T04dmG
 xPuY1FZpHc9d2S5xp3sqrP1dJhoezzbGT4yEsC7aBwF5lc6bhCe0XLDJO
 OSRGptNFx96uR9pCCyjAsBzv6U89tlfM1N1vFtIp7NfSglFgBDPrPE98W
 uQPKBkoyQdBDNCH5LMcFugGGFV1jTLWga4SEFotJxHH/8n/tzCn/upxmS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="342656056"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="342656056"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 22:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="664305124"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="664305124"
Received: from amuszyns-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.15.92])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 22:37:51 -0700
Date: Thu, 6 Apr 2023 07:37:47 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <20230406053747.f5bfpo7nt2z7fv3j@zkempczy-mobl2>
References: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
 <20230403184807.177d7ef5@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230403184807.177d7ef5@maurocar-mobl2>
Subject: Re: [Intel-xe] [PATCH] drm/xe/bo: Return object bo size on create
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 06:48:07PM +0200, Mauro Carvalho Chehab wrote:
> On Tue, 28 Mar 2023 15:08:26 +0200
> Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> wrote:
> 
> > Driver may alter bo size requested by the user. Return real object
> > size to make userspace aware how to arrange vm bindings.
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index e4d079b61d52..410e797931ac 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1564,6 +1564,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> >  		return err;
> >  
> >  	args->handle = handle;
> > +	args->size = bo->size;
> >  
> >  	return 0;
> >  }
> 
> An alternative approach would be instead to return -EINVAL if the
> buffers aren't aligned. Something like this (untested) patch.
> 
> Regards,
> Mauro
> 
> [PATCH] xe/xe_bo: Don't allow creating unaligned buffers
> 
> Ensure that bo will always be properly aligned.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index f25257bbfc65..ecc04b887790 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -985,6 +985,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	};
>  	struct ttm_placement *placement;
>  	uint32_t alignment;
> +	size_t aligned_size;
>  	int err;
>  
>  	/* Only kernel objects should set GT */
> @@ -993,24 +994,28 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	if (XE_WARN_ON(!size))
>  		return ERR_PTR(-EINVAL);
>  
> -	if (!bo) {
> -		bo = xe_bo_alloc();
> -		if (IS_ERR(bo))
> -			return bo;
> -	}
> -
> -	bo->requested_size = size;
>  	if (flags & (XE_BO_CREATE_VRAM0_BIT | XE_BO_CREATE_VRAM1_BIT |
>  		     XE_BO_CREATE_STOLEN_BIT) &&
>  	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
>  	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
> -		size = ALIGN(size, SZ_64K);
> +		aligned_size = ALIGN(size, SZ_64K);
>  		flags |= XE_BO_INTERNAL_64K;
>  		alignment = SZ_64K >> PAGE_SHIFT;
>  	} else {
> +		aligned_size = ALIGN(size, SZ_4K);
> +		flags &= ~XE_BO_INTERNAL_64K;
>  		alignment = SZ_4K >> PAGE_SHIFT;
>  	}
>  
> +	if (aligned_size != size)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!bo) {
> +		bo = xe_bo_alloc();
> +		if (IS_ERR(bo))
> +			return bo;
> +	}
> +
>  	bo->gt = gt;
>  	bo->size = size;
>  	bo->flags = flags;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index a430d1568890..f8a55ef9e789 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -273,10 +273,8 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  		xe_ggtt_set_pte(ggtt, start + offset, pte);
>  	}
>  
> -	if (bo->size == bo->requested_size) {
> -		pte = xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
> -		xe_ggtt_set_pte(ggtt, start + bo->size, pte);
> -	}
> +	pte = xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
> +	xe_ggtt_set_pte(ggtt, start + bo->size, pte);
>  
>  	if (ggtt->invalidate) {
>  		xe_ggtt_invalidate(ggtt->gt);
> @@ -309,11 +307,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	 * fact we have programmed this GGTT entry to a valid entry. BO aligned
>  	 * to 64k already have padding so no need to add an extra page.
>  	 */
> -	if (bo->size == bo->requested_size) {
> -		size += SZ_4K;
> -		if (end != U64_MAX)
> -			end += SZ_4K;
> -	}
> +        size += alignment;
> +        if (end != U64_MAX)
> +                end += alignment;
>  
>  	mutex_lock(&ggtt->lock);
>  	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, size,

I'm going to test this patch and let you know.

At the moment I got two concerns:

1. take a look to xe_query.c:query_memory_usage()
   min_page_size is not always 64K whereas current bo create
   path doesn't honour this configuration.

2. xe_drm.h also should be changed to reflect changes
   which disallows kernel modification of size

   struct drm_xe_gem_create {
   ...
	/**
	 * @size: Requested size for the object
	 *
	 * The (page-aligned) allocated size for the object will be returned.
	 */
	__u64 size;

--
Zbigniew
