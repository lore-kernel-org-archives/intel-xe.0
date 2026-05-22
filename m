Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A99BCD5BB5
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 13:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926FB10F5C3;
	Fri, 22 May 2026 13:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nx1E86y2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E668510F55A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 13:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779456060; x=1810992060;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uJNNFu+6mM19wdPdxg95DrvykdAOR/hHH46ZsvhmJyI=;
 b=Nx1E86y2A11lzUUFStxvfgEuQEw9S9f5ty6HDAurYBeLOzghQRa6/DJX
 4MIUqonM34UN++y4dHCBQBdTs7ve+kzsa98wchJyL2C2xefZO+d82TQDq
 7HrHEiur05pUgBe0ey4randq6FKNBk6Um8n2lhgyEl0Q+Wg2vvPw8Dp+m
 K81N6WMHVkgpkTtNsyRwgEkDrEMF/FSr5VL3QDyTLIfdwqEM8kTvPlhkM
 VL7WEGBFWT6FoHRe+EM3wBOYV/ZL9udyfVrtxQss17lYsLs4PxUm7AFwE
 MppRhFE9hNbZlekddRWSG4C60hJ2jT6rTaJcfKW46Xnbr0AZDG88/clls Q==;
X-CSE-ConnectionGUID: +CzdT2g2T+m8ssBI8iFbPw==
X-CSE-MsgGUID: 2aIV5S6yQRWRE2mx7GyXLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80416512"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80416512"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 06:20:59 -0700
X-CSE-ConnectionGUID: 5In5gmBERc6GnXEYLl1qNw==
X-CSE-MsgGUID: tR9NXNzlS+GMENt0X9a++A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="240964965"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 06:20:56 -0700
Date: Fri, 22 May 2026 15:20:52 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com,
 dev@lankhorst.se, jani.nikula@intel.com, lukasz.laguna@intel.com,
 zhanjun.dong@intel.com, lukas@wunner.de,
 daniele.ceraolospurio@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v7 0/8] Introduce Xe PCIe FLR
Message-ID: <ahBYNL4jUifMkBnd@black.igk.intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516093131.27442-1-raag.jadav@intel.com>
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

On Sat, May 16, 2026 at 03:01:23PM +0530, Raag Jadav wrote:
> Here's my humble attempt at introducing PCIe Function Level Reset (FLR)
> support in xe driver. This is ofcourse a half baked implementation and
> only limited to re-initializing GT. This needs to be extended for a lot
> of components which are expected to be added as a follow up.
> 
> Detailed description in commit message and documentation.

Anything I can do to move this forward?

Raag

> PS: All xe_exec_basic tests and clpeak run smoothly after FLR. Give it
> a spin and let me know if any regressions.
> 
> Trigger it with:
> 
> $ echo 1 > /sys/bus/pci/devices/<BDF>/reset
> 
> v2: Re-initialize migrate context (Matthew Brost)
>     Add kernel doc (Matthew Brost)
>     Spell out Function Level Reset (Jani)
> 
> v3: Cancel in-flight jobs before FLR
> 
> v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> 
> v5: Re-initialize kernel queues through submission backend (Matthew Brost)
>     Prevent PM ref leak for wedged device (Matthew Brost)
> 
> v6: Skip uC firmware selection during re-initialization (Daniele)
>     Add IS_DGFX() and EXEC_QUEUE_FLAG_KERNEL asserts (Daniele)
>     s/flr_done/reinit (Daniele)
>     Repurpose system suspend/resume helpers for FLR (Daniele)
>     Add PCIe FLR documentation (Daniele)
> 
> v7: Refine PCIe FLR documentation (Daniele)
>     Introduce xe_pci_reset_skip() helper (Lukasz)
> 
> Raag Jadav (8):
>   drm/xe/uc_fw: Allow re-initializing firmware
>   drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
>   drm/xe/gt: Introduce FLR helpers
>   drm/xe/bo_evict: Introduce xe_bo_restore_map()
>   drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
>   drm/xe/migrate: Introduce xe_migrate_reinit()
>   drm/xe/pm: Introduce xe_device_suspend/resume()
>   drm/xe/pci: Introduce PCIe FLR
> 
>  drivers/gpu/drm/xe/Makefile              |   1 +
>  drivers/gpu/drm/xe/xe_bo_evict.c         |  51 ++++++--
>  drivers/gpu/drm/xe/xe_bo_evict.h         |   2 +
>  drivers/gpu/drm/xe/xe_device.c           | 150 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h           |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  42 ++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.h       |   1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>  drivers/gpu/drm/xe/xe_execlist.c         |   6 +
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h    |   5 +
>  drivers/gpu/drm/xe/xe_gsc.c              |  14 +++
>  drivers/gpu/drm/xe/xe_gsc.h              |   1 +
>  drivers/gpu/drm/xe/xe_gt.c               |  33 +++++
>  drivers/gpu/drm/xe/xe_gt.h               |   2 +
>  drivers/gpu/drm/xe/xe_guc.c              |  29 +++++
>  drivers/gpu/drm/xe/xe_guc.h              |   2 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       |  13 ++
>  drivers/gpu/drm/xe/xe_huc.c              |  14 +++
>  drivers/gpu/drm/xe/xe_huc.h              |   1 +
>  drivers/gpu/drm/xe/xe_lrc.c              |  17 +++
>  drivers/gpu/drm/xe/xe_lrc.h              |   2 +
>  drivers/gpu/drm/xe/xe_migrate.c          |  12 ++
>  drivers/gpu/drm/xe/xe_migrate.h          |   1 +
>  drivers/gpu/drm/xe/xe_pci.c              |   1 +
>  drivers/gpu/drm/xe/xe_pci.h              |   2 +
>  drivers/gpu/drm/xe/xe_pci_error.c        | 121 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_pm.c               | 103 ++--------------
>  drivers/gpu/drm/xe/xe_uc.c               |  72 +++++++++++
>  drivers/gpu/drm/xe/xe_uc.h               |   2 +
>  drivers/gpu/drm/xe/xe_uc_fw.c            |  56 +++++++++
>  drivers/gpu/drm/xe/xe_uc_fw.h            |   1 +
>  drivers/gpu/drm/xe/xe_uc_types.h         |  14 +++
>  33 files changed, 671 insertions(+), 107 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
> 
> -- 
> 2.43.0
> 
