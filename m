Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A350CCA463
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 03:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821681125AB;
	Fri, 16 Oct 2026 03:01:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D41510E248
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 03:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792119697; x=1823655697;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Qmyz+xuvE1lKcJ1M+84PA2yH896uxdcdWzFnddZkEOg=;
 b=UryJfm9xLO5LfquKWxJ197ht7sG2YE6kcwN/RXjr27x/ibsoQDoIJhMD
 7a7AycQLoSx0ktEco32gVNxySqjH/3DwZRjeML9SrP6N8Wx0Fd8sfi/hw
 GUlk7NtPmDgPbjWJT0CsuJ52KhD7Kt3iwmwKIHUepLLKnXiV808kvJhRa
 PQz/KiHn/lxm6ItgbDUw36luOxDHV6TsHV1Dq4mRofwOzpRrc2gW8WvUZ
 3UqObxVr21NdPGWnWW5MuQ/A1Ik/xbAe8KXcxuKWnEA4hHdPRbKZyLQQZ
 baS4GD9SJbz+UwJ9KiT7YRJ2Gbfechgc9tsVhq+bcAf5XDhBWmcV3m5KV g==;
X-CSE-ConnectionGUID: X8ppxx7mRhqLxUeCPU7alQ==
X-CSE-MsgGUID: W4AhxsV7SDuM0PC95B7t6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="915560"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="915560"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 20:01:37 -0700
X-CSE-ConnectionGUID: BEH6UyZ3RSuO3v0K+HMHJA==
X-CSE-MsgGUID: pq9bKEguS8O8ktovWshMQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2211440"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 20:01:33 -0700
Date: Fri, 16 Oct 2026 05:01:30 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 11/12] drm/xe/xe_ras: Report soc internal errors using
 SIGID
Message-ID: <atGTiu3pQb-6fZFv@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-25-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009104602.1075405-25-badal.nilawar@intel.com>
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

On Fri, Oct 09, 2026 at 04:16:14PM +0530, Badal Nilawar wrote:
> Use xe_log_* helpers to report soc internal errors.
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 6647300c7f17..af2970941b59 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -366,7 +366,6 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  {
>  	struct xe_ras_soc_error *info = (void *)arr->details;
>  	struct xe_ras_soc_error_source *source = &info->source;
> -	struct xe_ras_error_class *counter = &arr->counter;
>  
>  	if (source->csc) {
>  		struct xe_ras_csc_error *csc_error = (void *)info->details;
> @@ -380,9 +379,8 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  		 * is required.
>  		 */
>  		if (csc_error->hec_fw_error) {
> -			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",

Nit: Use fixed format (0x%08x) for readability. It's also easier to
parse (just in case).

> -			       sev_to_str(counter->common.severity),
> -			       csc_error->hec_fw_error);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "CSC error detected: 0x%x\n", csc_error->hec_fw_error);
>  			xe_survivability_mode_runtime_enable(xe);
>  			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>  		}
> @@ -390,9 +388,9 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>  		struct xe_ras_ieh_error *ieh_error = (void *)info->details;
>  
>  		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
> -			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",

Ditto.

Raag

> -			       sev_to_str(counter->common.severity),
> -			       ieh_error->global_error_status);
> +			xe_log_comp_fatal(xe, SOC_INTERNAL, &arr->counter, sizeof(arr->counter),
> +					  "PUNIT error detected: 0x%x\n",
> +					  ieh_error->global_error_status);
>  			punit_error_handler(xe);
>  			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
>  		}
> -- 
> 2.54.0
> 
