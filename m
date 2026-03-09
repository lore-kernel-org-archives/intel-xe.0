Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BDDF513F1
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 09:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FDA10E4AC;
	Mon,  9 Mar 2026 09:11:40 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929C310E145;
 Mon,  9 Mar 2026 09:11:39 +0000 (UTC)
Received: from 37-33-19-16.bb.dnainternet.fi ([37.33.19.16]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vzWeG-000000039o9-3nSq; Mon, 09 Mar 2026 11:11:37 +0200
Message-ID: <335085b7df3b32d7dccbaa636ccfc8764b063c24.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Mon, 09 Mar 2026 11:11:35 +0200
In-Reply-To: <d314f94272ffa45bb90b77f07220baac914769df.1772635152.git.jani.nikula@intel.com>
References: <cover.1772635152.git.jani.nikula@intel.com>
 <d314f94272ffa45bb90b77f07220baac914769df.1772635152.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
Subject: Re: [PATCH 7/8] drm/xe/step: switch from enum xe_step to intel_step
 naming
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
> Remove the xe_step macro, and use the enum intel_step name directly.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  drivers/gpu/drm/xe/tests/xe_pci.c  | 4 ++--
>  drivers/gpu/drm/xe/xe_step.c       | 2 +-
>  drivers/gpu/drm/xe/xe_step.h       | 4 ++--
>  drivers/gpu/drm/xe/xe_step_types.h | 2 --
>  4 files changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests=
/xe_pci.c
> index f3179b31f13e..860409c579f8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> @@ -131,12 +131,12 @@ static const char *subplatform_prefix(enum xe_subpl=
atform s)
>  	return s =3D=3D XE_SUBPLATFORM_NONE ? "" : " ";
>  }
> =20
> -static const char *step_prefix(enum xe_step step)
> +static const char *step_prefix(enum intel_step step)
>  {
>  	return step =3D=3D STEP_NONE ? "" : " ";
>  }
> =20
> -static const char *step_name(enum xe_step step)
> +static const char *step_name(enum intel_step step)
>  {
>  	return step =3D=3D STEP_NONE ? "" : xe_step_name(step);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index 2860986f82f7..e021da35b03c 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -248,7 +248,7 @@ struct xe_step_info xe_step_gmdid_get(struct xe_devic=
e *xe,
>  	case STEP_##name:	\
>  		return #name;
> =20
> -const char *xe_step_name(enum xe_step step)
> +const char *xe_step_name(enum intel_step step)
>  {
>  	switch (step) {
>  	STEP_NAME_LIST(STEP_NAME_CASE);
> diff --git a/drivers/gpu/drm/xe/xe_step.h b/drivers/gpu/drm/xe/xe_step.h
> index 686cb59200c2..6fd680c1b45e 100644
> --- a/drivers/gpu/drm/xe/xe_step.h
> +++ b/drivers/gpu/drm/xe/xe_step.h
> @@ -16,8 +16,8 @@ struct xe_step_info xe_step_pre_gmdid_get(struct xe_dev=
ice *xe);
>  struct xe_step_info xe_step_gmdid_get(struct xe_device *xe,
>  				      u32 graphics_gmdid_revid,
>  				      u32 media_gmdid_revid);
> -static inline u32 xe_step_to_gmdid(enum xe_step step) { return step - ST=
EP_A0; }
> +static inline u32 xe_step_to_gmdid(enum intel_step step) { return step -=
 STEP_A0; }
> =20
> -const char *xe_step_name(enum xe_step step);
> +const char *xe_step_name(enum intel_step step);
> =20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_step_types.h b/drivers/gpu/drm/xe/xe_s=
tep_types.h
> index bc3ed5a8282a..bd9a7a44a67f 100644
> --- a/drivers/gpu/drm/xe/xe_step_types.h
> +++ b/drivers/gpu/drm/xe/xe_step_types.h
> @@ -10,8 +10,6 @@
> =20
>  #include <drm/intel/step.h>
> =20
> -#define xe_step intel_step
> -
>  struct xe_step_info {
>  	u8 graphics;
>  	u8 media;
