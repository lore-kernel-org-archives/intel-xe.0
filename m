Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D12C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 03:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5646910E902;
	Thu,  3 Apr 2025 03:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izh3Dpm4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D3510E8FE
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 03:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743651529; x=1775187529;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yExx86uKBMxRgMpYt5oAipALnj9hbKovZfle0VmstTM=;
 b=izh3Dpm4VFBwTxbJw/reH1qrsAm3i//e972tigMAw3LrSnPWpAWu/9xl
 0Gptjm/+3PuN1HNW/Cry0RX3qnV3CJm/KunwHl0hsVegShVjT57gGgFPA
 BkaNYd7HtrQW4N1ojfXnhjxKX6H2x5Gi/AwUcyHDelb+FEDMUcriBpDFj
 Vc1lfTS8qeg0XMgwjyL70jaNQDQjbR9vgx8FWNQLpk82JFNVu+LN+xVgZ
 cZlyx+GJYSgPJCCzEpv+M0li5rxCrc9UmXQ0pEK2ZfXTGe8gVsurHUjVO
 HKEn4yDw07LlbHIHjiGZSyWqLstq8AKC+vhTWJnQN3Kf/A8iykniDsx+G Q==;
X-CSE-ConnectionGUID: EiJy+IgyQ5KeY8k9lYfhKw==
X-CSE-MsgGUID: INpJ4QJ+TNWw5Ajp8elONw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56405913"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56405913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 20:38:48 -0700
X-CSE-ConnectionGUID: qgz37bmdSymSLBRGs7LcKg==
X-CSE-MsgGUID: jq7aqqgFTCCnUIY5+/Fzxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="126874499"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 20:38:47 -0700
Date: Thu, 3 Apr 2025 06:38:44 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com
Subject: Re: [PATCH v1 1/2] drm/xe/debugfs: Expose PCIe Gen5 update telemetry
Message-ID: <Z-4CxE_CDYHk_nxS@black.fi.intel.com>
References: <20250331142336.640226-1-raag.jadav@intel.com>
 <20250331142336.640226-2-raag.jadav@intel.com>
 <2cdb9c41-6b0f-4399-b2c5-f9651a0b98a8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cdb9c41-6b0f-4399-b2c5-f9651a0b98a8@intel.com>
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

On Wed, Apr 02, 2025 at 11:54:26PM +0530, Nilawar, Badal wrote:
> On 31-03-2025 19:53, Raag Jadav wrote:
> > Expose debugfs telemetry required for PCIe Gen5 firmware update for
> > discrete GPUs.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_debugfs.c   | 93 +++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++
> >   2 files changed, 97 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index d0503959a8ed..67c941abf4fe 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -17,6 +17,9 @@
> >   #include "xe_gt_debugfs.h"
> >   #include "xe_gt_printk.h"
> >   #include "xe_guc_ads.h"
> > +#include "xe_mmio.h"
> > +#include "xe_pcode_api.h"
> > +#include "xe_pcode.h"
> >   #include "xe_pm.h"
> >   #include "xe_pxp_debugfs.h"
> >   #include "xe_sriov.h"
> > @@ -191,6 +194,89 @@ static const struct file_operations wedged_mode_fops = {
> >   	.write = wedged_mode_set,
> >   };
> > +/**
> > + * DOC: PCIe Gen5 Update Limitations
> > + *
> > + * Default link speed of discrete GPUs is determined by FIT parameters stored
> > + * in their flash memory, which are subject to override through user initiated
> > + * firmware updates. It has been observed that devices configured with PCIe
> > + * Gen5 as their default speed can come across link quality issues due to host
> > + * or motherboard limitations and may have to auto-downspeed to PCIe Gen4 when
> > + * faced with unstable link at Gen5. The users are required to ensure that the
> > + * device is capable of auto-downspeeding to PCIe Gen4 before pushing the image
> > + * with Gen5 as default configuration. This can be done by reading
> > + * ``pcie_gen4_downspeed_capable`` debugfs entry, which will denote PCIe Gen4
> > + * auto-downspeed capability of the device with boolean output value of ``0``
> > + * or ``1``, meaning `incapable` or `capable` respectively.
> > + *
> > + * .. code-block:: shell
> > + *
> > + *    $ cat /sys/kernel/debug/dri/<N>/pcie_gen4_downspeed_capable
> 
> Why not on sysfs?
> 
> So how about simply using "downgrade" instead of "downspeed" through out the
> code?

It might be confused between PCI link and firmware.

Raag
