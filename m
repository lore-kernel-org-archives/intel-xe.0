Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16ED606A6A0
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 23:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9uCEe/6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8277011293E;
	Fri, 20 Nov 2026 23:04:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9959112D53
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 23:04:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A82FD42B8B;
 Fri, 20 Nov 2026 23:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D171F000CA;
 Fri, 20 Nov 2026 23:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795215882;
 bh=JsqXGhefxNj/sT/1b3EYszTe5niUf/xB14S+mfbLRTo=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=D9uCEe/6o5k5dKCwbeVw/QQUJCaAnztkW3JSrmv4bvW/nlLpRdi97Q0KYY8m1Rc1u
 fXNZnNR37U2NHGpz1xG9L9xu43+V2TmxdQySnKLJXgjaz+8V1pAeLzIz3s3vr35mTl
 OuxMqmX2TGY2eJiajpI9Y2pv3v9k+n4BJE5HhUzI/l+Ife3KVL8u5SmYCHRTXLAj47
 ptsYuk37fgQbaSr9Ahu4kc5IIjSZN5B2yQtNy1MHHpiEXXy0YCMZKKUG9QEW8GOYbU
 UZglR7Grv8DrwLPaEILPUP8830hWSxzonfdKv5scA4NzpR10oMfFA1tAu4cbF1pcEH
 nzfLwEwcjq16Q==
Message-ID: <sashiko-outbox-226330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] drm/xe: Add sysfs to disable RPe
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261120225325.1460380-4-vinay.belgaumkar@intel.com>
References: <20261120225325.1460380-3-vinay.belgaumkar@intel.com>
 <20261120225325.1460380-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 23:04:41 +0000
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
- [Medium] drm/xe: xe_guc_pc_get_min_freq_locked() ignores use_rpe
  during MERT cap
--

commit 88335a79a8611de6a26a511f88173660a4613fa6
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Add sysfs to disable RPe

This commit adds a use_rpe sysfs attribute to control SLPC efficient
frequency elevation and disables RPe before stashing the minimum frequency
in pc_set_mert_freq_cap().

> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 7cbdb7985843d..2d4ae5bb48761 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c

[ ... ]

> @@ -1103,12 +1120,23 @@ void xe_guc_pc_remove_flush_freq_limit(struct xe_=
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

[Severity: Medium]
Does xe_guc_pc_get_min_freq_locked() report the un-elevated minimum
frequency instead of RPe while pc->mert_freq_cap_active and pc->use_rpe are
both true?

Because pc_set_mert_freq_cap() now disables RPe before querying
pc->stashed_min_freq, and pc_set_min_freq() no longer disables RPe when a
frequency below RPe is requested, both pc->stashed_min_freq and
pc->user_requested_min can be below RPe while pc->use_rpe is true.  During
the MERT cap window, xe_guc_pc_get_min_freq_locked() returns that raw
value:

drivers/gpu/drm/xe/xe_guc_pc.c:xe_guc_pc_get_min_freq_locked() {
    ...
	/* In the middle of a temporary freq cap, return stashed value */
	if (XE_GT_WA(pc_to_gt(pc), 22019338487) && pc->mert_freq_cap_active) {
		*freq =3D pc->user_requested_min ?: pc->stashed_min_freq;
		return 0;
	}
    ...
}

Reading min_freq via sysfs while the cap is active therefore returns the
un-elevated minimum (such as RPn) and then jumps back up to RPe once
xe_guc_pc_restore_stashed_freq() restores ignore_eff_freq and clears
pc->mert_freq_cap_active.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120225325.1460=
380-3-vinay.belgaumkar@intel.com?part=3D2
