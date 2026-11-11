Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8CF606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EeK6txf7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4DD10F520;
	Wed, 11 Nov 2026 08:10:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F58710F520;
 Wed, 11 Nov 2026 08:10:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D4BD63B7E;
 Wed, 11 Nov 2026 08:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BEE1F00A05;
 Wed, 11 Nov 2026 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794384649;
 bh=2UghwKsGh4ulv2Lmnl+8Te8DsneOxR7oOh5OPnm0UHw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=EeK6txf7PkeGp+k+KV6Wy1k/qIZJwz2w4ETR2qPgc/uX6krxT9JCNreFbxVxTFwT9
 AGioy7esJeorywIWxfY9oBsyWDwx6JnUyuonAPxMRWNclCaQ6kOw9agClgunLZnTTe
 tFah3NLFmJ043vyReJkTZ7Uw4Up0D/6RTLCqd+t1Kr0SW52nqHHPzlpIHohx4T2QCU
 mnnVFHRFPoI3zGb8ykPBLmyP3pNKd/H+8rfid/QGGIbhL7s+Ix0LiGj9ch6tD/rWWd
 LNX7LUVqRK7uUBGbYLvVqDRDY/Ho/HjSNsQFgXrQomKOL0HZqTu16pEZuEeNX0CvtI
 AKzi9AIU9Ewvg==
Message-ID: <sashiko-outbox-208576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drm/i915/display: avoid logging DC3CO transitions
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261111075105.2166760-5-dibin.moolakadan.subrahmanian@intel.com>
References: <20261111075105.2166760-4-dibin.moolakadan.subrahmanian@intel.com>
 <20261111075105.2166760-5-dibin.moolakadan.subrahmanian@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:10:48 +0000
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
- [Low] drm/i915/display: per-frame DC3CO entry log left in
  xe3lpd_enable_dc3co()
--

commit 168565af43c727ae42413d9678ac0afa5023d467
Author: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.=
com>

drm/i915/display: avoid logging DC3CO transitions

This commit suppresses per-frame DC3CO transition debug messages in
gen9_set_dc_state() and logs DC3CO trigger changes in
intel_display_power_dc3co_update().

> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/dr=
ivers/gpu/drm/i915/display/intel_display_power_well.c
> index 233465a8306ec..6d07643fc14fa 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
> @@ -862,8 +862,18 @@ void gen9_set_dc_state(struct intel_display *display=
, u32 state)
> =20
>  	val =3D intel_de_read(display, DC_STATE_EN);
>  	mask =3D gen9_dc_mask(display);
> -	drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n",
> -		    val & mask, state);
> +
> +	/*
> +	 * DC3co is entered and exited once per frame while PSR2 or panel
> +	 * replay is active, so logging both transitions floods the log. The
> +	 * exit additionally happens from intel_display_power_get(DC_OFF) in
> +	 * the atomic commit path, before the flip has been armed, where the
> +	 * printk is a measurable part of the time budget. Skip both.
> +	 */
> +	if ((val & mask) !=3D DC_STATE_EN_UPTO_DC3CO &&
> +	    state !=3D DC_STATE_EN_UPTO_DC3CO)
> +		drm_dbg_kms(display->drm, "Setting DC state from %02x to %02x\n",
> +			    val & mask, state);

[Severity: Low]
Should the drm_dbg_kms() call in xe3lpd_enable_dc3co() also be removed?

xe3lpd_enable_dc3co() is the sole caller passing DC_STATE_EN_UPTO_DC3CO to
gen9_set_dc_state(), and it still logs "Enabling DC3CO" on every frame
when entering DC3CO:

drivers/gpu/drm/i915/display/intel_display_power_well.c:xe3lpd_enable_dc3co=
() {
	assert_can_enable_dc3co(display);
	drm_dbg_kms(display->drm, "Enabling DC3CO\n");
	intel_dmc_wl_enable(display, DC_STATE_EN_UPTO_DC3CO);
	gen9_set_dc_state(display, DC_STATE_EN_UPTO_DC3CO);
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111075105.2166=
760-4-dibin.moolakadan.subrahmanian@intel.com?part=3D1
