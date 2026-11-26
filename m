Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF0C606A326
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 07:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkz5wVfu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1206710FFFE;
	Thu, 26 Nov 2026 07:06:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580110FFFE;
 Thu, 26 Nov 2026 07:06:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 90DA4611C6;
 Thu, 26 Nov 2026 07:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A821F000C0;
 Thu, 26 Nov 2026 07:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795676766;
 bh=Rq+JXzU6hYCM9M8ydH10hGJhgeSXMvMez2joqxIHbIQ=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=nkz5wVfugC5eOgFHZsCxC1Gs4M9lit0Q7EzUwSpp4w+uQZwhU80vzHap0WC8KfZ7n
 PSgG1/Effri67bzmGtIbDCeYNpaJbkAaexRMauDHAOeS3qzj6jnSsf6OHlTNsu2C40
 0HxZJOEjrLK33mKYpgGCdNC03heyzIr3rpCyBTyWCzR0AkGPSI04z2LT1sJAB1rsKf
 Sm/CAnXCAVQN91adlnTULhu3IxgOQxu3ABKnpZ51JpnF6JvgyQ62tPI63f9RCHvwe/
 sA/bFmpfay6koTF7V8yNlciaPZq76MY0VqXCL/ej20BZvsTObMYwL84vwwGzy1Oz35
 jnOnNil9Ire8w==
Message-ID: <sashiko-outbox-234928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/15] drm/i915/dp: Apply link training fallback to the
 whole tile group
To: "Suraj Kandpal" <suraj.kandpal@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261126063459.863698-13-suraj.kandpal@intel.com>
References: <20261126063459.863698-1-suraj.kandpal@intel.com>
 <20261126063459.863698-13-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:06:05 +0000
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
- [Medium] drm/i915/dp: unsynchronized peer link_caps access in
  intel_dp_tile_group_fallback()
--

commit 68cc58bbaafcfb065f2593125e09f6bebc6846cc
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/dp: Apply link training fallback to the whole tile group

This commit applies the reduced link limits of a pipelock-capable tiled
connector that fails link training to the other connectors in its tile
group.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/driv=
ers/gpu/drm/i915/display/intel_dp_link_training.c
> index ac1aff6edf052..d19f8d9b2c604 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
[ ... ]
> @@ -1976,6 +1977,37 @@ int intel_dp_get_link_train_fallback_values(struct=
 intel_dp *intel_dp,
>  	return err;
>  }
> =20
> +static void intel_dp_tile_group_fallback(struct intel_dp *intel_dp)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +	struct intel_connector *connector =3D intel_dp->attached_connector;
> +	struct intel_dp_link_config max_link_limits;
> +	struct drm_connector_list_iter conn_iter;
> +	struct intel_connector *iter;
> +
> +	if (!intel_pipelock_connector_possible(connector))
> +		return;
> +
> +	intel_dp_link_caps_get_max_limits(intel_dp->link.caps, &max_link_limits=
);
> +
> +	drm_connector_list_iter_begin(display->drm, &conn_iter);
> +	for_each_intel_connector_iter(iter, &conn_iter) {
> +		struct intel_dp *iter_dp;
> +
> +		if (iter =3D=3D connector || !intel_pipelock_connector_possible(iter) =
||
> +		    iter->base.tile_group !=3D connector->base.tile_group)
> +			continue;
> +
> +		iter_dp =3D intel_attached_dp(iter);
> +
> +		if (!intel_dp_link_caps_set_max_limits(iter_dp->link.caps, &max_link_l=
imits))
> +			drm_dbg_kms(display->drm,
> +				    "[CONNECTOR:%d:%s] Can't limit link to match tile group\n",
> +				    iter->base.base.id, iter->base.name);
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +}

[Severity: Medium]
Can walking the device-wide connector list here race with concurrent
updates to iter_dp->link.caps on a sibling connector?

intel_dp_tile_group_fallback() runs during the atomic commit tail, which
executes asynchronously on display->wq.modeset for nonblocking commits
without holding mode_config.connection_mutex.  Other paths that modify a
connector's link.caps hold connection_mutex and serialize against
in-flight commits by calling intel_dp_flush_connector_commits(), which
waits only on that connector's conn_state->commit->hw_done:

drivers/gpu/drm/i915/display/intel_dp.c:wait_for_connector_hw_done() {
	...
	if (!conn_state->commit)
		return;

	drm_WARN_ON(display->drm,
		    !wait_for_completion_timeout(&conn_state->commit->hw_done,
						 msecs_to_jiffies(5000)));
}

If a sibling connector iter was not added to the current
intel_atomic_state (for instance, when connector's pipe is added to a
modeset after drm_atomic_helper_check_modeset()),
drm_atomic_helper_setup_commit() does not bind iter->base.state->commit to
this commit.  A concurrent hotplug or probe on iter then returns from
intel_dp_flush_connector_commits(iter) without waiting for this commit
tail to finish:

CPU0 (display->wq.modeset)        CPU1 (probe / hotplug on iter)
intel_atomic_commit_tail(state)
  ...
  intel_dp_tile_group_fallback()
                                  lock(&connection_mutex)
                                  intel_dp_detect(iter)
                                    intel_dp_flush_connector_commits(iter)
                                      /* iter->base.state->commit
                                       * is not this commit */
                                    intel_dp_link_caps_update(iter_dp->...)
                                      sort_r(link_caps->configs, ...)
    intel_dp_link_caps_set_max_limits(
      iter_dp->link.caps, ...)
      max_link_limits_valid()  <-- data race on configs[] / rate_lane_map[]

Iterating over the connectors in the current intel_atomic_state (passed
down from intel_dp_schedule_fallback_link_training()) would restrict this
update to connectors whose conn_state->commit is bound to the running
commit.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126063459.8636=
98-1-suraj.kandpal@intel.com?part=3D12
