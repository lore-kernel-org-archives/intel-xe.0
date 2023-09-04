Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259C8C71153
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 10:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF0C10E124;
	Mon,  4 Sep 2023 10:12:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB3D10E124
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693822327; x=1725358327;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=54pGhGLv3SpXMW+8gVOI+WdxcDIfSGrxDsmHB6rPtr8=;
 b=BcJUu6Bp6N0iRkFGVF9W74kdOK86ufAxa3+HOH6qt6eE1CF/Dd0xLcCR
 TsiYJkn8cvmzdTs0WB5T+bSSGFmkYQ+jy5egQI2J/SFuqhhzPI0ScdO61
 9I4jbPadydZJ48eyIfQbcFvnG6kV1uyEACrjLJRm/izPkP9AJ2xry3k5i
 0oAp+I1t6vU9ZEIgju7zh60H6jAdBvgw+fn921VLsyZyVaIyGiwv9GCgH
 A5B9jmbO2LLoqZIbLAJPnwfWXSiCWihp5dTwrB4j/ZG3EyhaRPoghwpgG
 5AVSZ2jCA8Ck3LYaoVOcjNNmuo48psCynKyxjJtivu5uTobuX2pMvr27D Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="440530765"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="440530765"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 03:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="690542720"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="690542720"
Received: from rapetroa-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.79])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 03:12:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230901160300.7-1-francois.dugast@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230901160300.7-1-francois.dugast@intel.com>
Date: Mon, 04 Sep 2023 13:12:02 +0300
Message-ID: <87cyyyi6x9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Use acpi_target_system_state
 only if ACPI_SLEEP is enabled
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 01 Sep 2023, Francois Dugast <francois.dugast@intel.com> wrote:
> This fixes the build when ACPI_SLEEP is disabled.

What is the build failure exactly? It's usually helpful to copy-paste
the error in the commit message.

acpi_target_system_state() should evaluate to ACPI_STATE_S0 for
CONFIG_ACPI_SLEEP=n, and the changes here would be unnecessary.

Most likely the problem is CONFIG_ACPI=n leading to <acpi/acpi_bus.h>
not being included at all, and the function not being present. Directly
including <acpi/acpi_bus.h> would be the cleaner fix.

BR,
Jani.

>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index b6b547c4877c..54f52b6d702d 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -331,7 +331,12 @@ static void intel_suspend_encoders(struct xe_device *xe)
>  
>  void xe_display_pm_suspend(struct xe_device *xe)
>  {
> -	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> +	bool s2idle;
> +#if IS_ENABLED(CONFIG_ACPI_SLEEP)
> +	s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> +#else
> +	s2idle = true;
> +#endif
>  	if (!xe->info.enable_display)
>  		return;
>  
> @@ -360,7 +365,12 @@ void xe_display_pm_suspend(struct xe_device *xe)
>  
>  void xe_display_pm_suspend_late(struct xe_device *xe)
>  {
> -	bool s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> +	bool s2idle;
> +#if IS_ENABLED(CONFIG_ACPI_SLEEP)
> +	s2idle = acpi_target_system_state() < ACPI_STATE_S3;
> +#else
> +	s2idle = true;
> +#endif
>  	if (!xe->info.enable_display)
>  		return;

-- 
Jani Nikula, Intel Open Source Graphics Center
