Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4136BEDF027
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 09:17:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33DD10E7CA;
	Fri, 13 Feb 2026 09:17:17 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF71A10E7CC;
 Fri, 13 Feb 2026 09:17:16 +0000 (UTC)
Received: from 37-33-41-57.bb.dnainternet.fi ([37.33.41.57]
 helo=[192.168.101.110])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vqpIX-00000002LYX-1q0m; Fri, 13 Feb 2026 11:17:15 +0200
Message-ID: <eadc4c98ec81d27a7666c08d918f541260057089.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Coelho, Luciano"
 <luciano.coelho@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Fri, 13 Feb 2026 11:17:12 +0200
In-Reply-To: <DM3PPF208195D8D7F266E70FC4E81CDA15AE361A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260212184737.352515-1-luciano.coelho@intel.com>
 <20260212184737.352515-5-luciano.coelho@intel.com>
 <DM3PPF208195D8D7F266E70FC4E81CDA15AE361A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
Subject: Re: [PATCH v2 04/15] drm/i915/display: convert W/As in
 intel_cursor.c to new framework
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

On Fri, 2026-02-13 at 08:42 +0000, Kandpal, Suraj wrote:
> > Subject: [PATCH v2 04/15] drm/i915/display: convert W/As in intel_curso=
r.c to
> > new framework
> >=20
> > Convert the low-hanging fruits of workaround checks to the workaround
> > framework.  Instead of having display structure checks for the workarou=
nds all
> > over, concentrate the checks in intel_wa.c.
>=20
> * intel_display_wa.c
>=20
> >=20
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/i915/display/intel_cursor.c     | 3 ++-
> > =C2=A0drivers/gpu/drm/i915/display/intel_display_wa.c | 1 +
> > drivers/gpu/drm/i915/display/intel_display_wa.h | 1 +
> > =C2=A03 files changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c
> > b/drivers/gpu/drm/i915/display/intel_cursor.c
> > index 2c5d917fbd7e..53cd27fd4fc7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> > +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> > @@ -19,6 +19,7 @@
> > =C2=A0#include "intel_display.h"
> > =C2=A0#include "intel_display_types.h"
> > =C2=A0#include "intel_display_utils.h"
> > +#include "intel_display_wa.h"
> > =C2=A0#include "intel_fb.h"
> > =C2=A0#include "intel_fb_pin.h"
> > =C2=A0#include "intel_frontbuffer.h"
> > @@ -424,7 +425,7 @@ static u32 i9xx_cursor_ctl(const struct
> > intel_plane_state *plane_state)
> > =C2=A0		cntl |=3D MCURSOR_ROTATE_180;
> >=20
> > =C2=A0	/* Wa_22012358565:adl-p */
> > -	if (DISPLAY_VER(display) =3D=3D 13)
> > +	if (intel_display_wa(display, 22012358565))
>=20
> Ahh so you define it here=20
> So with all mentioned comments addressed for this patch
> And ones where WA 22012358565 was questioned.
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com
>=20

Yes, this workaround applies to more than one file, so I defined it
here and reused it in subsequent patches.

I'll change all the commit messages as you suggested.

Thanks for the reviews!

--
Cheers,
Luca.


> > =C2=A0		cntl |=3D MCURSOR_ARB_SLOTS(1);
> >=20
> > =C2=A0	return cntl;
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c
> > b/drivers/gpu/drm/i915/display/intel_display_wa.c
> > index f0311cd477a5..8473cb25c92e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> > @@ -85,6 +85,7 @@ bool __intel_display_wa(struct intel_display *display=
,
> > enum intel_display_wa wa,
> > =C2=A0			INTEL_PCH_TYPE(display) < PCH_DG1;
> > =C2=A0	case INTEL_DISPLAY_WA_14011503030:
> > =C2=A0	case INTEL_DISPLAY_WA_14011503117:
> > +	case INTEL_DISPLAY_WA_22012358565:
> > =C2=A0		return DISPLAY_VER(display) =3D=3D 13;
> > =C2=A0	case INTEL_DISPLAY_WA_14011508470:
> > =C2=A0		return (IS_DISPLAY_VERx100(display, 1200, 1300)); diff --git
> > a/drivers/gpu/drm/i915/display/intel_display_wa.h
> > b/drivers/gpu/drm/i915/display/intel_display_wa.h
> > index 0d0501fc276f..7e5f5a466e2a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> > @@ -42,6 +42,7 @@ enum intel_display_wa {
> > =C2=A0	INTEL_DISPLAY_WA_16025573575,
> > =C2=A0	INTEL_DISPLAY_WA_22010178259,
> > =C2=A0	INTEL_DISPLAY_WA_22011320316,
> > +	INTEL_DISPLAY_WA_22012358565,
> > =C2=A0	INTEL_DISPLAY_WA_22014263786,
> > =C2=A0	INTEL_DISPLAY_WA_22021048059,
> > =C2=A0};
> > --
> > 2.51.0
