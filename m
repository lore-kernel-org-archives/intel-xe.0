Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC18606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eC/bWzeg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA4A10E028;
	Mon, 26 Oct 2026 12:57:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E78010E147
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 12:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793019432; x=1824555432;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MguL4gyFp0IzfT8xGLgrOsCa2GGOPYkv8U9WuZ1yZIA=;
 b=eC/bWzegW5E2oi2Mso1p7vQiZooSzn8aWnyquNRcX6MD1siax4QbS5jb
 x5Wt/KxvJY235rOsOB8dyBj9U60SQOcOknVrNXJwZ3l45zHC2Ro75u2Tw
 956ZpPFpKoLDZzMBsuvJ0fkmR8kpa2mTRHwB4nQZ209jBRtZE6Y4pKORr
 V+WdnaObjN5FvNso7cVFVqlG5S69sizmH+2PhEZXiwnvthzkAgl67FbVT
 P2RYNve8AhahQzNFQud3zzYvxsSXEh8yBI60E6Mf6Q41+bDdAGNYjLSjq
 3CnRITBl1EbvmWzTbn5YbnrJIvqED6Bsq2tPLDL4VT6I9RvGyILAibw+b g==;
X-CSE-ConnectionGUID: VUrqlo7jQpSoJAldjFYHxw==
X-CSE-MsgGUID: OQEIfkudQGu80Foi1JXwGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1585821"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1585821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 05:57:12 -0700
X-CSE-ConnectionGUID: opssP4ZIRKWWrtXw0RcfiQ==
X-CSE-MsgGUID: WU3e8mjPTuq7GgIc+VJnRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4352752"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 05:57:08 -0700
Date: Mon, 26 Oct 2026 13:57:05 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v5 09/13] drm/xe/xe_ras: Report soc internal errors using
 SIGID
Message-ID: <at9OIcg1DJRF78UC@black.igk.intel.com>
References: <20261023043422.681260-15-badal.nilawar@intel.com>
 <20261023043422.681260-24-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023043422.681260-24-badal.nilawar@intel.com>
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

On Fri, Oct 23, 2026 at 10:04:31AM +0530, Badal Nilawar wrote:
> Use xe_log_* helpers to report soc internal errors.
> 
> Example:
> 	xe 0000:03:00.0: [drm] *ERROR* SIGID=205 FATAL
> (020600700000000000000000) [Hardware Error]: SOC_INTERNAL:
> PUNIT error detected: 0x00000002
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v5:
>   - Log unknown soc internal errors
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 1f94dd1fb91b..4408fc530900 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -608,7 +608,6 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  {
>  	struct xe_ras_soc_error *info = (void *)arr->details;
>  	struct xe_ras_soc_error_source *source = &info->source;
> -	struct xe_ras_error_class *counter = &arr->counter;
>  
>  	if (source->csc) {
>  		struct xe_ras_csc_error *csc_error = (void *)info->details;
> @@ -622,9 +621,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  		 * is required.
>  		 */
>  		if (csc_error->hec_fw_error) {
> -			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       csc_error->hec_fw_error);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "CSC error detected: 0x%08x\n", csc_error->hec_fw_error);
>  			xe_survivability_mode_runtime_enable(xe);
>  			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>  		}
> @@ -632,15 +630,19 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
>  
>  		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
> -			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
> -			       sev_to_str(counter->common.severity),
> -			       ieh_error->global_error_status);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "PUNIT error detected: 0x%08x\n",
> +					  ieh_error->global_error_status);
>  			punit_error_handler(xe);
>  			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>  		}
>  	}
>  
>  	/* For other SoC internal errors, request a reset as recovery mechanism */
> +	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), SOC_INTERNAL,
> +		    &arr->counter, sizeof(arr->counter),
> +		    "Unknown error detected (csc=%u ieh=%u)\n",

If the error is unknown, we may want to print the entire source using 0x%08x.

Raag

> +		    source->csc, source->ieh);
>  	return XE_RAS_RECOVERY_ACTION_RESET;
>  }
>  
> -- 
> 2.54.0
> 
