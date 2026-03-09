Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECF7EF3716
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 08:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D4D10E4AE;
	Mon,  9 Mar 2026 08:24:05 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A4410E4A6;
 Mon,  9 Mar 2026 08:24:04 +0000 (UTC)
Received: from 37-33-19-16.bb.dnainternet.fi ([37.33.19.16]
 helo=[192.168.101.111])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1vzVuD-000000039hu-3Iss; Mon, 09 Mar 2026 10:24:02 +0200
Message-ID: <5fc0ed576368ff7b3a04319ade9c9b27a3f9fbb1.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Mon, 09 Mar 2026 10:24:00 +0200
In-Reply-To: <a5555ababff36d7f903df7cb5c5d0e4bca6054d0.1772635152.git.jani.nikula@intel.com>
References: <cover.1772635152.git.jani.nikula@intel.com>
 <a5555ababff36d7f903df7cb5c5d0e4bca6054d0.1772635152.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
Subject: Re: [PATCH 2/8] drm/i915/display: add step name in display runtime
 info
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
> Initialize the stepping name in display runtime info. This avoids having
> to use intel_step_name().
>=20
> For display device info print at boot, debugfs and snapshot this changes
> the unknown step name from ** to N/A, which is more user friendly
> anyway.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.


>  .../drm/i915/display/intel_display_device.c   | 28 +++++++++++++++++--
>  .../drm/i915/display/intel_display_device.h   |  1 +
>  2 files changed, 26 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/driver=
s/gpu/drm/i915/display/intel_display_device.c
> index 0241603470a2..f716e9a51532 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -1653,6 +1653,28 @@ static void display_platforms_or(struct intel_disp=
lay_platforms *dst,
>  	bitmap_or(dst->bitmap, dst->bitmap, src->bitmap, display_platforms_num_=
bits());
>  }
> =20
> +#define __STEP_NAME(name) [STEP_##name] =3D #name,
> +
> +static void initialize_step(struct intel_display *display, enum intel_st=
ep step)
> +{
> +	static const char step_names[][3] =3D {
> +		STEP_NAME_LIST(__STEP_NAME)
> +	};
> +
> +	DISPLAY_RUNTIME_INFO(display)->step =3D step;
> +
> +	/* Step name will remain an empty string if not applicable */
> +	if (step >=3D 0 && step < ARRAY_SIZE(step_names))
> +		strscpy(DISPLAY_RUNTIME_INFO(display)->step_name, step_names[step]);
> +}
> +
> +#undef __STEP_NAME
> +
> +static const char *step_name(const struct intel_display_runtime_info *ru=
ntime)
> +{
> +	return strlen(runtime->step_name) ? runtime->step_name : "N/A";
> +}
> +
>  struct intel_display *intel_display_device_probe(struct pci_dev *pdev,
>  						 const struct intel_display_parent_interface *parent)
>  {
> @@ -1730,14 +1752,14 @@ struct intel_display *intel_display_device_probe(=
struct pci_dev *pdev,
>  					  subdesc ? &subdesc->step_info : NULL);
>  	}
> =20
> -	DISPLAY_RUNTIME_INFO(display)->step =3D step;
> +	initialize_step(display, step);
> =20
>  	drm_info(display->drm, "Found %s%s%s (device ID %04x) %s display versio=
n %u.%02u stepping %s\n",
>  		 desc->name, subdesc ? "/" : "", subdesc ? subdesc->name : "",
>  		 pdev->device, display->platform.dgfx ? "discrete" : "integrated",
>  		 DISPLAY_RUNTIME_INFO(display)->ip.ver,
>  		 DISPLAY_RUNTIME_INFO(display)->ip.rel,
> -		 step !=3D STEP_NONE ? intel_step_name(step) : "N/A");
> +		 step_name(DISPLAY_RUNTIME_INFO(display)));
> =20
>  	return display;
> =20
> @@ -1953,7 +1975,7 @@ void intel_display_device_info_print(const struct i=
ntel_display_device_info *inf
>  		drm_printf(p, "display version: %u\n",
>  			   runtime->ip.ver);
> =20
> -	drm_printf(p, "display stepping: %s\n", intel_step_name(runtime->step))=
;
> +	drm_printf(p, "display stepping: %s\n", step_name(runtime));
> =20
>  #define PRINT_FLAG(name) drm_printf(p, "%s: %s\n", #name, str_yes_no(inf=
o->name))
>  	DEV_INFO_DISPLAY_FOR_EACH_FLAG(PRINT_FLAG);
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/driver=
s/gpu/drm/i915/display/intel_display_device.h
> index e84c190dcc4f..1170ac346615 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -287,6 +287,7 @@ struct intel_display_runtime_info {
>  		u16 step; /* hardware */
>  	} ip;
>  	int step; /* symbolic */
> +	char step_name[3]; /* empty string if not applicable */
> =20
>  	u32 rawclk_freq;
> =20
