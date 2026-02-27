Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E36FD9E1C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 05:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D372210E61C;
	Fri, 27 Feb 2026 05:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/QbGrp1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C050510E61C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 05:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772169158; x=1803705158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+VwBj6ZkyLQpZrDsL5pA4ADd0usqYfXJKs+QmaKCkxQ=;
 b=R/QbGrp1s/Azf2usKyJfy8zkAIgauLpzpq9RXreSKt5WaVrrQKfoyGtW
 8Ylpcq9qsZNYyubJOkaMruuPuFiZpsqyIafog3jG35vKqDVF6hqV87duL
 GbwG0/h8ZCfB8LBhOotudVfqcnstmtITdruJNbqhXTwItPw212RUej4+9
 tDwAAJxTDsFqZbofJSOFTo3p+TYzj0xixC6TS4PxoB7tKL9XcBx6QVmiz
 KhlVChzerS3xy2EKKkXIAYHyvvGAWKRYuW161Ukij8dBoFS5tDeYVwZkm
 pYpZpMdwI76hXQrlQzwkSMVckWfHd7GCAb4orvM7fOe/jFCrJUxvGsqMT Q==;
X-CSE-ConnectionGUID: MStiwtOQRGiOh/TTvOFWeg==
X-CSE-MsgGUID: tb4ubYbbRw+/1CtUYDu7Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="95865125"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="95865125"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 21:12:37 -0800
X-CSE-ConnectionGUID: Y+/olWz+SpqfJahigcqQTA==
X-CSE-MsgGUID: GPYoinsORoOQkQ06Esi6bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="215458749"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 21:12:34 -0800
Date: Fri, 27 Feb 2026 06:12:31 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, soham.purkait@intel.com,
 anoop.c.vijay@intel.com
Subject: Re: [PATCH v2 2/4] drm/xe/sysctrl: Add system controller interrupt
 handler
Message-ID: <aaEnv-Y_M60sfgvk@black.igk.intel.com>
References: <20260213081644.2085314-1-raag.jadav@intel.com>
 <20260213081644.2085314-3-raag.jadav@intel.com>
 <607bfa10-cb3a-4696-be2b-5d5246591ad7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <607bfa10-cb3a-4696-be2b-5d5246591ad7@intel.com>
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

On Wed, Feb 25, 2026 at 03:40:12PM +0530, Mallesh, Koujalagi wrote:
> On 13-02-2026 01:46 pm, Raag Jadav wrote:
> > Add system controller interrupt handler which is denoted by 11th bit in
> > GFX master interrupt register. While at it, add worker for scheduling
> > system controller work.
> > 
> > v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
> > 
> > Co-developed-by: Soham Purkait <soham.purkait@intel.com>
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
> >   drivers/gpu/drm/xe/xe_irq.c           |  2 ++
> >   drivers/gpu/drm/xe/xe_sysctrl.c       | 39 ++++++++++++++++++++++-----
> >   drivers/gpu/drm/xe/xe_sysctrl.h       |  3 +++
> >   drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
> >   5 files changed, 45 insertions(+), 7 deletions(-)
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
> > index 7560a45f7f64..9e49e2241da4 100644
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
> > index 430bccbdc3b9..aba2166650aa 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> > @@ -7,6 +7,7 @@
> >   #include <linux/device.h>
> >   #include <linux/mutex.h>
> > +#include "regs/xe_irq_regs.h"
> >   #include "regs/xe_sysctrl_regs.h"
> >   #include "xe_device.h"
> >   #include "xe_mmio.h"
> > @@ -28,10 +29,16 @@
> >    * with the System Controller through the mailbox.
> >    */
> > +static void xe_sysctrl_work(struct work_struct *work)
> > +{
> > +}
> > +
> >   static void xe_sysctrl_fini(void *arg)
> >   {
> >   	struct xe_device *xe = arg;
> > +	struct xe_sysctrl *sc = &xe->sc;
> > +	cancel_work_sync(&sc->work);
> >   	xe->soc_remapper.set_sysctrl_region(xe, 0);
> >   }
> > @@ -56,12 +63,6 @@ int xe_sysctrl_init(struct xe_device *xe)
> >   	if (!xe->soc_remapper.set_sysctrl_region)
> >   		return -ENODEV;
> > -	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> > -
> > -	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
> > -	if (ret)
> > -		return ret;
> > -
> >   	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
> >   	if (!sc->mmio)
> >   		return -ENOMEM;
> > @@ -74,7 +75,31 @@ int xe_sysctrl_init(struct xe_device *xe)
> >   	if (ret)
> >   		return ret;
> > +	ret = drmm_mutex_init(&xe->drm, &sc->work_lock);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> >   	xe_sysctrl_mailbox_init(sc);
> > +	INIT_WORK(&sc->work, xe_sysctrl_work);
> > -	return 0;
> > +	return devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
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
> > +	if (!xe->info.has_sysctrl)
> > +		return;
> > +
> What will be happen when multiple interrupts arriving before the work
> execution?

This is why we have work_lock in patch 3.

> > +	if (master_ctl & SYSCTRL_IRQ)
> > +		schedule_work(&sc->work);
> 
> Please use system_percpu_wq instead of global system_wq in order to reduce
> contention and improve cache locality.

We already do. Perhaps the documentation is what needs to be updated.

Raag

> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> > index ee7826fe4c98..5919310b9db9 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> > @@ -6,8 +6,11 @@
> >   #ifndef _XE_SYSCTRL_H_
> >   #define _XE_SYSCTRL_H_
> > +#include <linux/types.h>
> > +
> >   struct xe_device;
> >   int xe_sysctrl_init(struct xe_device *xe);
> > +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> >   #endif /* _XE_SYSCTRL_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > index d4a362564925..bfaa9ad085ce 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > @@ -8,6 +8,7 @@
> >   #include <linux/mutex.h>
> >   #include <linux/types.h>
> > +#include <linux/workqueue_types.h>
> >   struct xe_mmio;
> > @@ -28,6 +29,12 @@ struct xe_sysctrl {
> >   	 * messages to help distinguish message boundaries.
> >   	 */
> >   	bool phase_bit;
> > +
> > +	/** @work: Pending events work */
> > +	struct work_struct work;
> > +
> > +	/** @work_lock: Mutex protecting pending events */
> > +	struct mutex work_lock;
> >   };
> >   #endif /* _XE_SYSCTRL_TYPES_H_ */
