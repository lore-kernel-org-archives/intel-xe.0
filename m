Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56467C61CE3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B4910E1AB;
	Tue, 25 Aug 2026 06:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gr3iGz2q";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3F010E1A0;
 Tue, 25 Aug 2026 06:43:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BABE8439DE;
 Tue, 25 Aug 2026 06:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685871F000E9;
 Tue, 25 Aug 2026 06:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787640181;
 bh=DBKDFZvo0aGHfr6/mLmA2EyyxvUSoFe7sxEZdGgKGsY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=gr3iGz2q6MEng057z4lqmW3BFhBMTBZSVIN67Cr+GoQOzXOkC4GEhAy7FkRXYngCt
 wGmE+PV+9tejtERtR43uomscfiTRb1TcFcGpaP+hvA3FOodYmk9neQqGU2PqDqU70t
 i/HcItnH/pCVCSPjKndHsNa7/uDnfxlLgDmCwKfC30M0k0/i+FTQnihJ8RRGGn/I9D
 OB4d3cwnkXWG7vhF/sQe5I6atLYO0s/j/IOMCQy1xzc2EGeXDq9Z/hZZ0/JbOgjAbo
 efZk9BRzG52B0ZV+8c9lKrNMlYgB6LdL1wUWkG9UeEkdC/sQrSvn4BPgKViwgWVmkZ
 DF4BqtIACvgUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 12/15] drm/i915/alpm: Replace is_edp() with
 alpm_is_possible()
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-13-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-13-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:43:00 +0000
Message-Id: <20260825064301.685871F000E9@smtp.kernel.org>
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
- [High] Flawed logical OR (||) for LTTPR ALPM capabilities and incomplete =
feature integration.
- [Medium] DPCD capability registers are evaluated without applying capabil=
ity bitmasks.
--

--- Patch [12]: [PATCH v5 12/15] drm/i915/alpm: Replace is_edp() with alpm_=
is_possible() ---
commit 7013cc56cbeba3729d838fd8bd915ecee9e1de24
Author: Animesh Manna <animesh.manna@intel.com>

drm/i915/alpm: Replace is_edp() with alpm_is_possible()

Add a separate alpm_is_possible() which will check for both edp and dp.

Cc: Jouni H=C3=B6gander <jouni.hogander@intel.com>

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index d23f3bdf13399..f3f6f40f96244 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c

[ ... ]

> @@ -72,6 +72,16 @@ void intel_alpm_init(struct intel_dp *intel_dp)
>  	mutex_init(&intel_dp->alpm.lock);
>  }
> =20
> +bool intel_alpm_is_possible(struct intel_dp *intel_dp)
> +{
> +	struct intel_display *display =3D to_intel_display(intel_dp);
> +
> +	return (DISPLAY_VER(display) >=3D 12 && intel_dp->alpm_dpcd) ||
> +		(DISPLAY_VER(display) >=3D 35 &&
> +		intel_dp->lttpr_common_caps[DP_LTTPR_ALPM_CAPABILITIES -
> +					    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV]);
> +}

[Severity: High]
Should this logical OR (||) be an AND (&&) for LTTPR capabilities? By using
OR, if the LTTPR supports ALPM but the sink does not (or vice versa), this
function will return true.

Could this lead to mismatched configurations? For example, if the LTTPR
supports ALPM but the sink doesn't, intel_alpm_enable_sink() will write
DP_ALPM_MODE_AUX_LESS to the sink's DP_RECEIVER_ALPM_CONFIG register even
though the sink lacks support.

Additionally, downstream functions like intel_alpm_lobf_compute_config()
exclusively check the sink's capability. Does using a logical OR here
effectively render the LTTPR check dead code in those paths?

[Severity: Medium]
Is it safe to evaluate the raw DPCD capability bytes (intel_dp->alpm_dpcd
and lttpr_common_caps) directly as booleans?

Since DPCD 0x02e is a bitfield containing multiple distinct bits (like
DP_ALPM_PM_STATE_2A_SUPPORT), a non-zero value doesn't necessarily mean
basic ALPM capability is supported.

Should this use existing helpers like intel_alpm_aux_wake_supported() or
explicitly apply the DP_ALPM_CAP bitmasks to prevent falsely detecting ALPM
support on reserved bits?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D12
