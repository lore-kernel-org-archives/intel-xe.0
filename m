Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF31EEA845
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 18:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004F610E289;
	Thu, 12 Feb 2026 18:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hr+uDNwv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522EB10E289
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 18:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770921362; x=1802457362;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZAuaNudUE19KTZApYXQIWbiO1xva5kgx5kEBpAc0H04=;
 b=hr+uDNwvA2oQFqngKYI9CpuEUHhPpR0Hiq8TL8wI63Z9PHgBQsr5Iar9
 jcbjzT5X3Qr1RyqdeL0FDPQektxXmG2IRi5u2BHO73OUlPMLTU0CENrc5
 KLx6PTBnGFk3ulC9huclRL+R7jz/sTU0iA/bAkcIULW3nhP5ciknM46Iu
 Hug21NaayFT44xeq+1YVWWQZC0Af4sxuzP9B0y8N1HBximiLC1tyWEX1K
 yf4dzohKe6n4JKG9wlSyEtlgMBbuypRGXtQ6eQhmdI4NVrTT6Fd8fYUwz
 KyMtL9qsgECeUJ2BL6/4vYrrEy4j30wNHUEQbFDU9mNWey/a71lyk5AQI Q==;
X-CSE-ConnectionGUID: LkvTgmTgSfq0VuSddDGlkA==
X-CSE-MsgGUID: ba5yeg7FQICXG695D6OhdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="82429206"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="82429206"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:36:01 -0800
X-CSE-ConnectionGUID: 1XrJa4eKTcayK0SwYTNUkA==
X-CSE-MsgGUID: vfX2aixcRsyag9nZeMMjmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; d="scan'208";a="212527968"
Received: from unknown (HELO [10.241.240.207]) ([10.241.240.207])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 10:36:02 -0800
Message-ID: <cf5e06e4-39e2-4b49-afed-4964a639ba6f@linux.intel.com>
Date: Thu, 12 Feb 2026 10:35:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe3p_xpc: Add new XeCore fuse registers to VF
 runtime regs
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20260210182519.206952-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20260210182519.206952-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Matt,

On 2026-02-10 10:25, Matt Roper wrote:
> SRIOV VFs do not automatically have access to the XeCore fuse registers.
> Add the two new registers that show up on Xe3p_XPC to the runtime
> register list to grant VFs access.  Since there's a single runtime
> register list for all Xe3p, this will technically also grant access on
> Xe3p_LPG platforms where the registers don't exist, but that should be
> harmless since even if a VF tries to read a non-existent register on
> those platforms it will just get back a sensible value of 0x0.
>
> Fixes: e8100643ff01 ("drm/xe/xe3p_xpc: XeCore mask spans four registers")
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
This looks good to me.

Reviewed-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>

Thanks,
Ngai-Mint Kwan
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index b5e0a5b7723e..6586df2fcb91 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -111,6 +111,8 @@ static const struct xe_reg ver_35_runtime_regs[] = {
>   	XE2_GT_COMPUTE_DSS_2,		/* _MMIO(0x914c) */
>   	XE2_GT_GEOMETRY_DSS_1,		/* _MMIO(0x9150) */
>   	XE2_GT_GEOMETRY_DSS_2,		/* _MMIO(0x9154) */
> +	XE3P_XPC_GT_GEOMETRY_DSS_3,	/* _MMIO(0x915c) */
> +	XE3P_XPC_GT_COMPUTE_DSS_3,	/* _MMIO(0x9160) */
>   	SERVICE_COPY_ENABLE,		/* _MMIO(0x9170) */
>   };
>   

