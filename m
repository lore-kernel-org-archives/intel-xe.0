Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A7CF36BA7
	for <intel-xe@archiver.kernel.org>; Sat, 11 Apr 2026 08:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330F610E012;
	Sat, 11 Apr 2026 08:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZiTJJW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2AE10E012
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Apr 2026 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775895080; x=1807431080;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vcM3vhVRNrhK0gQIDcGB40lYX5Xx204ZiQVU9sD/5qw=;
 b=mZiTJJW5H0XKCw50GFa5s/E2nD6vijXzYQVkysz9PXYJ7rdxi/nAZSPU
 0acKgTF+LVan45zDjePISAxyGBIyYnCBLn+eehILQ150pYDdjK+La8F9p
 lgaJpHEkBxOwpY1IOv/3McoOTrRKqt+YkyUdpJIul10Dxw8C58VytZU4x
 JH04l54lite6pjnq+cPwyKeePMFa6+A36fQl44s0x3LqYl4rGXyFhaVO2
 vWNweeuxYUllpm4wXdRMnvuPvkun5f7jHyOeHzCLgmtd15zeBXuRwuc30
 L8BZ1P9O1fnrrM8LIdjP4alUBztiQ9dpxRQRUBHZ+2xjSe20m7zpShcgk A==;
X-CSE-ConnectionGUID: eY/p4+AsReqJ201G1EpT8g==
X-CSE-MsgGUID: bOqvx/8XRROEVqNX4pJcnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="94481841"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="94481841"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 01:11:19 -0700
X-CSE-ConnectionGUID: 3eCMEo/ARR6Fkjb+5EWuHQ==
X-CSE-MsgGUID: J2vBArRUS/aYe9eYiv//hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; d="scan'208";a="229191903"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2026 01:11:16 -0700
Date: Sat, 11 Apr 2026 10:11:12 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Maarten Lankhorst <maarten@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com,
 matthew.auld@intel.com, jani.nikula@intel.com,
 lukasz.laguna@intel.com, zhanjun.dong@intel.com, lukas@wunner.de,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH v5 0/9] Introduce Xe PCIe FLR
Message-ID: <adoCIEFbFEeCpsW3@black.igk.intel.com>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <adkHpG9RWUGfu60X@black.igk.intel.com>
 <a30d5ecc-a097-4511-9b51-c17535b7f8b7@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a30d5ecc-a097-4511-9b51-c17535b7f8b7@lankhorst.se>
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

On Fri, Apr 10, 2026 at 08:22:54PM +0200, Maarten Lankhorst wrote:
> To me the series looks ok, I don't know if anyone else has objections but might be good to at least have an ack from display.

Jani? Ville? Any input on this?

Raag

> Den 2026-04-10 kl. 16:22, skrev Raag Jadav:
> > On Mon, Apr 06, 2026 at 07:37:13PM +0530, Raag Jadav wrote:
> >> Here's my humble attempt at introducing PCIe Function Level Reset (FLR)
> >> support in xe driver. This is ofcourse a half baked implementation and
> >> only limited to re-initializing GT. This needs to be extended for a lot
> >> of different components which I've skipped here for my lack of competence,
> >> so feel free to join in and support them.
> >>
> >> PS: All xe_exec_basic tests and clpeak run smoothly after FLR. Give it
> >> a spin and let me know if any regressions.
> >>
> >> Trigger it with:
> >>
> >> $ echo 1 > /sys/bus/pci/devices/<BDF>/reset
> > Anything I can do to move this forward?
> >
> > Raag
> >
> >> v2: Re-initialize migrate context (Matthew Brost)
> >>     Add kernel doc (Matthew Brost)
> >>     Spell out Function Level Reset (Jani)
> >>
> >> v3: Cancel in-flight jobs before FLR
> >>
> >> v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> >>
> >> v5: Re-initialize kernel queues through submission backend (Matthew Brost)
> >>     Prevent PM ref leak for wedged device (Matthew Brost)
> >>
> >> Raag Jadav (9):
> >>   drm/xe/uc_fw: Allow re-initializing firmware
> >>   drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
> >>   drm/xe/gt: Introduce FLR helpers
> >>   drm/xe/irq: Introduce xe_irq_disable()
> >>   drm/xe: Introduce xe_device_assert_lmem_ready()
> >>   drm/xe/bo_evict: Introduce xe_bo_restore_map()
> >>   drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
> >>   drm/xe/migrate: Introduce xe_migrate_reinit()
> >>   drm/xe/pci: Introduce PCIe FLR
> >>
> >>  drivers/gpu/drm/xe/Makefile              |   1 +
> >>  drivers/gpu/drm/xe/xe_bo_evict.c         |  51 ++++++--
> >>  drivers/gpu/drm/xe/xe_bo_evict.h         |   2 +
> >>  drivers/gpu/drm/xe/xe_device.c           |  10 +-
> >>  drivers/gpu/drm/xe/xe_device.h           |   1 +
> >>  drivers/gpu/drm/xe/xe_device_types.h     |   3 +
> >>  drivers/gpu/drm/xe/xe_exec_queue.c       |  37 +++++-
> >>  drivers/gpu/drm/xe/xe_exec_queue.h       |   1 +
> >>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
> >>  drivers/gpu/drm/xe/xe_gpu_scheduler.h    |   5 +
> >>  drivers/gpu/drm/xe/xe_gsc.c              |  14 ++
> >>  drivers/gpu/drm/xe/xe_gsc.h              |   1 +
> >>  drivers/gpu/drm/xe/xe_gt.c               |  47 +++++++
> >>  drivers/gpu/drm/xe/xe_gt.h               |   2 +
> >>  drivers/gpu/drm/xe/xe_gt_types.h         |   9 ++
> >>  drivers/gpu/drm/xe/xe_guc.c              |  29 ++++
> >>  drivers/gpu/drm/xe/xe_guc.h              |   2 +
> >>  drivers/gpu/drm/xe/xe_guc_submit.c       |  11 ++
> >>  drivers/gpu/drm/xe/xe_huc.c              |  14 ++
> >>  drivers/gpu/drm/xe/xe_huc.h              |   1 +
> >>  drivers/gpu/drm/xe/xe_irq.c              |  13 +-
> >>  drivers/gpu/drm/xe/xe_irq.h              |   1 +
> >>  drivers/gpu/drm/xe/xe_lrc.c              |  17 +++
> >>  drivers/gpu/drm/xe/xe_lrc.h              |   2 +
> >>  drivers/gpu/drm/xe/xe_migrate.c          |  12 ++
> >>  drivers/gpu/drm/xe/xe_migrate.h          |   1 +
> >>  drivers/gpu/drm/xe/xe_pci.c              |   1 +
> >>  drivers/gpu/drm/xe/xe_pci.h              |   2 +
> >>  drivers/gpu/drm/xe/xe_pci_err.c          | 160 +++++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_uc.c               |  37 ++++++
> >>  drivers/gpu/drm/xe/xe_uc.h               |   2 +
> >>  drivers/gpu/drm/xe/xe_uc_fw.c            |  39 +++++-
> >>  drivers/gpu/drm/xe/xe_uc_fw.h            |   1 +
> >>  33 files changed, 510 insertions(+), 21 deletions(-)
> >>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> >>
> >> -- 
> >> 2.43.0
> >>
> 
