Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F30EDE99E
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 09:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CDE10E51E;
	Thu, 14 Sep 2023 09:45:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C024B10E559
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 09:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694684722; x=1726220722;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=rDtx4TF8EPZ+N+tIU0A7+mbOClk/iEZ77wtSEQBkDes=;
 b=HZwBSn1RfSvJ2jPJYOHsd4qZDWJIrT5Kzel+ReBzEsgXv4xbGFzUqXw1
 DcU5U47K/rJ/ixNy7fvhWmQBWkyaqcve47I7TOBvKsjkLRCwB7tMMxhKq
 a6p0Tqnkv+xD0XUg3PC6augFSxgNaon5ESq6nCPAotO5v5NgzM2aKQwYm
 V4f0ahlY2jQbSmMEZRxiNR3wdMYt3KTqU0LgctfD0p3OSQdXUQspDhqk3
 4p9F0XH6g2/vudzoMCVlTQGhdbNEmmQRtdWilCz6bzcJHRvfiMRDXSoZx
 iKW1HLrSob3WcGMREk5QD4y8qbaiRHn5jOMUKWjyqnFDnbRRh5Tgyglje w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="465276861"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="465276861"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 02:45:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814617229"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="814617229"
Received: from haslam-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.56])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 02:45:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20230913095412.3427407-5-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230913095412.3427407-1-jouni.hogander@intel.com>
 <20230913095412.3427407-5-jouni.hogander@intel.com>
Date: Thu, 14 Sep 2023 12:45:17 +0300
Message-ID: <87bke5w0k2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v3 4/5] drm/xe: Add i915_gem.h compatibility
 header
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 13 Sep 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Add i915_gem.h compatibility header and include it in i915_drv.h. Add
> empty GEM_BUG_ON definition for fbc code.

I don't mind merging this as the interim solution so we don't block your
progress, but I think we should just get rid of GEM_BUG_ON/GEM_WARN_ON
in display code:

https://patchwork.freedesktop.org/series/123679/

BR,
Jani.


>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 1 +
>  drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h | 9 +++++++++
>  2 files changed, 10 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/=
gpu/drm/xe/compat-i915-headers/i915_drv.h
> index 6607c5a374cc..55d0d5c7a386 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -15,6 +15,7 @@
>  #include "xe_bo.h"
>  #include "xe_pm.h"
>  #include "xe_step.h"
> +#include "i915_gem.h"
>  #include "i915_gem_stolen.h"
>  #include "i915_reg_defs.h"
>  #include "i915_utils.h"
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h b/drivers/=
gpu/drm/xe/compat-i915-headers/i915_gem.h
> new file mode 100644
> index 000000000000..06b723a479c5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_gem.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +#ifndef __I915_GEM_H__
> +#define __I915_GEM_H__
> +#define GEM_BUG_ON
> +#endif

--=20
Jani Nikula, Intel
