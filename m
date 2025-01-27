Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B220C02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 17:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F05910E096;
	Mon, 27 Jan 2025 17:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hL3ocaT4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1C010E096;
 Mon, 27 Jan 2025 17:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737998867; x=1769534867;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hzB9wzuXdqktHqh/49C5AqOld2aPFFpLA5TZiTldzD0=;
 b=hL3ocaT4IiRAb48PClu+72Iuzr6/h1/zPIqdGN+kpdin+Bxx7Q2JQ7i0
 IfstrcGzRUIwjnix61yTbRGZs7aRWZOznMHloqz76LeY+cKpgRk5lrZzs
 PFytBkXaou3toV9vpQowV/r9wydIEun4eSDYE2rcUqgpSUw1eadsQUYBZ
 8urRDK3GjcpXKdiwB5LHBc14sVYzU3bcLgI6mvi+T8DpztLFi/R/A7WTa
 w9Fj8s5YSfVbmxkFjqZJUltU0QInI7t1bV6QR6wPU+WGZRRnsYVLWQKww
 NxNAe+PkNncoAlOl4Nhhxa7OjAcuUQsn44+HuPsilMB0XBLZM5ZkIpOgH w==;
X-CSE-ConnectionGUID: GWnkJp3zQXCIDNArLd+n3g==
X-CSE-MsgGUID: yqsaHlMgT/6Fu4h91Ie/8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38501762"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="38501762"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 09:27:47 -0800
X-CSE-ConnectionGUID: yVk7Pt+QQ36twyKaq/TXfw==
X-CSE-MsgGUID: I/fm+5jARyWvVHMBavle7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="108610808"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Jan 2025 09:27:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 27 Jan 2025 19:27:44 +0200
Date: Mon, 27 Jan 2025 19:27:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/5] drm/i915: Move VT-d alignment into
 plane->min_alignment()
Message-ID: <Z5fCEEIgHItifhwQ@intel.com>
References: <20250122151755.6928-1-ville.syrjala@linux.intel.com>
 <20250122151755.6928-2-ville.syrjala@linux.intel.com>
 <878qqwbn6d.fsf@intel.com> <Z5e35V4CqZ3m40y-@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5e35V4CqZ3m40y-@intel.com>
X-Patchwork-Hint: comment
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

On Mon, Jan 27, 2025 at 06:44:21PM +0200, Ville Syrjälä wrote:
> On Mon, Jan 27, 2025 at 11:50:34AM +0200, Jani Nikula wrote:
> > On Wed, 22 Jan 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > >
> > > Currently we don't account for the VT-d alignment w/a in
> > > plane->min_alignment() which means that panning inside a larger
> > > framebuffer can still cause the plane SURF to be misaligned.
> > > Fix the issue by moving the VT-d alignment w/a into
> > > plane->min_alignment() itself (for the affected platforms).
> > >
> > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/i9xx_plane.c          | 10 ++++++++++
> > >  drivers/gpu/drm/i915/display/intel_cursor.c        |  5 +++++
> > >  drivers/gpu/drm/i915/display/intel_fb_pin.c        |  8 --------
> > >  drivers/gpu/drm/i915/display/intel_sprite.c        |  5 +++++
> > >  drivers/gpu/drm/i915/display/skl_universal_plane.c |  4 ++++
> > >  5 files changed, 24 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/i9xx_plane.c b/drivers/gpu/drm/i915/display/i9xx_plane.c
> > > index ed171fbf8720..19cc34babef3 100644
> > > --- a/drivers/gpu/drm/i915/display/i9xx_plane.c
> > > +++ b/drivers/gpu/drm/i915/display/i9xx_plane.c
> > > @@ -780,9 +780,14 @@ unsigned int vlv_plane_min_alignment(struct intel_plane *plane,
> > >  				     const struct drm_framebuffer *fb,
> > >  				     int color_plane)
> > >  {
> > > +	struct drm_i915_private *i915 = to_i915(plane->base.dev);
> > > +
> > >  	if (intel_plane_can_async_flip(plane, fb->modifier))
> > >  		return 256 * 1024;
> > >  
> > > +	if (intel_scanout_needs_vtd_wa(i915))
> > > +		return 256 * 1024;
> > 
> > Nitpick, would be great to convert intel_scanout_needs_vtd_wa() to
> > struct intel_display first, so we wouldn't have to introduce so many new
> > struct drm_i915_private uses.
> 
> I didn't really want to add intel_display stuff to the
> gem side (where this is being used currently). Once
> its all moved into the display code (patch 3) then it
> makes more sense.

BTW I do have full conversion of all the low level
plane code (+ a bunch of other stuff including
intel_display_power_{put,get}() stuff) done locally.
But I have quite a few series on the list already
needing review, so not sure I should also post that
one right now. I can, if you especially want something
mundane to read?

-- 
Ville Syrjälä
Intel
