Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB9E606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 12:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fCsoQJtN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3866C10F642;
	Tue, 10 Nov 2026 12:14:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD8A10F641;
 Tue, 10 Nov 2026 12:14:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CAB96638CF;
 Tue, 10 Nov 2026 12:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E0A1F008A2;
 Tue, 10 Nov 2026 12:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794312851;
 bh=G3C/1UyHpacjXntTkhBBWlF+5hfJWEfoPjsp+mD/PKw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=fCsoQJtNY6fPgjedMVxxU7dvyFz8WbW/gcMjWvbqmPzHrNWvfO6VQi2tSvNw9zE3N
 UtTaIPgD6VVy8M5pn1QzSlQEWyi7CUx8bSwwQyArYGMrPU4lAVdmiQsHkOnZqPtKyO
 eoNKgCk0G4aT5XJd/eTj5dee0rdVTzOSHclk36w1yIVneH+lsNcOxNeAF05TvIJjFa
 Dyi48KJRbjB38SrQa7uamKqhNJ/XC3gn+OLOTn0XH2lhyZ1E7FPxAamSeR/W4yqxrp
 0rKweZayF8dI2lvWso3UEqq5+FCJ2w4C/LGipqlM6eNl7EZAXba5589cEnJf1uD2Er
 SRK15Pjhkwfqw==
Message-ID: <sashiko-outbox-206989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] drm/i915/dp: Start eDP link training from VBT fast
 link train vswing/pre-emphasis levels
To: "Lee Shawn C" <shawn.c.lee@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110115432.894616-4-shawn.c.lee@intel.com>
References: <20261110115432.894616-1-shawn.c.lee@intel.com>
 <20261110115432.894616-4-shawn.c.lee@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:14:10 +0000
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
- [Medium] drm/i915/dp: intel_dp_link_training_clock_recovery() assumes
  initial level 0
--

commit 6c36eea023572273fb066c2544c30e572e659dc6
Author: Lee Shawn C <shawn.c.lee@intel.com>

drm/i915/dp: Start eDP link training from VBT fast link train vswing/pre-em=
phasis levels

This commit initializes intel_dp->train_set from the VBT fast link
training voltage swing and pre-emphasis levels at the start of eDP clock
recovery when link recovery is idle.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/driv=
ers/gpu/drm/i915/display/intel_dp_link_training.c
> index ac1aff6edf052..3de74eb1d3d4a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
[ ... ]
> @@ -1032,6 +1104,10 @@ intel_dp_reset_link_train(struct intel_dp *intel_d=
p,
>  			  u8 dp_train_pat)
>  {
>  	memset(intel_dp->train_set, 0, sizeof(intel_dp->train_set));
> +
> +	if (intel_dp_use_vbt_fast_link_levels(intel_dp, crtc_state, dp_phy))
> +		intel_dp_init_train_set_from_vbt(intel_dp, crtc_state, dp_phy);
> +
>  	intel_dp_set_signal_levels(intel_dp, crtc_state, dp_phy);
>  	return intel_dp_set_link_train(intel_dp, crtc_state, dp_phy, dp_train_p=
at);
>  }

[Severity: Medium]
Does starting intel_dp_reset_link_train() at non-zero VBT levels throw off
the retry and max-vswing tracking in
intel_dp_link_training_clock_recovery()?

drivers/gpu/drm/i915/display/intel_dp_link_training.c:intel_dp_link_trainin=
g_clock_recovery() {
	u8 old_link_status[DP_LINK_STATUS_SIZE] =3D {};
	int voltage_tries, cr_tries, max_cr_tries;
	u8 link_status[DP_LINK_STATUS_SIZE];
	bool max_vswing_reached =3D false;
    ...
	if (!intel_dp_reset_link_train(intel_dp, crtc_state, dp_phy,
				       DP_TRAINING_PATTERN_1 |
				       DP_LINK_SCRAMBLING_DISABLE)) {
    ...
	voltage_tries =3D 1;
	for (cr_tries =3D 0; cr_tries < max_cr_tries; ++cr_tries) {
    ...
		if (max_vswing_reached) {
			intel_dp_dump_link_status(intel_dp, dp_phy, link_status);
			lt_dbg(intel_dp, dp_phy, "Max Voltage Swing reached\n");
			return false;
		}
    ...
		if (!intel_dp_adjust_request_changed(crtc_state, old_link_status, link_st=
atus))
			++voltage_tries;
		else
			voltage_tries =3D 1;

		memcpy(old_link_status, link_status, sizeof(link_status));

		if (intel_dp_link_max_vswing_reached(intel_dp, crtc_state))
			max_vswing_reached =3D true;
	}
}

old_link_status starts zero-initialized, representing voltage swing 0 and
pre-emphasis 0.  When intel_dp_reset_link_train() programs non-zero VBT
levels and the first poll does not lock, intel_dp_adjust_request_changed()
compares the sink's first adjust request against (0, 0) instead of the VBT
levels: if the sink requests the same VBT levels, voltage_tries is reset
to 1 instead of incrementing to 2 (trying those levels 6 times instead of
5), whereas if the sink requests (0, 0), voltage_tries increments to 2 on
the first attempt at (0, 0) (aborting after 4 tries instead of 5).

Also, max_vswing_reached is initialized to false before
intel_dp_reset_link_train(), so if the initial VBT levels already hit the
maximum voltage swing, the first loop iteration does not notice that max
vswing was already reached.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110115432.8946=
16-1-shawn.c.lee@intel.com?part=3D3
