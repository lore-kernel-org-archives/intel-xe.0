Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D14C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 18:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43D110F0AF;
	Wed,  1 Jul 2026 18:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vh5wzeg5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EFE10F0AF;
 Wed,  1 Jul 2026 18:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782930697; x=1814466697;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=KDrEmCir35QMesdpODyshK6am/tKeA7lD0tEvzlUVlo=;
 b=Vh5wzeg58sO/O0WDAx29d8YWRd2/7srCEyHO9IBfwqvkqNMggESaX1JG
 V1+c8P5AfvaORapdrU7zMF8okZRxm55r46vLbHzsn6uGlG75yLi5Zo4FM
 MiT1eze0rDiZpkfsV9QJHyYOw5c33e2Yyd9V0Iy3MbEjYU71bgZtMThd+
 P5J096cm4dDebmiLJDMFRtY7ATJ4Tx0Ginw2s/+Ztm2pimdWd9QlQt4wk
 rj0j3/SNAjVRjLpfDHUkHx7brm6t29N8RMu1i7Hfb5dqdzlYB648ISyEl
 u8TkiBlvkKXVNi/XZOfTHPH5DaTJijb+UTwsiG0qkWzE1+IJMfA7tDwXF g==;
X-CSE-ConnectionGUID: iVg3BBvaT4eBK4evcA8Ixw==
X-CSE-MsgGUID: m9UH1aw0T62QNFtWr8gbuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82663362"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="82663362"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 11:31:37 -0700
X-CSE-ConnectionGUID: Z0O9wQfRRKesSLfLfQ94qQ==
X-CSE-MsgGUID: Z1Gu8a/RRGCiPqUJvaPxdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="248660411"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 11:31:36 -0700
Date: Wed, 1 Jul 2026 20:31:34 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [v6,
 2/4] drm/i915/display: harden shifts in ICL_DPCLKA_CFGCR0_DDI_CLK_SEL
 macros
In-Reply-To: <20260609095525.570614-3-luciano.coelho@intel.com>
Message-ID: <341a5d14-89be-cae3-2a89-cd380cff2d6e@intel.com>
References: <20260609095525.570614-3-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1648026110-1782921051=:605841"
Content-ID: <b6d15c91-f421-6596-41b3-e73192b7ffe6@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1648026110-1782921051=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <8eb17236-03a5-9e92-21aa-12c72d802ae4@intel.com>

On Tue, 9 Jun 2026, Luca Coelho wrote:
> ICL_DPCLKA_CFGCR0 has a 2-bit DDI_CLK_SEL field per combo PHY, for
> PHY_A..PHY_D only.  Any other phy value (PHY_NONE, TypeC/SNPS PHYs) is

FWIW, double space: s/  / /

> not valid here.
>
> This is not a problem with the current implementation, because phy is
> always valid when these macros are called, but it's more robust to
> cast to unsigned so the shift is always well-defined.
>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
> .../gpu/drm/i915/display/intel_display_regs.h    | 16 +++++++++++++---
> 1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 4321f8b529da..2dcbbad70174 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -2869,9 +2869,19 @@ enum skl_power_gate {
> #define  ICL_DPCLKA_CFGCR0_TC_CLK_OFF(tc_port)	(1 << ((tc_port) < TC_PORT_4 ? \
> 						       (tc_port) + 12 : \
> 						       (tc_port) - TC_PORT_4 + 21))
> -#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)	((phy) * 2)
> -#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy)	(3 << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
> -#define  ICL_DPCLKA_CFGCR0_DDI_CLK_SEL(pll, phy)	((pll) << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
> +
> +/*
> + * ICL_DPCLKA_CFGCR0 has a 2-bit DDI_CLK_SEL field per combo PHY, for
> + * PHY_A..PHY_D only.  Any other phy value (PHY_NONE, TypeC/SNPS PHYs)

double space: s/  / /

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³

> + * is not valid here.
> + */
> +#define ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)	_PICK(phy & 0x3, 0, 2, 4, 6)
> +#define ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy) \
> +	REG_GENMASK(ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy) + 1, \
> +		    ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
> +#define ICL_DPCLKA_CFGCR0_DDI_CLK_SEL(pll, phy) \
> +	((pll) << ICL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
> +
> #define  RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy)	_PICK(phy, 0, 2, 4, 27)
> #define  RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(phy) \
> 	(3 << RKL_DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(phy))
>
--8323329-1648026110-1782921051=:605841--
