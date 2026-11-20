Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F20C606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sd9JrAkO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D3C112B02;
	Fri, 20 Nov 2026 14:39:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1B9112B05;
 Fri, 20 Nov 2026 14:39:24 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 60F0C41397;
 Fri, 20 Nov 2026 14:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003D31F000D0;
 Fri, 20 Nov 2026 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795185564;
 bh=aJTYPxw+DFk94Q0dwUStlosfud0ANDn4kwbnzjW8h04=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Sd9JrAkOKrzn1TUooR+pp+030D9PhOmBLi2wMUmThSYElrK2m2gTOgvWWV+ZC5hVj
 /ElZDslvSYB+UJ1OUNbPrV/CVz3tMCyl/P9o/in4OOUWRH8MbNzVJJou7w5egPZnoc
 qUUCqxJM65CNf0ub/LN7220jjhfU80ZeyQJWLFBc34gHaMXBoG4XLrLt3L+c2kbf0s
 yjnDJtX4SDSibNwEOEpBr5kWzE+I2I3QsrWKlLObCo5OoV3uBGwz8dtmxMx7ea9u/I
 ighfyP0zPrKOPfpAA2/0OKKAsy9ToFwziu9GBoz4Hqj9QUiPChIBbiLhQKGGtPhrMR
 9DG+rOLQekPRw==
Message-ID: <sashiko-outbox-225398@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/29] drm/i915/dp: Store the PCON FRL rate in the crtc
 state
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120140729.466177-20-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
 <20261120140729.466177-20-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:39:23 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/i915/dp: stale FRL state in intel_dp_check_frl_training()
  on TMDS fallback
--

commit cf2883c19255833b909ba3e6b88f843de54aa02e
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp: Store the PCON FRL rate in the crtc state

This commit computes and stores the PCON FRL rate in the CRTC state and
retrains the HDMI link if an already-trained link is below the rate
required by the new stream.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 3b8031cd5ef17..61e59c2631ee3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -4433,7 +4432,8 @@ int intel_dp_pcon_set_tmds_mode(struct intel_dp *in=
tel_dp)
>  	return 0;
>  }
> =20
> -void intel_dp_check_frl_training(struct intel_dp *intel_dp)
> +void intel_dp_check_frl_training(struct intel_dp *intel_dp,
> +				 const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display =3D to_intel_display(intel_dp);
> =20
> @@ -4443,11 +4443,15 @@ void intel_dp_check_frl_training(struct intel_dp =
*intel_dp)
>  	 * -sink is HDMI2.1
>  	 */
>  	if (!(intel_dp->downstream_ports[2] & DP_PCON_SOURCE_CTL_MODE) ||
> -	    !intel_dp_is_hdmi_2_1_sink(intel_dp) ||
> -	    intel_dp->frl.is_trained)
> +	    !intel_dp_is_hdmi_2_1_sink(intel_dp))
>  		return;
> =20
> -	if (intel_dp_pcon_start_frl_training(intel_dp) < 0) {
> +	/* A link trained at a lower rate than the stream needs has to be retra=
ined */
> +	if (intel_dp->frl.is_trained &&
> +	    intel_dp->frl.trained_rate_gbps >=3D crtc_state->pcon_config.frl_ra=
te_gbps)
> +		return;
> +
> +	if (intel_dp_pcon_start_frl_training(intel_dp, crtc_state) < 0) {
>  		int ret, mode;
> =20
>  		drm_dbg(display->drm,

[Severity: Medium]
Does this leave intel_dp->frl.is_trained and intel_dp->frl.trained_rate_gbps
stale if retraining an already-trained link at a higher rate fails?

Previously intel_dp_pcon_start_frl_training() only ran when
intel_dp->frl.is_trained was false.  Now it also runs when retraining to a
higher rate, where drm_dp_pcon_frl_prepare() tears down the active FRL link
and the failure path falls back to intel_dp_pcon_set_tmds_mode() without
clearing intel_dp->frl.is_trained or intel_dp->frl.trained_rate_gbps.  A
later modeset requesting a rate at or below the old trained_rate_gbps will
then return early from intel_dp_check_frl_training() and leave the PCON in
TMDS mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120140729.4661=
77-1-ankit.k.nautiyal@intel.com?part=3D19
