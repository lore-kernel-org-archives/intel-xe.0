Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE52CD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 08:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BF110ED5C;
	Wed, 13 May 2026 08:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmQsAUrI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2BB10ED5C
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778662619; x=1810198619;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HP8RaTwXahYObSCS4FyaN6CvLu9mPT8wdM+s8y6ztKk=;
 b=mmQsAUrI8fPazzwqvxeORduIfaKHUu/5SNBLjMNaF2KhqDvkGmx0MQyy
 3sY5PIYGgeREVxjgCvphG8MPQF0Q0Otpu3uoOe+KjyktqJRxgAD/kcdJU
 Qd5hVjGQgypGi/87C+oozBWesFjaMYTP2MkWfvwoUcynY1bqZS3cUgkVD
 bjyKJH+pKw4zo4mT2tyk+YpmWkN8IvpvpHvfrVNpB/md+xr72jQwbK8cL
 asONKqjKJdwySWT7UXHhth1xOfeRsvSUcQX7tLk3WXs2FzFlZVZH/JltX
 LmyY6ucgAyUksd601PzDl88l+dqq2hXqhCqq4GULxXt6Vh79A4W5kiFCS A==;
X-CSE-ConnectionGUID: aS+wStd0TqOInkyLvYq4vQ==
X-CSE-MsgGUID: 4wsoiqLsSoCMHKSfp1B/Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79296781"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79296781"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:56:57 -0700
X-CSE-ConnectionGUID: PAOgNOFKRJiZx/iSVzzMxw==
X-CSE-MsgGUID: A0u6tYvvT3mUZxu/Pze0AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="231639304"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 01:56:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 3/7] drm/xe/display: Prefer forward declarations
In-Reply-To: <20260512183342.3374-4-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
 <20260512183342.3374-4-michal.wajdeczko@intel.com>
Date: Wed, 13 May 2026 11:56:52 +0300
Message-ID: <d2fa19b9e90803f3d0d3f1bb0a0b8c2fa7435989@intel.com>
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
> There is no need to include xe_device.h in the xe_display.h header.
> Include it in the xe_display.c file instead.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 1 +
>  drivers/gpu/drm/xe/display/xe_display.h | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 0747044f7c2a..263e92203c9d 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -36,6 +36,7 @@
>  #include "intel_hotplug.h"
>  #include "intel_opregion.h"
>  #include "skl_watermark.h"
> +#include "xe_device.h"
>  #include "xe_display_bo.h"
>  #include "xe_display_pcode.h"
>  #include "xe_display_rpm.h"
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index fb1db84db966..95acf0fd8e7b 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -6,9 +6,11 @@
>  #ifndef _XE_DISPLAY_H_
>  #define _XE_DISPLAY_H_
>  
> -#include "xe_device.h"
> +#include <linux/types.h>
>  
>  struct drm_driver;
> +struct pci_dev;
> +struct xe_device;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)

-- 
Jani Nikula, Intel
