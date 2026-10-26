Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A622A606A31D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 08:51:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6392010ECDE;
	Mon, 26 Oct 2026 08:51:10 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B7610ECDC;
 Mon, 26 Oct 2026 08:51:08 +0000 (UTC)
Received: from 91-152-156-14.elisa-laajakaista.fi ([91.152.156.14]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xLGPs-00000004j5r-25X1; Mon, 26 Oct 2026 10:51:05 +0200
Message-ID: <fb94743fc57965085dbc34d98cb035ef2decefb7.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, imre.deak@intel.com
Date: Mon, 26 Oct 2026 10:51:05 +0200
In-Reply-To: <54047513-fe84-46f0-b372-f92182ba9eb6@intel.com>
References: <20261013161131.2572279-4-dibin.moolakadan.subrahmanian@intel.com>
 <20261013161131.2572279-5-dibin.moolakadan.subrahmanian@intel.com>
 <9eff5ff68bfbc955a5bb7be90296939428cd5ecf.camel@coelho.fi>
 <590ce042-4bee-4671-9f22-de2178c32cf3@intel.com>
 <982ce9e453f4b3055a0c76721985f5720923737c.camel@coelho.fi>
 <54047513-fe84-46f0-b372-f92182ba9eb6@intel.com>
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

On Mon, 2026-10-26 at 09:37 +0530, Dibin Moolakadan Subrahmanian wrote:
> On 10/23/2026 3:29 PM, Luca Coelho wrote:
> > On Fri, 2026-10-16 at 18:30 +0530, Dibin Moolakadan Subrahmanian wrote:
> > > On 10/16/2026 12:52 PM, Luca Coelho wrote:
> > > > On Tue, 2026-10-13 at 21:41 +0530, Dibin Moolakadan Subrahmanian wr=
ote:
> > > > > DC3CO transitions can happen every frame.
> > > > > Logging them floods the log and adds overhead to the flip path.
> > > > >=20
> > > > > Skip logs for transitions to or from DC3CO, while retaining logs =
for
> > > > > other DC state changes. Log DC3CO trigger changes through
> > > > > intel_display_power_dc3co_update().
> > > > >=20
> > > > > Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.su=
brahmanian@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/i915/display/intel_display_power.c |  6 ++++++
> > > > >    .../drm/i915/display/intel_display_power_well.c    | 14 ++++++=
++++++--
> > > > >    2 files changed, 18 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b=
/drivers/gpu/drm/i915/display/intel_display_power.c
> > > > > index 1b60ce2dd00c..53afd791381e 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> > > > > @@ -4,6 +4,7 @@
> > > > >     */
> > > > >   =20
> > > > >    #include <linux/iopoll.h>
> > > > > +#include <linux/string_choices.h>
> > > > >    #include <linux/string_helpers.h>
> > > > >   =20
> > > > >    #include <drm/drm_print.h>
> > > > > @@ -419,6 +420,11 @@ void intel_display_power_dc3co_update(struct=
 intel_display *display, u32 trigger
> > > > >    		return;
> > > > >   =20
> > > > >    	mutex_lock(&dc3co->lock);
> > > > > +
> > > > > +	if (dc3co->trigger !=3D trigger)
> > > > > +		drm_dbg_kms(display->drm, "DC3co allowed:%s trigger %#x -> %#x=
\n",
> > > > s/DC3co/DC3O/ for consistency.
> > > >=20
> > > >=20
> > > > > +			    str_yes_no(trigger), dc3co->trigger, trigger);
> > > > > +
> > > > >    	dc3co->trigger =3D trigger;
> > > > >    	dc3co->allowed =3D !!trigger;
> > > > >    	mutex_unlock(&dc3co->lock);
> > > > > diff --git a/drivers/gpu/drm/i915/display/intel_display_power_wel=
l.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> > > > > index 233465a8306e..6d07643fc14f 100644
> > > > > --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> > > > > +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> > > > > @@ -862,8 +862,18 @@ void gen9_set_dc_state(struct intel_display =
*display, u32 state)
> > > > >   =20
> > > > >    	val =3D intel_de_read(display, DC_STATE_EN);
> > > > >    	mask =3D gen9_dc_mask(display);
> > > > > -	drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n=
",
> > > > > -		    val & mask, state);
> > > > > +
> > > > > +	/*
> > > > > +	 * DC3co is entered and exited once per frame while PSR2 or pan=
el
> > > > s/DC3co/DC3CO/
> > > >=20
> > > >=20
> > > > > +	 * replay is active, so logging both transitions floods the log=
. The
> > > > > +	 * exit additionally happens from intel_display_power_get(DC_OF=
F) in
> > > > > +	 * the atomic commit path, before the flip has been armed, wher=
e the
> > > > > +	 * printk is a measurable part of the time budget. Skip both.
> > > > > +	 */
> > > > > +	if ((val & mask) !=3D DC_STATE_EN_UPTO_DC3CO &&
> > > > > +	    state !=3D DC_STATE_EN_UPTO_DC3CO)
> > > > > +		drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\=
n",
> > > > > +			    val & mask, state);
> > > > >   =20
> > > > >    	/* Check if DMC is ignoring our DC state requests */
> > > > >    	if ((val & mask) !=3D power_domains->dc_state)
> > > > What about this log:
> > > >=20
> > > > void intel_power_well_enable(struct intel_display *display, struct =
i915_power_well *power_well)
> > > > {
> > > > 	drm_dbg_kms(display->drm, "enabling %s\n", intel_power_well_name(p=
ower_well));
> > > >=20
> > > >=20
> > > > ...and the "disabling %s" one? Claude tells me that they are in the
> > > > same path you're trying to silence.
> > > You're right, the power-well messages will still be present.
> > >=20
> > > I kept them intentionally, as removing these generic messages would r=
educe visibility
> > > into power-well transitions and affect debug ability beyond DC3CO.
> > >=20
> > > DC3CO-specific trigger changes are still logged through
> > > `intel_display_power_dc3co_update()`.
> > But does it really help to remove 1 out of 3 lines of log spamming? In
> > this case it will only take 1 third less of the spamming space...
>=20
> The overhead is not just about the number of log lines, but also the dela=
y
> they add to the flip path.
>=20
> The "Setting DC state 03->00" message is printed before the flip is armed=
,
> and a drm_dbg_kms() there costs on the order of 100 us or more on this se=
tup,
> delaying the arm and reducing the time available before the latch point.
>=20
> The other two messages are on the DC_OFF exit path, after the flip is arm=
ed,
> so they don't affect the flip timing.We will also retain visibility into =
the other power-well
> transitions.
>=20
> Would it help if I updated the commit message to explain this instead of =
focusing on log flooding?

Yes, I think that would make it clearer indeed.  With some extra
explanation in the commit message:

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
