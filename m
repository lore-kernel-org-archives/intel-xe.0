Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8645A606A31D
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 17:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jylU01br
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC7310E300;
	Fri, 30 Oct 2026 17:39:06 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E033B10E300;
 Fri, 30 Oct 2026 17:38:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C666760202;
 Fri, 30 Oct 2026 17:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579BE1F00A16;
 Fri, 30 Oct 2026 17:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793381938;
 bh=813Ymywf9xufPsi6X0p/XUL4nE18WjEcDJPHB6vfHtg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jylU01brzN3v1zLYwnjxkMolZgQFrCxtae2geCD0ERdmvpFFGW2AvA//D1K+ZZS8G
 V7MF0bEHaObruxTgq68WTRknMGfT5/lo51gg6ls/O+EGXx0ThZK65GVj2jJmGyohps
 qRX/+DcpIX92wN9r8+oHXUSwi34Icms6GbeQ7QVd1r2VnQ77Sd4jcbxXjAqiaF2/9a
 26rtdjLeTjvEIRpNplaxdjzzHVwP1YoF0VxNCEqubBE0KGromdA++iFpxw+k9JOLiJ
 9m6wR/2UX8NW1CsrIyULLBrZ9gTBudlbh9d4hjDn8F4MdjiTmCvgo7O28bNm/gouL2
 bPNTqnvi9N8EA==
Message-ID: <sashiko-outbox-191352@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] drm/i915: Allow joiner with port sync
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261030171327.29829-11-ville.syrjala@linux.intel.com>
References: <20261030171327.29829-1-ville.syrjala@linux.intel.com>
 <20261030171327.29829-11-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:38:58 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/i915: port sync dropped when joiner secondary CRTC triggers mo=
deset
--

commit e8591be1b66ac026c8025978e792560a0337567b
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915: Allow joiner with port sync

This commit removes the check preventing pipes using joiner from entering
port sync mode now that modeset enable and disable sequences iterate in
pipe/transcoder order.

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index 2e7f278a1b6c6..3be5b429ac876 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4675,14 +4675,8 @@ static bool m_n_equal(const struct intel_link_m_n =
*m_n_1,
>  static bool crtcs_port_sync_compatible(const struct intel_crtc_state *cr=
tc_state1,
>  				       const struct intel_crtc_state *crtc_state2)
>  {
> -	/*
> -	 * FIXME the modeset sequence is currently wrong and
> -	 * can't deal with joiner + port sync at the same time.
> -	 *
> -	 * TODO VRR + port sync needs special handling
> -	 */
> +	/* TODO VRR + port sync needs special handling */
>  	return crtc_state1->hw.active && crtc_state2->hw.active &&
> -		!crtc_state1->joiner_pipes && !crtc_state2->joiner_pipes &&

[Severity: High]
Can allowing joiner with port sync here cause port sync to be dropped when =
an
atomic commit triggers a modeset via a joiner secondary CRTC?

In drivers/gpu/drm/i915/display/intel_display.c:intel_atomic_check(),
drm_atomic_helper_check_modeset() runs connector atomic_check callbacks
before intel_atomic_check_config_and_link() pulls in joined CRTCs:

	ret =3D drm_atomic_helper_check_modeset(dev, &state->base);
	if (ret)
		goto fail;
	...
	ret =3D intel_atomic_check_config_and_link(state);

Suppose a joined CRTC pair (primary Pipe A and secondary Pipe B) is active =
in
port sync mode with a peer CRTC (Pipe C). If userspace submits an atomic
commit targeting the joiner secondary CRTC (Pipe B, which has uapi.enable =
=3D=3D
false and no uapi connectors) that sets uapi.mode_changed =3D true in
intel_atomic_check() (for example by changing scaling_filter,
sharpness_strength, or vrr_enabled, or clearing inherited on the first
userspace commit), drm_atomic_helper_check_modeset() runs while neither Pipe
A nor its connector is in the atomic state.

Later, intel_atomic_check_config_and_link() -> intel_atomic_check_config() =
->
intel_joiner_add_affected_crtcs() adds Pipe A, sets Pipe A's
uapi.mode_changed =3D true, and adds Pipe A's connector:

	for_each_intel_crtc_in_pipe_mask(display, crtc, modeset_pipes) {
		int ret;

		crtc_state =3D intel_atomic_get_new_crtc_state(state, crtc);

		crtc_state->uapi.mode_changed =3D true;

		ret =3D drm_atomic_add_affected_connectors(&state->base, &crtc->base);

Because drm_atomic_helper_check_modeset() has already finished,
intel_dp_connector_atomic_check() -> intel_modeset_tile_group() and
intel_modeset_synced_crtcs() never run for Pipe A's connector, so Pipe C and
its connector are never added to the atomic state.

When intel_modeset_pipe_config_late() -> intel_ddi_compute_config_late() ->
intel_ddi_port_sync_transcoders() subsequently iterates over connectors in
the atomic state:

	for_each_new_connector_in_state(&state->base, connector, conn_state, i) {
		struct intel_crtc *crtc =3D to_intel_crtc(conn_state->crtc);
		const struct intel_crtc_state *crtc_state;

it only sees Pipe A's connector, leaving master_transcoder =3D
INVALID_TRANSCODER and sync_mode_slaves_mask =3D 0 on Pipe A.

In intel_crtc_check_fastset(), intel_pipe_config_compare() then sees the
mismatch in master_transcoder or sync_mode_slaves_mask against old_crtc_sta=
te
and forces a full modeset on Pipe A and Pipe B without Pipe C in the commit.
If Pipe A was the port sync master, Pipe C's hardware transcoder remains
active and enslaved to TRANSCODER_A while TRANSCODER_A is disabled and
re-enabled, and bdw_get_trans_port_sync_config() during
intel_modeset_verify_crtc() reads back a non-zero sync_mode_slaves_mask,
triggering INTEL_DISPLAY_STATE_WARN in verify_crtc_state().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030171327.2982=
9-1-ville.syrjala@linux.intel.com?part=3D10
