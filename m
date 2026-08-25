Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79E8C61DB6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A3010E91E;
	Tue, 25 Aug 2026 06:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WlsIkxqs";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C11110E91E;
 Tue, 25 Aug 2026 06:33:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id EAF404010D;
 Tue, 25 Aug 2026 06:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2FEC1F000E9;
 Tue, 25 Aug 2026 06:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787639629;
 bh=J+SvH/KbnWt70Jot08wXQjyjpsbyS2tgNWy+k2LIWF4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=WlsIkxqs1en+gMBb+mB0y76yGBANJgGSDCWJkmLgh4xYNKfUujnEllRbtFZY2iKa3
 si1hfyeWrFyda1F/VJfJncnpPKd5UzqcVoj390U4Hqvcb7/3OqkphL0EK01uTKii7n
 UzTJsg5Y0jJAKKpYThnB9f8XbrEe2nrTr6zbxJvHlOb8m/t5MYPJoHCVc1F7n0lwIA
 8QqTVUACC4cfqQCXzbQmmzArsYx7oyT1zLXRBZpUYrbOjch7k121V4ar0cQfonNjjY
 kGt7C4Ikl2D1AHqDV/Byv8Na6bel6QWqLMo+j3lxssF21tz9ueLb9gVE7mpO654ju7
 8QQS4qrLMD9UQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/15] drm/i915/alpm: Modify LFPS cycle count for DP
 ALPM
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-10-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-10-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:33:49 +0000
Message-Id: <20260825063349.A2FEC1F000E9@smtp.kernel.org>
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
- [Medium] Incorrect register bit mask selection for LFPS cycle count based=
 on connector type instead of hardware IP version.
--

--- Patch [9]: [PATCH v5 09/15] drm/i915/alpm: Modify LFPS cycle count for =
DP ALPM ---
commit f40607bd1107960e9e7fba56539c2f142247127f
Author: Animesh Manna <animesh.manna@intel.com>

drm/i915/alpm: Modify LFPS cycle count for DP ALPM
   =20
This commit modifies the display driver to set a minimum LFPS cycle
count of 16 for external DP on newer display IPs.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 98aa418a6ff77..890bf24885547 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
[ ... ]
> @@ -622,12 +635,21 @@ void intel_alpm_port_configure(struct intel_dp *int=
el_dp,
>  		return;
> =20
>  	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state)) {
> +		int lfps_cycle =3D get_lfps_cycle_count(crtc_state);
> +		u32 lfps_cycle_val;
> +
> +		if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
> +			lfps_cycle_val =3D PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT(lfps_cycle);
> +		else
> +			lfps_cycle_val =3D PORT_ALPM_LFPS_CTL_LFPS_CYCLE_COUNT_XE3LPD(lfps_cy=
cle);
                ^^^^

[Severity: Medium]
Does this code incorrectly conflate the sink type with the display IP versi=
on?

In intel_alpm_port_configure(), branching on the connector type
(INTEL_OUTPUT_EDP) rather than the hardware IP version causes eDP panels on
Xe3LPD to be programmed using the legacy 4-bit register mask instead of the
expanded 7-bit Xe3LPD mask.

While the current default value for eDP (10 cycles) happens to fit within t=
he
lower 4 bits, if the eDP LFPS cycle count is ever tuned to a value > 22, the
legacy 4-bit mask will truncate it and could corrupt the hardware configura=
tion.

Should this logic check the display version instead of the output type?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D9
