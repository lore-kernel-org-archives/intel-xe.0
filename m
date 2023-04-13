Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34299C77B6C
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 06:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50A010EA34;
	Thu, 13 Apr 2023 06:31:42 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEEF10EA34
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 06:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681367500; x=1712903500;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wr4QIIita6m2xXgEKdaAR4iZignGNAvTn9tPs5nyIQo=;
 b=JgEr5nTrdm7Tb/4sDhcQmocAVq+nrO4D0/pD7rqvB8TBYMtkw9bfwrVv
 hPQCXqC4c4KrYJaJnzeZQ0yw8BFCPh5MiQC8EbyJ4CDmBIESsLaFgLCUF
 Vnmpb10hbNbBhTbWqhmWaQJTvGSeSFte1QV/IWKncyDEHXzrh6sBe2yIP
 N8WGWBiW4v74M3hMSbHQvULKO2/tU/fLXvqObH6Xmz5crAqiCvHOTzKEh
 X4di5ACYPFzZvxEkz36j+beO2gbLKw5Z8/c/dGdlA1tcsxRYwCzodRC84
 vQV24pRzeeWFYp+klQtcarHL1Sbcmhhf7UdQhqzkny2lGAduuB8keOS2T Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341597833"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="341597833"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 23:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="758563812"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; d="scan'208";a="758563812"
Received: from ntusk-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.31.104])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2023 23:31:38 -0700
Date: Thu, 13 Apr 2023 08:31:36 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <20230413063136.irlm6cuv5zjnlwat@zkempczy-mobl2>
References: <20230328130826.61029-1-zbigniew.kempczynski@intel.com>
 <20230403184807.177d7ef5@maurocar-mobl2>
 <6f78a6e3-31d0-1b27-e98f-4d2d70421e06@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f78a6e3-31d0-1b27-e98f-4d2d70421e06@linux.intel.com>
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

On Wed, Apr 12, 2023 at 04:07:38PM +0200, Maarten Lankhorst wrote:
> 
> On 2023-04-03 18:48, Mauro Carvalho Chehab wrote:
> > On Tue, 28 Mar 2023 15:08:26 +0200
> > Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> wrote:
> > 
> > > Driver may alter bo size requested by the user. Return real object
> > > size to make userspace aware how to arrange vm bindings.
> > > 
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index e4d079b61d52..410e797931ac 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1564,6 +1564,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> > >   		return err;
> > >   	args->handle = handle;
> > > +	args->size = bo->size;
> > >   	return 0;
> > >   }
> > An alternative approach would be instead to return -EINVAL if the
> > buffers aren't aligned. Something like this (untested) patch.
> > 
> > Regards,
> > Mauro
> > 
> > [PATCH] xe/xe_bo: Don't allow creating unaligned buffers
> > 
> > Ensure that bo will always be properly aligned.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index f25257bbfc65..ecc04b887790 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -985,6 +985,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> >   	};
> >   	struct ttm_placement *placement;
> >   	uint32_t alignment;
> > +	size_t aligned_size;
> >   	int err;
> >   	/* Only kernel objects should set GT */
> > @@ -993,24 +994,28 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> >   	if (XE_WARN_ON(!size))
> >   		return ERR_PTR(-EINVAL);
> > -	if (!bo) {
> > -		bo = xe_bo_alloc();
> > -		if (IS_ERR(bo))
> > -			return bo;
> > -	}
> > -
> > -	bo->requested_size = size;
> >   	if (flags & (XE_BO_CREATE_VRAM0_BIT | XE_BO_CREATE_VRAM1_BIT |
> >   		     XE_BO_CREATE_STOLEN_BIT) &&
> >   	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
> >   	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
> > -		size = ALIGN(size, SZ_64K);
> > +		aligned_size = ALIGN(size, SZ_64K);
> >   		flags |= XE_BO_INTERNAL_64K;
> >   		alignment = SZ_64K >> PAGE_SHIFT;
> >   	} else {
> > +		aligned_size = ALIGN(size, SZ_4K);
> > +		flags &= ~XE_BO_INTERNAL_64K;
> >   		alignment = SZ_4K >> PAGE_SHIFT;
> >   	}
> > +	if (aligned_size != size)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (!bo) {
> > +		bo = xe_bo_alloc();
> > +		if (IS_ERR(bo))
> > +			return bo;
> > +	}
> > +
> >   	bo->gt = gt;
> >   	bo->size = size;
> >   	bo->flags = flags;
> 
> Hey,
> 
> This looks much better. Can we also make sure that if the kernel tries to
> allocate a 4k buffer we get a louder warning?

Hi.

Currently there's ~ dozen+ of places where kernel tries to allocate
smaller buffers (xe_bo_create_pin_map() path). I tried to fix all
of them but I still have no success with loading the driver this way.

Mauro suggested to forbid aligning for bo create ioctl path, I've tried
two changes:
1. introduce XE_BO_IOCTL_CREATE flag to distinct creation the buffer,
2. allow align for type != ttm_bo_type_device.

Both changes works for me.

According to 4K buffer - I've observed kernel allocates for example
scratch pages in system memory and allocation == 4K, so I'm not sure
we should warn this.

Anyway - I would like to be unblocked to prepare igt kms changes,
so I'm planning to send minimal patch which will start returning EINVAL
for misaligned size. I think we can polish this later, as for me
this uapi contract is most important at the moment.

--
Zbigniew

> 
> ~Maarten
> 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index a430d1568890..f8a55ef9e789 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -273,10 +273,8 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> >   		xe_ggtt_set_pte(ggtt, start + offset, pte);
> >   	}
> > -	if (bo->size == bo->requested_size) {
> > -		pte = xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
> > -		xe_ggtt_set_pte(ggtt, start + bo->size, pte);
> > -	}
> > +	pte = xe_ggtt_pte_encode(ggtt->scratch ?: bo, 0);
> > +	xe_ggtt_set_pte(ggtt, start + bo->size, pte);
> >   	if (ggtt->invalidate) {
> >   		xe_ggtt_invalidate(ggtt->gt);
> > @@ -309,11 +307,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> >   	 * fact we have programmed this GGTT entry to a valid entry. BO aligned
> >   	 * to 64k already have padding so no need to add an extra page.
> >   	 */
> > -	if (bo->size == bo->requested_size) {
> > -		size += SZ_4K;
> > -		if (end != U64_MAX)
> > -			end += SZ_4K;
> > -	}
> > +        size += alignment;
> > +        if (end != U64_MAX)
> > +                end += alignment;
