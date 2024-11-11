Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58810D2E9C0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 08:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CBC10E43B;
	Mon, 11 Nov 2024 08:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BRW+Db2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E7510E43B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Nov 2024 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731314404; x=1762850404;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4NHXiLIs9oOuTEOnh7IYhOnDzhQmdUDRzKhARn91o7o=;
 b=BRW+Db2+3qoXMDth/DCKYiVk8LTY2ttxCKvueAmFZ2C5DicrIaP9+LX9
 pYLLTH1z9L2QP5hzh+C2Rap410HZ+PD+q0ZSLSYHSr8RrBvjDsqy8Zw1Y
 N10ttS7PT2YyGo9jE5R1Xm3YMjSKUiZZLJ6U+huQ1Ae8rvkVLM+GryzHQ
 qzifO06v8oin60Ec15MFEauuYG4JDgoY0761+n1t+oRWhyLXNC2ynY0y/
 Tr3V8VuVngpK0M9oGoDUTWyqml8+i7xQ0dBz5iLSNHyslv/Fmso+EHwhC
 ED5l9qziW7L/nzx9TpMICARqmcDfvkUcHDajqGpqacb+Rt31y2f9xNTdH w==;
X-CSE-ConnectionGUID: iuuR6hGuRfqZ5D2oYhA3TA==
X-CSE-MsgGUID: K8gVQahkRWqn0MHFLAWwew==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31277419"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31277419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 00:40:04 -0800
X-CSE-ConnectionGUID: 7yKNsBN7RlScrUt7moYPdw==
X-CSE-MsgGUID: tIhaUIoKQ0KxbFIqzpxTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="87278924"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 00:40:02 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tAPxn-0000000DWxQ-2eBW; Mon, 11 Nov 2024 10:39:59 +0200
Date: Mon, 11 Nov 2024 10:39:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Subject: Re: [PATCH 2/2] drm/xe/vsec: Support BMG devices
Message-ID: <ZzHC338WnoYgVYTA@smile.fi.intel.com>
References: <20241108201955.2048085-1-michael.j.ruhl@intel.com>
 <20241108201955.2048085-2-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108201955.2048085-2-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Nov 08, 2024 at 03:19:54PM -0500, Michael J. Ruhl wrote:
> The Battlemage (BMG) discrete graphics card supports the
> Platform, Monitoring Technology (PMT) feature directly
> on the primary PCI device.
> 
> Utilize the PMT callback API to add support for the BMG
> devices.

...

> +	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
> +

No error checks? What's the point of the (second) 'm' then?

...

> +/*
> + * Copyright © 2024 Intel Corporation
> + */

Can be one line.

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>

+ errno.h

> +#include <linux/intel_vsec.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pci.h>

+ types.h

> +#include "xe_device.h"
> +#include "xe_device_types.h"
> +#include "xe_drv.h"
> +#include "xe_mmio.h"
> +#include "xe_platform_types.h"
> +#include "xe_pm.h"
> +#include "xe_vsec.h"

+ blank line?

> +#include "regs/xe_pmt.h"

...


I would add a comment here explaining that it's not a PCI ID,
while looking as that.

> +#define BMG_DEVICE_ID 0xE2F8

...

> +static int guid_decode(u32 guid, int *index, u32 *offset)

xe_guid_decode() to avoid any possible churn in the future due to namespace
collision.

...

> +++ b/drivers/gpu/drm/xe/xe_vsec.h


> +/*
> + * Copyright © 2024 Intel Corporation
> + */

One line?

-- 
With Best Regards,
Andy Shevchenko


