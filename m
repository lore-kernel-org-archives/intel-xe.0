Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F031FCF34CC
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 21:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE06E10E977;
	Thu,  3 Oct 2024 21:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rfz6Yesz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF31110E977;
 Thu,  3 Oct 2024 21:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727992382; x=1759528382;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iGJDmzK9l4aiL2vhooqQWHaAbnBzRjHuRCEQ7W1uhgE=;
 b=Rfz6Yesz/1+sTMCvFVfE5AX5i3JZJMxWeR6LhAxRmVFcYQfh3bp4nIIQ
 BhFkTqt38kpSnIvxqRlo8UggWxPeT8xeuPWo0HrvevQhjl4IG2AtxI4oL
 G90zBQ5AiBp4gFn9MMw/Cimy0QGq4uYaJ8WQBTOKUiJ/YTPrYexx2x04g
 KF3oGbXuHCQBcPJo1hxmPB88sYFsVpx4L5g/eQeMPeqFoN6u98XpNuXs0
 MXMlIuyA9Y6zfQTdU47ZL3upDIadIOcAM7ehl1KZgErUkXzHSgVWELHu4
 u1myswB5rtqtlw0ykgqI+PqEraYkW9u/QqN6yoc/Wh8ou4k/1vd8cs+d6 A==;
X-CSE-ConnectionGUID: SXu5WoR6Rvi7ariQ8JThAw==
X-CSE-MsgGUID: NxRu6so1RFKp8XvaC+1aPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31093845"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="31093845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 14:53:01 -0700
X-CSE-ConnectionGUID: 4EBCTCzEQJe28fU5dLfnJg==
X-CSE-MsgGUID: ESrLZrFDSpa7loHZHFr77g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="74613245"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 14:53:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 00:52:58 +0300
Date: Fri, 4 Oct 2024 00:52:58 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 00/13] drm/i915: Use DSB for plane/color management
 commits
Message-ID: <Zv8SOu0598bMdv5u@intel.com>
References: <20240930170415.23841-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930170415.23841-1-ville.syrjala@linux.intel.com>
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

On Mon, Sep 30, 2024 at 08:04:02PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Use the DSB to perform simple plane/color management commits.
> Anything more complicatd (modesets and fastsets) are still
> punted to the mmio path.
> 
> Also DSB won't be used when any of these are in use:
> - scalers (scaler code needs more work)
> - VRR (need to figure out a race free commit completion scheme)
> - PSR (zero thoughts given for PSR interactions so far)
> - async flips (no real though given here either)
> 
> v2: rebase
> 
> Ville Syrjälä (13):
>   drm/i915/dsb: Avoid reads of the DSB buffer for indexed register
>     writes
>   drm/i915: Prepare clear color before wait_for_dependencies()
>   drm/i915/dsb: Generate the DSB buffer in commit_tail()
>   drm/i915/dsb: Enable programmable DSB interrupt
>   drm/i915/dsb: Introduce intel_dsb_vblank_evade()
>   drm/i915/dsb: Introduce intel_dsb_wait_usec()
>   drm/i915/dsb: Introduce intel_dsb_wait_vblanks()
>   drm/i915: Introduce intel_scanlines_to_usecs()
>   drm/i915/dsb: Introduce intel_dsb_wait_vblank_delay()
>   drm/i915: Extract intel_crtc_prepare_vblank_event()
>   drm/i915: Plumb 'dsb' all way to the plane hooks
>   drm/i915: Plumb 'dsb' all way to the color commit hooks
>   drm/i915/dsb: Use DSB for plane/color management updates

Pushed to drm-intel-next. Thanks for the reviews.

If the world catches fire you know who to blame.

> 
>  drivers/gpu/drm/i915/display/i9xx_plane.c     |  22 +-
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +-
>  .../gpu/drm/i915/display/intel_atomic_plane.c |  49 +--
>  .../gpu/drm/i915/display/intel_atomic_plane.h |  19 +-
>  drivers/gpu/drm/i915/display/intel_color.c    | 207 ++++++------
>  drivers/gpu/drm/i915/display/intel_color.h    |   7 +-
>  drivers/gpu/drm/i915/display/intel_crtc.c     |  37 ++-
>  drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
>  drivers/gpu/drm/i915/display/intel_cursor.c   | 101 +++---
>  drivers/gpu/drm/i915/display/intel_de.h       |  11 +
>  drivers/gpu/drm/i915/display/intel_display.c  | 180 ++++++++---
>  .../drm/i915/display/intel_display_types.h    |  23 +-
>  drivers/gpu/drm/i915/display/intel_dsb.c      | 137 ++++++--
>  drivers/gpu/drm/i915/display/intel_dsb.h      |   7 +
>  .../drm/i915/display/intel_modeset_setup.c    |   4 +-
>  drivers/gpu/drm/i915/display/intel_sprite.c   |  27 +-
>  .../drm/i915/display/skl_universal_plane.c    | 305 ++++++++++--------
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
>  18 files changed, 735 insertions(+), 413 deletions(-)
> 
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
