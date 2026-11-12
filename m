Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E95606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 22:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vetc9dXg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE0F10E54B;
	Thu, 12 Nov 2026 22:52:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845FF10E69A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 22:52:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3881B4565D;
 Thu, 12 Nov 2026 22:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11761F000C4;
 Thu, 12 Nov 2026 22:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794523927;
 bh=oxwhbASRSvg75hUNIpdpbmI331yMp1Y9cAL7V9WJ3ns=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Vetc9dXgXKeDE4BR5RJKsO1R9VPKbJ1/G/i29e9l4Opyid6wcomOUyswo2Ay6uMuN
 KgZml1j9gD7ImJJMsSfA/m0Ep57NXDQ/1CEDbwloNwNzShavw5Li3WGCiPaXfqs9bK
 K0TWuCrBRjYhT40+Nc6NXaTgutPyBKZBcGSwocFGLb1Dj9FU6ejsi1R5/OGJKIqTOx
 FOonzQVnt9DHCaHOKSqx/veLJ+dM8whbABFEfENC+uFN1ZoJu/HGCt3NeSBea4Q2hh
 0aSUixR1LqEAlFBy67oasM91eW02sEDu0dRS46Vcy1Ks28ke9igKYHZX0bzWph5XXN
 IYXv9tN2lX/hw==
Message-ID: <sashiko-outbox-211924@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe: Add sysfs to disable RPe
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261112222159.3862116-2-vinay.belgaumkar@intel.com>
References: <20261112222159.3862116-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 22:52:06 +0000
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
- [High] drm/xe/guc_pc: pc_set_mert_freq_cap() stashes RPe and pins
  min_freq to RPe
- [Medium] drm/xe: race in xe_guc_pc_set_use_rpe() with
  pc_set_mert_freq_cap()
- [Low] drm/xe/guc_pc: repeated RPe MMIO reads in pc_set_mert_freq_cap()
--

commit 7e119245b60ecad85ca2f154bc2f98a7b90fc53a
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Add sysfs to disable RPe

This commit adds a use_rpe sysfs attribute to toggle SLPC efficient
frequency usage independently of min_freq requests.

> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 9558d7196a51a..1404df21c00a8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c

[ ... ]

> @@ -1072,6 +1080,7 @@ void xe_guc_pc_remove_flush_freq_limit(struct xe_gu=
c_pc *pc)
>  static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  {
>  	int ret;
> +	u32 mert_freq_cap;
> =20
>  	if (!XE_GT_WA(pc_to_gt(pc), 22019338487))
>  		return 0;
> @@ -1090,6 +1099,14 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *=
pc)
>  	/*
>  	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>  	 */
> +	mert_freq_cap =3D min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc));
> +	if (mert_freq_cap < xe_guc_pc_get_rpe_freq(pc) && pc->use_rpe) {
> +		/* Temporarily let GuC drop min below RPe so the cap can be applied. */
> +		ret =3D pc_set_ignore_eff_freq(pc, 1);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq=
_cap(pc)));
>  	if (!ret)
>  		ret =3D pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));

[Severity: Low]
Why call xe_guc_pc_get_rpe_freq(pc) three times here instead of reading it
once and passing mert_freq_cap to pc_set_min_freq()?

Each call reads the live RPe register from MMIO, which PCODE updates
dynamically at runtime.  If RPe rises above pc_max_freq_cap() between the
first two reads or while the cap is active, pc_set_ignore_eff_freq(pc, 1)
is skipped and GuC can still raise the minimum frequency to RPe above the
Wa_22019338487 cap.

> @@ -1113,6 +1130,11 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_p=
c *pc)
> =20
>  	mutex_lock(&pc->freq_lock);
>  	ret =3D pc_set_max_freq(pc, pc->stashed_max_freq);
> +
> +	/* Undo any temporary ignore_eff_freq override from pc_set_mert_freq_ca=
p(). */
> +	if (!ret)
> +		ret =3D pc_set_ignore_eff_freq(pc, !pc->use_rpe);
> +
>  	if (!ret)
>  		ret =3D pc_set_min_freq(pc, pc->stashed_min_freq);
>  	mutex_unlock(&pc->freq_lock);

[Severity: High]
Does pc_set_mert_freq_cap() -> xe_guc_pc_restore_stashed_freq() overwrite
the underlying minimum frequency with RPe on platforms with
Wa_22019338487?

In xe_guc_pc_start(), pc_set_ignore_eff_freq(pc, 0) runs before
pc_set_mert_freq_cap().  With ignore_eff_freq disabled, GuC elevates the
minimum frequency reported by xe_guc_pc_get_min_freq_locked() to RPe, so
pc->stashed_min_freq records RPe instead of RPn or a lower
pc->user_requested_min.

When xe_guc_pc_restore_stashed_freq() later calls pc_set_min_freq(pc,
pc->stashed_min_freq), it explicitly sets
SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ in GuC to that stashed RPe
value.  Writing 0 to use_rpe after probe, GSC load, or a GT reset only
toggles SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, leaving min_freq pinned at
RPe.

> @@ -1166,6 +1188,28 @@ static int pc_action_set_strategy(struct xe_guc_pc=
 *pc, u32 val)
>  	return ret;
>  }
> =20
> +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val)
> +{
> +	int ret;
> +
> +	guard(mutex)(&pc->freq_lock);
> +
> +	/* Might be in the middle of a gt reset */
> +	if (!pc->freq_ready)
> +		return -EAGAIN;
> +
> +	/**
> +	 * If use_rpe =3D=3D 1, ignore_eff_freq =3D false. GuC elevates min_fre=
q to
> +	 * RPe when enabled, and resets it back to the previously set min
> +	 * when disabled, so no explicit set_min_freq request is needed here.
> +	 */
> +	ret =3D pc_set_ignore_eff_freq(pc, !val);
> +	if (!ret)
> +		pc->use_rpe =3D val;
> +
> +	return ret;
> +}

[Severity: Medium]
Can a sysfs write to use_rpe clear the temporary ignore_eff_freq override
while the Wa_22019338487 MERT frequency cap is still active?

CPU0                                    CPU1 (sysfs / udev)
xe_guc_pc_start()
  pc_init_freqs()
    mutex_lock(&pc->freq_lock)
    pc->freq_ready =3D true
    mutex_unlock(&pc->freq_lock)
  pc_set_mert_freq_cap()
    mutex_lock(&pc->freq_lock)
    pc_set_ignore_eff_freq(pc, 1)
    pc_set_min_freq(pc, mert_freq_cap)
    pc_set_max_freq(pc, mert_freq_cap)
    mutex_unlock(&pc->freq_lock)
                                        use_rpe_store(..., "1", ...)
                                          xe_guc_pc_set_use_rpe(pc, 1)
                                            mutex_lock(&pc->freq_lock)
                                            pc_set_ignore_eff_freq(pc, 0)
                                              <-- elevates min to RPe > cap
                                            mutex_unlock(&pc->freq_lock)
...
gsc_upload_and_init()
  xe_gt_sanitize_freq()
    xe_guc_pc_restore_stashed_freq()

pc_init_freqs() sets pc->freq_ready =3D true and drops pc->freq_lock before
pc_set_mert_freq_cap() applies the cap, and on platforms with GSC firmware
(such as Lunar Lake media GT) xe_guc_pc_restore_stashed_freq() does not
run until asynchronous GSC upload completes.  If userspace writes 1 to
use_rpe during that window (or during a GT reset/resume before
xe_gt_sanitize_freq()), xe_guc_pc_set_use_rpe() immediately sends
SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY=3D0 to GuC, raising the minimum
frequency back to RPe and bypassing the Wa_22019338487 cap.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112222159.3862=
116-2-vinay.belgaumkar@intel.com?part=3D1
