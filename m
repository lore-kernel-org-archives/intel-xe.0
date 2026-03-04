Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2C3EF9008
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 16:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D1B10EA6E;
	Wed,  4 Mar 2026 16:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvvt3bEZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BBD210EA6E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772643158; x=1804179158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=luTQ2YdwK27wPW1xoiZTUKC8IKx0udaUxxPwbWEcDFI=;
 b=gvvt3bEZ6gPYx6Ed0m/h5nfF7PXbdQMmtWP4ap0JdEF0Ky0cCoFjUSYl
 SH5nzsZkpApCGC594jNrDhLwqxKgR/QaTHscnWfxSsmJFGficYuUw6uqG
 9VEsxaqspJiyGD8jGBez6bCr7otGnp8o9qWXHwsjfXjAFni5xRKsQEF98
 ng57YRNvENQM1RoOKebYi2QDp3bsBzATGONOhX45S60tnSZblf4QzboNI
 rN6qBe1e+Nxvbzd4clOodNyv3t6znkCEdkxPE7OJG1pkZ9YGrlbbNBvIv
 ExiNR51f0k1Drw0uUfQdOMFSl+tPJwEdxWnJDzzWofRMhxdvCDjH72m09 Q==;
X-CSE-ConnectionGUID: mVjteTBdSZeW5xR8YHBslQ==
X-CSE-MsgGUID: OChtxOa+TEGdBxx1eUduzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72908356"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="72908356"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:52:38 -0800
X-CSE-ConnectionGUID: Ll0I2w9/Se64Fgom9ZSgjA==
X-CSE-MsgGUID: cqK+NWClQoOX8hk6q5Vsjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="241411509"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:52:36 -0800
Date: Wed, 4 Mar 2026 17:52:33 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v2 08/11] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
Message-ID: <aahjUV9VPkT11a85@black.igk.intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-21-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302102155.4074630-21-riana.tauro@intel.com>
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

On Mon, Mar 02, 2026 at 03:52:03PM +0530, Riana Tauro wrote:
> Uncorrectable Core-Compute errors are classified into Global and Local
> errors.
> 
> Global error is an error that affects the entire device requiring a
> reset. This type of error is not isolated. When an AER is reported and
> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
> 
> A Local error is confined to a specific component or context like a
> engine. These errors can be contained and recovered by resetting
> only the affected part without distrupting the rest of the device.
> 
> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
> generated and GuC is notified of the error. The KMD then sets
> the context as non-runnable and initiates an engine reset.
> (TODO: GuC <->KMD communication for the error).

TODOs are more useful in the code, so we can actually find them ;)

> Since the error is contained and recovered, PCI error handling
> callback returns PCI_ERS_RESULT_RECOVERED.

...

> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_error_response response;
> +	enum xe_ras_recovery_action final_action;
> +	size_t rlen;
> +	int ret;
> +
> +	/* Default action */
> +	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
> +
> +	if (!xe->info.has_sysctrl)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	xe_ras_prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
> +				       &response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +		rlen = 0;
> +
> +		ret = xe_sysctrl_send_command(xe, &command, &rlen);
> +		if (ret || !rlen) {

We'd probably want them to be separate cases so we know what actually
happened. Besides, I think !rlen is redundant here since you're already
handling it below.

> +			xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +			goto err;
> +		}
> +
> +		if (rlen != sizeof(response)) {
> +			xe_err(xe, "[RAS]: Sysctrl response does not match len!!\n");

I'd print rlen as well.

> +			goto err;
> +		}
> +
> +		if (response.num_errors > XE_RAS_NUM_ERROR_ARR) {

I'd handle this as part of for loop below so we atleast have the chance
to recover based on initial errors.

> +			xe_err(xe, "[RAS]: Number of errors out of bound (%d)\n",
> +			       XE_RAS_NUM_ERROR_ARR);
> +			goto err;
> +		}
> +
> +		for (int i = 0; i < response.num_errors; i++) {

		for (int i = 0; i < response.num_errors && i < XE_RAS_NUM_ERROR_ARR; i++)

> +			struct xe_ras_error_array arr = response.error_arr[i];
> +			enum xe_ras_recovery_action action;
> +			struct xe_ras_error_class error_class;
> +			u8 component;
> +
> +			error_class = arr.error_class;
> +			component = error_class.common.component;
> +
> +			switch (component) {
> +			case XE_RAS_COMPONENT_CORE_COMPUTE:
> +				action = handle_compute_errors(xe, &arr);
> +				break;
> +			default:
> +				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
> +				break;
> +			}
> +
> +			/*
> +			 * Retain the highest severity action. Process and log all errors
> +			 * and then take appropriate recovery action

Punctuations.

> +			 */
> +			if (action > final_action)
> +				final_action = action;
> +		}
> +
> +	} while (response.additional_errors);

I know we're not NASA but I'd try to have some timeout instead of blindly
trusting the hardware.

Raag

> +	return final_action;
> +
> +err:
> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
