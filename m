Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BF3C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 14:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A86310E073;
	Tue, 30 Jul 2024 14:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AP57awns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A46910E073
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722349299; x=1753885299;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=TvluLMvTrJ+u334NnCJQH8657sYUmV3uk/tHTbi4/AI=;
 b=AP57awnslD6dyCPQ0ebDmRzVdtARVuTXW5ewkM7p0dEaAJV3cieXmDdC
 tAswBf1LlFFjjwCtuMXI4PgxXT19cTekhBKWPTJrB0YMzW4iE2ch/yxxQ
 4N2axKMvhbPnB9H6m9XwJXtsNQEb8+MJPscqZX8mTYYgEPMueaZKGU8wZ
 RFPgRhCmBYhxfFtqDM1J58T1qvsIzFSn3I8HBSBP7nTvl/3hOs4gVkXAV
 z6A4jyBnXgo48xTqSHskYltqZHHWibQALo9UC5oTd1pF9HJfig1iXRnVM
 Bl8onK3hPGYauuctDGdjh8MS4zjiE9tGZhM9ZM+DP3s7etCQVv0P0ICIH Q==;
X-CSE-ConnectionGUID: r6bM+/d9R5OCSJJSQkfPqg==
X-CSE-MsgGUID: /m2VWswiQM2C1Kbec9B+fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20008625"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20008625"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 07:21:38 -0700
X-CSE-ConnectionGUID: 27g4fFurRd6sT/QC47vSQQ==
X-CSE-MsgGUID: 0KGAY4YZRPSx6KbQ/E2PfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59203816"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 07:21:35 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 03/21] drm/xe/eudebug: Introduce eudebug support
In-Reply-To: <ZqP24ijtGBw2Gud2@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-4-mika.kuoppala@linux.intel.com>
 <ZqP24ijtGBw2Gud2@DUT025-TGLU.fm.intel.com>
Date: Tue, 30 Jul 2024 17:12:42 +0300
Message-ID: <87mslzt1d1.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Matthew Brost <matthew.brost@intel.com> writes:

> On Fri, Jul 26, 2024 at 05:08:00PM +0300, Mika Kuoppala wrote:
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
>
> Not a full review just an idea. Do you think it would be worthwhile to
> add a Kconfig option to enable EU debug support so if we don't care
> about EU debug it compiles out?
>

It is possible and it was done like this in i915. Test triage space will
grow. On the other hand, we can isolate on hunting issues.

> The layering would have to be fixed up to make this sane (e.g. all
> common Xe code calls into the EU layer so we don't have 'if
> IS_ENABLED(CONFIG_EU_DEBUG)' sprinkled all over the place. Fixing up
> layering probably isn't bad idea anyways and as common Xe code really
> shouldn't open code EU debug specific things anyways. This would enforce
> good layering too.

Agreed that it would enforce better layering. Naturally we cant reach
100% here as there are some ioctl argument and null checks sprinkled.
But perfect is enemy is good. We will push more into the xe_eudebug_*
files and lets see how it look. Kconfig is trivial and icing on the
cake after this.

-Mika

> Matt
>
>> v2: - event printer removed (Maarten)
>>     - trim down kfifo accessors (Maarten)
>>     - xa_alloc spurious locking removed (Maarten)
>> v3: - use list for clients (Matt)
>> v4: - avoid reporting clients too early (Maciej, VLK-56889)
>> v5: - return from wait if disconnect (Mika)
>> v6: - read waitqueue (Mika)
>> v7: - ENOTCONN early in read_event (Mika)
>> v8: - consolidate resource error handling (Mika, Maciej)
>> v9: - ptrace access check (Jonathan)
>> v10: - detach error handling (Dominik)
>>=20
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>=20
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile           |    3 +-
>>  drivers/gpu/drm/xe/xe_device.c        |   24 +
>>  drivers/gpu/drm/xe/xe_device_types.h  |   26 +
>>  drivers/gpu/drm/xe/xe_eudebug.c       | 1093 +++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_eudebug.h       |   27 +
>>  drivers/gpu/drm/xe/xe_eudebug_types.h |  169 ++++
>>  drivers/gpu/drm/xe/xe_vm.c            |    7 +-
>>  include/uapi/drm/xe_drm.h             |   21 +
>>  include/uapi/drm/xe_drm_eudebug.h     |   57 ++
>>  9 files changed, 1425 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
>>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
>>  create mode 100644 include/uapi/drm/xe_drm_eudebug.h
>>=20
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1ff9602a52f6..06badc5f99af 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -114,7 +114,8 @@ xe-y +=3D xe_bb.o \
>>  	xe_vram_freq.o \
>>  	xe_wait_user_fence.o \
>>  	xe_wa.o \
>> -	xe_wopcm.o
>> +	xe_wopcm.o \
>> +	xe_eudebug.o
>>=20=20
>>  xe-$(CONFIG_HMM_MIRROR) +=3D xe_hmm.o
>>=20=20
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devi=
ce.c
>> index 1aba6f9eaa19..6c5eceaca4ab 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -54,6 +54,7 @@
>>  #include "xe_vm.h"
>>  #include "xe_vram.h"
>>  #include "xe_wait_user_fence.h"
>> +#include "xe_eudebug.h"
>>  #include "xe_wa.h"
>>=20=20
>>  #include <generated/xe_wa_oob.h>
>> @@ -100,6 +101,14 @@ static int xe_file_open(struct drm_device *dev, str=
uct drm_file *file)
>>  		put_task_struct(task);
>>  	}
>>=20=20
>> +	INIT_LIST_HEAD(&xef->link);
>> +
>> +	mutex_lock(&xe->files.lock);
>> +	list_add_tail(&xef->link, &xe->files.list);
>> +	mutex_unlock(&xe->files.lock);
>> +
>> +	xe_eudebug_file_open(xef);
>> +
>>  	return 0;
>>  }
>>=20=20
>> @@ -158,6 +167,12 @@ static void xe_file_close(struct drm_device *dev, s=
truct drm_file *file)
>>=20=20
>>  	xe_pm_runtime_get(xe);
>>=20=20
>> +	xe_eudebug_file_close(xef);
>> +
>> +	mutex_lock(&xef->xe->files.lock);
>> +	list_del_init(&xef->link);
>> +	mutex_unlock(&xef->xe->files.lock);
>> +
>>  	/*
>>  	 * No need for exec_queue.lock here as there is no contention for it
>>  	 * when FD is closing as IOCTLs presumably can't be modifying the
>> @@ -196,6 +211,7 @@ static const struct drm_ioctl_desc xe_ioctls[] =3D {
>>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>>  			  DRM_RENDER_ALLOW),
>>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALL=
OW),
>> +	DRM_IOCTL_DEF_DRV(XE_EUDEBUG_CONNECT, xe_eudebug_connect_ioctl, DRM_RE=
NDER_ALLOW),
>>  };
>>=20=20
>>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned =
long arg)
>> @@ -285,6 +301,8 @@ static void xe_device_destroy(struct drm_device *dev=
, void *dummy)
>>  {
>>  	struct xe_device *xe =3D to_xe_device(dev);
>>=20=20
>> +	xe_eudebug_fini(xe);
>> +
>>  	if (xe->preempt_fence_wq)
>>  		destroy_workqueue(xe->preempt_fence_wq);
>>=20=20
>> @@ -330,6 +348,9 @@ struct xe_device *xe_device_create(struct pci_dev *p=
dev,
>>  	spin_lock_init(&xe->irq.lock);
>>  	spin_lock_init(&xe->clients.lock);
>>=20=20
>> +	drmm_mutex_init(&xe->drm, &xe->files.lock);
>> +	INIT_LIST_HEAD(&xe->files.list);
>> +
>>  	init_waitqueue_head(&xe->ufence_wq);
>>=20=20
>>  	err =3D drmm_mutex_init(&xe->drm, &xe->usm.lock);
>> @@ -356,7 +377,10 @@ struct xe_device *xe_device_create(struct pci_dev *=
pdev,
>>  	INIT_LIST_HEAD(&xe->pinned.external_vram);
>>  	INIT_LIST_HEAD(&xe->pinned.evicted);
>>=20=20
>> +	xe_eudebug_init(xe);
>> +
>>  	xe->preempt_fence_wq =3D alloc_ordered_workqueue("xe-preempt-fence-wq"=
, 0);
>> +
>>  	xe->ordered_wq =3D alloc_ordered_workqueue("xe-ordered-wq", 0);
>>  	xe->unordered_wq =3D alloc_workqueue("xe-unordered-wq", 0, 0);
>>  	if (!xe->ordered_wq || !xe->unordered_wq ||
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/x=
e_device_types.h
>> index 5b7292a9a66d..bef7c11bd668 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -355,6 +355,15 @@ struct xe_device {
>>  		u64 count;
>>  	} clients;
>>=20=20
>> +	/** @files: xe_file list (opens) */
>> +	struct {
>> +		/** @lock: Protects xe_file list */
>> +		struct mutex lock;
>> +
>> +		/** @list: xe file list */
>> +		struct list_head list;
>> +	} files;
>> +
>>  	/** @usm: unified memory state */
>>  	struct {
>>  		/** @usm.asid: convert a ASID to VM */
>> @@ -492,6 +501,20 @@ struct xe_device {
>>  	u8 vm_inject_error_position;
>>  #endif
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
>>  	/* private: */
>>=20=20
>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> @@ -596,6 +619,9 @@ struct xe_file {
>>=20=20
>>  	/** @refcount: ref count of this xe file */
>>  	struct kref refcount;
>> +
>> +	/** @link: link into xe_device.client.list */
>> +	struct list_head link;
>>  };
>>=20=20
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eud=
ebug.c
>> new file mode 100644
>> index 000000000000..8aab02824f8a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
>> @@ -0,0 +1,1093 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright =C2=A9 2023 Intel Corporation
>> + */
>> +
>> +#include <linux/uaccess.h>
>> +
>> +#include <linux/anon_inodes.h>
>> +#include <linux/poll.h>
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_managed.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_assert.h"
>> +#include "xe_macros.h"
>> +
>> +#include "xe_eudebug_types.h"
>> +#include "xe_eudebug.h"
>> +
>> +/*
>> + * If there is no detected event read by userspace, during this period,=
 assume
>> + * userspace problem and disconnect debugger to allow forward progress.
>> + */
>> +#define XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS (25 * 1000)
>> +
>> +#define for_each_debugger_rcu(debugger, head) \
>> +	list_for_each_entry_rcu((debugger), (head), connection_link)
>> +#define for_each_debugger(debugger, head) \
>> +	list_for_each_entry((debugger), (head), connection_link)
>> +
>> +#define cast_event(T, event) container_of((event), typeof(*(T)), base)
>> +
>> +#define XE_EUDEBUG_DBG_STR "eudbg: %lld:%lu:%s (%d/%d) -> (%d/%d): "
>> +#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
>> +		atomic_long_read(&(d)->events.seqno), \
>> +		READ_ONCE(d->connection.status) <=3D 0 ? "disconnected" : "", \
>> +		current->pid, \
>> +		task_tgid_nr(current), \
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
>> +#define xe_eudebug_assert(d, ...) xe_assert((d)->xe, ##__VA_ARGS__)
>> +
>> +#define struct_member(T, member) (((T *)0)->member)
>> +
>> +/* Keep 1:1 parity with uapi events */
>> +#define write_member(T_out, ptr, member, value) { \
>> +	BUILD_BUG_ON(sizeof(*ptr) !=3D sizeof(T_out)); \
>> +	BUILD_BUG_ON(offsetof(typeof(*ptr), member) !=3D \
>> +		     offsetof(typeof(T_out), member)); \
>> +	BUILD_BUG_ON(sizeof(ptr->member) !=3D sizeof(value)); \
>> +	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) !=3D sizeof(value));=
 \
>> +	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
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
>> +static bool
>> +xe_eudebug_detached(struct xe_eudebug *d)
>> +{
>> +	int status;
>> +
>> +	spin_lock(&d->connection.lock);
>> +	status =3D d->connection.status;
>> +	spin_unlock(&d->connection.lock);
>> +
>> +	return status <=3D 0;
>> +}
>> +
>> +static int
>> +xe_eudebug_error(const struct xe_eudebug * const d)
>> +{
>> +	const int status =3D READ_ONCE(d->connection.status);
>> +
>> +	return status <=3D 0 ? status : 0;
>> +}
>> +
>> +static unsigned int
>> +event_fifo_has_events(struct xe_eudebug *d)
>> +{
>> +	if (xe_eudebug_detached(d))
>> +		return 1;
>> +
>> +	return event_fifo_num_events_peek(d);
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
>> +	res =3D kzalloc(sizeof(*res), GFP_ATOMIC);
>> +	if (!res)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	mutex_init(&res->lock);
>> +
>> +	for (i =3D 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
>> +		xa_init_flags(&res->rt[i].xa, XA_FLAGS_ALLOC1);
>> +		err =3D rhashtable_init(&res->rt[i].rh, &rhash_res);
>> +
>> +		if (err)
>> +			break;
>> +	}
>> +
>> +	if (err) {
>> +		while (i--) {
>> +			xa_destroy(&res->rt[i].xa);
>> +			rhashtable_destroy(&res->rt[i].rh);
>> +		}
>> +
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
>> +xe_eudebug_destroy_resources(struct xe_eudebug *d)
>> +{
>> +	struct xe_eudebug_resources *res =3D d->res;
>> +	struct xe_eudebug_handle *h;
>> +	unsigned long j;
>> +	int i;
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
>> +			xe_eudebug_assert(d, !err);
>> +			t =3D xa_erase(&r->xa, h->id);
>> +			xe_eudebug_assert(d, t =3D=3D h);
>> +			kfree(t);
>> +		}
>> +	}
>> +	mutex_unlock(&res->lock);
>> +
>> +	for (i =3D 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
>> +		struct xe_eudebug_resource *r =3D &res->rt[i];
>> +
>> +		rhashtable_free_and_destroy(&r->rh, res_free_fn, NULL);
>> +		xe_eudebug_assert(d, xa_empty(&r->xa));
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
>> +	xe_eudebug_destroy_resources(d);
>> +	put_task_struct(d->target_task);
>> +
>> +	xe_eudebug_assert(d, !kfifo_len(&d->events.fifo));
>> +
>> +	kfree_rcu(d, rcu);
>> +}
>> +
>> +static void xe_eudebug_put(struct xe_eudebug *d)
>> +{
>> +	kref_put(&d->ref, xe_eudebug_free);
>> +}
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
>> +static int
>> +xe_eudebug_attach(struct xe_device *xe, struct xe_eudebug *d,
>> +		  const pid_t pid_nr)
>> +{
>> +	struct task_struct *target;
>> +	struct xe_eudebug *iter;
>> +	kuid_t uid =3D current_uid();
>> +	int ret =3D 0;
>> +
>> +	target =3D find_get_target(pid_nr);
>> +	if (!target)
>> +		return -ENOENT;
>> +
>> +	if (!uid_eq(uid, task_uid(target)) && !capable(CAP_SYS_ADMIN)) {
>> +		put_task_struct(target);
>> +		return -EACCES;
>> +	}
>> +
>> +	XE_WARN_ON(d->connection.status !=3D 0);
>> +
>> +	spin_lock(&xe->eudebug.lock);
>> +	for_each_debugger(iter, &xe->eudebug.list) {
>> +		if (!same_thread_group(iter->target_task, target))
>> +			continue;
>> +
>> +		ret =3D -EBUSY;
>> +	}
>> +
>> +	if (!ret && xe->eudebug.session_count + 1 =3D=3D 0)
>> +		ret =3D -ENOSPC;
>> +
>> +	if (!ret) {
>> +		d->connection.status =3D XE_EUDEBUG_STATUS_CONNECTED;
>> +		d->xe =3D xe;
>> +		d->target_task =3D target;
>> +		d->session =3D ++xe->eudebug.session_count;
>> +		kref_get(&d->ref);
>> +		list_add_tail_rcu(&d->connection_link, &xe->eudebug.list);
>> +	}
>> +	spin_unlock(&xe->eudebug.lock);
>> +
>> +	if (ret)
>> +		put_task_struct(target);
>> +
>> +	return ret;
>> +}
>> +
>> +static bool xe_eudebug_detach(struct xe_device *xe,
>> +			      struct xe_eudebug *d,
>> +			      const int err)
>> +{
>> +	bool detached =3D false;
>> +
>> +	XE_WARN_ON(err > 0);
>> +
>> +	spin_lock(&d->connection.lock);
>> +	if (d->connection.status =3D=3D XE_EUDEBUG_STATUS_CONNECTED) {
>> +		d->connection.status =3D err;
>> +		detached =3D true;
>> +	}
>> +	spin_unlock(&d->connection.lock);
>> +
>> +	if (!detached)
>> +		return false;
>> +
>> +	spin_lock(&xe->eudebug.lock);
>> +	list_del_rcu(&d->connection_link);
>> +	spin_unlock(&xe->eudebug.lock);
>> +
>> +	eu_dbg(d, "session %lld detached with %d", d->session, err);
>> +
>> +	/* Our ref with the connection_link */
>> +	xe_eudebug_put(d);
>> +
>> +	return true;
>> +}
>> +
>> +static int _xe_eudebug_disconnect(struct xe_eudebug *d,
>> +				  const int err)
>> +{
>> +	wake_up_all(&d->events.write_done);
>> +	wake_up_all(&d->events.read_done);
>> +
>> +	return xe_eudebug_detach(d->xe, d, err);
>> +}
>> +
>> +#define xe_eudebug_disconnect(_d, _err) ({ \
>> +	if (_xe_eudebug_disconnect((_d), (_err))) { \
>> +		if ((_err) =3D=3D 0 || (_err) =3D=3D -ETIMEDOUT) \
>> +			eu_dbg(d, "Session closed (%d)", (_err)); \
>> +		else \
>> +			eu_err(d, "Session disconnected, err =3D %d (%s:%d)", \
>> +			       (_err), __func__, __LINE__); \
>> +	} \
>> +})
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
>> +		if (xe_eudebug_error(d))
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
>> +	d =3D NULL;
>> +	task =3D find_task_get(xef);
>> +	if (task) {
>> +		d =3D xe_eudebug_for_task_get(to_xe_device(xef->drm->minor->dev),
>> +					    task);
>> +		put_task_struct(task);
>> +	}
>> +
>> +	if (!d)
>> +		return NULL;
>> +
>> +	if (xe_eudebug_detached(d)) {
>> +		xe_eudebug_put(d);
>> +		return NULL;
>> +	}
>> +
>> +	return d;
>> +}
>> +
>> +static int xe_eudebug_queue_event(struct xe_eudebug *d,
>> +				  struct xe_eudebug_event *event)
>> +{
>> +	const u64 wait_jiffies =3D msecs_to_jiffies(1000);
>> +	u64 last_read_detected_ts, last_head_seqno, start_ts;
>> +
>> +	xe_eudebug_assert(d, event->len > sizeof(struct xe_eudebug_event));
>> +	xe_eudebug_assert(d, event->type);
>> +	xe_eudebug_assert(d, event->type !=3D DRM_XE_EUDEBUG_EVENT_READ);
>> +
>> +	start_ts =3D ktime_get();
>> +	last_read_detected_ts =3D start_ts;
>> +	last_head_seqno =3D 0;
>> +
>> +	do  {
>> +		struct xe_eudebug_event *head;
>> +		u64 head_seqno;
>> +		bool was_queued;
>> +
>> +		if (xe_eudebug_detached(d))
>> +			break;
>> +
>> +		spin_lock(&d->events.lock);
>> +		head =3D event_fifo_pending(d);
>> +		if (head)
>> +			head_seqno =3D event->seqno;
>> +		else
>> +			head_seqno =3D 0;
>> +
>> +		was_queued =3D kfifo_in(&d->events.fifo, &event, 1);
>> +		spin_unlock(&d->events.lock);
>> +
>> +		wake_up_all(&d->events.write_done);
>> +
>> +		if (was_queued) {
>> +			event =3D NULL;
>> +			break;
>> +		}
>> +
>> +		XE_WARN_ON(!head_seqno);
>> +
>> +		/* If we detect progress, restart timeout */
>> +		if (last_head_seqno !=3D head_seqno)
>> +			last_read_detected_ts =3D ktime_get();
>> +
>> +		last_head_seqno =3D head_seqno;
>> +
>> +		wait_event_interruptible_timeout(d->events.read_done,
>> +						 !kfifo_is_full(&d->events.fifo),
>> +						 wait_jiffies);
>> +
>> +	} while (ktime_ms_delta(ktime_get(), last_read_detected_ts) <
>> +		 XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS);
>> +
>> +	if (event) {
>> +		eu_dbg(d,
>> +		       "event %llu queue failed (blocked %lld ms, avail %d)",
>> +		       event ? event->seqno : 0,
>> +		       ktime_ms_delta(ktime_get(), start_ts),
>> +		       kfifo_avail(&d->events.fifo));
>> +
>> +		kfree(event);
>> +
>> +		return -ETIMEDOUT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct xe_eudebug_handle *
>> +alloc_handle(const int type, const u64 key)
>> +{
>> +	struct xe_eudebug_handle *h;
>> +
>> +	h =3D kzalloc(sizeof(*h), GFP_ATOMIC);
>> +	if (!h)
>> +		return NULL;
>> +
>> +	h->key =3D key;
>> +
>> +	return h;
>> +}
>> +
>> +static struct xe_eudebug_handle *
>> +__find_handle(struct xe_eudebug_resource *r,
>> +	      const u64 key)
>> +{
>> +	struct xe_eudebug_handle *h;
>> +
>> +	h =3D rhashtable_lookup_fast(&r->rh,
>> +				   &key,
>> +				   rhash_res);
>> +	return h;
>> +}
>> +
>> +static int find_handle(struct xe_eudebug_resources *res,
>> +		       const int type,
>> +		       const void *p)
>> +{
>> +	const u64 key =3D (u64)p;
>> +	struct xe_eudebug_resource *r;
>> +	struct xe_eudebug_handle *h;
>> +	int id;
>> +
>> +	if (XE_WARN_ON(!key))
>> +		return -EINVAL;
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
>> +static int _xe_eudebug_add_handle(struct xe_eudebug *d,
>> +				  int type,
>> +				  void *p,
>> +				  u64 *seqno,
>> +				  int *handle)
>> +{
>> +	const u64 key =3D (u64)p;
>> +	struct xe_eudebug_resource *r;
>> +	struct xe_eudebug_handle *h, *o;
>> +	int err;
>> +
>> +	if (XE_WARN_ON(p =3D=3D NULL))
>> +		return -EINVAL;
>> +
>> +	if (xe_eudebug_detached(d))
>> +		return -ENOTCONN;
>> +
>> +	h =3D alloc_handle(type, key);
>> +	if (!h)
>> +		return -ENOMEM;
>> +
>> +	r =3D resource_from_type(d->res, type);
>> +
>> +	mutex_lock(&d->res->lock);
>> +	o =3D __find_handle(r, key);
>> +	if (!o) {
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
>> +		if (err) {
>> +			xa_erase(&r->xa, h->id);
>> +		} else {
>> +			if (seqno)
>> +				*seqno =3D atomic_long_inc_return(&d->events.seqno);
>> +		}
>> +	} else {
>> +		xe_eudebug_assert(d, o->id);
>> +		err =3D -EEXIST;
>> +	}
>> +	mutex_unlock(&d->res->lock);
>> +
>> +	if (handle)
>> +		*handle =3D o ? o->id : h->id;
>> +
>> +	if (err) {
>> +		kfree(h);
>> +		XE_WARN_ON(err > 0);
>> +		return err;
>> +	}
>> +
>> +	xe_eudebug_assert(d, h->id);
>> +
>> +	return h->id;
>> +}
>> +
>> +static int xe_eudebug_add_handle(struct xe_eudebug *d,
>> +				 int type,
>> +				 void *p,
>> +				 u64 *seqno)
>> +{
>> +	int ret;
>> +
>> +	ret =3D _xe_eudebug_add_handle(d, type, p, seqno, NULL);
>> +	if (ret =3D=3D -EEXIST || ret =3D=3D -ENOTCONN) {
>> +		eu_dbg(d, "%d on adding %d", ret, type);
>> +		return 0;
>> +	}
>> +
>> +	if (ret < 0)
>> +		xe_eudebug_disconnect(d, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int _xe_eudebug_remove_handle(struct xe_eudebug *d, int type, vo=
id *p,
>> +				     u64 *seqno)
>> +{
>> +	const u64 key =3D (u64)p;
>> +	struct xe_eudebug_resource *r;
>> +	struct xe_eudebug_handle *h, *xa_h;
>> +	int ret;
>> +
>> +	if (XE_WARN_ON(!key))
>> +		return -EINVAL;
>> +
>> +	if (xe_eudebug_detached(d))
>> +		return -ENOTCONN;
>> +
>> +	r =3D resource_from_type(d->res, type);
>> +
>> +	mutex_lock(&d->res->lock);
>> +	h =3D __find_handle(r, key);
>> +	if (h) {
>> +		ret =3D rhashtable_remove_fast(&r->rh,
>> +					     &h->rh_head,
>> +					     rhash_res);
>> +		xe_eudebug_assert(d, !ret);
>> +		xa_h =3D xa_erase(&r->xa, h->id);
>> +		xe_eudebug_assert(d, xa_h =3D=3D h);
>> +		if (!ret) {
>> +			ret =3D h->id;
>> +			if (seqno)
>> +				*seqno =3D atomic_long_inc_return(&d->events.seqno);
>> +		}
>> +	} else {
>> +		ret =3D -ENOENT;
>> +	}
>> +	mutex_unlock(&d->res->lock);
>> +
>> +	kfree(h);
>> +
>> +	xe_eudebug_assert(d, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static int xe_eudebug_remove_handle(struct xe_eudebug *d, int type, voi=
d *p,
>> +				    u64 *seqno)
>> +{
>> +	int ret;
>> +
>> +	ret =3D _xe_eudebug_remove_handle(d, type, p, seqno);
>> +	if (ret =3D=3D -ENOENT || ret =3D=3D -ENOTCONN) {
>> +		eu_dbg(d, "%d on removing %d", ret, type);
>> +		return 0;
>> +	}
>> +
>> +	if (ret < 0)
>> +		xe_eudebug_disconnect(d, ret);
>> +
>> +	return ret;
>> +}
>> +
>> +static struct xe_eudebug_event *
>> +__xe_eudebug_create_event(struct xe_eudebug *d,
>> +			  u64 seqno, u16 type, u16 flags, u32 len, gfp_t gfp)
>> +{
>> +	struct xe_eudebug_event *event;
>> +
>> +	xe_eudebug_assert(d, len > sizeof(*event));
>> +
>> +	event =3D kzalloc(len, gfp);
>> +	if (!event)
>> +		return NULL;
>> +
>> +	event->type =3D type;
>> +	event->flags =3D flags;
>> +	event->len =3D len;
>> +	event->seqno =3D seqno;
>> +
>> +	return event;
>> +}
>> +
>> +static struct xe_eudebug_event *
>> +xe_eudebug_create_event(struct xe_eudebug *d, u16 type, u64 seqno, u16 =
flags,
>> +			u32 len, gfp_t gfp)
>> +{
>> +	return __xe_eudebug_create_event(d, seqno, type, flags, len, gfp);
>> +}
>> +
>> +static long xe_eudebug_read_event(struct xe_eudebug *d,
>> +				  const u64 arg,
>> +				  const bool wait)
>> +{
>> +	struct xe_device *xe =3D d->xe;
>> +	struct drm_xe_eudebug_event __user * const user_orig =3D
>> +		u64_to_user_ptr(arg);
>> +	struct drm_xe_eudebug_event user_event;
>> +	struct xe_eudebug_event *event;
>> +	long ret =3D 0;
>> +
>> +	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(use=
r_event))))
>> +		return -EFAULT;
>> +
>> +	if (XE_IOCTL_DBG(xe, !user_event.type))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_event.type > DRM_XE_EUDEBUG_EVENT_MAX_EVENT))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_event.type !=3D DRM_XE_EUDEBUG_EVENT_READ))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_event.len < sizeof(*user_orig)))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_event.flags))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_event.reserved))
>> +		return -EINVAL;
>> +
>> +	/* XXX: define wait time in connect arguments ? */
>> +	if (wait) {
>> +		ret =3D wait_event_interruptible_timeout(d->events.write_done,
>> +						       event_fifo_has_events(d),
>> +						       msecs_to_jiffies(5 * 1000));
>> +
>> +		if (XE_IOCTL_DBG(xe, ret < 0))
>> +			return ret;
>> +	}
>> +
>> +	ret =3D 0;
>> +	spin_lock(&d->events.lock);
>> +	event =3D event_fifo_pending(d);
>> +	if (event) {
>> +		if (user_event.len < event->len) {
>> +			ret =3D -EMSGSIZE;
>> +		} else if (!kfifo_out(&d->events.fifo, &event, 1)) {
>> +			eu_warn(d, "internal fifo corruption");
>> +			ret =3D -ENOTCONN;
>> +		}
>> +	}
>> +	spin_unlock(&d->events.lock);
>> +
>> +	wake_up_all(&d->events.read_done);
>> +
>> +	if (XE_IOCTL_DBG(xe, ret))
>> +		return ret;
>> +
>> +	if (!event) {
>> +		if (xe_eudebug_detached(d))
>> +			return -ENOTCONN;
>> +		if (!wait)
>> +			return -EAGAIN;
>> +
>> +		return -ENOENT;
>> +	}
>> +
>> +	if (copy_to_user(user_orig, event, event->len))
>> +		ret =3D -EFAULT;
>> +	else
>> +		eu_dbg(d, "event read: type=3D%u, flags=3D0x%x, seqno=3D%llu", event-=
>type,
>> +		       event->flags, event->seqno);
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
>> +static int
>> +xe_eudebug_connect(struct xe_device *xe,
>> +		   struct drm_xe_eudebug_connect *param)
>> +{
>> +	const u64 known_open_flags =3D 0;
>> +	unsigned long f_flags =3D 0;
>> +	struct xe_eudebug *d;
>> +	int fd, err;
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
>> +	spin_lock_init(&d->connection.lock);
>> +	init_waitqueue_head(&d->events.write_done);
>> +	init_waitqueue_head(&d->events.read_done);
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
>> +	err =3D xe_eudebug_attach(xe, d, param->pid);
>> +	if (err)
>> +		goto err_free_res;
>> +
>> +	fd =3D anon_inode_getfd("[xe_eudebug]", &fops, d, f_flags);
>> +	if (fd < 0) {
>> +		err =3D fd;
>> +		goto err_detach;
>> +	}
>> +
>> +	eu_dbg(d, "connected session %lld", d->session);
>> +
>> +	return fd;
>> +
>> +err_detach:
>> +	xe_eudebug_detach(xe, d, err);
>> +err_free_res:
>> +	xe_eudebug_destroy_resources(d);
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
>> +	spin_lock_init(&xe->eudebug.lock);
>> +	INIT_LIST_HEAD(&xe->eudebug.list);
>> +
>> +	xe->eudebug.available =3D true;
>> +}
>> +
>> +void xe_eudebug_fini(struct xe_device *xe)
>> +{
>> +	xe_assert(xe, list_empty_careful(&xe->eudebug.list));
>> +}
>> +
>> +static int send_open_event(struct xe_eudebug *d, u32 flags, const u64 h=
andle,
>> +			   const u64 seqno)
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
>> +	event =3D xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_OPEN, seqno,
>> +					flags, sizeof(*eo), GFP_KERNEL);
>> +	if (!event)
>> +		return -ENOMEM;
>> +
>> +	eo =3D cast_event(eo, event);
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
>> +	u64 seqno;
>> +	int ret;
>> +
>> +	ret =3D xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_CLIENT, xef, &seq=
no);
>> +	if (ret > 0)
>> +		ret =3D send_open_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
>> +					     ret, seqno);
>> +
>> +	return ret;
>> +}
>> +
>> +static int client_destroy_event(struct xe_eudebug *d, struct xe_file *x=
ef)
>> +{
>> +	u64 seqno;
>> +	int ret;
>> +
>> +	ret =3D xe_eudebug_remove_handle(d, XE_EUDEBUG_RES_TYPE_CLIENT,
>> +				       xef, &seqno);
>> +	if (ret > 0)
>> +		ret =3D send_open_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY,
>> +				      ret, seqno);
>> +
>> +	return ret;
>> +}
>> +
>> +#define xe_eudebug_event_put(_d, _err) ({ \
>> +	if ((_err)) \
>> +		xe_eudebug_disconnect((_d), (_err)); \
>> +	xe_eudebug_put((_d)); \
>> +	})
>> +
>> +void xe_eudebug_file_open(struct xe_file *xef)
>> +{
>> +	struct xe_eudebug *d;
>> +
>> +	d =3D xe_eudebug_get(xef);
>> +	if (!d)
>> +		return;
>> +
>> +	xe_eudebug_event_put(d, client_create_event(d, xef));
>> +}
>> +
>> +void xe_eudebug_file_close(struct xe_file *xef)
>> +{
>> +	struct xe_eudebug *d;
>> +
>> +	d =3D xe_eudebug_get(xef);
>> +	if (!d)
>> +		return;
>> +
>> +	xe_eudebug_event_put(d, client_destroy_event(d, xef));
>> +}
>> +
>> +static int send_vm_event(struct xe_eudebug *d, u32 flags,
>> +			 const u64 client_handle,
>> +			 const u64 vm_handle,
>> +			 const u64 seqno)
>> +{
>> +	struct xe_eudebug_event *event;
>> +	struct xe_eudebug_event_vm *e;
>> +
>> +	event =3D xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM,
>> +					seqno, flags, sizeof(*e), GFP_KERNEL);
>> +	if (!event)
>> +		return -ENOMEM;
>> +
>> +	e =3D cast_event(e, event);
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
>> +	u64 seqno;
>> +	int ret;
>> +
>> +	h_c =3D find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
>> +	if (h_c < 0)
>> +		return h_c;
>> +
>> +	xe_eudebug_assert(d, h_c);
>> +
>> +	h_vm =3D xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm, &seqno);
>> +	if (h_vm <=3D 0)
>> +		return h_vm;
>> +
>> +	ret =3D send_vm_event(d, DRM_XE_EUDEBUG_EVENT_CREATE, h_c, h_vm, seqno=
);
>> +
>> +	return ret;
>> +}
>> +
>> +static int vm_destroy_event(struct xe_eudebug *d,
>> +			    struct xe_file *xef, struct xe_vm *vm)
>> +{
>> +	int h_c, h_vm;
>> +	u64 seqno;
>> +
>> +	h_c =3D find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
>> +	if (h_c < 0) {
>> +		XE_WARN_ON("no client found for vm");
>> +		eu_warn(d, "no client found for vm");
>> +		return h_c;
>> +	}
>> +
>> +	xe_eudebug_assert(d, h_c);
>> +
>> +	h_vm =3D xe_eudebug_remove_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm, &seqn=
o);
>> +	if (h_vm <=3D 0)
>> +		return h_vm;
>> +
>> +	return send_vm_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY, h_c, h_vm, seqno=
);
>> +}
>> +
>> +void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm)
>> +{
>> +	struct xe_eudebug *d;
>> +
>> +	d =3D xe_eudebug_get(xef);
>> +	if (!d)
>> +		return;
>> +
>> +	xe_eudebug_event_put(d, vm_create_event(d, xef, vm));
>> +}
>> +
>> +void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
>> +{
>> +	struct xe_eudebug *d;
>> +
>> +	d =3D xe_eudebug_get(xef);
>> +	if (!d)
>> +		return;
>> +
>> +	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
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
>> index 000000000000..093221a707df
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
>> @@ -0,0 +1,169 @@
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
>> +#define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
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
>> +#define XE_EUDEBUG_RES_TYPE_CLIENT	0
>> +#define XE_EUDEBUG_RES_TYPE_VM		1
>> +#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_VM + 1)
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
>> +	struct {
>> +		/** @status: connected =3D 1, disconnected =3D error */
>> +#define XE_EUDEBUG_STATUS_CONNECTED 1
>> +		int status;
>> +
>> +		/** @lock: guards access to status */
>> +		spinlock_t lock;
>> +	} connection;
>> +
>> +	/** @xe: the parent device we are serving */
>> +	struct xe_device *xe;
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
>> +		/** @read_done: waitqueue for signalling read from fifo */
>> +		wait_queue_head_t read_done;
>> +
>> +		/** @event_seqno: seqno counter to stamp events for fifo */
>> +		atomic_long_t seqno;
>> +	} events;
>> +
>> +};
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
>> +};
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
>> +};
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
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index f225107bdd65..9e101c992d9c 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -39,6 +39,7 @@
>>  #include "xe_trace_bo.h"
>>  #include "xe_wa.h"
>>  #include "xe_hmm.h"
>> +#include "xe_eudebug.h"
>>=20=20
>>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>>  {
>> @@ -1818,6 +1819,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, voi=
d *data,
>>  	args->reserved[0] =3D xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE=
);
>>  #endif
>>=20=20
>> +	xe_eudebug_vm_create(xef, vm);
>> +
>>  	return 0;
>>=20=20
>>  err_free_id:
>> @@ -1853,8 +1856,10 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, v=
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
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 29425d7fdc77..a68734ff12f4 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -102,6 +102,7 @@ extern "C" {
>>  #define DRM_XE_EXEC			0x09
>>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>>  #define DRM_XE_OBSERVATION		0x0b
>> +#define DRM_XE_EUDEBUG_CONNECT		0x0c
>>=20=20
>>  /* Must be kept compact -- no holes */
>>=20=20
>> @@ -117,6 +118,7 @@ extern "C" {
>>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, str=
uct drm_xe_exec)
>>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_X=
E_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBS=
ERVATION, struct drm_xe_observation_param)
>> +#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_X=
E_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)
>>=20=20
>>  /**
>>   * DOC: Xe IOCTL Extensions
>> @@ -1694,6 +1696,25 @@ struct drm_xe_oa_stream_info {
>>  	__u64 reserved[3];
>>  };
>>=20=20
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
>> +#include "xe_drm_eudebug.h"
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>> diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm=
_eudebug.h
>> new file mode 100644
>> index 000000000000..a1cad9c005fc
>> --- /dev/null
>> +++ b/include/uapi/drm/xe_drm_eudebug.h
>> @@ -0,0 +1,57 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright =C2=A9 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _UAPI_XE_DRM_EUDEBUG_H_
>> +#define _UAPI_XE_DRM_EUDEBUG_H_
>> +
>> +#if defined(__cplusplus)
>> +extern "C" {
>> +#endif
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
>> +#define DRM_XE_EUDEBUG_EVENT_NONE		0
>> +#define DRM_XE_EUDEBUG_EVENT_READ		1
>> +#define DRM_XE_EUDEBUG_EVENT_OPEN		2
>> +#define DRM_XE_EUDEBUG_EVENT_VM			3
>> +#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_VM
>> +
>> +	__u16 flags;
>> +#define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
>> +#define DRM_XE_EUDEBUG_EVENT_DESTROY		(1 << 1)
>> +#define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	(1 << 2)
>> +#define DRM_XE_EUDEBUG_EVENT_NEED_ACK		(1 << 3)
>> +	__u64 seqno;
>> +	__u64 reserved;
>> +};
>> +
>> +struct drm_xe_eudebug_event_client {
>> +	struct drm_xe_eudebug_event base;
>> +
>> +	__u64 client_handle; /* This is unique per debug connection */
>> +};
>> +
>> +struct drm_xe_eudebug_event_vm {
>> +	struct drm_xe_eudebug_event base;
>> +
>> +	__u64 client_handle;
>> +	__u64 vm_handle;
>> +};
>> +
>> +#if defined(__cplusplus)
>> +}
>> +#endif
>> +
>> +#endif
>> --=20
>> 2.34.1
>>=20
