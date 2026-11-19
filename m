Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1395D606B19A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PmisZ3JW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA87E10E86A;
	Thu, 19 Nov 2026 13:03:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C93310E86A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 13:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795093421; x=1826629421;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5GWNpX9VdJCd4rMmPVpLBbIkms53XvxROeqHm4l4p1M=;
 b=PmisZ3JWtJsPxuIC53c3RDYH/ms0ud+hCEkBu1pummfnqNTHDB+h5tih
 kqettIsGtZjNYxsMmLZ3efNlSh59s87a8avHXvW40happHd6uYa3LukcI
 gB3IOjsrlcEZZ9/iNwzDhtciEKogSp1wAGgXt09iaMns4aUvvln8/YiBU
 n2kvhJ6jt6sufWrMU5svsTl+u0ceFazPF7Bc+cu4+lGH2SdTThUesSuUZ
 gkFRQhLVIQ1tPnWHwJw2x7bi5HZxsY4Y+TNdUUDT7kXaQDsPA8vVy2ZpN
 7I449zcMOZbURl3/dzPBWuAChzmu8XVftG8M2dWmzRceIh9puhEcUGow+ A==;
X-CSE-ConnectionGUID: vAPIwGx7Qx6GGhG7POPBbw==
X-CSE-MsgGUID: G3PUgU+ASim1T9mNYNncFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3945849"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3945849"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 05:03:40 -0800
X-CSE-ConnectionGUID: ZW2WzyT1RgqLpdyXt82LeA==
X-CSE-MsgGUID: q/aGqOI/R8akmv0krYrIyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10809780"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.91])
 ([10.245.245.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 05:03:38 -0800
Message-ID: <467c51e19603e52121ee766db705df6e77dd551b.camel@linux.intel.com>
Subject: Re: [PATCH 4/5] drm/xe/userptr: Make the repin retry loop non-fatal
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost	
 <matthew.brost@intel.com>, Himal Prasad Ghimiray	
 <himal.prasad.ghimiray@intel.com>, Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 14:03:36 +0100
In-Reply-To: <20261119-userptr-repin-v1-4-af2e327833a9@intel.com>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
 <20261119-userptr-repin-v1-4-af2e327833a9@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-11-19 at 11:14 +0000, Matthew Auld wrote:
> From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> drm_gpusvm_get_pages() gives up with -EBUSY after a fixed one second
> budget if the CPU mappings keep changing during the repin. That error
> was treated as fatal: the rebind worker killed the VM, exec returned
> it
> to user-space and the bind ioctl converted it to -ENOMEM.
>=20
> Instead, time-stamp the first repin attempt of a userptr and, as long
> as
> the overall timeout (the userptr_repin_timeout_ms sysfs attribute,
> read
> on each check) hasn't expired, translate -EBUSY into -EAGAIN.
> Discount
> idle gaps between attempts (for example if the task was stopped via
> SIGTSTP) so resuming does not immediately trip the timeout. Callers
> drop
> all locks and retry:
>=20
> - exec and the rebind worker already retry on -EAGAIN.
> - The bind and madvise ioctls restart from the top with vm->lock
> =C2=A0 dropped. Since new vmas are created on each attempt, they track th=
e
> =C2=A0 overall timeout themselves.
> - The pagefault handler repeats the repin.
>=20
> Only when the overall timeout expires is -EBUSY returned. Drop the
> -EBUSY to -ENOMEM conversion in new_vma() as -EBUSY now means just
> that.
>=20
> v2 (Matt):
> - Reset num_ufence at the retry label in xe_vm_bind_ioctl() so user
> =C2=A0 fences are not counted twice across repin retries.
> - Handle -EAGAIN from xe_vm_alloc_madvise_vma() in
> xe_vm_madvise_ioctl()
> =C2=A0 with vm->lock dropped and repin timeout tracking.
> - Discount idle gaps longer than XE_USERPTR_REPIN_IDLE_MS between
> =C2=A0 attempts and check signal_pending() / return -ERESTARTSYS in ioctl
> =C2=A0 retry loops so stopping and resuming (e.g. Ctrl-Z) works without
> =C2=A0 immediately timing out.
>=20
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>

Might want to add Co-authored-by: on this and other co-authored
patches, rather than just SOB?

> ---
> =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 9 +++++--
> =C2=A0drivers/gpu/drm/xe/xe_pagefault.c=C2=A0 |=C2=A0 4 +++
> =C2=A0drivers/gpu/drm/xe/xe_userptr.c=C2=A0=C2=A0=C2=A0 | 47
> ++++++++++++++++++++++++++++-----
> =C2=A0drivers/gpu/drm/xe/xe_userptr.h=C2=A0=C2=A0=C2=A0 | 53
> ++++++++++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 43 ++++++++++++++++++++++++----
> ---
> =C2=A0drivers/gpu/drm/xe/xe_vm_madvise.c | 23 ++++++++++++++++-
> =C2=A06 files changed, 159 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c
> b/drivers/gpu/drm/xe/xe_exec.c
> index 1949fb103fad..0e6a197a8e85 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <drm/drm_file.h>
> =C2=A0#include <uapi/drm/xe_drm.h>
> =C2=A0#include <linux/delay.h>
> +#include <linux/sched/signal.h>
> =C2=A0
> =C2=A0#include "xe_device.h"
> =C2=A0#include "xe_exec_queue.h"
> @@ -380,8 +381,12 @@ int xe_exec_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
> =C2=A0		xe_validation_ctx_fini(&ctx);
> =C2=A0err_unlock_list:
> =C2=A0	up_read(&vm->lock);
> -	if (err =3D=3D -EAGAIN)
> -		goto retry;
> +	if (err =3D=3D -EAGAIN) {
> +		cond_resched();
> +		if (!signal_pending(current))
> +			goto retry;
> +		err =3D -ERESTARTSYS;
> +	}
> =C2=A0err_hw_exec_mode:
> =C2=A0	if (mode =3D=3D EXEC_MODE_DMA_FENCE)
> =C2=A0		xe_hw_engine_group_put(group);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> b/drivers/gpu/drm/xe/xe_pagefault.c
> index 98cce0f12b12..6c4e5e77e1c6 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -191,6 +191,10 @@ static int xe_pagefault_handle_vma(struct xe_gt
> *gt, struct xe_vma *vma,
> =C2=A0			struct xe_userptr_vma *uvma =3D
> to_userptr_vma(vma);
> =C2=A0
> =C2=A0			err =3D xe_vma_userptr_pin_pages(uvma);
> +			if (err =3D=3D -EAGAIN) {
> +				cond_resched();
> +				continue;
> +			}
> =C2=A0			if (err) {
> =C2=A0				xe_pagefault_set_error(pf,
> XE_PAGEFAULT_ERROR_VMA_USERPTR_PIN);
> =C2=A0				return err;
> diff --git a/drivers/gpu/drm/xe/xe_userptr.c
> b/drivers/gpu/drm/xe/xe_userptr.c
> index 9c1dac0fce6f..39806ca9f54a 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.c
> +++ b/drivers/gpu/drm/xe/xe_userptr.c
> @@ -74,6 +74,23 @@ static bool __xe_vma_userptr_lockdep(struct
> xe_userptr_vma *uvma)
> =C2=A0#define xe_vma_userptr_lockdep(uvma)
> =C2=A0#endif
> =C2=A0
> +/**
> + * xe_vma_userptr_pin_pages() - Pin and map the pages of a userptr
> vma
> + * @uvma: The userptr vma.
> + *
> + * Pin the pages and set up the dma mappings. If the CPU mappings
> keep changing
> + * during the repin, drm_gpusvm_get_pages() eventually gives up with
> -EBUSY.
> + * That is converted to -EAGAIN until the overall repin timeout,
> measured from
> + * the first attempt since the last successful repin, expires. The
> caller is
> + * then expected to drop all locks and retry.
> + *
> + * Context: Either vm->lock held in write mode, or in read mode
> together with
> + * the vma's fault_lock.
> + *
> + * Return: 0 on success, -EAGAIN if the caller should retry with all
> locks
> + * dropped, -EBUSY if the overall timeout expired, or another
> negative error
> + * code on failure.
> + */
> =C2=A0int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
> =C2=A0{
> =C2=A0	struct xe_vma *vma =3D &uvma->vma;
> @@ -84,19 +101,35 @@ int xe_vma_userptr_pin_pages(struct
> xe_userptr_vma *uvma)
> =C2=A0		.device_private_page_owner =3D
> xe_svm_private_page_owner(vm, false),
> =C2=A0		.allow_mixed =3D true,
> =C2=A0	};
> +	int err;
> =C2=A0
> =C2=A0	xe_vma_userptr_lockdep(uvma);
> =C2=A0	xe_assert(xe, xe_vma_is_userptr(vma));
> =C2=A0
> -	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> +	if (vma->gpuva.flags & XE_VMA_DESTROYED) {
> +		uvma->userptr.repin =3D (struct xe_userptr_repin){};
> =C2=A0		return 0;
> +	}
> =C2=A0
> -	return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma-
> >userptr.pages, 1,
> -				=C2=A0=C2=A0=C2=A0 uvma->userptr.notifier.mm,
> -				=C2=A0=C2=A0=C2=A0 &uvma->userptr.notifier,
> -				=C2=A0=C2=A0=C2=A0 xe_vma_userptr(vma),
> -				=C2=A0=C2=A0=C2=A0 xe_vma_userptr(vma) +
> xe_vma_size(vma),
> -				=C2=A0=C2=A0=C2=A0 &ctx);
> +	xe_userptr_repin_begin(&uvma->userptr.repin);
> +
> +	err =3D drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma-
> >userptr.pages, 1,
> +				=C2=A0=C2=A0 uvma->userptr.notifier.mm,
> +				=C2=A0=C2=A0 &uvma->userptr.notifier,
> +				=C2=A0=C2=A0 xe_vma_userptr(vma),
> +				=C2=A0=C2=A0 xe_vma_userptr(vma) +
> xe_vma_size(vma),
> +				=C2=A0=C2=A0 &ctx);
> +	if (err =3D=3D -EBUSY) {
> +		u32 timeout_ms =3D READ_ONCE(xe-
> >userptr_repin_timeout_ms);
> +
> +		if (xe_userptr_repin_should_retry(&uvma-
> >userptr.repin,
> +						=C2=A0 timeout_ms))
> +			return -EAGAIN;
> +	}
> +
> +	uvma->userptr.repin =3D (struct xe_userptr_repin){};
> +
> +	return err;
> =C2=A0}
> =C2=A0
> =C2=A0static struct mmu_interval_notifier_finish *
> diff --git a/drivers/gpu/drm/xe/xe_userptr.h
> b/drivers/gpu/drm/xe/xe_userptr.h
> index 2a3cd1b5efbb..179f2aca26a3 100644
> --- a/drivers/gpu/drm/xe/xe_userptr.h
> +++ b/drivers/gpu/drm/xe/xe_userptr.h
> @@ -6,6 +6,8 @@
> =C2=A0#ifndef _XE_USERPTR_H_
> =C2=A0#define _XE_USERPTR_H_
> =C2=A0
> +#include <linux/hmm.h>
> +#include <linux/jiffies.h>
> =C2=A0#include <linux/list.h>
> =C2=A0#include <linux/mutex.h>
> =C2=A0#include <linux/notifier.h>
> @@ -20,6 +22,51 @@ struct xe_vm;
> =C2=A0struct xe_vma;
> =C2=A0struct xe_userptr_vma;
> =C2=A0
> +/**
> + * struct xe_userptr_repin - Timeout tracking state for userptr
> repin retries
> + * @start: Timestamp in jiffies of the first repin attempt, adjusted
> for idle
> + *	=C2=A0=C2=A0 gaps, or zero if no repin is in progress.
> + * @last: Timestamp in jiffies when the previous attempt failed with
> -EBUSY,
> + *	=C2=A0 or zero if no retry is pending.
> + */
> +struct xe_userptr_repin {
> +	unsigned long start;
> +	unsigned long last;
> +};
> +
> +/*
> + * If more than XE_USERPTR_REPIN_IDLE_MS elapses between attempts
> (for example
> + * when the task was stopped via SIGTSTP/Ctrl-Z), discount the idle
> gap so
> + * waking up does not immediately expire the overall repin timeout.
> + */
> +#define XE_USERPTR_REPIN_IDLE_MS (5 * HMM_RANGE_DEFAULT_TIMEOUT)
> +
> +static inline void xe_userptr_repin_begin(struct xe_userptr_repin
> *repin)
> +{
> +	unsigned long now =3D jiffies;
> +
> +	if (!repin->start) {
> +		repin->start =3D now ?: 1;
> +		return;
> +	}
> +
> +	if (repin->last &&
> +	=C2=A0=C2=A0=C2=A0 time_after(now, repin->last +
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(XE_USERPTR_REPIN=
_IDLE_MS)))
> +		repin->start =3D (repin->start + (now - repin->last))
> ?: 1;
> +	repin->last =3D 0;
> +}
> +
> +static inline bool xe_userptr_repin_should_retry(struct
> xe_userptr_repin *repin,
> +						 u32 timeout_ms)
> +{
> +	unsigned long now =3D jiffies;
> +
> +	repin->last =3D now ?: 1;
> +	return !timeout_ms ||
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 time_before(now, repin->start +
> msecs_to_jiffies(timeout_ms));
> +}
> +
> =C2=A0/** struct xe_userptr_vm - User pointer VM level state */
> =C2=A0struct xe_userptr_vm {
> =C2=A0	/**
> @@ -92,6 +139,12 @@ struct xe_userptr {
> =C2=A0	 * read: vm->svm.gpusvm.notifier_lock in write mode or vm-
> >resv held.
> =C2=A0	 */
> =C2=A0	bool initial_bind;
> +	/**
> +	 * @repin: Timeout state for an in-progress repin retry
> sequence.
> +	 * Protected by vm->lock in write mode, or in read mode
> together with
> +	 * the vma's fault_lock.
> +	 */
> +	struct xe_userptr_repin repin;
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> =C2=A0	u32 divisor;
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ff8d355728fc..0c5121361f8e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/kthread.h>
> =C2=A0#include <linux/mm.h>
> +#include <linux/sched/signal.h>
> =C2=A0#include <linux/swap.h>
> =C2=A0
> =C2=A0#include <generated/xe_wa_oob.h>
> @@ -2782,14 +2783,6 @@ static struct xe_vma *new_vma(struct xe_vm
> *vm, struct drm_gpuva_op_map *op,
> =C2=A0
> =C2=A0		if (xe_vma_is_userptr(vma)) {
> =C2=A0			err =3D
> xe_vma_userptr_pin_pages(to_userptr_vma(vma));
> -			/*
> -			 * -EBUSY has dedicated meaning that a user
> fence
> -			 * attached to the VMA is busy, in practice
> -			 * xe_vma_userptr_pin_pages can only fail
> with -EBUSY if
> -			 * we are low on memory so convert this to -
> ENOMEM.
> -			 */
> -			if (err =3D=3D -EBUSY)
> -				err =3D -ENOMEM;
> =C2=A0		}
> =C2=A0	}
> =C2=A0	if (err) {
> @@ -4085,11 +4078,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0	struct drm_gpuva_ops **ops =3D NULL;
> =C2=A0	struct xe_vm *vm;
> =C2=A0	struct xe_exec_queue *q =3D NULL;
> -	u32 num_syncs, num_ufence =3D 0;
> +	u32 num_syncs, num_ufence;
> =C2=A0	struct xe_sync_entry *syncs =3D NULL;
> =C2=A0	struct drm_xe_vm_bind_op *bind_ops =3D NULL;
> =C2=A0	struct xe_vma_ops vops =3D { .flags =3D 0, };
> +	struct xe_userptr_repin repin =3D {};
> =C2=A0	struct dma_fence *fence;
> +	bool repin_again;
> =C2=A0	int err;
> =C2=A0	int i;
> =C2=A0
> @@ -4122,6 +4117,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0	/* Ensure all UNMAPs visible */
> =C2=A0	xe_svm_flush(vm);
> =C2=A0
> +retry:
> +	repin_again =3D false;
> +	num_ufence =3D 0;
> =C2=A0	err =3D down_write_killable(&vm->lock);
> =C2=A0	if (err)
> =C2=A0		goto put_exec_queue;
> @@ -4225,6 +4223,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
> =C2=A0	if (args->num_binds > 1)
> =C2=A0		vops.flags |=3D XE_VMA_OPS_ARRAY_OF_BINDS;
> +	xe_userptr_repin_begin(&repin);
> =C2=A0	for (i =3D 0; i < args->num_binds; ++i) {
> =C2=A0		u64 range =3D bind_ops[i].range;
> =C2=A0		u64 addr =3D bind_ops[i].addr;
> @@ -4240,12 +4239,15 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0		if (IS_ERR(ops[i])) {
> =C2=A0			err =3D PTR_ERR(ops[i]);
> =C2=A0			ops[i] =3D NULL;
> +			repin_again =3D err =3D=3D -EAGAIN;
> =C2=A0			goto unwind_ops;
> =C2=A0		}
> =C2=A0
> =C2=A0		err =3D vm_bind_ioctl_ops_parse(vm, ops[i], &vops);
> -		if (err)
> +		if (err) {
> +			repin_again =3D err =3D=3D -EAGAIN;
> =C2=A0			goto unwind_ops;
> +		}
> =C2=A0
> =C2=A0#ifdef TEST_VM_OPS_ERROR
> =C2=A0		if (flags & FORCE_OP_ERROR) {
> @@ -4308,6 +4310,27 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> void *data, struct drm_file *file)
> =C2=A0		up_read(&vm->lock);
> =C2=A0	else
> =C2=A0		up_write(&vm->lock);
> +	if (repin_again) {
> +		/*
> +		 * A userptr repin keeps failing due to concurrent
> CPU mapping
> +		 * changes. New vmas are created on every attempt so
> the overall
> +		 * timeout is tracked here. Retry with all locks
> dropped.
> +		 */
> +		u32 timeout_ms =3D READ_ONCE(vm->xe-
> >userptr_repin_timeout_ms);
> +
> +		if (xe_userptr_repin_should_retry(&repin,
> timeout_ms)) {
> +			bos =3D NULL;
> +			ops =3D NULL;
> +			syncs =3D NULL;
> +			vops.flags =3D 0;
> +			cond_resched();
> +			if (!signal_pending(current))
> +				goto retry;
> +			err =3D -ERESTARTSYS;
> +		} else {
> +			err =3D -EBUSY;
> +		}
> +	}
> =C2=A0put_exec_queue:
> =C2=A0	if (q)
> =C2=A0		xe_exec_queue_put(q);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 31245c6c96d4..4bb544ee168b 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -6,6 +6,7 @@
> =C2=A0#include "xe_vm_madvise.h"
> =C2=A0
> =C2=A0#include <linux/nospec.h>
> +#include <linux/sched/signal.h>
> =C2=A0#include <drm/xe_drm.h>
> =C2=A0
> =C2=A0#include "xe_bo.h"
> @@ -13,6 +14,7 @@
> =C2=A0#include "xe_pt.h"
> =C2=A0#include "xe_svm.h"
> =C2=A0#include "xe_tlb_inval.h"
> +#include "xe_userptr.h"
> =C2=A0#include "xe_vm.h"
> =C2=A0
> =C2=A0struct xe_vmas_in_madvise_range {
> @@ -592,11 +594,13 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0		.addr =3D xe_device_uncanonicalize_addr(xe, args-
> >start),
> =C2=A0		.range =3D args->range,
> =C2=A0	};
> +	struct xe_userptr_repin repin =3D {};
> =C2=A0	struct xe_madvise_details details;
> =C2=A0	u16 pat_index, coh_mode;
> =C2=A0	struct xe_vm *vm;
> =C2=A0	struct drm_exec exec;
> =C2=A0	int err, attr_type;
> +	bool repin_again;
> =C2=A0	bool do_retained;
> =C2=A0
> =C2=A0	vm =3D xe_vm_lookup(xef, args->vm_id);
> @@ -629,6 +633,8 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0
> =C2=A0	xe_svm_flush(vm);
> =C2=A0
> +retry:
> +	repin_again =3D false;
> =C2=A0	err =3D down_write_killable(&vm->lock);
> =C2=A0	if (err)
> =C2=A0		goto put_vm;
> @@ -642,9 +648,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0	if (err)
> =C2=A0		goto unlock_vm;
> =C2=A0
> +	xe_userptr_repin_begin(&repin);
> =C2=A0	err =3D xe_vm_alloc_madvise_vma(vm, madvise_range.addr, args-
> >range);
> -	if (err)
> +	if (err) {
> +		repin_again =3D err =3D=3D -EAGAIN;
> =C2=A0		goto madv_fini;
> +	}
> =C2=A0
> =C2=A0	err =3D get_vmas(vm, &madvise_range);
> =C2=A0	if (err || !madvise_range.num_vmas)
> @@ -730,6 +739,18 @@ int xe_vm_madvise_ioctl(struct drm_device *dev,
> void *data, struct drm_file *fil
> =C2=A0	xe_madvise_details_fini(&details);
> =C2=A0unlock_vm:
> =C2=A0	up_write(&vm->lock);
> +	if (repin_again) {
> +		u32 timeout_ms =3D READ_ONCE(xe-
> >userptr_repin_timeout_ms);
> +
> +		if (xe_userptr_repin_should_retry(&repin,
> timeout_ms)) {
> +			cond_resched();
> +			if (!signal_pending(current))
> +				goto retry;
> +			err =3D -ERESTARTSYS;
> +		} else {
> +			err =3D -EBUSY;
> +		}
> +	}
> =C2=A0
> =C2=A0	/* Write retained value to user after releasing all locks */
> =C2=A0	if (!err && do_retained)
