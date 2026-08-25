Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F565C61CE3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223C110E920;
	Tue, 25 Aug 2026 06:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ods28EK4";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4CC10E920;
 Tue, 25 Aug 2026 06:32:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1555F436D2;
 Tue, 25 Aug 2026 06:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73D01F000E9;
 Tue, 25 Aug 2026 06:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787639524;
 bh=P5Ir+dOtORH5a79whAXQL/IVYqZqlgVAuuD3rgTmi64=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Ods28EK4mfsYxMqgI6Wn2qMF6YyyV3BtwjUFLZvlElk1zUNG97+5hNh0DyOkd6VPW
 JJG8VzEn2DdNrtEjqYxAzTHsq3G4vGup6DRAqX26Z2AH2SwTgOfIK6A+2jGAd8VOfZ
 L3HrMXiBiFsbq8vV9BuVf2SMn8+cyPx6s68L9c6qXVwqYWWYkOXAOfChPfxer01NHS
 rkj1O8uRvT37iKpLaykxOHi+hWFrjePoqqCjpmFnStfoutpuB3kkFPSD+l+NGC8ZMV
 2wiQODxXhwViDIxD3S+tlAlbrrWjP0FOVGUoBNT/ih7+4rUGXD0LYHAYUcEgoT7o5V
 TtuGUysHdVoYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/15] drm/i915/alpm: Program LTTPR count for DP 2.1
 ALPM
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-11-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-11-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:32:03 +0000
Message-Id: <20260825063203.C73D01F000E9@smtp.kernel.org>
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
- [High] Logical inversion in the early return condition causes `intel_dp_u=
pdate_lttpr_count` to unconditionally return for all display types, renderi=
ng the new feature completely inactive.
- [Medium] Mismatch between comment and code for LTTPR revision check.
--

--- Patch [10]: [PATCH v5 10/15] drm/i915/alpm: Program LTTPR count for DP =
2.1 ALPM ---
commit 2590778ff6f9e6755fe0231710bcb90018b982c4
Author: Animesh Manna <animesh.manna@intel.com>

drm/i915/alpm: Program LTTPR count for DP 2.1 ALPM

This commit adds an AUX write transaction to DP_TOTAL_LTTPR_CNT (0xf000a)
with the total number of LTTPRs before link training for DP 2.1 ALPM.

> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/driv=
ers/gpu/drm/i915/display/intel_dp_link_training.c
> index cb92cff906146..1d5873cb64f55 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
[ ... ]
> @@ -2265,6 +2265,20 @@ intel_dp_128b132b_link_train(struct intel_dp *inte=
l_dp,
>  	return passed;
>  }
> =20
> +static void intel_dp_update_lttpr_count(struct intel_dp *intel_dp,
> +					int lttpr_count)
> +{
> +	/*
> +	 * Program only for DP2.1 and return if LTTPR revison is less than 0x20
> +	 * where 0:3 represents minor rev and 4:7 represent major rev
> +	 */

[Severity: Medium]
Does this comment contradict the logic implemented below?=20

The comment states the function should return if the revision is "less
than 0x20", while the code correctly checks for less than or equal to 0x20
to filter out DP 2.0.

> +	if (!intel_dp_is_edp(intel_dp) ||
> +	    intel_dp->lttpr_common_caps[0] <=3D 0x20)
> +		return;

[Severity: High]
Does this logic inadvertently cause an unconditional early return for all
display types?

For external DP displays where LTTPRs are used, !intel_dp_is_edp(intel_dp)
evaluates to true, triggering the early return immediately.

For eDP displays, !intel_dp_is_edp(intel_dp) evaluates to false, but since
eDP bypasses LTTPR initialization in intel_dp_init_lttpr_and_dprx_caps(),
intel_dp->lttpr_common_caps remains zero-initialized.=20

This causes intel_dp->lttpr_common_caps[0] <=3D 0x20 to evaluate to true
(since 0 is less than 0x20), which also triggers the early return.

Was the intention to check intel_dp_is_edp(intel_dp) without the logical
inversion to properly bypass eDP?

> +
> +	drm_dp_dpcd_writeb(&intel_dp->aux, DP_TOTAL_LTTPR_CNT, lttpr_count);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D10
