Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939F1606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GjX3MSu6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C23C10FB23;
	Wed, 11 Nov 2026 11:26:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E331B10FB23;
 Wed, 11 Nov 2026 11:26:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 12D3B60A57;
 Wed, 11 Nov 2026 11:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9489A1F00A06;
 Wed, 11 Nov 2026 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794396403;
 bh=4pU+s3obW7WyBfg3QIES7eAZ6k6Mwq8CML/OXcKe5bk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=GjX3MSu6ItaJ24nQnmS13jxiWQyHUZWsNfjSjH0/mNFBIA6OWFZJTWdC9SmKDT+Kx
 SbLzVsWMygMTthUOP4i6RU9BO33LHsOjq+S9BTrackSh+b2LhQJkOR4szhSI7vA5a9
 dZpdSO3oJo6KwkN3QB44ibgEranJtVNNKpOAjDQai5wMeCXUEpAYs0aEx+46Qfrhxw
 WaqZLPczVejOsGIB7ipp5+iE+aopb5PFTaybbu5kwPbT1xDX369EfpCLhZUTzI7VDm
 abVpDUWIl5vYQvCx8zDFHjfGoNFtSbQLxQw6Iz+r2a3g8TFpb7/QTJcN9ulPXhxAOj
 C3POFKEBE82Bw==
Message-ID: <sashiko-outbox-208874@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/ltphy: Fix the HDMI PLL setup for a DCO below
 11.85 GHz
To: "Xiao Lu" <xiaolu.xie@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261111111218.23625-1-xiaolu.xie@intel.com>
References: <20261111111218.23625-1-xiaolu.xie@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:26:43 +0000
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

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] drm/i915/display: stack info leak in
  intel_lt_phy_pll_verify_params() [1]
--

commit 9dffcca944ff63de33d8799f124267caa2f452f4
Author: Xiao Lu <xiaolu.xie@intel.com>

drm/i915/ltphy: Fix the HDMI PLL setup for a DCO below 11.85 GHz

This commit updates calculate_target_dco_and_loop_cnt() to return the lower
limit of the matched DCO range and compares the target DCO against that
limit in intel_lt_phy_calculate_hdmi_state().

> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/dr=
m/i915/display/intel_lt_phy.c
> index 86492651b01d5..a6374b07aeac5 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c

[ ... ]

> @@ -1548,7 +1550,9 @@ intel_lt_phy_calculate_hdmi_state(struct intel_lt_p=
hy_pll_state *lt_state,
>  		(ndiv << 9) + (1 << 4);
>  	p.bias_trim.val =3D (csel2fo_ovrd_en << 30) + (csel2fo << 24);
>  	p.ssc_inj.val =3D 0;
> -	found =3D calculate_target_dco_and_loop_cnt(frequency_khz, &target_dco_=
mhz, &loop_cnt);
> +	/* dco_fmin becomes the lower limit of the DCO range the solution is in=
 */
> +	found =3D calculate_target_dco_and_loop_cnt(frequency_khz, &target_dco_=
mhz, &loop_cnt,
> +						  &dco_fmin);
>  	if (!found)
>  		return -EINVAL;

[Severity: Medium]
This problem wasn't introduced by this patch, but can
intel_lt_phy_calculate_hdmi_state() leave parts of lt_state uninitialized
[1]?

intel_lt_phy_calculate_hdmi_state() does not write lt_state->config[2],
ssc_enabled, tbt_mode, or lane_count.  intel_lt_phy_pll_verify_params()
passes an uninitialized stack pll_state to it, and if a state mismatch
occurs, intel_lt_phy_pll_verify_clock() -> intel_lt_phy_dump_hw_state()
prints those uninitialized stack fields to dmesg.

[1] https://sashiko.dev/#/bug/linux-548b8df6-aa56-451e-bde9-6adc09def6f8

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111111218.2362=
5-1-xiaolu.xie@intel.com?part=3D1
