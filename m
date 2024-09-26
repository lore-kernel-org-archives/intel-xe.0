Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87E6CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 09:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7615910EB2C;
	Thu, 26 Sep 2024 09:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYr92RVk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEA210EB2C
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 09:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727342719; x=1758878719;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=67zmMmwUNNACJUiKQzqHMdsHEW1cAKhq7Tyasp3jp4o=;
 b=GYr92RVkGdj2h1aaRRe1JpIavzIuGh80t6WN02MtLM43pRnNcgthq3WU
 Db3XhIDdmGs84YJtit2IbuoLrQgZGwERlVCfpbyEmG79U3b4l5VnegoqL
 ecG28m5obpsf/YU/a78SDv4MTM+BrfslHINVFnAn7WQtiH2dEw1P0N+/N
 h2EIekiCmSw1BL1kKl5dqrVXCxjFR3nmq1llhcjzAnQY0JrKNkXfQKlHe
 HWn+MLrrXMDNuBWpniuB20rqJTBmreS39WSuYdRPQED+ynczT4nWhe6hE
 vMTgeyvzTkO00WE3m7iAg3zLjZo+JNlEbztlxJpd8xaAnedhyuc/N0QoZ g==;
X-CSE-ConnectionGUID: /12h5ue4Snmikaj3VL28WA==
X-CSE-MsgGUID: iIFYR9t0S2yc2nJN08aLPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37804671"
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; d="scan'208";a="37804671"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 02:25:19 -0700
X-CSE-ConnectionGUID: YwPRsOuaQh6OldUq9/Psew==
X-CSE-MsgGUID: NvZgSt5YSTisc80txUxPMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,260,1719903600"; d="scan'208";a="95422772"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.124])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 02:25:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, Bommu
 Krishnaiah <krishnaiah.bommu@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay
 Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/pmu: Enable PMU interface
In-Reply-To: <20240925232159.2057581-2-vinay.belgaumkar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240925232159.2057581-1-vinay.belgaumkar@intel.com>
 <20240925232159.2057581-2-vinay.belgaumkar@intel.com>
Date: Thu, 26 Sep 2024 12:25:12 +0300
Message-ID: <87msju22dj.fsf@intel.com>
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

On Wed, 25 Sep 2024, Vinay Belgaumkar <vinay.belgaumkar@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index ae245fbd91ee..bddb93e8b949 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -266,6 +266,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/skl_universal_plane.o \
>  	i915-display/skl_watermark.o
>  
> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> +

Why add perf events stuff *between* two blocks of display objects?

>  ifeq ($(CONFIG_ACPI),y)
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  		i915-display/intel_acpi.o \

-- 
Jani Nikula, Intel
