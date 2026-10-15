Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50581CC6B3C
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 10:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110D410EBC4;
	Thu, 15 Oct 2026 10:36:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B12210EBC1
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792060567; x=1823596567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=YgFplg8wJCzvaUkYkJEKXM4wGpJw5TeueUi0iqB3rh0=;
 b=X824vzSPXDr9sTkNhHD35RkXlNGVleh9GnY1pOA3k5lCgGVCQIWWKmyv
 Mq4SruCAray7j6zYN4WOcUATkaug4e0hXR70kzJd4Ot8qrlu+BtAJe/EM
 USUOz7XO2lrKEES3TTTfm4UgUojz4N+TWg0Ft9Vow8xdmfIw65mx2dPxN
 vN98d8YBqV4G2a9n2LfSdAqvxlIOI93jQE9FrHfsLMpMkZqreMmhRq8Fz
 CSsw0Ej1Ji1OiKEV6jFh1NVw2QPcxuPnBALaiSyKwTBkg7fBrFVnoH7cG
 QAwYEFBFeLRpKuowl+Kjlfy/2gLp8230OmrDlP8wWuOOnsjZ/iq02X8KZ Q==;
X-CSE-ConnectionGUID: /13I+pO7RLW0TN4lPv6vFA==
X-CSE-MsgGUID: IDl8L3ilSiytYgj6JsTluw==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="835123"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="835123"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:36:07 -0700
X-CSE-ConnectionGUID: rBPGaLVRQkWeSWh/e99yoQ==
X-CSE-MsgGUID: t/Am4kuGSzyBTcKfqWmLhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1986079"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:36:04 -0700
Date: Thu, 15 Oct 2026 12:36:00 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, himal.prasad.ghimiray@intel.com,
 arvind.yadav@intel.com, syed.abdul.muqthyar.ahmed@intel.com,
 nitin.r.gote@intel.com, pravalika.gurram@intel.com
Subject: Re: [PATCH v4 07/12] drm/xe/cper: Log CPER records for aggregate
 counter retrieval
Message-ID: <atCskNwSDQC95paq@black.igk.intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-21-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009104602.1075405-21-badal.nilawar@intel.com>
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

On Fri, Oct 09, 2026 at 04:16:10PM +0530, Badal Nilawar wrote:
> Log CPER records for aggregate counter retrieval from userspace when
> cper_on_query sysfs is enabled.

...

> -static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> -				const struct xe_ras_error_class *error_class)
> +/**
> + * xe_cper_emit_counter() - Emit CPER records for an already fetched error counter
> + * @xe: The &xe_device
> + * @cper_sev: CPER severity
> + * @sigid: Error signature identifier
> + * @error_class: RAS error class of the counter
> + * @resp: Counter response returned by firmware for @error_class
> + *
> + * Build and emit CPER records from @resp, including any info queue data.
> + * Must be called from a sleepable context with a runtime PM reference held.
> + */
> +void xe_cper_emit_counter(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +			  const struct xe_ras_error_class *error_class,
> +			  const struct xe_ras_get_counter_response *resp)
>  {
>  	struct xe_cper_einfo_entry *einfo_arr = NULL, *entries;
> -	struct xe_ras_get_counter_response local_resp;
>  	struct xe_cper_einfo_entry single = {};
>  	u32 einfo_count = 0, count, i;
>  
> -	/* Fetching the counter sends a sysctrl command */
> +	if (!is_hw_sigid(sigid))

Nack. No guardrails for abusers, they are expected to fail.

> +		return;
> +
> +	/* Draining the info queue sends sysctrl commands */
>  	might_sleep();
>  	xe_device_assert_mem_access(xe);
>  
> -	if (xe_ras_get_counter_response(xe, error_class, &local_resp)) {
> -		xe_err(xe, "CPER: failed to get counter, skipping record\n");
> -		return;
> -	}
> -
>  	/* Without info queue data, emit a single record from the counter itself */
>  	single.hdr.error_class = *error_class;
> -	single.hdr.counter = local_resp.value;
> -	single.timestamp = local_resp.timestamp;
> +	single.hdr.counter = resp->value;
> +	single.timestamp = resp->timestamp;
>  	entries = &single;
>  	count = 1;
>  
> -	if (local_resp.has_info_queue) {
> -		einfo_arr = xe_prepare_cper_error_info(xe, &local_resp, error_class, &einfo_count);
> +	if (resp->has_info_queue) {
> +		einfo_arr = xe_prepare_cper_error_info(xe, resp, error_class, &einfo_count);
>  		if (einfo_arr) {
>  			entries = einfo_arr;
>  			count = einfo_count;
> @@ -425,6 +436,23 @@ static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigi
>  	free_einfo_arr(einfo_arr, einfo_count);
>  }
>  
> +static void xe_cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
> +				const struct xe_ras_error_class *error_class)
> +{
> +	struct xe_ras_get_counter_response resp;
> +
> +	/* Fetching the counter sends a sysctrl command */
> +	might_sleep();
> +	xe_device_assert_mem_access(xe);
> +
> +	if (xe_ras_get_counter_response(xe, error_class, &resp)) {
> +		xe_err(xe, "CPER: failed to get counter, skipping record\n");
> +		return;
> +	}
> +
> +	xe_cper_emit_counter(xe, cper_sev, sigid, error_class, &resp);
> +}

This is how I think it should've been introduced in the original
patch, so we don't churn here.

...

> @@ -616,6 +649,11 @@ int xe_ras_get_counter(struct xe_device *xe, u8 severity, u8 component, u32 *val
>  		return ret;
>  
>  	*value = response.value;
> +
> +	if (READ_ONCE(xe->cper.on_query))

Following the comments on patch 2, this condition will now be passed as
a bool argument to get_counter(). Based on which, it will go on to call
xe_cper_emit_counter().

The callers that aren't interesed in the entire response will pass
explicit false to get_counter(), so cper isn't emitted in those cases.

Raag

> +		xe_cper_emit_counter(xe, ras_sev_to_cper_sev(counter.common.severity),
> +				     ras_comp_to_hw_sigid(counter.common.component),
> +				     &counter, &response);
>  	return 0;
>  }
>  
> @@ -1067,4 +1105,8 @@ void xe_ras_init(struct xe_device *xe)
>  	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>  	if (ret)
>  		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
> +
> +	ret = xe_cper_sysfs_init(xe);
> +	if (ret)
> +		xe_err(xe, "Failed to create cper_on_query sysfs, err=%d\n", ret);
>  }
> -- 
> 2.54.0
> 
