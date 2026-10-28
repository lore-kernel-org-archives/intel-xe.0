Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85F606A31F
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 17:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qi5imeQt
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1365D10E5BE;
	Wed, 28 Oct 2026 17:17:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CFD10E6B6
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793207836; x=1824743836;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=z6EdwfhlJ/GeENiRXR/A2G+kQbFbjIsPp8tIffkntZc=;
 b=Qi5imeQtQ43z1d4j0r/G8iB07mEeTm06uDmDYfmR9WIeXdrN2DQ3plqA
 Ngg8pw5BgMH6ca3ehIciGM7N6MaspDpgsaf7X95oyP4sNmzBRDXmCw98S
 qYhObAXvMXuKL2VTG26+sn4pxaBnX69zZg2N3mTZsRu62r3pRq3XCaEj0
 Ob2M3T8R8M7Jg09JSQcGp6PmhBhabuVIYEXyGbFsD9n9uLwJTA3LDv00i
 D9NDRRxLX0zkSryEsjb7wl/LBfCGlu2Mx3eLXeseqh2kFlOoj1hTCXLpI
 fLDz+iK8bLs++nejEXMD+8MDv750gDSpCbfHoo6dFCwlwvRdinGQo6qDv g==;
X-CSE-ConnectionGUID: UUhPH5C3TEGiciO0K35L4w==
X-CSE-MsgGUID: +ynUvsqpTqG0ExQ0ClL3ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2031549"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="2031549"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:17:16 -0700
X-CSE-ConnectionGUID: chfdGV9cRR6WC/27XC3yVA==
X-CSE-MsgGUID: pzUEkNn2RlC8lGq+X9k7uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4784282"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:17:13 -0700
Date: Wed, 28 Oct 2026 18:17:10 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com
Subject: Re: [PATCH v6 09/10] drm/xe/xe_ras: Report soc internal errors using
 SIGID
Message-ID: <auIuFsYCyl5m2mrG@black.igk.intel.com>
References: <20261028095723.734387-12-badal.nilawar@intel.com>
 <20261028095723.734387-21-badal.nilawar@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028095723.734387-21-badal.nilawar@intel.com>
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 03:27:33PM +0530, Badal Nilawar wrote:
> Use xe_log_* helpers to report soc internal errors.
> 
> Example:
> 	xe 0000:03:00.0: [drm] *ERROR* SIGID=205 FATAL
> (020600700000000000000000) [Hardware Error]: SOC_INTERNAL:
> PUNIT error detected: 0x00000002
> 
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v6:
>   - Print entire xe_ras_soc_error_source for unknown errors (Raag)
> v5:
>   - Log unknown soc internal errors
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d7789beb2f6f..5eeccc920d7c 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -609,7 +609,7 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  {
>  	struct xe_ras_soc_error *info = (void *)arr->details;
>  	struct xe_ras_soc_error_source *source = &info->source;
> -	struct xe_ras_error_class *counter = &arr->counter;
> +	u32 raw_source;

BUILD_BUG_ON(sizeof(raw_source) != sizeof(*source));

>  	if (source->csc) {
>  		struct xe_ras_csc_error *csc_error = (void *)info->details;
> @@ -623,9 +623,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
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
> @@ -633,15 +632,19 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
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
> +	memcpy(&raw_source, source, sizeof(raw_source));
> +	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), SOC_INTERNAL,
> +		    &arr->counter, sizeof(arr->counter),
> +		    "Unknown error detected (source=0x%08x)\n", raw_source);

The logs are already too busy with all the parentheses. Rather,
make this consistent with CSC and PUNIT error format, i.e.

	"Unknown error detected: 0x%08x\n"

Raag

>  	return XE_RAS_RECOVERY_ACTION_RESET;
>  }
>  
> -- 
> 2.56.0
> 
