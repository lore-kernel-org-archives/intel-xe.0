Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA57606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 14:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnWzdaGY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A883112B19;
	Fri, 20 Nov 2026 14:46:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54BF10E160;
 Fri, 20 Nov 2026 14:46:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6F69D455A5;
 Fri, 20 Nov 2026 14:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D501F000C6;
 Fri, 20 Nov 2026 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795185971;
 bh=7eSwegV5Sw19WDLMFzjXAAtMre8Kh00E5DCHAkmyk6g=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=RnWzdaGYnuRkkUarN0+uDlX+98VAhW1uuGx8qAY6lNyLmghbuTK1D1QWtjCb+ePuv
 MSkqE5jEvVtytE+vGJZr6w8p92tuutG+aMGKobcoO3Y2KTVjV7SR3uFgHAT29psB1Y
 8S+DnfGO2b5nYw+VtNWm4BeWNqgx982gFVyJ9BxzAdxBFtOmI5N1l5ymAWWMWTx+Kv
 BdNXnk+8Wl6k3YaeVxl61lqYwrMQva0MAE84bdp2Si/lUh8eOXJ78W0M4HI7Mc2JD2
 IkF7d4VoYpkcHm0IB3f6aX5OQxUMx7fuToqYDxhXypmZ8KxgNxcq3kXT29a/7MXJgN
 7ivLC7bYlQGrQ==
Message-ID: <sashiko-outbox-225407@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/29] drm/i915/dp: Retrain the PCON FRL link from the
 link check work
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261120140729.466177-19-ankit.k.nautiyal@intel.com>
References: <20261120140729.466177-1-ankit.k.nautiyal@intel.com>
 <20261120140729.466177-19-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 14:46:11 +0000
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
- [Medium] drm/i915/dp: unlocked state and DPCD checks in
  intel_dp_pcon_frl_recover()
--

commit e23a19c1e92fb70f0e2a9ba0ff0a7c17fe7d9715
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp: Retrain the PCON FRL link from the link check work

This commit defers PCON FRL link retraining on HDMI link status changes
from the short pulse handler to the encoder link check work, taking
modeset locks and checking for an active stream before retraining.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 05056d226fc11..3b8031cd5ef17 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4463,6 +4463,42 @@ void intel_dp_check_frl_training(struct intel_dp *=
intel_dp)
>  	}
>  }
> =20
> +/*
> + * Restart FRL training after the HDMI link went down while the stream is
> + * active, or fall back to TMDS mode.
> + */
> +int intel_dp_pcon_frl_recover(struct intel_encoder *encoder,
> +			      struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct intel_display *display =3D to_intel_display(encoder);
> +	struct intel_dp *intel_dp =3D enc_to_intel_dp(encoder);
> +	u8 pipe_mask;
> +	int ret;
> +
> +	if (!(intel_dp->downstream_ports[2] & DP_PCON_SOURCE_CTL_MODE) ||
> +	    !intel_dp_is_hdmi_2_1_sink(intel_dp) ||
> +	    intel_dp->frl.is_trained ||
> +	    drm_dp_pcon_hdmi_link_active(&intel_dp->aux))
> +		return 0;
> +
> +	/* The connection mutex may be held already by the link retraining */
> +	ret =3D drm_modeset_lock(&display->drm->mode_config.connection_mutex, c=
tx);
> +	if (ret && ret !=3D -EALREADY)
> +		return ret;
> +
> +	ret =3D intel_dp_get_active_pipes(intel_dp, ctx, &pipe_mask);
> +	if (ret)
> +		return ret;
> +
> +	/* Without an active stream the next enable trains the link */
> +	if (pipe_mask =3D=3D 0)
> +		return 0;
> +
> +	intel_dp_check_frl_training(intel_dp);
> +
> +	return 0;
> +}

[Severity: Medium]
Should the PCON capability, frl.is_trained and
drm_dp_pcon_hdmi_link_active() checks run after locking connection_mutex
and calling intel_dp_get_active_pipes()?

When DP link retraining is not needed, intel_dp_retrain_link() returns
before calling intel_dp_get_active_pipes(), so CRTC locks are not held
and in-flight commits have not been waited on when
intel_dp_pcon_frl_recover() starts:

kworker (link_check_work)         modeset commit
intel_dp_pcon_frl_recover()
  frl.is_trained =3D=3D false
  drm_dp_pcon_hdmi_link_active()
    -> false
                                  intel_dp_check_frl_training()
                                    FRL fails -> sets TMDS mode
                                    (frl.is_trained stays false,
                                     HDMI link becomes active)
  intel_dp_get_active_pipes()
    wait_for_connector_hw_done()
  intel_dp_check_frl_training()   <-- tears down active TMDS link

Running drm_dp_pcon_hdmi_link_active() before checking pipe_mask =3D=3D 0 a=
nd
intel_dp_is_connected() also issues DPCD AUX reads when the stream is
disabled (sink in D3) or after the sink is unplugged, where
intel_dp_retrain_link() returns before locking connection_mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120140729.4661=
77-1-ankit.k.nautiyal@intel.com?part=3D18
