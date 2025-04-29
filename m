Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA32C3ABA9
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 08:55:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E9610E3DB;
	Tue, 29 Apr 2025 08:55:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TNgaojgd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B2410E3DB
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 08:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745916954; x=1777452954;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Sv9tJqwDB42qRUSkT0fgu1EmszF8T30wOekhXYqIvUk=;
 b=TNgaojgdTblJVPUP+laptVuzKNKflaMdRmPRm2ISu3c5AHsI9TlVcXri
 yppA40sbwluhgJOwOqMa2yarVQicpXmKNbLJ9iCe0rMW0LvvgSVXJPQJy
 yLMWcnEEGYx1qsnAK/yNKDHOaEjIs4fb9ORdQWoQJEK9KlVKxrHYvXx2l
 I7TqBFnNepxiLkxPpVoF57wIuE/1cisrIyWMQnxL8qHFF98Bix2ZZU9Ea
 hylhpE5FFY8rL/gCEZscuGLZXo5iya/egrZJS+TdfaiPEho8EpkvsrcDH
 DWdcqokVSZ/EO/dp1nHPINjn15zB18chFIvne2edtHmegXumF1cwzQMDm Q==;
X-CSE-ConnectionGUID: Dp1mIe1FRDmjfmglSspFVQ==
X-CSE-MsgGUID: ctfKSK6JS3iCtgJh8gGdxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58170361"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="58170361"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 01:55:54 -0700
X-CSE-ConnectionGUID: WTYtPCjWQIaVp3DxTvVQNw==
X-CSE-MsgGUID: kTLLkLCMSSC+IrY10ysyCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; d="scan'208";a="156993157"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.9])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 01:55:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedeskop.org
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org
Subject: Re: [RFC 1/9] mei: late_bind: add late binding component driver
In-Reply-To: <20250429073804.972137-2-badal.nilawar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250429073804.972137-1-badal.nilawar@intel.com>
 <20250429073804.972137-2-badal.nilawar@intel.com>
Date: Tue, 29 Apr 2025 11:55:48 +0300
Message-ID: <87v7qnwdm3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 29 Apr 2025, Badal Nilawar <badal.nilawar@intel.com> wrote:
> diff --git a/include/drm/intel/xe_late_bind_mei_interface.h b/include/drm/intel/xe_late_bind_mei_interface.h
> new file mode 100644
> index 000000000000..4005c4c6184f
> --- /dev/null
> +++ b/include/drm/intel/xe_late_bind_mei_interface.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_LATE_BIND_MEI_INTERFACE_H_
> +#define _XE_LATE_BIND_MEI_INTERFACE_H_
> +
> +#include <linux/types.h>
> +
> +struct device;
> +struct module;
> +
> +/**
> + * struct xe_late_bind_component_ops - ops for Late Binding services.
> + * @owner: Module providing the ops
> + * @push_config: Sends a config to FW.
> + */
> +struct xe_late_bind_component_ops {

Please don't name the file after xe, please don't name the structs after
xe. The whole directory include/drm/intel/ is supposed to be agnostic to
i915 or xe, even if the current naming has i915 for historical
reasons.

Aim for generic interfaces and solutions and naming instead of doing
something specific for xe, even if the first user is xe.

BR,
Jani.


> +	struct module *owner;
> +
> +	/**
> +	 * @push_config: Sends a config to FW.
> +	 * @dev: device struct corresponding to the mei device
> +	 * @type: payload type
> +	 * @flags: payload flags
> +	 * @payload: payload buffer
> +	 * @payload_size: payload buffer size
> +	 *
> +	 * Return: 0 success, negative errno value on transport failure,
> +	 *         positive status returned by FW
> +	 */
> +	int (*push_config)(struct device *dev, u32 type, u32 flags,
> +			   const void *payload, size_t payload_size);
> +};
> +
> +/**
> + * struct xe_late_bind_component - Late Binding services component
> + * @mei_dev: device that provide Late Binding service.
> + * @ops: Ops implemented by Late Binding driver, used by Xe driver.
> + *
> + * Communication between Xe and MEI drivers for Late Binding services
> + */
> +struct xe_late_bind_component {
> +	struct device *mei_dev;
> +	const struct xe_late_bind_component_ops *ops;
> +};
> +
> +#endif /* _XE_LATE_BIND_MEI_INTERFACE_H_ */

-- 
Jani Nikula, Intel
