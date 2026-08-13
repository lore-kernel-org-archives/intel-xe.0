Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB24C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 08:21:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770F910E4DC;
	Thu, 13 Aug 2026 08:21:01 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D11010E4DC;
 Thu, 13 Aug 2026 08:21:00 +0000 (UTC)
Received: from 37-136-223-217.rev.dnainternet.fi ([37.136.223.217]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1wuQ1q-00000002ZHu-3txj; Thu, 13 Aug 2026 10:39:08 +0300
Message-ID: <4a5cad537812990f7a35792ecd1d7188f948d64e.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: =?UTF-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 10:39:05 +0300
In-Reply-To: <fb91bb75-3da8-c0cb-f97e-5b79afcf917f@intel.com>
References: <20260609095525.570614-5-luciano.coelho@intel.com>
 <fb91bb75-3da8-c0cb-f97e-5b79afcf917f@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
Subject: Re: [v6,4/4] drm/i915/display: remove unnecessary PHY_NONE definition
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

On Wed, 2026-07-01 at 20:36 +0200, Micha=C5=82 Grzelak wrote:
> On Tue, 9 Jun 2026, Luca Coelho wrote:
> > PHY_NONE is not really used, but we define it and, thus, need to check
> > for it in a few places we use phy.  The only potential places where
>=20
> double space: s/  / /
>=20
> > phy may become PHY_NONE, is in intel_port_to_phy(), where it derives
> > from port, which can be PORT_NONE.  Many of its callers don't check
>=20
> double space: s/  / /
>=20
> > for PHY_NONE, which can cause unknown behavior.  Additionally, this
>=20
> double space: s/  / /
>=20
> > can only happen if the encoder used has PORT_NONE, which should not be
> > the case either, without unexpected consequences.
> >=20
> > Remove the PHY_NONE definition entirely and add a couple of WARNs at
> > the relevant places, just to be sure.
> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> > drivers/gpu/drm/i915/display/intel_display.c           | 10 ++++++----
> > drivers/gpu/drm/i915/display/intel_display.h           |  2 --
> > .../gpu/drm/i915/display/intel_display_power_well.c    |  6 +++++-
> > drivers/gpu/drm/i915/display/intel_hti.c               |  3 ---
> > 4 files changed, 11 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index bdf02b67c1d8..58713ad04d37 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -1810,9 +1810,7 @@ static void hsw_crtc_disable(struct intel_atomic_=
state *state,
> > /* Prefer intel_encoder_is_combo() */
> > bool intel_phy_is_combo(struct intel_display *display, enum phy phy)
> > {
> > -	if (phy =3D=3D PHY_NONE)
> > -		return false;
> > -	else if (display->platform.alderlake_s)
> > +	if (display->platform.alderlake_s)
> > 		return phy <=3D PHY_E;
> > 	else if (display->platform.dg1 || display->platform.rocketlake)
> > 		return phy <=3D PHY_D;
> > @@ -1866,7 +1864,7 @@ bool intel_phy_is_snps(struct intel_display *disp=
lay, enum phy phy)
> > 	 * For DG2, and for DG2 only, all four "combo" ports and the TC1 port
> > 	 * (PHY E) use Synopsis PHYs. See intel_phy_is_tc().
> > 	 */
> > -	return display->platform.dg2 && phy > PHY_NONE && phy <=3D PHY_E;
> > +	return display->platform.dg2 && phy <=3D PHY_E;
> > }
> >=20
> > /* Prefer intel_encoder_to_phy() */
> > @@ -1884,6 +1882,10 @@ enum phy intel_port_to_phy(struct intel_display =
*display, enum port port)
> > 		 port =3D=3D PORT_D)
> > 		return PHY_A;
> >=20
> > +	if (drm_WARN(display->drm, port < 0,
> > +		     "PHY is invalid if port < 0 (%d), assuming PHY_A\n", port))
> > +		return PHY_A;
> > +
> > 	return PHY_A + port - PORT_A;
> > }
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu=
/drm/i915/display/intel_display.h
> > index 98b589e8360d..a4f621934b33 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display.h
> > @@ -136,8 +136,6 @@ enum tc_port {
> > };
> >=20
> > enum phy {
> > -	PHY_NONE =3D -1,
> > -
> > 	PHY_A =3D 0,
>=20
> I'm wondering if with this change we could remove the assignment above
> (PHY_A =3D 0), since I think enums are starting from 0 by default;

Yeah, the assignment to 0 is now redundant, I'll remove it.


> but again I might be missing common codestyle guidelines. Anyways:
>=20
> Reviewed-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

Thank you!

--
Cheers,
Luca.
