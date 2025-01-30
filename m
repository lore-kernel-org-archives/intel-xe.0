Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6297EC0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 12:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC4A10E10D;
	Thu, 30 Jan 2025 12:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1QKAetM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0C110E10D
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 12:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738241880; x=1769777880;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IO65+xsJlY2xwHxebE98zzfJTHUqIBrHAdTnh+mXzvw=;
 b=O1QKAetM7uTy3FFZcK86rLdf0mw/24cN3/MrO2jg46u54lLTM0P+q8H1
 X0jVHbbqk67OcZUonuaoyYDwoepyqVFJc1szwLZMaobEP9hGlJsBwSt7G
 9gCuydYJpyF3SUMQaQYVJ5naSCP2bgBj13it1FYSYr0Y1FZ/RzzWcqZuq
 sCl562IiPLBEQuH3AX+E/KxzK+Bu5YiBtzbMFxdiFoe+J/blh7pXEdUiL
 pJATfsZTmjIX4NnDg014AS1Cea4Mza0F2TlKXQaCyIaRmmX4sMdG+jcXY
 LVyXMhaMHfF2tOM8/wrqWTC12vEAbwMJ8Yfago7vUi72+PmA/qkEvRDee w==;
X-CSE-ConnectionGUID: UpieQFuSQ2CnH7+f/IzwFw==
X-CSE-MsgGUID: VJ2fGLTsQfatd4XHHrZawg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38888523"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38888523"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 04:58:00 -0800
X-CSE-ConnectionGUID: Wehy5IDPSCeNps8G+Fo0cA==
X-CSE-MsgGUID: OSiMWzIbQlaYRTGQwmSAGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109173843"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.99.135])
 ([10.245.99.135])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 04:57:57 -0800
Message-ID: <473bf27e-701d-4000-94fa-f7b74513daae@linux.intel.com>
Date: Thu, 30 Jan 2025 13:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/pf: Add runtime registers for graphics gen >=
 30
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
References: <20250128110300.2840596-1-jakub1.kolakowski@intel.com>
 <20250128110300.2840596-2-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250128110300.2840596-2-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 1/28/2025 12:03 PM, Jakub Kolakowski wrote:
> Add missing runtime registers for graphics versions of 3000 or higher.
> This is required for Xe3 where additionally we have
> MIRROR_L3BANK_ENABLE register.

Nit: "... Xe3, where the MIRROR_L3BANK_ENABLE register was introduced by 
commit 11a64adcdbcc ("drm/xe/xe3: Generate and store the L3 bank mask").

Tested-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

> 
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Suggested-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 23 ++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index 924e75b94aec..6b5f849a0722 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -176,11 +176,32 @@ static const struct xe_reg ver_2000_runtime_regs[] = {
>   	TIMESTAMP_OVERRIDE,		/* _MMIO(0x44074) */
>   };
>   
> +static const struct xe_reg ver_3000_runtime_regs[] = {
> +	RPM_CONFIG0,			/* _MMIO(0x0d00) */
> +	XEHP_FUSE4,			/* _MMIO(0x9114) */
> +	MIRROR_FUSE3,			/* _MMIO(0x9118) */
> +	MIRROR_FUSE1,			/* _MMIO(0x911c) */
> +	MIRROR_L3BANK_ENABLE,		/* _MMIO(0x9130) */
> +	XELP_EU_ENABLE,			/* _MMIO(0x9134) */
> +	XELP_GT_GEOMETRY_DSS_ENABLE,	/* _MMIO(0x913c) */
> +	GT_VEBOX_VDBOX_DISABLE,		/* _MMIO(0x9140) */
> +	XEHP_GT_COMPUTE_DSS_ENABLE,	/* _MMIO(0x9144) */
> +	XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,/* _MMIO(0x9148) */
> +	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
> +	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
> +	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
> +	CTC_MODE,			/* _MMIO(0xa26c) */
> +	HUC_KERNEL_LOAD_INFO,		/* _MMIO(0xc1dc) */
> +};
> +
>   static const struct xe_reg *pick_runtime_regs(struct xe_device *xe, unsigned int *count)
>   {
>   	const struct xe_reg *regs;
>   
> -	if (GRAPHICS_VERx100(xe) >= 2000) {
> +	if (GRAPHICS_VERx100(xe) >= 3000) {
> +		*count = ARRAY_SIZE(ver_3000_runtime_regs);
> +		regs = ver_3000_runtime_regs;
> +	} else if (GRAPHICS_VERx100(xe) >= 2000) {
>   		*count = ARRAY_SIZE(ver_2000_runtime_regs);
>   		regs = ver_2000_runtime_regs;
>   	} else if (GRAPHICS_VERx100(xe) >= 1270) {

