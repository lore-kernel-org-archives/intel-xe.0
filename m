Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173C3606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 06:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KRs06f9d
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE69310FF36;
	Thu, 26 Nov 2026 06:43:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F8110FED1;
 Thu, 26 Nov 2026 06:43:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7111D44DF8;
 Thu, 26 Nov 2026 06:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1AB1F000C0;
 Thu, 26 Nov 2026 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795675415;
 bh=TdS4tb+7ucbORVyPqEmYQ46gdISDNirRhWTQ/dwvWIQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=KRs06f9d7XNerA+qV+GvAfHaQ20lQdB8XIWoGTelG9yGEzkCeqcTy8cwwnbTT73cz
 ztpJr1NDoPudubLU5YxgwQLn0tbiRa+qHt6FLa79CEQRbCDYTf/Zos0tkqRrpUNvKO
 ausKdZrjoLF5wvzNwHXM/MDKT3raVy/kIpKdaM5Jv0/WXJUY/8bybr8pvaRWYK+HWG
 R0Klbquzn/iRSRtVDWi4eANjbKPhmko12a0cigRJXG1hDU+122ky91MmNCMpdFWOQV
 rZ3+lygM5d85yLoOGBXGIfRdzOCaF/aQNTFfIkbtyQJQB+bxEOQ9WFOk4RLD3y3DQi
 Q9qb3yCFv/lmw==
Message-ID: <sashiko-outbox-234887@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/15] drm/i915/display: Rename port sync master/slave
 to primary/secondary
To: "Suraj Kandpal" <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261126063459.863698-2-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-2-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 06:43:35 +0000
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

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] drm/i915/display: NULL pointer dereference in
  intel_dmc_disable_pipe() [1]
--

commit 334735c1efc642c8d8a8c52554a839cfe3685f38
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/display: Rename port sync master/slave to primary/secondary

This commit renames the transcoder port sync state fields and helper
functions from master/slave to primary/secondary to match BSpec
terminology.

> diff --git a/drivers/gpu/drm/i915/display/intel_modeset_setup.c b/drivers=
/gpu/drm/i915/display/intel_modeset_setup.c
> index 6aed881737705..4c594373829ba 100644
> --- a/drivers/gpu/drm/i915/display/intel_modeset_setup.c
> +++ b/drivers/gpu/drm/i915/display/intel_modeset_setup.c
[ ... ]
> @@ -263,34 +264,34 @@ static void intel_crtc_disable_noatomic(struct inte=
l_crtc *crtc,
>  {
>  	struct intel_display *display =3D to_intel_display(crtc);
>  	struct intel_crtc *temp_crtc;
> -	u16 portsync_master_mask;
> -	u16 portsync_slaves_mask;
> +	u16 portsync_primary_mask;
> +	u16 portsync_secondaries_mask;
>  	u16 joiner_secondaries_mask;
> =20
>  	/* TODO: Add support for MST */
> -	get_portsync_pipes(crtc, &portsync_master_mask, &portsync_slaves_mask);
> +	get_portsync_pipes(crtc, &portsync_primary_mask, &portsync_secondaries_=
mask);
>  	joiner_secondaries_mask =3D get_joiner_secondary_pipes(display,
> -							     portsync_master_mask |
> -							     portsync_slaves_mask);
> +							     portsync_primary_mask |
> +							     portsync_secondaries_mask);
> =20
>  	drm_WARN_ON(display->drm,
> -		    portsync_master_mask & portsync_slaves_mask ||
> -		    portsync_master_mask & joiner_secondaries_mask ||
> -		    portsync_slaves_mask & joiner_secondaries_mask);
> +		    portsync_primary_mask & portsync_secondaries_mask ||
> +		    portsync_primary_mask & joiner_secondaries_mask ||
> +		    portsync_secondaries_mask & joiner_secondaries_mask);
> =20
>  	for_each_intel_crtc_in_pipe_mask(display, temp_crtc, joiner_secondaries=
_mask)
>  		intel_crtc_disable_noatomic_begin(temp_crtc, ctx);

[Severity: High]
This problem wasn't introduced by this patch, but can calling
intel_crtc_disable_noatomic_begin() on each CRTC in
joiner_secondaries_mask cause a NULL pointer dereference in
intel_dmc_disable_pipe() [1]?

When intel_sanitize_crtc() disables an active joined CRTC during probe or
resume, intel_crtc_disable_noatomic_begin() only adds BIT(pipe) |
intel_crtc_joiner_secondary_pipes(crtc_state) to the temporary atomic
state, which omits the joiner primary pipe when called on a joiner
secondary CRTC.  Then display->modeset.funcs->crtc_disable() calls
hsw_crtc_disable(), where for_each_pipe_crtc_modeset_disable() iterates
over all pipes in old_crtc_state->joiner_pipes starting with the joiner
primary:

drivers/gpu/drm/i915/display/intel_display.c:hsw_crtc_disable() {
    ...
	for_each_pipe_crtc_modeset_disable(display, pipe_crtc, old_crtc_state) {
		const struct intel_crtc_state *old_pipe_crtc_state =3D
			intel_atomic_get_old_crtc_state(state, pipe_crtc);

		intel_dmc_disable_pipe(old_pipe_crtc_state);
	}
}

Because the joiner primary CRTC is not in state,
intel_atomic_get_old_crtc_state() returns NULL and
intel_dmc_disable_pipe() dereferences crtc_state->uapi.crtc.  Calling
hsw_crtc_disable() on the secondary CRTC also calls intel_dpll_disable()
before the primary CRTC's encoder and transcoder have been disabled.

[1] https://sashiko.dev/#/bug/linux-c6e57ac7-2e62-4987-9809-b5532eead653

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126063459.8636=
98-1-suraj.kandpal@intel.com?part=3D1
