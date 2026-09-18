Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A55C982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 06:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6889410F19F;
	Fri, 18 Sep 2026 06:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fnyIe6FZ";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75A310F19F;
 Fri, 18 Sep 2026 06:46:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 98E7F40816;
 Fri, 18 Sep 2026 06:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 464C71F000FF;
 Fri, 18 Sep 2026 06:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789714015;
 bh=Iz8GPUsC6vyaeQ9A9E3t8NGOsigHUmOBfRpi63ETWRY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=fnyIe6FZ0Jeklc7g84jGZWzPQecd+jPjse48TjzCfB685wtChJcX8pn4O30jftqqj
 H8y+RNB8mIoz6VzCu9bMmO5e6AgLJQakcHfKYtc2x8GlYk0qRxYj3xWKLH0pc+Bh4K
 qNlgcOraFLVc+dxutZ+VG3o0IxglAjodNmv/F1dRwuDJV+XvQg9Zyv0/byiX1T79wj
 yGrqQAnRmPk5gt5Zu8TTL4Ei/og2c3bSoq42jzwBWX9iIYyj5RBlZdPBwq7Z6c+kqJ
 FkutpCn9w1rbtFhK9x42nE8BWqqqOEwc+2iMtGsL00AhsHW0On3A5kcS1ZOmOsM7pV
 57wcM45CmOwLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260918063829.1321703-1-suraj.kandpal@intel.com>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
 <20260918063829.1321703-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 06:46:54 +0000
Message-Id: <20260918064655.464C71F000FF@smtp.kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] drm/i915/dp: incorrect power sequencing for DC_OFF and AUX domains
--

commit f07687ba1d41d832937531ae2d822e56d80de373
Author: Suraj Kandpal <suraj.kandpal@intel.com>

drm/i915/dp: Disable DC5/6 before AUX programming

This commit introduces explicit disabling of DC5/6 states during the
AUX programming sequence on Xe3p and later platforms with LT PHY. The
change aims to honor the hardware Bspec which requires the PHY to be
powered down before AUX programming.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/dr=
m/i915/display/intel_dp_aux.c
> index 3cb07b0a901cf..879b203f92585 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
[ ... ]
> @@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
> =20
>  	aux_wakeref =3D intel_display_power_get(display, aux_domain);
> =20
> +	if (HAS_LT_PHY(display))
> +		dc_off_wakeref =3D intel_display_power_get(display, POWER_DOMAIN_DC_OF=
F);
> +

[Severity: High]
The commit message states we need to make sure DC5/6 is disabled before
the AUX programming sequence. However, does this sequence actually power
on the AUX domain before disabling the DC states?

By calling intel_display_power_get() for aux_domain before grabbing the
POWER_DOMAIN_DC_OFF wakeref, we seem to be violating the hardware
requirement to disable DC5/6 first. Could this regression cause AUX
programming failures or display bring-up issues on platforms with LT PHY?

[ ... ]
> @@ -459,6 +463,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	if (pps_wakeref)
>  		intel_pps_unlock(intel_dp, pps_wakeref);
> =20
> +	if (dc_off_wakeref)
> +		intel_display_power_put(display, POWER_DOMAIN_DC_OFF, dc_off_wakeref);
> +
>  	intel_display_power_put_async(display, aux_domain, aux_wakeref);
>  out_unlock:
>  	intel_digital_port_unlock(encoder);

[Severity: High]
Does this regression cause rapid hardware toggling during back-to-back
AUX transactions?

The aux_domain wakeref is released asynchronously right after this via
intel_display_power_put_async(), which usually prevents rapid toggling
between transfers. But because dc_off_wakeref is released synchronously
first, it appears we allow DC states to re-enable while the AUX domain
is still powered.=20

Should the POWER_DOMAIN_DC_OFF wakeref also be released asynchronously,
or at least released after the AUX domain is fully powered down?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918063829.1321=
703-1-suraj.kandpal@intel.com?part=3D1
