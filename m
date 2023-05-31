Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2A2C77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 12:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADC310E1C6;
	Wed, 31 May 2023 12:52:38 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCAE10E1C6
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685537557; x=1717073557;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hsE3KuCloJ35+TV/pE0za4Lk0sp96FP1BxxxvVUuQqE=;
 b=jsHGsBCqA6mrh4t9W7X9RaZ8XXlv/umzokd/rgkaXqyEYbdbxuaZMbqQ
 6Jnvfva7y0fZjxllrEVtkNBf5kLgaIpk2yWABSwNnHpTnELwXAuXgbQMa
 khHIHcc/px2cUD5p2BHUu6hUAf1508/p5ehz4FL6QzWHPiaEZgP2+vB96
 sQTRG3RVZmBqfwa48hXxRoNAOoDViYeJArjXZomfHB14BCH8dE+YbiIUc
 jLdMDYs5MCIundCgO+zXeMfdp307wkPhdXo/rLRgVoLhBJYYtRDDGgwwY
 uNbAgvf8PxoZNvbn3F639+FFw+JInh5JySeETnvVwM8lIa7nF49xQ5ZnN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="334846765"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="334846765"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 05:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="657319060"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="657319060"
Received: from arutkows-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.8.86])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 05:52:34 -0700
Date: Wed, 31 May 2023 14:52:32 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <20230531125232.a55ccjzfm7divj3n@zkempczy-mobl2>
References: <20230413065645.187171-1-zbigniew.kempczynski@intel.com>
 <d18c10ec-bb41-f142-70dd-1788259f9045@linux.intel.com>
 <29d1ab33fa487525dbd05ff59650bae6ca9f310a.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29d1ab33fa487525dbd05ff59650bae6ca9f310a.camel@intel.com>
Subject: Re: [Intel-xe] [PATCH] xe/xe_bo: Reject bo creation of unaligned
 size
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 05:40:08PM +0200, Souza, Jose wrote:
> On Thu, 2023-04-20 at 10:52 +0200, Thomas Hellström wrote:
> > +Maarten
> > 
> > Hi, Zbigniew, Mauro
> > 
> > On 4/13/23 08:56, Zbigniew Kempczyński wrote:
> > > From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > > 
> > > For xe bo creation we request passing size which matches system or
> > > vram minimum page alignment. This way we want to ensure userspace
> > > is aware of region constraints and not aligned allocations will be
> > > rejected returning EINVAL.
> > 
> > Personally, I think the alignment constraints is a property / 
> > restriction of the Xe GPU binding that should not interfere with bo 
> > creation / size that should instead reflect the size of the data we need 
> > to store. So the alignment constraints should apply only to the GPU VA 
> > space allocation. This would also make the semantics of importing 
> > dma-bufs of unaligned size straightforward.
> 
> Seconded!
> In my opinion it should only set the size allocated by Xe KMD in drm_xe_gem_create.size and leave the rest as is.
> 

I'm sorry but I don't follow. Which strategy then should apply? This
with reject (in this patch) or in

https://patchwork.freedesktop.org/patch/529204/?series=115726&rev=1

?
--
Zbigniew

> > 
> > Although admittedly I'm not fully up-to-date with the discussion 
> > preceding the choice to return -EINVAL if the bo size is not aligned to 
> > our GPU binding constraints. (Maarten, could you perhaps fill in?)
> > 
> > Thanks,
> > 
> > Thomas
> > 
> > 
> > 
> > 
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c | 23 ++++++++++++++++-------
> > >   include/uapi/drm/xe_drm.h  |  5 ++---
> > >   2 files changed, 18 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index 3ab404e33fae..d3972c84bcce 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1090,6 +1090,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >   	};
> > >   	struct ttm_placement *placement;
> > >   	uint32_t alignment;
> > > +	size_t aligned_size;
> > >   	int err;
> > >   
> > >   	/* Only kernel objects should set GT */
> > > @@ -1098,22 +1099,30 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > >   	if (XE_WARN_ON(!size))
> > >   		return ERR_PTR(-EINVAL);
> > >   
> > > -	if (!bo) {
> > > -		bo = xe_bo_alloc();
> > > -		if (IS_ERR(bo))
> > > -			return bo;
> > > -	}
> > > -
> > >   	if (flags & (XE_BO_CREATE_VRAM_MASK | XE_BO_CREATE_STOLEN_BIT) &&
> > >   	    !(flags & XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT) &&
> > >   	    xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) {
> > > -		size = ALIGN(size, SZ_64K);
> > > +		aligned_size = ALIGN(size, SZ_64K);
> > > +		if (type != ttm_bo_type_device)
> > > +			size = ALIGN(size, SZ_64K);
> > >   		flags |= XE_BO_INTERNAL_64K;
> > >   		alignment = SZ_64K >> PAGE_SHIFT;
> > > +
> > >   	} else {
> > > +		aligned_size = ALIGN(size, SZ_4K);
> > > +		flags &= ~XE_BO_INTERNAL_64K;
> > >   		alignment = SZ_4K >> PAGE_SHIFT;
> > >   	}
> > >   
> > > +	if (type == ttm_bo_type_device && aligned_size != size)
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	if (!bo) {
> > > +		bo = xe_bo_alloc();
> > > +		if (IS_ERR(bo))
> > > +			return bo;
> > > +	}
> > > +
> > >   	bo->gt = gt;
> > >   	bo->size = size;
> > >   	bo->flags = flags;
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index b0b80aae3ee8..d3e64af7eabb 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -259,9 +259,8 @@ struct drm_xe_gem_create {
> > >   	__u64 extensions;
> > >   
> > >   	/**
> > > -	 * @size: Requested size for the object
> > > -	 *
> > > -	 * The (page-aligned) allocated size for the object will be returned.
> > > +	 * @size: Size of the object to be created, must match region
> > > +	 * (system or vram) minimum alignment.
> > >   	 */
> > >   	__u64 size;
> > >   
> 
