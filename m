Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD37CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 10:58:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFD410FCCE;
	Wed, 14 Oct 2026 10:58:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8540710FCCE;
 Wed, 14 Oct 2026 10:58:15 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8D42E60514;
 Wed, 14 Oct 2026 10:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F641F000FF;
 Wed, 14 Oct 2026 10:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791975494;
 bh=Doec0XLUTks17h1dg8iMWnykGGEltlh6YidE64S5k/I=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=JCVimlKCCmKXc3gqEfjvpdv6q1wK7s8PSR6OXv+XUGi4ZqIPXvW3unby+A4HN5KUf
 JO6ksXOpBGNRFCimXdA8Vq3XwSjXUHXJz05wHwyrbUfOAAtQiN4XU2gg27LMH2azNX
 gwJDA642BhQWKbl5XMUXTs+4PK96u22zPmUACbK9up50HKFRbQXZjZP9v/CEfCd3fd
 T6CHkolhUesRLLihTvEjwBoWzAO/eRbAyQpzbetPw6dHPxTI+NEg/onzTbCNKtzZqJ
 IkPxzeBbOyg39weDvSMM30dZeB4tBYA6KlP8XLOMohCc5jDFXJWNECl57UwyMPPZDK
 NomRPR9UVDKhA==
Message-ID: <sashiko-outbox-171168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] drm/i915/lt_phy: drop the unused pll argument
 from intel_lt_phy_pll_enable()
To: "Mika Kahola" <mika.kahola@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261014105306.2761683-4-mika.kahola@intel.com>
References: <20261014105306.2761683-1-mika.kahola@intel.com>
 <20261014105306.2761683-4-mika.kahola@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 10:58:13 +0000
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
- [Low] Unnecessary dead argument left in intel_xe3plpd_pll_enable()
--

commit f2396c693af5e8056514c60f30bea8044eae04b7
Author: Mika Kahola <mika.kahola@intel.com>

drm/i915/lt_phy: drop the unused pll argument from intel_lt_phy_pll_enable()

intel_lt_phy_pll_enable() never looks at the pll, it is there only
because intel_xe3plpd_pll_enable() forwards its own arguments. Drop it
so callers that have no pll do not have to pass NULL.

> diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/dr=
m/i915/display/intel_lt_phy.c
> index c626246b71f91..e05fd23b8a651 100644
> --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
[ ... ]
> @@ -2300,7 +2299,7 @@ void intel_xe3plpd_pll_enable(struct intel_encoder =
*encoder,
>  			      struct intel_dpll *pll,
>  			      const struct intel_dpll_hw_state *dpll_hw_state)
>  {
> -	intel_lt_phy_pll_enable(encoder, pll, dpll_hw_state);
> +	intel_lt_phy_pll_enable(encoder, dpll_hw_state);
>  }

[Severity: Low]
Could we also drop the pll argument from intel_xe3plpd_pll_enable()?=20

Since the commit message mentions that intel_lt_phy_pll_enable() only had it
because intel_xe3plpd_pll_enable() forwards its own arguments, leaving it in
intel_xe3plpd_pll_enable() means we still have a dead argument here.

Dropping it from intel_xe3plpd_pll_enable() (and its caller in
intel_dpll_mgr.c) would make the API consistent, especially since its
counterpart intel_xe3plpd_pll_disable() takes only an encoder.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014105306.2761=
683-1-mika.kahola@intel.com?part=3D3
