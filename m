Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE77EBFD21
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 09:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A8310E3A0;
	Mon, 13 Apr 2026 09:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cyhtDGXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056A310E3A0
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 09:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776072325; x=1807608325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2XAkuHNhUHx19rNh26rX5Z9RNkr6uuJ86lq2sNo+uK0=;
 b=cyhtDGXIk+2wwE8VR/BWkdrEP/AVuoN306Ds1idjOsKi+upq/74Y3wEQ
 tfEMG3QDx10CKYSWwJRHJOoI3JI1xFL3ASFDAUYdX0vagaiOcPSgdt1DY
 UL5YYZ6DOFoZZU/cR5JuyGzqIrex7/OrvJoJZQbSa6Ddj6iByukrxdlxd
 eTub7ySWuQ0VF3DUPiTihrsRSb8n+wxJXowAY65eUbr2eoB5e4adxzBb+
 1UmLF0KLno/RZjVuzThg6QPJ05nPbstXx5WRAUvcTmoAEt+0G9qyuqSQ2
 YyI16RVdBRd6cEYjg1u/7qEf6snT4Enzdm295M1KBBaQROgqi8saLQwTJ Q==;
X-CSE-ConnectionGUID: 3r/8dBmmQH6HkEikiRiFug==
X-CSE-MsgGUID: j2YBz3gjRpy12QYhk6ZRDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="77072233"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="77072233"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:25:24 -0700
X-CSE-ConnectionGUID: UR6X3pklT0yEcNk0M4zPqQ==
X-CSE-MsgGUID: bvxK9jGgSbyWu05YDyb8yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="233772038"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:25:22 -0700
Date: Mon, 13 Apr 2026 11:25:19 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v2 4/5] drm/xe/xe_ras: Add helper to clear error counter
Message-ID: <ady2f_SEVmooxt7u@black.igk.intel.com>
References: <20260406145440.2016065-7-riana.tauro@intel.com>
 <20260406145440.2016065-11-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406145440.2016065-11-riana.tauro@intel.com>
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

On Mon, Apr 06, 2026 at 08:24:43PM +0530, Riana Tauro wrote:
> Add helper function to clear error counter value.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> Note: This will be integrated with drm_ras implementation
> once clear-error-counter patch is merged.
> https://patchwork.freedesktop.org/series/163019/
> ---
>  drivers/gpu/drm/xe/xe_ras.c | 48 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h |  2 ++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index b5fdad2c801d..56abcb9783a4 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -121,3 +121,51 @@ int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_s
>  	guard(xe_pm_runtime)(xe);
>  	return get_error_counter(xe, &error_class, value);
>  }
> +
> +/**
> + * xe_ras_clear_error_counter() - Clear error counter value
> + * @xe: xe device instance
> + * @severity: Error severity level to be cleared
> + * @error_id: Error component to be cleared
> + *
> + * This function clears the value of a specific RAS error counter based on
> + * the provided severity and component.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_clear_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
> +			       u32 error_id)
> +{
> +	struct xe_ras_clear_counter_response response = {0};
> +	struct xe_ras_clear_counter_request request = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_error_class *error_class = &request.error_class;
> +	size_t rlen;
> +	int ret;
> +
> +	error_class->common.severity = drm_to_xe_ras_severity[severity];
> +	error_class->common.component = drm_to_xe_ras_component[error_id];
> +
> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_CLEAR_COUNTER, &request, sizeof(request),
> +				&response, sizeof(response));

Nit: Probably worth having a set_error_counter(), we never know when might
need it :D

Raag

> +
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "[RAS]: Sysctrl response size mismatch. Expected %zu, got %zu\n",
> +		       sizeof(response), rlen);
> +		return -EINVAL;
> +	}
> +
> +	if (response.status) {
> +		xe_err(xe, "[RAS]: Sysctrl Failed to clear counter %u\n", response.status);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index e468c414148e..19e0e649d55f 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -12,5 +12,7 @@ struct xe_device;
>  
>  int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
>  			     u32 error_id, u32 *value);
> +int xe_ras_clear_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
> +			       u32 error_id);
>  
>  #endif
> -- 
> 2.47.1
> 
