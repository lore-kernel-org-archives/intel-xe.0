Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE2FCC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 02:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58D510E1D5;
	Fri, 16 Oct 2026 02:55:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0415E10E1D5
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 02:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792119335; x=1823655335;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ri/DYnNK5ejKb9hEK6mwjnTOmFJNahf/HcFAW7QnJdc=;
 b=gmXiezUU1UiEvZpjEF7d3QO5UCn/OsK8r+fuJ0fmzXI4ZsWoFJ7w48Ef
 xBk3qsQXA96w6OH7KMI5+O9kn2EsBFvZXWuvD3wzMJSoOgE7KXXwIVqRO
 FMl/l/ySxz8t3HT+mCsKgXTnrW6fxmw7xcM/4c2siVxnNGrkPgfrwp6Wr
 qwNYscP1Vb60eZbZwSQHcWclbMcBTHGseskcW0eZywN7952EDO+6JfA2j
 IiTGKjz/ndxRhudadA09hbe9/VWx/Tpq3KhYU0as1l6mjP1OMD4+Ys9PM
 wM2uzW4wJ+21dQv7URSZWLcw+SujCjD8Qo28cXpq3uGSSYrwlHZmIF9Fu w==;
X-CSE-ConnectionGUID: xiqnmnQMT8Wp3HYEsI9wqQ==
X-CSE-MsgGUID: 6+cuMpoOTh2Q97UE+OMqAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="885273"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="885273"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 19:55:35 -0700
X-CSE-ConnectionGUID: 9ortg/vXSg2FCF3qmtdpZw==
X-CSE-MsgGUID: T4tN19JOSSWHgyDYwy6qMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1744803"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 19:55:32 -0700
Date: Fri, 16 Oct 2026 04:55:28 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 10/12] drm/xe/xe_ras: Report core compute errors using
 SIGID
Message-ID: <atGSII0Pt3niA6Ll@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-24-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009104602.1075405-24-badal.nilawar@intel.com>
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

On Fri, Oct 09, 2026 at 04:16:13PM +0530, Badal Nilawar wrote:
> Use xe_log_* helpers to report core compute errors.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v2:
>   - Pass RAS firmware reported severity to xe_log
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 8ed4a6992ef1..6647300c7f17 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -332,21 +332,27 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
>  	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
>  }
>  
> -static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
> +static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>  {
>  	struct xe_ras_compute_error *error_info = (void *)arr->details;
> +	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
>  	u8 uncorr_type;
>  
>  	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
>  
>  	/* Request a reset if error is global */
> -	if (uncorr_type == GLOBAL_UNCORR_ERROR)
> +	if (uncorr_type == GLOBAL_UNCORR_ERROR) {
> +		xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
> +			    "Global uncorrectable error detected\n");
>  		return XE_RAS_RECOVERY_ACTION_RESET;
> +	}
>  
>  	/*
>  	 * No action needed for other errors.
>  	 * Local errors are recovered using an engine reset by GuC.
>  	 */
> +	xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
> +		    "Other compute errors\n");

'Other' errors isn't telling me anything, no they are documented here.
If we don't know what they are, use 'unknown' or something more specific.

Raag

>  	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>  }
>  
> @@ -592,7 +598,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>  
>  			switch (component) {
>  			case XE_RAS_COMP_CORE_COMPUTE:
> -				action = handle_core_compute_errors(arr);
> +				action = handle_core_compute_errors(xe, arr);
>  				break;
>  			case XE_RAS_COMP_SOC_INTERNAL:
>  				action = handle_soc_internal_errors(xe, arr);
> -- 
> 2.54.0
> 
