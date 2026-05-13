Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACBFCD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 09:01:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1A410ED77;
	Wed, 13 May 2026 09:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBJz+027";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D8010ED7C
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 09:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778662908; x=1810198908;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5VcaXczIDuI3LSZy1jGDi6JRbUBXGgo27+Ih8TvjyZY=;
 b=fBJz+027AtXyz+aSvcBbtr5rIQ00Ahynj5PEP21GuC+gncBZg7tvkBMp
 vtymiC3RyDsBnoJruaUevx8uluffngjdBUaCF8oX7uBZIMM4haivICcq2
 zc4R9xY//vZWoCpR+ORXoikeDmakeMWZLbRjDHPWZnUBtx7w7GZ154V/Z
 wkNfiqRojqIBdjXYpWuzDh70kUNlIp32AffxlVJdPcqRxu4MlPRcUHdvg
 ZKQkfY5Z4ItTdAQ+tqEURQG8dXuqvJKqKgHl6ubE138txq1tP7xL46ezo
 PM0fGLd3gFSZ6hCVmrGMUWm4WVn6Zecz0aGXeDdvv8Arx+dDe4XOdXNIJ w==;
X-CSE-ConnectionGUID: bRgdMmeTR26GeSkwA4p+sQ==
X-CSE-MsgGUID: yhjOvm7yR+u+m5l89vi88w==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79605702"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79605702"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 02:01:48 -0700
X-CSE-ConnectionGUID: dwlIJnJcSpuas59sv5rvbw==
X-CSE-MsgGUID: hllRy05gQYiXmJZVZbomYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="243017959"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 02:01:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 7/7] drm/xe: Make drm_driver const
In-Reply-To: <20260512183342.3374-8-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
 <20260512183342.3374-8-michal.wajdeczko@intel.com>
Date: Wed, 13 May 2026 12:01:42 +0300
Message-ID: <c16ddcb2146fc981ec7788fce22119746eda7ac1@intel.com>
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

On Tue, 12 May 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> After removing runtime modification to our drm_driver definitions,
> we can make them const as they should be.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 7519cda3f42c..576095cf0952 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -391,7 +391,7 @@ bool xe_is_xe_file(const struct file *file)
>  	return file->f_op == &xe_driver_fops;
>  }
>  
> -static struct drm_driver regular_driver = {
> +static const struct drm_driver regular_driver = {
>  	.driver_features =
>  	    XE_DISPLAY_DRIVER_FEATURES |
>  	    DRIVER_GEM |
> @@ -424,7 +424,7 @@ static const struct drm_ioctl_desc xe_ioctls_admin_only[] = {
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>  };
>  
> -static struct drm_driver admin_only_driver = {
> +static const struct drm_driver admin_only_driver = {
>  	.driver_features =
>  	    XE_DISPLAY_DRIVER_FEATURES |
>  	    DRIVER_GEM | DRIVER_RENDER | DRIVER_GEM_GPUVA,
> @@ -478,7 +478,7 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent)
>  {
> -	struct drm_driver *driver = &regular_driver;
> +	const struct drm_driver *driver = &regular_driver;
>  	struct xe_device *xe;
>  	int err;

-- 
Jani Nikula, Intel
