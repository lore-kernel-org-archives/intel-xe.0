Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972C3C624A5
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA6910E262;
	Mon, 31 Aug 2026 08:13:31 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A9410E262;
 Mon, 31 Aug 2026 08:13:30 +0000 (UTC)
Received: from 37-33-54-222.bb.dnainternet.fi ([37.33.54.222]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1x0x8p-000000031Ey-09xl; Mon, 31 Aug 2026 11:13:28 +0300
Message-ID: <2a31365ad6fda73c7da01c3dbabeee8e06725a62.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@linux.intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 11:13:17 +0300
In-Reply-To: <61b49de30e824a79667d39e018de18a98dea45c0@intel.com>
References: <20260817092911.342072-1-luciano.coelho@intel.com>
 <20260817092911.342072-4-luciano.coelho@intel.com>
 <61b49de30e824a79667d39e018de18a98dea45c0@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
MIME-Version: 1.0
Subject: Re: [PATCH v3 3/5] drm/i915/display: remove unnecessary
 clock_gating include from intel_display.c
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

On Thu, 2026-08-27 at 10:28 +0300, Jani Nikula wrote:
> On Mon, 17 Aug 2026, Luca Coelho <luciano.coelho@intel.com> wrote:
> > We don't use any of the functions inclued in intel_clock_gating.h in
>=20
> inclued?
>=20
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>=20
>=20
> > the intel_display.c code anymore.  Remove the respective include.
> >=20
> > Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index 553c60d452dd..fc30a455bed3 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -60,7 +60,6 @@
> >  #include "intel_bo.h"
> >  #include "intel_bw.h"
> >  #include "intel_cdclk.h"
> > -#include "intel_clock_gating.h"
> >  #include "intel_cmtg.h"
> >  #include "intel_color.h"
> >  #include "intel_crt.h"

Thanks for the review!

I have now pushed patches 1-3 to drm-intel-next.

--
Cheers,
Luca.
