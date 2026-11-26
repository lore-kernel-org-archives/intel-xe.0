Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE13E606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YvO6ckC0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F19210E175;
	Thu, 26 Nov 2026 06:54:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B058A10E313;
 Thu, 26 Nov 2026 06:54:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 352CA6296C;
 Thu, 26 Nov 2026 06:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27661F000C6;
 Thu, 26 Nov 2026 06:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795676065;
 bh=EjSUkbws3pLGFGFMGeHW/e5vH2iummJh80EPGBRKK6s=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=YvO6ckC0kkZwSuiQ1w7qiUNV8fPURgLX0aJC0xT/heFB0QVPjjapjRTbEsnfCkvWq
 oLmW4SUnjskGeeYFFi9l/3JWvXjxgD+rP6xfwBuuomZWSL7oI2iwL82nXKnY6REAs8
 piNQDCPQP3D5Yixrc5ef/zkuU3279jnvzQ90M7WWj73qJJBfyCM/t552d70iwQx6o6
 hvP3mdJLKGejVvdXtjuCHVGQGTRX0vdIwbBdYVMJbNJqNW1xn+w3V2lJXNnOyKks5O
 /ObjunOCgPgY3cOnDkMEbWX7JPMJZE23p7agKGnEhkLh9+oaYsuh8ElnHWMbqMHSQm
 BcmqjDfgiE75w==
Message-ID: <sashiko-outbox-234916@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/15] drm/i915/display: Use pipelock on PTL
To: "Suraj Kandpal" <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261126063459.863698-15-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-15-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:54:25 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] drm/i915/cx0: NULL dereference in intel_cx0pll_update_ssc() on
  HDMI-only ports
--

commit a9ddc45c910d4e151b59c9dfac29d2580fc18bce
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/display: Use pipelock on PTL

This commit enables pipelock on display version 30 (PTL) and disables SSC in
the CX0 PLL state for connectors where pipelock is possible.

> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/d=
rm/i915/display/intel_cx0_phy.c
> index d13bb3b2750a8..31324ac469655 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
[ ... ]
> @@ -1992,6 +1993,10 @@ static void intel_cx0pll_update_ssc(struct intel_e=
ncoder *encoder,
>  	if (is_dp) {
>  		if (intel_panel_use_ssc(display)) {
>  			struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
> +
> +			if (intel_pipelock_connector_possible(intel_dp->attached_connector))
> +				return;
> +
>  			pll_state->ssc_enabled =3D
>  				(intel_dp->dpcd[DP_MAX_DOWNSPREAD] & DP_MAX_DOWNSPREAD_0_5);
>  		}

[Severity: High]
Can intel_dp->attached_connector be NULL here, causing a NULL pointer
dereference in intel_pipelock_connector_possible()?

For an HDMI-only DDI port (init_dp =3D=3D false in intel_ddi_init()),
dig_port->dp.attached_connector is left NULL.  On display version 30,
intel_cx0_pll_power_save_wa() runs during probe, resume, and reset on every
disabled C10 PHY digital port without checking if the port initialized DP,
and calls intel_c10pll_calc_state_from_table(..., is_dp =3D true) ->
intel_cx0pll_update_ssc().  intel_pipelock_connector_possible() then
unconditionally dereferences connector via to_intel_display(connector) and
connector->base.has_tile.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126063459.8636=
98-1-suraj.kandpal@intel.com?part=3D14
