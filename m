Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF64FD9E39
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 04:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E8810E188;
	Fri, 27 Feb 2026 04:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TO26uike";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AAA10E188
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 04:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772165889; x=1803701889;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NSNXMM5F2l16cCsVFeqTe2Pd65awUzgrulJ6Tsvw3XE=;
 b=TO26uike9GQN0AH41iNgZKRy+r4m9TJrqigFRVGnxYq9ayHujbf12bin
 F39dudnM5bPBSI0TLgOefMGY+Xm2cm3/z+jjwbnwTwDDnak+qk7i0x0aw
 2F5M0/HUB0oxdV1hM0a2JjUo/GFRwtcftkXeAw1/2pttMzhCne6OFjbC4
 S7gn9IDtHIXMv9iaShNmXmjMQHqesFa0Js/Ln2IG7essHLspdvweoKkUz
 KKomzEC3kdEtrWyQDZPn1lVRqKk6TlRRqxaiwjaZ1daLFPzTyI3yEm6If
 AzZg2caWCuTZed2eKIKvX8AWr3EShdvSMFDw2fkvcyldNlCpxakJhTFTT w==;
X-CSE-ConnectionGUID: siHXYU+nQZemA9OwKTXlqQ==
X-CSE-MsgGUID: P7wRy+6XT8m7ynSlr3VYHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72947270"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="72947270"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 20:18:09 -0800
X-CSE-ConnectionGUID: CxTqF55jRGCCy5ETOgPMKA==
X-CSE-MsgGUID: /9YP8K03SHqL1OSfTcW63g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="215906935"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 20:18:07 -0800
Date: Fri, 27 Feb 2026 05:18:04 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com
Subject: Re: [PATCH v1 0/6] Introduce Xe PCIe FLR
Message-ID: <aaEa_NrpBGVqkH7e@black.igk.intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
 <20260226221225.GX4694@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226221225.GX4694@mdroper-desk1.amr.corp.intel.com>
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

On Thu, Feb 26, 2026 at 02:12:25PM -0800, Matt Roper wrote:
> On Tue, Feb 24, 2026 at 03:55:13PM +0530, Raag Jadav wrote:
> > Here's my humble attempt at introducing PCIe FLR support in xe driver.
> > This is ofcourse a half baked implementation and only limited to reloading
> > uC firmwares. This needs to be extended for a lot of different components
> > which I've skipped here for my lack of competence, so feel free to join
> > in and support them.
> > 
> > PS: This works enough to allow a single exec test run after FLR but it
> > follows with a GuC crash on subsequent runs which I'm still investigating.
> 
> Probably a dumb question since FLR while the driver is bound isn't an
> area I've considered:  if we do a PCI FLR, is there *anything* in the
> driver state that would still be relevant and useful to carry forward
> after the reset?  I believe at the hardware level vram gets wiped, all
> registers in the BAR go back to power-up defaults, etc., right?  If
> there's no state that we can meaningfully carry forward post-reset, then
> couldn't that be handled by destroying the whole xe_device (and
> releasing all of its resources), and then starting over with
> xe_pci_probe() to initialize a new one from scratch?

As an alternative yes, but that's not the userspace contract with FLR.
If user wants to reload the driver, there's a different path for it,
i.e. unbind + bind. Detailed explanation[1] from Winiarski on this.

[1] https://lore.kernel.org/intel-xe/forn7m5f2m6bwpspktrmjzvxcezcmoqyuuclu64x77uxdo5c5u@fcg3kphdb5re/

> I guess on an igpu all of our data is in smem and only the stolen memory
> gets wiped, so an FLR is a bit less destructive.  But on a dgpu I'm not
> sure how much continuation is really possible?

The expectation is to give user back a working hardware. Since VRAM is
lost, user may need to recreate memory contents, but we keep the clients
and their descriptors intact.

On a side note, this implementation is meant as a stepping stone and to
be reused for other usecases in future products.

Raag

> > Raag Jadav (6):
> >   drm/xe/uc_fw: Allow reloading firmware
> >   drm/xe/uc: Introduce FLR helpers
> >   drm/xe/irq: Introduce FLR helper
> >   drm/xe: Introduce xe_device_assert_lmem_ready()
> >   drm/xe/bo_evict: Introduce xe_bo_restore_map()
> >   drm/xe/pci: Introduce PCIe FLR
> > 
> >  drivers/gpu/drm/xe/Makefile      |   1 +
> >  drivers/gpu/drm/xe/xe_bo_evict.c |  34 +++++--
> >  drivers/gpu/drm/xe/xe_bo_evict.h |   2 +
> >  drivers/gpu/drm/xe/xe_device.c   |   4 +-
> >  drivers/gpu/drm/xe/xe_device.h   |   1 +
> >  drivers/gpu/drm/xe/xe_gsc.c      |  15 ++++
> >  drivers/gpu/drm/xe/xe_gsc.h      |   1 +
> >  drivers/gpu/drm/xe/xe_gt.c       |  10 +++
> >  drivers/gpu/drm/xe/xe_gt.h       |   2 +
> >  drivers/gpu/drm/xe/xe_guc.c      |  16 ++++
> >  drivers/gpu/drm/xe/xe_guc.h      |   1 +
> >  drivers/gpu/drm/xe/xe_huc.c      |  16 ++++
> >  drivers/gpu/drm/xe/xe_huc.h      |   1 +
> >  drivers/gpu/drm/xe/xe_irq.c      |   7 +-
> >  drivers/gpu/drm/xe/xe_irq.h      |   1 +
> >  drivers/gpu/drm/xe/xe_pci.c      |   1 +
> >  drivers/gpu/drm/xe/xe_pci.h      |   2 +
> >  drivers/gpu/drm/xe/xe_pci_err.c  | 147 +++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_uc.c       |  24 +++++
> >  drivers/gpu/drm/xe/xe_uc.h       |   2 +
> >  drivers/gpu/drm/xe/xe_uc_fw.c    |  33 +++----
> >  drivers/gpu/drm/xe/xe_uc_fw.h    |   1 +
> >  22 files changed, 295 insertions(+), 27 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
