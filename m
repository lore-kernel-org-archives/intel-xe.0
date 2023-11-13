Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA885C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 10:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E7710E341;
	Mon, 13 Nov 2023 10:04:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA9710E33F
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 10:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699869877; x=1731405877;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oW3M70AVc2MZnBhpTG0DWveg2akx0SJqagAuR/hogfs=;
 b=VadpMLc3mYZl08WGqyvi3rWn4vPiIAkbNK+O8czzr8hv0fYpFN/Zv2km
 oZhemiM94zybvQCsH11/AHgxxWotK1LX0OYJM5hDEwYmzMqI/fbBHWt/F
 G4WvGMo5rMliG3D1bRFmI9wJHlhn3Qqt/1UP+qV3QlrgwQ7e7H7v3ZUdY
 KxeGykxhP0wgjLMxcdvZY3+shSGXvrCz8U0pU2v4mA8oamu4VCckGV3pS
 09SSh7xvCR9iX3XJj7wmBMFNQqskT38pJwoQIOgvupzr0B2Z5Bnfia85K
 NmLw0w2IipEr8e1QWNuFP+fFOGj5OMI/Ei6ilAl1fzH59XK07APM46a/G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="393272540"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="393272540"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 02:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="1011495766"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="1011495766"
Received: from cgheban-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.92])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 02:04:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20231109175132.3084142-3-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231109175132.3084142-1-lucas.demarchi@intel.com>
 <20231109175132.3084142-3-lucas.demarchi@intel.com>
Date: Mon, 13 Nov 2023 12:04:32 +0200
Message-ID: <87v8a6ufyn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Fix build with KUNIT=m
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 09 Nov 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Due to the current integration between "live" xe kunit tests and kunit,
> it's not possible to have a build with the following combination:
>
> 	CONFIG_DRM_XE=y
> 	CONFIG_KUNIT=m
>
> ... even if kconfig doesn't block it. The reason for the failure is that
> some compilation units are pulled in xe.ko:
>
> 	drivers/gpu/drm/xe/xe_bo.c:#include "tests/xe_bo.c"
> 	drivers/gpu/drm/xe/xe_dma_buf.c:#include "tests/xe_dma_buf.c"
> 	drivers/gpu/drm/xe/xe_migrate.c:#include "tests/xe_migrate.c"
> 	drivers/gpu/drm/xe/xe_pci.c:#include "tests/xe_pci.c"
>
> Those files shouldn't use symbols from kunit, which should be reserved
> to the tests/*_test.c files. Detangling this dependency doesn't seem
> very straightforward, so fix the immediate issue instructing kconfig to
> block the problematic configuration.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 2fa2d6dacb96..5b3da06e7ba3 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_XE
>  	tristate "Intel Xe Graphics"
> -	depends on DRM && PCI && MMU
> +	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))

What do plain m and y mean here?

BR,
Jani.

>  	select INTERVAL_TREE
>  	# we need shmfs for the swappable backing store, and in particular
>  	# the shmem_readpage() which depends upon tmpfs

-- 
Jani Nikula, Intel
