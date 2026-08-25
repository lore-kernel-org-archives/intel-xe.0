Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E535CC5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 07:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CF510E907;
	Tue, 25 Aug 2026 07:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MK1+9ibU";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED8510E907;
 Tue, 25 Aug 2026 07:44:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 11B1E436BE;
 Tue, 25 Aug 2026 07:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47721F000E9;
 Tue, 25 Aug 2026 07:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787643883;
 bh=UOuDlr0KT2FIAJ4/nBUOHpIn1bQJjCNS57DtvOyUtsQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=MK1+9ibUFKJWVwxboK65Lkk7ea+2ZX32GJj0Bt4uZCd2wCBV812fZzxzXgAvuR+Dq
 MAyIp9CGaMeGcBZ9DE49Co2+0NvtoNnXQwq6hF1Bj+L4iGZmDg43A9jJYaN0KFmLKY
 T2sXgh7xncbm1vDA3XyB5bbZRuCuWcZWedf0rW0xd7BWd2S85l/gDrI+veff41Der2
 sfGQjO/X/MKYVPWTLQHzqE9r2O64USrQH+ujQjg7Ds62rZoOUsNU3ziOr25PSAceov
 JnHitpBy2yBCElDxB1CIruE0ewj1oDJxsYL5goP5dzBOPHNneJxy+yoD6bNSg+Em8b
 mufhb6HTmkHgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/15] drm/i915/alpm: alpm_init() for DP2.1
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-4-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-4-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 07:44:42 +0000
Message-Id: <20260825074442.B47721F000E9@smtp.kernel.org>
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
- [Medium] Stale ALPM capability retained across hotplugs due to missing st=
ate cleanup
--

--- Patch [3]: [PATCH v5 03/15] drm/i915/alpm: alpm_init() for DP2.1 ---
commit aaac88b9e7cd98f5bc53a3e1137528cc3fb4f5d2
Author: Animesh Manna <animesh.manna@intel.com>

drm/i915/alpm: alpm_init() for DP2.1

Initialize ALPM for DP2.1 and separate out ALPM mutex-init from alpm-init.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index bf626a1e189b1..b63c19589cd21 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -6349,6 +6349,9 @@ intel_dp_detect(struct drm_connector *_connector,
>  	if (ret =3D=3D 1)
>  		connector->base.epoch_counter++;
> =20
> +	if (intel_alpm_source_supported(connector))
> +		intel_alpm_init_dpcd(intel_dp);
> +

[Severity: Medium]
Since this patch now initializes ALPM DPCD capabilities in the hotplug dete=
ct
path, does intel_dp->alpm_dpcd need to be cleared when a monitor is
disconnected?

Looking earlier in intel_dp_detect(), when the status is disconnected,
capabilities like DSC and panel replay are explicitly cleared:

	if (status =3D=3D connector_status_disconnected) {
		intel_dp_test_reset(intel_dp);
		...
		memset(connector->dp.dsc_dpcd, 0, sizeof(connector->dp.dsc_dpcd));
		memset(connector->dp.panel_replay_caps.dpcd, 0,
		       sizeof(connector->dp.panel_replay_caps.dpcd));

If an ALPM-capable monitor is replaced with one that does not support ALPM,
and the DPCD read fails (for example, if the sink NACKs the unsupported
address), intel_alpm_init_dpcd() returns early without clearing the stale
value:

drivers/gpu/drm/i915/display/intel_alpm.c:intel_alpm_init_dpcd() {
	...
	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_RECEIVER_ALPM_CAP, &dpcd) < 0)
		return;

	intel_dp->alpm_dpcd =3D dpcd;
}

Could this result in the driver incorrectly trying to enable ALPM on a sink
that doesn't actually support it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D3
