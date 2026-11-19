Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E1606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dIM6ZjhY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD5A10E883;
	Thu, 19 Nov 2026 13:11:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EA110E883
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795093875; x=1826629875;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tN/VowFXVHjgat48Ar6lpgNXXG+8zdhGA8Db6Va7dy8=;
 b=dIM6ZjhYNnp4++1P2jnWORfmXT5SbZaUDL+bjPJfzvzOfr7x4OAWrglP
 /u1+SC69Jo9d1KP7YkS2W9yBEPOaDrQrVSDnXJ82Kt4JIKh5aXooD756+
 J0QFtgdtTZnpVp46povebG8L1GboJBL1/RXHvlK648r65m472YYRMJbUO
 Gh4pNWDXF3cx5ymwtd/ATeFzlkAsf40lz0kniopxipothmlutPlFGOfE0
 xw9a9UcF5hy/v2hGvyHyosklV6BZAH/euTum/7SdnzE19BO6m/OdjyUFb
 JyDCqX37HLCUdPjx4Qhe1RUdZCPyefUPHH1jmnbwbWAFa/inDpSPTbKin w==;
X-CSE-ConnectionGUID: IaQtY4ewTZy6KPdOt+6cVg==
X-CSE-MsgGUID: R90OorHlSja0DCbjEsh+Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3832067"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3832067"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 05:11:14 -0800
X-CSE-ConnectionGUID: cr+bm9PmSkeKkHacZ10Yfg==
X-CSE-MsgGUID: i7q5yse5RrqGtj8Aj791vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10466500"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.91])
 ([10.245.245.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 05:11:12 -0800
Message-ID: <f29cef0f95344993fc9d098f548dcde0dba8bfe8.camel@linux.intel.com>
Subject: Re: [PATCH 5/5] drm/xe: run compute rebind worker on device NUMA node
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matthew Brost	
 <matthew.brost@intel.com>, Himal Prasad Ghimiray	
 <himal.prasad.ghimiray@intel.com>, Stuart Summers <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 14:11:10 +0100
In-Reply-To: <20261119-userptr-repin-v1-5-af2e327833a9@intel.com>
References: <20261119-userptr-repin-v1-0-af2e327833a9@intel.com>
 <20261119-userptr-repin-v1-5-af2e327833a9@intel.com>
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
> preempt_rebind_work_func() currently runs on xe->ordered_wq, whose
> unbound worker pool spans all NUMA nodes. On multi-socket systems, if
> the rebind worker runs on a remote socket when faulting userptr pages
> marked PROT_NONE by AutoNUMA, hmm_range_fault() invokes
> do_numa_page()
> using the worker's NUMA node and triggers migrate_misplaced_folio(),
> pulling pages away from the GPU's local node and causing self-
> inflicted
> MMU notifier invalidations.
>=20
> Move vm->preempt.rebind_work onto a dedicated WQ_UNBOUND workqueue
> (max_active =3D 1) queued via queue_work_node() with dev_to_node(),
> leaving user-fence signalling on xe->ordered_wq. Guard
> preempt_rebind_work_func() with a per-device mutex so compute rebinds
> remain strictly 1-at-a-time even when queue_work_node() falls back
> across nodes (such as NUMA_NO_NODE or CPU-less nodes).

I don't remember fully why we have this 1-at-a-time rebind worker. I
wonder whether it was because of concurrent validations causing VMs to
outcompete eachother for memory. If that was the case, then we might be
able to lift that restriction due to the validation guard.

>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 11 ++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h | 10 +++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++++++-
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++++-
> =C2=A04 files changed, 31 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index 4e54a1b7fc51..f75a32bb48e3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -8,7 +8,9 @@
> =C2=A0#include <linux/aperture.h>
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/error-injection.h>
> +#include <linux/mutex.h>
> =C2=A0#include <linux/units.h>
> +#include <linux/workqueue.h>
> =C2=A0
> =C2=A0#include <drm/drm_client.h>
> =C2=A0#include <drm/drm_gem_ttm_helper.h>
> @@ -396,6 +398,11 @@ static void xe_device_destroy(struct drm_device
> *dev, void *dummy)
> =C2=A0	if (xe->destroy_wq)
> =C2=A0		destroy_workqueue(xe->destroy_wq);
> =C2=A0
> +	if (xe->rebind_wq)
> +		destroy_workqueue(xe->rebind_wq);

Hm. It looks safer if we destroy this wq earlier than the destroy wq?
Is there a chance that we put something on the destroy wq from the
rebind wq?



> +
> +	mutex_destroy(&xe->rebind_lock);
> +
> =C2=A0	ttm_device_fini(&xe->ttm);
> =C2=A0
> =C2=A0	if (atomic_dec_and_test(&xe_device_count))
> @@ -472,6 +479,7 @@ int xe_device_init_early(struct xe_device *xe)
> =C2=A0		return err;
> =C2=A0
> =C2=A0	xe_bo_dev_init(&xe->bo_device);
> +	mutex_init(&xe->rebind_lock);
> =C2=A0	atomic_inc(&xe_device_count);
> =C2=A0	err =3D drmm_add_action_or_reset(&xe->drm, xe_device_destroy,
> NULL);
> =C2=A0	if (err)
> @@ -518,10 +526,11 @@ int xe_device_init_early(struct xe_device *xe)
> =C2=A0
> =C2=A0	xe->preempt_fence_wq =3D alloc_ordered_workqueue("xe-preempt-
> fence-wq",
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> WQ_MEM_RECLAIM);
> +	xe->rebind_wq =3D alloc_workqueue("xe-rebind-wq", WQ_UNBOUND,
> 1);
> =C2=A0	xe->ordered_wq =3D alloc_ordered_workqueue("xe-ordered-wq",
> 0);
> =C2=A0	xe->unordered_wq =3D alloc_workqueue("xe-unordered-wq",
> WQ_PERCPU, 0);
> =C2=A0	xe->destroy_wq =3D alloc_workqueue("xe-destroy-wq", WQ_PERCPU
> | WQ_MEM_RECLAIM, 0);
> -	if (!xe->ordered_wq || !xe->unordered_wq ||
> +	if (!xe->ordered_wq || !xe->unordered_wq || !xe->rebind_wq
> ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 !xe->preempt_fence_wq || !xe->destroy_wq) {
> =C2=A0		/*
> =C2=A0		 * Cleanup done in xe_device_destroy via
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index fc80cd2c766e..c30d64296869 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -6,7 +6,9 @@
> =C2=A0#ifndef _XE_DEVICE_TYPES_H_
> =C2=A0#define _XE_DEVICE_TYPES_H_
> =C2=A0
> +#include <linux/mutex.h>
> =C2=A0#include <linux/pci.h>
> +#include <linux/workqueue.h>
> =C2=A0
> =C2=A0#include <drm/drm_device.h>
> =C2=A0#include <drm/drm_file.h>
> @@ -375,7 +377,13 @@ struct xe_device {
> =C2=A0	/** @preempt_fence_wq: used to serialize preempt fences */
> =C2=A0	struct workqueue_struct *preempt_fence_wq;
> =C2=A0
> -	/** @ordered_wq: used to serialize compute mode resume */
> +	/** @rebind_wq: used to run compute mode rebind work on
> device node */
> +	struct workqueue_struct *rebind_wq;
> +
> +	/** @rebind_lock: serializes compute mode rebind workers per
> device */
> +	struct mutex rebind_lock;
> +
> +	/** @ordered_wq: used to serialize ordered work */
> =C2=A0	struct workqueue_struct *ordered_wq;
> =C2=A0
> =C2=A0	/** @unordered_wq: used to serialize unordered work */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0c5121361f8e..1436d09ee560 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/kthread.h>
> =C2=A0#include <linux/mm.h>
> +#include <linux/mutex.h>
> =C2=A0#include <linux/sched/signal.h>
> =C2=A0#include <linux/swap.h>
> =C2=A0
> @@ -540,7 +541,7 @@ static bool vm_suspend_rebind_worker(struct xe_vm
> *vm)
> =C2=A0 */
> =C2=A0void xe_vm_resume_rebind_worker(struct xe_vm *vm)
> =C2=A0{
> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> +	xe_vm_queue_rebind_worker(vm);
> =C2=A0}
> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
> @@ -581,16 +582,19 @@ static void preempt_rebind_work_func(struct
> work_struct *w)
> =C2=A0	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
> =C2=A0	trace_xe_vm_rebind_worker_enter(vm);
> =C2=A0
> +	mutex_lock(&vm->xe->rebind_lock);
> =C2=A0	down_write(&vm->lock);
> =C2=A0
> =C2=A0	if (xe_vm_is_closed_or_banned(vm)) {
> =C2=A0		up_write(&vm->lock);
> +		mutex_unlock(&vm->xe->rebind_lock);
> =C2=A0		trace_xe_vm_rebind_worker_exit(vm);
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!try_wait_for_completion(&vm->xe->pm_block) &&
> vm_suspend_rebind_worker(vm)) {
> =C2=A0		up_write(&vm->lock);
> +		mutex_unlock(&vm->xe->rebind_lock);
> =C2=A0		/* We don't actually block but don't make progress.
> */
> =C2=A0		xe_pm_might_block_on_suspend();
> =C2=A0		return;
> @@ -666,6 +670,7 @@ static void preempt_rebind_work_func(struct
> work_struct *w)
> =C2=A0		 * lock make progress between attempts.
> =C2=A0		 */
> =C2=A0		up_write(&vm->lock);
> +		mutex_unlock(&vm->xe->rebind_lock);
> =C2=A0		free_preempt_fences(&preempt_fences);
> =C2=A0		xe_vm_queue_rebind_worker(vm);
> =C2=A0		trace_xe_vm_rebind_worker_exit(vm);
> @@ -679,6 +684,7 @@ static void preempt_rebind_work_func(struct
> work_struct *w)
> =C2=A0		xe_vm_kill(vm, true);
> =C2=A0	}
> =C2=A0	up_write(&vm->lock);
> +	mutex_unlock(&vm->xe->rebind_lock);
> =C2=A0
> =C2=A0	free_preempt_fences(&preempt_fences);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index b1c5f940bcc5..ed590bad892c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -6,6 +6,9 @@
> =C2=A0#ifndef _XE_VM_H_
> =C2=A0#define _XE_VM_H_
> =C2=A0
> +#include <linux/device.h>
> +#include <linux/workqueue.h>
> +
> =C2=A0#include "xe_assert.h"
> =C2=A0#include "xe_bo_types.h"
> =C2=A0#include "xe_macros.h"
> @@ -259,7 +262,8 @@ int xe_vm_validate_protected(struct xe_vm *vm);
> =C2=A0static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> =C2=A0{
> =C2=A0	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> +	queue_work_node(dev_to_node(vm->xe->drm.dev), vm->xe-
> >rebind_wq,
> +			&vm->preempt.rebind_work);

Is a NUMA_NO_NODE dev_to_node() return OK here?

Thanks,
Thomas



> =C2=A0}
> =C2=A0
> =C2=A0/**
