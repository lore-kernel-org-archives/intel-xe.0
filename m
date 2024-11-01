Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ED6E6B24D
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 12:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833BE10E206;
	Fri,  1 Nov 2024 12:24:15 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426C810E1F0;
 Fri,  1 Nov 2024 12:24:14 +0000 (UTC)
Received: from 91-155-254-188.elisa-laajakaista.fi ([91.155.254.188]
 helo=[192.168.100.133])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1t6qhH-00000001FRZ-06Od; Fri, 01 Nov 2024 14:24:12 +0200
Message-ID: <ac29b67d7e6db0f2900edf0e0cd40b1c5befb895.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Gustavo Sousa <gustavo.sousa@intel.com>,
 intel-gfx@lists.freedesktop.org, 	intel-xe@lists.freedesktop.org
Cc: Luca Coelho <luciano.coelho@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Date: Fri, 01 Nov 2024 14:24:08 +0200
In-Reply-To: <20241021222744.294371-5-gustavo.sousa@intel.com>
References: <20241021222744.294371-1-gustavo.sousa@intel.com>
 <20241021222744.294371-5-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 04/13] drm/i915/dmc_wl: Get wakelock when disabling
 dynamic DC states
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

On Mon, 2024-10-21 at 19:27 -0300, Gustavo Sousa wrote:
> Bspec says that disabling dynamic DC states require taking the DMC
> wakelock to cause an DC exit before writing to DC_STATE_EN. Implement
> that.
>=20
> In fact, testing on PTL revealed we end up failing to exit DC5/6 without
> this step.
>=20
> Bspec: 71583
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  .../drm/i915/display/intel_display_power_well.c    | 10 +++++++---
>  drivers/gpu/drm/i915/display/intel_dmc_wl.c        | 14 ++++++++++++--
>  drivers/gpu/drm/i915/display/intel_dmc_wl.h        |  2 ++
>  3 files changed, 21 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/dr=
ivers/gpu/drm/i915/display/intel_display_power_well.c
> index adaf7cf3a33b..e8946ce86aaa 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> @@ -987,10 +987,14 @@ void gen9_disable_dc_states(struct intel_display *d=
isplay)
>  		return;
>  	}
> =20
> -	gen9_set_dc_state(display, DC_STATE_DISABLE);
> -
> -	if (!HAS_DISPLAY(display))
> +	if (HAS_DISPLAY(display)) {
> +		intel_dmc_wl_get_noreg(display);
> +		gen9_set_dc_state(display, DC_STATE_DISABLE);
> +		intel_dmc_wl_put_noreg(display);
> +	} else {
> +		gen9_set_dc_state(display, DC_STATE_DISABLE);
>  		return;
> +	}

I think intel_dmc_get/put() already protect indirectly on
HAS_DISPLAY(), doesn't it? If that's the case, then the if here is
unnecessary.

--
Cheers,
Luca.
