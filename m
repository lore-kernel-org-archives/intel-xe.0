Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D49EF433FE
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 06:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2AD10E18C;
	Thu, 16 Apr 2026 06:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVi13O1h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE6410E18C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 06:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776320394; x=1807856394;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=55FVclEYsN57RhgNwgffeEVLGFWHmu3FBoH/okyFvkM=;
 b=SVi13O1h86RGnp/RsTSOcrPPIsEa9nCecOfTlf4nM24BIV26oKXpDfhM
 T8AbggUy76ucF3tQ/V6EpZ6TwAK8xlZUcnGcpRTCBWRD+b5mES2ED1gxO
 LoixVwopbFNVEuaVm7hbZ11TqgUy8xNbY/VwE3LSG8EFfn98bBfmsMsdK
 oT4b6lirwSvlWFtM/MLiucGIHmiH3Y4IWP1FLhdIqeQE3qhUgwuMNuEw/
 To22z6y/vOu+/i2BN7CEgS70DFgkJQj436uJcfh7tdChtuUELYZrs/+lO
 a2dYf45JP/OdOO2cCty9VMqih6esGNN+CuvnGWB+WqCmBTD/N5Zsm88Sa g==;
X-CSE-ConnectionGUID: KQYGvx+mS+K4aenKoJ8hYA==
X-CSE-MsgGUID: xtwOto2hTkWd/8xzBeADuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77217070"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="77217070"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 23:19:54 -0700
X-CSE-ConnectionGUID: je89549jSKe5M6uAdzQYow==
X-CSE-MsgGUID: 1c+hZ7MaRS6yth/C70USGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="232374183"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 23:19:50 -0700
Date: Thu, 16 Apr 2026 08:19:47 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, maarten@lankhorst.se, jani.nikula@intel.com,
 lukasz.laguna@intel.com, zhanjun.dong@intel.com, lukas@wunner.de
Subject: Re: [PATCH v5 0/9] Introduce Xe PCIe FLR
Message-ID: <aeB_g9mtwo6Y9sR5@black.igk.intel.com>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <adcfe2bd-56af-4368-96ce-32fb9a5c6642@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adcfe2bd-56af-4368-96ce-32fb9a5c6642@intel.com>
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

On Wed, Apr 15, 2026 at 08:47:50AM -0700, Daniele Ceraolo Spurio wrote:
> On 4/6/2026 7:07 AM, Raag Jadav wrote:
> > Here's my humble attempt at introducing PCIe Function Level Reset (FLR)
> > support in xe driver. This is ofcourse a half baked implementation and
> > only limited to re-initializing GT. This needs to be extended for a lot
> > of different components which I've skipped here for my lack of competence,
> > so feel free to join in and support them.
> 
> I'm jumping in to review a bit late, sorry for that.

Thank you.

> I think we need a comment (both here and in code) to detail exactly what we
> expect to happen around the FLR (or let me know if it's already somewhere
> because I couldn't spot it). Which objects are expected to survive, which
> ones do we need to recover or discard (and why)?
> I'll sprinkle a few question in the relevant patches.

Yeah, there's not much of internal documentation from software POV either.
I'm just making this up as I go along.

Raag

> > PS: All xe_exec_basic tests and clpeak run smoothly after FLR. Give it
> > a spin and let me know if any regressions.
> > 
> > Trigger it with:
> > 
> > $ echo 1 > /sys/bus/pci/devices/<BDF>/reset
> > 
> > v2: Re-initialize migrate context (Matthew Brost)
> >      Add kernel doc (Matthew Brost)
> >      Spell out Function Level Reset (Jani)
> > 
> > v3: Cancel in-flight jobs before FLR
> > 
> > v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> > 
> > v5: Re-initialize kernel queues through submission backend (Matthew Brost)
> >      Prevent PM ref leak for wedged device (Matthew Brost)
> > 
> > Raag Jadav (9):
> >    drm/xe/uc_fw: Allow re-initializing firmware
> >    drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
> >    drm/xe/gt: Introduce FLR helpers
> >    drm/xe/irq: Introduce xe_irq_disable()
> >    drm/xe: Introduce xe_device_assert_lmem_ready()
> >    drm/xe/bo_evict: Introduce xe_bo_restore_map()
> >    drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
> >    drm/xe/migrate: Introduce xe_migrate_reinit()
> >    drm/xe/pci: Introduce PCIe FLR
> > 
> >   drivers/gpu/drm/xe/Makefile              |   1 +
> >   drivers/gpu/drm/xe/xe_bo_evict.c         |  51 ++++++--
> >   drivers/gpu/drm/xe/xe_bo_evict.h         |   2 +
> >   drivers/gpu/drm/xe/xe_device.c           |  10 +-
> >   drivers/gpu/drm/xe/xe_device.h           |   1 +
> >   drivers/gpu/drm/xe/xe_device_types.h     |   3 +
> >   drivers/gpu/drm/xe/xe_exec_queue.c       |  37 +++++-
> >   drivers/gpu/drm/xe/xe_exec_queue.h       |   1 +
> >   drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
> >   drivers/gpu/drm/xe/xe_gpu_scheduler.h    |   5 +
> >   drivers/gpu/drm/xe/xe_gsc.c              |  14 ++
> >   drivers/gpu/drm/xe/xe_gsc.h              |   1 +
> >   drivers/gpu/drm/xe/xe_gt.c               |  47 +++++++
> >   drivers/gpu/drm/xe/xe_gt.h               |   2 +
> >   drivers/gpu/drm/xe/xe_gt_types.h         |   9 ++
> >   drivers/gpu/drm/xe/xe_guc.c              |  29 ++++
> >   drivers/gpu/drm/xe/xe_guc.h              |   2 +
> >   drivers/gpu/drm/xe/xe_guc_submit.c       |  11 ++
> >   drivers/gpu/drm/xe/xe_huc.c              |  14 ++
> >   drivers/gpu/drm/xe/xe_huc.h              |   1 +
> >   drivers/gpu/drm/xe/xe_irq.c              |  13 +-
> >   drivers/gpu/drm/xe/xe_irq.h              |   1 +
> >   drivers/gpu/drm/xe/xe_lrc.c              |  17 +++
> >   drivers/gpu/drm/xe/xe_lrc.h              |   2 +
> >   drivers/gpu/drm/xe/xe_migrate.c          |  12 ++
> >   drivers/gpu/drm/xe/xe_migrate.h          |   1 +
> >   drivers/gpu/drm/xe/xe_pci.c              |   1 +
> >   drivers/gpu/drm/xe/xe_pci.h              |   2 +
> >   drivers/gpu/drm/xe/xe_pci_err.c          | 160 +++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_uc.c               |  37 ++++++
> >   drivers/gpu/drm/xe/xe_uc.h               |   2 +
> >   drivers/gpu/drm/xe/xe_uc_fw.c            |  39 +++++-
> >   drivers/gpu/drm/xe/xe_uc_fw.h            |   1 +
> >   33 files changed, 510 insertions(+), 21 deletions(-)
> >   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> > 
> 
