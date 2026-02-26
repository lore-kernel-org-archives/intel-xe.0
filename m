Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA5CFD8FD6
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 16:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7FF10E99B;
	Thu, 26 Feb 2026 16:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QsNgADAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E5310E99B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 16:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772123850; x=1803659850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UsKD66MHHrlLEfcNiL/mAnBmDM2e/Pnwy7y2V7MQtG8=;
 b=QsNgADAHo7jc7GlWlhqZ33lmHCCF2euG6FITPYtsW/v7kCq/0xMCVKuK
 bhyj35CesF48Se/dvFbIgaiuIEw+aWOVSIEDJzA5AtcfcUS8Mf0Q7ozUJ
 tKdfsPshx4b2Ny5gzVreOBP6/CrYVOzEEqwiZWDXG20E2RaPX1ZkK5E1A
 Rhzt0NeXbHB5vN+/ag6rAaNJKtw1RVMlZhtmQJyzjRKULWAQxOt2qMJt9
 Hma+yqwPkQNNG6XLqa6lUQ3avKhIlm8SnIsct3Xx2cdlSwpErT62c4nTF
 RIFgRZGoAaMj8sCXVK5xOKYgSn4hBul34/KpbfwFDTUJj6XM3Dm9VhqpA A==;
X-CSE-ConnectionGUID: WAXbDoXRRFu+mqARWd/BbQ==
X-CSE-MsgGUID: pMioW7jvRQCnaJdcLpPq9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="95807878"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="95807878"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:37:29 -0800
X-CSE-ConnectionGUID: Qpi/69jZSFqjCgv6x8JVug==
X-CSE-MsgGUID: D3o9+6M+Ql+qMFWsNYrYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="239608985"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:37:26 -0800
Date: Thu, 26 Feb 2026 17:37:23 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com
Subject: Re: [PATCH v1 0/6] Introduce Xe PCIe FLR
Message-ID: <aaB2wydca3HzV8jy@black.igk.intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
 <6d9a4efc-766e-45dc-973b-2a6fab76b143@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d9a4efc-766e-45dc-973b-2a6fab76b143@intel.com>
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

On Thu, Feb 26, 2026 at 04:08:22PM +0000, Matthew Auld wrote:
> On 24/02/2026 10:25, Raag Jadav wrote:
> > Here's my humble attempt at introducing PCIe FLR support in xe driver.
> > This is ofcourse a half baked implementation and only limited to reloading
> > uC firmwares. This needs to be extended for a lot of different components
> > which I've skipped here for my lack of competence, so feel free to join
> > in and support them.
> 
> I couldn't find where we re-init all the migrate stuff? There is a bunch of
> PPGTT programming that will be lost if VRAM gets wiped. And then also the
> migrate queue/context itself. See xe_migrate_init().

Yes, Brost already pointed it out offline and I have it working locally thanks
to him. v2 will be coming up with xe_migrate_reinit() -> xe_lrc_reinit().

Raag

> > PS: This works enough to allow a single exec test run after FLR but it
> > follows with a GuC crash on subsequent runs which I'm still investigating.
> > 
> > Raag Jadav (6):
> >    drm/xe/uc_fw: Allow reloading firmware
> >    drm/xe/uc: Introduce FLR helpers
> >    drm/xe/irq: Introduce FLR helper
> >    drm/xe: Introduce xe_device_assert_lmem_ready()
> >    drm/xe/bo_evict: Introduce xe_bo_restore_map()
> >    drm/xe/pci: Introduce PCIe FLR
> > 
> >   drivers/gpu/drm/xe/Makefile      |   1 +
> >   drivers/gpu/drm/xe/xe_bo_evict.c |  34 +++++--
> >   drivers/gpu/drm/xe/xe_bo_evict.h |   2 +
> >   drivers/gpu/drm/xe/xe_device.c   |   4 +-
> >   drivers/gpu/drm/xe/xe_device.h   |   1 +
> >   drivers/gpu/drm/xe/xe_gsc.c      |  15 ++++
> >   drivers/gpu/drm/xe/xe_gsc.h      |   1 +
> >   drivers/gpu/drm/xe/xe_gt.c       |  10 +++
> >   drivers/gpu/drm/xe/xe_gt.h       |   2 +
> >   drivers/gpu/drm/xe/xe_guc.c      |  16 ++++
> >   drivers/gpu/drm/xe/xe_guc.h      |   1 +
> >   drivers/gpu/drm/xe/xe_huc.c      |  16 ++++
> >   drivers/gpu/drm/xe/xe_huc.h      |   1 +
> >   drivers/gpu/drm/xe/xe_irq.c      |   7 +-
> >   drivers/gpu/drm/xe/xe_irq.h      |   1 +
> >   drivers/gpu/drm/xe/xe_pci.c      |   1 +
> >   drivers/gpu/drm/xe/xe_pci.h      |   2 +
> >   drivers/gpu/drm/xe/xe_pci_err.c  | 147 +++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_uc.c       |  24 +++++
> >   drivers/gpu/drm/xe/xe_uc.h       |   2 +
> >   drivers/gpu/drm/xe/xe_uc_fw.c    |  33 +++----
> >   drivers/gpu/drm/xe/xe_uc_fw.h    |   1 +
> >   22 files changed, 295 insertions(+), 27 deletions(-)
> >   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> > 
> 
