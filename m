Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11237C369C7
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 07:55:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C626110EA1C;
	Thu, 17 Apr 2025 07:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZ7gJUbE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD6010EA1C
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 07:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744876505; x=1776412505;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FzjBm7HhMTbvhqhtFnHkAgsNWkGpDs3w8lqoXRAPCLQ=;
 b=PZ7gJUbEcWe9sSNvxZCQGityrZ6eQMmripwt/qLoxN5SEckt6SiXMV2I
 LhwDXKFgdatQzL8qOwnDNgX5CZk7EjYsK3U9TpS8wVZTCzYiM64S6ajZi
 QNBc9TxSpE2UsdWOe25g0xPsJK526zKvtoksJZnvy8EPHVeFzfFHRViH1
 EGQsV0V3VY8K/eD3tnBtcGmVaDlWHaLUJau+7PRYa5/+L7jrJQ/PSq8RJ
 EwyZq/EY+yU57vSlZ2g+NI/yCJQz/xKZ9GZB387CRviJvgGhV3zzVwgmR
 m6cnATo9UfOXYJFq7UmDRGAwWxxRkSOaq3lLgBkOrmXS2DFnnvWzkRMjN g==;
X-CSE-ConnectionGUID: lNdcnxrHTC+RuF4OgdYB1w==
X-CSE-MsgGUID: 8GvPH6+8STWrmRYo4o6Ubw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46336898"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46336898"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 00:55:05 -0700
X-CSE-ConnectionGUID: ORqi/H/SQfWkCdKXzAufuQ==
X-CSE-MsgGUID: X0ry1nUOSHWiA3aQjfjq+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="167913890"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 00:55:03 -0700
Date: Thu, 17 Apr 2025 10:54:59 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com
Subject: Re: [PATCH v2 1/3] drm/xe: Move xe_device_sysfs_init() to
 xe_pci_probe()
Message-ID: <aACz02tjPQSThiKd@black.fi.intel.com>
References: <20250403174742.1294227-1-raag.jadav@intel.com>
 <20250403174742.1294227-2-raag.jadav@intel.com>
 <6a2068b5-d86e-4e8d-9c41-f47cc322e394@intel.com>
 <7fb3fcf0-3dc1-4d98-af23-58c9e77a47d9@intel.com>
 <Z_-LLx2Qb-iAouGF@black.fi.intel.com>
 <83da2447-1242-4bb2-8039-ffd76d925c28@intel.com>
 <Z__crNClWVPQHE6y@black.fi.intel.com>
 <5c6726de-dcdf-4bd8-9522-492608738177@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c6726de-dcdf-4bd8-9522-492608738177@intel.com>
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

On Thu, Apr 17, 2025 at 10:52:54AM +0530, Riana Tauro wrote:
> On 4/16/2025 10:07 PM, Raag Jadav wrote:
> > On Wed, Apr 16, 2025 at 08:15:48PM +0530, Riana Tauro wrote:
> > > Hi Raag
> > > 
> > > On 4/16/2025 4:19 PM, Raag Jadav wrote:
> > > > On Wed, Apr 16, 2025 at 03:34:43PM +0530, Riana Tauro wrote:
> > > > > On 4/16/2025 1:25 PM, Riana Tauro wrote:
> > > > > > Hi Raag
> > > > > > 
> > > > > > On 4/3/2025 11:17 PM, Raag Jadav wrote:
> > > > > > > Move xe_device_sysfs_init() to xe_pci_probe() so that we can expose
> > > > > > > non-PM attributes as well.
> > > > > > > 
> > > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/xe/xe_device_sysfs.c | 11 +++++++----
> > > > > > >     drivers/gpu/drm/xe/xe_pci.c          |  6 ++++++
> > > > > > >     drivers/gpu/drm/xe/xe_pm.c           |  5 -----
> > > > > > >     3 files changed, 13 insertions(+), 9 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/
> > > > > > > xe/xe_device_sysfs.c
> > > > > > > index 7efbd4c52791..d4c73acea1cf 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > > > > > @@ -67,7 +67,8 @@ static void xe_device_sysfs_fini(void *arg)
> > > > > > >     {
> > > > > > >         struct xe_device *xe = arg;
> > > > > > > -    sysfs_remove_file(&xe->drm.dev->kobj,
> > > > > > > &dev_attr_vram_d3cold_threshold.attr);
> > > > > > > +    if (xe->d3cold.capable)
> > > > > > > +        sysfs_remove_file(&xe->drm.dev->kobj,
> > > > > > > &dev_attr_vram_d3cold_threshold.attr);
> > > > > > >     }
> > > > > > >     int xe_device_sysfs_init(struct xe_device *xe)
> > > > > > > @@ -75,9 +76,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
> > > > > > >         struct device *dev = xe->drm.dev;
> > > > > > >         int ret;
> > > > > > > -    ret = sysfs_create_file(&dev->kobj,
> > > > > > > &dev_attr_vram_d3cold_threshold.attr);
> > > > > > > -    if (ret)
> > > > > > > -        return ret;
> > > > > > > +    if (xe->d3cold.capable) {
> > > > > > > +        ret = sysfs_create_file(&dev->kobj,
> > > > > > > &dev_attr_vram_d3cold_threshold.attr);
> > > > > > > +        if (ret)
> > > > > > > +            return ret;
> > > > > > > +    }
> > > > > > >         return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> > > > > > >     }
> > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > index 58347fa91841..246682b2a2be 100644
> > > > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > > @@ -18,6 +18,7 @@
> > > > > > >     #include "display/xe_display.h"
> > > > > > >     #include "regs/xe_gt_regs.h"
> > > > > > >     #include "xe_device.h"
> > > > > > > +#include "xe_device_sysfs.h"
> > > > > > >     #include "xe_drv.h"
> > > > > > >     #include "xe_gt.h"
> > > > > > >     #include "xe_gt_sriov_vf.h"
> > > > > > > @@ -864,6 +865,11 @@ static int xe_pci_probe(struct pci_dev *pdev,
> > > > > > > const struct pci_device_id *ent)
> > > > > > >         if (err)
> > > > > > >             goto err_driver_cleanup;
> > > > > > > +    /* We have PM related attributes, so do it after xe_pm_init(). */
> > > > > > > +    err = xe_device_sysfs_init(xe);
> > > > > > Layering doesn't seem right. This should in xe_device_probe.
> > > > > > d3cold capable can be moved to pm_init_early and this to device_probe
> > > > 
> > > > Are you sure if we can use ttm_manager_type() in pm_init_early()?
> > > 
> > > you need only d3cold.capable to setup sysfs. This call is using only pci
> > > calls. So this should work
> > > 
> > > xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> > 
> > Sure, but should we expose vram_d3cold_threshold before calculating its
> > value?
> 
> pm_init anyway fails if it's not able to set vram_d3cold_threshold.

Which means we should make sure it's valid before exposing it.

> Adding it to xe pci layer seemed wrong to me because there are no other
> sysfs init calls in probe.
> 
> But upto you

Sure, we can change if there's an alternative that doesn't break one rule
of thumb for another.

Raag
