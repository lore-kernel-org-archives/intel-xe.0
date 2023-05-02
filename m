Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709B4C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 19:57:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BF910E053;
	Tue,  2 May 2023 19:57:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713D110E053
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 19:57:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5B0E6280E;
 Tue,  2 May 2023 19:57:01 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 037B4C433EF;
 Tue,  2 May 2023 19:56:58 +0000 (UTC)
Date: Tue, 2 May 2023 15:56:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZFFrBwt0H5U4fSf8@rdvivi-mobl4>
References: <20230406092631.2820028-1-himal.prasad.ghimiray@intel.com>
 <20230406092631.2820028-2-himal.prasad.ghimiray@intel.com>
 <20230424235148.GJ10045@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424235148.GJ10045@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [Intel-xe] [PATCH 1/4] drm/xe: Handle GRF/IC ECC error irq
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
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, Fernando Pacheco <fernando.pacheco@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 04:51:48PM -0700, Matt Roper wrote:
> On Thu, Apr 06, 2023 at 02:56:28PM +0530, Himal Prasad Ghimiray wrote:
> > The error detection and correction capability
> > for GRF and instruction cache (IC) will utilize
> > the new interrupt and error handling infrastructure
> > for dgfx products. The GFX device can generate
> > a number of classes of error under the new
> > infrastructure: correctable, non-fatal, and
> > fatal errors.
> 
> Nitpick:  Your commit message wrapping is too aggressive.  Generally
> commit message bodies are wrapped somewhere from 72-75 characters per
> line.
> 
> > 
> > The non-fatal and fatal error classes distinguish
> > between levels of severity for uncorrectable errors.
> > All ECC uncorrectable errors will be reported as
> > fatal to produce the desired system response. Fatal
> > errors are expected to route as PCIe error messages
> > which should result in OS issuing a GFX device FLR.
> > But the option exists to route fatal errors as
> > interrupts.
> > 
> > Driver will only handle logging of errors. Anything
> > more will be handled at system level.
> > 
> > For errors that will route as interrupts, three
> > bits in the Master Interrupt Register will be used
> > to convey the class of error.
> > 
> > For each class of error:
> > 1. Determine source of error (IP block) by reading
> >    the Device Error Source Register (RW1C) that
> >    corresponds to the class of error being serviced.
> > 2. If the generating IP block is GT, read and log the
> >    GT Error Register (RW1C) that corresponds to the
> >    class of error being serviced. Non-GT errors will
> >    be logged in aggregate for now.
> > 
> > Bspec: 50875
> > 
> > Signed-off-by: Fernando Pacheco <fernando.pacheco@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Original-author: Fernando Pacheco
> 
> Is this true?  This may be inspired by preliminary i915 work Fernando
> did 4-5 years ago, but I don't think anything in this patch is actually
> his code at this point (especially since the Xe driver didn't exist back
> then, and even the i915 driver looked completely different at the time).
> We shouldn't really forge s-o-b lines when it isn't actually true.

Exactly. Please do not forge signatures.
Our drivers are MIT and/or GPLv2 and there's no need for faking authorship
in the code to attend to these license.
Giving credits is a good idea. Use CC and mentions in the message, but
do not invent new tags please. When in doubt ask the original author if
some mention is needed. Remember that they might look to the code and
think: "What? I have never touched this driver in my life, why my name
is associated with it" on the other hand, there might be cases where
they would think "What, this is my code, they should had at least mentioned
my name in the commit message"... So, when in doubt ask, but do not forge things.

And I do believe the original authors were aware of the licenses obligations
and freedom when they posted their original patch.

I will copy and paste here again another answer that I had done in another
similar case where my signature was forget:

https://lore.kernel.org/all/ZCM3mchRbwxU15L1@intel.com/

First of all, there's a very common misunderstanding of the meaning of the
'Signed-off-by:' (sob).

**hint**: It does *not* mean 'authorship'!

Although we are in an IGT patch, let's use the kernel definition so we
are aligned in some well documented rule:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html?highlight=signed%20off#developer-s-certificate-of-origin-1-1

So, like defined on the official rules above, in this very specific case,
when you created the patch, your 'sob' certified ('b') that:
"The contribution is based upon previous work that, to the best of my knowledge,
 is covered under an appropriate open source license and I have the right under
that license to submit that work with modifications"

Any extra Sob would be added as the patch could be in its transportation.

"Any further SoBs (Signed-off-by:’s) following the author’s SoB are from people
handling and transporting the patch, but were not involved in its development.
SoB chains should reflect the real route a patch took as it was propagated to
the maintainers and ultimately to Linus, with the first SoB entry signalling
primary authorship of a single author."

Same as 'c' of the certificate of origin: "The contribution was provided directly
to me by some other person who certified (a), (b) or (c) and I have not modified it.

It is very important to highlight this transportation rules because there
are many new devs that think that we maintainers are stealing ownership.
As you can see, this is not the case, but the rule.

Back to your case, since I had never seen this patch in my life before it hit
the mailing list, I couldn't have certified this patch in any possible way,
so the forged sob is the improper approach.

It is very hard to define a written rule on what to do with the code copied
from one driver to the other. In many cases the recognition is important,
but in other cases it is even hard to find who was actually the true author of
that code.

There are many options available. A simple one could be 'Cc' the person and
write in the commit message that the code was based on the other driver from
that person, but maybe there are better options available. So let's say that
when in doubt: ask. Contact the original author and ask what he/she has
to suggest. Maybe just this mention and cc would be enough, maybe even with
an acked-by or with the explicit sob, or maybe with some other tag like
'co-developed-by'.


> 
> > ---
> >  drivers/gpu/drm/xe/regs/xe_regs.h |  29 ++++++++
> >  drivers/gpu/drm/xe/xe_irq.c       | 108 ++++++++++++++++++++++++++++++
> >  2 files changed, 137 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> > index c1c829c23df1..dff74b093d4e 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > @@ -92,6 +92,10 @@
> >  #define   GEN11_GU_MISC_IRQ			(1 << 29)
> >  #define   GEN11_DISPLAY_IRQ			(1 << 16)
> >  #define   GEN11_GT_DW_IRQ(x)			(1 << (x))
> > +#define   XE_FATAL_ERROR_IRQ                 REG_BIT(28)
> > +#define   XE_NON_FATAL_ERROR_IRQ             REG_BIT(27)
> > +#define   XE_CORRECTABLE_ERROR_IRQ           REG_BIT(26)
> 
> You only use the parameterized marcro below; the three here never get
> used.
> 
> > +#define   XE_ERROR_IRQ(x)                    REG_BIT(26 + (x))
> >  
> >  #define DG1_MSTR_TILE_INTR			_MMIO(0x190008)
> >  #define   DG1_MSTR_IRQ				REG_BIT(31)
> > @@ -111,4 +115,29 @@
> >  #define GEN12_DSMBASE				_MMIO(0x1080C0)
> >  #define   GEN12_BDSM_MASK			REG_GENMASK64(63, 20)
> >  
> > +enum hardware_error {
> > +	HARDWARE_ERROR_CORRECTABLE = 0,
> > +	HARDWARE_ERROR_NONFATAL = 1,
> > +	HARDWARE_ERROR_FATAL = 2,
> > +	HARDWARE_ERROR_MAX,
> > +};
> > +
> > +#define _DEV_ERR_STAT_FATAL             0x100174
> > +#define _DEV_ERR_STAT_NONFATAL          0x100178
> > +#define _DEV_ERR_STAT_CORRECTABLE       0x10017c
> > +#define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
> > +						_DEV_ERR_STAT_CORRECTABLE, \
> > +						_DEV_ERR_STAT_NONFATAL))
> > +#define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
> > +
> > +#define _ERR_STAT_GT_COR                0x100160
> > +#define _ERR_STAT_GT_NONFATAL           0x100164
> > +#define _ERR_STAT_GT_FATAL              0x100168
> > +#define ERR_STAT_GT_REG(x)              _MMIO(_PICK_EVEN((x), \
> > +						_ERR_STAT_GT_COR, \
> > +						_ERR_STAT_GT_NONFATAL))
> > +
> > +#define  EU_GRF_ERROR                   REG_BIT(15)
> > +#define  EU_IC_ERROR                    REG_BIT(14)
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > index 529b42d9c9af..6b922332bff1 100644
> > --- a/drivers/gpu/drm/xe/xe_irq.c
> > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > @@ -344,6 +344,113 @@ static void dg1_irq_postinstall(struct xe_device *xe, struct xe_gt *gt)
> >  		dg1_intr_enable(xe, true);
> >  }
> >  
> > +static const char *
> > +hardware_error_type_to_str(const enum hardware_error hw_err)
> > +{
> > +	switch (hw_err) {
> > +	case HARDWARE_ERROR_CORRECTABLE:
> > +		return "CORRECTABLE";
> > +	case HARDWARE_ERROR_NONFATAL:
> > +		return "NONFATAL";
> > +	case HARDWARE_ERROR_FATAL:
> > +		return "FATAL";
> > +	default:
> > +		return "UNKNOWN";
> > +	}
> > +}
> > +
> > +static void
> > +xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> > +{
> > +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> > +	u32 other_errors = ~(EU_GRF_ERROR | EU_IC_ERROR);
> > +	u32 errstat;
> > +
> > +	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
> > +
> > +	errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
> > +
> > +	if (unlikely(!errstat)) {
> > +		DRM_ERROR("ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
> 
> We should be using the per-device error macros (e.g., drm_err) rather
> than the legacy macros.  In fact maybe we should be using the
> _ratelimited variants so that if something does go wrong (and keeps
> going wrong), we're not spamming so much output into the log from an
> interrupt handler that we crash the system.
> 
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * TODO: The GT Non Fatal Error Status Register
> > +	 * only has reserved bitfields defined.
> > +	 * Remove once there is something to service.
> > +	 */
> > +	if (hw_err == HARDWARE_ERROR_NONFATAL) {
> > +		DRM_ERROR("detected Non-Fatal error\n");
> > +		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * TODO: The remaining GT errors don't have a
> > +	 * need for targeted logging at the moment. We
> > +	 * still want to log detection of these errors, but
> > +	 * let's aggregate them until someone has a need for them.
> > +	 */
> > +	if (errstat & other_errors)
> 
> So is the goal here to just silently ignore GRF and IC errors (unless
> they're non-fatal, which is impossible), but print a message about
> everything else?  That seems to be what the code is doing right now.
> 
> > +		DRM_ERROR("detected hardware error(s) in ERR_STAT_GT_REG_%s: 0x%08x\n",
> > +			  hw_err_str, errstat & other_errors);
> 
> For correctable errors should we even be printing an error?  I thought
> correctable errors were basically something the hardware could clean up
> by itself and there's no impact to the user.  It seems like if we raise
> DRM errors on correctable errors we're spamming the user about something
> they aren't supposed to need to worry about?
> 
> > +
> > +	xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> > +}
> > +
> > +static void
> > +xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> > +{
> > +	const char *hw_err_str = hardware_error_type_to_str(hw_err);
> > +	unsigned long flags;
> > +	u32 errsrc;
> > +
> > +	spin_lock_irqsave(&gt_to_xe(gt)->irq.lock, flags);
> > +	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
> > +	if (unlikely(!errsrc)) {
> > +		DRM_ERROR("DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);
> 
> Is this actually an error?  You've wrapped this function in a spinlock,
> so if there are two concurrent entries to this function, the one that
> winds up waiting is likely to see a register value of zero once the
> first one clears the interrupts and releases the lock...
> 
> 
> Matt
> 
> > +		goto out_unlock;
> > +	}
> > +
> > +	if (errsrc & DEV_ERR_STAT_GT_ERROR)
> > +		xe_gt_hw_error_handler(gt, hw_err);
> > +
> > +	if (errsrc & ~DEV_ERR_STAT_GT_ERROR)
> > +		DRM_ERROR("non-GT hardware error(s) in DEV_ERR_STAT_REG_%s: 0x%08x\n",
> > +			  hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
> > +
> > +	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
> > +
> > +out_unlock:
> > +	spin_unlock_irqrestore(&gt_to_xe(gt)->irq.lock, flags);
> > +}
> > +
> > +/*
> > + * XE Platforms adds three Error bits to the Master Interrupt
> > + * Register to support dgfx card error handling.
> > + * These three bits are used to convey the class of error:
> > + * FATAL, NONFATAL, or CORRECTABLE.
> > + *
> > + * To process an interrupt:
> > + *      1. Determine source of error (IP block) by reading
> > + *	 the Device Error Source Register (RW1C) that
> > + *	 corresponds to the class of error being serviced.
> > + *      2. For GT as the generating IP block, read and log
> > + *	 the GT Error Register (RW1C) that corresponds to
> > + *	 the class of error being serviced.
> > + */
> > +static void
> > +xe_hw_error_irq_handler(struct xe_gt *gt, const u32 master_ctl)
> > +{
> > +	enum hardware_error hw_err;
> > +
> > +	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
> > +		if (master_ctl & XE_ERROR_IRQ(hw_err))
> > +			xe_hw_error_source_handler(gt, hw_err);
> > +	}
> > +}
> > +
> >  static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >  {
> >  	struct xe_device *xe = arg;
> > @@ -382,6 +489,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >  		if (!xe_gt_is_media_type(gt))
> >  			xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, master_ctl);
> >  		gen11_gt_irq_handler(xe, gt, master_ctl, intr_dw, identity);
> > +		xe_hw_error_irq_handler(gt, master_ctl);
> >  	}
> >  
> >  	xe_display_irq_handler(xe, master_ctl);
> > -- 
> > 2.25.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
