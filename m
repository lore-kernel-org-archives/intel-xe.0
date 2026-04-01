Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D86D35157
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 08:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEF910ECB5;
	Wed,  1 Apr 2026 08:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhjMdl2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5329310ECB5
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 08:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775030936; x=1806566936;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L+SW/FLklGRV245WSj4lFfW7EQdK/oTjJLzq+PqaMFw=;
 b=mhjMdl2Xkxt/1XZ0qQ3eNXTB16xtm9Wz2TrFtemPzaUeEkPk6tJ6DF4l
 NAiO8fLu05g6/z2qOQaX3jqa/v26tRcMjGEh2voTFUV/eaZxFVsA7jxzz
 4HsvuNKWqyUjlRTlfqg6DZ/qcMV/N0DINKlMa5NBlx4jcPr1mikWpAy64
 mhuthuCBQX39f+B1lkgOfepB/L7JmbVqnnZShPco/m9qOyWT27mDl9ASC
 laS+aGaMbZ5uxdoQpe1wh3n2ur9PSbuDRagYJjSErT4quiejY19vcjWGD
 mhRmZ/VyKTly4zXQ1yU9OW+dmAtg5eMkvTLGxKsuzlmle+HEuKPoyQ0OB A==;
X-CSE-ConnectionGUID: hp8QU6d+QdiivHrv8pswNA==
X-CSE-MsgGUID: 3YTBXiAMSbyes04qFSPXHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79917850"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79917850"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 01:08:56 -0700
X-CSE-ConnectionGUID: Icj+Y/foRtue+V7sPYrj2g==
X-CSE-MsgGUID: 9MMi0+cBSFentlHTE9I0+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="231541572"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 01:08:53 -0700
Date: Wed, 1 Apr 2026 10:08:50 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH 5/5] drm/xe/xe_ras: Add support to query error counter
 for CRI
Message-ID: <aczSkmVPPc8o0buN@black.igk.intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
 <20260320102607.1017511-6-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320102607.1017511-6-riana.tauro@intel.com>
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

On Fri, Mar 20, 2026 at 03:56:00PM +0530, Riana Tauro wrote:
> Add support to query error counter for all errors.
> 
> When userspace queries a DRM RAS error counter, fetch the
> latest value from system controller.
> 
> Integrate this with XE DRM RAS.
> 
> Example : query the counters using ynl

Either Usage or Example, let keep it consistent with other series.

> List all supported errors
> 
> $ sudo ynl --family drm_ras  --dump get-error-counter \
>   --json '{"node-id":1}'
>  [{"error-id": 1, "error-name": "core-compute",  "error-value": 0},
>   {"error-id": 2, "error-name": "soc-internal",  "error-value": 0},
>   {"error-id": 3, "error-name": "device-memory", "error-value": 0},
>   {"error-id": 4, "error-name": "pcie",          "error-value": 0},
>   {"error-id": 5, "error-name": "fabric",        "error-value": 0},]

I haven't tried this but do we really get the last comma in output?

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
> +int xe_ras_get_error_counter(struct xe_device *xe, const enum drm_xe_ras_error_severity severity,
> +			     u32 error_id, u32 *value)

For event cases we need to reuse this based on error class we read,
perhaps keep a provision for it?

Raag
