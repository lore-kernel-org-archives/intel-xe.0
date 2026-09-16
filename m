Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39A3C88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 09:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67B3110E0C1;
	Wed, 16 Sep 2026 09:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mhHKkUVI";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9CD10E0C1;
 Wed, 16 Sep 2026 09:23:31 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A239A60234;
 Wed, 16 Sep 2026 09:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0891F000FF;
 Wed, 16 Sep 2026 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789550610;
 bh=HJVADuaak7xuACRdBPVc14qKs+mAQ60aDFMyvBfC0Qs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=mhHKkUVI2DswogguVWWF5+cefiWM+nfJwzLLyN2klcdkPUEW9At4ivEvNcpNLgnw5
 WsqaqeH/FlOl6D2fDaCd6irSJ6EpR5Nu7zIxilqR4YQPOQo8u0HYvdVrF7Yd2rMUDx
 nkLdNqiRJr836YNuaCgvkxOwMRrB4oXtQPFhDZs2EzpwLEfDgPDk/3R0b2ngaGhH46
 Cn7s84t590txahU43DazA/dfVw91tUflkrsq+fumVHg4eurr6rbbjCCSPQDWT3sq0j
 FPKt5F8XE0zBEpj6DNsYtitXtJISqXhYk7W4RwoEcc+ndq4joCsBCDPt40yp02w4Y7
 GzeLw//jSDSwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/10] drm/i915/dp: Add M/N ratio check with warning
 for DP link config
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260916090946.677564-5-suraj.kandpal@intel.com>
References: <20260916090946.677564-1-suraj.kandpal@intel.com>
 <20260916090946.677564-5-suraj.kandpal@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 09:23:29 +0000
Message-Id: <20260916092330.2A0891F000FF@smtp.kernel.org>
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
- [Medium] drm: log spam and DoS vector due to invariant drm_WARN inside bp=
p_x16 loop
--

commit cb9847e0babf613d9ed13f234a331025ee93ec9c
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

drm/i915/dp: Add M/N ratio check with warning for DP link config

This commit introduces intel_dp_check_m_n_ratio() to validate the computed
link M/N ratio against the maximum allowed value. It issues a warning via
drm_WARN() if the limit is exceeded.

[ ... ]
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 430ba1230c5ae..364f62563f904 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -347,6 +347,8 @@ int intel_dp_mtp_tu_compute_config(struct intel_dp *i=
ntel_dp,
>  					 link_bpp_x16,
>  					 &crtc_state->dp_m_n);
> =20
> +		intel_dp_check_m_n_ratio(crtc_state, &crtc_state->dp_m_n);
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Will this evaluate a loop-invariant condition on every iteration of the
bpp_x16 loop in intel_dp_mtp_tu_compute_config() in intel_dp_mst.c?

Because intel_dp_check_m_n_ratio() uses drm_WARN() and is called inside this
loop, a KMS client requesting an MST mode where the link_m / link_n ratio
exceeds max_m_n_ratio could trigger a full kernel stack trace for every fai=
led
loop iteration.

When DSC is used, bpp_step_x16 can be as small as 1/16 bpp. Could this cause
the loop to run potentially hundreds of times for an un-fittable mode, floo=
ding
the kernel log and leading to dmesg rollover or console lockups?

> +
>  		if (is_mst) {
>  			int remote_bw_overhead;
>  			int remote_tu;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916090946.6775=
64-1-suraj.kandpal@intel.com?part=3D4
