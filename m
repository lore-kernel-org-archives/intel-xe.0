Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AC9606A325
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 09:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AE510E607;
	Fri, 23 Oct 2026 09:59:50 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8709010E607;
 Fri, 23 Oct 2026 09:59:50 +0000 (UTC)
Received: from 176-93-65-246.bb.dnainternet.fi ([176.93.65.246]
 helo=[192.168.101.127])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xKC3m-00000004eMp-3xxD; Fri, 23 Oct 2026 12:59:47 +0300
Message-ID: <982ce9e453f4b3055a0c76721985f5720923737c.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, imre.deak@intel.com
Date: Fri, 23 Oct 2026 12:59:50 +0300
In-Reply-To: <590ce042-4bee-4671-9f22-de2178c32cf3@intel.com>
References: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
 <20261013161131.2572279-5-dibin.moolakadan.subrahmanian@intel.com>
 <9eff5ff68bfbc955a5bb7be90296939428cd5ecf.camel@coelho.fi>
 <590ce042-4bee-4671-9f22-de2178c32cf3@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
Subject: Re: [PATCH 1/2] drm/i915/display: avoid logging DC3CO transitions
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 2026-10-16 at 18:30 +0530, Dibin Moolakadan Subrahmanian wrote:
> On 10/16/2026 12:52 PM, Luca Coelho wrote:
> > On Tue, 2026-10-13 at 21:41 +0530, Dibin Moolakadan Subrahmanian wrote:
> > > DC3CO transitions can happen every frame.
> > > Logging them floods the log and adds overhead to the flip path.
> > >=20
> > > Skip logs for transitions to or from DC3CO, while retaining logs for
> > > other DC state changes. Log DC3CO trigger changes through
> > > intel_display_power_dc3co_update().
> > >=20
> > > Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrah=
manian@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/display/intel_display_power.c |  6 ++++++
> > >   .../drm/i915/display/intel_display_power_well.c    | 14 +++++++++++=
+--
> > >   2 files changed, 18 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/dri=
vers/gpu/drm/i915/display/intel_display_power.c
> > > index 1b60ce2dd00c..53afd791381e 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> > > @@ -4,6 +4,7 @@
> > >    */
> > >  =20
> > >   #include <linux/iopoll.h>
> > > +#include <linux/string_choices.h>
> > >   #include <linux/string_helpers.h>
> > >  =20
> > >   #include <drm/drm_print.h>
> > > @@ -419,6 +420,11 @@ void intel_display_power_dc3co_update(struct int=
el_display *display, u32 trigger
> > >   		return;
> > >  =20
> > >   	mutex_lock(&dc3co->lock);
> > > +
> > > +	if (dc3co->trigger !=3D trigger)
> > > +		drm_dbg_kms(display->drm, "DC3co allowed:%s trigger %#x -> %#x\n",
> > s/DC3co/DC3O/ for consistency.
> >=20
> >=20
> > > +			    str_yes_no(trigger), dc3co->trigger, trigger);
> > > +
> > >   	dc3co->trigger =3D trigger;
> > >   	dc3co->allowed =3D !!trigger;
> > >   	mutex_unlock(&dc3co->lock);
> > > diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c =
b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> > > index 233465a8306e..6d07643fc14f 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> > > @@ -862,8 +862,18 @@ void gen9_set_dc_state(struct intel_display *dis=
play, u32 state)
> > >  =20
> > >   	val =3D intel_de_read(display, DC_STATE_EN);
> > >   	mask =3D gen9_dc_mask(display);
> > > -	drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n",
> > > -		    val & mask, state);
> > > +
> > > +	/*
> > > +	 * DC3co is entered and exited once per frame while PSR2 or panel
> > s/DC3co/DC3CO/
> >=20
> >=20
> > > +	 * replay is active, so logging both transitions floods the log. Th=
e
> > > +	 * exit additionally happens from intel_display_power_get(DC_OFF) i=
n
> > > +	 * the atomic commit path, before the flip has been armed, where th=
e
> > > +	 * printk is a measurable part of the time budget. Skip both.
> > > +	 */
> > > +	if ((val & mask) !=3D DC_STATE_EN_UPTO_DC3CO &&
> > > +	    state !=3D DC_STATE_EN_UPTO_DC3CO)
> > > +		drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n",
> > > +			    val & mask, state);
> > >  =20
> > >   	/* Check if DMC is ignoring our DC state requests */
> > >   	if ((val & mask) !=3D power_domains->dc_state)
> >=20
> > What about this log:
> >=20
> > void intel_power_well_enable(struct intel_display *display, struct i915=
_power_well *power_well)
> > {
> > 	drm_dbg_kms(display->drm, "enabling %s\n", intel_power_well_name(power=
_well));
> >=20
> >=20
> > ...and the "disabling %s" one? Claude tells me that they are in the
> > same path you're trying to silence.
>=20
> You're right, the power-well messages will still be present.
>=20
> I kept them intentionally, as removing these generic messages would reduc=
e visibility
> into power-well transitions and affect debug ability beyond DC3CO.
>=20
> DC3CO-specific trigger changes are still logged through
> `intel_display_power_dc3co_update()`.

But does it really help to remove 1 out of 3 lines of log spamming? In
this case it will only take 1 third less of the spamming space...

--
Cheers,
Luca.
