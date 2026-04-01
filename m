Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286CB10FCAC0
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 18:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA5F10EED1;
	Wed,  1 Apr 2026 18:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YjQhh0BG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3347A10EED1
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 18:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775067673; x=1806603673;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PZQ8k8QQC/RhZBZoXkr1LvEjGePoWVJDvRlg+ETQ5C0=;
 b=YjQhh0BG6WpClLQqOyZpEW+IsKOZoXmYrOAscX0EnLaGMKhsGVse1kpx
 izWTCw52pfNrNY9UqcWhfeAzR1ttgpQWJ1rk27TGsZQ+jLhj8+lTkbfwg
 PD+pbbbEaUqCF34jB/TAcK2KXWYLjJQBVOFvUQWkkYxp9LBzHIjC0eE2j
 edoiZPdb0Z6038szqrxVWCpxeTZhs0+vJCZTQLiPe/72NaD90ZeSuRiM4
 Mzr/hX2tzX1F5dKAkwD3bmHDwf2QryyQZ68tVJwTbW4G8/j3bJWCWh5AY
 5ZxTu9tvqmguIHy+4heciF6t2DQOBIR06Y3Fj2GTj2+ak1U+VG0vzdNvs g==;
X-CSE-ConnectionGUID: fiwDOAqQQM66hGs7lUiMXg==
X-CSE-MsgGUID: 7LyMlU++TDe5cIzAbn3uIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76002502"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76002502"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 11:21:12 -0700
X-CSE-ConnectionGUID: +LxDMWLJSmiNOGGiE1Fw6A==
X-CSE-MsgGUID: 9RtQ0N4OQ6SRxH/JW6E0sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="264685155"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 11:21:10 -0700
Date: Wed, 1 Apr 2026 20:21:06 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v1 1/3] drm/xe/cri: Setup hardware error routing
Message-ID: <ac1iEsWnV-6_KW7T@black.igk.intel.com>
References: <20260217114656.2546878-1-raag.jadav@intel.com>
 <20260217114656.2546878-2-raag.jadav@intel.com>
 <6c7b27a8-d5bc-4854-8252-8b38e269f80b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c7b27a8-d5bc-4854-8252-8b38e269f80b@intel.com>
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

On Thu, Mar 26, 2026 at 06:19:00PM +0530, Mallesh, Koujalagi wrote:
> On 17-02-2026 05:16 pm, Raag Jadav wrote:
> > Setup hardware error routing based on XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET
> > which will be used for debug cases on Crescent Island.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  5 +++++
> >   drivers/gpu/drm/xe/xe_hw_error.c           | 22 +++++++++++++++++++++-
> >   drivers/gpu/drm/xe/xe_hw_error.h           |  1 +
> >   3 files changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> > index c146b9ef44eb..88593f0a48fd 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> > @@ -11,6 +11,11 @@
> >   #define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
> > +#define DEV_ERR_ROUTING_CTRL			XE_REG(0x100170)
> > +#define   FATAL_ERR_ROUTING			BIT(2)
> > +#define   NONFATAL_ERR_ROUTING			BIT(1)
> > +#define   CORR_ERR_ROUTING			BIT(0)
> > +
> >   #define DEV_ERR_STAT_NONFATAL			0x100178
> >   #define DEV_ERR_STAT_CORRECTABLE		0x10017c
> >   #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
> > diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> > index 8c65291f36fc..eb557266d083 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_error.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> > @@ -146,6 +146,23 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
> >   			hw_error_source_handler(tile, hw_err);
> >   }
> > +/**
> > + * xe_hw_error_irq_route - irq routing of hw errors
> > + * @xe: xe device instance
> > + *
> > + * Set irq routing of hw errors.
> > + */
> > +void xe_hw_error_irq_route(struct xe_device *xe)
> > +{
> > +	u32 mask = CORR_ERR_ROUTING | NONFATAL_ERR_ROUTING | FATAL_ERR_ROUTING;
> > +	bool irq = xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET;
> 
> What happen when wedge mode change during execution?

This needs to be called when it happens. The only place I could find as
of now is through debugfs, will add in this in v2.

Raag

> > +	struct xe_tile *tile;
> > +	u8 id;
> > +
> > +	for_each_tile(tile, xe, id)
> > +		xe_mmio_rmw32(&tile->mmio, DEV_ERR_ROUTING_CTRL, mask, irq ? mask : 0);
> > +}
> > +
> >   /*
> >    * Process hardware errors during boot
> >    */
> > @@ -178,5 +195,8 @@ void xe_hw_error_init(struct xe_device *xe)
> >   	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
> > -	process_hw_errors(xe);
> > +	if (xe->info.platform == XE_CRESCENTISLAND)
> > +		xe_hw_error_irq_route(xe);
> > +	else
> > +		process_hw_errors(xe);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
> > index d86e28c5180c..8f155b66b5f1 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_error.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_error.h
> > @@ -11,5 +11,6 @@ struct xe_tile;
> >   struct xe_device;
> >   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
> > +void xe_hw_error_irq_route(struct xe_device *xe);
> >   void xe_hw_error_init(struct xe_device *xe);
> >   #endif
