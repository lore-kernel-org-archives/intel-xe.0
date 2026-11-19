Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A834606A326
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FA6TM0So
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6D610E00F;
	Thu, 19 Nov 2026 22:57:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D1110E00F
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 22:57:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0022446F85;
 Thu, 19 Nov 2026 22:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BC91F000C4;
 Thu, 19 Nov 2026 22:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795129048;
 bh=4mngfo4bd7fPiHZVMpBxCh3+6/y8ff8o/1+XwO2Vw30=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=FA6TM0SopQi6MqPRsNm7RZHBYiwA3Z/mV70ortIv5xjwTtQMzD2mENiH9uVHYPpvM
 MDMAzIsK1CoQE9KMkDo6cvI+BwGicrgWfD/b0T5V+7P6NVzZJ7IAyRq9jAS1qh2xd9
 j/2HFlNKRPBi2srnxofUC7FNRGFtby2VpKWucjGbAJf1042qMhrS+ANO+YPjyq1u8o
 pLf+QV+F3zjhUEd8/GFn++ir9XMUE3KhuIUDjnCA+2pPa6tCBMQyhCn7ypl6FB7Tr0
 T5/Hb6tmqS+dP8z86w6f8jaJ0u0ljVQqYfmhdBlEoV+4KbhapoJC/Aizu9gzg2fdpG
 3+7fCMxRnKokw==
Message-ID: <sashiko-outbox-224163@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] drm/xe: Disallow freq changes while mert cap is
 active
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261119222958.1239889-3-vinay.belgaumkar@intel.com>
References: <20261119222958.1239889-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:57:28 +0000
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
- [Medium] drm/xe: permanent mert cap lockout in
  xe_guc_pc_restore_stashed_freq()
- [Medium] drm/xe: stale MERT cap returned by
  xe_guc_pc_get_min/max_freq() when capped
--

commit 46a723833f6fec7f60471a2ef5a3e851858c10f2
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Disallow freq changes while mert cap is active

This commit tracks whether the Wa_22019338487 MERT frequency cap is active,
defers user min/max frequency requests until the cap is lifted, and ensures
frequencies are restored even if GSC firmware loading fails.

> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 9558d7196a51a..ea47b0ded83a4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
[ ... ]
> @@ -638,17 +639,26 @@ int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u3=
2 *freq)
> =20
>  static int xe_guc_pc_set_min_freq_locked(struct xe_guc_pc *pc, u32 freq)
>  {
> -	int ret;
> -
>  	lockdep_assert_held(&pc->freq_lock);
> =20
>  	/* Might be in the middle of a gt reset */
>  	if (!pc->freq_ready)
>  		return -EAGAIN;
> =20
> -	ret =3D pc_set_min_freq(pc, freq);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * While the Wa_22019338487 cap is active, defer applying the new min
> +	 * to GuC; xe_guc_pc_restore_stashed_freq() will apply it once the
> +	 * cap is removed.
> +	 */
> +	if (pc->mert_freq_cap_active) {
> +		if (!pc_freq_in_range(pc, freq))
> +			return -EINVAL;
> +	} else {
> +		int ret =3D pc_set_min_freq(pc, freq);
> +
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	pc->user_requested_min =3D freq;
> =20
> @@ -707,17 +717,26 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u3=
2 *freq)
> =20
>  static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
>  {
> -	int ret;
> -
>  	lockdep_assert_held(&pc->freq_lock);
> =20
>  	/* Might be in the middle of a gt reset */
>  	if (!pc->freq_ready)
>  		return -EAGAIN;
> =20
> -	ret =3D pc_set_max_freq(pc, freq);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * While the Wa_22019338487 cap is active, defer applying the new max
> +	 * to GuC; xe_guc_pc_restore_stashed_freq() will apply it once the
> +	 * cap is lifted.
> +	 */
> +	if (pc->mert_freq_cap_active) {
> +		if (!pc_freq_in_range(pc, freq))
> +			return -EINVAL;
> +	} else {
> +		int ret =3D pc_set_max_freq(pc, freq);
> +
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	pc->user_requested_max =3D freq;

[Severity: Medium]
Should xe_guc_pc_get_min_freq_locked() and xe_guc_pc_get_max_freq_locked()
return the deferred or stashed frequencies when pc->mert_freq_cap_active is
true?

Right now, both getters still query GuC SLPC directly and return the
temporary MERT cap (such as 800 MHz on Lunar Lake).  Aside from reading
back 800 MHz right after a sysfs write succeeds, if a userspace tool or
test reads min_freq and max_freq to save the initial limits while the cap
is active and writes those values back to restore them,
pc->user_requested_max becomes 800 MHz and
xe_guc_pc_restore_stashed_freq() will prefer it over pc->stashed_max_freq,
leaving the GT permanently capped.

[ ... ]

> @@ -1112,9 +1134,13 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_p=
c *pc)
>  		return 0;
> =20
>  	mutex_lock(&pc->freq_lock);
> -	ret =3D pc_set_max_freq(pc, pc->user_requested_max ?: pc->stashed_max_f=
req);
> +	/* Apply any user min/max request made while the cap was active, else t=
he stash. */
> +	ret =3D pc_set_max_freq(pc, pc->user_requested_max ?: pc->stashed_max_f=
req);
> +
> +	if (!ret)
> +		ret =3D pc_set_min_freq(pc, pc->user_requested_min ?: pc->stashed_min_=
freq);
>  	if (!ret)
> -		ret =3D pc_set_min_freq(pc, pc->stashed_min_freq);
> +		pc->mert_freq_cap_active =3D false;
>  	mutex_unlock(&pc->freq_lock);
> =20
>  	return ret;

[Severity: Medium]
Can a failure in pc_set_max_freq() or pc_set_min_freq() here leave
pc->mert_freq_cap_active stuck true forever?

All callers of xe_gt_sanitize_freq() ignore its return value without
retrying, so if either SLPC H2G request fails (for example if gsc_work()
races with a GT reset while pc->freq_ready is false), every future sysfs
write in xe_guc_pc_set_min_freq_locked() and
xe_guc_pc_set_max_freq_locked() will defer applying frequencies
indefinitely.

Also, since xe_guc_pc_restore_stashed_freq() does not check
pc->mert_freq_cap_active or pc->freq_ready before sending H2G requests,
redundant calls to xe_gt_sanitize_freq() (such as when xe_device_probe()
and gsc_work() both call it) will unconditionally re-send SLPC commands
even after the cap has already been lifted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119222958.1239=
889-3-vinay.belgaumkar@intel.com?part=3D1
