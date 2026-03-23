Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2463EC01CC
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 11:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB4F10E0FE;
	Mon, 23 Mar 2026 11:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4AFWdyP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E96810E0FE
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 11:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774265564; x=1805801564;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/4nfQ0AAUL7ec29nLGwGUy2nqffevPqdIZUr4P8depM=;
 b=l4AFWdyPz2ijItr/PHfXjsbFHmKW9zi6k4jEelRm+gPVpNjGrxwBY8dy
 Xec/2SYVqjXjL8QxntiF5z33mi3wfVHjoO8c/m4OKd74vpnQ1UBbl/4l8
 Is2rhDEg23Ad9xqHqibj2eYohfWioCzWHdEIK4beusOdWHkRosVZdunix
 OkBipoRflc838HG8eJkAO9kst9TVsvqATDzmeMVFVuyOSruSoRCu8NVNb
 jdXnhQGPEK1e1a+3bPXPSex1GHGgUoZ3PcHyLNJ5mq3z5Toxod5EDsErK
 KeSBi5tmCuvUz9qEfWHyjbX00Z1YfLi9r2mW+t8qh/yEkT3LJppCJBkkO A==;
X-CSE-ConnectionGUID: dtf+ZVdPS5e5b3uGjJCogQ==
X-CSE-MsgGUID: vvO8+s0mRuWhrI76feUs5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="62816517"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="62816517"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 04:32:44 -0700
X-CSE-ConnectionGUID: qkyINDMfT8ChDjWAm0ZcAg==
X-CSE-MsgGUID: ZHUzCR+hTXGvs4lv+enxkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="223956478"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 04:32:41 -0700
Date: Mon, 23 Mar 2026 12:32:38 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 umesh.nerlige.ramappa@intel.com, soham.purkait@intel.com,
 anoop.c.vijay@intel.com, aravind.iddamsetty@linux.intel.com,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 2/4] drm/xe/sysctrl: Add system controller interrupt
 handler
Message-ID: <acEk1kyVAjD-ufy7@black.igk.intel.com>
References: <20260312090657.4026013-1-raag.jadav@intel.com>
 <20260312090657.4026013-3-raag.jadav@intel.com>
 <259a44be-1fd8-4ff0-8924-d647106de413@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <259a44be-1fd8-4ff0-8924-d647106de413@intel.com>
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

On Tue, Mar 17, 2026 at 11:17:01AM +0530, Mallesh, Koujalagi wrote:
> On 12-03-2026 02:36 pm, Raag Jadav wrote:
> > Add system controller interrupt handler which is denoted by 11th bit in
> > GFX master interrupt register. While at it, add worker for scheduling
> > system controller work.
> > 
> > Co-developed-by: Soham Purkait <soham.purkait@intel.com>
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> > v2: Use system_percpu_wq instead of dedicated (Matthew Brost)
> > ---
> >   drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
> >   drivers/gpu/drm/xe/xe_irq.c           |  2 ++
> >   drivers/gpu/drm/xe/xe_sysctrl.c       | 39 ++++++++++++++++++++++-----
> >   drivers/gpu/drm/xe/xe_sysctrl.h       |  1 +
> >   drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
> >   5 files changed, 43 insertions(+), 7 deletions(-)
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
> > index 365f73ef680d..30349df1c04b 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> > @@ -8,6 +8,7 @@
> >   #include <drm/drm_managed.h>
> > +#include "regs/xe_irq_regs.h"
> >   #include "regs/xe_sysctrl_regs.h"
> >   #include "xe_assert.h"
> >   #include "xe_device.h"
> > @@ -33,10 +34,16 @@
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
> > @@ -60,12 +67,6 @@ int xe_sysctrl_init(struct xe_device *xe)
> >   	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
> > -	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> > -
> > -	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
> > -	if (ret)
> > -		return ret;
> > -
> >   	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
> >   	if (!sc->mmio)
> >   		return -ENOMEM;
> > @@ -78,7 +79,31 @@ int xe_sysctrl_init(struct xe_device *xe)
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
> > +	if (!xe->info.has_sysctrl)
> > +		return;
> > +
> 
> We need to check sc->work.func if NULL then return, since initialization of
> interrupt enabled @ line: 923 xe_irq_install() after that line 989:
> xe_systctrl_init() set the work.func. In between
> 
> xe_sysctrl_irq_handler fired then work.func is NULL and going to schedule
> work which lead to panic @ worker->current_func(work).

Sure, thanks.

Raag

> > +	if (master_ctl & SYSCTRL_IRQ)
> > +		schedule_work(&sc->work);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> > index d5d8735038ae..ff60d42b52a7 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> > @@ -17,5 +17,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> >   }
> >   int xe_sysctrl_init(struct xe_device *xe);
> > +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
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
