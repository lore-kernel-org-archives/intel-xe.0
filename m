Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C72A606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 12:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N+JeDrhh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EF010E028;
	Mon, 26 Oct 2026 12:47:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C5210E028
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 12:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793018872; x=1824554872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DVgTvouIwxvfjx2pdPchPy45vu3XKtR/W0BBip2m75c=;
 b=N+JeDrhhp8HE8eoLN9TtPcrps1eDWNBJn+Nx9KVhLHSdtcsDAAnXHh7G
 Ooc18qQ+pae2A9kqOph9RDFG5p1PGdvpuObnk9KV/TfoIiqfBrA0BoDsB
 6qBsKNADBOl/4P2JxknEpHxSjQc8nY+aHGplWn3YCSqtTqHKslLWEKBDY
 8b1Ivtisvog8jkBMKssu6aMwJv/UVNngCUFPgPOgccy6rzpNRBDLUXS9j
 3vlYiah9mzf8zSkW7jnyXcg2tP2blJxsgiWHy6dFUMd3IP7TX7pYcbhXH
 tIV3FlBDamMRFCxgXLHAr/S/Epa0IReBdC831KgrcVQOpCBZyMIn0y2Ut A==;
X-CSE-ConnectionGUID: IXLnuOlsSuKhxMAjapTWtw==
X-CSE-MsgGUID: vLMJZWZNTAiN7DGRjlG16w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1689543"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1689543"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 05:47:51 -0700
X-CSE-ConnectionGUID: gI15MO4NSYmgsDdyC1xVBw==
X-CSE-MsgGUID: drYAICKMRQOl/8pByGpucQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4207675"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 05:47:49 -0700
Date: Mon, 26 Oct 2026 13:47:46 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v5 07/13] drm/xe/xe_ras: Report device memory errors
 using SIGID
Message-ID: <at9L8jjWN13Z7yy-@black.igk.intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-22-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023043422.681260-22-badal.nilawar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 10:04:29AM +0530, Badal Nilawar wrote:
> Use xe_log_comp_info helper to report device memory errors using the
> corresponding SIGID.
> 
> Example:
> 	xe 0000:03:00.0: [drm] SIGID=202 (020100020008002000300000)
> DEVICE_MEMORY: Double-bit ECC error detected at sw address 0x63000
> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v5:
>   - Log unknown memory errors
>   - Add example log in commit message (Raag)
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 95e87c635b04..5ebfc6e8dfc7 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -643,6 +643,7 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>  {
>  	struct xe_ras_memory_error *info = (void *)arr->details;
> +	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
>  	int ret;
>  
>  	/*
> @@ -654,17 +655,30 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>  	 */
>  	switch (info->category) {
>  	case XE_RAS_MEMORY_POISON:
> -		xe_info(xe, "[RAS]: Poison error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Poison error detected\n");
>  		break;
>  	case XE_RAS_MEMORY_DATA_PARITY:
> -		xe_info(xe, "[RAS]: Data parity error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Data parity error detected\n");
>  		break;
>  	case XE_RAS_MEMORY_DB_ECC:
>  		ret = handle_page_offline(xe, info->sw_address, true);
> -		if (ret)
> +		if (ret) {
> +			xe_log_comp(xe, cper_sev, DEVICE_MEMORY,
> +				    &arr->counter, sizeof(arr->counter),
> +				    "Failed to recover double-bit ECC error at sw address 0x%llx\n",
> +				    info->sw_address);

Isn't handle_page_offline() already logging this? If no, shouldn't we
try to consolidate?

>  			return XE_RAS_RECOVERY_ACTION_RESET;
> +		}
> +
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Double-bit ECC error at sw address 0x%llx\n",
> +				 info->sw_address);

Ditto.

Raag

>  		break;
>  	default:
> +		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +			    "Unknown error detected\n");
>  		return XE_RAS_RECOVERY_ACTION_RESET;
>  	}
>  
> -- 
> 2.54.0
> 
