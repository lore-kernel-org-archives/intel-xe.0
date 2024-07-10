Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D33C3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 05:00:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED57910E0BF;
	Wed, 10 Jul 2024 05:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gkax2Fs6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFE410E0BF
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 05:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720587656; x=1752123656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ChPOo3vmJefSVjNDeJ+EQVfVxJfzpmFosCwEF5asmdA=;
 b=Gkax2Fs6k7lUu69KwEbRzzO1cBH0996Q1A6E+KzaNorvuGWcZGFpOYWl
 YB53E11WJmIzb7reb0FRMaETdQRMCiCMtilf9eWdl4yZaGSH6ppM03tC5
 nA78qCFuSc3dzhvdQvxFQN8j74be1F2k/DvKsgYgJGDAojENDiVPsE6xC
 TTOXIyrasfwVJBU7SgVOIdOTVZfw5SVSQ9lEDPKQqJUDVSCYwuu/95wlk
 Hb5yeY0TNZsPvsI5KY3/6mcoKtUfs9uCZoCqXrzcpn4Li6Vnv++LWbEQf
 SoKa74akbXqALJ51lwRI53UsYvwUlFmdBlzd2Z6rnhmsRph1HrqAVtzvg w==;
X-CSE-ConnectionGUID: EODB6/GBQxuQtTF+NU7uAw==
X-CSE-MsgGUID: wXwrx7lxTm6t5ZKDdNBaVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35316758"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="35316758"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 22:00:55 -0700
X-CSE-ConnectionGUID: 6751Td4BQu+JZt4I7mXT8Q==
X-CSE-MsgGUID: DQt0HvevQMG7yLCkyZEXew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="47992890"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.145])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 22:00:54 -0700
Date: Wed, 10 Jul 2024 07:00:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Separate 64K physical allocation for
 display
Message-ID: <20240710050050.dzvshye2euniaac2@zkempczy-mobl2>
References: <20240709122514.538137-1-zbigniew.kempczynski@intel.com>
 <20240709122514.538137-2-zbigniew.kempczynski@intel.com>
 <Zo2KE14JirJ7T3Eh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zo2KE14JirJ7T3Eh@intel.com>
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

On Tue, Jul 09, 2024 at 03:05:55PM -0400, Rodrigo Vivi wrote:
> On Tue, Jul 09, 2024 at 02:25:13PM +0200, Zbigniew Kempczyński wrote:
> > In case Tile4 + compression Battlemage requires physical 64K pages
> > for allocating display framebuffer. Add flag which distincts
> > buffer created for scanout from other buffers which don't need this
> > restriction.
> 
> I believe these 2 patches could be squashed together because this
> phrase here is the explanation for the next patch as well and
> that one just tell what it is doing without telling why.

It's not a problem to squash them. First patch just prepares the
code for the enablement of DISPLAY_NEED64K flag and I separated
them to make potential revert easier.

As you've noticed in your second comment (below) reuse NEED64K flag
is intrusive and requires adding more conditionals in the code for
already enabled platforms. I wanted to avoid this.

At the moment there's no BMG in CI but some IGT code (and UMD as well)
needs to be altered on bo creation for framebuffer (create ioctl() -
it now rejects non aligned to 64K buffers on BMG). I mean with use of
SCANOUT flag on BMG 4K buffer creation will return -EINVAL. Open
question is should we expose information about display requirement
to userspace somehow by some query that scanout buffer needs to be
aligned to 64K. From my perspective userspace can simply probe that
requirement - first trying to create 4K buffer with SCANOUT flag and
increase this to 64K if it fails.

--
Zbigniew

> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > v2: Distinct 64K for Battlemage only (Matt)
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c           | 9 +++++++--
> >  drivers/gpu/drm/xe/xe_device_types.h | 1 +
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 31192d983d9e..fbcf77698bf1 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1984,9 +1984,13 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> >  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
> >  		bo_flags |= XE_BO_FLAG_DEFER_BACKING;
> >  
> > -	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
> > +	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT) {
> >  		bo_flags |= XE_BO_FLAG_SCANOUT;
> >  
> > +		if (xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K)
> > +			bo_flags |= XE_BO_NEEDS_64K;
> > +	}
> > +
> >  	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
> >  
> >  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
> > @@ -2315,8 +2319,9 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
> >  	uint32_t handle;
> >  	int cpp = DIV_ROUND_UP(args->bpp, 8);
> >  	int err;
> > +	u8 flags_64k = XE_VRAM_FLAGS_NEED64K | XE_VRAM_FLAGS_DISPLAY_NEED64K;
> >  	u32 page_size = max_t(u32, PAGE_SIZE,
> > -		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
> > +		xe->info.vram_flags & flags_64k ? SZ_64K : SZ_4K);
> >  
> >  	args->pitch = ALIGN(args->width * cpp, 64);
> >  	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index f0cf9020e463..386faaffac53 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -46,6 +46,7 @@ struct xe_pat_ops;
> >  #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
> >  
> >  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
> > +#define XE_VRAM_FLAGS_DISPLAY_NEED64K	BIT(1)
> 
> I was wondering if we could simply reuse the existing flag, but probably looking
> at the next patch I believe that it could be intrusive and cause other issues.
> So, let's go with this.
> 
> >  
> >  #define XE_GT0		0
> >  #define XE_GT1		1
> > -- 
> > 2.34.1
> > 
