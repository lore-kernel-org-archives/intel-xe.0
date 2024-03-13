Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6275C54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 23:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1B810E999;
	Wed, 13 Mar 2024 23:04:45 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2A510E999
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 23:04:41 +0000 (UTC)
Received: from 91-156-7-239.elisa-laajakaista.fi ([91.156.7.239]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rkXeG-00000002O3a-0jc0; Thu, 14 Mar 2024 01:04:37 +0200
Message-ID: <cb51c7b2349da9730921fd3b2b2eff605f0f2d41.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Date: Thu, 14 Mar 2024 01:04:24 +0200
In-Reply-To: <170844750697.44184.3297077069453825970@gjsousa-mobl2>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
 <20240207103007.665367-2-luciano.coelho@intel.com>
 <170844750697.44184.3297077069453825970@gjsousa-mobl2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] drm/i915/display: add support for DMC wakelocks
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

On Tue, 2024-02-20 at 13:45 -0300, Gustavo Sousa wrote:
> > Quoting Luca Coelho (2024-02-07 07:30:02-03:00)
> > > > In order to reduce the DC5->DC2 restore time, wakelocks have been
> > > > introduced in DMC so the driver can tell it when registers and othe=
r
> > > > memory areas are going to be accessed and keep their respective blo=
cks
> > > > awake.
> > > >=20
> > > > Implement this in the driver by adding the concept of DMC wakelocks=
.
> > > > When the driver needs to access memory which lies inside pre-define=
d
> > > > ranges, it will tell DMC to set the wakelock, access the memory, th=
en
> > > > wait for a while and clear the wakelock.
> > > >=20
> > > > The wakelock state is protected in the driver with spinlocks to
> > > > prevent concurrency issues.
> > > >=20
> >=20
> > I think it would be good to have a "BSpec: 71583" trailer here.

Good point. I added it.


> > > > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > > > ---
> > > > drivers/gpu/drm/i915/Makefile                 |   1 +
> > > > drivers/gpu/drm/i915/display/intel_de.h       |  35 +++-
> > > > drivers/gpu/drm/i915/display/intel_display.c  |   1 +
> > > > .../gpu/drm/i915/display/intel_display_core.h |   4 +
> > > > .../drm/i915/display/intel_display_driver.c   |   1 +
> > > > drivers/gpu/drm/i915/display/intel_dmc_regs.h |  32 +++
> > > > drivers/gpu/drm/i915/display/intel_dmc_wl.c   | 185 +++++++++++++++=
+++
> > > > drivers/gpu/drm/i915/display/intel_dmc_wl.h   |  35 ++++
> > > > drivers/gpu/drm/xe/Makefile                   |   1 +
> > > > 9 files changed, 293 insertions(+), 2 deletions(-)
> > > > create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.c
> > > > create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.h
> > > >=20
> > > > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/M=
akefile
> > > > index f7d13a7dcd63..05f0f54cc98e 100644
> > > > --- a/drivers/gpu/drm/i915/Makefile
> > > > +++ b/drivers/gpu/drm/i915/Makefile
> > > > @@ -312,6 +312,7 @@ i915-y +=3D \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0display/intel_tc.o =
\
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0display/intel_vblan=
k.o \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0display/intel_vga.o=
 \
> > > > +        display/intel_dmc_wl.o \
> >=20
> > This is in the wrong sorting position :-)

Heh, forgot to move it when I renamed the file. I fixed it.


> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0display/intel_wm.o =
\
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0display/skl_scaler.=
o \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0display/skl_univers=
al_plane.o \
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/=
drm/i915/display/intel_de.h
> > > > index 42552d8c151e..ef24748d522d 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_de.h
> > > > +++ b/drivers/gpu/drm/i915/display/intel_de.h
> > > > @@ -42,16 +42,47 @@ intel_de_write(struct drm_i915_private *i915, i=
915_reg_t reg, u32 val)
> > > > }
> > > >=20
> > > > static inline u32
> > > > -intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 cl=
ear, u32 set)
> > > > +__intel_de_rmw_nowl(struct drm_i915_private *i915, i915_reg_t reg,
> > > > +                    u32 clear, u32 set)
> > > > {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return intel_uncore=
_rmw(&i915->uncore, reg, clear, set);
> > > > }
> > > >=20
> > > > +static inline u32
> > > > +intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 cl=
ear, u32 set)
> > > > +{
> > > > +        u32 val;
> > > > +
> > > > +        intel_dmc_wl_get(i915, reg);
> > > > +
> > > > +        val =3D __intel_de_rmw_nowl(i915, reg, clear, set);
> > > > +
> > > > +        intel_dmc_wl_put(i915, reg);
> > > > +
> > > > +        return val;
> > > > +}
> > > > +
> > > > +static inline int
> > > > +__intel_wait_for_register_nowl(struct drm_i915_private *i915, i915=
_reg_t reg,
> > > > +                               u32 mask, u32 value, unsigned int t=
imeout)
> > > > +{
> > > > +        return intel_wait_for_register(&i915->uncore, reg, mask,
> > > > +                                       value, timeout);
> > > > +}
> > > > +
> > > > static inline int
> > > > intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_=
t reg,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0u32 mask, u32 value, unsigned int timeout)
> > > > {
> > > > -        return intel_wait_for_register(&i915->uncore, reg, mask, v=
alue, timeout);
> > > > +        int ret;
> > > > +
> > > > +        intel_dmc_wl_get(i915, reg);
> > > > +
> > > > +        ret =3D __intel_wait_for_register_nowl(i915, reg, mask, va=
lue, timeout);
> > > > +
> > > > +        intel_dmc_wl_put(i915, reg);
> > > > +
> > > > +        return ret;
> > > > }
> > > >=20
> > > > static inline int
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers=
/gpu/drm/i915/display/intel_display.c
> > > > index c3a46272d3a3..f38146690298 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > > @@ -115,6 +115,7 @@
> > > > #include "intel_vdsc_regs.h"
> > > > #include "intel_vga.h"
> > > > #include "intel_vrr.h"
> > > > +#include "intel_dmc_wl.h"
> >=20
> > Unused include here.

Oops... removed.


> > > > #include "intel_wm.h"
> > > > #include "skl_scaler.h"
> > > > #include "skl_universal_plane.h"
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/dr=
ivers/gpu/drm/i915/display/intel_display_core.h
> > > > index a90f1aa201be..ec2c16744992 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> > > > +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> > > > @@ -26,6 +26,7 @@
> > > > #include "intel_global_state.h"
> > > > #include "intel_gmbus.h"
> > > > #include "intel_opregion.h"
> > > > +#include "intel_dmc_wl.h"
> > > > #include "intel_wm_types.h"
> > > >=20
> > > > struct task_struct;
> > > > @@ -531,7 +532,10 @@ struct intel_display {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_overla=
y *overlay;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_displa=
y_params params;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_vbt_da=
ta vbt;
> > > > +        struct intel_dmc_wl wl;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct intel_wm wm;
> > > > +
> > > > +
> >=20
> > Spurious blank lines.

Fixed.


> > > > };
> > > >=20
> > > > #endif /* __INTEL_DISPLAY_CORE_H__ */
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/=
drivers/gpu/drm/i915/display/intel_display_driver.c
> > > > index ecf9cb74734b..491d1a38a313 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_display_driver.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
> > > > @@ -197,6 +197,7 @@ void intel_display_driver_early_probe(struct dr=
m_i915_private *i915)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_dpll_init_clo=
ck_hook(i915);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_init_display_=
hooks(i915);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0intel_fdi_init_hook=
(i915);
> > > > +        intel_dmc_wl_init(i915);
> > > > }
> > > >=20
> > > > /* part #1: call before irq install */
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dmc_regs.h b/driver=
s/gpu/drm/i915/display/intel_dmc_regs.h
> > > > index 90d0dbb41cfe..ef8642ced911 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dmc_regs.h
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dmc_regs.h
> > > > @@ -97,4 +97,36 @@
> > > > #define TGL_DMC_DEBUG3                _MMIO(0x101090)
> > > > #define DG1_DMC_DEBUG3                _MMIO(0x13415c)
> > > >=20
> > > > +/**
> > > > + * DOC: DMC wakelock support
> >=20
> > I'm not sure if there are documented rules about the placement of
> > documentation, but I'm used to see documentation text on the *.c file
> > where the implementation of the feature resides.

Okay.


> > > > + *
> > > > + * The wakelock mechanism in DMC is used to make sure it doesn't e=
nter
> > > > + * deeper power-saving modes in order to reduce the latency in
> > > > + * DC5->DC2 restore.
> >=20
> > When I read the spec, I get the impression that the main
> > objective/use-case of DMC Wakelocks is to provide the driver a way of
> > controlling the exit and re-entry of DC states when programming certain
> > registers (as opposed to having the hardware do the exit/re-entry for
> > every register programming). Is that right? Should we make the statemen=
t
> > above more specific then?

Okay, I'll improve the description.


> > By the way, do we have a way of measuring improvements on performance
> > with this new feature?

I don't really know, but AFAICT this is mostly used in non-critical
sections, so I don't think there will be any significant improvement in
overall performance...


> > > > + *
> > > > + * The mechanism can be enabled and disabled by writing to the
> > > > + * DMC_WAKELOCK_CFG register.  There are also 13 control registers
> > > > + * that can be used to hold and release different wakelocks.  In t=
he
> > > > + * current implementation, we only need one wakelock, so only
> > > > + * DMC_WAKELOCK1_CTL is used.  The other definitions are here for
> > > > + * potential future use.
> > > > + */
> > > > +#define DMC_WAKELOCK_CFG        _MMIO(0x8F1B0)
> > > > +#define  DMC_WAKELOCK_CFG_ENABLE REG_BIT(31)
> > > > +#define DMC_WAKELOCK1_CTL        _MMIO(0x8F140)
> >=20
> > Since we are only using DMC_WAKELOCK1_CTL, I think we can postpone the
> > definition of extra offsets to when (or if) we need them.

Okay.


> > > > +#define DMC_WAKELOCK2_CTL        _MMIO(0x8F144)
> > > > +#define DMC_WAKELOCK3_CTL        _MMIO(0x8F148)
> > > > +#define DMC_WAKELOCK4_CTL        _MMIO(0x8F14C)
> > > > +#define DMC_WAKELOCK5_CTL        _MMIO(0x8F150)
> > > > +#define DMC_WAKELOCK6_CTL        _MMIO(0x8F154)
> > > > +#define DMC_WAKELOCK7_CTL        _MMIO(0x8F158)
> > > > +#define DMC_WAKELOCK8_CTL        _MMIO(0x8F15C)
> > > > +#define DMC_WAKELOCK9_CTL        _MMIO(0x8F160)
> > > > +#define DMC_WAKELOCK10_CTL        _MMIO(0x8F164)
> > > > +#define DMC_WAKELOCK11_CTL        _MMIO(0x8F168)
> > > > +#define DMC_WAKELOCK12_CTL        _MMIO(0x8F16C)
> > > > +#define DMC_WAKELOCK13_CTL        _MMIO(0x8F170)
> > > > +#define  DMC_WAKELOCK_CTL_REQ         REG_BIT(31)
> > > > +#define  DMC_WAKELOCK_CTL_ACK         REG_BIT(15)
> > > > +
> > > > #endif /* __INTEL_DMC_REGS_H__ */
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.c b/drivers/=
gpu/drm/i915/display/intel_dmc_wl.c
> > > > new file mode 100644
> > > > index 000000000000..abe1ea92cf65
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.c
> > > > @@ -0,0 +1,185 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright (C) 2023 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <linux/kernel.h>
> > > > +
> > > > +#include "intel_de.h"
> > > > +#include "intel_dmc_regs.h"
> > > > +#include "intel_dmc_wl.h"
> > > > +
> > > > +#define DMC_WAKELOCK_CTL_TIMEOUT 100
> >=20
> > The documented timeout value is 5ms. Have we observed longer time to
> > ack?

No, the ack is always pretty much immediate. The 100 was just a safe
ballpark to start with. Changed to 5 ms and it still seems to work fine
(i.e. no timeouts observed).


> > > > +
> > > > +static struct intel_dmc_wl_range lnl_wl_range[] =3D {
> > > > +        { .start =3D 0x60000, .end =3D 0x7ffff },
> > > > +};
> > > > +
> > > > +static void __intel_dmc_wl_release(struct drm_i915_private *i915)
> > > > +{
> > > > +        struct intel_dmc_wl *wl =3D &i915->display.wl;
> > > > +
> > > > +        WARN_ON(refcount_read(&wl->refcount));
> > > > +
> > > > +        queue_delayed_work(i915->unordered_wq, &wl->work,
> > > > +                           msecs_to_jiffies(2000));
> >=20
> >=20
> > Is there any rationale behind this number? We are basically holding DC
> > "off" for about 2 seconds here. That said, I'm not sure what would be a
> > good number.

This was also an arbitrary, large-enough number that I forgot to
adjust. I'm pretty sure it can be much smaller, I just need to find out
a reasonable value.  I'll start with 50 msecs now, let's see how it
goes.  We can fine-tune this as needed later on.


> > > > +}
> > > > +
> > > > +static void intel_dmc_wl_work(struct work_struct *work)
> > > > +{
> > > > +        struct intel_dmc_wl *wl =3D
> > > > +                container_of(work, struct intel_dmc_wl, work.work)=
;
> > > > +        struct drm_i915_private *i915 =3D
> > > > +                container_of(wl, struct drm_i915_private, display.=
wl);
> > > > +        unsigned long flags;
> > > > +        u32 ctl_value;
> > > > +
> > > > +        spin_lock_irqsave(&wl->lock, flags);
> > > > +
> > > > +        ctl_value =3D __intel_de_rmw_nowl(i915, DMC_WAKELOCK1_CTL,
> > > > +                                        DMC_WAKELOCK_CTL_REQ, 0);
> >=20
> > Variable ctl_value is set but unused.

I need this with my logs, but this is a rebase issue here, they should
be in the debug patch I have, not here.  Fixed.


> >=20
> > > > +
> > > > +        __intel_wait_for_register_nowl(i915,  DMC_WAKELOCK1_CTL,
> > > > +                                       DMC_WAKELOCK_CTL_ACK, 0,
> > > > +                                       DMC_WAKELOCK_CTL_TIMEOUT);
> >=20
> > We should probably have a rate-limited warn if there is a timeout.

Makes sense. Added.


> > > > +
> > > > +        spin_unlock_irqrestore(&wl->lock, flags);
> > > > +}
> > > > +
> > > > +static bool intel_dmc_wl_check_range(u32 address)
> > > > +{
> > > > +        int i;
> > > > +        bool wl_needed =3D false;
> > > > +
> > > > +        for (i =3D 0; i < ARRAY_SIZE(lnl_wl_range); i++) {
> > > > +                if (address >=3D lnl_wl_range[i].start &&
> > > > +                    address <=3D lnl_wl_range[i].end) {
> > > > +                        wl_needed =3D true;
> > > > +                        break;
> > > > +                }
> > > > +        }
> > > > +
> > > > +        return wl_needed;
> > > > +}
> > > > +
> > > > +void intel_dmc_wl_init(struct drm_i915_private *i915)
> > > > +{
> > > > +        struct intel_dmc_wl *wl =3D &i915->display.wl;
> > > > +        unsigned long flags;
> > > > +
> > > > +        spin_lock_init(&wl->lock);
> > > > +
> > > > +        spin_lock_irqsave(&wl->lock, flags);
> > > > +        refcount_set(&wl->refcount, 0);
> > > > +        spin_unlock_irqrestore(&wl->lock, flags);
> >=20
> > I think we do not need the lock/unlock here, since this is the
> > initialization path.

Okay. I just think it's a good practice to always protect the variables
that should be protected. That's why I initialized the spinlock before
anything else. But I have removed the locking here now.


> > > > +}
> > > > +
> > > > +void intel_dmc_wl_enable(struct drm_i915_private *i915)
> > > > +{
> > > > +        struct intel_dmc_wl *wl =3D &i915->display.wl;
> > > > +        unsigned long flags;
> > > > +
> > > > +        spin_lock_irqsave(&wl->lock, flags);
> > > > +
> > > > +        if (wl->enabled)
> > > > +                goto out_unlock;
> > > > +
> > > > +        INIT_DELAYED_WORK(&wl->work, intel_dmc_wl_work);
> >=20
> > Why do we need to initialize the work structure late (and possibly
> > repeatedly)? Is there anything keeping us from doing it in
> > intel_dmc_wl_init()?

You're right. Fixed.


> > > > +
> > > > +        /*
> > > > +         * Enable wakelock in DMC.  We shouldn't try to take the
> > > > +         * wakelock, because we're just enabling it, so call the
> > > > +         * non-locking version directly here.
> > > > +         */
> > > > +        __intel_de_rmw_nowl(i915, DMC_WAKELOCK_CFG, 0, DMC_WAKELOC=
K_CFG_ENABLE);
> > > > +
> > > > +        wl->enabled =3D true;
> > > > +
> > > > +out_unlock:
> > > > +        spin_unlock_irqrestore(&wl->lock, flags);
> > > > +        return;
> > > > +}
> > > > +
> > > > +void intel_dmc_wl_disable(struct drm_i915_private *i915)
> > > > +{
> > > > +        struct intel_dmc_wl *wl =3D &i915->display.wl;
> > > > +        unsigned long flags;
> > > > +
> > > > +        spin_lock_irqsave(&wl->lock, flags);
> > > > +
> > > > +        /* FIXME: should we cancel the work? */
> >=20
> > Do we have guarantee that there will be no outstanding wakelock
> > "refs" when this function is called?
> >=20
> > =C2=A0- If that is a guarantee, then, at this point, we might have that=
 (i)
> > =C2=A0=C2=A0=C2=A0the work is pending; or (ii) it has been scheduled an=
 is or will be
> > =C2=A0=C2=A0=C2=A0waiting on wl->lock; or (iii) the work is already don=
e. One thing I
> > =C2=A0=C2=A0=C2=A0think we could do in this case is to cancel_delayed_w=
ork() here and
> > =C2=A0=C2=A0=C2=A0also have the work bail out if wl->disabled.
> >=20
> > =C2=A0- Now, if we have no such guarantee, then I believe this is a bit=
 more
> > =C2=A0=C2=A0=C2=A0involved. We would need to wait for all refs to be re=
leased, but one
> > =C2=A0=C2=A0=C2=A0issue is that we are holding wl->lock at this point, =
meaning that we
> > =C2=A0=C2=A0=C2=A0need to think how to properly solve this.

Hmmm, I don't think there is an explicit guarantee at this point.=20
Maybe the easiest thing to do to be sure would be to flush the work?
Then we should move the call to it to the beginning of the
intel_dmc_disable_program() function...


> > > > +
> > > > +        if (!wl->enabled)
> > > > +                goto out_unlock;
> > > > +
> > > > +        drm_info(&i915->drm, "DMC_WAKELOCK_CFG refcount %d\n",
> > > > +                 refcount_read(&wl->refcount));
> > > > +
> > > > +        /* Disable wakelock in DMC */
> > > > +        __intel_de_rmw_nowl(i915, DMC_WAKELOCK_CFG, DMC_WAKELOCK_C=
FG_ENABLE, 0);
> >=20
> > Looks like we are only doing step (3) of the disabling sequence in this
> > function.
> >=20
> > That said, I get the impression that intel_dmc_wl_disable() is in fact
> > supposed to be part of the "DC off" operation, which means that step (1=
)
> > and (2) would already be in place at this point.
> >=20
> > Furthermore, considering that we would wait for pending "refs" to
> > be done like suggested above, I believe step (4) would end up being
> > unnecessary.

You're right.  All this should really be moved to the DC state
operations.  I guess the other steps in the list are just to ensure the
correct ordering.


> > > > +
> > > > +        drm_info(&i915->drm, "DMC_WAKELOCK_CFG read 0x%0x\n",
> > > > +                 intel_de_read(i915, DMC_WAKELOCK_CFG));
> > > > +
> > > > +        refcount_set(&wl->refcount, 0);
> > > > +        wl->enabled =3D false;
> > > > +
> > > > +out_unlock:
> > > > +        spin_unlock_irqrestore(&wl->lock, flags);
> > > > +        return;
> > > > +}
> > > > +
> > > > +void intel_dmc_wl_get(struct drm_i915_private *i915, i915_reg_t re=
g)
> > > > +{
> > > > +        struct intel_dmc_wl *wl =3D &i915->display.wl;
> > > > +        unsigned long flags;
> > > > +        u32 ctl_value;
> > > > +
> > > > +        if (!intel_dmc_wl_check_range(reg.reg))
> > > > +                return;
> > > > +
> > > > +        spin_lock_irqsave(&wl->lock, flags);
> > > > +
> > > > +        if (!wl->enabled)
> > > > +                goto out_unlock;
> > > > +
> > > > +        if (refcount_inc_not_zero(&wl->refcount))
> > > > +                goto out_unlock;
> > > > +
> >=20
> > At this point, we will have that refcount is zero, meaning that there
> > might be a pending "release work", which would cause inconsistency if i=
t
> > gets executed while there are pending wakelock "refs".
> >=20
> > That's why I think we need to do 2 things: (1) cancel the work with
> > cancel_delayed_work() and (2) make intel_dmc_wl_work() bail out if
> > refcount is zero, since the worker might have already started and is
> > waiting on wl->lock while we are here.

Good point.  I'll add a cancel_delayed_work() even before I check if
the refcount is not zero, because as soon as we "get", we shouldn't run
the work anymore.  And, as you suggested, I'll bail out from the
release work if the refcount is zero.


> > > > +        refcount_set(&wl->refcount, 1);
> > > > +
> > > > +        ctl_value =3D __intel_de_rmw_nowl(i915, DMC_WAKELOCK1_CTL,=
 0,
> > > > +                                        DMC_WAKELOCK_CTL_REQ);
> >=20
> > Variable ctl_value is set but unused.

Fixed.

> > > > +
> > > > +        __intel_wait_for_register_nowl(i915,  DMC_WAKELOCK1_CTL,
> > > > +                                       DMC_WAKELOCK_CTL_ACK,
> > > > +                                       DMC_WAKELOCK_CTL_ACK,
> > > > +                                       DMC_WAKELOCK_CTL_TIMEOUT);
> >=20
> > We should probably raise a rate-limited warning if there is a timeout
> > here.

Added.

> > > > +
> > > > +
> > > > +out_unlock:
> > > > +        spin_unlock_irqrestore(&wl->lock, flags);
> > > > +}
> > > > +
> > > > +void intel_dmc_wl_put(struct drm_i915_private *i915, i915_reg_t re=
g)
> > > > +{
> > > > +        struct intel_dmc_wl *wl =3D &i915->display.wl;
> > > > +        unsigned long flags;
> > > > +
> > > > +        if (!intel_dmc_wl_check_range(reg.reg))
> > > > +                return;
> > > > +
> > > > +        spin_lock_irqsave(&wl->lock, flags);
> > > > +
> > > > +        if (!wl->enabled || !refcount_read(&wl->refcount))
> >=20
> > Shouldn't we treat a zero refcount as a bug? Shouldn't we raise a
> > rate-limited warning in that case?

Yes.


> >=20
> > > > +                goto out_unlock;
> > > > +
> > > > +        if (refcount_dec_and_test(&wl->refcount)) {
> > > > +                __intel_dmc_wl_release(i915);
> > > > +
> > > > +                goto out_unlock;
> > > > +        }
> > > > +
> > > > +out_unlock:
> > > > +        spin_unlock_irqrestore(&wl->lock, flags);
> > > > +}
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dmc_wl.h b/drivers/=
gpu/drm/i915/display/intel_dmc_wl.h
> > > > new file mode 100644
> > > > index 000000000000..3de6c8dc1c19
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dmc_wl.h
> > > > @@ -0,0 +1,35 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright (C) 2023 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef __INTEL_WAKELOCK_H__
> > > > +#define __INTEL_WAKELOCK_H__
> > > > +
> > > > +#include <linux/types.h>
> > > > +#include <linux/workqueue.h>
> > > > +#include <linux/refcount.h>
> > > > +
> > > > +#include "i915_reg_defs.h"
> > > > +
> > > > +struct drm_i915_private;
> > > > +
> > > > +struct intel_dmc_wl {
> >=20
> > I have the impression that we could have an intel_dmc_wl_types.h to hav=
e
> > this struct definition, but I'm not sure if I'm being overzealous here.
> >=20
> > My rationale here is that we would be separating the struct bits from
> > the interface. The things that will really need to "know" the internals
> > of struct intel_dmc_wl are struct intel_display and the implementation
> > itself (i.e. intel_dmc_wl.c).

I could do that, but I think it's a bit of an overkill?


> >=20
> > > > +        spinlock_t lock;
> > > > +        bool enabled;
> > > > +        refcount_t refcount;
> >=20
> > Looks like we are protecting both enabled and refcount members with the
> > spin lock. Do we really need refcount to be a refcount_t? Would a simpl=
e
> > int suffice?

Yeah, we could probably use an int instead of atomic_t (which refcount
uses), but there are some other checks done by the refcount framework.
I think it's nicer to keep it?


> > > > +        struct delayed_work work;
> > > > +};
> > > > +
> > > > +struct intel_dmc_wl_range {
> >=20
> > I believe this struct definition belongs to intel_dmc_wl.c, since it is
> > not necessary elsewhere.

Right, my idea when defining it here is that we could have it used in
other files as well, at some point, if the ranges are different and
will be defined separately for different platforms.  But if that
happens, we can then move it back here.

--
Cheers,
Luca.
