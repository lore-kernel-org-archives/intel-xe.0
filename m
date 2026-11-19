Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C691606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 22:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CeoaHwhD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0661010E6D2;
	Thu, 19 Nov 2026 22:50:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A226010E82C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 22:50:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8DFBB60D29;
 Thu, 19 Nov 2026 22:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A601F000C0;
 Thu, 19 Nov 2026 22:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795128640;
 bh=D4N3buEhF/JU+FdhTZz6dzvcofTkAXs0RYlaOSt8/iY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=CeoaHwhDLg2avlvOpqQb7zqYmw6v7icgt9qhG4Vl+c/HWWQPF9AomuYFztRX2/nsf
 4n36RLbd1WxCE59+f7rBnfWUw65VEYPg8Ah+InAYeVbLV1XYbTD8MLDTmWbpPI+eAV
 PTMwyW6HQCDujZlRFp1SsQ9Z1saZ2iTmrEUuEnXLzeviCx2p4l1uvN9FVYFYPjR43L
 RL0PYNFzTBhaaHwR3kqU/2VaTg9LMoLjaAbP0zIzU7poPhr2QUoD13bKdLwxsH2/Me
 w6hOVW1+OabmZlYvGlpx/43BwmHUTYT6WNDdThjVm39iedscPmOu7S4bfEzXLReKCI
 TEVzeb+VG141g==
Message-ID: <sashiko-outbox-224160@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] drm/xe: Add sysfs to disable RPe
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261119222958.1239889-4-vinay.belgaumkar@intel.com>
References: <20261119222958.1239889-3-vinay.belgaumkar@intel.com>
 <20261119222958.1239889-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:50:39 +0000
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
- [Medium] drm/xe: unlocked pc_set_ignore_eff_freq() call in
  xe_guc_pc_start()
--

commit 92347c09642635b15512f302b19f351ec5e6cc4f
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Add sysfs to disable RPe

This commit adds a per-GT use_rpe sysfs attribute to control SLPC
efficient frequency behavior independently of min_freq and disables RPe
before querying min_freq during frequency bounds setup and MERT frequency
capping.

> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index ea47b0ded83a4..0f98e8e48c577 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c

[ ... ]

> @@ -1192,6 +1224,31 @@ static int pc_action_set_strategy(struct xe_guc_pc=
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
> +	if (!pc->mert_freq_cap_active) {
> +		/*
> +		 * If use_rpe =3D=3D 1, ignore_eff_freq =3D false. GuC elevates min_fr=
eq to
> +		 * RPe when enabled, and resets it back to the previously set min
> +		 * when disabled, so no explicit set_min_freq request is needed here.
> +		 */
> +		ret =3D pc_set_ignore_eff_freq(pc, !val);
> +	}
> +
> +	if (!ret)
> +		pc->use_rpe =3D val;
> +
> +	return ret;
> +}
> +
>  static const char *power_profile_to_string(struct xe_guc_pc *pc)
>  {
>  	switch (pc->power_profile) {
> @@ -1344,6 +1401,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D pc_set_ignore_eff_freq(pc, !pc->use_rpe);
> +	if (unlikely(ret))
> +		return ret;
> +
>  	ret =3D pc_set_mert_freq_cap(pc);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Can calling pc_set_ignore_eff_freq(pc, !pc->use_rpe) outside pc->freq_lock
after pc_init_freqs() has already set pc->freq_ready =3D true race with
sysfs accesses?

Inside pc_init_freqs(), pc_adjust_freq_bounds() forces ignore_eff_freq to
1 under pc->freq_lock, and pc_init_freqs() then sets pc->freq_ready =3D true
and unlocks pc->freq_lock before pc->use_rpe is applied here:

CPU0                              CPU1
xe_guc_pc_start()
  pc_init_freqs()
    mutex_lock(&pc->freq_lock)
    pc_adjust_freq_bounds()
      pc_set_ignore_eff_freq(pc, 1)
    ...
    pc->freq_ready =3D true
    mutex_unlock(&pc->freq_lock)
  !pc->use_rpe (reads old value)
                                  use_rpe_store()
                                    xe_guc_pc_set_use_rpe()
                                      mutex_lock(&pc->freq_lock)
                                      pc_set_ignore_eff_freq(pc, !val)
                                      pc->use_rpe =3D val
                                      mutex_unlock(&pc->freq_lock)
  pc_set_ignore_eff_freq(pc, old) <-- overwrites GuC state with stale value

This leaves SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY in GuC out of sync with
pc->use_rpe.

In that same window between pc_init_freqs() dropping pc->freq_lock and
pc_set_ignore_eff_freq(pc, !pc->use_rpe) completing, a concurrent
min_freq_show() sees pc->freq_ready =3D=3D true while ignore_eff_freq is st=
ill
1 from pc_adjust_freq_bounds() and reports the un-elevated min_freq even
when pc->use_rpe is true.  Also, if pc_set_ignore_eff_freq() or
pc_set_mert_freq_cap() fails here, xe_guc_pc_start() returns an error with
pc->freq_ready left set to true, and on Wa_22019338487 platforms this
briefly re-enables RPe right before pc_set_mert_freq_cap() disables it
again.

Could pc_set_ignore_eff_freq(pc, !pc->use_rpe) be moved inside
pc_init_freqs() under pc->freq_lock before pc->freq_ready is set (or
skipped when pc_set_mert_freq_cap() will keep RPe disabled)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119222958.1239=
889-3-vinay.belgaumkar@intel.com?part=3D2
