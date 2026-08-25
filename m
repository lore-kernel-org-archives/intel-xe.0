Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CCEC61DB6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B6710E913;
	Tue, 25 Aug 2026 06:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y/ox55o3";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED1E10E911;
 Tue, 25 Aug 2026 06:28:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5765B439EC;
 Tue, 25 Aug 2026 06:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044321F000E9;
 Tue, 25 Aug 2026 06:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787639325;
 bh=+7LCxAkFaTMdzxos+dqZubmNxnYDXr63oVn6eMC/Vwo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Y/ox55o3ckxTVHjJJ91GAHLVBdCHV26u8q42V8xQ5/URx+j79KEKiarKV0xJe3dbf
 XdvoNsqGteLf3WZXWpmpQhRF/R95Tiqtm1MK0IOrtdo4PKcQNdK+aQLTd1KU26ufHw
 TyTQhuOC2Fn4jg2ChM+vEY0ZFv5yQtwlsxgTWD7YjF8g46hbNmFv3pgByQjSrrrmwA
 Q+AIksD2K8Xw5OpgKPUjTMxQYoY+O1AhxRlO7IclihpRz+o+mWoTuHSK5AVM6VgZ+7
 svEWT5tVZGzXJYsFJKhepSK6fN2OVkGL9q1jIzlrRA0FRZidq6zFNepeLfaeQtVOB3
 TGs9maJgvxWcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/15] drm/i915/alpm: Move alpm sink capabality
 readout in separate function
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-3-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-3-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:28:44 +0000
Message-Id: <20260825062845.044321F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The refactoring silently drops error propagation when reading th=
e ALPM DPCD capability, altering eDP initialization failure behavior despit=
e the 'Non functional change' claim.
- [Medium] The uninitialized stack variable `dpcd` can be assigned to `inte=
l_dp->alpm_dpcd` if `drm_dp_dpcd_readb()` returns 0.
--

--- Patch [2]: [PATCH v5 02/15] drm/i915/alpm: Move alpm sink capabality re=
adout in separate function ---
commit 7a8fa9f136849fe0967523fc134415ba1067f31f
Author: Animesh Manna <animesh.manna@intel.com>

drm/i915/alpm: Move alpm sink capabality readout in separate function

This commit refactors the ALPM sink capability readout logic into a new
standalone function, intel_alpm_init_dpcd().

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index f1383764b7028..542900e29a014 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
[ ... ]
> @@ -43,6 +43,16 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *inte=
l_dp,
>  		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
>  }
> =20
> +void intel_alpm_init_dpcd(struct intel_dp *intel_dp)
> +{
> +	u8 dpcd;
> +
> +	if (drm_dp_dpcd_readb(&intel_dp->aux, DP_RECEIVER_ALPM_CAP, &dpcd) < 0)
> +		return;
> +
> +	intel_dp->alpm_dpcd =3D dpcd;

[Severity: Medium]
If drm_dp_dpcd_readb() performs a short read and returns 0, the error check
will evaluate to false. Does this result in assigning uninitialized stack=20
memory from dpcd to intel_dp->alpm_dpcd?

The previous API used here (drm_dp_dpcd_read_byte) explicitly checked for
short reads and returned a negative error, which avoided this scenario.

> +}
> +
[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i9=
15/display/intel_dp.c
> index 113d767e62e9c..bf626a1e189b1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
[ ... ]
> @@ -4810,11 +4809,7 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp, str=
uct intel_connector *connector
>  	 */
>  	intel_dp_init_source_oui(intel_dp);
> =20
> -	/* Read the ALPM DPCD caps */
> -	ret =3D drm_dp_dpcd_read_byte(&intel_dp->aux, DP_RECEIVER_ALPM_CAP,
> -				    &intel_dp->alpm_dpcd);
> -	if (ret < 0)
> -		return false;
> +	intel_alpm_init_dpcd(intel_dp);

[Severity: Medium]
The commit message states this is a non-functional change, but the previous
code returned false and aborted eDP initialization if the AUX read failed.

Since the new intel_alpm_init_dpcd() function returns void, does this=20
inadvertently swallow the error and change the initialization failure behav=
ior
for eDP?

> =20
>  	/*
>  	 * This has to be called after intel_dp->edp_dpcd is filled, PSR checks

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D2
