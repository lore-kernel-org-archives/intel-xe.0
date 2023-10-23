Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ACDC001E0
	for <intel-xe@archiver.kernel.org>; Mon, 23 Oct 2023 08:04:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617DB10E170;
	Mon, 23 Oct 2023 08:04:49 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C9510E17F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Oct 2023 08:04:47 +0000 (UTC)
Received: from 91-155-254-243.elisa-laajakaista.fi ([91.155.254.243]
 helo=pinhengc-mobl2.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1qupvY-000000008Ge-0p7f; Mon, 23 Oct 2023 11:04:44 +0300
Message-ID: <9ffb32aa23b5dcb02596c19335da22637edc83c2.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Mon, 23 Oct 2023 11:04:43 +0300
In-Reply-To: <ZTE9DY1dFLqS0hte@intel.com>
References: <20231018124500.1309994-1-luciano.coelho@intel.com>
 <ZTE9DY1dFLqS0hte@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH] drm/i915: handle uncore spinlock when not
 available
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2023-10-19 at 10:28 -0400, Rodrigo Vivi wrote:
> On Wed, Oct 18, 2023 at 03:45:00PM +0300, Luca Coelho wrote:
> > The uncore code may not always be available (e.g. when we build the
> > display code with Xe), so we can't always rely on having the uncore's
> > spinlock.
> >=20
> > To handle this, split the spin_lock/unlock_irqsave/restore() into
> > spin_lock/unlock() followed by a call to local_irq_save/restore() and
> > create wrapper functions for locking and unlocking the uncore's
> > spinlock.  In these functions, we have a condition check and only
> > actually try to lock/unlock the spinlock when I915 is defined, and
> > thus uncore is available.
> >=20
> > This keeps the ifdefs contained in these new functions and all such
> > logic inside the display code.
> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.h | 20 ++++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_vblank.c  | 18 +++++++++++-------
> >  2 files changed, 31 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu=
/drm/i915/display/intel_display.h
> > index 0e5dffe8f018..07acf5d414f6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display.h
> > @@ -559,4 +559,24 @@ bool assert_port_valid(struct drm_i915_private *i9=
15, enum port port);
> > =20
> >  bool intel_scanout_needs_vtd_wa(struct drm_i915_private *i915);
> > =20
> > +/*
> > + * The uncore version of the spin lock functions is used to decide
> > + * whether we need to lock the uncore lock or not.  This is only
> > + * needed in i915, not in Xe.  Keep the decision-making centralized
> > + * here.
> > + */
> > +static inline void uncore_spin_lock(spinlock_t *lock)
> > +{
> > +#ifdef I915
> > +	spin_lock(lock);
> > +#endif
>=20
> okay, I understand that your goal here is not to fix xe in case the
> flow is totally broken there because of the lack of the locks to
> serialize the display here. Nor also remove this serialization in
> i915, if not needed. And that's the safest option I agree.
>=20
> I just wonder if we could do in some more generic way like avoiding
> the term 'uncore' and using 'dev_priv' as argument instead of the
> lock directly. But not hard feelings...

Makes sense.  I'll change it.


> > +}
> > +
> > +static inline void uncore_spin_unlock(spinlock_t *lock)
> > +{
> > +#ifdef I915
> > +	spin_unlock(lock);
> > +#endif
> > +}
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/=
drm/i915/display/intel_vblank.c
> > index 2cec2abf9746..0e8b71063353 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> > @@ -306,7 +306,8 @@ static bool i915_get_crtc_scanoutpos(struct drm_crt=
c *_crtc,
> >  	 * register reads, potentially with preemption disabled, so the
> >  	 * following code must not block on uncore.lock.
> >  	 */
> > -	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
> > +	uncore_spin_lock(&dev_priv->uncore.lock);
> > +	local_irq_save(irqflags);
>=20
> shouldn't we save before lock or restore before unlock?
> or to be on the safe side also create other helpers for these?

Oh, nice catch.  I did go into spin_lock_irqsave() to check the order,
but for some reason didn't do it right here.  This is the correct
order:

irq_save->lock->unlock->irq_restore

I'll fix it.

Thanks for the review! I accidentally sent this to intel-xe again,
though my intention was to send it to intel-gfx.  I'll send v2 to both.


--
Cheers,
Luca.
