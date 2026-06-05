Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B0CCD6E6B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 02:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7ADE11A3CF;
	Fri,  5 Jun 2026 02:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C73xk66I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8BE11A3CF;
 Fri,  5 Jun 2026 02:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780628372; x=1812164372;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KiUvZJUYR/ZJKYfDh3e7XZbzRiNHUscQ36slfbIP8yE=;
 b=C73xk66IbtgGqI1/8xMRhz824Jp2GAxsnmxGbHDk09JY8ajZ+X0xlKJ+
 ORjREJKKn2ZvfknxY980RDtyzW815xHey01q8bo1FipDQ2LJDwT48AtQF
 earQRY5ZrBHtblL1flMC1Gko9PDJbJZdOGwNaPq5YFz39Igo8ZrQdmAFh
 1ntd0r4Vf30pCNc1nIervlUIsoDT98xdY+XIDQu80aeKpwBiF/2geL5VL
 6XunsFvZfGip54oyhrYBF8w40+wuP4ac5h3armUHkOEGQe+bQQBQKFxsw
 0hU11pq1k1f59wkDFeChYRw5D1r1qyUCe0xoBWqwLQ/8dBseL5RyfZJL7 g==;
X-CSE-ConnectionGUID: XSZkjjwbTWeoCo1pBNiFLQ==
X-CSE-MsgGUID: Hp+9UJHGSjWuQo6HlUwmsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85314543"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="85314543"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 19:59:32 -0700
X-CSE-ConnectionGUID: vD3gR+S9QJmtTkgc/OvC3Q==
X-CSE-MsgGUID: K0Pgboj0R/eitQfmPuY7yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="242232264"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 19:59:31 -0700
Date: Fri, 5 Jun 2026 04:59:28 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 saurabhg.gupta@intel.com, alex.zuo@intel.com
Subject: Re: [PATCH v2] drm/{i915, xe}: Refactor generic_handle_irq_safe()
 error messages
Message-ID: <aiI7kNwFk1ZV0FSy@black.igk.intel.com>
References: <20260604202548.3817343-1-jonathan.cavitt@intel.com>
 <aiI6FCvDEITTnHyc@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiI6FCvDEITTnHyc@black.igk.intel.com>
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

On Fri, Jun 05, 2026 at 04:53:12AM +0200, Raag Jadav wrote:
> On Fri, Jun 05, 2026 at 04:25:48AM +0800, Jonathan Cavitt wrote:
> > Currently, all but one uses of generic_handle_irq_safe() report error
> > messages using .*_err_ratelimited() error reporting helper functions.
> > These helper functions declare their error messages in the following
> > form:
> > 
> > "error handling [COMPONENT NAME] irq: %d\n"
> > 
> > .*_err_ratelimited() already logs "error" as a part of the error
> > message, so declaring the error is redundant.  Reword it.
> > 
> > The last usage of generic_handle_irq_safe() is in xe_i2c_irq_present(),
> > and it currently lacks the same error reporting as in the other cases.
> > This is not intentional, so put some logging here.
> 
> Since you're here, also update these to xe_err_ratelimited() and
> xe_gt_err_ratelimited().

Atleast the xe ones.

Raag

> > v2:
> > - Use drm_err_ratelimited() correctly (jcavitt)
> > 
> > Suggested-by: Raag Jadav <raag.jadav@intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_lpe_audio.c | 2 +-
> >  drivers/gpu/drm/i915/gt/intel_gsc.c            | 2 +-
> >  drivers/gpu/drm/xe/xe_heci_gsc.c               | 4 ++--
> >  drivers/gpu/drm/xe/xe_i2c.c                    | 5 ++++-
> >  4 files changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> > index 022ad18044bf..e756ed1d1132 100644
> > --- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> > +++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
> > @@ -265,7 +265,7 @@ void intel_lpe_audio_irq_handler(struct intel_display *display)
> >  	ret = generic_handle_irq_safe(display->audio.lpe.irq);
> >  	if (ret)
> >  		drm_err_ratelimited(display->drm,
> > -				    "error handling LPE audio irq: %d\n", ret);
> > +				    "failed to handle LPE audio irq: %d\n", ret);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
> > index 050d909fb4f8..c2d76b0bc5fe 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gsc.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
> > @@ -286,7 +286,7 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
> >  
> >  	ret = generic_handle_irq_safe(gt->gsc.intf[intf_id].irq);
> >  	if (ret)
> > -		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
> > +		gt_err_ratelimited(gt, "failed to handle GSC irq: %d\n", ret);
> >  }
> >  
> >  void intel_gsc_irq_handler(struct intel_gt *gt, u32 iir)
> > diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> > index 5af8903e10af..640db27137de 100644
> > --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> > +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> > @@ -224,7 +224,7 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
> >  
> >  	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
> >  	if (ret)
> > -		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
> > +		drm_err_ratelimited(&xe->drm, "failed to handle GSC irq: %d\n", ret);
> >  }
> >  
> >  void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
> > @@ -244,5 +244,5 @@ void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
> >  
> >  	ret = generic_handle_irq_safe(xe->heci_gsc.irq);
> >  	if (ret)
> > -		drm_err_ratelimited(&xe->drm, "error handling GSC irq: %d\n", ret);
> > +		drm_err_ratelimited(&xe->drm, "failed to handle GSC irq: %d\n", ret);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > index 706783863d07..fa5fdf3a1024 100644
> > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > @@ -177,12 +177,15 @@ static bool xe_i2c_irq_present(struct xe_device *xe)
> >  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl)
> >  {
> >  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > +	int ret;
> >  
> >  	if (!(master_ctl & I2C_IRQ) || !xe_i2c_irq_present(xe))
> >  		return;
> >  
> >  	/* Forward interrupt to I2C adapter */
> > -	generic_handle_irq_safe(xe->i2c->adapter_irq);
> > +	ret = generic_handle_irq_safe(xe->i2c->adapter_irq);
> > +	if (ret)
> > +		drm_err_ratelimited(&xe->drm, "failed to handle i2c irq: %d\n", ret);
> >  
> >  	/* Deassert after I2C adapter clears the interrupt */
> >  	xe_mmio_rmw32(mmio, I2C_CONFIG_CMD, 0, PCI_COMMAND_INTX_DISABLE);
> > -- 
> > 2.53.0
> > 
