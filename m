Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835E9606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GD7cP8Kt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E6B10E114;
	Wed, 11 Nov 2026 04:37:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC0E10E114;
 Wed, 11 Nov 2026 04:37:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 38C1C4016D;
 Wed, 11 Nov 2026 04:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE4F1F0089F;
 Wed, 11 Nov 2026 04:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794371832;
 bh=HphaHthz6m3Ffk2nH4vmXS1PlpqrukSCOXelepA84YY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=GD7cP8Ktjtee+eMwYgwCWv7IJjnrbWrglZB3M7biBNZX7QAZoiOPDoY2jpax+pP1B
 h8csezPOW3NwmfWp3U3sI84gpleGh9r/f/KaB5N+lF4Vc5F06eS3tC6hvGe/AFDzPa
 Hek/sb4cY32neGTePBvmGkDHigsL0EuJ8BraYBDu6OiyIgkOqh3GcqFIoARv8ckOi7
 FstLVkiR1QqZmCnfz0dR7pGMiuAlrjEQcCupLPFY2Zw829FahfddWYQyrzkzs+HyBf
 TI9RdajjOWrXIdQB7sSAB1BqZIa63ulNrYnf05aqATlELnQMuYB4I72KIQu8Y3sPqx
 t+Ihmh/jXDHEQ==
Message-ID: <sashiko-outbox-208303@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/dp: Avoid YCbCr420 on HDMI2.1 PCONs due to the
 TMDS CLK limit
To: "Xiao Lu" <xiaolu.xie@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261111040636.3932240-1-xiaolu.xie@intel.com>
References: <20261111040636.3932240-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:37:11 +0000
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
- [High] drm/i915/dp: intel_dp_frl_bw_valid() overestimates FRL bw by
  applying 18/16 to blanking
--

commit 7a66c4150ea1de9c9395550f545e6f8a16fa6852
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/dp: Avoid YCbCr420 on HDMI2.1 PCONs due to the TMDS CLK limit

This commit checks HDMI 2.1 FRL bandwidth limits instead of TMDS clock limi=
ts
in intel_dp_hdmi_compute_bpc() and intel_dp_mode_valid_downstream() when a
DP-to-HDMI PCON drives an HDMI 2.1 sink using FRL.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 47741957935ae..0836398c086ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1146,6 +1146,40 @@ static int intel_dp_max_tmds_clock(struct intel_dp=
 *intel_dp)
>  	return max_tmds_clock;
>  }
> =20
> +static bool intel_dp_is_hdmi_2_1_sink(struct intel_dp *intel_dp);
> +static int intel_dp_hdmi_sink_max_frl(struct intel_dp *intel_dp);
> +
> +static int frl_required_bw(int clock, int bpc,
> +			   enum intel_output_format sink_format)
> +{
> +	if (sink_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420)
> +		clock /=3D 2;
> +
> +	return clock * bpc * 3;
> +}
> +
> +/* Max HDMI FRL rate in Gbps if the PCON will use FRL to the sink, 0 for=
 TMDS */
> +static int intel_dp_hdmi_frl_max_bw(struct intel_dp *intel_dp)
> +{
> +	if (!(intel_dp->downstream_ports[2] & DP_PCON_SOURCE_CTL_MODE) ||
> +	    !intel_dp_is_hdmi_2_1_sink(intel_dp))
> +		return 0;
> +
> +	return min(intel_dp->dfp.pcon_max_frl_bw,
> +		   intel_dp_hdmi_sink_max_frl(intel_dp));
> +}
> +
> +/* Check the pixel data fits the FRL link, including the 16b/18b encodin=
g overhead */
> +static enum drm_mode_status
> +intel_dp_frl_bw_valid(int max_frl_bw, int clock, int bpc,
> +		      enum intel_output_format sink_format)
> +{
> +	u64 required_bw =3D (u64)frl_required_bw(clock, bpc, sink_format) * 18;
> +	u64 available_bw =3D (u64)max_frl_bw * 1000000 * 16;
> +
> +	return required_bw > available_bw ? MODE_CLOCK_HIGH : MODE_OK;
> +}

[Severity: High]
Does multiplying frl_required_bw() by 18/16 overestimate the required FRL
bandwidth and cause a regression for standard HDMI 2.1 modes?

frl_required_bw() uses the total pixel clock (including horizontal and
vertical blanking) as if the entire frame were 3-channel active video, wher=
eas
HDMI 2.1 FRL encodes horizontal blanking with 1-byte TBlank characters and
Repeat Count compression.  Scaling the full pixel clock by 18/16 pushes
standard modes past the FRL link rates designed to carry them: for example,
4K120 (1188000 kHz) 8bpc RGB requires 1188000 * 24 * 18 =3D 513216000 vs
32 * 1000000 * 16 =3D 512000000 on a 32 Gbps FRL link, and 10bpc and 12bpc =
RGB
similarly fail at 40 Gbps and 48 Gbps, causing intel_dp_mode_valid_downstre=
am()
and intel_dp_hdmi_compute_bpc() to reject them with MODE_CLOCK_HIGH.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111040636.3932=
240-1-xiaolu.xie@intel.com?part=3D1
