Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A873DC43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 12:57:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EDC10E1C7;
	Fri, 10 Jul 2026 12:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTcYWVHH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794A510E198
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 12:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783688246; x=1815224246;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/ScoASIQDvwH1L1fiT7RNnpKKr85jiCjg7LhUh3XK40=;
 b=NTcYWVHHUvy3C+GPI+olRzuIHMCDEdWkhxNRzfkRGe+i5ymWTxnKDK5O
 7DsLlV3fEAGDS9EHduN4A4XKE5BtVE7yUgNxuAIbGYkCq24FT4KUxYWc9
 rRcdz8Hio4jOAoXrOiQGrrcFdAFLX82Q7/Wd/NWTyc/AzJ/kRzCUTbY0p
 HlBjHs1xlSzDZWYlRXkZ6NE3lP1TPKYHwJhRHGCh2Pra+xLP/aNKxjcgz
 dlc0jxn85Ey3FEf8J9K03r3mdJTuRXFlCD5KwNNRkb/LuHbE5iHTgU2i/
 rj/OHcDjFiHEF7idBmXbRvkmY7KryKdOO9c4ukdGWtXolcSpPTVi+RwqN A==;
X-CSE-ConnectionGUID: k4NKv6mqSQm5wEuoR+9Pdw==
X-CSE-MsgGUID: 7qUnFUswSWqldo3t8hbcCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88297438"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="88297438"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 05:57:25 -0700
X-CSE-ConnectionGUID: HKE5xD5XTLGbDXbuykAMyg==
X-CSE-MsgGUID: N2vDJgOKTJ6YtXsPnGs48Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="248502768"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.151])
 ([10.245.244.151])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 05:57:23 -0700
Message-ID: <9fea8ff82fa362c7e68f2f1f805ce3fe8c0cf257.camel@linux.intel.com>
Subject: Re: [PATCH v10] drm/xe/guc: Hold device ref until queue teardown
 completes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com, 
 rodrigo.vivi@intel.com, tejas.upadhyay@intel.com
Date: Fri, 10 Jul 2026 14:57:21 +0200
In-Reply-To: <b2745e11-a5e3-4754-812e-cd29654db193@intel.com>
References: <20260710030107.1813068-1-arvind.yadav@intel.com>
 <2a946288e9c348473a8c81b8ab56fb1e5ababe6c.camel@linux.intel.com>
 <b2745e11-a5e3-4754-812e-cd29654db193@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Fri, 2026-07-10 at 15:30 +0530, Yadav, Arvind wrote:
>=20
> On 10-07-2026 12:04, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2026-07-10 at 08:31 +0530, Arvind Yadav wrote:
> > > GuC exec queue destruction can run asynchronously. If the final
> > > device
> > > put happens from a destroy worker, drmm cleanup can end up
> > > draining
> > > the same workqueue and deadlock.
> > >=20
> > > Hold a drm_device reference for the queue lifetime and drop it
> > > after
> > > queue teardown completes. This keeps drmm cleanup from running
> > > while
> > > async destroy work is still pending.
> > >=20
> > > Move GuC destroy work to a module-lifetime Xe workqueue and flush
> > > it
> > > on PCI remove so hot-unbind/rebind still waits for pending
> > > destroy
> > > work.
> > >=20
> > > With queue-held device refs, guc_submit_sw_fini() cannot run with
> > > live
> > > GuC IDs. Replace the fini wait with an assertion and remove the
> > > unused
> > > fini_wq.
> > >=20
> > > v2:
> > > =C2=A0=C2=A0 - Rebase
> > >=20
> > > v3:
> > > =C2=A0=C2=A0 - Switch to queue-lifetime drm_dev_get()/drm_dev_put() m=
odel.
> > > (Matt)
> > > =C2=A0=C2=A0 - Queue async teardown on system_dfl_wq instead of xe-
> > > >destroy_wq.
> > > (Matt)
> > > =C2=A0=C2=A0 - Drop separate deferred drm_dev_put worker.
> > > =C2=A0=C2=A0 - Remove stale drain_workqueue(xe->destroy_wq) from
> > > guc_submit_sw_fini().
> > >=20
> > > v4:
> > > =C2=A0=C2=A0 - Replace the guc_submit_sw_fini() wait with an assertio=
n and
> > > remove
> > > =C2=A0=C2=A0=C2=A0=C2=A0 the now-unused fini_wq. (sashiko)
> > >=20
> > > v5:
> > > =C2=A0=C2=A0 - Move destroy work to a module-lifetime Xe workqueue in=
stead
> > > of
> > > =C2=A0=C2=A0=C2=A0=C2=A0 system_dfl_wq. (Matt)
> > > =C2=A0=C2=A0 - Flush the module-lifetime destroy workqueue during PCI
> > > remove to
> > > =C2=A0=C2=A0=C2=A0=C2=A0 preserve the old device-remove wait semantic=
s.
> > >=20
> > > v6:
> > > =C2=A0=C2=A0 - Keep SVM pagemap destroy work on the per-device destro=
y_wq
> > > to
> > > avoid
> > > =C2=A0=C2=A0=C2=A0=C2=A0 letting it outlive the xe_device/drm_device.=
 (Sashiko)
> > > =C2=A0=C2=A0 - Use WQ_MEM_RECLAIM for xe->destroy_wq because SVM page=
map
> > > destroy
> > > work
> > > =C2=A0=C2=A0=C2=A0=C2=A0 can be queued from the reclaim path.
> > >=20
> > > v7:
> > > =C2=A0=C2=A0 - Drop the per-device xe->destroy_wq and use the module-=
level
> > > destroy WQ
> > > =C2=A0=C2=A0=C2=A0=C2=A0 for SVM pagemap destroy as well. (Matt)
> > > =C2=A0=C2=A0 - Rename xe_exec_queue_destroy_wq_*() helpers to
> > > xe_destroy_wq_*()
> > > =C2=A0=C2=A0=C2=A0=C2=A0 helpers because the WQ is no longer exec-que=
ue specific.
> > > (Matt)
> > >=20
> > > v8:
> > > =C2=A0=C2=A0 - Rebase.
> > >=20
> > > v9:
> > > =C2=A0=C2=A0 - Keep SVM pagemap destroy work on the per-device
> > > WQ_MEM_RECLAIM
> > > =C2=A0=C2=A0=C2=A0=C2=A0 destroy_wq because it can be queued from rec=
laim and embeds
> > > =C2=A0=C2=A0=C2=A0=C2=A0 the dev_pagemap used by devres teardown. (Sa=
shiko)
> > > =C2=A0=C2=A0 - Keep the module-level destroy WQ GuC-only and drop
> > > WQ_MEM_RECLAIM
> > > =C2=A0=C2=A0=C2=A0=C2=A0 from it.
> > > =C2=A0=C2=A0 - Update the module-WQ kdoc to document the GuC/SVM spli=
t.
> > >=20
> > > v10:
> > > =C2=A0=C2=A0 - Keep xe->destroy_wq per-cpu while adding WQ_MEM_RECLAI=
M to
> > > fix
> > > the
> > > =C2=A0=C2=A0=C2=A0=C2=A0 workqueue allocation warning.
> > If *all* work items that release the drm_device refcount are
> > flushed at
> > device removal (unplug) time, Why do we need the drm_device
> > reference
> > in the first place? Since IIRC the devres, that runs after unplug,
> > keeps a drm_device reference?
>=20
>=20
> The flush only covers work queued at unplug/remove time.=20
> "xe_device_remove()" does not close clients or destroy user queues,
> so a=20
> queue can outlive the remove-time flush. That's why the queue-held=20
> "drm_dev_get()" is still needed to keep "drm_dev_release()" and drmm=20
> cleanup from running until queue teardown completes.
>=20
>=20
> > Similarly, if we flush all outstanding per-device GuC work at
> > device
> > removal time, why do we need this additional module-wide workqueue?
> > Wouldn't it be equivalent to keep the GuC work items on the per-
> > device
> > destroy wq, and flush it at unplug / pci removal, the latter being
> > the
> > key?
>=20
>=20
> The PCI-remove flush only waits for destroy work already queued at
> that=20
> time. A user queue can outlive unplug and queue its destroy work
> later=20
> when the fd closes. That is why the per-device WQ is still unsafe for
> GuC teardown, the worker can drop the final drm_device ref, enter
> drmm=20
> cleanup and destroy the same WQ it is running on. So the module-
> lifetime=20
> WQ is still needed.
>=20
> Please let me know if I have missed something in this reasoning.

No, it sounds sane.

Thanks!
Thomas


>=20
>=20
> >=20
> > > Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 2 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0 | 66 +++++=
+++++++++++-----
> > > -----
> > > --
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_guc_types.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 -
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_module.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 49 +++++++++++++++++++++
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_module.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 5 +++
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++
> > > =C2=A0=C2=A08 files changed, 105 insertions(+), 32 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c
> > > index ad7f3e61d457..47630e9f7410 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -581,7 +581,7 @@ int xe_device_init_early(struct xe_device
> > > *xe)
> > > =C2=A0=C2=A0					=09
> > > WQ_MEM_RECLAIM);
> > > =C2=A0=C2=A0	xe->ordered_wq =3D alloc_ordered_workqueue("xe-ordered-
> > > wq",
> > > 0);
> > > =C2=A0=C2=A0	xe->unordered_wq =3D alloc_workqueue("xe-unordered-wq",
> > > WQ_PERCPU, 0);
> > > -	xe->destroy_wq =3D alloc_workqueue("xe-destroy-wq",
> > > WQ_PERCPU,
> > > 0);
> > > +	xe->destroy_wq =3D alloc_workqueue("xe-destroy-wq",
> > > WQ_PERCPU
> > > > WQ_MEM_RECLAIM, 0);
> > > =C2=A0=C2=A0	if (!xe->ordered_wq || !xe->unordered_wq ||
> > > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 !xe->preempt_fence_wq || !xe->destroy=
_wq) {
> > > =C2=A0=C2=A0		/*
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 022e08205897..56c17cca79c0 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -355,7 +355,7 @@ struct xe_device {
> > > =C2=A0=C2=A0	/** @unordered_wq: used to serialize unordered work */
> > > =C2=A0=C2=A0	struct workqueue_struct *unordered_wq;
> > > =C2=A0=20
> > > -	/** @destroy_wq: used to serialize user destroy work,
> > > like
> > > queue */
> > > +	/** @destroy_wq: used to serialize SVM pagemap destroy
> > > work
> > > */
> > > =C2=A0=C2=A0	struct workqueue_struct *destroy_wq;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/** @tiles: device tiles */
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 12416bfa3255..9b9434d7452a 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -10,6 +10,7 @@
> > > =C2=A0=C2=A0#include <linux/circ_buf.h>
> > > =C2=A0=C2=A0#include <linux/dma-fence-array.h>
> > > =C2=A0=20
> > > +#include <drm/drm_drv.h>
> > > =C2=A0=C2=A0#include <drm/drm_managed.h>
> > > =C2=A0=20
> > > =C2=A0=C2=A0#include "abi/guc_actions_abi.h"
> > > @@ -37,6 +38,7 @@
> > > =C2=A0=C2=A0#include "xe_macros.h"
> > > =C2=A0=C2=A0#include "xe_map.h"
> > > =C2=A0=C2=A0#include "xe_mocs.h"
> > > +#include "xe_module.h"
> > > =C2=A0=C2=A0#include "xe_pm.h"
> > > =C2=A0=C2=A0#include "xe_ring_ops_types.h"
> > > =C2=A0=C2=A0#include "xe_sched_job.h"
> > > @@ -232,17 +234,9 @@ static bool
> > > exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> > > =C2=A0=C2=A0static void guc_submit_sw_fini(struct drm_device *drm, vo=
id
> > > *arg)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct xe_guc *guc =3D arg;
> > > -	struct xe_device *xe =3D guc_to_xe(guc);
> > > =C2=A0=C2=A0	struct xe_gt *gt =3D guc_to_gt(guc);
> > > -	int ret;
> > > -
> > > -	ret =3D wait_event_timeout(guc->submission_state.fini_wq,
> > > -				 xa_empty(&guc-
> > > > submission_state.exec_queue_lookup),
> > > -				 HZ * 5);
> > > =C2=A0=20
> > > -	drain_workqueue(xe->destroy_wq);
> > > -
> > > -	xe_gt_assert(gt, ret);
> > > +	xe_gt_assert(gt, xa_empty(&guc-
> > > > submission_state.exec_queue_lookup));
> > > =C2=A0=20
> > > =C2=A0=C2=A0	xa_destroy(&guc->submission_state.exec_queue_lookup);
> > > =C2=A0=C2=A0}
> > > @@ -319,8 +313,6 @@ int xe_guc_submit_init(struct xe_guc *guc,
> > > unsigned int num_ids)
> > > =C2=A0=20
> > > =C2=A0=C2=A0	xa_init(&guc->submission_state.exec_queue_lookup);
> > > =C2=A0=20
> > > -	init_waitqueue_head(&guc->submission_state.fini_wq);
> > > -
> > > =C2=A0=C2=A0	primelockdep(guc);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	guc->submission_state.initialized =3D true;
> > > @@ -411,9 +403,6 @@ static void __release_guc_id(struct xe_guc
> > > *guc,
> > > struct xe_exec_queue *q,
> > > =C2=A0=C2=A0	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 q->guc->id, q->width);
> > > =C2=A0=20
> > > -	if (xa_empty(&guc->submission_state.exec_queue_lookup))
> > > -		wake_up(&guc->submission_state.fini_wq);
> > > -
> > > =C2=A0=C2=A0	mutex_unlock(&guc->submission_state.lock);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > @@ -1686,6 +1675,7 @@ static void guc_exec_queue_fini(struct
> > > xe_exec_queue *q)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct xe_guc_exec_queue *ge =3D q->guc;
> > > =C2=A0=C2=A0	struct xe_guc *guc =3D exec_queue_to_guc(q);
> > > +	struct drm_device *drm =3D &guc_to_xe(guc)->drm;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> > > =C2=A0=C2=A0		struct xe_exec_queue_group *group =3D q-
> > > > multi_queue.group;
> > > @@ -1704,36 +1694,52 @@ static void guc_exec_queue_fini(struct
> > > xe_exec_queue *q)
> > > =C2=A0=C2=A0	 * (timeline name).
> > > =C2=A0=C2=A0	 */
> > > =C2=A0=C2=A0	kfree_rcu(ge, rcu);
> > > +
> > > +	drm_dev_put(drm);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -static void __guc_exec_queue_destroy_async(struct work_struct
> > > *w)
> > > +static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
> > > =C2=A0=C2=A0{
> > > -	struct xe_guc_exec_queue *ge =3D
> > > -		container_of(w, struct xe_guc_exec_queue,
> > > destroy_async);
> > > -	struct xe_exec_queue *q =3D ge->q;
> > > +	struct xe_guc_exec_queue *ge =3D q->guc;
> > > =C2=A0=C2=A0	struct xe_guc *guc =3D exec_queue_to_guc(q);
> > > +	struct xe_device *xe =3D guc_to_xe(guc);
> > > +	struct drm_device *drm =3D &xe->drm;
> > > =C2=A0=20
> > > -	guard(xe_pm_runtime)(guc_to_xe(guc));
> > > -	trace_xe_exec_queue_destroy(q);
> > > +	/*
> > > +	 * guc_exec_queue_fini() drops the queue's drm_device
> > > ref.
> > > +	 * Keep the device alive until the PM-runtime guard
> > > unwinds.
> > > +	 */
> > > +	drm_dev_get(drm);
> > > =C2=A0=20
> > > -	/* Confirm no work left behind accessing device
> > > structures
> > > */
> > > -	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
> > > +	scoped_guard(xe_pm_runtime, xe) {
> > > +		trace_xe_exec_queue_destroy(q);
> > > =C2=A0=20
> > > -	xe_exec_queue_fini(q);
> > > +		/* Confirm no work left behind accessing device
> > > structures */
> > > +		cancel_delayed_work_sync(&ge-
> > > >sched.base.work_tdr);
> > > +
> > > +		xe_exec_queue_fini(q);
> > > +	}
> > > +
> > > +	drm_dev_put(drm);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -static void guc_exec_queue_destroy_async(struct xe_exec_queue
> > > *q)
> > > +static void __guc_exec_queue_destroy_async(struct work_struct
> > > *w)
> > > =C2=A0=C2=A0{
> > > -	struct xe_guc *guc =3D exec_queue_to_guc(q);
> > > -	struct xe_device *xe =3D guc_to_xe(guc);
> > > +	struct xe_guc_exec_queue *ge =3D
> > > +		container_of(w, struct xe_guc_exec_queue,
> > > destroy_async);
> > > +
> > > +	guc_exec_queue_do_destroy(ge->q);
> > > +}
> > > =C2=A0=20
> > > +static void guc_exec_queue_destroy_async(struct xe_exec_queue
> > > *q)
> > > +{
> > > =C2=A0=C2=A0	INIT_WORK(&q->guc->destroy_async,
> > > __guc_exec_queue_destroy_async);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/* We must block on kernel engines so slabs are empty on
> > > driver unload */
> > > =C2=A0=C2=A0	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT ||
> > > exec_queue_wedged(q))
> > > -		__guc_exec_queue_destroy_async(&q->guc-
> > > > destroy_async);
> > > +		guc_exec_queue_do_destroy(q);
> > > =C2=A0=C2=A0	else
> > > -		queue_work(xe->destroy_wq, &q->guc-
> > > >destroy_async);
> > > +		xe_destroy_wq_queue(&q->guc->destroy_async);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0static void __guc_exec_queue_destroy(struct xe_guc *guc, =
struct
> > > xe_exec_queue *q)
> > > @@ -1928,6 +1934,7 @@ static int guc_exec_queue_init(struct
> > > xe_exec_queue *q)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct xe_gpu_scheduler *sched;
> > > =C2=A0=C2=A0	struct xe_guc *guc =3D exec_queue_to_guc(q);
> > > +	struct drm_device *drm =3D &guc_to_xe(guc)->drm;
> > > =C2=A0=C2=A0	struct workqueue_struct *submit_wq =3D NULL;
> > > =C2=A0=C2=A0	struct xe_guc_exec_queue *ge;
> > > =C2=A0=C2=A0	long timeout;
> > > @@ -1939,6 +1946,8 @@ static int guc_exec_queue_init(struct
> > > xe_exec_queue *q)
> > > =C2=A0=C2=A0	if (!ge)
> > > =C2=A0=C2=A0		return -ENOMEM;
> > > =C2=A0=20
> > > +	drm_dev_get(drm);
> > > +
> > > =C2=A0=C2=A0	q->guc =3D ge;
> > > =C2=A0=C2=A0	ge->q =3D q;
> > > =C2=A0=C2=A0	init_rcu_head(&ge->rcu);
> > > @@ -2015,6 +2024,7 @@ static int guc_exec_queue_init(struct
> > > xe_exec_queue *q)
> > > =C2=A0=C2=A0	release_guc_id(guc, q);
> > > =C2=A0=C2=A0err_free:
> > > =C2=A0=C2=A0	kfree(ge);
> > > +	drm_dev_put(drm);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	return err;
> > > =C2=A0=C2=A0}
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h
> > > b/drivers/gpu/drm/xe/xe_guc_types.h
> > > index c7b9642b41ba..31a2acb63ac3 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > > @@ -100,8 +100,6 @@ struct xe_guc {
> > > =C2=A0=C2=A0		 * even initialized - before that not even the
> > > lock
> > > is valid
> > > =C2=A0=C2=A0		 */
> > > =C2=A0=C2=A0		bool initialized;
> > > -		/** @submission_state.fini_wq: submit fini wait
> > > queue */
> > > -		wait_queue_head_t fini_wq;
> > > =C2=A0=C2=A0	} submission_state;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	/** @hwconfig: Hardware config state */
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c
> > > b/drivers/gpu/drm/xe/xe_module.c
> > > index 39e4fc85f019..848d65265443 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -7,6 +7,7 @@
> > > =C2=A0=20
> > > =C2=A0=C2=A0#include <linux/init.h>
> > > =C2=A0=C2=A0#include <linux/module.h>
> > > +#include <linux/workqueue.h>
> > > =C2=A0=20
> > > =C2=A0=C2=A0#include <drm/drm_module.h>
> > > =C2=A0=20
> > > @@ -88,6 +89,50 @@ static int xe_check_nomodeset(void)
> > > =C2=A0=C2=A0	return 0;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +static struct workqueue_struct *xe_destroy_wq;
> > > +
> > > +static int __init xe_destroy_wq_module_init(void)
> > > +{
> > > +	xe_destroy_wq =3D alloc_workqueue("xe-guc-destroy-wq",
> > > WQ_UNBOUND, 0);
> > > +	if (!xe_destroy_wq)
> > > +		return -ENOMEM;
> > > +	return 0;
> > > +}
> > > +
> > > +static void xe_destroy_wq_module_exit(void)
> > > +{
> > > +	if (xe_destroy_wq)
> > > +		destroy_workqueue(xe_destroy_wq);
> > > +	xe_destroy_wq =3D NULL;
> > > +}
> > > +
> > > +/**
> > > + * xe_destroy_wq_queue() - Queue work on the destroy workqueue
> > > + * @work: work item to queue
> > > + *
> > > + * The destroy workqueue has module lifetime and is used for GuC
> > > exec queue
> > > + * teardown that can outlive a single xe_device. SVM pagemap
> > > destroy
> > > uses the
> > > + * per-device xe->destroy_wq instead.
> > > + *
> > > + * Return: %true if @work was queued, %false if it was already
> > > pending.
> > > + */
> > > +bool xe_destroy_wq_queue(struct work_struct *work)
> > > +{
> > > +	return queue_work(xe_destroy_wq, work);
> > > +}
> > > +
> > > +/**
> > > + * xe_destroy_wq_flush() - Flush the destroy workqueue
> > > + *
> > > + * Drains all pending destroy work. Called from PCI remove to
> > > ensure
> > > + * teardown ordering before the device is destroyed.
> > > + */
> > > +void xe_destroy_wq_flush(void)
> > > +{
> > > +	if (xe_destroy_wq)
> > > +		flush_workqueue(xe_destroy_wq);
> > > +}
> > > +
> > > =C2=A0=C2=A0struct init_funcs {
> > > =C2=A0=C2=A0	int (*init)(void);
> > > =C2=A0=C2=A0	void (*exit)(void);
> > > @@ -109,6 +154,10 @@ static const struct init_funcs init_funcs[]
> > > =3D {
> > > =C2=A0=C2=A0		.init =3D xe_sched_job_module_init,
> > > =C2=A0=C2=A0		.exit =3D xe_sched_job_module_exit,
> > > =C2=A0=C2=A0	},
> > > +	{
> > > +		.init =3D xe_destroy_wq_module_init,
> > > +		.exit =3D xe_destroy_wq_module_exit,
> > > +	},
> > > =C2=A0=C2=A0	{
> > > =C2=A0=C2=A0		.init =3D xe_register_pci_driver,
> > > =C2=A0=C2=A0		.exit =3D xe_unregister_pci_driver,
> > > diff --git a/drivers/gpu/drm/xe/xe_module.h
> > > b/drivers/gpu/drm/xe/xe_module.h
> > > index c75153471248..a0eb7db07770 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > @@ -8,6 +8,8 @@
> > > =C2=A0=20
> > > =C2=A0=C2=A0#include <linux/types.h>
> > > =C2=A0=20
> > > +struct work_struct;
> > > +
> > > =C2=A0=C2=A0/* Module modprobe variables */
> > > =C2=A0=C2=A0struct xe_modparam {
> > > =C2=A0=C2=A0	bool probe_display;
> > > @@ -26,5 +28,8 @@ struct xe_modparam {
> > > =C2=A0=20
> > > =C2=A0=C2=A0extern struct xe_modparam xe_modparam;
> > > =C2=A0=20
> > > +bool xe_destroy_wq_queue(struct work_struct *work);
> > > +void xe_destroy_wq_flush(void);
> > > +
> > > =C2=A0=C2=A0#endif
> > > =C2=A0=20
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > b/drivers/gpu/drm/xe/xe_pci.c
> > > index 08c14a0202d9..b0764eb90834 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -1099,6 +1099,12 @@ static void xe_pci_remove(struct pci_dev
> > > *pdev)
> > > =C2=A0=C2=A0		return;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	xe_device_remove(xe);
> > > +
> > > +	/*
> > > +	 * Preserve remove-time flush after moving destroy work
> > > to
> > > module
> > > +	 * lifetime.
> > > +	 */
> > > +	xe_destroy_wq_flush();
> > > =C2=A0=C2=A0	xe_pm_fini(xe);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > > b/drivers/gpu/drm/xe/xe_svm.c
> > > index e0f0c23d172d..2cb17497d950 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -1732,6 +1732,11 @@ static void xe_pagemap_destroy(struct
> > > drm_pagemap *dpagemap, bool from_atomic_or
> > > =C2=A0=C2=A0	struct xe_pagemap *xpagemap =3D container_of(dpagemap,
> > > typeof(*xpagemap), dpagemap);
> > > =C2=A0=C2=A0	struct xe_device *xe =3D to_xe_device(dpagemap->drm);
> > > =C2=A0=20
> > > +	/*
> > > +	 * SVM pagemap destroy can be queued from reclaim and
> > > xpagemap embeds
> > > +	 * the dev_pagemap used by devres teardown. Keep it on
> > > the
> > > per-device
> > > +	 * WQ_MEM_RECLAIM destroy_wq, not the module-level GuC
> > > destroy WQ.
> > > +	 */
> > I think this comment can be dropped. Outside the context of this
> > patch
> > it will be confusing?
>=20
>=20
> Agreed, I will remove this comment.
>=20
> Thanks,
> Arvind
>=20
> >=20
> > > =C2=A0=C2=A0	if (from_atomic_or_reclaim)
> > > =C2=A0=C2=A0		queue_work(xe->destroy_wq, &xpagemap-
> > > >destroy_work);
> > > =C2=A0=C2=A0	else
> > Thanks,
> > Thomas
