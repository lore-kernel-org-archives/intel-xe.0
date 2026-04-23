Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B498FF99362
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 10:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE9610F090;
	Thu, 23 Apr 2026 10:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtDwnlup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7112610F090
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776941478; x=1808477478;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xj95/a1nC2NppVIA95BTZlrcjJeFK5P/7//VLpzMkuc=;
 b=EtDwnlupGLovojnJIte2injEWRfVKP/3c51lsTfxFgMX+6GYjDaOXCVi
 YHuxUk+PqxqLdWTkSXeIV3b1mVYNIcjpCjaX8/Vrf5D50Ds3jKO0XRTOK
 4mzR5qewhiRdXw34AnTKfiJeiQLT0cWcyg/bLsl+rTRQhFvVKNJ8YblYw
 ip02QpPWwy77WzsBFwXU3XNG2m7tHEwVW45a3wn1W5oc9Xh6LUvbOvJ2u
 PiRze7rh6HTzqcuihTYMiouGhxky2WvRK2gvomzs+gbhfnP6pLc2TNN2m
 BV+Qa3IHFJa+zuFPkBRbohxo1oFo9Nhjx7VmgJg8DGqwoIWq2VXyu+X2Q w==;
X-CSE-ConnectionGUID: FNR5JGLvQAeBQWSUAspn2g==
X-CSE-MsgGUID: wNen42zwQjikvGan+iSo1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95319525"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="95319525"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:51:17 -0700
X-CSE-ConnectionGUID: NdZ/GN5VSC2qya31jH5Gpw==
X-CSE-MsgGUID: z4ZMAIsiSp+Q1yV5j3UFkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="255926189"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:51:14 -0700
Date: Thu, 23 Apr 2026 12:51:12 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v3 2/5] drm/xe/xe_ras: Add support to get error counter
 in CRI
Message-ID: <aen5oJTmbeQuNi4_@black.igk.intel.com>
References: <20260421145056.253300-7-riana.tauro@intel.com>
 <20260421145056.253300-9-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260421145056.253300-9-riana.tauro@intel.com>
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

On Tue, Apr 21, 2026 at 08:20:58PM +0530, Riana Tauro wrote:
> Add request/response structures and helper functions to query system
> controller to get error counter value.

...

> +/**
> + * xe_ras_get_error_counter() - Get error counter value
> + * @xe: xe device instance
> + * @severity: Error severity level to be queried
> + * @error_id: Error component to be queried
> + * @value: Counter value
> + *
> + * This function retrieves the value of a specific RAS error counter based on
> + * the provided severity and component.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_get_error_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,

xe_ras_get_counter()? Pretty please.

> +			     u32 error_id, u32 *value)
> +{
> +	struct xe_ras_error_class error_class = {0};
> +
> +	error_class.common.severity = drm_to_xe_ras_severity[severity];
> +	error_class.common.component = drm_to_xe_ras_component[error_id];
> +
> +	guard(xe_pm_runtime)(xe);
> +	return get_error_counter(xe, &error_class, value);
> +}

...

> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_TYPES_H_
> +#define _XE_RAS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200

Any users?

Raag
