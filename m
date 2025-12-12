Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838B4D4415B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 09:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DF210E180;
	Fri, 12 Dec 2025 09:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwPelTkv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EBE10E180
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765531379; x=1797067379;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=J1SgTzPEZz3RVCR8tBGhuMfbtQHDuFgXHQOaN42+WRU=;
 b=JwPelTkvkXK7kMQyjihiQ3QgKcFSp8ZenMReMjBeNTdXCjabtN3Tozqc
 Pq9ZeU9SrtiDVMAYKO44XAT3e4cnOFRL7dHA4aI1M8obrkmlctoyjLe48
 ggVosFiUvbSup7pRI6sK9Fg7xG+Dnc/m4OaJEGDfzytLV0dDNPejcrETx
 qkfHBsMdHcB3rEmz963Xxvoqe66m0lCIHkpqdlXLujowWurtV9mZ5D/u/
 mvZJ8BfGYMJ52vz0kUlpSyjZ03EH3Ktb5XtO/jL/9duZpHiQd9My42WAY
 ThlE4JF9PHIZbNOrH7tcawJZDfHOwG/LmcQ7I/NKmlyitAtayWNe3B5oE Q==;
X-CSE-ConnectionGUID: CYOL3vpySs2LTsVZLX6JuA==
X-CSE-MsgGUID: MPdz+AkMS9CWRu3wJ1k64w==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67560382"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67560382"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:22:59 -0800
X-CSE-ConnectionGUID: e1rRpixARZiN4uI5ah/oww==
X-CSE-MsgGUID: WsiA/aiNQ+2n1YJrtuTw6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197520057"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.106])
 ([10.245.245.106])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:22:57 -0800
Message-ID: <97f524d334045e0819cee861e6e7d21598509424.camel@linux.intel.com>
Subject: Re: [PATCH 5/6] drm/xe: Wait on in-syncs when swicthing to
 dma-fence mode
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, michal.mrozek@intel.com
Date: Fri, 12 Dec 2025 10:22:54 +0100
In-Reply-To: <20251211210032.1520113-6-matthew.brost@intel.com>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
 <20251211210032.1520113-6-matthew.brost@intel.com>
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

On Thu, 2025-12-11 at 13:00 -0800, Matthew Brost wrote:
> If a dma-fence submission has in-fences and pagefault queues are
> running
> work, there is little incentive to kick the pagefault queues off the
> hardware until the dma-fence submission is ready to run. Therefore,
> wait
> on the in-fences of the dma-fence submission before removing the
> pagefault queues from the hardware.
>=20
> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/xe/xe_hw_engine_group.c | 34 +++++++++++++++++++---=
-
> --
> =C2=A0drivers/gpu/drm/xe/xe_hw_engine_group.h |=C2=A0 4 ++-
> =C2=A0drivers/gpu/drm/xe/xe_sync.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_sync.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A05 files changed, 46 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c
> b/drivers/gpu/drm/xe/xe_exec.c
> index 4d81210e41f5..5bc598ba6afa 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -202,7 +202,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
> =C2=A0	mode =3D xe_hw_engine_group_find_exec_mode(q);
> =C2=A0
> =C2=A0	if (mode =3D=3D EXEC_MODE_DMA_FENCE) {
> -		err =3D xe_hw_engine_group_get_mode(group, mode,
> &previous_mode);
> +		err =3D xe_hw_engine_group_get_mode(group, mode,
> &previous_mode,
> +						=C2=A0 syncs, num_syncs);
> =C2=A0		if (err)
> =C2=A0			goto err_syncs;
> =C2=A0	}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 4d9263a1a208..35966889c776 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -11,6 +11,7 @@
> =C2=A0#include "xe_gt.h"
> =C2=A0#include "xe_gt_stats.h"
> =C2=A0#include "xe_hw_engine_group.h"
> +#include "xe_sync.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0
> =C2=A0static void
> @@ -21,7 +22,8 @@ hw_engine_group_resume_lr_jobs_func(struct
> work_struct *w)
> =C2=A0	int err;
> =C2=A0	enum xe_hw_engine_group_execution_mode previous_mode;
> =C2=A0
> -	err =3D xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> &previous_mode);
> +	err =3D xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> &previous_mode,
> +					=C2=A0 NULL, 0);
> =C2=A0	if (err)
> =C2=A0		return;
> =C2=A0
> @@ -192,20 +194,32 @@ void
> xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group
> *group
> =C2=A0 *
> =C2=A0 * Return: 0 on success, negative error code on error.
> =C2=A0 */
> -static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> xe_hw_engine_group *group)
> +static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> xe_hw_engine_group *group,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> xe_sync_entry *syncs,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int
> num_syncs)
> =C2=A0{
> -	int err;
> +	int err, i;
> =C2=A0	struct xe_exec_queue *q;
> =C2=A0	bool need_resume =3D false;
> =C2=A0
> =C2=A0	lockdep_assert_held_write(&group->mode_sem);
> =C2=A0
> =C2=A0	list_for_each_entry(q, &group->exec_queue_list,
> hw_engine_group_link) {
> +		bool idle_skip_suspend;
> +
> =C2=A0		if (!xe_vm_in_fault_mode(q->vm))
> =C2=A0			continue;
> =C2=A0
> =C2=A0		xe_gt_stats_incr(q->gt,
> XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> -		need_resume |=3D !xe_exec_queue_idle_skip_suspend(q);
> +
> +		idle_skip_suspend =3D
> xe_exec_queue_idle_skip_suspend(q);
> +
> +		if (!need_resume && !idle_skip_suspend && num_syncs)
> {
> +			for (i =3D 0; i < num_syncs; ++i)
> +				xe_sync_entry_wait(syncs + i);

Here we're in the write-locked mode, right? Ideally I think we should
just check for idle here and return a retry if not idle, and wait
outside of the locks. Perhaps also always wait if there are pf jobs
running on the engine group. Also we might want to include the other
implicit dependencies as well, like kernel fences.

Although perhaps this is good enough for now, and this would be easier
implemented with a scheduler?

/Thomas


> +		}
> +
> +		need_resume |=3D !idle_skip_suspend;
> =C2=A0		q->ops->suspend(q);
> =C2=A0	}
> =C2=A0
> @@ -258,7 +272,8 @@ static int
> xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int switch_mode(struct xe_hw_engine_group *group)
> +static int switch_mode(struct xe_hw_engine_group *group,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_sync_entry *syncs, int =
num_syncs)
> =C2=A0{
> =C2=A0	int err =3D 0;
> =C2=A0	enum xe_hw_engine_group_execution_mode new_mode;
> @@ -268,7 +283,9 @@ static int switch_mode(struct xe_hw_engine_group
> *group)
> =C2=A0	switch (group->cur_mode) {
> =C2=A0	case EXEC_MODE_LR:
> =C2=A0		new_mode =3D EXEC_MODE_DMA_FENCE;
> -		err =3D
> xe_hw_engine_group_suspend_faulting_lr_jobs(group);
> +		err =3D
> xe_hw_engine_group_suspend_faulting_lr_jobs(group,
> +								=C2=A0
> syncs,
> +								=C2=A0
> num_syncs);
> =C2=A0		break;
> =C2=A0	case EXEC_MODE_DMA_FENCE:
> =C2=A0		new_mode =3D EXEC_MODE_LR;
> @@ -294,7 +311,8 @@ static int switch_mode(struct xe_hw_engine_group
> *group)
> =C2=A0 */
> =C2=A0int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> =C2=A0				enum
> xe_hw_engine_group_execution_mode new_mode,
> -				enum
> xe_hw_engine_group_execution_mode *previous_mode)
> +				enum
> xe_hw_engine_group_execution_mode *previous_mode,
> +				struct xe_sync_entry *syncs, int
> num_syncs)
> =C2=A0__acquires(&group->mode_sem)
> =C2=A0{
> =C2=A0	int err =3D down_read_interruptible(&group->mode_sem);
> @@ -311,7 +329,7 @@ __acquires(&group->mode_sem)
> =C2=A0			return err;
> =C2=A0
> =C2=A0		if (new_mode !=3D group->cur_mode) {
> -			err =3D switch_mode(group);
> +			err =3D switch_mode(group, syncs, num_syncs);
> =C2=A0			if (err) {
> =C2=A0				up_write(&group->mode_sem);
> =C2=A0				return err;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index 797ee81acbf2..8b17ccd30b70 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -11,6 +11,7 @@
> =C2=A0struct drm_device;
> =C2=A0struct xe_exec_queue;
> =C2=A0struct xe_gt;
> +struct xe_sync_entry;
> =C2=A0
> =C2=A0int xe_hw_engine_setup_groups(struct xe_gt *gt);
> =C2=A0
> @@ -19,7 +20,8 @@ void xe_hw_engine_group_del_exec_queue(struct
> xe_hw_engine_group *group, struct
> =C2=A0
> =C2=A0int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> =C2=A0				enum
> xe_hw_engine_group_execution_mode new_mode,
> -				enum
> xe_hw_engine_group_execution_mode *previous_mode);
> +				enum
> xe_hw_engine_group_execution_mode *previous_mode,
> +				struct xe_sync_entry *syncs, int
> num_syncs);
> =C2=A0void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> =C2=A0
> =C2=A0enum xe_hw_engine_group_execution_mode
> diff --git a/drivers/gpu/drm/xe/xe_sync.c
> b/drivers/gpu/drm/xe/xe_sync.c
> index 1fc4fa278b78..127e26129933 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -228,6 +228,20 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> *sync, struct xe_sched_job *job)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +/**
> + * xe_sync_entry_wait() - Wait on in-sync
> + * @sync: Sync object
> + *
> + * If the sync is in an in-sync, wait on the sync to signal.
> + */
> +void xe_sync_entry_wait(struct xe_sync_entry *sync)
> +{
> +	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
> +		return;
> +
> +	dma_fence_wait(sync->fence, false);
> +}
> +
> =C2=A0void xe_sync_entry_signal(struct xe_sync_entry *sync, struct
> dma_fence *fence)
> =C2=A0{
> =C2=A0	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
> diff --git a/drivers/gpu/drm/xe/xe_sync.h
> b/drivers/gpu/drm/xe/xe_sync.h
> index 51f2d803e977..1c08f9ed9001 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -29,6 +29,7 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> *sync,
> =C2=A0			=C2=A0=C2=A0 struct xe_sched_job *job);
> =C2=A0void xe_sync_entry_signal(struct xe_sync_entry *sync,
> =C2=A0			=C2=A0 struct dma_fence *fence);
> +void xe_sync_entry_wait(struct xe_sync_entry *sync);
> =C2=A0void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> =C2=A0struct dma_fence *
> =C2=A0xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,

