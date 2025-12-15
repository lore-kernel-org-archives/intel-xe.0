Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF709D5B16E
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 14:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA9110E4E8;
	Mon, 15 Dec 2025 14:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZ6cOIB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F14810E4E8
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 14:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765807278; x=1797343278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5CFsuPUoxT30vdF9F/g8BxehVx2S1eQvZv9a1CZBzWg=;
 b=aZ6cOIB11nJsM+h9aIZjh2Vne2l9Vx14Za/xsBALbAR/uo3FvObFboSk
 Lss3XGGsRcQw5E3PzkjnlqqjZoO1Zk/sTBVELwhLbYFDck4pV8dk8E2Xk
 CxRyCniPKRPt1Uv+HnlDx2KwW3BdIMdZN4eYPWJ/OnoVlBiKLPlqki8Uw
 UP5XTkjzuDeWx8+8fna3pNsJpA2lcDwco3xm4FP0cKGV12HtkXXXWSzSX
 ts+Q4hTzJiZaMOIaU5eR8Ak44a06tWWamK37+WDwbybxJpH+ILJ/yY1MU
 i6mjaagbuK6eLvtTwexb2qwToYdNxPzw8p5xbk0MIOg+guBM2GtYwl/tA Q==;
X-CSE-ConnectionGUID: SQ6fICqFR0y0XvobqELPCQ==
X-CSE-MsgGUID: e8O9QtonQ16MrtWTnYRrqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78015670"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="78015670"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:01:17 -0800
X-CSE-ConnectionGUID: 1Xui+jb+Qf6AVItCNOC9vg==
X-CSE-MsgGUID: TzX734MSS9uTKFRoCNJZLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197996298"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 06:01:15 -0800
Date: Mon, 15 Dec 2025 15:01:13 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Reuven Abliyev <reuven.abliyev@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/nvm: enable cri platform
Message-ID: <aUAUqTdroGS2L4gi@black.igk.intel.com>
References: <20251215125928.1931951-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215125928.1931951-1-alexander.usyskin@intel.com>
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

On Mon, Dec 15, 2025 at 02:59:28PM +0200, Alexander Usyskin wrote:
> Mark CRI as one that have CSC NVM device.
> Update the writable override flow to take the
> information from survivability register for CRI.

Quite a bit of trailing space, please use it.

> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_nvm.c | 35 ++++++++++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_pci.c |  1 +
>  2 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> index 33f4ac82fc80..87b7b0120f7c 100644
> --- a/drivers/gpu/drm/xe/xe_nvm.c
> +++ b/drivers/gpu/drm/xe/xe_nvm.c
> @@ -10,6 +10,7 @@
>  #include "xe_device_types.h"
>  #include "xe_mmio.h"
>  #include "xe_nvm.h"
> +#include "xe_pcode_api.h"
>  #include "regs/xe_gsc_regs.h"
>  #include "xe_sriov.h"
>  
> @@ -45,39 +46,51 @@ static bool xe_nvm_non_posted_erase(struct xe_device *xe)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  
> -	if (xe->info.platform != XE_BATTLEMAGE)
> +	switch (xe->info.platform) {
> +	case XE_CRESCENTISLAND:
> +		fallthrough;

Is standalone fallthrough a thing?

Raag

> +	case XE_BATTLEMAGE:
> +		return !(xe_mmio_read32(mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
> +			 NVM_NON_POSTED_ERASE_CHICKEN_BIT);
> +	default:
>  		return false;
> -	return !(xe_mmio_read32(mmio, XE_REG(GEN12_CNTL_PROTECTED_NVM_REG)) &
> -		 NVM_NON_POSTED_ERASE_CHICKEN_BIT);
> +	}
>  }
