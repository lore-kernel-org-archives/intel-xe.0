Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CEA606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NTSXcy7W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032C41120AB;
	Thu, 26 Nov 2026 06:49:50 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB10D112095;
 Thu, 26 Nov 2026 06:49:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 75C5E43B5A;
 Thu, 26 Nov 2026 06:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B8201F000C0;
 Thu, 26 Nov 2026 06:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795675784;
 bh=mNMSmozc+vryoy3DYUCZaRgzVny07KGX9VuXBltBW9Y=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=NTSXcy7WRBKfOCr5tvRD5wBKg44265YBRGQl0VoFZBKOclsdhm6Vqe37BzzLNHFQU
 GLYV/xTzEWu7NYGWjriiJTa3KfhQIiB2dUFX+1F05a+P8YH6ZSCH2SHFRdD1cHpEsD
 ilFOTaCLJh95UjNz2ZO9vOkqx4+NRReOpYapiSyNEZELGXCVRUKzaO5mHGecuAPrDd
 T/r348P4ngjAgzGFY4vUiu+zIZQNfMZNbrLXKNDYDgMKtVwicIBZfpE69xZ4/81k3o
 4Ea60/YXtCkzHvZcEllF/q8AJzLq8lVgH3bdyZ2EkqTeGZHuzaDTwzAnu7Le1oIkoS
 npnfUoOQwvxxQ==
Message-ID: <sashiko-outbox-234903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/15] drm/i915/pipelock: Equalize the guardband across
 a pipelock group
To: "Suraj Kandpal" <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261126063459.863698-12-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-12-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:49:43 +0000
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
- [Medium] drm/i915/pipelock: negative bit shift in
  pipelock_group_guardband()
--

commit b42870c545a16f2b3393a7945560d4d31fa9bd29
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/pipelock: Equalize the guardband across a pipelock group

This commit drops the guardband equality check from
intel_pipelock_compatible() and raises each tile's VRR guardband to the
maximum across its pipelock group before running DP late config.

> diff --git a/drivers/gpu/drm/i915/display/intel_pipelock.c b/drivers/gpu/=
drm/i915/display/intel_pipelock.c
> index 23b6db074385d..276a7bfa7c4bf 100644
> --- a/drivers/gpu/drm/i915/display/intel_pipelock.c
> +++ b/drivers/gpu/drm/i915/display/intel_pipelock.c
[ ... ]
> @@ -92,14 +93,38 @@ bool intel_pipelock_compatible(const struct intel_crt=
c_state *crtc_state1,
>  		crtc_state1->vrr.vmin =3D=3D crtc_state2->vrr.vmin &&
>  		crtc_state1->vrr.vmax =3D=3D crtc_state2->vrr.vmax &&
>  		crtc_state1->vrr.flipline =3D=3D crtc_state2->vrr.flipline &&
> -		crtc_state1->vrr.guardband =3D=3D crtc_state2->vrr.guardband &&
>  		crtc_state1->infoframes.enable =3D=3D crtc_state2->infoframes.enable &&
>  		intel_dpll_compare_hw_state(display, &crtc_state1->dpll_hw_state,
>  					    &crtc_state2->dpll_hw_state);
>  }
> =20
> -void intel_pipelock_compute_config(struct intel_crtc_state *crtc_state)
> +static int pipelock_group_guardband(struct intel_atomic_state *state, u1=
6 transcoders)
>  {
> +	const struct intel_crtc_state *crtc_state;
> +	struct intel_crtc *crtc;
> +	int guardband =3D 0;
> +
> +	for_each_new_intel_crtc_in_state(state, crtc, crtc_state) {
> +		if (transcoders & BIT(crtc_state->cpu_transcoder))
> +			guardband =3D max_t(int, guardband, crtc_state->vrr.guardband);
> +	}

[Severity: Medium]
Can BIT(crtc_state->cpu_transcoder) shift by a negative amount here when
a disabled CRTC is present in the atomic state?

In intel_atomic_check_config(), a disabled CRTC is reset by
intel_crtc_prepare_cleared_state() -> intel_crtc_state_reset() (which sets
cpu_transcoder to INVALID_TRANSCODER, i.e. -1) and then skips
intel_modeset_pipe_config().  Sibling loops such as
intel_cpu_transcoders_need_modeset() check crtc_state->hw.enable before
evaluating BIT(crtc_state->cpu_transcoder) to avoid undefined shift
behavior and UBSAN shift-out-of-bounds warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126063459.8636=
98-1-suraj.kandpal@intel.com?part=3D11
