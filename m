Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D08C369BD
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 10:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A899110E08B;
	Wed, 16 Apr 2025 10:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXXIr1NV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAE810E08B
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744800565; x=1776336565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=t+Pi/pD8vKxeJrJjg+3n3RE+HjoLi3b1vAKLuiHkSFs=;
 b=fXXIr1NVqBan808fJioLIKZJBhaE1YLaX4+T2saQvlWI0tbKaAIzX9n5
 +8tWhwzvBSbIXkfnL1t1ldKFbMtgEz4wzkZYDhTPRCDdDq8H8gy5isr8j
 igonJJulOvVBWlZESgJRp9EpbgjYds7VhcjGkTgOUtvGE+VEWre8V6vZN
 4u4mgO4UJXgR6ipCC7ooONmdtDXse/F3e58YR95JbOls4Rfdy4sbJqBI7
 W7oAzorF5Hg0EBkbHuNlFafGPxBY9Wy804r7xPqSxk5koW+n0cEK7iBjM
 SP5tYtjvSpype1Qwpn4VFTEUhFpigtmbwqFfh33YV3H/KKbVY1P9QmZZO g==;
X-CSE-ConnectionGUID: tqee8urxQSWWjiZGAT9M6A==
X-CSE-MsgGUID: OdRA3VA4T1aLf3CNEeL9Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="56977110"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="56977110"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:49:24 -0700
X-CSE-ConnectionGUID: HrBraT+JSOe7TfstyYQ5kQ==
X-CSE-MsgGUID: Wsgq+uG9QVWyiXzDQ6n+Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="131399972"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:49:22 -0700
Date: Wed, 16 Apr 2025 13:49:19 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v2 1/3] drm/xe: Move xe_device_sysfs_init() to
 xe_pci_probe()
Message-ID: <Z_-LLx2Qb-iAouGF@black.fi.intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-2-raag.jadav@intel.com>
 <6a2068b5-d86e-4e8d-9c41-f47cc322e394@intel.com>
 <7fb3fcf0-3dc1-4d98-af23-58c9e77a47d9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fb3fcf0-3dc1-4d98-af23-58c9e77a47d9@intel.com>
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

On Wed, Apr 16, 2025 at 03:34:43PM +0530, Riana Tauro wrote:
> On 4/16/2025 1:25 PM, Riana Tauro wrote:
> > Hi Raag
> > 
> > On 4/3/2025 11:17 PM, Raag Jadav wrote:
> > > Move xe_device_sysfs_init() to xe_pci_probe() so that we can expose
> > > non-PM attributes as well.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device_sysfs.c | 11 +++++++----
> > >   drivers/gpu/drm/xe/xe_pci.c          |  6 ++++++
> > >   drivers/gpu/drm/xe/xe_pm.c           |  5 -----
> > >   3 files changed, 13 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/
> > > xe/xe_device_sysfs.c
> > > index 7efbd4c52791..d4c73acea1cf 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > @@ -67,7 +67,8 @@ static void xe_device_sysfs_fini(void *arg)
> > >   {
> > >       struct xe_device *xe = arg;
> > > -    sysfs_remove_file(&xe->drm.dev->kobj,
> > > &dev_attr_vram_d3cold_threshold.attr);
> > > +    if (xe->d3cold.capable)
> > > +        sysfs_remove_file(&xe->drm.dev->kobj,
> > > &dev_attr_vram_d3cold_threshold.attr);
> > >   }
> > >   int xe_device_sysfs_init(struct xe_device *xe)
> > > @@ -75,9 +76,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
> > >       struct device *dev = xe->drm.dev;
> > >       int ret;
> > > -    ret = sysfs_create_file(&dev->kobj,
> > > &dev_attr_vram_d3cold_threshold.attr);
> > > -    if (ret)
> > > -        return ret;
> > > +    if (xe->d3cold.capable) {
> > > +        ret = sysfs_create_file(&dev->kobj,
> > > &dev_attr_vram_d3cold_threshold.attr);
> > > +        if (ret)
> > > +            return ret;
> > > +    }
> > >       return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 58347fa91841..246682b2a2be 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -18,6 +18,7 @@
> > >   #include "display/xe_display.h"
> > >   #include "regs/xe_gt_regs.h"
> > >   #include "xe_device.h"
> > > +#include "xe_device_sysfs.h"
> > >   #include "xe_drv.h"
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_sriov_vf.h"
> > > @@ -864,6 +865,11 @@ static int xe_pci_probe(struct pci_dev *pdev,
> > > const struct pci_device_id *ent)
> > >       if (err)
> > >           goto err_driver_cleanup;
> > > +    /* We have PM related attributes, so do it after xe_pm_init(). */
> > > +    err = xe_device_sysfs_init(xe);
> > Layering doesn't seem right. This should in xe_device_probe.
> > d3cold capable can be moved to pm_init_early and this to device_probe

Are you sure if we can use ttm_manager_type() in pm_init_early()?

> +    if (err)
> 
> Also this should be a goto
> 
> if (err)
>  	goto err_driver_cleanup;

Sure.

Raag
