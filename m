Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4E3C369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 11:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E6B10E44C;
	Wed, 23 Apr 2025 11:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndGHnZxe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC27810E44C
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 11:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745406147; x=1776942147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Tx/Y7tSqC8MnxzepxYFyRPd4BjyUB4qumPw9q3Ba8tc=;
 b=ndGHnZxeTvszXV+UwoO+ncOZwivZwfdCzNb7RA+PtN5TSOF7csd+BuYX
 Q79RWvFpjU2gz4Z5m4MNHyUa1ePdyhLR4Igh18KUoNqnvdtFIavxXdls9
 XydMcfe8ZTgJBHfkJoNF/6TaoJb6W259D2xDxz38jUlI657a0rpWqWQ3d
 YLUnyhiWQp9KhnameCbAb6Gl9W4YbGluHHbtYpe7sOMj/nK1Z42Ylroko
 TCpCwkiTtYjRX+n4iQ3pXpGTbD93rQ7Ik0dM8ONo8gwvXiVx1m68Jb0TG
 rMg64pfzKzspwVq+DK3WVuQEgIML3+wBwMtztnLlkjZGshsIJkvv4aqvU g==;
X-CSE-ConnectionGUID: PwpbA/pNRUGFSwjzKXWv+g==
X-CSE-MsgGUID: 4w0NxHreTmGZGoFntheXeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50823130"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="50823130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 04:02:27 -0700
X-CSE-ConnectionGUID: 3J+Xd4tGSuSINQu221Paog==
X-CSE-MsgGUID: EQrrAf6lSpO8NGqtEpuqHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137143916"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 04:02:24 -0700
Date: Wed, 23 Apr 2025 14:02:21 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v3 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Message-ID: <aAjIvZ0eqLBsI2Nt@black.fi.intel.com>
References: <20250417111233.2322000-1-raag.jadav@intel.com>
 <20250417111233.2322000-3-raag.jadav@intel.com>
 <02d74b93-563e-4fab-a330-f05cf1898ca5@intel.com>
 <aAipZ3pFfD_w7e2z@black.fi.intel.com>
 <05dc8b40-a37a-4fc6-a759-d1ddc0a6c56d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05dc8b40-a37a-4fc6-a759-d1ddc0a6c56d@intel.com>
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

On Wed, Apr 23, 2025 at 03:29:41PM +0530, Riana Tauro wrote:
> On 4/23/2025 2:18 PM, Raag Jadav wrote:
> > On Wed, Apr 23, 2025 at 10:55:30AM +0530, Riana Tauro wrote:
> > > Hi Raag
> > > 
> > > On 4/17/2025 4:42 PM, Raag Jadav wrote:
> > > > Expose sysfs attributes for PCIe Gen4 downspeed capability and status.
> > > > 
> > > > v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
> > > >       Rework macros and their naming (Rodrigo)
> > > > v3: Use sysfs_create_files() (Riana)
> > > >       Fix checkpatch warning (Riana)
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_device.c       |   5 ++
> > > >    drivers/gpu/drm/xe/xe_device_sysfs.c | 101 +++++++++++++++++++++++++++
> > > >    drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
> > > >    drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
> > > >    4 files changed, 112 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index 6c9d3009aa03..79b7b0ecfbae 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -26,6 +26,7 @@
> > > >    #include "xe_bo_evict.h"
> > > >    #include "xe_debugfs.h"
> > > >    #include "xe_devcoredump.h"
> > > > +#include "xe_device_sysfs.h"
> > > >    #include "xe_dma_buf.h"
> > > >    #include "xe_drm_client.h"
> > > >    #include "xe_drv.h"
> > > > @@ -916,6 +917,10 @@ int xe_device_probe(struct xe_device *xe)
> > > >    	if (err)
> > > >    		goto err_unregister_display;
> > > > +	err = xe_device_sysfs_init(xe);
> > > > +	if (err)
> > > > +		goto err_unregister_display;
> > > > +
> > > >    	xe_debugfs_register(xe);
> > > >    	err = xe_hwmon_register(xe);
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > index 2d25e5b5d4bf..923612a0a2e0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > @@ -11,6 +11,9 @@
> > > >    #include "xe_device.h"
> > > >    #include "xe_device_sysfs.h"
> > > > +#include "xe_mmio.h"
> > > > +#include "xe_pcode_api.h"
> > > > +#include "xe_pcode.h"
> > > >    #include "xe_pm.h"
> > > >    /**
> > > > @@ -81,3 +84,101 @@ int xe_pm_sysfs_init(struct xe_device *xe)
> > > >    	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
> > > >    }
> > > > +
> > > > +/**
> > > > + * DOC: PCIe Gen5 Update Limitations
> > > > + *
> > > > + * Default link speed of discrete GPUs is determined by configuration
> > > > + * parameters stored in their flash memory, which are subject to override
> > > > + * through user initiated firmware updates. It has been observed that devices
> > > > + * configured with PCIe Gen5 as their default speed can come across link
> > > > + * quality issues due to host or motherboard limitations and may have to
> > > > + * auto-downspeed to PCIe Gen4 when faced with unstable link at Gen5, which
> > > > + * makes firmware updates rather risky on such setups. It is required to
> > > > + * ensure that the device is capable of auto-downspeeding to PCIe Gen4 link
> > > > + * before pushing the image with PCIe Gen5 as default configuration. This
> > > > + * can be done by reading ``pcie_gen4_downspeed_capable`` sysfs entry, which
> > > > + * will denote PCIe Gen4 downspeed capability of the device with boolean output
> > > > + * value of ``0`` or ``1``, meaning `incapable` or `capable` respectively.
> > > > + *
> > > > + * .. code-block:: shell
> > > > + *
> > > > + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_capable
> > > > + *
> > > > + * Pushing PCIe Gen5 update on a downspeed incapable device and facing link
> > > > + * instability due to host or motherboard limitations can result in driver
> > > > + * failing to bind to the device, making further firmware updates impossible
> > > > + * with RMA being the only last resort.
> > > > + *
> > > > + * PCIe Gen4 downspeed status of downspeed capable devices is available through
> > > > + * ``pcie_gen4_downspeed_status`` sysfs entry with boolean output value of
> > > > + * ``0`` or ``1``, where ``0`` means no auto-downspeeding was required during
> > > > + * link training (which is the optimal scenario) and ``1`` means the device
> > > > + * has auto-downsped to PCIe Gen4 due to unstable Gen5 link.
> > > > + *
> > > > + * .. code-block:: shell
> > > > + *
> > > > + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_status
> > > The code looks good. But i am not sure of the word downspeed.
> > > Couldn't find downspeed used in Pcie generation context. For link,
> > > it is mentioned as  'link downgrade'
> > > 
> > > Could you share if you found any?
> > 
> > Since we're describing both firmware and PCI link in the same document,
> > 
> > 1. It helps distinguish between them.
> > 
> > 2. This information is for the end user and has to be translatable enough
> >     regardless of what spec says about it and the distinction reduces the
> >     chances of misinterpretation.
> Please get an ack for the naming from any maintainer before merging, as it
> cannot be changed later and differs from the spec

Lucas, Rodrigo, if you are okay with this, please let me know.

> Code looks good to me
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

Awesome.

Raag
