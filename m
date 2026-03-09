Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFCFF513F1
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 09:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A41C10E145;
	Mon,  9 Mar 2026 09:10:33 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FDE10E145;
 Mon,  9 Mar 2026 09:10:32 +0000 (UTC)
Received: from 37-33-19-16.bb.dnainternet.fi ([37.33.19.16]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vzWdB-000000039ng-2jMr; Mon, 09 Mar 2026 11:10:30 +0200
Message-ID: <374e921caf36659b1e5ff7de8f40f13fea218bc9.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Mon, 09 Mar 2026 11:10:28 +0200
In-Reply-To: <a24789601b74cccdcb2f57b19ea6a609b8e53e16.1772635152.git.jani.nikula@intel.com>
References: <cover.1772635152.git.jani.nikula@intel.com>
 <a24789601b74cccdcb2f57b19ea6a609b8e53e16.1772635152.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
Subject: Re: [PATCH 6/8] drm/xe/step: switch to the shared step definitions
 with i915
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
> Use the shared stepping enums from include/drm/intel/step.h.
>=20
> For now, define xe_step as intel_step to avoid mass renames at the same
> time. For compat, we can remove the reverse macro.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  .../drm/xe/compat-i915-headers/intel_step.h   |  4 +-
>  drivers/gpu/drm/xe/xe_step_types.h            | 63 ++-----------------
>  2 files changed, 5 insertions(+), 62 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h b/driver=
s/gpu/drm/xe/compat-i915-headers/intel_step.h
> index 0eabe2866f5f..cb55a659856b 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
> @@ -6,8 +6,6 @@
>  #ifndef __INTEL_STEP_H__
>  #define __INTEL_STEP_H__
> =20
> -#include "xe_step_types.h"
> -
> -#define intel_step xe_step
> +#include <drm/intel/step.h>
> =20
>  #endif /* __INTEL_STEP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_step_types.h b/drivers/gpu/drm/xe/xe_s=
tep_types.h
> index d978cc2512f2..bc3ed5a8282a 100644
> --- a/drivers/gpu/drm/xe/xe_step_types.h
> +++ b/drivers/gpu/drm/xe/xe_step_types.h
> @@ -8,69 +8,14 @@
> =20
>  #include <linux/types.h>
> =20
> +#include <drm/intel/step.h>
> +
> +#define xe_step intel_step
> +
>  struct xe_step_info {
>  	u8 graphics;
>  	u8 media;
>  	u8 basedie;
>  };
> =20
> -#define STEP_ENUM_VAL(name)  STEP_##name,
> -
> -/*
> - * Always define four minor steppings 0-3 for each stepping to match GMD=
 ID
> - * spacing of values. See xe_step_gmdid_get().
> - */
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
> -enum xe_step {
> -	STEP_NONE =3D 0,
> -	STEP_NAME_LIST(STEP_ENUM_VAL)
> -	STEP_FUTURE,
> -	STEP_FOREVER,
> -};
> -
>  #endif
