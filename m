Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CACFE98FCD
	for <intel-xe@archiver.kernel.org>; Thu,  9 Apr 2026 06:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E78310E28D;
	Thu,  9 Apr 2026 06:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Spla54aW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5C110E28D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Apr 2026 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775717250; x=1807253250;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z1Luu4qIaQXK0d9ugtrW8lhJWLUlYhNpByg0ZqAD/eI=;
 b=Spla54aW0aYJlaeuSlzMYzKkYtJl/+Q5r4Wv+crG/z01dRctklhpw9uI
 k89m0SguK4kFNviOUP0T1pljUNbGCwFtfh5aHi8KRqt0WMayd7SzG6Rcy
 EHsiur8p+hLVqYTHc/Nj6LzVKBOV1wMtXhYee0JOYkyKk3tI8YsSUXxU1
 L6+REOlDhfL+o27JFEQOVw/KTjF/llgMsKkUVSfT3HSGI6ZCnYW2gtaVP
 36CFa9Fo3kysJ5fAOCRZaJEnx9447tMDN9CIfxyrPNZGIuw8sYEjRw8ti
 KjzhODxwQVnzBf3c+2Tv5ZlzHHteOHOo47YcgtuoxF/+bfmSiryyiGGn/ g==;
X-CSE-ConnectionGUID: +m7j8sMGQMKXIyNguff9yg==
X-CSE-MsgGUID: pYO+ZKkTQJOeiSJZmNWxUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76431247"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="76431247"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 23:47:29 -0700
X-CSE-ConnectionGUID: UHypcVjrSJ6ODcZyPdcqQw==
X-CSE-MsgGUID: ///tocLSTFeDk/THbJrARQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="266663934"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 23:47:26 -0700
Date: Thu, 9 Apr 2026 08:47:23 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, umesh.nerlige.ramappa@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 anoop.c.vijay@intel.com, aravind.iddamsetty@linux.intel.com
Subject: Re: [PATCH v5 1/3] drm/xe/sysctrl: Add system controller interrupt
 handler
Message-ID: <addLe5ZEJKcwVMrO@black.igk.intel.com>
References: <20260407110629.198158-1-raag.jadav@intel.com>
 <20260407110629.198158-2-raag.jadav@intel.com>
 <3a24fb95-59a3-4030-9baf-87f1b0be15e4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a24fb95-59a3-4030-9baf-87f1b0be15e4@intel.com>
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

On Thu, Apr 09, 2026 at 10:34:09AM +0530, Tauro, Riana wrote:
> On 4/7/2026 4:36 PM, Raag Jadav wrote:
> > Add system controller interrupt handler which is denoted by 11th bit in
> > GFX master interrupt register. While at it, add worker for scheduling
> > system controller work.
> > 
> > Co-developed-by: Soham Purkait <soham.purkait@intel.com>
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > ---
> > v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
> > v4: Handle IRQ before sysctrl initialization (Mallesh)
> > ---
> >   drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
> >   drivers/gpu/drm/xe/xe_irq.c           |  2 ++
> >   drivers/gpu/drm/xe/xe_sysctrl.c       | 39 ++++++++++++++++++++++-----
> >   drivers/gpu/drm/xe/xe_sysctrl.h       |  1 +
> >   drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
> >   5 files changed, 44 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > index 9d74f454d3ff..1d6b976c4de0 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > @@ -22,6 +22,7 @@
> >   #define   DISPLAY_IRQ				REG_BIT(16)
> >   #define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
> >   #define   I2C_IRQ				REG_BIT(12)
> > +#define   SYSCTRL_IRQ				REG_BIT(11)
> >   #define   GT_DW_IRQ(x)				REG_BIT(x)
> >   /*
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index 9a775c6588dc..e9f0b3cad06d 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -24,6 +24,7 @@
> >   #include "xe_mmio.h"
> >   #include "xe_pxp.h"
> >   #include "xe_sriov.h"
> > +#include "xe_sysctrl.h"
> >   #include "xe_tile.h"
> >   /*
> > @@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >   				xe_heci_csc_irq_handler(xe, master_ctl);
> >   			xe_display_irq_handler(xe, master_ctl);
> >   			xe_i2c_irq_handler(xe, master_ctl);
> > +			xe_sysctrl_irq_handler(xe, master_ctl);
> >   			xe_mert_irq_handler(xe, master_ctl);
> >   			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
> >   		}
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> > index 2bcef304eb9a..afa9654668a2 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> > @@ -8,6 +8,7 @@
> >   #include <drm/drm_managed.h>
> > +#include "regs/xe_irq_regs.h"
> >   #include "regs/xe_sysctrl_regs.h"
> >   #include "xe_device.h"
> >   #include "xe_mmio.h"
> > @@ -30,10 +31,16 @@
> >   static void sysctrl_fini(void *arg)
> >   {
> >   	struct xe_device *xe = arg;
> > +	struct xe_sysctrl *sc = &xe->sc;
> > +	cancel_work_sync(&sc->work);
> >   	xe->soc_remapper.set_sysctrl_region(xe, 0);
> >   }
> > +static void xe_sysctrl_work(struct work_struct *work)
> > +{
> > +}
> > +
> >   /**
> >    * xe_sysctrl_init() - Initialize System Controller subsystem
> >    * @xe: xe device instance
> > @@ -55,11 +62,7 @@ int xe_sysctrl_init(struct xe_device *xe)
> >   	if (!xe->info.has_sysctrl)
> >   		return 0;
> > -	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> > -
> > -	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> > -	if (ret)
> > -		return ret;
> > +	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
> >   	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
> >   	if (!sc->mmio)
> > @@ -73,9 +76,33 @@ int xe_sysctrl_init(struct xe_device *xe)
> >   	if (ret)
> >   		return ret;
> > +	ret = devm_mutex_init(xe->drm.dev, &sc->work_lock);
> Nit: Mutex can be added in the same patch where it is used.

Just trying to avoid random churns.

> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Thank you.

Raag

> > +	if (ret)
> > +		return ret;
> > +
> > +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> >   	xe_sysctrl_mailbox_init(sc);
> > +	INIT_WORK(&sc->work, xe_sysctrl_work);
> > -	return 0;
> > +	return devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> > +}
> > +
> > +/**
> > + * xe_sysctrl_irq_handler() - Handler for System Controller interrupts
> > + * @xe: xe device instance
> > + * @master_ctl: interrupt register
> > + *
> > + * Handle interrupts generated by System Controller.
> > + */
> > +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
> > +{
> > +	struct xe_sysctrl *sc = &xe->sc;
> > +
> > +	if (!xe->info.has_sysctrl || !sc->work.func)
> > +		return;
> > +
> > +	if (master_ctl & SYSCTRL_IRQ)
> > +		schedule_work(&sc->work);
> >   }
> >   /**
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> > index f3b0f3716b2f..f7469bfc9324 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> > @@ -17,6 +17,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> >   }
> >   int xe_sysctrl_init(struct xe_device *xe);
> > +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> >   void xe_sysctrl_pm_resume(struct xe_device *xe);
> >   #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > index 8217f6befe70..13fbf2990280 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > @@ -8,6 +8,7 @@
> >   #include <linux/mutex.h>
> >   #include <linux/types.h>
> > +#include <linux/workqueue_types.h>
> >   struct xe_mmio;
> > @@ -27,6 +28,12 @@ struct xe_sysctrl {
> >   	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
> >   	bool phase_bit;
> > +
> > +	/** @work: Pending events work */
> > +	struct work_struct work;
> > +
> > +	/** @work_lock: Mutex protecting pending events */
> > +	struct mutex work_lock;
> >   };
> >   #endif
