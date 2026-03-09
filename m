Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78290EF3717
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 08:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFF310E152;
	Mon,  9 Mar 2026 08:35:28 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34F710E152;
 Mon,  9 Mar 2026 08:35:26 +0000 (UTC)
Received: from 37-33-19-16.bb.dnainternet.fi ([37.33.19.16]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vzW56-000000039jE-04Ek; Mon, 09 Mar 2026 10:35:25 +0200
Message-ID: <6b5f9f1687008ae8f397d38a3c1792b02be73774.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Mon, 09 Mar 2026 10:35:14 +0200
In-Reply-To: <f084dedf097ba1f842e5a7f710f52681734b33a8.1772635152.git.jani.nikula@intel.com>
References: <cover.1772635152.git.jani.nikula@intel.com>
 <f084dedf097ba1f842e5a7f710f52681734b33a8.1772635152.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
Subject: Re: [PATCH 3/8] drm/i915/dmc: use step name from runtime info
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

On Wed, 2026-03-04 at 16:40 +0200, Jani Nikula wrote:
> Now that the step name is in runtime info, switch to using it instead of
> intel_step_name().
>=20
> The ** are only relevant for DMC, so make their use explicit.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  drivers/gpu/drm/i915/display/intel_dmc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> index 4e763f2f17c7..b250d41dc6a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -39,7 +39,6 @@
>  #include "intel_dmc.h"
>  #include "intel_dmc_regs.h"
>  #include "intel_flipq.h"
> -#include "intel_step.h"
> =20
>  /**
>   * DOC: DMC Firmware Support
> @@ -420,10 +419,10 @@ bool intel_dmc_has_payload(struct intel_display *di=
splay)
> =20
>  static void initialize_stepping_info(struct intel_display *display, stru=
ct stepping_info *si)
>  {
> -	const char *step_name =3D intel_step_name(INTEL_DISPLAY_STEP(display));
> +	const char *step_name =3D DISPLAY_RUNTIME_INFO(display)->step_name;
> =20
> -	si->stepping =3D step_name[0];
> -	si->substepping =3D step_name[1];
> +	si->stepping =3D step_name[0] ?: '*';
> +	si->substepping =3D step_name[1] ?: '*';
>  }
> =20
>  static void gen9_set_dc_state_debugmask(struct intel_display *display)
