Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A570D38FF1
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 17:12:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE34010E1EC;
	Wed, 14 Jan 2026 17:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgiyfvD7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F87710E1EC
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 17:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768410728; x=1799946728;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2/rhSEvFfFLekT33FCzNpR5ro/NSkLcVrQq9RY1fQgE=;
 b=JgiyfvD7hEO6uKoV4raF1OGHAaFd/Km+jsol2Rei23XTuj6+917mep6L
 pnc43Y1c6dsIhMZP9hTg9LC5WVhBCRTErLWhleCpG1XqsYAoYdXR6C5yX
 /2B7DXFhgiE9+4WOIhZ0+6wz7eDiZhhvQ2OLnrQJY0eIbxiQeKmxsdFBY
 QayNnX8I8hO4tuESan8gZL8PbF35yldyoQMcEQQ5XGcX+hAy8ldWDUsE4
 eyBbeT7AwN5IKp8+wTEjIW/KVpMt/a8qjajtXKwyZAPzmjtMaHJEEOxfq
 B8uJrEmVuqjsg8XWe0pzySosDgr3GeE00ZQiUsi2djY3pYl4vNA+0+R3G A==;
X-CSE-ConnectionGUID: V7niGrifRdWabx6VlTIdrQ==
X-CSE-MsgGUID: GRY4frD8QaS/aOLl71Fqpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69801787"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69801787"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 09:12:07 -0800
X-CSE-ConnectionGUID: thPQOhdzT4Oxr2Gi2+p//w==
X-CSE-MsgGUID: KEIQwVeARqGmpQZXAI0i0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="235985710"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 09:11:59 -0800
Date: Wed, 14 Jan 2026 18:11:55 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 41/79] drm/xe: Cleanup headers in xe_i2c.c
Message-ID: <aWfOW5RGpSfImfzW@black.igk.intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
 <20260113230315.3081153-122-matthew.d.roper@intel.com>
 <aWcloOfxYjg-XvFQ@black.igk.intel.com>
 <20260114162910.GG458797@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114162910.GG458797@mdroper-desk1.amr.corp.intel.com>
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

On Wed, Jan 14, 2026 at 08:29:10AM -0800, Matt Roper wrote:
> On Wed, Jan 14, 2026 at 06:12:00AM +0100, Raag Jadav wrote:
> > On Tue, Jan 13, 2026 at 03:03:46PM -0800, Matt Roper wrote:
> > > xe_i2c.c doesn't use anything from xe_device.h or xe_platform_types.h.
> > > Drop the unnecessary includes.  However it does require xe_sriov.h which
> > > was being indirectly included; add an explicit include for that.
> > > 
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_i2c.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> > > index befc77e46eae..1e1fb72e49bf 100644
> > > --- a/drivers/gpu/drm/xe/xe_i2c.c
> > > +++ b/drivers/gpu/drm/xe/xe_i2c.c
> > > @@ -5,6 +5,7 @@
> > >   * Copyright (C) 2025 Intel Corporation.
> > >   */
> > >  
> > > +#include <drm/drm_print.h>
> > >  #include <linux/array_size.h>
> > >  #include <linux/container_of.h>
> > >  #include <linux/device.h>
> > > @@ -26,11 +27,10 @@
> > >  #include "regs/xe_i2c_regs.h"
> > >  #include "regs/xe_irq_regs.h"
> > >  
> > > -#include "xe_device.h"
> > >  #include "xe_device_types.h"
> > >  #include "xe_i2c.h"
> > >  #include "xe_mmio.h"
> > > -#include "xe_platform_types.h"
> > > +#include "xe_sriov.h"
> > 
> > My guess is, with pci.h here you won't even need this. But I could be
> > wrong.
> 
> In this case we needed xe_sriov.h for the definition of IS_SRIOV_VF()
> that's used later in the file.

Yep, missed it.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

> > >  #include "xe_survivability_mode.h"
> > >  
> > >  /**
> > > -- 
> > > 2.52.0
> > > 
