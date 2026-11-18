Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127C606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 02:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K2LvKhCc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C7810E13F;
	Wed, 18 Nov 2026 02:01:53 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3233A10E5BE
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 02:01:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 52BC761D32;
 Wed, 18 Nov 2026 02:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8231F000C4;
 Wed, 18 Nov 2026 02:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794967306;
 bh=saNsCkhdjUE8Vkdy3ht/eyPmyDlNSOfHWDfAaElvV0k=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=K2LvKhCcnC4w4eZPuVIP/rv/ovfHGzbyxQTj6wVQjPYwBNcpczwXZ1DCfsZkzz6mz
 cLQPoDhTgH2ZPPTCaZP/sU43iJucS+VarebjxtbadNdxNMMDC49fZPIsIqjRvtaWl3
 HoE3JBbRZc2tAqX/6YvS0OuNwPmKXW/3lurNi0ruSVkaVPZwwN5Qqx+v9TEPZ7dhj1
 vyHeFNqaPudwSVB52GcWgfTstQE/i4enZwRpCFzlydGkRvf3OhuLiFqLzLKwHLmK1v
 ge2oscyWasJk0Bccq1l5KIea4Q88L0JVYIcVgVxZk7EZ+qkkhIOSI7UxXFL60ztcDu
 SX0m7Pl/LcxgQ==
Message-ID: <sashiko-outbox-219921@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] drm/xe: Disallow freq changes while mert cap is
 active
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118012453.626087-3-vinay.belgaumkar@intel.com>
References: <20261118012453.626087-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 02:01:45 +0000
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
- [Medium] drm/xe: mert_freq_cap_active left set if async gsc_upload()
  fails
--

commit 122f6e08f3dbfe345a69d449458dd10c810ca28c
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Disallow freq changes while mert cap is active

This commit adds a mert_freq_cap_active flag to defer user min/max GT
frequency changes while the Wa_22019338487 frequency cap is in force, and
applies any deferred requests when restoring stashed frequencies.

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
> =20
> @@ -1094,6 +1113,9 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *p=
c)
>  	if (!ret)
>  		ret =3D pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
> =20
> +	if (!ret)
> +		pc->mert_freq_cap_active =3D true;
> +
>  	return ret;
>  }

[Severity: Medium]
Can pc->mert_freq_cap_active remain stuck at true if asynchronous GSC
firmware upload fails?

During xe_device_probe(), xe_gt_sanitize_freq() is a no-op while gsc_work()
is still uploading the GSC firmware (status XE_UC_FIRMWARE_LOADABLE).  If
gsc_upload() subsequently fails, gsc_upload_and_init() returns early before
calling xe_gt_sanitize_freq(), and gsc_work() transitions the firmware to
XE_UC_FIRMWARE_LOAD_FAIL without restoring the stashed frequencies:

drivers/gpu/drm/xe/xe_gsc.c:gsc_upload_and_init() {
	...
	ret =3D gsc_upload(gsc);
	...
	if (ret)
		return ret;

	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);

	/* GSC load is done, restore expected GT frequencies */
	xe_gt_sanitize_freq(gt);
	...
}

drivers/gpu/drm/xe/xe_gsc.c:gsc_work() {
	...
	if (actions & GSC_ACTION_FW_LOAD) {
		ret =3D gsc_upload_and_init(gsc);
		if (ret && ret !=3D -EEXIST)
			xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
	...
}

Because xe_guc_pc_restore_stashed_freq() is never called on that error
path, pc->mert_freq_cap_active stays true and all subsequent sysfs writes
to min_freq and max_freq only update pc->user_requested_min and
pc->user_requested_max without sending the new limits to GuC, leaving GT
frequency locked at the cap.  Calling xe_gt_sanitize_freq(gt) in gsc_work()
after setting XE_UC_FIRMWARE_LOAD_FAIL would lift the cap on load failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118012453.6260=
87-3-vinay.belgaumkar@intel.com?part=3D1
