Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09677606A330
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYZuKG3D
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C165C10E2C6;
	Fri, 20 Nov 2026 14:43:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8F110E2C6;
 Fri, 20 Nov 2026 14:43:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D35256205D;
 Fri, 20 Nov 2026 14:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3832B1F000CA;
 Fri, 20 Nov 2026 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795185807;
 bh=/vi6cNN7Yho3YcmkJXBOWOisNVpXDay4mrsOfdnE2sU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=HYZuKG3DtjCajEINUQ8gDlMHq3en6FkiVr+s2QI93mh2NmTcahne+33yxLfYO92HS
 iEtRxnp8oTfUEJI8fbA8YFL/BrZZij/bU/gHKcpYuTUdWgVi5ROSWsSqi4QT6B/fgH
 OWth3E1H2jFqiy2orOLd1Nv5bLIhNbaFg3WjRCa8H+V7aABd0K15bPp6WROLtNKy52
 uDaRlscW5qs1KGeBueq1Mv3yVJnGhE34VDJQhtB/L3bk5ZoUtkbO5+XTg8QugqYrz0
 wjj2lS4NgvjvUByJM8GDwL4XCr+hzTGyK/uzJXVCaNm80KAFJ91X8PpeK+H0so/Xuq
 VuZAKT35M2zNg==
Message-ID: <sashiko-outbox-225402@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/29] drm/i915/dp: Use the FRL rate of the stream on
 the HDMI link
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120140729.466177-21-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
 <20261120140729.466177-21-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:43:26 +0000
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
- [Medium] drm/i915/dp: FRL link not retrained down to DSC max rate on
  DSC modeset
--

commit cb3ec345bf9ce293b708da9d140003a687dee654
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp: Use the FRL rate of the stream on the HDMI link

This commit selects the regular max FRL rate when the HDMI link carries an
uncompressed stream and the sink's DSC max FRL rate when the PCON encodes
DSC for the HDMI link, storing the chosen rate in
crtc_state->pcon_config.frl_rate_gbps.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 61e59c2631ee3..cea90ef761c3c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c

[ ... ]

> @@ -2930,8 +2937,8 @@ intel_dp_pcon_compute_config(struct intel_dp *intel=
_dp,
>  	if (!intel_dp_is_hdmi_2_1_sink(intel_dp))
>  		return 0;
> =20
> -	crtc_state->pcon_config.frl_rate_gbps =3D
> -		min(intel_dp->dfp.pcon_max_frl_bw, intel_dp_hdmi_sink_max_frl(intel_dp=
));
> +	/* The HDMI link carries an uncompressed stream, unless the PCON compre=
sses it */
> +	crtc_state->pcon_config.frl_rate_gbps =3D intel_dp_pcon_max_frl_rate(in=
tel_dp, false);
> =20
>  	if (crtc_state->dsc.compression_enable)
>  		crtc_state->pcon_config.dsc_op =3D INTEL_PCON_DSC_DECODE;
> @@ -2959,6 +2966,7 @@ intel_dp_pcon_compute_config(struct intel_dp *intel=
_dp,
>  	}
> =20
>  	crtc_state->pcon_config.dsc_op =3D INTEL_PCON_DSC_DECODE_ENCODE;
> +	crtc_state->pcon_config.frl_rate_gbps =3D intel_dp_pcon_max_frl_rate(in=
tel_dp, true);
> =20
>  	return 0;
>  }

[Severity: Medium]
When a sink's DSC max FRL rate is lower than its uncompressed max FRL
rate, will switching from an uncompressed mode to a mode using
INTEL_PCON_DSC_DECODE_ENCODE fail to retrain the FRL link down to the
lower crtc_state->pcon_config.frl_rate_gbps?

The uncompressed modeset trains the link at the higher uncompressed rate
and records it in intel_dp->frl.trained_rate_gbps.  On a later DSC
modeset, crtc_state->pcon_config.frl_rate_gbps is set to the lower DSC
rate, but both intel_dp_check_frl_training() and
intel_dp_pcon_is_frl_trained() skip retraining whenever the currently
trained rate is greater than or equal to the requested rate:

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_check_frl_training() {
    ...
	/* A link trained at a lower rate than the stream needs has to be retraine=
d */
	if (intel_dp->frl.is_trained &&
	    intel_dp->frl.trained_rate_gbps >=3D crtc_state->pcon_config.frl_rate_=
gbps)
		return;
    ...
}

drivers/gpu/drm/i915/display/intel_dp.c:intel_dp_pcon_is_frl_trained() {
	if (drm_dp_pcon_hdmi_link_active(&intel_dp->aux) &&
	    drm_dp_pcon_hdmi_link_mode(&intel_dp->aux, frl_trained_mask) =3D=3D DP=
_PCON_HDMI_MODE_FRL &&
	    *frl_trained_mask >=3D max_frl_bw_mask)
		return true;
    ...
}

As a result, the HDMI link remains at the higher uncompressed FRL rate,
exceeding the sink's DSC max FRL rate limit and mismatching the FRL
bandwidth used by intel_dp_pcon_dsc_enc_compute().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120140729.4661=
77-1-ankit.k.nautiyal@intel.com?part=3D20
