Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36542C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 09:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CD810E0D2;
	Fri, 12 Jul 2024 09:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a387/09A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D08D89DFC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720774820; x=1752310820;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EuT1u4UCoLoIwjd9umtqgsiEQsqhxwgF1LjeVJO3bds=;
 b=a387/09A04Ipgtj3DRgrYHWfdYce754xm55RBdJlZoTkf7w9k2xM2FWg
 YFJ8ltGozrtWPPA6NsvrHADlDQ/Tkkadms9JO6TiAdgFJYVWhWhWizo9Q
 QgKSb4wIi8Joi1Rgw13eI80sknJ+6GE5xnmeYAHIjVXamSsCxbKnSqYMP
 0ZSjZ9AHHnOkfEumLpENS3s/+C/5dwzQThDhNjJSMS+QUgvN5OM7bAUmy
 g37u3i/pTtSHLaz/zbppX8lBHXWqZ0YZG3jeeXumqeX8fvS8rkCQBJaJc
 eBaHmNCpehaJBWo87Vhg9QfJ8C7sS+ZAGWcnngKU6vmT5U1ED8GRcn+pN w==;
X-CSE-ConnectionGUID: bcnqw9x3QZqqqDNQUfsmbA==
X-CSE-MsgGUID: uhNvsKrMSvqmca3QKS2xGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18050081"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18050081"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 02:00:19 -0700
X-CSE-ConnectionGUID: DNLiRKRVTkG6jhhbzymDqw==
X-CSE-MsgGUID: WtoR4O+6SjiamhP89sR1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="54038827"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.45])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 02:00:17 -0700
Date: Fri, 12 Jul 2024 11:00:13 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Expose display alignment requirement
Message-ID: <20240712090013.ex2peruaomb6q5e5@zkempczy-mobl2>
References: <20240711090925.179366-1-zbigniew.kempczynski@intel.com>
 <20240711090925.179366-3-zbigniew.kempczynski@intel.com>
 <ZpBSOJRDHJfmsX_h@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpBSOJRDHJfmsX_h@intel.com>
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

On Thu, Jul 11, 2024 at 05:44:24PM -0400, Rodrigo Vivi wrote:
> 
> On Thu, Jul 11, 2024 at 11:09:24AM +0200, Zbigniew Kempczyński wrote:
> 
> Please use prefix 'drm/xe/uapi:' on the commit subject for anything
> touching uapi.
> 
> And also documentation please.

Ok, I'm going to retag this to drm/xe/uapi.

Hmm, I've added this similar to MIN_ALIGNMENT (see on the bottom of the
patch). Do you want to elaborate this more? I thought xe_drm.h is
appropriate place to document this flag.

> 
> But more then that, we need to engage first with userspace and get
> them to implement this.

I'm aware that BMG display complicated things a bit. As it supports
4K on vram I think switching vram_flags to XE_VRAM_FLAGS_NEED64K will
work, but we loose 4K granularity on vram so imo there's a waste
of memory for smaller allocations.

> 
> > Scanout buffer on Battlemage requires allocation in 64K contigues
> > pages to support Tile4 + compression what differs from normal bo
> > requirements. Expose display alignment configuration to userspace
> > to ensure it will properly align requested memory.
> 
> We should probably consider something that aligns better with
> the default alignment that comes from the min_page_size
> from struct drm_xe_mem_region.

At the moment I see following options:

1. change xe_graphics_desc bmg to:
   .vram_flags = XE_VRAM_FLAGS_NEED64K
   at cost of loosing 4K granularity on vram

2. add new flag as I proposed; we may burn out one reserved u64 (u32)
   and expose min_display_page_size. But I'm not sure should we follow
   this way as display is not taken from system memory but vram
   (this field will be inappropriate set for system memory).

3. add new flag as I proposed, and expose this in via config query
   (current proposal).

4. any other ideas?

> 
> BTW: This will be a big impact in Media because right now they are
> having to use SCANOUT flag for every buffer since they have no
> ways to know upfront what buffers they will send to display.

If media will use buffer which is Tile4 + compressed I think they
will have no choice and they will need to allocate buffers in 64K contigues
chunks somehow.

At the moment I've mitigated this issue seen in kms_ccs for bmg
in series: https://patchwork.freedesktop.org/series/135994/
but this is not temporary and not fully correct solution until kernel
will switch to 64K physical alignment for scanout buffers.

--
Zbigniew

> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c | 4 +++-
> >  include/uapi/drm/xe_drm.h     | 3 +++
> >  2 files changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 4e01df6b1b7a..c32894f3eea1 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -313,7 +313,7 @@ static int query_mem_regions(struct xe_device *xe,
> >  
> >  static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> >  {
> > -	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
> > +	const u32 num_params = DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT + 1;
> >  	size_t size =
> >  		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
> >  	struct drm_xe_query_config __user *query_ptr =
> > @@ -342,6 +342,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> >  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> >  	config->info[DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY] =
> >  		xe_exec_queue_device_get_max_priority(xe);
> > +	config->info[DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT] =
> > +		xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K ? SZ_64K : SZ_4K;
> >  
> >  	if (copy_to_user(query_ptr, config, size)) {
> >  		kfree(config);
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 19619d4952a8..c7a930dbf58c 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -398,6 +398,8 @@ struct drm_xe_query_mem_regions {
> >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> >   *  - %DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY - Value of the highest
> >   *    available exec queue priority
> > + *  - %DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT - Alignment of contigous physical
> > + *    memory allocation required by the display, typically SZ_4K or SZ_64K
> >   */
> >  struct drm_xe_query_config {
> >  	/** @num_params: number of parameters returned in info */
> > @@ -412,6 +414,7 @@ struct drm_xe_query_config {
> >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> > +#define DRM_XE_QUERY_CONFIG_DISPLAY_ALIGNMENT		5
> >  	/** @info: array of elements containing the config info */
> >  	__u64 info[];
> >  };
> > -- 
> > 2.34.1
> > 
