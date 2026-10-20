Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F77606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EskI9rds
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCA610F380;
	Tue, 20 Oct 2026 08:12:56 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576E410EB9A;
 Tue, 20 Oct 2026 08:12:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2374844006;
 Tue, 20 Oct 2026 08:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7141F000C4;
 Tue, 20 Oct 2026 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792483970;
 bh=v/p0MBWRBE/jfZOQ+KmlVsJfoYoINrJfRe8raH5Cc1c=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=EskI9rdsgJpE1SUSEtsSjW6pWyrzGXAwhGFJqWYDL5rG7+RPoqW5Scw7CRMGEQ/2D
 FQr9kHo0qNW+0GJFUQzqQui4SKaise60CIQCVYro/GidhtQjkhREnUYz4mjE9bwLyt
 5oV5cMhN2mBauHfdqHD0RSp65RMuZczdzsaYO3h6gQncAUuXePcj1PkR2as/PIxF0G
 5Cbyefxt7wmmBMNuL6/7VJz/5ZWEitNAy2C/f8d3oO9hLHwd4s/a6Gq8Eohn2TkSrY
 3KFSGt260qd11E3sHe3ZNhxHNGYff7NCbvoQKy/jvwYTcDlO4WkgnPidBuSD3+THMH
 f3rVvhvejxICg==
Message-ID: <sashiko-outbox-178494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/i915/dp: clear and restore MSTM_CTRL around MST
 DPMS off/on
To: "Xiao Lu" <xiaolu.xie@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261020021714.62573-1-xiaolu.xie@intel.com>
References: <20261014081448.2320363-1-xiaolu.xie@intel.com>
 <20261020021714.62573-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:12:49 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/i915/dp: clearing MSTM_CTRL in intel_ddi_post_disable_dp() bre=
aks MST
- [Medium] drm/i915/dp: race between mst_stream_pre_enable() and DPCD state=
 verification
--

commit 04bc6df114f62ef11692debf152cd3af90ff9f8d
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/dp: clear and restore MSTM_CTRL around MST DPMS off/on

This patch clears DP_MST_EN and DP_UP_REQ_EN in DP_MSTM_CTRL before placing
the sink in D3 when the last MST stream is disabled, and restores them
after setting D0 when the first MST stream is re-enabled. It also teaches
intel_dp_mst_verify_dpcd_state() to accept DP_UPSTREAM_IS_SRC when no MST
streams are active so connector detection during DPMS off does not tear
down the MST topology.

> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index a46ab5d3d70fc..6b7665206837a 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3163,6 +3163,9 @@ static void intel_ddi_post_disable_dp(struct intel_=
atomic_state *state,
>  	 * Power down sink before disabling the port, otherwise we end
>  	 * up getting interrupts from the sink on detecting link loss.
>  	 */
> +	if (is_mst)
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_MSTM_CTRL,
> +				       DP_UPSTREAM_IS_SRC);
>  	intel_dp_set_power(intel_dp, DP_SET_POWER_D3);
> =20
>  	if (DISPLAY_VER(display) >=3D 12) {

[Severity: High]
Does clearing DP_MST_EN and DP_UP_REQ_EN in intel_ddi_post_disable_dp()
break downstream MST hotplug detection and sideband transactions whenever
all MST streams are disabled?

When the last active MST stream is disabled via mst_stream_post_disable() ->
intel_ddi_post_disable_dp(), DP_MSTM_CTRL is written with
DP_UPSTREAM_IS_SRC while intel_dp->is_mst and intel_dp->mst.mgr.mst_state
remain true. DP_MSTM_CTRL is only restored in mst_stream_pre_enable() when
enabling a stream.

Per the DisplayPort specification for MSTM_CTRL, clearing DP_UP_REQ_EN and
DP_MST_EN stops the branch device from generating UP_REQ sideband messages
such as CONNECTION_STATUS_NOTIFY when downstream sinks are plugged in or
unplugged.

If the last connected downstream monitor on an MST hub is unplugged and
userspace disables its CRTC (dropping intel_dp->mst.active_streams to 0),
and a monitor is later plugged into the hub:

1. The branch device cannot send a CONNECTION_STATUS_NOTIFY UP_REQ because
   DP_UP_REQ_EN and DP_MST_EN are cleared.

2. Even if an HPD pulse or manual probe runs intel_dp_detect() on the root
   connector, intel_dp_mst_verify_dpcd_state() now returns true when
   val =3D=3D DP_UPSTREAM_IS_SRC and intel_dp_mst_active_streams(intel_dp) =
=3D=3D 0,
   and intel_dp_mst_configure() -> drm_dp_mst_topology_mgr_set_mst() is a
   no-op because mgr->mst_state is already true.

3. mst_connector_detect_ctx() -> drm_dp_mst_detect_port() only checks the
   cached port->ddps (which stays 0), and because mst_stream_pre_enable()
   is only called when enabling a stream on a connected connector,
   DP_MSTM_CTRL is never restored.

Similarly, if a downstream monitor is plugged or unplugged during DPMS off,
waking an existing stream in mst_stream_pre_enable() calls
intel_mst_reprobe_topology():

drivers/gpu/drm/i915/display/intel_dp_mst.c:intel_mst_reprobe_topology() {
	if (intel_mst_probed_link_params_valid(intel_dp,
					       crtc_state->port_clock, crtc_state->lane_count))
		return;

	drm_dp_mst_topology_queue_probe(&intel_dp->mst.mgr);
}

When link parameters are unchanged, this returns early without reprobing the
topology, so hotplug events missed while DP_UP_REQ_EN was cleared are not
recovered.

In addition, while active_streams =3D=3D 0 and mgr->mst_state =3D=3D true,
host-initiated sideband DOWN_REQ transactions remain reachable without
enabling a stream, such as mst_connector_get_modes() ->
mst_connector_get_ddc_modes() -> drm_dp_mst_edid_read() (which sends
REMOTE_I2C_READ), drm_dp_mst_link_probe_work(), and userspace AUX/I2C dev
nodes. With DP_MST_EN cleared in DP_MSTM_CTRL, won't the hub ignore
sideband DOWN_REQ messages and cause drm_dp_mst_wait_tx_reply() to fail or
time out?

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 7023619aaaba9..da3cf7493118d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1270,8 +1270,12 @@ static void mst_stream_pre_enable(struct intel_ato=
mic_state *state,
>  	drm_WARN_ON(display->drm, DISPLAY_VER(display) >=3D 12 && first_mst_str=
eam &&
>  		    !intel_dp_mst_is_master_trans(pipe_config));
> =20
> -	if (first_mst_stream)
> +	if (first_mst_stream) {
>  		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
> +		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_MSTM_CTRL,
> +				       DP_MST_EN | DP_UP_REQ_EN |
> +				       DP_UPSTREAM_IS_SRC);
> +	}
> =20
>  	drm_dp_send_power_updown_phy(&intel_dp->mst.mgr, connector->mst.port, t=
rue);
> =20
> @@ -2254,6 +2258,14 @@ bool intel_dp_mst_verify_dpcd_state(struct intel_d=
p *intel_dp)
> =20
>  	ret =3D drm_dp_dpcd_read_byte(intel_dp->mst.mgr.aux, DP_MSTM_CTRL, &val=
);
> =20
> +	/*
> +	 * MST mode is disabled while all MST streams are disabled, keeping
> +	 * UPSTREAM_IS_SRC set to tell this apart from a DPCD reset.
> +	 */
> +	if (ret =3D=3D 0 && val =3D=3D DP_UPSTREAM_IS_SRC &&
> +	    intel_dp_mst_active_streams(intel_dp) =3D=3D 0)
> +		return true;
> +
>  	/* Adjust the expected register value for SST + SideBand. */
>  	if (ret < 0 || val !=3D (DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC)=
) {
>  		drm_dbg_kms(display->drm,

[Severity: Medium]
Can intel_dp_mst_verify_dpcd_state() race with mst_stream_pre_enable()
during a non-blocking atomic modeset and falsely tear down the MST topology?

In mst_stream_pre_enable(), intel_dp_mst_inc_active_streams(intel_dp)
increments intel_dp->mst.active_streams from 0 to 1 before calling
intel_dp_set_power(intel_dp, DP_SET_POWER_D0) (which performs AUX writes and
msleep(1) retries) and before restoring DP_MSTM_CTRL to
DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC:

drivers/gpu/drm/i915/display/intel_dp_mst.c:mst_stream_pre_enable() {
	...
	first_mst_stream =3D intel_dp_mst_inc_active_streams(intel_dp);
	drm_WARN_ON(display->drm, DISPLAY_VER(display) >=3D 12 && first_mst_stream=
 &&
		    !intel_dp_mst_is_master_trans(pipe_config));

	if (first_mst_stream) {
		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
		drm_dp_dpcd_write_byte(&intel_dp->aux, DP_MSTM_CTRL,
				       DP_MST_EN | DP_UP_REQ_EN |
				       DP_UPSTREAM_IS_SRC);
	}
	...
}

When a non-blocking atomic commit (DRM_MODE_ATOMIC_NONBLOCK) re-enables the
first MST stream on display->wq.modeset, mode_config.connection_mutex is
not held while commit_work runs. If intel_dp_detect() runs concurrently on
intel_dp->attached_connector (via hotplug work, output poll, or
DRM_IOCTL_MODE_GETCONNECTOR), intel_dp_flush_connector_commits(connector)
only waits on intel_dp->attached_connector->base.state->commit, which is not
set for child MST connector commits.

If intel_dp_mst_verify_dpcd_state() runs after active_streams is incremented
to 1 (or reads DP_MSTM_CTRL just before mst_stream_pre_enable() writes it
and increments active_streams), it will see val =3D=3D DP_UPSTREAM_IS_SRC w=
hile
intel_dp_mst_active_streams(intel_dp) =3D=3D 1, return false, and cause
intel_dp_detect() to call intel_dp_mst_disconnect() in the middle of the
modeset enable sequence.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020021714.6257=
3-1-xiaolu.xie@intel.com?part=3D1
