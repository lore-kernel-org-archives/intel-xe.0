Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E4606A32D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=auXh0AeZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786A410E7EC;
	Mon, 23 Nov 2026 15:32:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A90510E7EC;
 Mon, 23 Nov 2026 15:32:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A349D622F4;
 Mon, 23 Nov 2026 15:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20491F000C6;
 Mon, 23 Nov 2026 15:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795447929;
 bh=+fnYLPGClFXaxkbG9Hvf2idThA8QQzMJW+R71w3OSHY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=auXh0AeZXvw8q2u1utiPut7QdHYekqzPzyKa5tQjJmUTs6n3pjlboGd0k7T+kSVv/
 msW9Kc/muncdu88gfs35jnxrc6XzfmmyowNtEjiwsteGdJTVKW444/O6xX7X//7ORI
 lSRG5vk9lxg4RRnV9R2kJ1fk0iJPCdaFaDNENtxaTgf0rZF+gCPpfwLjla8nPyI+M8
 s1Ltt8qG0wODjviDTa+VNH/eYFGqFrGvoNKfVbgcQn8uOXwLtYOYLmkfwFLyE8GJJH
 SkHV8VD5BSkDmUwqh8FwkVdiCwoGsVBxVYUyPUJjVQG7qR5OA41bHr/OYP1IWVfZyG
 iljgh3VQfLdrQ==
Message-ID: <sashiko-outbox-229573@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] drm/i915/alpm: Leave AS SDP Transmission in
 Active Disable to PSR code
To: "Jake Steinman" <j@metarealtyinc.ca>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <7b1c4022b174d3806130f5814142760a8693e340.1795263689.git.j@metarealtyinc.ca>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
 <7b1c4022b174d3806130f5814142760a8693e340.1795263689.git.j@metarealtyinc.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:32:09 +0000
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

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/i915/alpm: stale AS SDP disable bit in
  intel_alpm_configure_pr_as_sdp()
- [Medium] drm/i915/alpm: broken AS SDP state on VRR toggle with
  periodic AS SDP
--

commit 37f90c53a8bab894fcb3ca18180ab5863311f8e3
Author: Jake Steinman <j@metarealtyinc.ca>

drm/i915/alpm: Leave AS SDP Transmission in Active Disable to PSR code

This commit changes intel_alpm_configure_pr_as_sdp() to preserve the current
hardware value of PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE instead
of setting it from crtc_state->disable_as_sdp_when_pr_active.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 910067d271c3c..6f2beb4a4c7c0 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -467,8 +467,12 @@ static void intel_alpm_configure_pr_as_sdp(struct in=
tel_dp *intel_dp,
>  	} else {
>  		pr_alpm_ctl &=3D ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
> =20
> -		if (crtc_state->disable_as_sdp_when_pr_active)
> -			pr_alpm_ctl |=3D PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> +		/*
> +		 * AS SDP Transmission in Active Disable follows frame updates
> +		 * and is owned by PSR code, keep its current value.
> +		 */
> +		pr_alpm_ctl |=3D intel_de_read(display, PR_ALPM_CTL(display, cpu_trans=
coder)) &
> +			PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
> =20
>  		if (intel_display_power_dc3co_allowed(display))
>  			pr_alpm_ctl |=3D PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;

[Severity: Medium]
Can PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE remain stuck set when
a transcoder is later configured with skip_frames =3D=3D 0 and
!crtc_state->disable_as_sdp_when_pr_active?

Neither intel_psr_disable_locked() nor intel_alpm_disable() clears this bit
in PR_ALPM_CTL, and intel_psr_enable_locked() only writes it when
intel_dp->psr.disable_as_sdp_when_pr_active is true:

drivers/gpu/drm/i915/display/intel_psr.c:intel_psr_enable_locked() {
	...
	if (intel_dp->psr.disable_as_sdp_when_pr_active)
		intel_alpm_pr_as_sdp_in_active_disable(intel_dp, intel_dp->psr.transcoder,
						       true);
	...
}

Once a Panel Replay session sets the bit, switching to a configuration where
disable_as_sdp_when_pr_active is false (such as disabling Panel Replay and
enabling AUX-less LOBF via intel_alpm_lobf_enable(), or modesetting to a
mode where compute_disable_as_sdp_when_pr_active() is false) will preserve
the stale bit in PR_ALPM_CTL and keep Adaptive-Sync SDP transmission
disabled in active states with no path clearing it.

[Severity: Medium]
What happens on a seamless VRR toggle via intel_alpm_pr_as_sdp_update() when
periodic AS SDP (skip_frames > 0) is used?

When VRR is off and skip_frames > 0, the if (skip_frames) branch clears
PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE in PR_ALPM_CTL, and
compute_disable_as_sdp_when_pr_active() returns false.  If Panel Replay was
enabled while VRR was off, intel_dp->psr.disable_as_sdp_when_pr_active (only
latched in intel_psr_enable_locked()) is also false.  When VRR is later
enabled seamlessly (skip_frames =3D=3D 0), reading PR_ALPM_CTL here reads b=
ack 0
and PSR frontbuffer flush/idle tracking ignores AS SDP because
intel_dp->psr.disable_as_sdp_when_pr_active is still false, leaving AS SDP
transmission in PR Active permanently enabled while idle and blocking
DC5/DC6.

Conversely, if Panel Replay is enabled with VRR on
(intel_dp->psr.disable_as_sdp_when_pr_active =3D=3D true) and VRR is seamle=
ssly
disabled (skip_frames > 0), intel_dp->psr.disable_as_sdp_when_pr_active
remains true and intel_psr_pr_as_sdp_suspend_work() can subsequently set
PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE while non-zero skip_frames
is programmed, violating their mutual exclusion.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795263689.gi=
t.j@metarealtyinc.ca?part=3D3
