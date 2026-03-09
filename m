Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E13EA854B
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 09:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E718110E145;
	Mon,  9 Mar 2026 09:09:19 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0337410E145;
 Mon,  9 Mar 2026 09:09:19 +0000 (UTC)
Received: from 37-33-19-16.bb.dnainternet.fi ([37.33.19.16]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vzWbz-000000039nI-009B; Mon, 09 Mar 2026 11:09:15 +0200
Message-ID: <436c2056cf7c70eddc726e07e72eed782f3d4632.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Mon, 09 Mar 2026 11:09:13 +0200
In-Reply-To: <bdfa49fcc939985c66d75f3f39987813493c3ef1.1772635152.git.jani.nikula@intel.com>
References: <cover.1772635152.git.jani.nikula@intel.com>
 <bdfa49fcc939985c66d75f3f39987813493c3ef1.1772635152.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
Subject: Re: [PATCH 5/8] drm/intel: add shared step.h and switch i915 to use it
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
> As the first step towards using shared definitions for step name
> enumerations, add shared include/drm/intel/step.h and switch i915 to use
> it.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  drivers/gpu/drm/i915/intel_step.h | 57 +---------------------------
>  include/drm/intel/step.h          | 62 +++++++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+), 55 deletions(-)
>  create mode 100644 include/drm/intel/step.h
>=20
> diff --git a/drivers/gpu/drm/i915/intel_step.h b/drivers/gpu/drm/i915/int=
el_step.h
> index 22f1d6905160..2ca36eae4b5a 100644
> --- a/drivers/gpu/drm/i915/intel_step.h
> +++ b/drivers/gpu/drm/i915/intel_step.h
> @@ -8,6 +8,8 @@
> =20
>  #include <linux/types.h>
> =20
> +#include <drm/intel/step.h>
> +
>  struct drm_i915_private;
> =20
>  struct intel_step_info {
> @@ -19,61 +21,6 @@ struct intel_step_info {
>  	u8 media_step;
>  };
> =20
> -#define STEP_ENUM_VAL(name)  STEP_##name,
> -
> -#define STEP_NAME_LIST(func)		\
> -	func(A0)			\
> -	func(A1)			\
> -	func(A2)			\
> -	func(A3)			\
> -	func(B0)			\
> -	func(B1)			\
> -	func(B2)			\
> -	func(B3)			\
> -	func(C0)			\
> -	func(C1)			\
> -	func(C2)			\
> -	func(C3)			\
> -	func(D0)			\
> -	func(D1)			\
> -	func(D2)			\
> -	func(D3)			\
> -	func(E0)			\
> -	func(E1)			\
> -	func(E2)			\
> -	func(E3)			\
> -	func(F0)			\
> -	func(F1)			\
> -	func(F2)			\
> -	func(F3)			\
> -	func(G0)			\
> -	func(G1)			\
> -	func(G2)			\
> -	func(G3)			\
> -	func(H0)			\
> -	func(H1)			\
> -	func(H2)			\
> -	func(H3)			\
> -	func(I0)			\
> -	func(I1)			\
> -	func(I2)			\
> -	func(I3)			\
> -	func(J0)			\
> -	func(J1)			\
> -	func(J2)			\
> -	func(J3)
> -
> -/*
> - * Symbolic steppings that do not match the hardware. These are valid bo=
th as gt
> - * and display steppings as symbolic names.
> - */
> -enum intel_step {
> -	STEP_NONE =3D 0,
> -	STEP_NAME_LIST(STEP_ENUM_VAL)
> -	STEP_FUTURE,
> -	STEP_FOREVER,
> -};
> -
>  void intel_step_init(struct drm_i915_private *i915);
>  const char *intel_step_name(enum intel_step step);
> =20
> diff --git a/include/drm/intel/step.h b/include/drm/intel/step.h
> new file mode 100644
> index 000000000000..4de7520109bc
> --- /dev/null
> +++ b/include/drm/intel/step.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: MIT */
> +/* Copyright =C2=A9 2026 Intel Corporation */
> +
> +#ifndef __STEP_H__
> +#define __STEP_H__
> +
> +#define STEP_ENUM_VAL(name)  STEP_##name,
> +
> +#define STEP_NAME_LIST(func)		\
> +	func(A0)			\
> +	func(A1)			\
> +	func(A2)			\
> +	func(A3)			\
> +	func(B0)			\
> +	func(B1)			\
> +	func(B2)			\
> +	func(B3)			\
> +	func(C0)			\
> +	func(C1)			\
> +	func(C2)			\
> +	func(C3)			\
> +	func(D0)			\
> +	func(D1)			\
> +	func(D2)			\
> +	func(D3)			\
> +	func(E0)			\
> +	func(E1)			\
> +	func(E2)			\
> +	func(E3)			\
> +	func(F0)			\
> +	func(F1)			\
> +	func(F2)			\
> +	func(F3)			\
> +	func(G0)			\
> +	func(G1)			\
> +	func(G2)			\
> +	func(G3)			\
> +	func(H0)			\
> +	func(H1)			\
> +	func(H2)			\
> +	func(H3)			\
> +	func(I0)			\
> +	func(I1)			\
> +	func(I2)			\
> +	func(I3)			\
> +	func(J0)			\
> +	func(J1)			\
> +	func(J2)			\
> +	func(J3)
> +
> +/*
> + * Symbolic steppings that do not match the hardware. These are valid bo=
th as gt
> + * and display steppings as symbolic names.
> + */
> +enum intel_step {
> +	STEP_NONE =3D 0,
> +	STEP_NAME_LIST(STEP_ENUM_VAL)
> +	STEP_FUTURE,
> +	STEP_FOREVER,
> +};
> +
> +#endif /* __STEP_H__ */
