Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A349C4828F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Feb 2024 15:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D718B10E916;
	Thu,  8 Feb 2024 15:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nr0gGWxr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0967E10E916
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Feb 2024 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707406674; x=1738942674;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=SEv4XEwpJq/XDMOn7m7EuUERCge3xGrLLw+DKf2Yf2E=;
 b=Nr0gGWxrVOBjjdDEsqI5pNXrT7UvTyHuS0Jt6kQJhWoNOqaLcI4uGCIs
 QSU9zb1PHt/eGyEF3k3jubS36eyf/b8IKtxqaejIprlvr6LzLnIxVsiJx
 3EmwoO3tBTXvq86r9PQHPF1w3Jm7HA0AfKSu1WQ4ps6Irx9KrNKeYLAya
 yHfolDasalZeDe4hwLafo8pat29+auDs6e0Pr4sIgzEApDzDy/fiiyd2/
 QY+Kk8+tN2AYAFDTNhRAU1+UEqrJzp2L9k7R7y7ZvyW6UKOpIJzJmenPJ
 waD2kI0OGrHggdl7HD2e1R367Lee5Y1OVV6uxagl6DhY5+PwlbMmgO/2/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1131574"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1131574"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 07:37:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1662368"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO [10.249.254.149])
 ([10.249.254.149])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 07:37:52 -0800
Message-ID: <cfefcb5b1833e4a3c51003ddc01ea0732ce03437.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Remove support for persistent exec_queues
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,  Francois Dugast
 <francois.dugast@intel.com>
Date: Thu, 08 Feb 2024 16:37:49 +0100
In-Reply-To: <otvidki36j6hyxvrz22e6eimxysqqmkz6zwscgkc7cllfeksyv@5ghkjyf2oxbl>
References: <20240208083845.4303-1-thomas.hellstrom@linux.intel.com>
 <otvidki36j6hyxvrz22e6eimxysqqmkz6zwscgkc7cllfeksyv@5ghkjyf2oxbl>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Thu, 2024-02-08 at 09:34 -0600, Lucas De Marchi wrote:
> On Thu, Feb 08, 2024 at 09:38:45AM +0100, Thomas Hellstr=C3=B6m wrote:
> > Persistent exec_queues delays explicit destruction of exec_queues
> > until they are done executing, but destruction on process exit
> > is still immediate. It turns out no UMD is relying on this
> > functionality, so remove it. If there turns out to be a use-case
> > in the future, let's re-add.
> >=20
> > Persistent exec_queues were never used for LR VMs
> >=20
> > v2:
> > - Don't add an "UNUSED" define for the missing property
> > =C2=A0(Lucas, Rodrigo)
> >=20
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > GPUs")
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> I think you missed a review comment from Niranjana. Should add this
> diff
> on top:

Ah, yes you're right. I'll respin. Need an ack from UMD as well.
/Thomas


>=20
>=20
> > 	diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > 	index 648391961fc4..a695f97ac0f3 100644
> > 	--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > 	+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > 	@@ -105,16 +105,6 @@ struct xe_exec_queue {
> > 			struct xe_guc_exec_queue *guc;
> > 		};
> > 	=20
> > 	-	/**
> > 	-	 * @persistent: persistent exec queue state
> > 	-	 */
> > 	-	struct {
> > 	-		/** @persistent.xef: file which this exec
> > queue belongs to */
> > 	-		struct xe_file *xef;
> > 	-		/** @persisiten.link: link in list of
> > persistent exec queues */
> > 	-		struct list_head link;
> > 	-	} persistent;
> > 	-
> > 		union {
> > 			/**
> > 			 * @parallel: parallel submission state
>=20
> with that,=C2=A0 Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
> Lucas De Marchi
>=20
> > ---
> > drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 39=
 -------------------------
> > ---
> > drivers/gpu/drm/xe/xe_device.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 4 ---
> > drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 8 ------
> > drivers/gpu/drm/xe/xe_exec_queue.c=C2=A0=C2=A0 | 36 +++++--------------=
------
> > drivers/gpu/drm/xe/xe_execlist.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
> > drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0 |=C2=A0 2 --
> > include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> > 7 files changed, 6 insertions(+), 86 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index 5b84d7305520..1cf7561c8b4d 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -86,9 +86,6 @@ static int xe_file_open(struct drm_device *dev,
> > struct drm_file *file)
> > 	return 0;
> > }
> >=20
> > -static void device_kill_persistent_exec_queues(struct xe_device
> > *xe,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_file
> > *xef);
> > -
> > static void xe_file_close(struct drm_device *dev, struct drm_file
> > *file)
> > {
> > 	struct xe_device *xe =3D to_xe_device(dev);
> > @@ -105,8 +102,6 @@ static void xe_file_close(struct drm_device
> > *dev, struct drm_file *file)
> > 	mutex_unlock(&xef->exec_queue.lock);
> > 	xa_destroy(&xef->exec_queue.xa);
> > 	mutex_destroy(&xef->exec_queue.lock);
> > -	device_kill_persistent_exec_queues(xe, xef);
> > -
> > 	mutex_lock(&xef->vm.lock);
> > 	xa_for_each(&xef->vm.xa, idx, vm)
> > 		xe_vm_close_and_put(vm);
> > @@ -258,9 +253,6 @@ struct xe_device *xe_device_create(struct
> > pci_dev *pdev,
> > 			xa_erase(&xe->usm.asid_to_vm, asid);
> > 	}
> >=20
> > -	drmm_mutex_init(&xe->drm, &xe->persistent_engines.lock);
> > -	INIT_LIST_HEAD(&xe->persistent_engines.list);
> > -
> > 	spin_lock_init(&xe->pinned.lock);
> > 	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
> > 	INIT_LIST_HEAD(&xe->pinned.external_vram);
> > @@ -599,37 +591,6 @@ void xe_device_shutdown(struct xe_device *xe)
> > {
> > }
> >=20
> > -void xe_device_add_persistent_exec_queues(struct xe_device *xe,
> > struct xe_exec_queue *q)
> > -{
> > -	mutex_lock(&xe->persistent_engines.lock);
> > -	list_add_tail(&q->persistent.link, &xe-
> > >persistent_engines.list);
> > -	mutex_unlock(&xe->persistent_engines.lock);
> > -}
> > -
> > -void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_exec_queue
> > *q)
> > -{
> > -	mutex_lock(&xe->persistent_engines.lock);
> > -	if (!list_empty(&q->persistent.link))
> > -		list_del(&q->persistent.link);
> > -	mutex_unlock(&xe->persistent_engines.lock);
> > -}
> > -
> > -static void device_kill_persistent_exec_queues(struct xe_device
> > *xe,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_file
> > *xef)
> > -{
> > -	struct xe_exec_queue *q, *next;
> > -
> > -	mutex_lock(&xe->persistent_engines.lock);
> > -	list_for_each_entry_safe(q, next, &xe-
> > >persistent_engines.list,
> > -				 persistent.link)
> > -		if (q->persistent.xef =3D=3D xef) {
> > -			xe_exec_queue_kill(q);
> > -			list_del_init(&q->persistent.link);
> > -		}
> > -	mutex_unlock(&xe->persistent_engines.lock);
> > -}
> > -
> > void xe_device_wmb(struct xe_device *xe)
> > {
> > 	struct xe_gt *gt =3D xe_root_mmio_gt(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > b/drivers/gpu/drm/xe/xe_device.h
> > index 462f59e902b1..14be34d9f543 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -42,10 +42,6 @@ int xe_device_probe(struct xe_device *xe);
> > void xe_device_remove(struct xe_device *xe);
> > void xe_device_shutdown(struct xe_device *xe);
> >=20
> > -void xe_device_add_persistent_exec_queues(struct xe_device *xe,
> > struct xe_exec_queue *q);
> > -void xe_device_remove_persistent_exec_queues(struct xe_device *xe,
> > -					=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_exec_queue
> > *q);
> > -
> > void xe_device_wmb(struct xe_device *xe);
> >=20
> > static inline struct xe_file *to_xe_file(const struct drm_file
> > *file)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index eb2b806a1d23..9785eef2e5a4 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -348,14 +348,6 @@ struct xe_device {
> > 		struct mutex lock;
> > 	} usm;
> >=20
> > -	/** @persistent_engines: engines that are closed but still
> > running */
> > -	struct {
> > -		/** @persistent_engines.lock: protects persistent
> > engines */
> > -		struct mutex lock;
> > -		/** @persistent_engines.list: list of persistent
> > engines */
> > -		struct list_head list;
> > -	} persistent_engines;
> > -
> > 	/** @pinned: pinned BO state */
> > 	struct {
> > 		/** @pinned.lock: protected pinned BO list state
> > */
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 2976635be4d3..c2bcb5735e7b 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -60,7 +60,6 @@ static struct xe_exec_queue
> > *__xe_exec_queue_alloc(struct xe_device *xe,
> > 	q->fence_irq =3D &gt->fence_irq[hwe->class];
> > 	q->ring_ops =3D gt->ring_ops[hwe->class];
> > 	q->ops =3D gt->exec_queue_ops;
> > -	INIT_LIST_HEAD(&q->persistent.link);
> > 	INIT_LIST_HEAD(&q->compute.link);
> > 	INIT_LIST_HEAD(&q->multi_gt_link);
> >=20
> > @@ -379,23 +378,6 @@ static int
> > exec_queue_set_preemption_timeout(struct xe_device *xe,
> > 	return 0;
> > }
> >=20
> > -static int exec_queue_set_persistence(struct xe_device *xe, struct
> > xe_exec_queue *q,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 value, bool create)
> > -{
> > -	if (XE_IOCTL_DBG(xe, !create))
> > -		return -EINVAL;
> > -
> > -	if (XE_IOCTL_DBG(xe, xe_vm_in_preempt_fence_mode(q->vm)))
> > -		return -EINVAL;
> > -
> > -	if (value)
> > -		q->flags |=3D EXEC_QUEUE_FLAG_PERSISTENT;
> > -	else
> > -		q->flags &=3D ~EXEC_QUEUE_FLAG_PERSISTENT;
> > -
> > -	return 0;
> > -}
> > -
> > static int exec_queue_set_job_timeout(struct xe_device *xe, struct
> > xe_exec_queue *q,
> > 				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 value, bool create)
> > {
> > @@ -469,7 +451,6 @@ static const xe_exec_queue_set_property_fn
> > exec_queue_set_property_funcs[] =3D {
> > 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY] =3D
> > exec_queue_set_priority,
> > 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE] =3D
> > exec_queue_set_timeslice,
> > 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT] =3D
> > exec_queue_set_preemption_timeout,
> > -	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE] =3D
> > exec_queue_set_persistence,
> > 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT] =3D
> > exec_queue_set_job_timeout,
> > 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER] =3D
> > exec_queue_set_acc_trigger,
> > 	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY] =3D
> > exec_queue_set_acc_notify,
> > @@ -496,6 +477,9 @@ static int
> > exec_queue_user_ext_set_property(struct xe_device *xe,
> > 		return -EINVAL;
> >=20
> > 	idx =3D array_index_nospec(ext.property,
> > ARRAY_SIZE(exec_queue_set_property_funcs));
> > +	if (!exec_queue_set_property_funcs[idx])
> > +		return -EINVAL;
> > +
> > 	return exec_queue_set_property_funcs[idx](xe, q,
> > ext.value,=C2=A0 create);
> > }
> >=20
> > @@ -707,8 +691,7 @@ int xe_exec_queue_create_ioctl(struct
> > drm_device *dev, void *data,
> > 			/* The migration vm doesn't hold rpm ref
> > */
> > 			xe_device_mem_access_get(xe);
> >=20
> > -			flags =3D EXEC_QUEUE_FLAG_PERSISTENT |
> > EXEC_QUEUE_FLAG_VM |
> > -				(id ?
> > EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
> > +			flags =3D EXEC_QUEUE_FLAG_VM | (id ?
> > EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
> >=20
> > 			migrate_vm =3D
> > xe_migrate_get_vm(gt_to_tile(gt)->migrate);
> > 			new =3D xe_exec_queue_create(xe, migrate_vm,
> > logical_mask,
> > @@ -759,9 +742,7 @@ int xe_exec_queue_create_ioctl(struct
> > drm_device *dev, void *data,
> > 		}
> >=20
> > 		q =3D xe_exec_queue_create(xe, vm, logical_mask,
> > -					 args->width, hwe,
> > -					 xe_vm_in_lr_mode(vm) ? 0
> > :
> > -				=09
> > EXEC_QUEUE_FLAG_PERSISTENT,
> > +					 args->width, hwe, 0,
> > 					 args->extensions);
> > 		up_read(&vm->lock);
> > 		xe_vm_put(vm);
> > @@ -778,8 +759,6 @@ int xe_exec_queue_create_ioctl(struct
> > drm_device *dev, void *data,
> > 		}
> > 	}
> >=20
> > -	q->persistent.xef =3D xef;
> > -
> > 	mutex_lock(&xef->exec_queue.lock);
> > 	err =3D xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b,
> > GFP_KERNEL);
> > 	mutex_unlock(&xef->exec_queue.lock);
> > @@ -922,10 +901,7 @@ int xe_exec_queue_destroy_ioctl(struct
> > drm_device *dev, void *data,
> > 	if (XE_IOCTL_DBG(xe, !q))
> > 		return -ENOENT;
> >=20
> > -	if (!(q->flags & EXEC_QUEUE_FLAG_PERSISTENT))
> > -		xe_exec_queue_kill(q);
> > -	else
> > -		xe_device_add_persistent_exec_queues(xe, q);
> > +	xe_exec_queue_kill(q);
> >=20
> > 	trace_xe_exec_queue_close(q);
> > 	xe_exec_queue_put(q);
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > b/drivers/gpu/drm/xe/xe_execlist.c
> > index 58dfe6a78ffe..1788e78caf5c 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -378,8 +378,6 @@ static void
> > execlist_exec_queue_fini_async(struct work_struct *w)
> > 		list_del(&exl->active_link);
> > 	spin_unlock_irqrestore(&exl->port->lock, flags);
> >=20
> > -	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
> > -		xe_device_remove_persistent_exec_queues(xe, q);
> > 	drm_sched_entity_fini(&exl->entity);
> > 	drm_sched_fini(&exl->sched);
> > 	kfree(exl);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 4744668ef60a..efee08680aea 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1031,8 +1031,6 @@ static void
> > __guc_exec_queue_fini_async(struct work_struct *w)
> >=20
> > 	if (xe_exec_queue_is_lr(q))
> > 		cancel_work_sync(&ge->lr_tdr);
> > -	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
> > -
> > 		xe_device_remove_persistent_exec_queues(gt_to_xe(q->gt), q);
> > 	release_guc_id(guc, q);
> > 	xe_sched_entity_fini(&ge->entity);
> > 	xe_sched_fini(&ge->sched);
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 50bbea0992d9..ee4673d5d1c1 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -1045,7 +1045,6 @@ struct drm_xe_exec_queue_create {
> > #define=C2=A0=C2=A0 DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> > #define=C2=A0=C2=A0 DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> > #define=C2=A0=C2=A0 DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
> > -#define=C2=A0=C2=A0 DRM_XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
> > #define=C2=A0=C2=A0 DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
> > #define=C2=A0=C2=A0 DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
> > #define=C2=A0=C2=A0 DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
> > --=20
> > 2.43.0
> >=20

