Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562EEC98312
	for <intel-xe@archiver.kernel.org>; Sat, 17 Jan 2026 07:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72D010E029;
	Sat, 17 Jan 2026 07:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YI9PgFJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE16710E029
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Jan 2026 07:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768634022; x=1800170022;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TmwOl6BXZHjdIGlUPZyNlD9s0kvCPUDTdhIGqeGDIqc=;
 b=YI9PgFJnlTB9v2co0rVMpcMluKsi4jqMIOQWmKxtW+jLDq8cmKhpEUBc
 XNf18ABr2IKK+JvV8LWZOyLt7709PIq8zDdnSeHkPT6HcucxP+7ZfZryG
 s3ZZkCwGRSlh+3XLAzHQpkyegZ+7dT7NnDyNBzah2VcuOmtUjgeVz3XHB
 wmEFKiLe3zgSedzHzfO7IH8vppaSUV8SQ745H10vUZ40jXvu0nBso1fo4
 Z95jJp22lnvsyGVo3UmjiJn7SqB8NLMUN+LfYxw0e3ZQ9rw2dNnMa1G/S
 p7xZTu7h/9TkMX3bITvEEjnb1Tb63ShMipfTKluQYAteJ2u/MjKu1uLiI A==;
X-CSE-ConnectionGUID: U41vfy7qQMmDAYoIdxiJ6w==
X-CSE-MsgGUID: 9lSuasZnSzCdqQpLgpOaeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69914222"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="69914222"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 23:13:41 -0800
X-CSE-ConnectionGUID: +BPVfOfQS2+C3NmOi5Kyhw==
X-CSE-MsgGUID: e4GjMqVJSyaKaw0vmp2icQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; d="scan'208";a="242978507"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 23:13:39 -0800
Date: Sat, 17 Jan 2026 08:13:35 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, umesh.nerlige.ramappa@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v1 2/4] drm/xe/sysctrl: Add system controller interrupt
 handler
Message-ID: <aWs2n2AXinUTepGF@black.igk.intel.com>
References: <20260116093432.914040-1-raag.jadav@intel.com>
 <20260116093432.914040-3-raag.jadav@intel.com>
 <aWqt+lutUAsYyFsi@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWqt+lutUAsYyFsi@lstrano-desk.jf.intel.com>
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

On Fri, Jan 16, 2026 at 01:30:34PM -0800, Matthew Brost wrote:
> On Fri, Jan 16, 2026 at 03:03:31PM +0530, Raag Jadav wrote:
> > Add system controller interrupt handler which is denoted by 11th bit in
> > GFX master interrupt register. While at it, add ordered workqueue for
> > scheduling system controller work.
> > 
> > Co-developed-by: Soham Purkait <soham.purkait@intel.com>
> > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_irq_regs.h |  1 +
> >  drivers/gpu/drm/xe/xe_irq.c           |  2 ++
> >  drivers/gpu/drm/xe/xe_sysctrl.c       | 39 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sysctrl.h       |  3 +++
> >  drivers/gpu/drm/xe/xe_sysctrl_types.h |  7 +++++
> >  5 files changed, 52 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > index 9d74f454d3ff..1d6b976c4de0 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > @@ -22,6 +22,7 @@
> >  #define   DISPLAY_IRQ				REG_BIT(16)
> >  #define   SOC_H2DMEMINT_IRQ			REG_BIT(13)
> >  #define   I2C_IRQ				REG_BIT(12)
> > +#define   SYSCTRL_IRQ				REG_BIT(11)
> >  #define   GT_DW_IRQ(x)				REG_BIT(x)
> >  
> >  /*
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index 7560a45f7f64..9e49e2241da4 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -24,6 +24,7 @@
> >  #include "xe_mmio.h"
> >  #include "xe_pxp.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sysctrl.h"
> >  #include "xe_tile.h"
> >  
> >  /*
> > @@ -525,6 +526,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >  				xe_heci_csc_irq_handler(xe, master_ctl);
> >  			xe_display_irq_handler(xe, master_ctl);
> >  			xe_i2c_irq_handler(xe, master_ctl);
> > +			xe_sysctrl_irq_handler(xe, master_ctl);
> >  			xe_mert_irq_handler(xe, master_ctl);
> >  			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> > index 8daab7703247..1d78916dd6ad 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/device.h>
> >  #include <linux/mutex.h>
> >  
> > +#include "regs/xe_irq_regs.h"
> >  #include "regs/xe_sysctrl_regs.h"
> >  #include "xe_device.h"
> >  #include "xe_printk.h"
> > @@ -27,9 +28,17 @@
> >   * with the System Controller through the mailbox.
> >   */
> >  
> > +static void xe_sysctrl_work(struct work_struct *work)
> > +{
> > +}
> > +
> >  static void xe_sysctrl_fini(void *arg)
> >  {
> >  	struct xe_device *xe = arg;
> > +	struct xe_sysctrl *sc = &xe->sc;
> > +
> > +	cancel_work_sync(&sc->work);
> > +	destroy_workqueue(sc->wq);
> >  
> >  	xe->soc_remapper.set_sysctrl_region(xe, 0);
> >  }
> > @@ -56,6 +65,14 @@ int xe_sysctrl_init(struct xe_device *xe)
> >  
> >  	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
> >  
> > +	INIT_WORK(&sc->work, xe_sysctrl_work);
> > +
> > +	sc->wq = alloc_ordered_workqueue("sysctrl-ordered-wq", 0);
> 
> We do have drmm_alloc_ordered_workqueue, so you don’t need to manually
> clean up the WQ. We don’t use it as widely as we should in Xe, as it was
> added after we merged, but we should use that helper going forward.

Yes, but xe_sysctrl_fini() is setup as devm action and not drmm, so just
trying to keep the unwind consistent. Is it a good practice to mix/match
between managed APIs? My understanding is that it usually leads to resource
races due to inconsistent unwind.

> I do have a question—does this require a dedicated WQ though? i.e.,
> would a system WQ work here? We allocate a lot of WQs in Xe, but
> typically that’s done when we really care about ordering. For example,
> we may have multiple work_items scheduled on a WQ but want only one of
> them executing at any given time, so we schedule them on a single
> dedicated WQ. Here you only have one work_item, so I believe you can
> probably just use one of the system WQs.

For something as critical as error handling, should we rely on system WQ?

Raag

> > +	if (!sc->wq) {
> > +		ret = -ENOMEM;
> > +		goto err_sysctrl_fini;
> > +	}
> > +
> >  	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, xe);
> >  	if (ret)
> >  		return ret;
> > @@ -67,4 +84,26 @@ int xe_sysctrl_init(struct xe_device *xe)
> >  	xe_sysctrl_mailbox_init(sc);
> >  
> >  	return 0;
> > +
> > +err_sysctrl_fini:
> > +	xe_sysctrl_fini(xe);
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_sysctrl_irq_handler: Handler for System Controller interrupts
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
> > +	if (master_ctl & SYSCTRL_IRQ)
> > +		queue_work(sc->wq, &sc->work);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> > index ee7826fe4c98..5919310b9db9 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> > @@ -6,8 +6,11 @@
> >  #ifndef _XE_SYSCTRL_H_
> >  #define _XE_SYSCTRL_H_
> >  
> > +#include <linux/types.h>
> > +
> >  struct xe_device;
> >  
> >  int xe_sysctrl_init(struct xe_device *xe);
> > +void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> >  
> >  #endif /* _XE_SYSCTRL_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > index 88a34967688b..14fc80dfee6e 100644
> > --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/mutex.h>
> >  #include <linux/types.h>
> > +#include <linux/workqueue_types.h>
> >  
> >  /**
> >   * struct xe_sysctrl - System Controller driver context
> > @@ -18,6 +19,12 @@ struct xe_sysctrl {
> >  
> >  	/** @phase_bit: MKHI message boundary phase toggle bit */
> >  	u32 phase_bit;
> > +
> > +	/** @wq: Queue for sysctrl work */
> > +	struct workqueue_struct *wq;
> > +
> > +	/** @work: Worker for pending events */
> > +	struct work_struct work;
> >  };
> >  
> >  #endif /* _XE_SYSCTRL_TYPES_H_ */
> > -- 
> > 2.43.0
> > 
