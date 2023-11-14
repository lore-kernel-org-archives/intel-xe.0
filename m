Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25D4C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 18:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E1410E079;
	Tue, 14 Nov 2023 18:32:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4833410E4B8
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 18:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699986772; x=1731522772;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=7+vOkpKQkEzjm+V6mOo+7YVKjLmY573VY6EdWWO8vqU=;
 b=DflyKptprBMppXfWoAeHoHxF9cJbBa3oVuMLOw3btuTIk9ty5szhYPKJ
 iwAVEH5T0G49ZMMikxzaUgoS6GDvqkENmXBT/1tn8NmcU7CzhBzC0g9RM
 Q1Ej2BLFnbuQjzyfIqKPMoozq4ayNC2Bc2uxT5HZQDanDABEY+ZHpBy6i
 h1b3jRLTP4X/a7LxO6YJA9vKL1qyriE/2HeAdky8Q7zkgMWRPZC8+/el8
 1lmxWx5qoFgFCBYb+484JXuZm1iMJT3/EC1lYWxgjRgtCSXpAjQj98yFl
 3P/Lt09huuKI/QxKFq2mxW9F7zzJy4C2X8VXtYvrEfE/or+pRHFBiOYpc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="370065988"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="370065988"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 10:32:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="768334818"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="768334818"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 10:32:49 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
In-Reply-To: <20231113231751.GC1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
 <20231106111845.2333093-2-mika.kuoppala@linux.intel.com>
 <20231113231751.GC1327160@mdroper-desk1.amr.corp.intel.com>
Date: Tue, 14 Nov 2023 20:29:20 +0200
Message-ID: <87fs186ven.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [RFC 01/25] drm/xe/eudebug: Introduce eudebug support
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Matt Roper <matthew.d.roper@intel.com> writes:

> On Mon, Nov 06, 2023 at 01:18:21PM +0200, Mika Kuoppala wrote:
>> With eudebug event interface, user space debugger process (like gdb)
>> is able to keep track of resources created by another process
>> (debuggee using drm/xe) and act upon these resources.
>>=20
>> For example, debugger can find a client vm which contains isa/elf
>> for a particular shader/eu-kernel and then inspect and modify it
>> (for example installing a breakpoint).
>>=20
>> Debugger first opens a connection to xe with a drm ioctl specifying
>> target pid to connect. This returns an anon fd handle that can then be
>> used to listen for events with dedicated ioctl.
>>=20
>> This patch introduces eudebug connection and event queuing, adding
>> client create/destroy and vm create/destroy events as a baseline.
>> More events for full debugger operation are needed and
>> those will be introduced in follow up patches.
>>=20
>> The resource tracking parts are inspired by the work of
>> Maciej Patelczyk on resource handling for i915. Chris Wilson
>> suggested improvement of two ways mapping which makes it easy to
>> use resource map as a definitive bookkeep of what resources
>> are played to debugger in the discovery phase (on follow up patch).
>>=20
>> v2: - event printer removed (Maarten)
>>     - trim down kfifo accessors (Maarten)
>>     - xa_alloc spurious locking removed (Maarten)
>>=20
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile           |    3 +-
>>  drivers/gpu/drm/xe/xe_device.c        |   22 +-
>>  drivers/gpu/drm/xe/xe_device_types.h  |   25 +
>>  drivers/gpu/drm/xe/xe_eudebug.c       | 1010 +++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_eudebug.h       |   27 +
>>  drivers/gpu/drm/xe/xe_eudebug_types.h |  166 ++++
>>  drivers/gpu/drm/xe/xe_vm.c            |    7 +-
>>  include/uapi/drm/xe_drm_tmp.h         |   78 ++
>>  8 files changed, 1335 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
>>  create mode 100644 include/uapi/drm/xe_drm_tmp.h
>>=20
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index a1a8847e2ba3..15c044c96d26 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -117,7 +117,8 @@ xe-y +=3D xe_bb.o \
>>  	xe_vm_madvise.o \
>>  	xe_wait_user_fence.o \
>>  	xe_wa.o \
>> -	xe_wopcm.o
>> +	xe_wopcm.o \
>> +	xe_eudebug.o
>>=20=20
>>  # graphics hardware monitoring (HWMON) support
>>  xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devi=
ce.c
>> index 515cdf599fab..9644387cd11f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -14,6 +14,7 @@
>>  #include <drm/drm_managed.h>
>>  #include <drm/drm_print.h>
>>  #include <drm/xe_drm.h>
>> +#include <drm/xe_drm_tmp.h>
>
> tmp??  Even if we need a separate header for UAPI accessed through a
> different file descriptor, we should probably come up with a better /
> more descriptive name.
>

Yes, one could argue that the tmp is strong hint. As this is not going
to be final place. Either merge into xe_drm.h or rename to
xe_drm_eudebug.h

>>=20=20
>>  #include "regs/xe_regs.h"
>>  #include "xe_bo.h"
>> @@ -39,6 +40,7 @@
>>  #include "xe_vm_madvise.h"
>>  #include "xe_wait_user_fence.h"
>>  #include "xe_hwmon.h"
>> +#include "xe_eudebug.h"
>>=20=20
>>  #ifdef CONFIG_LOCKDEP
>>  struct lockdep_map xe_device_mem_access_lockdep_map =3D {
>> @@ -74,7 +76,15 @@ static int xe_file_open(struct drm_device *dev, struc=
t drm_file *file)
>>  	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
>>=20=20
>>  	file->driver_priv =3D xef;
>> -	return 0;
>> +
>> +	ret =3D xa_alloc(&xe->clients.xa, &xef->client_id, xef, xa_limit_32b, =
GFP_KERNEL);
>> +
>> +	if (!ret)
>> +		xe_eudebug_file_open(xef);
>> +	else
>> +		kfree(xef);
>
> Don't we also need to cleanup the drm_client that was allocated earlier
> in the function?
>

Oh yes, drm clients have emerged and this patch lags behind.

>> +
>> +	return ret;
>>  }
>>=20=20
>>  static void device_kill_persistent_exec_queues(struct xe_device *xe,
>> @@ -88,6 +98,12 @@ static void xe_file_close(struct drm_device *dev, str=
uct drm_file *file)
>>  	struct xe_exec_queue *q;
>>  	unsigned long idx;
>>=20=20
>> +	xe_eudebug_file_close(xef);
>> +
>> +	mutex_lock(&xe->clients.lock);
>> +	xa_erase(&xe->clients.xa, xef->client_id);
>> +	mutex_unlock(&xe->clients.lock);
>
> Is the mutex locking here necessary?  I thought XArrays took care of the
> necessary locking internally with xa_lock()?
>

As we are not needing the client_id to anywhere, I have changed this to
be list. And for the xe_file_open above, we dont need to alloc array and th=
us
dont need to kfree(client) on error.

Thanks!
-Mika

>
> Matt
>
>> +
>>  	mutex_lock(&xef->exec_queue.lock);
>>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>>  		xe_exec_queue_kill(q);
>> @@ -129,6 +145,7 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D {
>>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>>  			  DRM_RENDER_ALLOW),
>>  	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW=
),
>> +	DRM_IOCTL_DEF_DRV(XE_EUDEBUG_CONNECT, xe_eudebug_connect_ioctl, DRM_RE=
NDER_ALLOW),
>>  };
>>=20=20
>>  static const struct file_operations xe_driver_fops =3D {
>> @@ -195,6 +212,7 @@ static void xe_device_destroy(struct drm_device *dev=
, void *dummy)
>>  		destroy_workqueue(xe->unordered_wq);
>>=20=20
>>  	ttm_device_fini(&xe->ttm);
>> +	xe_eudebug_fini(xe);
>>  }
>>=20=20
>>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>> @@ -242,6 +260,8 @@ struct xe_device *xe_device_create(struct pci_dev *p=
dev,
>>  	INIT_LIST_HEAD(&xe->pinned.external_vram);
>>  	INIT_LIST_HEAD(&xe->pinned.evicted);
>>=20=20
>> +	xe_eudebug_init(xe);
>> +
>>  	xe->ordered_wq =3D alloc_ordered_workqueue("xe-ordered-wq", 0);
>>  	xe->unordered_wq =3D alloc_workqueue("xe-unordered-wq", 0, 0);
>>  	if (!xe->ordered_wq || !xe->unordered_wq) {
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/x=
e_device_types.h
>> index 4119ef03fb7e..c577ac30efdc 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -408,6 +408,28 @@ struct xe_device {
>>  	/** @needs_flr_on_fini: requests function-reset on fini */
>>  	bool needs_flr_on_fini;
>>=20=20
>> +	/** @debugger connection list and globals for device */
>> +	struct {
>> +		/** @lock: protects the list of connections */
>> +		spinlock_t lock;
>> +		/** @list: list of connections, aka debuggers */
>> +		struct list_head list;
>> +
>> +		/** @session_count: session counter to track connections */
>> +		u64 session_count;
>> +
>> +		/** @available: is the debugging functionality available */
>> +		bool available;
>> +	} eudebug;
>> +
>> +	/** @clients xe_file tracking for eudebug discovery */
>> +	struct {
>> +		/** @lock: protects the xa */
>> +		struct mutex lock;
>> +		/** @xa: xarray of xe_files currently open */
>> +		struct xarray xa;
>> +	} clients;
>> +
>>  	/* private: */
>>=20=20
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> @@ -511,6 +533,9 @@ struct xe_file {
>>=20=20
>>  	/** @client: drm client */
>>  	struct xe_drm_client *client;
>> +
>> +	/** @client_id: id in clients.xa for eudebug discovery */
>> +	int client_id;
>>  };
>>=20=20
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eud=
ebug.c
>> new file mode 100644
>> index 000000000000..2f4b5f79d052
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
>> @@ -0,0 +1,1010 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright =C2=A9 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/uaccess.h>
>> +
>> +#include "xe_eudebug.h"
>> +
>> +#include <linux/anon_inodes.h>
>> +#include <linux/poll.h>
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_managed.h>
>> +#include <uapi/drm/xe_drm_tmp.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_eudebug_types.h"
>> +
>> +/*
>> + * If there is no event being read in this time (for example gdb stuck)
>> + * connection is forcibly disconnected. This releases the client as it =
was
>> + * waiting to get space for event in fifo.
>> + */
>> +#define XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS (10 * 1000)
>> +
>> +#define for_each_debugger_rcu(debugger, head) \
>> +	list_for_each_entry_rcu((debugger), (head), connection_link)
>> +
>> +#define from_event(T, event) container_of((event), typeof(*(T)), base)
>> +#define to_event(e) (&(e)->base)
>> +
>> +#define XE_EUDEBUG_DBG_STR "eudbg: (%d/%d:%lld:%d/%d): "
>> +#define XE_EUDEBUG_DBG_ARGS(d) current->pid, \
>> +		task_tgid_nr(current), \
>> +		(d)->session, \
>> +		(d)->target_task->pid, \
>> +		task_tgid_nr((d)->target_task)
>> +
>> +#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR #=
 fmt, \
>> +				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
>> +#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR=
 # fmt, \
>> +				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
>> +#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR #=
 fmt, \
>> +				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
>> +
>> +#define struct_member(T, member) (((T *)0)->member)
>> +
>> +#define write_member(T_out, ptr, member, value) { \
>> +	BUILD_BUG_ON(sizeof(*ptr) !=3D sizeof(T_out)); \
>> +	BUILD_BUG_ON(offsetof(typeof(*ptr), member) !=3D \
>> +		     offsetof(typeof(T_out), member)); \
>> +	BUILD_BUG_ON(sizeof(ptr->member) !=3D sizeof(value)); \
>> +	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) !=3D sizeof(value));=
 \
>> +	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
>> +	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
>> +	(ptr)->member =3D (value); \
>> +	}
>> +
>> +static struct xe_eudebug_event *
>> +event_fifo_pending(struct xe_eudebug *d)
>> +{
>> +	struct xe_eudebug_event *event;
>> +
>> +	if (kfifo_peek(&d->events.fifo, &event))
>> +		return event;
>> +
>> +	return NULL;
>> +}
>> +
>> +/*
>> + * This is racy as we dont take the lock for read but all the
>> + * callsites can handle the race so we can live without lock.
>> + */
>> +__no_kcsan
>> +static unsigned int
>> +event_fifo_num_events_peek(const struct xe_eudebug * const d)
>> +{
>> +	return kfifo_len(&d->events.fifo);
>> +}
>> +
>> +static const struct rhashtable_params rhash_res =3D {
>> +	.head_offset =3D offsetof(struct xe_eudebug_handle, rh_head),
>> +	.key_len =3D sizeof_field(struct xe_eudebug_handle, key),
>> +	.key_offset =3D offsetof(struct xe_eudebug_handle, key),
>> +	.automatic_shrinking =3D true,
>> +};
>> +
>> +static struct xe_eudebug_resource *
>> +resource_from_type(struct xe_eudebug_resources * const res, const int t)
>> +{
>> +	XE_WARN_ON(t < 0);
>> +	XE_WARN_ON(t >=3D XE_EUDEBUG_RES_TYPE_COUNT);
>> +
>> +	return &res->rt[t];
>> +}
>> +
>> +static struct xe_eudebug_resources *
>> +xe_eudebug_resources_alloc(void)
>> +{
>> +	struct xe_eudebug_resources *res;
>> +	int err;
>> +	int i;
>> +
>> +	res =3D kzalloc(sizeof(*res), GFP_KERNEL);
>> +	if (!res)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	mutex_init(&res->lock);
>> +
>> +	for (i =3D 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
>> +		xa_init_flags(&res->rt[i].xa, XA_FLAGS_ALLOC1);
>> +		err =3D rhashtable_init(&res->rt[i].rh, &rhash_res);
>> +
>> +		if (err) {
>> +			while (i--) {
>> +				xa_destroy(&res->rt[i].xa);
>> +				rhashtable_destroy(&res->rt[i].rh);
>> +			}
>> +
>> +			goto out;
>> +		}
>> +	}
>> +
>> +out:
>> +	if (err) {
>> +		kfree(res);
>> +		return ERR_PTR(err);
>> +	}
>> +
>> +	return res;
>> +}
>> +
>> +static void res_free_fn(void *ptr, void *arg)
>> +{
>> +	XE_WARN_ON(ptr);
>> +	kfree(ptr);
>> +}
>> +
>> +static void
>> +xe_eudebug_resources_free(struct xe_eudebug *d)
>> +{
>> +	struct xe_eudebug_resources *res =3D d->res;
>> +	struct xe_eudebug_handle *h;
>> +	unsigned long i, j;
>> +	int err;
>> +
>> +	mutex_lock(&res->lock);
>> +	for (i =3D 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
>> +		struct xe_eudebug_resource *r =3D &res->rt[i];
>> +
>> +		xa_for_each(&r->xa, j, h) {
>> +			struct xe_eudebug_handle *t;
>> +
>> +			err =3D rhashtable_remove_fast(&r->rh,
>> +						     &h->rh_head,
>> +						     rhash_res);
>> +			XE_WARN_ON(err);
>> +			t =3D xa_erase(&r->xa, h->id);
>> +			XE_WARN_ON(t !=3D h);
>> +			kfree(t);
>> +		}
>> +	}
>> +	mutex_unlock(&res->lock);
>> +
>> +	for (i =3D 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
>> +		struct xe_eudebug_resource *r =3D &res->rt[i];
>> +
>> +		rhashtable_free_and_destroy(&r->rh, res_free_fn, NULL);
>> +		XE_WARN_ON(!xa_empty(&r->xa));
>> +		xa_destroy(&r->xa);
>> +	}
>> +
>> +	mutex_destroy(&res->lock);
>> +
>> +	kfree(res);
>> +}
>> +
>> +static void xe_eudebug_free(struct kref *ref)
>> +{
>> +	struct xe_eudebug *d =3D container_of(ref, typeof(*d), ref);
>> +	struct xe_eudebug_event *event;
>> +
>> +	while (kfifo_get(&d->events.fifo, &event))
>> +		kfree(event);
>> +
>> +	xe_eudebug_resources_free(d);
>> +	put_task_struct(d->target_task);
>> +	mutex_destroy(&d->lock);
>> +
>> +	XE_WARN_ON(kfifo_len(&d->events.fifo));
>> +
>> +	kfree_rcu(d, rcu);
>> +}
>> +
>> +static void xe_eudebug_put(struct xe_eudebug *d)
>> +{
>> +	kref_put(&d->ref, xe_eudebug_free);
>> +}
>> +
>> +static bool
>> +xe_eudebug_detached(const struct xe_eudebug * const d)
>> +{
>> +	/* Can only be set so we accept the race */
>> +	return data_race(READ_ONCE(d->closed));
>> +}
>> +
>> +static void xe_eudebug_detach(struct xe_eudebug *d)
>> +{
>> +	struct xe_device *xe =3D d->xe;
>> +
>> +	XE_WARN_ON(!xe_eudebug_detached(d));
>> +
>> +	spin_lock(&xe->eudebug.lock);
>> +	list_del_rcu(&d->connection_link);
>> +	eu_dbg(d, "session %lld detached", d->session);
>> +	spin_unlock(&xe->eudebug.lock);
>> +}
>> +
>> +static void xe_eudebug_disconnect(struct xe_eudebug *d,
>> +				  const int err)
>> +{
>> +	bool detached =3D false;
>> +
>> +	mutex_lock(&d->lock);
>> +	if (!d->closed) {
>> +		d->closed =3D true;
>> +		detached =3D true;
>> +		d->last_error =3D err;
>> +	}
>> +	mutex_unlock(&d->lock);
>> +
>> +	if (detached) {
>> +		xe_eudebug_detach(d);
>> +		eu_dbg(d, "disconnected: %d (%d)", d->last_error, err);
>> +	}
>> +
>> +	wake_up_all(&d->events.write_done);
>> +
>> +	if (detached)
>> +		xe_eudebug_put(d);
>> +}
>> +
>> +static int xe_eudebug_release(struct inode *inode, struct file *file)
>> +{
>> +	struct xe_eudebug *d =3D file->private_data;
>> +
>> +	xe_eudebug_disconnect(d, 0);
>> +	xe_eudebug_put(d);
>> +
>> +	return 0;
>> +}
>> +
>> +static __poll_t xe_eudebug_poll(struct file *file, poll_table *wait)
>> +{
>> +	struct xe_eudebug * const d =3D file->private_data;
>> +	__poll_t ret =3D 0;
>> +
>> +	poll_wait(file, &d->events.write_done, wait);
>> +
>> +	if (xe_eudebug_detached(d)) {
>> +		ret |=3D EPOLLHUP;
>> +		if (d->last_error)
>> +			ret |=3D EPOLLERR;
>> +	}
>> +
>> +	if (event_fifo_num_events_peek(d))
>> +		ret |=3D EPOLLIN;
>> +
>> +	return ret;
>> +}
>> +
>> +static ssize_t xe_eudebug_read(struct file *file,
>> +			       char __user *buf,
>> +			       size_t count,
>> +			       loff_t *ppos)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +static struct xe_eudebug *
>> +xe_eudebug_for_task_get(struct xe_device *xe,
>> +			struct task_struct *task)
>> +{
>> +	struct xe_eudebug *d, *iter;
>> +
>> +	d =3D NULL;
>> +
>> +	rcu_read_lock();
>> +	for_each_debugger_rcu(iter, &xe->eudebug.list) {
>> +		if (!same_thread_group(iter->target_task, task))
>> +			continue;
>> +
>> +		if (kref_get_unless_zero(&iter->ref))
>> +			d =3D iter;
>> +
>> +		break;
>> +	}
>> +	rcu_read_unlock();
>> +
>> +	return d;
>> +}
>> +
>> +static struct task_struct *find_task_get(struct xe_file *xef)
>> +{
>> +	struct task_struct *task;
>> +	struct pid *pid;
>> +
>> +	rcu_read_lock();
>> +	pid =3D rcu_dereference(xef->drm->pid);
>> +	task =3D pid_task(pid, PIDTYPE_PID);
>> +	if (task)
>> +		get_task_struct(task);
>> +	rcu_read_unlock();
>> +
>> +	return task;
>> +}
>> +
>> +static struct xe_eudebug *
>> +xe_eudebug_get(struct xe_file *xef)
>> +{
>> +	struct task_struct *task;
>> +	struct xe_eudebug *d;
>> +
>> +	task =3D find_task_get(xef);
>> +	if (task) {
>> +		d =3D xe_eudebug_for_task_get(to_xe_device(xef->drm->minor->dev),
>> +					    task);
>> +		put_task_struct(task);
>> +	} else {
>> +		d =3D NULL;
>> +	}
>> +
>> +	if (d && xe_eudebug_detached(d)) {
>> +		xe_eudebug_put(d);
>> +		d =3D NULL;
>> +	}
>> +
>> +	return d;
>> +}
>> +
>> +static int queue_event(struct xe_eudebug * const d,
>> +		       struct xe_eudebug_event **event)
>> +{
>> +	if (*event =3D=3D NULL)
>> +		return -EINVAL;
>> +
>> +	/* We just drop quietly on disconnected */
>> +	if (xe_eudebug_detached(d)) {
>> +		wake_up_all(&d->events.write_done);
>> +		kfree(*event);
>> +		*event =3D NULL;
>> +		return 0;
>> +	}
>> +
>> +	if (kfifo_in_spinlocked(&d->events.fifo, event, 1, &d->events.lock)) {
>> +		wake_up_all(&d->events.write_done);
>> +		*event =3D NULL;
>> +		return 0;
>> +	}
>> +
>> +	return -ENOSPC;
>> +}
>> +
>> +static int _xe_eudebug_queue_event(struct xe_eudebug *d,
>> +				   struct xe_eudebug_event *event,
>> +				   gfp_t gfp)
>> +{
>> +	u64 start_t;
>> +	int ret;
>> +
>> +	XE_WARN_ON(event->len <=3D sizeof(struct xe_eudebug_event));
>> +	XE_WARN_ON(!event->type);
>> +	XE_WARN_ON(event->type =3D=3D DRM_XE_EUDEBUG_EVENT_READ);
>> +
>> +	ret =3D queue_event(d, &event);
>> +	if (!ret)
>> +		return 0;
>> +
>> +	start_t =3D ktime_get();
>> +
>> +	while (ret =3D=3D -ENOSPC) {
>> +		struct xe_eudebug_event *blocking;
>> +
>> +		ret =3D queue_event(d, &event);
>> +		if (ret !=3D -ENOSPC)
>> +			break;
>> +
>> +		blocking =3D event_fifo_pending(d);
>> +
>> +		msleep(1 + 1 * event_fifo_num_events_peek(d));
>> +
>> +		/* restart timeout if we see progress on fifo */
>> +		if (blocking && blocking !=3D event_fifo_pending(d))
>> +			start_t =3D ktime_get();
>> +
>> +		if (ktime_ms_delta(ktime_get(), start_t) >=3D
>> +		    XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS)
>> +			ret =3D -ETIMEDOUT;
>> +	}
>> +
>> +	if (ret) {
>> +		eu_warn(d, "event %llu queue failed (blocked %lld ms), disconnecting =
with %d",
>> +			event ? event->seqno : 0,
>> +			ktime_ms_delta(ktime_get(), start_t),
>> +			ret);
>> +		xe_eudebug_disconnect(d, ret);
>> +	}
>> +
>> +	kfree(event);
>> +
>> +	return ret;
>> +}
>> +
>> +static int xe_eudebug_queue_event(struct xe_eudebug *d,
>> +				  struct xe_eudebug_event *event)
>> +{
>> +	return _xe_eudebug_queue_event(d, event, GFP_KERNEL);
>> +}
>> +
>> +static struct xe_eudebug_handle *
>> +alloc_handle(const int type, const void * const key)
>> +{
>> +	struct xe_eudebug_handle *h;
>> +
>> +	h =3D kzalloc(sizeof(*h), GFP_KERNEL);
>> +	if (!h)
>> +		return NULL;
>> +
>> +	h->key =3D (u64)key;
>> +
>> +	return h;
>> +}
>> +
>> +static struct xe_eudebug_handle *
>> +__find_handle(struct xe_eudebug_resource *r,
>> +	      void *key)
>> +{
>> +	struct xe_eudebug_handle *h;
>> +
>> +	h =3D rhashtable_lookup_fast(&r->rh,
>> +				   &key,
>> +				   rhash_res);
>> +	if (h) {
>> +		XE_WARN_ON(!h->id);
>> +		XE_WARN_ON((int)h->id < 0);
>> +		XE_WARN_ON(h !=3D xa_load(&r->xa, h->id));
>> +	}
>> +
>> +	return h;
>> +}
>> +
>> +static int find_handle(struct xe_eudebug_resources *res,
>> +		       const int type,
>> +		       void *key)
>> +{
>> +	struct xe_eudebug_resource *r;
>> +	struct xe_eudebug_handle *h;
>> +	int id;
>> +
>> +	r =3D resource_from_type(res, type);
>> +
>> +	mutex_lock(&res->lock);
>> +	h =3D __find_handle(r, key);
>> +	id =3D h ? h->id : -ENOENT;
>> +	mutex_unlock(&res->lock);
>> +
>> +	return id;
>> +}
>> +
>> +static int xe_eudebug_add_handle(struct xe_eudebug *d,
>> +				 int type,
>> +				 void *p)
>> +{
>> +	struct xe_eudebug_resource *r;
>> +	struct xe_eudebug_handle *h;
>> +	int err;
>> +
>> +	if (xe_eudebug_detached(d))
>> +		return -ENOTCONN;
>> +
>> +	h =3D alloc_handle(type, p);
>> +	if (!h)
>> +		return -ENOMEM;
>> +
>> +	r =3D resource_from_type(d->res, type);
>> +
>> +	mutex_lock(&d->res->lock);
>> +	if (!__find_handle(r, p)) {
>> +		err =3D xa_alloc(&r->xa, &h->id, h, xa_limit_31b, GFP_KERNEL);
>> +
>> +		if (h->id >=3D INT_MAX) {
>> +			xa_erase(&r->xa, h->id);
>> +			err =3D -ENOSPC;
>> +		}
>> +
>> +		if (!err)
>> +			err =3D rhashtable_insert_fast(&r->rh,
>> +						     &h->rh_head,
>> +						     rhash_res);
>> +
>> +		if (err)
>> +			xa_erase(&r->xa, h->id);
>> +	} else {
>> +		err =3D -EEXIST;
>> +	}
>> +	mutex_unlock(&d->res->lock);
>> +
>> +	if (err) {
>> +		kfree(h);
>> +		XE_WARN_ON(err > 0);
>> +		return err;
>> +	}
>> +
>> +	XE_WARN_ON(h->id =3D=3D 0);
>> +
>> +	return h->id;
>> +}
>> +
>> +static long xe_eudebug_remove_handle(struct xe_eudebug *d, int type, vo=
id *p)
>> +{
>> +	struct xe_eudebug_resource *r;
>> +	struct xe_eudebug_handle *h, *xa_h;
>> +	long ret;
>> +
>> +	if (xe_eudebug_detached(d))
>> +		return -ENOTCONN;
>> +
>> +	r =3D resource_from_type(d->res, type);
>> +
>> +	mutex_lock(&d->res->lock);
>> +	h =3D __find_handle(r, p);
>> +	if (h) {
>> +		ret =3D rhashtable_remove_fast(&r->rh,
>> +					     &h->rh_head,
>> +					     rhash_res);
>> +		xa_h =3D xa_erase(&r->xa, h->id);
>> +		XE_WARN_ON(ret);
>> +		XE_WARN_ON(xa_h !=3D h);
>> +		if (!ret)
>> +			ret =3D h->id;
>> +	} else {
>> +		ret =3D -ENOENT;
>> +	}
>> +	mutex_unlock(&d->res->lock);
>> +
>> +	kfree(h);
>> +
>> +	XE_WARN_ON(!ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static struct xe_eudebug_event *
>> +xe_eudebug_create_event(struct xe_eudebug *d,
>> +			u16 type, u16 flags, u32 len, gfp_t gfp)
>> +{
>> +	struct xe_eudebug_event *event;
>> +
>> +	XE_WARN_ON(len <=3D sizeof(*event));
>> +
>> +	event =3D kzalloc(len, gfp);
>> +	if (!event)
>> +		return NULL;
>> +
>> +	event->type =3D type;
>> +	event->flags =3D flags;
>> +	event->len =3D len;
>> +	event->seqno =3D atomic_long_inc_return(&d->events.seqno);
>> +
>> +	return event;
>> +}
>> +
>> +static long xe_eudebug_read_event(struct xe_eudebug *d,
>> +				  const u64 arg,
>> +				  const bool wait)
>> +{
>> +	struct drm_xe_eudebug_event __user * const user_orig =3D
>> +		u64_to_user_ptr(arg);
>> +	struct drm_xe_eudebug_event user_event;
>> +	struct xe_eudebug_event *event;
>> +	long ret;
>> +
>> +	if (copy_from_user(&user_event, user_orig, sizeof(user_event)))
>> +		return -EFAULT;
>> +
>> +	if (!user_event.type)
>> +		return -EINVAL;
>> +
>> +	if (user_event.type > DRM_XE_EUDEBUG_EVENT_MAX_EVENT)
>> +		return -EINVAL;
>> +
>> +	if (user_event.type !=3D DRM_XE_EUDEBUG_EVENT_READ)
>> +		return -EINVAL;
>> +
>> +	if (user_event.len < sizeof(*user_orig))
>> +		return -EINVAL;
>> +
>> +	if (user_event.flags)
>> +		return -EINVAL;
>> +
>> +	if (user_event.reserved)
>> +		return -EINVAL;
>> +
>> +	if (wait)
>> +		ret =3D wait_event_interruptible_timeout(d->events.write_done,
>> +						       event_fifo_num_events_peek(d),
>> +						       msecs_to_jiffies(10*10000));
>> +	else
>> +		ret =3D 0;
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	spin_lock(&d->events.lock);
>> +	event =3D event_fifo_pending(d);
>> +	if (event) {
>> +		if (user_event.len < event->len) {
>> +			ret =3D -EMSGSIZE;
>> +		} else if (!kfifo_get(&d->events.fifo, &event)) {
>> +			eu_warn(d, "internal fifo corruption");
>> +			ret =3D -ENOTCONN;
>> +		} else {
>> +			ret =3D 0;
>> +		}
>> +	} else {
>> +		ret =3D -ENOENT;
>> +	}
>> +	spin_unlock(&d->events.lock);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (copy_to_user(user_orig, event, event->len))
>> +		ret =3D -EFAULT;
>> +
>> +	kfree(event);
>> +
>> +	return ret;
>> +}
>> +
>> +static long xe_eudebug_ioctl(struct file *file,
>> +			     unsigned int cmd,
>> +			     unsigned long arg)
>> +{
>> +	struct xe_eudebug * const d =3D file->private_data;
>> +	long ret;
>> +
>> +	switch (cmd) {
>> +	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
>> +		ret =3D xe_eudebug_read_event(d, arg,
>> +					    !(file->f_flags & O_NONBLOCK));
>> +		eu_dbg(d, "ioctl cmd=3DREAD_EVENT ret=3D%ld\n", ret);
>> +		break;
>> +
>> +	default:
>> +		ret =3D -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct file_operations fops =3D {
>> +	.owner		=3D THIS_MODULE,
>> +	.llseek		=3D no_llseek,
>> +	.release	=3D xe_eudebug_release,
>> +	.poll		=3D xe_eudebug_poll,
>> +	.read		=3D xe_eudebug_read,
>> +	.unlocked_ioctl	=3D xe_eudebug_ioctl,
>> +};
>> +
>> +static struct task_struct *find_get_target(const pid_t nr)
>> +{
>> +	struct task_struct *task;
>> +
>> +	rcu_read_lock();
>> +	task =3D pid_task(find_pid_ns(nr, task_active_pid_ns(current)), PIDTYP=
E_PID);
>> +	if (task)
>> +		get_task_struct(task);
>> +	rcu_read_unlock();
>> +
>> +	return task;
>> +}
>> +
>> +
>> +static int
>> +xe_eudebug_connect(struct xe_device *xe,
>> +		   struct drm_xe_eudebug_connect *param)
>> +{
>> +	const u64 known_open_flags =3D 0;
>> +	struct xe_eudebug *d, *t =3D NULL;
>> +	unsigned long f_flags =3D 0;
>> +	int fd;
>> +	int err;
>> +
>> +	if (param->extensions)
>> +		return -EINVAL;
>> +
>> +	if (!param->pid)
>> +		return -EINVAL;
>> +
>> +	if (param->flags & ~known_open_flags)
>> +		return -EINVAL;
>> +
>> +	if (param->version && param->version !=3D DRM_XE_EUDEBUG_VERSION)
>> +		return -EINVAL;
>> +
>> +	param->version =3D DRM_XE_EUDEBUG_VERSION;
>> +
>> +	if (!xe->eudebug.available)
>> +		return -EOPNOTSUPP;
>> +
>> +	d =3D kzalloc(sizeof(*d), GFP_KERNEL);
>> +	if (!d)
>> +		return -ENOMEM;
>> +
>> +	kref_init(&d->ref);
>> +	mutex_init(&d->lock);
>> +	init_waitqueue_head(&d->events.write_done);
>> +
>> +	spin_lock_init(&d->events.lock);
>> +	INIT_KFIFO(d->events.fifo);
>> +
>> +	d->res =3D xe_eudebug_resources_alloc();
>> +	if (IS_ERR(d->res)) {
>> +		err =3D PTR_ERR(d->res);
>> +		goto err_free;
>> +	}
>> +
>> +	d->target_task =3D find_get_target(param->pid);
>> +	if (!d->target_task) {
>> +		err =3D -ENOENT;
>> +		goto err_free_res;
>> +	}
>> +
>> +	/* XXX: Proper access tracking with ptrace_may_access */
>> +	if (!capable(CAP_SYS_ADMIN)) {
>> +		err =3D -EACCES;
>> +		goto err_put_task;
>> +	}
>> +
>> +	t =3D xe_eudebug_for_task_get(xe, d->target_task);
>> +	if (t) {
>> +		err =3D -EBUSY;
>> +		goto err_put_task;
>> +	}
>> +
>> +	d->xe =3D xe;
>> +
>> +	fd =3D anon_inode_getfd("[xe_eudebug]", &fops, d, f_flags);
>> +	if (fd < 0) {
>> +		err =3D fd;
>> +		goto err_put_task;
>> +	}
>> +
>> +	spin_lock(&xe->eudebug.lock);
>> +	/* XXX handle the overflow without bailing out */
>> +	if (xe->eudebug.session_count + 1 =3D=3D 0) {
>> +		spin_unlock(&xe->eudebug.lock);
>> +		drm_err(&xe->drm, "debugger connections exhausted. (you need module r=
eload)\n");
>> +		err =3D -EBUSY;
>> +		goto err_put_task;
>> +	}
>> +
>> +	d->session =3D ++xe->eudebug.session_count;
>> +	kref_get(&d->ref);
>> +	list_add_tail_rcu(&d->connection_link, &xe->eudebug.list);
>> +	spin_unlock(&xe->eudebug.lock);
>> +
>> +	eu_dbg(d, "connected session %lld", d->session);
>> +
>> +	return fd;
>> +
>> +err_put_task:
>> +	if (t)
>> +		xe_eudebug_put(t);
>> +
>> +	put_task_struct(d->target_task);
>> +err_free_res:
>> +	xe_eudebug_resources_free(d);
>> +err_free:
>> +	kfree(d);
>> +
>> +	return err;
>> +}
>> +
>> +int xe_eudebug_connect_ioctl(struct drm_device *dev,
>> +			     void *data,
>> +			     struct drm_file *file)
>> +{
>> +	struct xe_device *xe =3D to_xe_device(dev);
>> +	struct drm_xe_eudebug_connect * const param =3D data;
>> +	int ret =3D 0;
>> +
>> +	ret =3D xe_eudebug_connect(xe, param);
>> +
>> +	return ret;
>> +}
>> +
>> +void xe_eudebug_init(struct xe_device *xe)
>> +{
>> +	int ret;
>> +
>> +	spin_lock_init(&xe->eudebug.lock);
>> +	INIT_LIST_HEAD(&xe->eudebug.list);
>> +	xa_init_flags(&xe->clients.xa, XA_FLAGS_ALLOC1);
>> +
>> +	ret =3D drmm_mutex_init(&xe->drm, &xe->clients.lock);
>> +	if (ret)
>> +		drm_warn(&xe->drm,
>> +			 "eudebug init failed: %d, debugger unavailable\n",
>> +			 ret);
>> +
>> +	xe->eudebug.available =3D ret =3D=3D 0;
>> +}
>> +
>> +void xe_eudebug_fini(struct xe_device *xe)
>> +{
>> +	XE_WARN_ON(!list_empty_careful(&xe->eudebug.list));
>> +	mutex_destroy(&xe->clients.lock);
>> +}
>> +
>> +static int send_open_event(struct xe_eudebug *d, u32 flags, const u64 h=
andle)
>> +{
>> +	struct xe_eudebug_event *event;
>> +	struct xe_eudebug_event_open *eo;
>> +
>> +	if (!handle)
>> +		return -EINVAL;
>> +
>> +	if (XE_WARN_ON((long)handle >=3D INT_MAX))
>> +		return -EINVAL;
>> +
>> +	event =3D xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_OPEN,
>> +					flags, sizeof(*eo), GFP_KERNEL);
>> +	if (!event)
>> +		return -ENOMEM;
>> +
>> +	eo =3D from_event(eo, event);
>> +
>> +	write_member(struct drm_xe_eudebug_event_client, eo,
>> +		     client_handle, handle);
>> +
>> +	return xe_eudebug_queue_event(d, event);
>> +}
>> +
>> +static int client_create_event(struct xe_eudebug *d, struct xe_file *xe=
f)
>> +{
>> +	int ret;
>> +
>> +	ret =3D xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
>> +
>> +	if (ret > 0)
>> +		ret =3D send_open_event(d, DRM_XE_EUDEBUG_EVENT_CREATE, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int client_destroy_event(struct xe_eudebug *d, struct xe_file *x=
ef)
>> +{
>> +	int ret;
>> +
>> +	ret =3D xe_eudebug_remove_handle(d, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
>> +	if (ret > 0)
>> +		ret =3D send_open_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +void xe_eudebug_file_open(struct xe_file *xef)
>> +{
>> +	struct xe_eudebug *d;
>> +	int err;
>> +
>> +	d =3D xe_eudebug_get(xef);
>> +	if (!d)
>> +		return;
>> +
>> +	err =3D client_create_event(d, xef);
>> +	if (err =3D=3D -EEXIST)
>> +		err =3D 0;
>> +
>> +	if (err) {
>> +		eu_err(d, "error %d on eudebug_file_open, disconnecting", err);
>> +		xe_eudebug_disconnect(d, err);
>> +	}
>> +
>> +	xe_eudebug_put(d);
>> +}
>> +
>> +void xe_eudebug_file_close(struct xe_file *xef)
>> +{
>> +	struct xe_eudebug *d;
>> +	int err;
>> +
>> +	d =3D xe_eudebug_get(xef);
>> +	if (!d)
>> +		return;
>> +
>> +	err =3D client_destroy_event(d, xef);
>> +	if (err) {
>> +		eu_err(d, "error %d on eudebug_file_close, disconnecting", err);
>> +		xe_eudebug_disconnect(d, err);
>> +	}
>> +
>> +	xe_eudebug_put(d);
>> +}
>> +
>> +static int send_vm_event(struct xe_eudebug *d, u32 flags,
>> +			 const u64 client_handle,
>> +			 const u64 vm_handle)
>> +{
>> +	struct xe_eudebug_event *event;
>> +	struct xe_eudebug_event_vm *e;
>> +
>> +	event =3D xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM,
>> +					flags, sizeof(*e), GFP_KERNEL);
>> +	if (!event)
>> +		return -ENOMEM;
>> +
>> +	e =3D from_event(e, event);
>> +
>> +	write_member(struct drm_xe_eudebug_event_vm, e, client_handle, client_=
handle);
>> +	write_member(struct drm_xe_eudebug_event_vm, e, vm_handle, vm_handle);
>> +
>> +	return xe_eudebug_queue_event(d, event);
>> +}
>> +
>> +static int vm_create_event(struct xe_eudebug *d,
>> +			   struct xe_file *xef, struct xe_vm *vm)
>> +{
>> +	int h_c, h_vm;
>> +
>> +	h_c =3D find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
>> +	if (h_c < 0)
>> +		return h_c;
>> +
>> +	h_vm =3D xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm);
>> +	if (h_vm < 0)
>> +		return h_vm;
>> +
>> +	XE_WARN_ON(!h_c);
>> +	XE_WARN_ON(!h_vm);
>> +
>> +	return send_vm_event(d, DRM_XE_EUDEBUG_EVENT_CREATE, h_c, h_vm);
>> +}
>> +
>> +static int vm_destroy_event(struct xe_eudebug *d,
>> +			    struct xe_file *xef, struct xe_vm *vm)
>> +{
>> +	int h_c, h_vm;
>> +
>> +	h_c =3D find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
>> +	if (h_c < 0) {
>> +		XE_WARN_ON("no client found for vm");
>> +		eu_warn(d, "no client found for vm");
>> +		return h_c;
>> +	}
>> +
>> +	h_vm =3D xe_eudebug_remove_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm);
>> +	if (h_vm < 0)
>> +		return h_vm;
>> +
>> +	XE_WARN_ON(!h_c);
>> +	XE_WARN_ON(!h_vm);
>> +
>> +	return send_vm_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY, h_c, h_vm);
>> +}
>> +
>> +void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm)
>> +{
>> +	struct xe_eudebug *d;
>> +	int err;
>> +
>> +	d =3D xe_eudebug_get(xef);
>> +	if (!d)
>> +		return;
>> +
>> +	err =3D vm_create_event(d, xef, vm);
>> +	if (err =3D=3D -EEXIST || err =3D=3D -ENOTCONN)
>> +		err =3D 0;
>> +
>> +	if (err) {
>> +		eu_err(d, "error %d on eudebug_vm_create, disconnecting", err);
>> +		xe_eudebug_disconnect(d, err);
>> +	}
>> +
>> +	xe_eudebug_put(d);
>> +}
>> +
>> +void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
>> +{
>> +	struct xe_eudebug *d;
>> +	int err;
>> +
>> +	d =3D xe_eudebug_get(xef);
>> +	if (!d)
>> +		return;
>> +
>> +	err =3D vm_destroy_event(d, xef, vm);
>> +	if (err =3D=3D -ENOTCONN)
>> +		err =3D 0;
>> +
>> +	if (err) {
>> +		eu_err(d, "error %d on eudebug_vm_destroy, disconnecting", err);
>> +		xe_eudebug_disconnect(d, err);
>> +	}
>> +
>> +	xe_eudebug_put(d);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eud=
ebug.h
>> new file mode 100644
>> index 000000000000..df577b581364
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_eudebug.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright =C2=A9 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_EUDEBUG_H_
>> +
>> +struct drm_device;
>> +struct drm_file;
>> +struct xe_device;
>> +struct xe_file;
>> +struct xe_vm;
>> +
>> +int xe_eudebug_connect_ioctl(struct drm_device *dev,
>> +			     void *data,
>> +			     struct drm_file *file);
>> +
>> +void xe_eudebug_init(struct xe_device *xe);
>> +void xe_eudebug_fini(struct xe_device *xe);
>> +
>> +void xe_eudebug_file_open(struct xe_file *xef);
>> +void xe_eudebug_file_close(struct xe_file *xef);
>> +
>> +void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm);
>> +void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/=
xe_eudebug_types.h
>> new file mode 100644
>> index 000000000000..9a6f62872ec3
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
>> @@ -0,0 +1,166 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright =C2=A9 2023 Intel Corporation
>> + */
>> +
>> +#ifndef __XE_EUDEBUG_TYPES_H_
>> +
>> +#include <linux/mutex.h>
>> +#include <linux/kref.h>
>> +#include <linux/kfifo.h>
>> +#include <linux/completion.h>
>> +#include <linux/wait.h>
>> +#include <linux/xarray.h>
>> +#include <linux/rbtree.h>
>> +#include <linux/rhashtable.h>
>> +
>> +#include <uapi/drm/xe_drm.h>
>> +
>> +struct xe_device;
>> +struct task_struct;
>> +struct xe_eudebug_event;
>> +
>> +#define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 32
>> +
>> +/**
>> + * struct xe_eudebug_event - Internal base event struct for eudebug
>> + */
>> +struct xe_eudebug_event {
>> +	/** @len: length of this event, including payload */
>> +	u32 len;
>> +
>> +	/** @type: message type */
>> +	u16 type;
>> +
>> +	/** @flags: message flags */
>> +	u16 flags;
>> +
>> +	/** @seqno: sequence number for ordering */
>> +	u64 seqno;
>> +
>> +	/** @reserved: reserved field MBZ */
>> +	u64 reserved;
>> +
>> +	/** @data: payload bytes */
>> +	u8 data[];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_eudebug_event_open - Internal event for client open/close
>> + */
>> +struct xe_eudebug_event_open {
>> +	/** @base: base event */
>> +	struct xe_eudebug_event base;
>> +
>> +	/** @client_handle: opaque handle for client */
>> +	u64 client_handle;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_eudebug_event_vm - Internal event for vm open/close
>> + */
>> +struct xe_eudebug_event_vm {
>> +	/** @base: base event */
>> +	struct xe_eudebug_event base;
>> +
>> +	/** @client_handle: client containing the vm open/close */
>> +	u64 client_handle;
>> +
>> +	/** @vm_handle: vm handle it's open/close */
>> +	u64 vm_handle;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_eudebug_handle - eudebug resource handle
>> + */
>> +struct xe_eudebug_handle {
>> +	/** @key: key value in rhashtable <key:id> */
>> +	u64 key;
>> +
>> +	/** @id: opaque handle id for xarray <id:key> */
>> +	int id;
>> +
>> +	/** @rh_head: rhashtable head */
>> +	struct rhash_head rh_head;
>> +};
>> +
>> +/**
>> + * struct xe_eudebug_resource - Resource map for one resource
>> + */
>> +struct xe_eudebug_resource {
>> +	/** @xa: xarrays for <id->key> */
>> +	struct xarray xa;
>> +
>> +	/** @rh rhashtable for <key->id> */
>> +	struct rhashtable rh;
>> +};
>> +
>> +#define XE_EUDEBUG_RES_TYPE_CLIENT 0
>> +#define XE_EUDEBUG_RES_TYPE_VM     1
>> +#define XE_EUDEBUG_RES_TYPE_COUNT  (XE_EUDEBUG_RES_TYPE_VM + 1)
>> +
>> +/**
>> + * struct xe_eudebug_resources - eudebug resources for all types
>> + */
>> +struct xe_eudebug_resources {
>> +	/** @lock: guards access into rt */
>> +	struct mutex lock;
>> +
>> +	/** @rt: resource maps for all types */
>> +	struct xe_eudebug_resource rt[XE_EUDEBUG_RES_TYPE_COUNT];
>> +};
>> +
>> +/**
>> + * struct xe_eudebug - Top level struct for eudebug: the connection
>> + */
>> +struct xe_eudebug {
>> +	/** @ref: kref counter for this struct */
>> +	struct kref ref;
>> +
>> +	/** @rcu: rcu_head for rcu destruction */
>> +	struct rcu_head rcu;
>> +
>> +	/** @connection_link: our link into the xe_device:eudebug.list */
>> +	struct list_head connection_link;
>> +
>> +	/** @lock: guards access to last_error */
>> +	struct mutex lock;
>> +
>> +	/** @last_error: the error that resulted in disconnect */
>> +	int last_error;
>> +
>> +	/** @xe: the parent device we are serving */
>> +	struct xe_device *xe;
>> +
>> +	/** @closed: if debug connection is closed (one way) */
>> +	bool closed;
>> +
>> +	/** @target_task: the task that we are debugging */
>> +	struct task_struct *target_task;
>> +
>> +	/** @res: the resource maps we track for target_task */
>> +	struct xe_eudebug_resources *res;
>> +
>> +	/** @session: session number for this connection (for logs) */
>> +	u64 session;
>> +
>> +	/** @events: kfifo queue of to-be-delivered events */
>> +	struct {
>> +		/** @lock: guards access to fifo */
>> +		spinlock_t lock;
>> +
>> +		/** @fifo: queue of events pending */
>> +		DECLARE_KFIFO(fifo,
>> +			      struct xe_eudebug_event *,
>> +			      CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE);
>> +
>> +		/** @write_done: waitqueue for signalling write to fifo */
>> +		wait_queue_head_t write_done;
>> +
>> +		/** @event_seqno: seqno counter to stamp events for fifo */
>> +		atomic_long_t seqno;
>> +	} events;
>> +
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d26c90f0d702..b333910042b2 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -34,6 +34,7 @@
>>  #include "xe_trace.h"
>>  #include "generated/xe_wa_oob.h"
>>  #include "xe_wa.h"
>> +#include "xe_eudebug.h"
>>=20=20
>>  #define TEST_VM_ASYNC_OPS_ERROR
>>=20=20
>> @@ -2017,6 +2018,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, voi=
d *data,
>>  	args->reserved[0] =3D xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE=
);
>>  #endif
>>=20=20
>> +	xe_eudebug_vm_create(xef, vm);
>> +
>>  	return 0;
>>  }
>>=20=20
>> @@ -2043,8 +2046,10 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, v=
oid *data,
>>  		xa_erase(&xef->vm.xa, args->vm_id);
>>  	mutex_unlock(&xef->vm.lock);
>>=20=20
>> -	if (!err)
>> +	if (!err) {
>> +		xe_eudebug_vm_destroy(xef, vm);
>>  		xe_vm_close_and_put(vm);
>> +	}
>>=20=20
>>  	return err;
>>  }
>> diff --git a/include/uapi/drm/xe_drm_tmp.h b/include/uapi/drm/xe_drm_tmp=
.h
>> new file mode 100644
>> index 000000000000..1ab9e67b6f94
>> --- /dev/null
>> +++ b/include/uapi/drm/xe_drm_tmp.h
>> @@ -0,0 +1,78 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright =C2=A9 2023 Intel Corporation
>> + */
>> +#ifndef _UAPI_XE_DRM_TMP_H_
>> +#define _UAPI_XE_DRM_TMP_H_
>> +
>> +#include "xe_drm.h"
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
>> +
>> +#define DRM_XE_EUDEBUG_CONNECT			0x5f
>> +
>> +#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_X=
E_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)
>> +
>> +/**
>> + * Do a eudebug event read for a debugger connection.
>> + *
>> + * This ioctl is available in debug version 1.
>> + */
>> +#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT _IO('j', 0x0)
>> +
>> +/* XXX: Document events to match their internal counterparts when moved=
 to xe_drm.h */
>> +struct drm_xe_eudebug_event {
>> +	__u32 len;
>> +
>> +	__u16 type;
>> +#define DRM_XE_EUDEBUG_EVENT_NONE     0
>> +#define DRM_XE_EUDEBUG_EVENT_READ     1
>> +#define DRM_XE_EUDEBUG_EVENT_OPEN     2
>> +#define DRM_XE_EUDEBUG_EVENT_VM	      3
>> +#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT DRM_XE_EUDEBUG_EVENT_VM
>> +
>> +	__u16 flags;
>> +#define DRM_XE_EUDEBUG_EVENT_CREATE	(1 << 0)
>> +#define DRM_XE_EUDEBUG_EVENT_DESTROY	(1 << 1)
>> +
>> +	__u64 seqno;
>> +	__u64 reserved;
>> +} __attribute__((packed));
>> +
>> +struct drm_xe_eudebug_event_client {
>> +	struct drm_xe_eudebug_event base;
>> +
>> +	__u64 client_handle; /* This is unique per debug connection */
>> +} __attribute__((packed));
>> +
>> +struct drm_xe_eudebug_event_vm {
>> +	struct drm_xe_eudebug_event base;
>> +
>> +	__u64 client_handle;
>> +	__u64 vm_handle;
>> +} __attribute__((packed));
>> +
>> +/*
>> + * Debugger ABI (ioctl and events) Version History:
>> + * 0 - No debugger available
>> + * 1 - Initial version
>> + */
>> +#define DRM_XE_EUDEBUG_VERSION 1
>> +
>> +struct drm_xe_eudebug_connect {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	__u64 pid; /* input: Target process ID */
>> +	__u32 flags; /* MBZ */
>> +
>> +	__u32 version; /* output: current ABI (ioctl / events) version */
>> +};
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif /* _UAPI_XE_DRM_TMP_H_ */
>> --=20
>> 2.34.1
>>=20
>
> --=20
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
