Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A36F99368
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 11:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166CA10F09C;
	Thu, 23 Apr 2026 11:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSVETb79";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05DA10F09C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 11:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776942110; x=1808478110;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m9uFgkznntZpZ/OJ25Z8BexMk2qLWoONrVNs8XYgBIY=;
 b=GSVETb79hXN9j/xzBv+OTUHnUrNhj1mZifRTI8zmadP/upE5kXVI+uDc
 Wd+vvAF/4rRv6kKgwJsZq6u3VU9l+SCG11Hab++DoAxzZd4enLNQoP3BN
 GTO1ZRuKYPTX+olGmexqBonQHknvxLKYenebaC/vktt/4KksHKntMI5aS
 BgIySR0IdMkP3GDZywIDulYkvzqJ+3proUpa9C7iYOxLytz6kZLjHJ/lv
 SEdpfl8E7EIb7o5WeVlE7deI7rhGSX/DfEWudj1d4GYEOfSk2bGxaasmA
 1V7zrffD9ZBnfeuGFTg1zL+vibLP4o4805laHfOc4kVrQS6JFRJ91NvOH Q==;
X-CSE-ConnectionGUID: LgN+pQ48SM2ocEmh62Pesw==
X-CSE-MsgGUID: Uhgj/RIpQi6Va6kiK0TFxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="81516073"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="81516073"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:01:49 -0700
X-CSE-ConnectionGUID: tO53ibjUSpat0ZdMHuSTig==
X-CSE-MsgGUID: HBP4sqbcRU2z2uUeZIjCxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="228284456"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 04:01:44 -0700
Date: Thu, 23 Apr 2026 13:01:42 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v3 3/5] drm/xe/xe_ras: Add helper to clear error counter
Message-ID: <aen8FiaftUl2o9uj@black.igk.intel.com>
References: <20260421145056.253300-7-riana.tauro@intel.com>
 <20260421145056.253300-10-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421145056.253300-10-riana.tauro@intel.com>
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

On Tue, Apr 21, 2026 at 08:20:59PM +0530, Riana Tauro wrote:
> Add structures and helper function to clear error counter value.

...

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
> +int xe_ras_clear_error_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,

Same comment as last patch.

> +			       u32 error_id)
> +{
> +	struct xe_ras_clear_counter_response response = {0};
> +	struct xe_ras_clear_counter_request request = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_error_class *error_class = &request.error_class;
> +	enum xe_sysctrl_gfsp_cmd cmd = XE_SYSCTRL_CMD_CLEAR_COUNTER;
> +	size_t rlen;
> +	u32 status;

Shouldn't this be int? Or why not just reuse ret?

> +	int ret;
> +
> +	error_class->common.severity = drm_to_xe_ras_severity[severity];
> +	error_class->common.component = drm_to_xe_ras_component[error_id];
> +
> +	prepare_sysctrl_command(&command, cmd, &request, sizeof(request),
> +				&response, sizeof(response));
> +
> +	guard(xe_pm_runtime)(xe);
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: cmd %d error ret %d\n", cmd, ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: cmd %d response size mismatch. Expected %zu, got %zu\n",
> +		       cmd, sizeof(response), rlen);
> +		return -EIO;
> +	}
> +
> +	status = xe_ras_status_to_errno[response.status];
> +	if (status) {
> +		xe_err(xe, "sysctrl: cmd %d failed %d\n", cmd, status);
> +		return status;

Hm, so I'm wondering if this is useful to end user? Note, anything exposed
to the user will be hard to change once in place.

> +	}
> +
> +	return 0;
> +}

...

> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -14,9 +14,11 @@
>   * enum xe_sysctrl_gfsp_cmd  - Sysctrl Command ID's for GFSP group
>   *
>   * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
> + * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>   */
>  enum xe_sysctrl_gfsp_cmd  {
> -	XE_SYSCTRL_CMD_GET_COUNTER = 0x03
> +	XE_SYSCTRL_CMD_GET_COUNTER = 0x03,

Redundant churn. Please add comma in original patch.

> +	XE_SYSCTRL_CMD_CLEAR_COUNTER = 0x04

Also please align with tabs for readability.

Raag

>  };
>  
>  enum xe_sysctrl_group {
> -- 
> 2.47.1
> 
