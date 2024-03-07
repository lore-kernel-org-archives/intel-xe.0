Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DCFC48BF6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 12:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7FF10F0C1;
	Thu,  7 Mar 2024 12:16:04 +0000 (UTC)
X-Greylist: delayed 1099 seconds by postgrey-1.36 at gabe;
 Thu, 07 Mar 2024 12:16:03 UTC
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E1D10F0C1
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 12:16:03 +0000 (UTC)
Received: from 85-76-129-99-nat.elisa-mobile.fi ([85.76.129.99]
 helo=[192.168.52.10])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1riCNX-00000002HX2-2uJp; Thu, 07 Mar 2024 13:57:41 +0200
Message-ID: <f64616177ee9121d14981d572918f52d8a9b8edf.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, ville.syrjala@linux.intel.com, jani.nikula@intel.com
Date: Thu, 07 Mar 2024 13:55:59 +0200
In-Reply-To: <170844746576.44184.5608234415090080403@gjsousa-mobl2>
References: <20240207103007.665367-1-luciano.coelho@intel.com>
 <170844746576.44184.5608234415090080403@gjsousa-mobl2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] drm/i915/display: DMC wakelock implementation
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

Hi Gustavo,

On Tue, 2024-02-20 at 13:44 -0300, Gustavo Sousa wrote:
> Hi, Luca.
>=20
> I have provided some feedback to the individual patches.

Thanks for your comments! I'll reply to them individually.



> By the way, shouldn't this have been sent to intel-gfx instead of
> intel-xe?

Hmmm, definitely should have been sent to intel-gfx.  I somehow seem to
have chosen the wrong list... I'll send v3 to intel-gfx instead.

--
Cheers,
Luca.


> Quoting Luca Coelho (2024-02-07 07:30:01-03:00)
> > Hi,
> >=20
> > This is the third version of my series, now not as an RFC anymore, but
> > as a proper patchset.
> >=20
> > This is what changed compared to RFC v2:
> >=20
> >  * Renamed intel_wakelock.[ch] to intel_dmc_wl.[ch]
> >  * Renamed all functions to match the new file name, intel_dmc_wl_*()
> >  * Removed the excessive logging
> >  * Added comment about other CTL registers
> >  * Changed DMC_WAKELOCK_CFG_ENABLE to DMC_WAKELOCK_CTL_REQ for the
> >    control registers
> >  * Add disable function
> >  * Add module parameter
> >  * Moved the init to DMC load and added disable
> >=20
> > This is one item I promised to look into, but didn't derive into any
> > code changes:
> >=20
> >  * No need to bail out on refcount =3D=3D 0 in the work handler
> >=20
> >=20
> > Please review.
> >=20
> > Cheers,
> > Luca.
> >=20
> >=20
> > Luca Coelho (6):
> >  drm/i915/display: add support for DMC wakelocks
> >  drm/i915/display: use wakelock in the remaining read operations
> >  drm/i915/display: use wakelock in register waiting functions
> >  drm/i915/display: use wakelock in the last write function
> >  drm/i915/display: add module parameter to enable DMC wakelock
> >  drm/i915/display: call DMC wakelock enable when DMC is loaded
> >=20
> > drivers/gpu/drm/i915/Makefile                 |   1 +
> > drivers/gpu/drm/i915/display/intel_de.h       | 119 ++++++++++-
> > drivers/gpu/drm/i915/display/intel_display.c  |   1 +
> > .../gpu/drm/i915/display/intel_display_core.h |   4 +
> > .../drm/i915/display/intel_display_driver.c   |   1 +
> > .../drm/i915/display/intel_display_params.c   |   5 +
> > .../drm/i915/display/intel_display_params.h   |   1 +
> > drivers/gpu/drm/i915/display/intel_dmc.c      |   8 +
> > drivers/gpu/drm/i915/display/intel_dmc_regs.h |  32 +++
> > drivers/gpu/drm/i915/display/intel_dmc_wl.c   | 197 ++++++++++++++++++
> > drivers/gpu/drm/i915/display/intel_dmc_wl.h   |  35 ++++
> > drivers/gpu/drm/xe/Makefile                   |   1 +
> > 12 files changed, 395 insertions(+), 10 deletions(-)
> > create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.c
> > create mode 100644 drivers/gpu/drm/i915/display/intel_dmc_wl.h
> >=20
> > --=20
> > 2.39.2
> >=20

