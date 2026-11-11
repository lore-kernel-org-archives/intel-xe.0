Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1AE606A327
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 21:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLUIuEjk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B0D10E3D0;
	Wed, 11 Nov 2026 21:58:04 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDED910E3D0
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 21:57:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9400D62D4C;
 Wed, 11 Nov 2026 21:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EAE1F00A06;
 Wed, 11 Nov 2026 21:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794434277;
 bh=f+0NcLWx/xTR763Zy/hih8raOYA3Tl6J36sFdqw7yeI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WLUIuEjkNG3rrtKTQwqfqSkF57PCyX4JZJ/Z8wphwtSmAnY9BjM4X0eKQelQGNRmv
 ottb6zRA0xiEGspLUKrIA6Jq79Lygk3eSy2Xm4qfOi2ocarOIIgPC6rhZhX4k0FXQv
 FNA32WpGybWnJxo8z1RYuWVtBYwgbJc1HVgrf6Wx0bV8Qfyq5AZvStme5AbJVhIrNx
 Xdeiw9wPubeBa5Lof4Yh7jq+KEQKoPT+HuBYYEIQWDwJqzt4D81v129+k3iFNgFjYE
 uRJxN/CpmLoW5/VHt8++DCGtcjQnOtrPcHSaH5RlsAbs5Jq5xYmb35WdsWb3aGnpmG
 uN/Qj+j2E1KVQ==
Message-ID: <sashiko-outbox-209728@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe: Add sysfs to disable RPe
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261111212150.3738637-2-vinay.belgaumkar@intel.com>
References: <20261111212150.3738637-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 21:57:56 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] drm/xe/guc_pc: pc_set_min_freq() breaks Wa_22019338487 and pins
  min_freq to RPe
- [Medium] drm/xe/guc_pc: race and missing freq_ready check in
  xe_guc_pc_set_use_rpe()
- [Low] drm/xe/guc_pc: xe_guc_pc_set_use_rpe() logs inverted value !val
  on error
--

commit 64d4db3f839aa54f062c511fa3457dc84a1c5dbf
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Add sysfs to disable RPe

This commit adds a per-GT use_rpe sysfs attribute to control
SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY directly and removes the automatic
SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY update from pc_set_min_freq().

> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 9558d7196a51a..8f7044b49e135 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c

[ ... ]

> @@ -353,13 +368,6 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32=
 freq)
>  	if (freq < pc->rpn_freq || freq > pc->rp0_freq)
>  		return -EINVAL;
> =20
> -	/*
> -	 * GuC policy is to elevate minimum frequency to the efficient levels
> -	 * Our goal is to have the admin choices respected.
> -	 */
> -	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < xe_guc_pc_get_rpe_freq(pc));
> -
>  	return pc_action_set_param(pc,
>  				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>  				   freq);
> @@ -1166,6 +1174,26 @@ static int pc_action_set_strategy(struct xe_guc_pc=
 *pc, u32 val)

[Severity: High]
Does removing SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY from pc_set_min_freq()
break Wa_22019338487 in pc_set_mert_freq_cap() and leave min_freq pinned
at RPe after xe_guc_pc_restore_stashed_freq()?

drivers/gpu/drm/xe/xe_guc_pc.c:pc_set_mert_freq_cap() {
	...
	ret =3D xe_guc_pc_get_min_freq_locked(pc, &pc->stashed_min_freq);
	if (!ret)
		ret =3D xe_guc_pc_get_max_freq_locked(pc, &pc->stashed_max_freq);
	if (ret)
		return ret;

	/*
	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
	 */
	ret =3D pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_ca=
p(pc)));
	...
}

When pc->use_rpe is true, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY is 0, so
pc_set_min_freq() can no longer lower the minimum frequency to
pc_max_freq_cap(pc) when RPe > pc_max_freq_cap(pc) during driver load, GSC
load, or GT reset.

In addition, xe_guc_pc_get_min_freq_locked() reads the RPe-elevated
minimum frequency from GuC into pc->stashed_min_freq, and
xe_gt_sanitize_freq() -> xe_guc_pc_restore_stashed_freq() then explicitly
programs SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ to RPe.  Because
xe_guc_pc_set_use_rpe() only toggles SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
later writing 0 to use_rpe will not drop min_freq back to RPn or
pc->user_requested_min.

>  	return ret;
>  }
> =20
> +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val)
> +{
> +	int ret;
> +
> +	guard(mutex)(&pc->freq_lock);
> +
> +	/* If use_rpe =3D=3D 1, ignore_eff_freq =3D false */
> +	ret =3D pc_set_ignore_eff_freq(pc, !val);
> +	if (ret) {
> +		xe_gt_err_once(pc_to_gt(pc),
> +			       "Failed to set use_rpe to %d: %pe\n",
> +			       !val, ERR_PTR(ret));
> +		return ret;
> +	}

[Severity: Low]
Does this error message log !val (the inverted ignore_eff_freq value)
instead of val (the requested use_rpe value), while duplicating the
xe_gt_err_once() already logged inside pc_set_ignore_eff_freq()?

> +
> +	pc->use_rpe =3D val;
> +
> +	return ret;
> +}
> +
>  static const char *power_profile_to_string(struct xe_guc_pc *pc)
>  {
>  	switch (pc->power_profile) {
> @@ -1314,6 +1342,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D pc_set_ignore_eff_freq(pc, !pc->use_rpe);
> +	if (unlikely(ret))
> +		return ret;
> +
>  	ret =3D pc_init_freqs(pc);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Can xe_guc_pc_set_use_rpe() race with GT reset and xe_guc_pc_start()
because xe_guc_pc_set_use_rpe() does not check pc->freq_ready and
xe_guc_pc_start() updates SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY outside
pc->freq_lock?

CPU0                              CPU1
xe_guc_pc_start()
  !pc->use_rpe (reads 0)
                                  use_rpe_store()
                                    xe_guc_pc_set_use_rpe(pc, 0)
                                      mutex_lock(&pc->freq_lock)
                                      pc_set_ignore_eff_freq(pc, 1)
                                      pc->use_rpe =3D 0
                                      mutex_unlock(&pc->freq_lock)
  pc_set_ignore_eff_freq(pc, 0)
    <-- overwrites GuC state with stale value
  pc_init_freqs()
    mutex_lock(&pc->freq_lock)
    pc->freq_ready =3D true
    mutex_unlock(&pc->freq_lock)

Unlike xe_guc_pc_set_min_freq() and xe_guc_pc_set_max_freq(),
xe_guc_pc_set_use_rpe() also does not check pc->freq_ready under
pc->freq_lock, so a sysfs write after xe_guc_pc_stop() can send an H2G
request while GuC PC is stopped instead of returning -EAGAIN.  Checking
pc->freq_ready in xe_guc_pc_set_use_rpe() and moving
pc_set_ignore_eff_freq() inside pc_init_freqs() under pc->freq_lock would
avoid both issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111212150.3738=
637-2-vinay.belgaumkar@intel.com?part=3D1
