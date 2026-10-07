Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B06CA5FFF
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 08:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EE510F4BD;
	Wed,  7 Oct 2026 08:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OYsDfxUN";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C1410F4BD;
 Wed,  7 Oct 2026 08:48:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BCB13600C8;
 Wed,  7 Oct 2026 08:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAAE1F0089B;
 Wed,  7 Oct 2026 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791362908;
 bh=4Gzs6m0iTQ+qg7A1EsDlQhsoNqGLKRR7DxEilPYy9aE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OYsDfxUNoEIU/QfP45g79utaqQyw8bAWeIsVnyJNvD1YsValbfXgIOl984gL13UPA
 kvXmL+JNRh6TAgQm2au8UENaqt9w3E5hunFBRR4KXknQK2lNSDfo9Oeb1Jg+/XWc0U
 64uYUMv8T+aWd8ybeSpYBaU9s4uDtwV5WYa/Gxk0NisA0HPz3Jn5KeP7Zw3j8CmMkm
 OzTt3iFUEa/8k12yugzTuyTxRL7XtIREo8UFWLXRu1ro2srHbp3bXWLpGOq42135Y/
 HMTkj/gyidxSAm64J6UZ9opH5L5G56RECWMXuKJ8NzyGil6UPO59Hv08SkoesSXK/L
 5HQj+2C+k9iCA==
Message-ID: <sashiko-outbox-162757@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR
 not valid for eDP
To: =?utf-8?b?Sm91bmkgSMO2Z2FuZGVy?= <jouni.hogander@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261007083443.647649-1-jouni.hogander@intel.com>
References: <20261007083443.647649-1-jouni.hogander@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 08:48:27 +0000
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
- [Medium] drm/i915/psr: Incomplete bypass of DP-specific PR bits for eDP
--

commit ec05ee2ea4b73ad11b56cabf344de75a2dc66b32
Author: Jouni H=C3=B6gander <jouni.hogander@intel.com>

drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not valid for eDP

This commit stops using the ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR bit for
eDP panels when computing AS SDP disablement. The eDP 1.5 specification
states that this bit and the DSC_DECODE_NOT_SUPPORTED_IN_PR bit are
DP-specific and not used in eDP.

> EDP1.5 specification says:
>=20
> "Although defined for the PR function in DP Standard, the
> ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR and DSC_DECODE_NOT_SUPPORTED_IN_PR
> bits (DPCD 000B1h[3, 2], respectively) are DP-specific and are therefore
> not used in eDP."
>=20
> Stop using SYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR on eDP.

[Severity: Medium]
Since the DSC decode capability bits are not used in eDP either, does
compute_pr_dsc_support() need to be updated to ignore them? Currently, it
reads the DP_PANEL_REPLAY_CAP_CAPABILITY register and extracts the DSC mode
which includes these DP-specific bits:

drivers/gpu/drm/i915/display/intel_psr.c:
compute_pr_dsc_support() {
	val =3D connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_=
REPLAY_CAP_CAPABILITY)];
	pr_dsc_mode =3D REG_FIELD_GET8(DP_PANEL_REPLAY_DSC_DECODE_CAPABILITY_IN_PR=
_MASK, val);
	...
}

Also, does intel_psr_pr_async_video_timing_supported() need the same eDP
bypass that is being added in this patch? It still unconditionally checks
the DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR bit:

drivers/gpu/drm/i915/display/intel_psr.c:
intel_psr_pr_async_video_timing_supported() {
	...
	u8 pr_cap =3D dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)];

	return (pr_support & DP_PANEL_REPLAY_SUPPORT) &&
		!(pr_cap & DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR);
}

Could this lead to incorrect capability detection on eDP panels if these
unused bits contain non-zero garbage values?

> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index 872e253db1786..338a8dab75945 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1694,8 +1694,11 @@ static inline bool compute_link_off_after_as_sdp_w=
hen_pr_active(struct intel_con
> =20
>  static inline bool compute_disable_as_sdp_when_pr_active(struct intel_co=
nnector *connector)
>  {
> -	return !(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PA=
NEL_REPLAY_CAP_CAPABILITY)] &
> -		 DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR);
> +	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +
> +	return intel_dp_is_edp(intel_dp) ? false :
> +		!(connector->dp.panel_replay_caps.dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_RE=
PLAY_CAP_CAPABILITY)] &
> +		  DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR);
>  }
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007083443.6476=
49-1-jouni.hogander@intel.com?part=3D1
