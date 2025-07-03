Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F517C83F04
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 07:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35B810E7D4;
	Thu,  3 Jul 2025 07:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Og+2FuD0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919710E7D4
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 07:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751527168; x=1783063168;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZNMmOclaD3+gTBe8HdcM/gmW4PTP/0E7O30en75WqVI=;
 b=Og+2FuD0PjrtAmk75G8qDlVuk0t3/meKkkKuUHRHXNzRPFn+AfysTeyT
 5PIqUgVbBOEWqs+Cgh1z1ABCpIbkyQxOWlFmMqsdBmfMFCTM5WJ6Q+01U
 59U5rKgaB3px7b7CzMGfg92y9l1csGep19icaDQlwto3ywfNyO42SRK32
 1YYu3PT+qLWJyF+HPxSXGXdklbIBtJ5ABuiO2cBuh2vN+tN2geQurKUm3
 9oQWe6Hl56WD8bK45cwIR23D2rpleG/kM+UrMRiNLth5yvHDWB2X1/hVJ
 H3385jZRBhQ0NhKLBOonQg4lnIaedUm6Kl3eAH0GUSFrYGL6LUmAUPr4p w==;
X-CSE-ConnectionGUID: mY7aaeTwTKugpPOIgvRo/Q==
X-CSE-MsgGUID: vkdfCgaPQ52p0H9DdJvzmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53936012"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="53936012"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:19:27 -0700
X-CSE-ConnectionGUID: Sad55oEzRjifoGG9qtoRZQ==
X-CSE-MsgGUID: Ow0h1RFBTmaTgSST2igPAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="153929261"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 00:19:24 -0700
Date: Thu, 3 Jul 2025 10:19:21 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH v3 4/7] drm/xe/doc: Document device wedged and runtime
 survivability
Message-ID: <aGYu-UAvL8QynWSH@black.fi.intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-5-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702141118.3564242-5-riana.tauro@intel.com>
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

On Wed, Jul 02, 2025 at 07:41:14PM +0530, Riana Tauro wrote:
> Add documentation for vendor specific device wedged recovery method
> and runtime survivability.

...

> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5defa54ccd26..d6b680abc3ae 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1119,6 +1119,22 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>  	xe_pm_runtime_put(xe);
>  }
>  
> +/**
> + * DOC: Device Wedging
> + *
> + * Xe driver uses device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + *
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot be
> + * used. Certain critical errors like gt reset failure, firmware failures can cause
> + * the device to be wedged. The default recovery mechanism for a wedged state
> + * is re-probe (unbind + bind)
> + *
> + * However, CSC firmware errors require a firmware flash to restore normal device
> + * operation. Since firmware flash is a vendor-specific action ``WEDGED=vendor-specific``
> + * recovery method along with :ref:`runtime survivability mode <xe-survivability-mode>`
> + * is used to notify userspace.

I think a bit more context about the expectation from the user would
be useful.

Raag
