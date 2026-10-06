Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B63CA5FFE
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 16:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABDE10E161;
	Tue,  6 Oct 2026 16:47:54 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675DB10E161;
 Tue,  6 Oct 2026 16:47:53 +0000 (UTC)
Received: from 91-152-156-14.elisa-laajakaista.fi ([91.152.156.14]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xE8KQ-00000004ADc-04Os; Tue, 06 Oct 2026 19:47:48 +0300
Message-ID: <7b7d798b50f88455bfc4b74d7906357cf93f4b70.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Oct 2026 19:47:59 +0300
In-Reply-To: <7310e6ffaae834a2e822bba31c3ef70647ff7d0b@intel.com>
References: <20261005122302.110968-1-luciano.coelho@intel.com>
 <20261005122302.110968-3-luciano.coelho@intel.com>
 <7310e6ffaae834a2e822bba31c3ef70647ff7d0b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] drm/i915/dp: only complain about a busy AUX engine
 when it's unexpected
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

On Tue, 2026-10-06 at 15:45 +0300, Jani Nikula wrote:
> On Mon, 05 Oct 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > When intel_dp_aux_xfer() gives up on a transaction because the AUX
> > engine is still busy, the DRM helpers retry almost immediately.  If
> > the engine still hasn't recovered by then, the pre-transaction busy
> > check reports "not started" as an error, even though this is the
> > expected outcome of our own earlier decision to leave the engine
> > alone.
> >=20
> > Remember that we left the engine busy and only log a debug message in
> > that case.  Keep the error for the unexpected cases, namely when
> > someone else is using the channel or the engine is hung without us
> > having given up on it first.  A permanently hung engine is still
> > reported by the 100ms timeout error.
> >=20
> > Assisted-by: LLM
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_types.h |  2 ++
> >  drivers/gpu/drm/i915/display/intel_dp_aux.c        | 14 +++++++++++++-
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drive=
rs/gpu/drm/i915/display/intel_display_types.h
> > index 0e3083e852d5..1987b2dbd151 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -1891,6 +1891,8 @@ struct intel_dp {
> >  	struct drm_dp_desc desc;
> >  	struct drm_dp_aux aux;
> >  	u32 aux_busy_last_status;
> > +	/* we left the AUX engine busy and are waiting for it to recover */
> > +	bool aux_left_busy;
>=20
> I don't know whether the series makes sense or not, but at some point I
> need to put my foot down, might as well be now, that struct intel_dp has
> grown big enough that we can no longer add individual members and there
> needs to be more structure. For example sub-struct for aux. This is
> getting impossible to maintain.

Yeah, you're right.  I don't like adding this kind of stuff to generic
structs, but this was the easy path, like everyone else seemed to
think. ;)

How do you want me to handle this? It won't help if I put my new
elements into a substructure, unless I move the other aux stuff also
into this sub-struct.  I can see at least these other elements that
include "aux" in them, and some ops.  Should I add this as a substruct?

struct {
	struct drm_dp_aux dp_aux; /* this was just aux before */
	u32 aux_busy_last_status;

	u32 (*get_aux_clock_divider)([...]);
	u32 (*get_aux_send_ctl)([...]);
	intel_reg_t (*aux_ch_ctl_reg)([...]);
	intel_reg_t (*aux_ch_data_reg)([...]);
} aux;

And do you prefer if I add a patch before my series to reorganize these
into the sub-struct? Or should I do the same as Imre did here:

	struct {
		/* TODO: move the rest of link specific fields to here */
		[...]
	} link;

I think the latter would make more sense, because my series is a
bugfix, and this kind of code reorg should not be included in potential
backports.

--
Cheers,
Luca.

>=20

> >  	u8 train_set[4];
> > =20
> >  	struct intel_pps pps;
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/=
drm/i915/display/intel_dp_aux.c
> > index 2e8261cd641a..d0d37ef7556f 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > @@ -359,7 +359,16 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  	if (try =3D=3D 3) {
> >  		const u32 status =3D intel_de_read(display, ch_ctl);
> > =20
> > -		if (status !=3D intel_dp->aux_busy_last_status) {
> > +		/*
> > +		 * If we left the engine busy ourselves, this is expected
> > +		 * while it recovers.  Otherwise someone else is using the
> > +		 * channel or the engine is hung.
> > +		 */
> > +		if (intel_dp->aux_left_busy) {
> > +			drm_dbg_kms(display->drm,
> > +				    "%s: not started, still waiting for the AUX engine to recover =
(status 0x%08x)\n",
> > +				    intel_dp->aux.name, status);
> > +		} else if (status !=3D intel_dp->aux_busy_last_status) {
> >  			drm_err(display->drm,
> >  				"%s: not started (status 0x%08x)\n",
> >  				intel_dp->aux.name, status);
> > @@ -370,6 +379,8 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  		goto out;
> >  	}
> > =20
> > +	intel_dp->aux_left_busy =3D false;
> > +
> >  	/* Only 5 data registers! */
> >  	if (drm_WARN_ON(display->drm, send_bytes > 20 || recv_size > 20)) {
> >  		ret =3D -E2BIG;
> > @@ -402,6 +413,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> >  			 * alone, the caller will retry the transaction later.
> >  			 */
> >  			if (status & DP_AUX_CH_CTL_SEND_BUSY) {
> > +				intel_dp->aux_left_busy =3D true;
> >  				ret =3D -EBUSY;
> >  				goto out;
> >  			}
