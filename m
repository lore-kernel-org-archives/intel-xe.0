Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E67D5B871
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 21:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7AE10E535;
	Mon, 15 Dec 2025 21:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+StiX7Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8870010E521
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 21:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765835343; x=1797371343;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tdKJEkFBR7DP/eJ1o7ueEOXqpA3ndbXwSdQWqRcdtcw=;
 b=T+StiX7Q9G4/27LIdc9emWdigmjzglkTShjcAZ7VHSSuzywPkNSeCBi0
 5Q0wAvqbaPW27p9lF8SaCA8HGtUV+Kg25OVlM5p4VcDE5Fxf5vWbCMh1O
 4IgpatUtwPK2dv6qmurfPRpcKRLkF4efaMdHh7pKnqBJ+upFFdMg4g8LO
 QIvFSSsVBX8jwjGAAo3iWZG3PCHJplMAhqEmzj+1EBV2++6HfkT2QCUQK
 yHuKkYozErNe2NAuv5EwK0py81Z0zas0kXLcAcXVjcKLM+chwLBslDR23
 sCRlILXHTkmSD4KnUEeL2TO+YLD5ICD2FszvYwk1Akhm3hnrloyLA60Sp g==;
X-CSE-ConnectionGUID: 9NCW2y41TFmdKGJQTl11MA==
X-CSE-MsgGUID: mjryWK0TRwmlSNgBF7FZBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71604276"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="71604276"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 13:49:03 -0800
X-CSE-ConnectionGUID: hvdAUWQQRPCHW84hsEHchQ==
X-CSE-MsgGUID: T31vevoeQsyQFbtnQicuag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197729835"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.128])
 ([10.245.244.128])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 13:49:01 -0800
Message-ID: <236818068ac38d0fbfe0603a84cd056d2961bfb8.camel@linux.intel.com>
Subject: Re: [PATCH v2 5/7] drm/xe: Wait on in-syncs when swicthing to
 dma-fence mode
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, francois.dugast@intel.com, 
 michal.mrozek@intel.com
Date: Mon, 15 Dec 2025 22:48:59 +0100
In-Reply-To: <aUCBrn8nGPSp4lBR@lstrano-desk.jf.intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-6-matthew.brost@intel.com>
 <f8d4426124338517d5bc9f99daf8fd665c9a0c3f.camel@linux.intel.com>
 <aUCBrn8nGPSp4lBR@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Mon, 2025-12-15 at 13:46 -0800, Matthew Brost wrote:
> On Mon, Dec 15, 2025 at 11:32:23AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2025-12-12 at 10:28 -0800, Matthew Brost wrote:
> > > If a dma-fence submission has in-fences and pagefault queues are
> > > running
> > > work, there is little incentive to kick the pagefault queues off
> > > the
> > > hardware until the dma-fence submission is ready to run.
> > > Therefore,
> > > wait
> > > on the in-fences of the dma-fence submission before removing the
> > > pagefault queues from the hardware.
> > >=20
> > > v2:
> > > =C2=A0- Fix kernel doc (CI)
> > > =C2=A0- Don't wait under lock (Thomas)
> > > =C2=A0- Make wait interruptable
> > >=20
> > > Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com=
>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++--
> > > =C2=A0drivers/gpu/drm/xe/xe_hw_engine_group.c | 44
> > > +++++++++++++++++++++--
> > > --
> > > =C2=A0drivers/gpu/drm/xe/xe_hw_engine_group.h |=C2=A0 4 ++-
> > > =C2=A0drivers/gpu/drm/xe/xe_sync.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 29 ++++++++++++++++
> > > =C2=A0drivers/gpu/drm/xe/xe_sync.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> > > =C2=A05 files changed, 78 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > b/drivers/gpu/drm/xe/xe_exec.c
> > > index 4d81210e41f5..d462add2d005 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -121,7 +121,7 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > void
> > > *data, struct drm_file *file)
> > > =C2=A0	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> > > =C2=A0	struct drm_gpuvm_exec vm_exec =3D {.extra.fn =3D
> > > xe_exec_fn};
> > > =C2=A0	struct drm_exec *exec =3D &vm_exec.exec;
> > > -	u32 i, num_syncs, num_ufence =3D 0;
> > > +	u32 i, num_syncs, num_in_sync =3D 0, num_ufence =3D 0;
> > > =C2=A0	struct xe_validation_ctx ctx;
> > > =C2=A0	struct xe_sched_job *job;
> > > =C2=A0	struct xe_vm *vm;
> > > @@ -182,6 +182,9 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > void
> > > *data, struct drm_file *file)
> > > =C2=A0
> > > =C2=A0		if (xe_sync_is_ufence(&syncs[num_syncs]))
> > > =C2=A0			num_ufence++;
> > > +
> > > +		if (!num_in_sync &&
> > > xe_sync_needs_wait(&syncs[num_syncs]))
> > > +			num_in_sync++;
> > > =C2=A0	}
> > > =C2=A0
> > > =C2=A0	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
> > > @@ -202,7 +205,9 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > void
> > > *data, struct drm_file *file)
> > > =C2=A0	mode =3D xe_hw_engine_group_find_exec_mode(q);
> > > =C2=A0
> > > =C2=A0	if (mode =3D=3D EXEC_MODE_DMA_FENCE) {
> > > -		err =3D xe_hw_engine_group_get_mode(group, mode,
> > > &previous_mode);
> > > +		err =3D xe_hw_engine_group_get_mode(group, mode,
> > > &previous_mode,
> > > +						=C2=A0 syncs,
> > > num_in_sync
> > > ?
> > > +						=C2=A0 num_syncs :
> > > 0);
> > > =C2=A0		if (err)
> > > =C2=A0			goto err_syncs;
> > > =C2=A0	}
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > index 4d9263a1a208..022fc0c30d38 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > @@ -11,6 +11,7 @@
> > > =C2=A0#include "xe_gt.h"
> > > =C2=A0#include "xe_gt_stats.h"
> > > =C2=A0#include "xe_hw_engine_group.h"
> > > +#include "xe_sync.h"
> > > =C2=A0#include "xe_vm.h"
> > > =C2=A0
> > > =C2=A0static void
> > > @@ -21,7 +22,8 @@ hw_engine_group_resume_lr_jobs_func(struct
> > > work_struct *w)
> > > =C2=A0	int err;
> > > =C2=A0	enum xe_hw_engine_group_execution_mode previous_mode;
> > > =C2=A0
> > > -	err =3D xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > > &previous_mode);
> > > +	err =3D xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > > &previous_mode,
> > > +					=C2=A0 NULL, 0);
> > > =C2=A0	if (err)
> > > =C2=A0		return;
> > > =C2=A0
> > > @@ -189,10 +191,12 @@ void
> > > xe_hw_engine_group_resume_faulting_lr_jobs(struct
> > > xe_hw_engine_group
> > > *group
> > > =C2=A0/**
> > > =C2=A0 * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the
> > > faulting LR jobs of this group
> > > =C2=A0 * @group: The hw engine group
> > > + * @has_deps: dma-fence job triggering suspend has dependencies
> > > =C2=A0 *
> > > =C2=A0 * Return: 0 on success, negative error code on error.
> > > =C2=A0 */
> > > -static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > > xe_hw_engine_group *group)
> > > +static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > > xe_hw_engine_group *group,
> > > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool
> > > has_deps)
> > > =C2=A0{
> > > =C2=A0	int err;
> > > =C2=A0	struct xe_exec_queue *q;
> > > @@ -201,11 +205,19 @@ static int
> > > xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > > xe_hw_engine_group
> > > =C2=A0	lockdep_assert_held_write(&group->mode_sem);
> > > =C2=A0
> > > =C2=A0	list_for_each_entry(q, &group->exec_queue_list,
> > > hw_engine_group_link) {
> > > +		bool idle_skip_suspend;
> > > +
> > > =C2=A0		if (!xe_vm_in_fault_mode(q->vm))
> > > =C2=A0			continue;
> > > =C2=A0
> > > +		idle_skip_suspend =3D
> > > xe_exec_queue_idle_skip_suspend(q);
> > > +		if (!idle_skip_suspend && has_deps)
> > > +			return -EAGAIN;
> > > +
> > > =C2=A0		xe_gt_stats_incr(q->gt,
> > > XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> > > -		need_resume |=3D
> > > !xe_exec_queue_idle_skip_suspend(q);
> > > +
> > > +
> > > +		need_resume |=3D !idle_skip_suspend;
> > > =C2=A0		q->ops->suspend(q);
> > > =C2=A0	}
> > > =C2=A0
> > > @@ -258,7 +270,7 @@ static int
> > > xe_hw_engine_group_wait_for_dma_fence_jobs(struct
> > > xe_hw_engine_group
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > =C2=A0
> > > -static int switch_mode(struct xe_hw_engine_group *group)
> > > +static int switch_mode(struct xe_hw_engine_group *group, bool
> > > has_deps)
> > > =C2=A0{
> > > =C2=A0	int err =3D 0;
> > > =C2=A0	enum xe_hw_engine_group_execution_mode new_mode;
> > > @@ -268,7 +280,8 @@ static int switch_mode(struct
> > > xe_hw_engine_group
> > > *group)
> > > =C2=A0	switch (group->cur_mode) {
> > > =C2=A0	case EXEC_MODE_LR:
> > > =C2=A0		new_mode =3D EXEC_MODE_DMA_FENCE;
> > > -		err =3D
> > > xe_hw_engine_group_suspend_faulting_lr_jobs(group);
> > > +		err =3D
> > > xe_hw_engine_group_suspend_faulting_lr_jobs(group,
> > > +								=C2=A0
> > > has_deps);
> > > =C2=A0		break;
> > > =C2=A0	case EXEC_MODE_DMA_FENCE:
> > > =C2=A0		new_mode =3D EXEC_MODE_LR;
> > > @@ -289,14 +302,18 @@ static int switch_mode(struct
> > > xe_hw_engine_group *group)
> > > =C2=A0 * @group: The hw engine group
> > > =C2=A0 * @new_mode: The new execution mode
> > > =C2=A0 * @previous_mode: Pointer to the previous mode provided for us=
e
> > > by
> > > caller
> > > + * @syncs: Syncs from exec IOCTL
> > > + * @num_syncs: Number of syncs from exec IOCTL
> > > =C2=A0 *
> > > =C2=A0 * Return: 0 if successful, -EINTR if locking failed.
> > > =C2=A0 */
> > > =C2=A0int xe_hw_engine_group_get_mode(struct xe_hw_engine_group
> > > *group,
> > > =C2=A0				enum
> > > xe_hw_engine_group_execution_mode new_mode,
> > > -				enum
> > > xe_hw_engine_group_execution_mode *previous_mode)
> > > +				enum
> > > xe_hw_engine_group_execution_mode *previous_mode,
> > > +				struct xe_sync_entry *syncs, int
> > > num_syncs)
> > > =C2=A0__acquires(&group->mode_sem)
> > > =C2=A0{
> > > +	bool has_deps =3D !!num_syncs;
> > > =C2=A0	int err =3D down_read_interruptible(&group->mode_sem);
> > > =C2=A0
> > > =C2=A0	if (err)
> > > @@ -306,14 +323,27 @@ __acquires(&group->mode_sem)
> > > =C2=A0
> > > =C2=A0	if (new_mode !=3D group->cur_mode) {
> > > =C2=A0		up_read(&group->mode_sem);
> > > +retry:
> > > =C2=A0		err =3D down_write_killable(&group->mode_sem);
> > > =C2=A0		if (err)
> > > =C2=A0			return err;
> > > =C2=A0
> > > =C2=A0		if (new_mode !=3D group->cur_mode) {
> > > -			err =3D switch_mode(group);
> > > +			err =3D switch_mode(group, has_deps);
> > > =C2=A0			if (err) {
> > > =C2=A0				up_write(&group->mode_sem);
> > > +				if (err =3D=3D -EAGAIN) {
> > > +					int i;
> > > +
> > > +					for (i =3D 0; i <
> > > num_syncs;
> > > ++i) {
> > > +						err =3D
> > > xe_sync_entry_wait(syncs + i);
> > > +						if (err)
> > > +							return
> > > err;
> > > +					}
> > > +
> > > +					has_deps =3D false;
> > > +					goto retry;
> > > +				}
> > > =C2=A0				return err;
> > > =C2=A0			}
> > > =C2=A0		}
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > index 797ee81acbf2..8b17ccd30b70 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > @@ -11,6 +11,7 @@
> > > =C2=A0struct drm_device;
> > > =C2=A0struct xe_exec_queue;
> > > =C2=A0struct xe_gt;
> > > +struct xe_sync_entry;
> > > =C2=A0
> > > =C2=A0int xe_hw_engine_setup_groups(struct xe_gt *gt);
> > > =C2=A0
> > > @@ -19,7 +20,8 @@ void xe_hw_engine_group_del_exec_queue(struct
> > > xe_hw_engine_group *group, struct
> > > =C2=A0
> > > =C2=A0int xe_hw_engine_group_get_mode(struct xe_hw_engine_group
> > > *group,
> > > =C2=A0				enum
> > > xe_hw_engine_group_execution_mode new_mode,
> > > -				enum
> > > xe_hw_engine_group_execution_mode *previous_mode);
> > > +				enum
> > > xe_hw_engine_group_execution_mode *previous_mode,
> > > +				struct xe_sync_entry *syncs, int
> > > num_syncs);
> > > =C2=A0void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> > > =C2=A0
> > > =C2=A0enum xe_hw_engine_group_execution_mode
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > > b/drivers/gpu/drm/xe/xe_sync.c
> > > index 1fc4fa278b78..d970e11962ff 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -228,6 +228,35 @@ int xe_sync_entry_add_deps(struct
> > > xe_sync_entry
> > > *sync, struct xe_sched_job *job)
> > > =C2=A0	return 0;
> > > =C2=A0}
> > > =C2=A0
> > > +/**
> > > + * xe_sync_entry_wait() - Wait on in-sync
> > > + * @sync: Sync object
> > > + *
> > > + * If the sync is in an in-sync, wait on the sync to signal.
> > > + *
> > > + * Return: 0 on success, -ERESTARTSYS on failure (interruption)
> > > + */
> > > +int xe_sync_entry_wait(struct xe_sync_entry *sync)
> > > +{
> > > +	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
> > > +		return 0;
> > > +
> > > +	return dma_fence_wait(sync->fence, true);
> > > +}
> > > +
> > > +/**
> > > + * xe_sync_needs_wait() - Sync needs a wait (input dma-fence not
> > > signaled)
> > > + * @sync: Sync object
> > > + *
> > > + * Return: True if sync needs a wait, False otherwise
> > > + */
> > > +bool xe_sync_needs_wait(struct xe_sync_entry *sync)
> > > +{
> > > +
> > > +	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) &&
> > > +		!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync-
> > > >fence-
> > > > flags);
> >=20
> > dma_fence_is_signaled() ?
> >=20
>=20
> I don't want to signal the fence here, Phillip Stanner merged a
> dma-fence helper that does this check to drm-misc-next but this
> change
> hasn't made it to dma-xe-next yet. I have patch built on top of his
> series to to convert Xe to use these helpers, when I rebase that
> patch
> I'll fixup this code too.

OK. Just out of interest, why not signal the fence here?
/Thomas


>=20
> Matt=20
>=20
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > > +}
> > > +
> > > =C2=A0void xe_sync_entry_signal(struct xe_sync_entry *sync, struct
> > > dma_fence *fence)
> > > =C2=A0{
> > > =C2=A0	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.h
> > > b/drivers/gpu/drm/xe/xe_sync.h
> > > index 51f2d803e977..6b949194acff 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.h
> > > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > > @@ -29,6 +29,8 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> > > *sync,
> > > =C2=A0			=C2=A0=C2=A0 struct xe_sched_job *job);
> > > =C2=A0void xe_sync_entry_signal(struct xe_sync_entry *sync,
> > > =C2=A0			=C2=A0 struct dma_fence *fence);
> > > +int xe_sync_entry_wait(struct xe_sync_entry *sync);
> > > +bool xe_sync_needs_wait(struct xe_sync_entry *sync);
> > > =C2=A0void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> > > =C2=A0struct dma_fence *
> > > =C2=A0xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> >=20

