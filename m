Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DED1606A32D
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TBFe4qcR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C242112BC0;
	Fri,  6 Nov 2026 10:07:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EC8112BC0;
 Fri,  6 Nov 2026 10:07:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F2FEA41FA1;
 Fri,  6 Nov 2026 10:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83851F0089F;
 Fri,  6 Nov 2026 10:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793959633;
 bh=2DLK2/yR6yeCtyU73gt1XI8sRCvVdTWVFGS0pdy6+Ss=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=TBFe4qcRyEUSCm1Q+L6LDdLdTtEy/87YVe2AbhM6xIxn1KDDWPeYwCd9FqLFo+znV
 8HkMzWpVfvfrCw8cI0/PY7aWyQyxoPhXHZ/8vkgajX4+t9E6bPMg0nJERFasXu45RR
 goBrnGFk8Kh4/0HRmBbqilKefYehQUwzY6nALrOaODvMU67ae+TKlvBIVWtcq69vsV
 pLxheRI/hJsoRkHuOJmvZ7/EJNZMjwucD5ZTJ8Y2BsEEWpsuzune2yJMeKPGoKi4l4
 0cS9Jcn+etyk0PEogkwOQ65M3Qyh2l15EsfmqTtvnoBYV94najY1PID3xOYm+qYDx0
 5cfZdueqgfhGQ==
Message-ID: <sashiko-outbox-201185@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/display: Limit the eDP joiner to the pipe A
 and B pair
To: "Mika Kahola" <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261106094113.2917630-1-mika.kahola@intel.com>
References: <20261106094113.2917630-1-mika.kahola@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:07:13 +0000
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
- [Medium] drm/i915/dp: intel_dp_joiner_valid_primary_pipe_mask() allows
  4-pipe eDP joiner
--

commit fe84695283ce600e9fd16b2acfa62f5dd071d260
Author: Mika Kahola <mika.kahola@intel.com>

drm/i915/display: Limit the eDP joiner to the pipe A and B pair

This commit adds intel_dp_joiner_valid_primary_pipe_mask() to restrict
joined eDP configurations to primary pipe A during mode validation and
link configuration.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index ef164a7976187..b359a66a018f4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1362,16 +1362,27 @@ static int intel_dp_mso_pixel_clock(struct intel_=
dp *intel_dp, int pixel_clock)
>  	return pixel_clock / intel_dp->mso_link_count;
>  }
> =20
> +/* eDP can only be joined as the pipe A and B pair. */
> +static u8 intel_dp_joiner_valid_primary_pipe_mask(struct intel_dp *intel=
_dp,
> +						  int num_joined_pipes)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	u8 pipe_mask =3D intel_joiner_valid_primary_pipe_mask(display, num_join=
ed_pipes);
> +
> +	if (num_joined_pipes > 1 && intel_dp_is_edp(intel_dp))
> +		pipe_mask &=3D BIT(PIPE_A);
> +
> +	return pipe_mask;
> +}

[Severity: Medium]
Does intel_dp_joiner_valid_primary_pipe_mask() still allow 4-pipe
ultrajoiner (pipes A, B, C, and D) on eDP when num_joined_pipes =3D=3D 4?

On platforms with HAS_ULTRAJOINER(display),
intel_joiner_valid_primary_pipe_mask(display, 4) returns BIT(PIPE_A)
because pipe A is the primary pipe for joining 4 consecutive pipes.
Masking pipe_mask with BIT(PIPE_A) when num_joined_pipes > 1 leaves
BIT(PIPE_A) set for num_joined_pipes =3D=3D 4 instead of rejecting
num_joined_pipes > 2, so intel_dp_can_join() and
intel_dp_compute_link_config() on pipe A can still select a 4-pipe
joiner configuration (crtc_state->joiner_pipes =3D GENMASK(3, 0)).

Also, on DISPLAY_VER(display) =3D=3D 11 where intel_dp_has_joiner() allows
non-PORT_A encoders and joiner_pipes() in intel_display.c only permits
BIT(PIPE_B) | BIT(PIPE_C), masking with BIT(PIPE_A) rejects PIPE_B while
leaving PIPE_A to fail later in intel_atomic_check_joiner().
Additionally, i915_joiner_write() in intel_display_debugfs.c still
validates force_joined_pipes against
intel_joiner_valid_primary_pipe_mask() directly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106094113.2917=
630-1-mika.kahola@intel.com?part=3D1
