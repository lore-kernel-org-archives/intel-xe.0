Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873F5E7B5F9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 12:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEDC10E36C;
	Wed,  4 Oct 2023 12:08:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C8C10E116
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696421311; x=1727957311;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=d1nsY2bHjO03UjHi9NbyV8nHsuVAYMd/pXYlOXSf1II=;
 b=bWYvf8GySVvvnS88dHTXE9IgQPPtkhg3hBz4c3HJiOmFMV4rLHRIJeoj
 kO6wMyogDRGwwybg9RuTzSG1VltSj3TlivwaLsTEj4PqPyhCDXED2l+vQ
 z54dHW4yCU/F0ASJyvu1iIXCd8GhJH5svHJSFLM42oP25g/aW4/2qlIrk
 cieRrLlnfUgobsFRetLvbfLDyC08U9JO12wWER7E6EpT5O/zJfKE++BWW
 YErogNp9PS8M6TlBG5KOm4d/jQf4cVEeP1J95ifJQpyEEQ9CpLvuNOh+S
 Z3WzSxFes8pdJCRDhqPuNwltKLZ28/N6PNGkkQXZEgRj37cJuTZCFU8YW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449643617"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="449643617"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="875076136"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="875076136"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 05:08:30 -0700
Message-ID: <c9716f25-735c-37fa-dd60-572fd8c75f90@linux.intel.com>
Date: Wed, 4 Oct 2023 17:41:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-10-himal.prasad.ghimiray@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20230927114627.136925-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 09/11] drm/xe: Handle MDFI error severity.
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


On 27/09/23 17:16, Himal Prasad Ghimiray wrote:

missing commit message.

Thanks,
Aravind.
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_hw_error.c             | 16 ++++++++++++++--
>  2 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> index 04701c62f0d9..8a5f6cd29304 100644
> --- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
> @@ -48,4 +48,11 @@
>  								(base) + _SOC_GCOERRSTS, \
>  								(base) + _SOC_GNFERRSTS))
>  
> +#define LOCAL_FIRST_IEH_HEADER_LOG_REG			XE_REG(0x2822b0)
> +#define MDFI_SEVERITY_FATAL		0x00330000
> +#define MDFI_SEVERITY_NONFATAL		0x00310000
> +#define MDFI_SEVERITY(x)				((x) == HARDWARE_ERROR_FATAL ? \
> +								MDFI_SEVERITY_FATAL : \
> +								MDFI_SEVERITY_NONFATAL)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index aeece9e705dc..dcf395bd985f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -608,7 +608,7 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  	const struct err_msg_cntr_pair *soc_mstr_lcl_err_reg;
>  	const struct err_msg_cntr_pair *soc_slave_glbl_err_reg;
>  	const struct err_msg_cntr_pair *soc_slave_lcl_err_reg;
> -	u32 errbit, base, slave_base;
> +	u32 errbit, base, slave_base, ieh_header;
>  	int i;
>  
>  	const char *hwerr_to_str = hardware_error_type_to_str(hw_err);
> @@ -684,9 +684,21 @@ xe_soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  		drm_info(&tile_to_xe(tile)->drm, HW_ERR "Tile%d SOC_LOCAL_ERR_STAT_MASTER_REG_%s:0x%08lx\n",
>  			 tile->id, hwerr_to_str, lcl_errstat);
>  
> -		for_each_set_bit(errbit, &lcl_errstat, 32)
> +		for_each_set_bit(errbit, &lcl_errstat, 32) {
> +			if (errbit == 4 || errbit == 6) {
> +				ieh_header = xe_mmio_read32(gt, LOCAL_FIRST_IEH_HEADER_LOG_REG);
> +				drm_info(&tile_to_xe(tile)->drm, HW_ERR "Tile%d LOCAL_FIRST_IEH_HEADER_LOG_REG:0x%08x\n",
> +					 tile->id, ieh_header);
> +
> +				if (ieh_header != MDFI_SEVERITY(hw_err)) {
> +					lcl_errstat &= ~REG_BIT(errbit);
> +					continue;
> +				}
> +			}
> +
>  			xe_soc_log_err_update_cntr(tile, hw_err, errbit,
>  						   soc_mstr_lcl_err_reg);
> +		}
>  
>  		xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err), lcl_errstat);
>  	}
