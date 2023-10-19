Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2128CCDB465
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 08:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D925210E100;
	Thu, 19 Oct 2023 08:23:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BAE410E100
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697703833; x=1729239833;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=2zgw+PzuXQrXsQuv6SjCdFF6ik841Z6W1lMih9RHbc0=;
 b=BLZCn2lRN3Gn4JT1+JVV9xTKnuZ50Tk/yMtUNZETq8RyIoHq0pGEPMCb
 eJIYtErMMA6PRp/OFEPQ5D6k6AUrtmEekmcg5orXLkP3jMkbo/EBssTVq
 yqE8bmbrgE4+tA3/pDmYfR/blV75rdg/KZt5EP+dOEAl6uq0S1ODpADZg
 /HDsf78tAuREXdNJM8UjeIzrpPPhGB4x+9ISSDNZ39U18nNjcox0ZSN+m
 SsMHQXeFfCiU3iJypK8SyPM3heRpwCsViu59qbudm9O93+QTry2krycUi
 H8r4NaAufGG2dKW1zpM8MPPkyLo1pTIGcMHEvSCuvKFf37wQd3Hvm+i+F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="371264447"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="371264447"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 01:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="822755575"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; d="scan'208";a="822755575"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 01:23:51 -0700
Message-ID: <1ade2a7d-2f8c-665a-ef26-4f72e822766c@linux.intel.com>
Date: Thu, 19 Oct 2023 13:56:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231018040033.1227494-1-himal.prasad.ghimiray@intel.com>
 <20231018040033.1227494-10-himal.prasad.ghimiray@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231018040033.1227494-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 09/10] drm/xe: Clear SOC CORRECTABLE error
 registers.
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


On 18/10/23 09:30, Himal Prasad Ghimiray wrote:
> PVC doesn't support correctable SOC error reporting, classify them as
> Undefined and clear the registers.
>
> v2
> - Fix commit message.
> - Although the errors are correctable but they are spurious interrupt.
> Hence use drm_err instead of drm_warn.(Aravind)
>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_error.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 62b4051c6633..5700f708425f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -646,8 +646,26 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  	if (tile_to_xe(tile)->info.platform != XE_PVC)
>  		return;
>  
> -	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
> -		return;
> +	if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
> +		for (i = 0; i < XE_SOC_NUM_IEH; i++)
> +			xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
> +					~REG_BIT(hw_err));
> +
> +		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
> +				REG_GENMASK(31, 0));
> +		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err),
> +				REG_GENMASK(31, 0));
> +		xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
> +				REG_GENMASK(31, 0));
> +		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
> +				REG_GENMASK(31, 0));
> +
> +		drm_err(&tile_to_xe(tile)->drm, HW_ERR
> +			"Tile%d reported Undefine SOC CORRECTABLE error.",
> +			tile->id);
> +
> +		goto unmask_gsysevtctl;
> +	}
>  
>  	base = SOC_PVC_BASE;
>  	slave_base = SOC_PVC_SLAVE_BASE;
> @@ -729,6 +747,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  	xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err),
>  			mst_glb_errstat);
>  
> +unmask_gsysevtctl:
>  	for (i = 0; i < XE_SOC_NUM_IEH; i++)
>  		xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base, i),
>  				(HARDWARE_ERROR_MAX << 1) + 1);

Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Thanks,
Aravind.
