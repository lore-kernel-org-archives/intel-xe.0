Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA52CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 11:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B94410FD01;
	Wed, 14 Oct 2026 11:10:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95110FD01;
 Wed, 14 Oct 2026 11:10:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AF3346021D;
 Wed, 14 Oct 2026 11:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AF51F000FF;
 Wed, 14 Oct 2026 11:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791976231;
 bh=xHkzfIJyee4IkyeyFwuwn1ZIsD/0JoVIkdkQ/LN3mq8=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=nzYs6RBQGBU2bMQj9xoF4qsY6jDdefNxC3mTRajh9ojzSq6R5C4CQ/QkSo7o9ZhC0
 Qnrfp7+KH93iYaDAM73AZL3Lyh2zLaV3dUYNNAv/KsyOphESFS4GQgUNkhY6EdkH9a
 a+pppkyomUS+osGfnpng9NhC5Fz38nCeFbD0xJSR3ThK5hj17Jduj7TsKyTFZrNhqn
 6hi6inzDl4AsFP9VAlqrSDpKJWV1GQOkmaEY6BBRQYTls1E1ONCSEhzLD1vmRpRINE
 6vh4bpwkiKmxgDfTzqYJDOE6cUF6x4W98ZCfQJLf+CyhAUmgWxlyReW7CAShgbOmzL
 gnu1xHtcyUOHQ==
Message-ID: <sashiko-outbox-171180@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] drm/i915/lt_phy: apply the PLL power save W/A on
 LT PHY platforms
To: "Mika Kahola" <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261014105306.2761683-5-mika.kahola@intel.com>
References: <20261014105306.2761683-1-mika.kahola@intel.com>
 <20261014105306.2761683-5-mika.kahola@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 11:10:30 +0000
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
- [High] drm/i915/lt_phy: missing TBT alt mode check in power save W/A
--

commit 64f624396c6597f36365729f25b701c8533785f7
Author: Mika Kahola <mika.kahola@intel.com>

drm/i915/lt_phy: apply the PLL power save W/A on LT PHY platforms

This commit adds the LT PHY sequence for the PLL power save workaround
and dispatches based on the PHY type. The PLL state is calculated from the =
eDP
tables at RBR as the C10 sequence does.

> diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/=
drm/i915/display/intel_dpll_mgr.c
> index e899b2eb08711..9f34574775da2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
> @@ -5245,7 +5245,10 @@ void intel_dpll_power_save_wa(struct intel_display=
 *display)
>  		if (!intel_encoder_is_dig_port(encoder))
>  			continue;
> =20
> -		intel_cx0_pll_power_save_wa(encoder);
> +		if (HAS_LT_PHY(display))
> +			intel_lt_phy_pll_power_save_wa(encoder);
> +		else
> +			intel_cx0_pll_power_save_wa(encoder);

[Severity: High]
Does this platform-wide dispatch route all digital ports to the LT PHY
workaround on platforms with HAS_LT_PHY(display), including TC ports?

It appears this checks the platform capability rather than the actual PHY t=
ype
of the encoder, which may lead to applying the LT PHY workaround unconditio=
nally
across different digital ports.

[ ... ]

> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/dr=
m/i915/display/intel_lt_phy.c
> index e05fd23b8a651..d286d33a03eae 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> @@ -2313,6 +2313,35 @@ void intel_xe3plpd_pll_disable(struct intel_encode=
r *encoder)
> =20
>  }
> =20
> +/*
> + * WA 14022081154
> + * LT PHY part of the sequence, see intel_dpll_power_save_wa().
> + */
> +void intel_lt_phy_pll_power_save_wa(struct intel_encoder *encoder)
> +{

[ ... ]

> +	drm_dbg_kms(display->drm,
> +		    "[ENCODER:%d:%s] Applying power saving workaround on disabled PLL\=
n",
> +		    encoder->base.base.id, encoder->base.name);
> +
> +	intel_lt_phy_pll_enable(encoder, &hw_state);
> +	intel_lt_phy_pll_disable(encoder);

[Severity: High]
Can this bypass TBT alt mode checks and corrupt Thunderbolt-owned shared po=
rt
registers?

During driver initialization and reset sequences (such as intel_display_res=
et()
calling intel_dpll_power_save_wa()), this executes automatically. If the sy=
stem
boots with an active TBT alt mode display, the LT PHY PLL is likely disabled
since TBT uses a separate clocking path.=20

This causes intel_lt_phy_pll_is_enabled(encoder) to return false, leading to
blindly executing intel_lt_phy_pll_enable() and intel_lt_phy_pll_disable().
Without the intel_tc_port_in_tbt_alt_mode() safety guard found in other
functions like intel_xe3plpd_pll_disable(), this bypass might overwrite the
port's clock select mask and assert MacCLK resets, potentially breaking act=
ive
TBT displays.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014105306.2761=
683-1-mika.kahola@intel.com?part=3D4
