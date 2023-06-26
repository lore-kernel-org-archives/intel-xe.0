Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F59EB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 18:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2A610E178;
	Mon, 26 Jun 2023 18:07:18 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76B610E20F
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687802837; x=1719338837;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8k7WHW4Y5QXRPqdBfwwDp/R1YOPmCLIO7aDytQp8EcA=;
 b=N2rKEXwaoF/e2obPE055VV2Wmh8j777lfC0nzd4VFEjHayWVauZXgjDn
 3uQarCNUA/QKyTR52U24Y414ABRG1joNp1SxFkWQpS1VadxrC46cJkbrA
 g4HsRk2P3nYShpJNPKyMbyFmZBHRwHfbYQUPGepIOZs21ojslLhhSRpFh
 0Ibam2NqH8Z81wBR7K155iXjqXsGhUGL0HoUzN61IlHu0hDG9//XUhUEb
 ioKGPJsVHY+Jt0nsTM2fYGkpMig5/vgQI0QUtGp0L9cXiQnKff4Va0Nbi
 P5hhojzdXhT3FbBPCqgan3jOQMvzYbi8efo8mPJyXPEG0ZJocey9XBKi6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341685264"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="341685264"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 11:07:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="840372504"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="840372504"
Received: from ashlykov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.0.92])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 11:07:01 -0700
Date: Mon, 26 Jun 2023 20:06:58 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <20230626180658.othglez5d53efdka@zkempczy-mobl2>
References: <20230626144239.158345-1-zbigniew.kempczynski@intel.com>
 <06d040ea-c25b-9fdc-aa22-6e0f543a734f@linux.intel.com>
 <20230626152234.f5ud4klmqqm5lb72@zkempczy-mobl2>
 <797860c4-2033-1e2d-c2d7-3776e902db7f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <797860c4-2033-1e2d-c2d7-3776e902db7f@linux.intel.com>
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/bo: Return object bo size on create
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

On Mon, Jun 26, 2023 at 06:16:06PM +0200, Thomas Hellström wrote:
> 
> On 6/26/23 17:22, Zbigniew Kempczyński wrote:
> > On Mon, Jun 26, 2023 at 04:55:29PM +0200, Thomas Hellström wrote:
> > > Hi, Zbigniew,
> > > 
> > > On 6/26/23 16:42, Zbigniew Kempczyński wrote:
> > > > Driver may alter bo size requested by the user. Return real object
> > > > size to make userspace aware how to arrange vm bindings.
> > > I think for Xe VM_BIND, the space needed for a bo with given size must be
> > > 
> > > ALIGN_TO(bo->size, xe_get_default_alignment())
> > > 
> > > (xe_get_default_alignment() being an igt xe lib function).
> > You mean I can't glue 4K system object with 64K one after another,
> > for example:
> > 
> > * bo on system: offset = 0x1000, size 0x1000
> > * bo on vram:   offset = 0x2000, size 0x10000
> > 
> > This won't work as vram object should be aligned on vm to 0x10000?
> 
> Yes that won't work, since a VRAM-capable bo needs 64K alignment.
> 
> Although the explanation above ignores that system-only bo objects appears
> to always allow 4K offset and size, which of course can be discussed.
> 
> So with the current uAPI, it appears the bind alignment and size could
> always be calculated using:
> 
> if (bo_has_VRAM_placement() && xe_get_default_alignment() > 4K) {
>    bind_size = ALIGN_TO(bo->size, xe_get_default_alignment());
>    offset_alignment = xe_get_default_alignment();
> } else {
>    bind_size = bo->size;
>    offset_alignment = 4K;
> }

offset_alignment = xe_get_default_alignment() is enough, as for
integrated we got only one region and min_page_size is 4K. For discrete
system objects just won't be adjacent (if I'm not wrong this lead to
bigger ppgtt).

> 
> What I'm a bit afraid of is that if we return a size different from
> bo->size, then UMD might start using that extra size for data, while it
> really shouldn't. Would it be possible to return an alignment instead that
> needs to be used by UMD for bind offset and bind size?

Technically we got those alignments (for regions) - they can be get from
min_page_size for some region. Problem I see is when user will create
an object with flags = SYSTEM | VRAM. How to properly do vmbind in case?
I mean sth like snippet below:

size = 0x2000;
bo = xe_bo_create_flags(fd, size, SYSTEM | VRAM);

If I don't know on which region this object is created how can I prepare
vm-bind range properly? May I use 0x2000 as size for object created
in vram or this gpu mapping should be aligned to 64K?

--
Zbigniew

> 
> /Thomas
> 
> > 
> > --
> > Zbigniew
> > 
> > > Even the padded bo->size returned with this patch is lower than the value
> > > above. If you use that value, will the value assigned below still be needed.
> > > 
> > > /Thomas
> > > 
> > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_bo.c | 1 +
> > > >    1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 71a14e1f25be..55dbb374a787 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1744,6 +1744,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> > > >    		return err;
> > > >    	args->handle = handle;
> > > > +	args->size = bo->size;
> > > >    	return 0;
> > > >    }
