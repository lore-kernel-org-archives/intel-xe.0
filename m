Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD22ECA9ED0
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 09:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D56810E484;
	Mon, 12 Oct 2026 09:07:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B756A10E484
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791796047; x=1823332047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Bmc0SpNbLKX56zE6Az3uK8LcGFyk/BwibO2RO4RXLDw=;
 b=HLsCGD0qaJdwa6D5DwP9YK1ocqb3+eaJLo1q4ShWFhDE8qJgr+nQ518d
 tibNPlKpQBCa8pBm7r2zOnHpCR/auEhEQC/Slokrxj4GjRvKPuQro824p
 5cRiL87BGZv5DkeciH6N48y+VreovVR/Kf3Fo3OUg5HskfxrsueI1nhwa
 kgzIBhwmYG1EBtNaD+qBLzmKSpVewECIuYX0YgwCcDoXsTEgrxIXU6J69
 iykAhz60Jlsx9T6dSlSA1pTZp3HHoBRDg+hFKncSi3KPkKpZAvzysq0cb
 J1utbM0yOT8NavFoXmnps4J4zpVrn414fBgsomym6AmLWmiXi8Fc0Abrp Q==;
X-CSE-ConnectionGUID: jKCdSyCbQtydxCRiGnT3Bw==
X-CSE-MsgGUID: qvhWvkP+RrytM/ynq689WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="489112"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="489112"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:07:26 -0700
X-CSE-ConnectionGUID: B8jQLenNTjWEggKZjdaRCw==
X-CSE-MsgGUID: PtdZLqaORUqXAGMsirxG+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2643986"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 02:07:23 -0700
Date: Mon, 12 Oct 2026 11:07:20 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 02/12] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
Message-ID: <asyjSMUDo0XMX-U4@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-16-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009104602.1075405-16-badal.nilawar@intel.com>
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

On Fri, Oct 09, 2026 at 04:16:05PM +0530, Badal Nilawar wrote:
> Retrieve error counter record required to build a CPER record.
> 
> Assisted-by: Copilot:Claude-Opus-5.5
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
> v4:
>   - Drop redundant xe_ras_counter_is_valid() check (Raag)
>   - Add might_sleep() to assert that the caller is in a sleepable
>     context (sashiko)
>   - Add xe_device_assert_mem_access() to assert the outer runtime PM
>     wake reference requirement (sashiko)
> ---
>  drivers/gpu/drm/xe/xe_cper.c | 14 ++++++++++-
>  drivers/gpu/drm/xe/xe_ras.c  | 45 ++++++++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_ras.h  |  2 ++
>  3 files changed, 45 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index c5caa0e8f496..4f0ed5096aac 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -4,10 +4,13 @@
>   */
>  
>  #include <linux/err.h>
> +#include <linux/kernel.h>
>  #include <linux/minmax.h>
>  
>  #include "xe_cper.h"
>  #include "xe_device.h"
> +#include "xe_printk.h"
> +#include "xe_ras.h"
>  #include "xe_ras_types.h"
>  
>  static bool is_hw_sigid(enum xe_sigid sigid)
> @@ -18,7 +21,16 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>  static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>  				const struct xe_ras_error_class *error_class)
>  {
> -	/* TODO */
> +	struct xe_ras_get_counter_response local_resp;

Why 'local'? Do we have any other?

> +	/* Fetching the counter sends a sysctrl command */
> +	might_sleep();
> +	xe_device_assert_mem_access(xe);
> +
> +	if (xe_ras_get_counter_response(xe, error_class, &local_resp)) {

Make the naming consistent with existing code, i.e.
xe_ras_get_counter_response(xe, &counter, &response)

> +		xe_err(xe, "CPER: failed to get counter, skipping record\n");
> +		return;
> +	}
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a85735c57d5..5cfc9beff8c1 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -103,8 +103,6 @@ static const char * const gpu_health_states[] = {
>  };
>  static_assert(ARRAY_SIZE(gpu_health_states) == XE_RAS_HEALTH_MAX);
>  
> -static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value);
> -
>  static u8 drm_to_xe_ras_severity(u8 severity)
>  {
>  	switch (severity) {
> @@ -284,21 +282,21 @@ static void ras_usp_aer_init(struct xe_device *xe)
>  static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component)
>  {
>  	struct xe_ras_error_class counter = {0};
> +	struct xe_ras_get_counter_response response = {0};

Hm, not all users of get_counter() are interested in the entire response.
So why not have it wrapped? Perhaps something like

static get_counter()
{
	response = {0};
	
	ret = xe_ras_get_counter_response(xe, &counter, &response);
	if (ret)
		return ret;

	*value = response.value;
	return 0;
}

Tidy? ;)

>  	u8 drm_severity, drm_component;
> -	u32 value;
>  	int ret;
>  
>  	counter.common.severity = severity;
>  	counter.common.component = component;
>  
> -	ret = get_counter(xe, &counter, &value);
> +	ret = xe_ras_get_counter_response(xe, &counter, &response);
>  	if (ret)
>  		return;
>  
>  	drm_severity = xe_to_drm_ras_severity(severity);
>  	drm_component = xe_to_drm_ras_component(component);
>  
> -	xe_drm_ras_event(xe, drm_component, drm_severity, value);
> +	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
>  }
>  
>  static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
> @@ -433,19 +431,30 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  	}
>  }
>  
> -static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter, u32 *value)
> +/**
> + * xe_ras_get_counter_response() - Get error counter record
> + * @xe: Xe device instance
> + * @counter: RAS error class
> + * @out: Counter record retrieved

Nit: ... to be retrieved

> + * Retrieve the counter record of a specific error class from firmware.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
> +				struct xe_ras_get_counter_response *out)

'response'?

>  {
> -	struct xe_ras_get_counter_response response = {0};
>  	struct xe_ras_get_counter_request request = {0};
>  	struct xe_sysctrl_mailbox_command command = {0};
>  	struct xe_ras_error_common *common;
>  	size_t rlen;
>  	int ret;
>  
> +	memset(out, 0, sizeof(*out));

Nack. No modifying input data, the caller is responsible for this.

>  	request.counter = *counter;
>  
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_COUNTER,
> -				  &request, sizeof(request), &response, sizeof(response));
> +				  &request, sizeof(request), out, sizeof(*out));
>  
>  	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>  	if (ret) {
> @@ -453,19 +462,18 @@ static int get_counter(struct xe_device *xe, struct xe_ras_error_class *counter,
>  		return ret;
>  	}
>  
> -	if (rlen != sizeof(response)) {
> +	if (rlen != sizeof(*out)) {
>  		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
> -		       rlen, sizeof(response));
> +		       rlen, sizeof(*out));
>  		return -EIO;
>  	}
>  
> -	if (!ras_counter_is_valid(xe, &response.counter))
> +	if (!ras_counter_is_valid(xe, &out->counter))
>  		return -EBADMSG;
>  
> -	common = &response.counter.common;
> -	*value = response.value;
> +	common = &out->counter.common;
>  
> -	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", *value, comp_to_str(common->component),
> +	xe_dbg(xe, "[RAS]: get counter %u for %s %s\n", out->value, comp_to_str(common->component),
>  	       sev_to_str(common->severity));
>  
>  	return 0;
> @@ -596,12 +604,19 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>  int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *value)
>  {
>  	struct xe_ras_error_class counter = {0};
> +	struct xe_ras_get_counter_response response = {0};

With get_counter() intact, this won't be needed.

Raag

> +	int ret;
>  
>  	counter.common.severity = drm_to_xe_ras_severity(severity);
>  	counter.common.component = drm_to_xe_ras_component(component);
>  
>  	guard(xe_pm_runtime)(xe);
> -	return get_counter(xe, &counter, value);
> +	ret = xe_ras_get_counter_response(xe, &counter, &response);
> +	if (ret)
> +		return ret;
> +
> +	*value = response.value;
> +	return 0;
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 0b8669f28d56..84700ea63394 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -20,5 +20,7 @@ int xe_ras_get_threshold(struct xe_device *xe, u8 severity, u8 component, u32 *t
>  int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 threshold);
>  void xe_ras_init(struct xe_device *xe);
>  enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
> +int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
> +				struct xe_ras_get_counter_response *out);
>  
>  #endif
> -- 
> 2.54.0
> 
