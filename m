Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C17B606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 01:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENUo73mu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A43C10E5BE;
	Wed, 18 Nov 2026 01:50:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968AB10E5BE
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 01:50:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 87C9060D2F;
 Wed, 18 Nov 2026 01:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C011F000C4;
 Wed, 18 Nov 2026 01:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794966618;
 bh=a8wGSWuEJmoyokpdvrJwu+x4VTAS13Eqq5sCJ1hJd/c=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=ENUo73muOhZQCc1hSqOMTBAJUsAx6vRd+X90bLRIaBr5JHEFNq3dj3z4sYiXAJWuE
 zIPbh1zzGq1PP2tJa9bNwJGR3PvRpUAHXVXPiFsY50pNMV8zymkmVT/jEfh3Xd0OHb
 qgLCaKWg1YECSx6AE5aA1aWIZ6KjTzJUyzdOraqqXWtv7JvC2narTAFrTKeHL0cfsb
 JCnLSumeJq31gS+PpDxoCigpv/4p6Mj03jIhxCuECjdS5BoKGV3TAQl0np6iNJxl4a
 ee+LoHidbS4OzCFyPfRVcRhSX4FMa13E0Rd/QKllTK95KNcwyzc6XAIJnrjE7CEWxg
 RSOwx4LhRBdeQ==
Message-ID: <sashiko-outbox-219913@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] drm/xe: Add sysfs to disable RPe
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118012453.626087-4-vinay.belgaumkar@intel.com>
References: <20261118012453.626087-3-vinay.belgaumkar@intel.com>
 <20261118012453.626087-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 01:50:17 +0000
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
- [Medium] drm/xe/guc_pc: BMG_MIN_FREQ floor skipped in
  pc_adjust_freq_bounds()
- [Low] drm/xe: inverted ignore_eff_freq comment in
  xe_guc_pc_set_use_rpe()
--

commit 2fd6d49cd723e98d7b71d44470ecf548dc1dcd33
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Add sysfs to disable RPe

This commit adds a use_rpe sysfs attribute to control SLPC efficient
frequency behavior and decouples SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY from
pc_set_min_freq().

> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index ea47b0ded83a4..5ff3df99464b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
[ ... ]
> @@ -1091,12 +1099,23 @@ void xe_guc_pc_remove_flush_freq_limit(struct xe_=
guc_pc *pc)
>  static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  {
>  	int ret;
> +	u32 mert_freq_cap;
> =20
>  	if (!XE_GT_WA(pc_to_gt(pc), 22019338487))
>  		return 0;
> =20
>  	guard(mutex)(&pc->freq_lock);
> =20
> +	/*
> +	 * Disable the RPe floor so the min queried below reflects the real
> +	 * underlying minimum (RPn or user_requested_min) instead of a value
> +	 * GuC may have elevated to RPe. This stays disabled until
> +	 * xe_guc_pc_restore_stashed_freq() reinstates it.
> +	 */
> +	ret =3D pc_set_ignore_eff_freq(pc, 1);
> +	if (ret)
> +		return ret;
> +
>  	/*
>  	 * Get updated min/max and stash them.
>  	 */
[ ... ]
> @@ -1192,6 +1215,36 @@ static int pc_action_set_strategy(struct xe_guc_pc=
 *pc, u32 val)
>  	return ret;
>  }
> =20
> +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val)
> +{
> +	int ret =3D 0;
> +
> +	guard(mutex)(&pc->freq_lock);
> +
> +	/* Might be in the middle of a gt reset */
> +	if (!pc->freq_ready)
> +		return -EAGAIN;
> +
> +	/*
> +	 * While the Wa_22019338487 cap is active, ignore_eff_freq must stay
> +	 * forced off. xe_guc_pc_restore_stashed_freq() will apply this value
> +	 * once the cap is lifted.
> +	 */
> +	if (!pc->mert_freq_cap_active) {
> +		/**
> +		 * If use_rpe =3D=3D 1, ignore_eff_freq =3D false. GuC elevates min_fr=
eq to
> +		 * RPe when enabled, and resets it back to the previously set min
> +		 * when disabled, so no explicit set_min_freq request is needed here.
> +		 */
> +		ret =3D pc_set_ignore_eff_freq(pc, !val);
> +	}

[Severity: Low]
This isn't a bug, but pc_set_mert_freq_cap() forces ignore_eff_freq on (1)
to keep the RPe floor disabled, whereas the first comment says
ignore_eff_freq must stay forced off.  Also, the inner comment uses a /**
kernel-doc marker instead of /*.

[ ... ]
> @@ -1340,6 +1393,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
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
Does calling pc_set_ignore_eff_freq(pc, !pc->use_rpe) before pc_init_freqs()
cause pc_adjust_freq_bounds() to skip the BMG_MIN_FREQ floor when RPe is at
or above BMG_MIN_FREQ?

With pc->use_rpe defaulting to true, RPe is enabled when pc_init_freqs() ->
pc_adjust_freq_bounds() queries GuC:

drivers/gpu/drm/xe/xe_guc_pc.c:pc_adjust_freq_bounds() {
	...
	min_freq =3D pc_get_min_freq(pc);
	...
	if (pc_needs_min_freq_change(pc) && min_freq < BMG_MIN_FREQ)
		ret =3D pc_set_min_freq(pc, BMG_MIN_FREQ);
}

Whenever RPe >=3D BMG_MIN_FREQ (1200 MHz), min_freq < BMG_MIN_FREQ is false,
so pc_set_min_freq(pc, BMG_MIN_FREQ) is not called and GuC's underlying
minimum remains at RPn.  On BMG, pc_set_mert_freq_cap() then immediately
disables RPe and stashes RPn into pc->stashed_min_freq, which
xe_guc_pc_restore_stashed_freq() writes back as the global min frequency.
If the user later disables use_rpe or PCODE lowers RPe below 1200 MHz, the
minimum frequency drops to RPn instead of respecting the 1200 MHz floor
required on BMG (Wa_14022085890) and CRI.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118012453.6260=
87-3-vinay.belgaumkar@intel.com?part=3D2
