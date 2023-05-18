Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100CFC77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 21:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66A310E558;
	Thu, 18 May 2023 21:14:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1B810E558
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 21:14:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60DBC61B8D;
 Thu, 18 May 2023 21:14:05 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 5E986C433D2;
 Thu, 18 May 2023 21:14:02 +0000 (UTC)
Date: Thu, 18 May 2023 17:13:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZGaVF3TVOf9QSCO4@rdvivi-mobl4>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
 <20230517132115.GA130496@kav-xto-001.ka.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230517132115.GA130496@kav-xto-001.ka.intel.com>
Subject: Re: [Intel-xe] [PATCH v4 01/11] drm/xe: Introduce the dev_coredump
 infrastructure.
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 03:21:15PM +0200, Francois Dugast wrote:
> On Tue, May 16, 2023 at 10:54:06AM -0400, Rodrigo Vivi wrote:
> > The goal is to use devcoredump infrastructure to report error states
> > captured at the crash time.
> > 
> > The error state will contain useful information for GPU hang debug, such
> > as INSTDONE registers and the current buffers getting executed, as well
> > as any other information that helps user space and allow later replays of
> > the error.
> > 
> > The proposal here is to avoid a Xe only error_state like i915 and use
> > a standard dev_coredump infrastructure to expose the error state.
> > 
> > For our own case, the data is only useful if it is a snapshot of the
> > time when the GPU crash has happened, since we reset the GPU immediately
> > after and the registers might have changed. So the proposal here is to
> > have an internal snapshot to be printed out later.
> > 
> > Also, usually a subsequent GPU hang can be only a cause of the initial
> > one. So we only save the 'first' hang. The dev_coredump has a delayed
> > work queue where it remove the coredump and free all the data within a
> > few moments of the error. When that happens we also reset our capture
> > state and allow further snapshots.
> > 
> > Right now this infra only print out the time of the hang. More information
> > will be migrated here on subsequent work. Also, in order to organize the
> > dump better, the goal is to propose dev_coredump changes itself to allow
> > multiple files and different controls. But for now we start Xe usage of
> > it without any dependency on dev_coredump core changes.
> > 
> > v2: Add dma_fence annotation for capture that might happen during long
> >     running. (Thomas and Matt)
> >     Use xe->drm.primary->index on drm_info msg. (Jani)
> > v3: checkpatch fixes
> > v4: Fix building and locking issues found by Francois.
> >     Actually let's kill all of the locking in here. gt_reset serialization
> >     already guarantee that there will be only one capture at the same time.
> >     Also, the devcoredump has its own locking to protect the free and reads
> >     and drivers don't need to duplicate it.
> >     Besides this, the dma_fence locking was pushed to a following patch
> >     since it is not needed in this one.
> >     Fix a use after free identified by KASAN: Do not stash the faulty_engine
> >     since that will be freed somewhere else.
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v3
> > ---
> >  drivers/gpu/drm/xe/Kconfig                |   1 +
> >  drivers/gpu/drm/xe/Makefile               |   1 +
> >  drivers/gpu/drm/xe/xe_devcoredump.c       | 128 ++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_devcoredump.h       |  20 ++++
> >  drivers/gpu/drm/xe/xe_devcoredump_types.h |  45 ++++++++
> >  drivers/gpu/drm/xe/xe_device_types.h      |   4 +
> >  drivers/gpu/drm/xe/xe_guc_submit.c        |   2 +
> >  7 files changed, 201 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index f6f3b491d162..d44794f99338 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -35,6 +35,7 @@ config DRM_XE
> >  	select DRM_TTM_HELPER
> >  	select DRM_SCHED
> >  	select MMU_NOTIFIER
> > +	select WANT_DEV_COREDUMP
> >  	help
> >  	  Experimental driver for Intel Xe series GPUs
> >  
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index b6c41cd7dbe3..678c9d84e50e 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -34,6 +34,7 @@ xe-y += xe_bb.o \
> >  	xe_bo.o \
> >  	xe_bo_evict.o \
> >  	xe_debugfs.o \
> > +	xe_devcoredump.o \
> >  	xe_device.o \
> >  	xe_dma_buf.o \
> >  	xe_engine.o \
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > new file mode 100644
> > index 000000000000..56cda4bf35d8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > @@ -0,0 +1,128 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#include "xe_devcoredump.h"
> > +#include "xe_devcoredump_types.h"
> > +
> > +#include <linux/devcoredump.h>
> > +#include <generated/utsrelease.h>
> > +
> > +#include "xe_engine.h"
> > +#include "xe_gt.h"
> > +
> > +/**
> > + * DOC: Xe device coredump
> > + *
> > + * Devices overview:
> > + * Xe uses dev_coredump infrastructure for exposing the crash errors in a
> > + * standardized way.
> > + * devcoredump exposes a temporary device under /sys/class/devcoredump/
> > + * which is linked with our card device directly.
> > + * The core dump can be accessed either from
> > + * /sys/class/drm/card<n>/device/devcoredump/ or from
> > + * /sys/class/devcoredump/devcd<m> where
> > + * /sys/class/devcoredump/devcd<m>/failing_device is a link to
> > + * /sys/class/drm/card<n>/device/.
> > + *
> > + * Snapshot at hang:
> > + * The 'data' file is printed with a drm_printer pointer at devcoredump read
> > + * time. For this reason, we need to take snapshots from when the hang has
> > + * happened, and not only when the user is reading the file. Otherwise the
> > + * information is outdated since the resets might have happened in between.
> > + *
> > + * 'First' failure snapshot:
> > + * In general, the first hang is the most critical one since the following hangs
> > + * can be a consequence of the initial hang. For this reason we only take the
> > + * snapshot of the 'first' failure and ignore subsequent calls of this function,
> > + * at least while the coredump device is alive. Dev_coredump has a delayed work
> > + * queue that will eventually delete the device and free all the dump
> > + * information.
> > + */
> > +
> > +#ifdef CONFIG_DEV_COREDUMP
> > +
> > +static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
> > +{
> > +	return container_of(coredump, struct xe_device, devcoredump);
> > +}
> > +
> > +static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > +				   size_t count, void *data, size_t datalen)
> > +{
> > +	struct xe_devcoredump *coredump = data;
> > +	struct xe_devcoredump_snapshot *ss;
> > +	struct drm_printer p;
> > +	struct drm_print_iterator iter;
> > +	struct timespec64 ts;
> > +
> > +	iter.data = buffer;
> > +	iter.offset = 0;
> > +	iter.start = offset;
> > +	iter.remain = count;
> > +
> > +	ss = &coredump->snapshot;
> > +	p = drm_coredump_printer(&iter);
> > +
> > +	drm_printf(&p, "**** Xe Device Coredump ****\n");
> > +	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> > +	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> > +
> > +	ts = ktime_to_timespec64(ss->snapshot_time);
> > +	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > +	ts = ktime_to_timespec64(ss->boot_time);
> > +	drm_printf(&p, "Boot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > +	ts = ktime_to_timespec64(ktime_sub(ss->snapshot_time, ss->boot_time));
> > +	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> 
> Wondering if the terms are not mixed up: here "Uptime:" shows the time at
> boot while "Boot time:" shows ktime_get_boottime, which is used as uptime
> for example under /proc/uptime.

Good catch. I was actually only interested in the Uptime, but then wrongly
assumed the boot_time was the time of the boot. But I found the right
definition at Documentation/core-api/timekeeping.rst

Fixed now.

> 
> > +
> > +	return count - iter.remain;
> > +}
> > +
> > +static void xe_devcoredump_free(void *data)
> > +{
> > +	struct xe_devcoredump *coredump = data;
> > +
> > +	coredump->captured = false;
> > +	drm_info(&coredump_to_xe(coredump)->drm,
> > +		 "Xe device coredump has been deleted.\n");
> > +}
> > +
> > +static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > +				 struct xe_engine *e)
> > +{
> > +	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
> > +
> > +	ss->snapshot_time = ktime_get_real();
> > +	ss->boot_time = ktime_get_boottime();
> > +}
> > +
> > +/**
> > + * xe_devcoredump - Take the required snapshots and initialize coredump device.
> > + * @e: The faulty xe_engine, where the issue was detected.
> > + *
> > + * This function should be called at the crash time within the serialized
> > + * gt_reset. It is skipped if we still have the core dump device available
> > + * with the information of the 'first' snapshot.
> > + */
> > +void xe_devcoredump(struct xe_engine *e)
> > +{
> > +	struct xe_device *xe = gt_to_xe(e->gt);
> > +	struct xe_devcoredump *coredump = &xe->devcoredump;
> > +
> > +	if (coredump->captured) {
> > +		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> > +		return;
> > +	}
> > +
> > +	coredump->captured = true;
> > +	devcoredump_snapshot(coredump, e);
> > +
> > +	drm_info(&xe->drm, "Xe device coredump has been created\n");
> > +	drm_info(&xe->drm, "Check your /sys/class/drm/card%d/device/devcoredump/data\n",
> > +		 xe->drm.primary->index);
> > +
> > +	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> > +		      xe_devcoredump_read, xe_devcoredump_free);
> > +}
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> > new file mode 100644
> > index 000000000000..854882129227
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_DEVCOREDUMP_H_
> > +#define _XE_DEVCOREDUMP_H_
> > +
> > +struct xe_device;
> > +struct xe_engine;
> > +
> > +#ifdef CONFIG_DEV_COREDUMP
> > +void xe_devcoredump(struct xe_engine *e);
> > +#else
> > +static inline void xe_devcoredump(struct xe_engine *e)
> > +{
> > +}
> > +#endif
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > new file mode 100644
> > index 000000000000..52bd27ca1036
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > @@ -0,0 +1,45 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2023 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_DEVCOREDUMP_TYPES_H_
> > +#define _XE_DEVCOREDUMP_TYPES_H_
> > +
> > +#include <linux/ktime.h>
> > +#include <linux/mutex.h>
> > +
> > +struct xe_device;
> > +
> > +/**
> > + * struct xe_devcoredump_snapshot - Crash snapshot
> > + *
> > + * This struct contains all the useful information quickly captured at the time
> > + * of the crash. So, any subsequent reads of the coredump points to a data that
> > + * shows the state of the GPU of when the issue has happened.
> > + */
> > +struct xe_devcoredump_snapshot {
> > +	/** @snapshot_time:  Time of this capture. */
> > +	ktime_t snapshot_time;
> > +	/** @boot_time:  Relative boot time so the uptime can be calculated. */
> > +	ktime_t boot_time;
> > +};
> > +
> > +/**
> > + * struct xe_devcoredump - Xe devcoredump main structure
> > + *
> > + * This struct represents the live and active dev_coredump node.
> > + * It is created/populated at the time of a crash/error. Then it
> > + * is read later when user access the device coredump data file
> > + * for reading the information.
> > + */
> > +struct xe_devcoredump {
> > +	/** @xe: Xe device. */
> > +	struct xe_device *xe;
> > +	/** @captured: The snapshot of the first hang has already been taken. */
> > +	bool captured;
> > +	/** @snapshot: Snapshot is captured at time of the first crash */
> > +	struct xe_devcoredump_snapshot snapshot;
> > +};
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 6490a04614ce..197ee4090fed 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -12,6 +12,7 @@
> >  #include <drm/drm_file.h>
> >  #include <drm/ttm/ttm_device.h>
> >  
> > +#include "xe_devcoredump_types.h"
> >  #include "xe_gt_types.h"
> >  #include "xe_platform_types.h"
> >  #include "xe_step_types.h"
> > @@ -55,6 +56,9 @@ struct xe_device {
> >  	/** @drm: drm device */
> >  	struct drm_device drm;
> >  
> > +	/** @devcoredump: device coredump */
> > +	struct xe_devcoredump devcoredump;
> > +
> 
> Do we need this if CONFIG_DEV_COREDUMP is disabled?
> 
> Other than that this LGTM.
> 
> Francois
> 
> >  	/** @info: device info */
> >  	struct intel_device_info {
> >  		/** @graphics_name: graphics IP name */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index e857013070b9..231fb4145297 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -14,6 +14,7 @@
> >  #include <drm/drm_managed.h>
> >  
> >  #include "regs/xe_lrc_layout.h"
> > +#include "xe_devcoredump.h"
> >  #include "xe_device.h"
> >  #include "xe_engine.h"
> >  #include "xe_force_wake.h"
> > @@ -800,6 +801,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
> >  		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
> >  			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> >  		simple_error_capture(e);
> > +		xe_devcoredump(e);
> >  	} else {
> >  		drm_dbg(&xe->drm, "Timedout signaled job: seqno=%u, guc_id=%d, flags=0x%lx",
> >  			 xe_sched_job_seqno(job), e->guc->id, e->flags);
> > -- 
> > 2.39.2
> > 
