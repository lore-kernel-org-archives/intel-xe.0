Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CC9C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 13:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCB110E82E;
	Thu,  3 Jul 2025 13:03:57 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4B110E193;
 Thu,  3 Jul 2025 13:03:56 +0000 (UTC)
Received: from 91-155-254-100.elisa-laajakaista.fi ([91.155.254.100]
 helo=[192.168.100.137])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1uXJbU-00000008dj0-3Nhb; Thu, 03 Jul 2025 16:03:54 +0300
Message-ID: <81127fdad667fab5e6b5b08aff8c80f25a7fb624.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Imre Deak <imre.deak@gmail.com>
Date: Thu, 03 Jul 2025 16:03:52 +0300
In-Reply-To: <20250626082053.219514-17-imre.deak@intel.com>
References: <20250626082053.219514-1-imre.deak@intel.com>
 <20250626082053.219514-17-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
Subject: Re: [PATCH 16/20] drm/i915/dp: Print debug message for a sink
 connected off request
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

On Thu, 2025-06-26 at 11:20 +0300, Imre Deak wrote:
> From: Imre Deak <imre.deak@gmail.com>
>=20
> So far the CONNECTED_OFF_ENTRY_REQUESTED request was accepted only
> implicitly, by acking all the IRQs raised by the sink. Make this
> explicit by printing a debug message.
>=20
> Signed-off-by: Imre Deak <imre.deak@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 2e6ed7d2a64a6..90f6fe20e4c0d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5474,6 +5474,8 @@ static void intel_dp_handle_device_service_irq(stru=
ct intel_dp *intel_dp, u8 irq
>  static bool intel_dp_handle_link_service_irq(struct intel_dp *intel_dp, =
u8 irq_mask)
>  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	struct intel_encoder *encoder =3D &dp_to_dig_port(intel_dp)->base;
>  	bool reprobe_needed =3D false;
> =20
>  	if (irq_mask & RX_CAP_CHANGED)
> @@ -5482,6 +5484,12 @@ static bool intel_dp_handle_link_service_irq(struc=
t intel_dp *intel_dp, u8 irq_m
>  	if (irq_mask & HDMI_LINK_STATUS_CHANGED)
>  		intel_dp_handle_hdmi_link_status_change(intel_dp);
> =20
> +	if (irq_mask & CONNECTED_OFF_ENTRY_REQUESTED)
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s][ENCODER:%d:%s] Allowing connected off request\=
n",
> +			    connector->base.base.id, connector->base.name,
> +			    encoder->base.base.id, encoder->base.name);
> +
>  	if ((irq_mask & DP_TUNNELING_IRQ) &&
>  	    drm_dp_tunnel_handle_irq(display->dp_tunnel_mgr,
>  				     &intel_dp->aux))

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
