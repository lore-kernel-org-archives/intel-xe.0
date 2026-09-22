Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A818EC982FA
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 19:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54BD510EE3F;
	Tue, 22 Sep 2026 19:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pp1ZGRVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E71410EE3F
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790106036; x=1821642036;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sdZjvxm6brnfCc8ULnEunRatRL9bXJLHDaypZfKU8Es=;
 b=Pp1ZGRVazWrAMitSO5Z1RfHidJB4W1a6f2j6O8+n5+wfrNV/Sy8fwQvm
 22h68uG6qMngU9Lt+/uqwLYFBSljiz2N8V3vRTONB2mWphCJ3p3EIRCAP
 4FYLKUkHhI5eby6987zcNxtcNuDE2mBVZPATDVyZ8vQ4DgCklaSlifuVD
 yxC/jd15RlGvXKFT2AD7RQX7ldfJae2GYmCJ40aFg9f6E9Kut76a/1U7Q
 8qGEElSglO2KUWIChgqxKJyLa1wwXC/wviQmpZaGukVqmfUXSrdjCW51q
 ZfjlZsObPyT2g/aWB8Yl0wR+CVeFGkavma2/amcgWuscIlCAY01YJPFr4 Q==;
X-CSE-ConnectionGUID: TvePwYlrQKm9O3wpSSIYkw==
X-CSE-MsgGUID: +UisM6MrRZucjjIR0wdx7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1247855"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1247855"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 12:40:35 -0700
X-CSE-ConnectionGUID: GrOLIcWjT+6jIZuFoPTbOA==
X-CSE-MsgGUID: IuSyoAvQQDOUDZsTptylOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="271854549"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 12:40:34 -0700
Date: Tue, 22 Sep 2026 21:40:23 +0200
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe/display: reduce includes in xe_display.c
Message-ID: <sb4ohi5vcesorj3ilyybodexjxoiu37hlwjmcukahtevt4fcck@4m3eg66hc3bw>
References: <20260922151721.1483978-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922151721.1483978-1-jani.nikula@intel.com>
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

On Tue, Sep 22, 2026 at 06:17:21PM GMT, Jani Nikula wrote:
> xe_display.c has a bunch of extra leftover includes. Remove and
> simplify.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 7b25c0814674..506f26e9c59a 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -6,31 +6,23 @@
>  #include "xe_display.h"
>  #include "regs/xe_irq_regs.h"
>  
> -#include <linux/fb.h>
> +#include <linux/acpi.h>
>  
> -#include <drm/drm_client.h>
> -#include <drm/drm_client_event.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
> -#include <drm/drm_probe_helper.h>
>  #include <drm/intel/display_member.h>
>  #include <drm/intel/display_parent_interface.h>
> -#include <uapi/drm/xe_drm.h>
>  
> -#include "intel_acpi.h"
>  #include "intel_display.h"
>  #include "intel_display_core.h"
>  #include "intel_display_device.h"
>  #include "intel_display_driver.h"
>  #include "intel_display_irq.h"
> -#include "intel_display_types.h"
>  #include "intel_dmc.h"
>  #include "intel_dmc_wl.h"
> -#include "intel_dp.h"
>  #include "intel_fbdev.h"
>  #include "intel_hotplug.h"
>  #include "intel_opregion.h"
> -#include "skl_watermark.h"
>  #include "xe_device.h"
>  #include "xe_display_bo.h"
>  #include "xe_display_pcode.h"
> -- 
> 2.47.3
> 
