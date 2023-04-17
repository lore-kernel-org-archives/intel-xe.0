Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA6EC77B76
	for <intel-xe@archiver.kernel.org>; Mon, 17 Apr 2023 17:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D9D10E212;
	Mon, 17 Apr 2023 17:52:08 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE64010E56C
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Apr 2023 17:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681753926; x=1713289926;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=mpxCRovsNFkCi0A0SPGHChTPU5lpcvWgdOAxqFBPqjI=;
 b=n6cfM0SGSwUvb8U82cFPVgm+Tyd884o0TxFbJ1htTJURvxxGn5K8AOZ8
 8M3MDrKkiYSjX5gR20hWcpyYKA3Zm06/SYmx2ChEE07YqN0mSt6CBtgez
 dfdC7+iB5R1iwuIM4NS+bKpFu81yFfzEvKfgA792X58J/d5LX4mMcBxj2
 n5WXnvKIcit7NYcUt/VjECh1B7Cd92XCOYBPOxfl4+1Tvbk/PzmbapFXr
 VJl+96kE+ATMvkCiocKH8KHLnSm/QxUx3flrfTTrLWrxq0uQTLOarMpqj
 jJYsNVVNvxj1bLWWcDfhl4drK3ruIhGLGK4iZrfWmW9WBZ6CYtRsmVpt/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="324581611"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="324581611"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 10:52:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="641017777"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="641017777"
Received: from canavaro-mobl1.amr.corp.intel.com (HELO [10.249.34.90])
 ([10.249.34.90])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 10:52:03 -0700
Message-ID: <9ee7959e-6333-ef38-a741-b5e9694fc985@linux.intel.com>
Date: Mon, 17 Apr 2023 19:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Content-Language: en-US
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230413142749.1097229-1-mika.kuoppala@linux.intel.com>
 <20230413142749.1097229-3-mika.kuoppala@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230413142749.1097229-3-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC 2/3] drm/xe/eudebug: Introduce eudebug support
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

Hey,

On 2023-04-13 16:27, Mika Kuoppala wrote:
> With eudebug event interface, user space debugger process (like gdb)
> is able to keep track of resources created by another process
> (debuggee using drm/xe) and act upon these resources.
>
> For example, debugger can find a client vm which contains isa/elf
> for a particular shader/eu-kernel and then inspect and modify it
> (for example installing a breakpoint).
>
> Debugger first opens a connection to xe with a drm ioctl specifying
> target pid to connect. This returns an anon fd handle that can then be
> used to listen for events with dedicated ioctl.
>
> This patch introduces eudebug connection and event queuing, adding
> client create/destroy and vm create/destroy events as a baseline.
> More events for full debugger operation are needed and
> those will be introduced in follow up patches.
>
> The resource tracking parts are inspired by the work of
> Maciej Patelczyk on resource handling for i915. Chris Wilson
> suggested improvement of two ways mapping which makes it easy to
> use resource map as a definitive bookkeep of what resources
> are played to debugger in the discovery phase (on follow up patch).
>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile           |    3 +-
>   drivers/gpu/drm/xe/xe_device.c        |   26 +-
>   drivers/gpu/drm/xe/xe_device_types.h  |   25 +
>   drivers/gpu/drm/xe/xe_eudebug.c       | 1122 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_eudebug.h       |   27 +
>   drivers/gpu/drm/xe/xe_eudebug_types.h |  166 ++++
>   drivers/gpu/drm/xe/xe_vm.c            |    5 +
>   include/uapi/drm/xe_drm_tmp.h         |   76 ++
>   8 files changed, 1448 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
>   create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
>   create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
>   create mode 100644 include/uapi/drm/xe_drm_tmp.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index aceca651de57..58fe49c37390 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -94,7 +94,8 @@ xe-y += xe_bb.o \
>   	xe_vm_madvise.o \
>   	xe_wait_user_fence.o \
>   	xe_wa.o \
> -	xe_wopcm.o
> +	xe_wopcm.o \
> +	xe_eudebug.o
>   
>   # i915 Display compat #defines and #includes
>   subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 45d6e5ff47fd..9f6ab80ccabb 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -11,6 +11,7 @@
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_managed.h>
>   #include <drm/xe_drm.h>
> +#include <drm/xe_drm_tmp.h>
>   
>   #include "regs/xe_regs.h"
>   #include "xe_bo.h"
> @@ -32,10 +33,13 @@
>   #include "xe_vm.h"
>   #include "xe_vm_madvise.h"
>   #include "xe_wait_user_fence.h"
> +#include "xe_eudebug.h"
>   
>   static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   {
> +	struct xe_device *xe = to_xe_device(dev);
>   	struct xe_file *xef;
> +	int err;
>   
>   	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
>   	if (!xef)
> @@ -50,7 +54,17 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   	xa_init_flags(&xef->engine.xa, XA_FLAGS_ALLOC1);
>   
>   	file->driver_priv = xef;
> -	return 0;
> +
> +	mutex_lock(&xe->clients.lock);
> +	err = xa_alloc(&xe->clients.xa, &xef->client_id, xef, xa_limit_32b, GFP_KERNEL);
> +	mutex_unlock(&xe->clients.lock);
No need to protect with a mutex. xa has its own spinlock. We're killing 
it elsewhere..
> +	if (!err)
> +		xe_eudebug_file_open(xef);
> +	else
> +		kfree(xef);
> +
> +	return err;
>   }
>   
>   static void device_kill_persistent_engines(struct xe_device *xe,
> @@ -79,6 +93,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   	mutex_unlock(&xef->vm.lock);
>   	mutex_destroy(&xef->vm.lock);
>   
> +	xe_eudebug_file_close(xef);
> +
> +	mutex_lock(&xe->clients.lock);
> +	xa_erase(&xe->clients.xa, xef->client_id);
> +	mutex_unlock(&xe->clients.lock);
> +
>   	kfree(xef);
>   }
>   
> @@ -103,6 +123,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>   			  DRM_RENDER_ALLOW),
>   	DRM_IOCTL_DEF_DRV(XE_VM_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_EUDEBUG_CONNECT, xe_eudebug_connect_ioctl, DRM_RENDER_ALLOW),
>   };
>   
>   static const struct file_operations xe_driver_fops = {
> @@ -161,6 +182,7 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>   
>   	destroy_workqueue(xe->ordered_wq);
>   	ttm_device_fini(&xe->ttm);
> +	xe_eudebug_fini(xe);
>   }
>   
>   struct xe_device *xe_device_create(struct pci_dev *pdev,
> @@ -207,6 +229,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	INIT_LIST_HEAD(&xe->pinned.external_vram);
>   	INIT_LIST_HEAD(&xe->pinned.evicted);
>   
> +	xe_eudebug_init(xe);
> +
>   	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>   
>   	err = xe_display_create(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b6d4a6b9b060..10932cb28b66 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -263,6 +263,28 @@ struct xe_device {
>   	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>   	bool d3cold_allowed;
>   
> +	/** @debugger connection list and globals for device */
> +	struct {
> +		/** @lock: protects the list of connections */
> +		spinlock_t lock;
> +		/** @list: list of connections, aka debuggers */
> +		struct list_head list;
> +
> +		/** @session_count: session counter to track connections */
> +		u64 session_count;
> +
> +		/** @available: is the debugging functionality available */
> +		bool available;
> +	} eudebug;
> +
> +	/** @clients xe_file tracking for eudebug discovery */
> +	struct {
> +		/** @lock: protects the xa */
> +		struct mutex lock;
> +		/** @xa: xarray of xe_files currently open */
> +		struct xarray xa;
> +	} clients;
> +
>   	/* private: */
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> @@ -358,6 +380,9 @@ struct xe_file {
>   		/** @lock: protects file engine state */
>   		struct mutex lock;
>   	} engine;
> +
> +	/** @client_id: id in clients.xa for eudebug discovery */
> +	int client_id;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> new file mode 100644
> index 000000000000..72e1962b1731
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -0,0 +1,1122 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "xe_eudebug.h"
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/poll.h>
> +#include <linux/delay.h>
> +
> +#include <drm/drm_managed.h>
> +#include <uapi/drm/xe_drm_tmp.h>
> +
> +#include "xe_device.h"
> +#include "xe_eudebug_types.h"
> +
> +/*
> + * If there is no event being read in this time (for example gdb stuck)
> + * connection is forcibly disconnected. This releases the client as it was
> + * waiting to get space for event in fifo.
> + */
> +#define XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS (10 * 1000)
> +
> +#define for_each_debugger_rcu(debugger, head) \
> +	list_for_each_entry_rcu((debugger), (head), connection_link)
> +
> +#define from_event(T, event) container_of((event), typeof(*(T)), base)
> +#define to_event(e) (&(e)->base)
> +
> +#define XE_EUDEBUG_DBG_STR "eudbg: (%d/%d:%lld:%d/%d): "
> +#define XE_EUDEBUG_DBG_ARGS(d) current->pid, \
> +		task_tgid_nr(current), \
> +		d->session, \
> +		d->target_task->pid, \
> +		task_tgid_nr(d->target_task)
> +
> +#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
> +#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
> +#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
> +
> +static const char *event_type_to_str(u32 type)
> +{
> +	static const char * const type_str[] = {
> +		"none",
> +		"read",
> +		"client",
> +		"vm",
> +		"unknown",
> +	};
> +
> +	if (type > ARRAY_SIZE(type_str) - 1)
> +		type = ARRAY_SIZE(type_str) - 1;
> +
> +	return type_str[type];
> +}
> +
> +static const char *event_flags_to_str(const u32 flags)
> +{
> +	if (flags & DRM_XE_EUDEBUG_EVENT_CREATE)
> +		return "create";
> +	else if (flags & DRM_XE_EUDEBUG_EVENT_DESTROY)
> +		return "destroy";
> +	else if (flags & DRM_XE_EUDEBUG_EVENT_STATE_CHANGE)
> +		return "state-change";
> +
> +	return "unknown";
> +}
> +
> +#define EVENT_PRINT_MEMBER(d, p, s, m, fmt, type) do { \
> +		BUILD_BUG_ON(sizeof(s->m) != sizeof(type)); \
> +		eu_dbg(d, "%s: %s->%s = " fmt, #p, #s, #m, (type)s->m);	\
> +	} while (0)
> +
> +#define EVENT_PRINT_MEMBER_U64(d, p, s, n) EVENT_PRINT_MEMBER(d, p, s, n, "%llu", u64)
> +#define EVENT_PRINT_MEMBER_U32(d, p, s, n) EVENT_PRINT_MEMBER(d, p, s, n, "%u", u32)
> +#define EVENT_PRINT_MEMBER_U16(d, p, s, n) EVENT_PRINT_MEMBER(d, p, s, n, "%u", u16)
> +#define EVENT_PRINT_MEMBER_U64X(d, p, s, n) EVENT_PRINT_MEMBER(d, p, s, n, "0x%llx", u64)
> +#define EVENT_PRINT_MEMBER_U32X(d, p, s, n) EVENT_PRINT_MEMBER(d, p, s, n, "0x%x", u32)
> +#define EVENT_PRINT_MEMBER_HANDLE(d, p, s, n) EVENT_PRINT_MEMBER_U64(d, p, s, n)
> +
> +typedef void (*debug_event_printer_t)(const struct xe_eudebug * const d,
> +				      const char * const prefix,
> +				      const struct xe_eudebug_event * const event);

I'm still against this whole infrastructure thing. There should be no 
need for reinventing a whole kernel api inside a single file.

I still think it could be done in half the lines if we don't create all 
those definitions everywhere.

> +static void event_printer_open(const struct xe_eudebug * const d,
> +			       const char * const prefix,
> +			       const struct xe_eudebug_event * const event)
> +{
> +	const struct xe_eudebug_event_open * const open =
> +		from_event(open, event);
> +
> +	EVENT_PRINT_MEMBER_HANDLE(d, prefix, open, client_handle);
> +}
> +
> +static void event_printer_vm(const struct xe_eudebug * const d,
> +			     const char * const prefix,
> +			     const struct xe_eudebug_event * const event)
> +{
> +	const struct xe_eudebug_event_vm * const vm =
> +		from_event(vm, event);
> +
> +	EVENT_PRINT_MEMBER_HANDLE(d, prefix, vm, client_handle);
> +	EVENT_PRINT_MEMBER_HANDLE(d, prefix, vm, vm_handle);
> +}
> +
> +static void xe_eudebug_print_event(const struct xe_eudebug * const d,
> +				   const char * const prefix,
> +				   const struct xe_eudebug_event * const event)
> +{
> +	static const debug_event_printer_t event_printers[] = {
> +		NULL,
> +		NULL,
> +		event_printer_open,
> +		event_printer_vm,
> +	};
> +	debug_event_printer_t event_printer = NULL;
> +
> +
> +	eu_dbg(d, "%s %s:%s type=%u, flags=0x%08x, seqno=%llu, size=%llu\n",
> +	       prefix,
> +	       event_type_to_str(event->type),
> +	       event_flags_to_str(event->flags),
> +	       event->type,
> +	       event->flags,
> +	       event->seqno,
> +	       event->size);
> +
> +	if (event->type < ARRAY_SIZE(event_printers))
> +		event_printer = event_printers[event->type];
> +
> +	if (event_printer)
> +		event_printer(d, prefix, event);
> +	else
> +		eu_dbg(d, "no event printer found for type=%u\n", event->type);
> +}
> +
> +static struct xe_eudebug_event *
> +event_fifo_pending(struct xe_eudebug *d)
> +{
> +	struct xe_eudebug_event *event;
> +
> +	if (kfifo_peek(&d->events.fifo, &event))
> +		return event;
> +
> +	return NULL;
> +}
> +
> +/*
> + * This is racy as we dont take the lock for read but all the
> + * callsites can handle the race so we can live without lock.
> + */
> +__no_kcsan
> +static unsigned int
> +event_fifo_num_events_peek(const struct xe_eudebug * const d)
> +{
> +	return kfifo_len(&d->events.fifo);
> +}
> +
> +static struct xe_eudebug_event *
> +event_fifo_get(struct xe_eudebug *d)
> +{
> +	struct xe_eudebug_event *event;
> +
> +	if (kfifo_get(&d->events.fifo, &event))
> +		return event;
> +
> +	return NULL;
> +}
> +
> +static bool event_fifo_put(struct xe_eudebug *d,
> +				  struct xe_eudebug_event * const event)
> +{
> +	return kfifo_in_spinlocked(&d->events.fifo, &event, 1, &d->events.lock);
> +}
> +
> +static void event_fifo_drain(struct xe_eudebug *d)
> +{
> +	struct xe_eudebug_event *event;
> +
> +	while (kfifo_get(&d->events.fifo, &event))
> +		kfree(event);
> +}
3 other examples in a row.
> +static const struct rhashtable_params rhash_res = {
> +	.head_offset = offsetof(struct xe_eudebug_handle, rh_head),
> +	.key_len = sizeof_field(struct xe_eudebug_handle, key),
> +	.key_offset = offsetof(struct xe_eudebug_handle, key),
> +	.automatic_shrinking = true,
> +};
> +
> +static struct xe_eudebug_resource *
> +resource_from_type(struct xe_eudebug_resources * const res, const int t)
> +{
> +	XE_BUG_ON(t < 0);
> +	XE_BUG_ON(t >= XE_EUDEBUG_RES_TYPE_COUNT);
> +
> +	return &res->rt[t];
> +}

5


> +
> +static struct xe_eudebug_resources *
> +xe_eudebug_resources_alloc(void)
> +{
> +	struct xe_eudebug_resources *res;
> +	int err;
> +	int i;
> +
> +	res = kzalloc(sizeof(*res), GFP_KERNEL);
> +	if (!res)
> +		return NULL;
> +
> +	mutex_init(&res->lock);
> +
> +	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
> +		xa_init_flags(&res->rt[i].xa, XA_FLAGS_ALLOC1);
> +		err = rhashtable_init(&res->rt[i].rh, &rhash_res);
> +
> +		if (err) {
> +			while (i--) {
> +				xa_destroy(&res->rt[i].xa);
> +				rhashtable_destroy(&res->rt[i].rh);
> +			}
> +
> +			goto out;
> +		}
> +	}
> +
> +out:
> +	if (err) {
> +		kfree(res);
> +		res = NULL;
should probably return ERR_PTR(err); instead here.
> +	}
> +
> +	return res;
> +}
> +
> +static void res_free_fn(void *ptr, void *arg)
> +{
> +	XE_WARN_ON(ptr);
> +	kfree(ptr);
> +}
> +
> +static void
> +xe_eudebug_resources_free(struct xe_eudebug *d)
> +{
> +	struct xe_eudebug_resources *res = d->res;
> +	struct xe_eudebug_handle *h;
> +	unsigned long i, j;
> +	int err;
> +
> +	mutex_lock(&res->lock);
> +	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
> +		struct xe_eudebug_resource *r = &res->rt[i];
> +
> +		xa_for_each(&r->xa, j, h) {
> +			struct xe_eudebug_handle *t;
> +
> +			err = rhashtable_remove_fast(&r->rh,
> +						     &h->rh_head,
> +						     rhash_res);
> +			XE_WARN_ON(err);
> +			t = xa_erase(&r->xa, h->id);
> +			XE_WARN_ON(t != h);
> +			kfree(t);
> +		}
> +	}
> +	mutex_unlock(&res->lock);
> +
> +	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
> +		struct xe_eudebug_resource *r = &res->rt[i];
> +
> +		rhashtable_free_and_destroy(&r->rh, res_free_fn, NULL);
> +		XE_WARN_ON(!xa_empty(&r->xa));
> +		xa_destroy(&r->xa);
> +	}
> +
> +	mutex_destroy(&res->lock);
> +
> +	kfree(res);
> +}
> +
> +static void xe_eudebug_free(struct kref *ref)
> +{
> +	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
> +
> +	event_fifo_drain(d);
> +
> +	xe_eudebug_resources_free(d);
> +
> +	put_task_struct(d->target_task);
> +	mutex_destroy(&d->lock);
> +
> +	kfree_rcu(d, rcu);
> +}
> +
> +static void xe_eudebug_put(struct xe_eudebug *d)
> +{
> +	kref_put(&d->ref, xe_eudebug_free);
> +}
> +
> +static bool
> +xe_eudebug_detached(const struct xe_eudebug * const d)
> +{
> +	/* Can only be set so we accept the race */
> +
> +	return data_race(READ_ONCE(d->closed));
> +}
> +
> +static void xe_eudebug_detach(struct xe_eudebug *d)
> +{
> +	struct xe_device *xe = d->xe;
> +
> +	XE_WARN_ON(!xe_eudebug_detached(d));
> +
> +	spin_lock(&xe->eudebug.lock);
> +	list_del_rcu(&d->connection_link);
> +	eu_dbg(d, "session %lld detached", d->session);
> +	spin_unlock(&xe->eudebug.lock);
> +}
> +
> +static void xe_eudebug_disconnect(struct xe_eudebug *d,
> +				  const int err)
> +{
> +	bool detached = false;
> +
> +	mutex_lock(&d->lock);
> +	if (!d->closed) {
> +		d->closed = true;
> +		detached = true;
> +		d->last_error = err;
> +	}
> +	mutex_unlock(&d->lock);
> +
> +	if (detached) {
> +		xe_eudebug_detach(d);
> +		eu_dbg(d, "disconnected: %d (%d)", d->last_error, err);
> +	}
> +
> +	wake_up_all(&d->events.write_done);
> +
> +	if (detached)
> +		xe_eudebug_put(d);
> +}
> +
> +static int xe_eudebug_release(struct inode *inode, struct file *file)
> +{
> +	struct xe_eudebug *d = file->private_data;
> +
> +	xe_eudebug_disconnect(d, 0);
> +	xe_eudebug_put(d);
> +
> +	return 0;
> +}
> +
> +static __poll_t xe_eudebug_poll(struct file *file, poll_table *wait)
> +{
> +	struct xe_eudebug * const d = file->private_data;
> +	__poll_t ret = 0;
> +
> +	poll_wait(file, &d->events.write_done, wait);
> +
> +	if (xe_eudebug_detached(d)) {
> +		ret |= EPOLLHUP;
> +		if (d->last_error)
> +			ret |= EPOLLERR;
> +	}
> +
> +	if (event_fifo_num_events_peek(d))
> +		ret |= EPOLLIN;
> +
> +	return ret;
> +}
> +
> +static ssize_t xe_eudebug_read(struct file *file,
> +			       char __user *buf,
> +			       size_t count,
> +			       loff_t *ppos)
> +{
> +	return -EINVAL;
> +}
> +
> +static struct xe_eudebug *
> +xe_eudebug_for_task_get(struct xe_device *xe,
> +			struct task_struct *task)
> +{
> +	struct xe_eudebug *d, *iter;
> +
> +	d = NULL;
> +
> +	rcu_read_lock();
> +	for_each_debugger_rcu(iter, &xe->eudebug.list) {
> +		if (!same_thread_group(iter->target_task, task))
> +			continue;
> +
> +		if (kref_get_unless_zero(&iter->ref))
> +			d = iter;
> +
> +		break;
> +	}
> +	rcu_read_unlock();
> +
> +	return d;
> +}
> +
> +static struct task_struct *find_task_get(struct pid *pid)
> +{
> +	struct task_struct *task;
> +
> +	rcu_read_lock();
> +	task = pid_task(pid, PIDTYPE_PID);
> +	if (task)
> +		get_task_struct(task);
> +	rcu_read_unlock();
> +
> +	return task;
> +}
> +
> +#define xef_to_xe(xef) to_xe_device((xef)->drm->minor->dev)
> +
> +static struct xe_eudebug *
> +xe_eudebug_get(struct xe_file *xef)
> +{
> +	struct xe_device *xe = xef_to_xe(xef);
> +	struct task_struct *task;
> +	struct xe_eudebug *d = NULL;
> +
> +	task = find_task_get(xef->drm->pid);
> +	if (task) {
> +		d = xe_eudebug_for_task_get(xe, task);
> +		put_task_struct(task);
> +	}
> +
> +	if (d && xe_eudebug_detached(d)) {
> +		xe_eudebug_put(d);
> +		d = NULL;
> +	}
> +
> +	return d;
> +}
> +
> +static int queue_event(struct xe_eudebug * const d,
> +		       struct xe_eudebug_event **event)
> +{
> +	if (*event == NULL)
> +		return -EINVAL;
> +
> +	/* We just drop quietly on disconnected */
> +	if (xe_eudebug_detached(d)) {
> +		wake_up_all(&d->events.write_done);
> +		kfree(*event);
> +		*event = NULL;
> +		return 0;
> +	}
> +
> +	if (likely(event_fifo_put(d, *event))) {
> +		wake_up_all(&d->events.write_done);
> +		*event = NULL;
> +		return 0;
> +	}
> +
> +	return -ENOSPC;
> +}
> +
> +static int _xe_eudebug_queue_event(struct xe_eudebug *d,
> +				   struct xe_eudebug_event *event,
> +				   gfp_t gfp)
> +{
> +	u64 start_t;
> +	int ret;
> +
> +	XE_BUG_ON(event->size <= sizeof(struct xe_eudebug_event));
> +	XE_BUG_ON(!event->type);
> +	XE_BUG_ON(event->type == DRM_XE_EUDEBUG_EVENT_READ);
> +
> +	ret = queue_event(d, &event);
> +	if (!ret)
> +		return 0;
> +
> +	start_t = ktime_get();
> +
> +	while (ret == -ENOSPC) {
> +		struct xe_eudebug_event *blocking;
> +
> +		ret = queue_event(d, &event);
> +		if (ret != -ENOSPC)
> +			break;
> +
> +		blocking = event_fifo_pending(d);
> +
> +		msleep(1 + 1 * event_fifo_num_events_peek(d));
> +
> +		/* restart timeout if we see progress on fifo */
> +		if (blocking && blocking != event_fifo_pending(d))
> +			start_t = ktime_get();
> +
> +		if (ktime_ms_delta(ktime_get(), start_t) >=
> +		    XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS)
> +			ret = -ETIMEDOUT;
> +	}
> +
> +	if (ret) {
> +		eu_warn(d, "event %llu queue failed (blocked %lld ms), disconnecting with %d",
> +			event ? event->seqno : 0,
> +			ktime_ms_delta(ktime_get(), start_t),
> +			ret);
> +		xe_eudebug_disconnect(d, ret);
> +	}
> +
> +	kfree(event);
> +
> +	return ret;
> +}
> +
> +static int xe_eudebug_queue_event(struct xe_eudebug *d,
> +				  struct xe_eudebug_event *event)
> +{
> +	return _xe_eudebug_queue_event(d, event, GFP_KERNEL);
> +}
> +
> +static struct xe_eudebug_handle *
> +alloc_handle(const int type, const void * const key)
> +{
> +	struct xe_eudebug_handle *h;
> +
> +	h = kzalloc(sizeof(*h), GFP_KERNEL);
> +	if (!h)
> +		return NULL;
> +
> +	h->key = (u64)key;
> +
> +	return h;
> +}
> +
> +static struct xe_eudebug_handle *
> +__find_handle(struct xe_eudebug_resource *r,
> +	      void *key)
> +{
> +	struct xe_eudebug_handle *h;
> +
> +	h = rhashtable_lookup_fast(&r->rh,
> +				   &key,
> +				   rhash_res);
> +	if (h) {
> +		XE_WARN_ON(!h->id);
> +		XE_WARN_ON(h != xa_load(&r->xa, h->id));
> +	}
> +
> +	return h;
> +}
> +
> +static int find_handle(struct xe_eudebug_resources *res,
> +		       const int type,
> +		       void *key)
> +{
> +	struct xe_eudebug_resource *r;
> +	struct xe_eudebug_handle *h;
> +	int id;
> +
> +	r = resource_from_type(res, type);
> +
> +	mutex_lock(&res->lock);
> +	h = __find_handle(r, key);
> +	id = h ? h->id : -ENOENT;
> +	mutex_unlock(&res->lock);
> +
> +	return id;
> +}
> +
> +static int xe_eudebug_add_handle(struct xe_eudebug *d,
> +				 int type,
> +				 void *p)
> +{
> +	struct xe_eudebug_resource *r;
> +	struct xe_eudebug_handle *h;
> +	int err;
> +
> +	if (xe_eudebug_detached(d))
> +		return -ENOTCONN;
> +
> +	h = alloc_handle(type, p);
> +	if (!h)
> +		return -ENOMEM;
> +
> +	r = resource_from_type(d->res, type);
> +
> +	mutex_lock(&d->res->lock);
> +	if (!__find_handle(r, p)) {
> +		err = xa_alloc(&r->xa, &h->id, h, xa_limit_31b, GFP_KERNEL);
> +
> +		if (h->id >= INT_MAX) {
> +			xa_erase(&r->xa, h->id);
> +			err = -ENOSPC;
> +		}
> +
> +		if (!err)
> +			err = rhashtable_insert_fast(&r->rh,
> +						     &h->rh_head,
> +						     rhash_res);
> +
> +		if (err)
> +			xa_erase(&r->xa, h->id);
> +	} else {
> +		err = -EEXIST;
> +	}
> +	mutex_unlock(&d->res->lock);
> +
> +	if (err) {
> +		kfree(h);
> +		XE_WARN_ON(err > 0);
> +		return err;
> +	}
> +
> +	return h->id;
> +}
> +
> +static long xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p)
> +{
> +	struct xe_eudebug_resource *r;
> +	struct xe_eudebug_handle *h, *xa_h;
> +	long ret;
> +
> +	if (xe_eudebug_detached(d))
> +		return -ENOTCONN;
> +
> +	r = resource_from_type(d->res, type);
> +
> +	mutex_lock(&d->res->lock);
> +	h = __find_handle(r, p);
> +	if (h) {
> +		ret = rhashtable_remove_fast(&r->rh,
> +					     &h->rh_head,
> +					     rhash_res);
> +		xa_h = xa_erase(&r->xa, h->id);
> +		XE_WARN_ON(ret);
> +		XE_WARN_ON(xa_h != h);
> +		if (!ret)
> +			ret = h->id;
> +	} else {
> +		ret = -ENOENT;
> +	}
> +	mutex_unlock(&d->res->lock);
> +
> +	kfree(h);
> +
> +	XE_WARN_ON(!ret);
> +
> +	return ret;
> +}
> +
> +static struct xe_eudebug_event *
> +xe_eudebug_create_event(struct xe_eudebug *d,
> +			u32 type, u32 flags, u32 size, gfp_t gfp)
> +{
> +	struct xe_eudebug_event *event;
> +
> +	XE_WARN_ON(size <= sizeof(*event));
> +
> +	event = kzalloc(size, gfp);
> +	if (!event)
> +		return NULL;
> +
> +	event->type = type;
> +	event->flags = flags;
> +	event->size = size;
> +	event->seqno = atomic_long_inc_return(&d->events.seqno);
> +
> +	return event;
> +}
> +
> +static long xe_eudebug_read_event(struct xe_eudebug *d,
> +				  const unsigned long arg,
> +				  const bool nonblock)
> +{
> +	struct drm_xe_eudebug_event __user * const user_orig =
> +		(void __user *)(arg);
> +	struct drm_xe_eudebug_event user_event;
> +	const struct xe_eudebug_event *event;
> +	long ret;
> +
> +	if (copy_from_user(&user_event, user_orig, sizeof(user_event)))
> +		return -EFAULT;
> +
> +	if (!user_event.type)
> +		return -EINVAL;
> +
> +	if (user_event.type > DRM_XE_EUDEBUG_EVENT_MAX_EVENT)
> +		return -EINVAL;
> +
> +	if (user_event.type != DRM_XE_EUDEBUG_EVENT_READ)
> +		return -EINVAL;
> +
> +	if (user_event.size < sizeof(*user_orig))
> +		return -EINVAL;
> +
> +	if (user_event.flags)
> +		return -EINVAL;
> +
> +	/* timeout as param */
> +	ret = wait_event_interruptible_timeout(d->events.write_done,
> +					       event_fifo_num_events_peek(d),
> +					       msecs_to_jiffies(10*10000));
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	spin_lock(&d->events.lock);
> +	event = event_fifo_pending(d);
> +	if (event) {
> +		if (user_event.size < event->size) {
> +			ret = -EMSGSIZE;
> +		} else if (!access_ok(user_orig, event->size)) {
> +			ret = -EFAULT;
> +		} else if (event_fifo_get(d) != event) {
> +			eu_warn(d, "internal fifo corruption");
> +			ret = -ENOTCONN;
> +		} else {
> +			ret = 0;
> +		}
> +	} else {
> +		ret = -ENOENT;
> +	}
> +	spin_unlock(&d->events.lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = __copy_to_user(user_orig, event, event->size);
> +	if (ret)
> +		ret = -EFAULT;
> +
> +	xe_eudebug_print_event(d, "read", event);
> +
> +	kfree(event);
> +
> +	return ret;
> +}
> +
> +static long xe_eudebug_ioctl(struct file *file,
> +			     unsigned int cmd,
> +			     unsigned long arg)
> +{
> +	struct xe_eudebug * const d = file->private_data;
> +	long ret;
> +
> +	switch (cmd) {
> +	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
> +		ret = xe_eudebug_read_event(d, arg,
> +					    file->f_flags & O_NONBLOCK);
> +		eu_dbg(d, "ioctl cmd=READ_EVENT ret=%ld\n", ret);
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct file_operations fops = {
> +	.owner		= THIS_MODULE,
> +	.llseek		= no_llseek,
> +	.release	= xe_eudebug_release,
> +	.poll		= xe_eudebug_poll,
> +	.read		= xe_eudebug_read,
> +	.unlocked_ioctl	= xe_eudebug_ioctl,
> +};
> +
> +static struct task_struct *find_get_target(const pid_t nr)
> +{
> +	struct task_struct *task;
> +
> +	rcu_read_lock();
> +	task = pid_task(find_pid_ns(nr, task_active_pid_ns(current)), PIDTYPE_PID);
> +	if (task)
> +		get_task_struct(task);
> +	rcu_read_unlock();
> +
> +	return task;
> +}
> +
> +
> +static int
> +xe_eudebug_connect(struct xe_device *xe,
> +		   struct drm_xe_eudebug_connect_param *param)
> +{
> +	const u64 known_open_flags = 0;
> +	struct xe_eudebug *d, *t = NULL;
> +	unsigned long f_flags = 0;
> +	bool allowed;
> +	int fd;
> +	int err;
> +
> +	if (!param->pid)
> +		return -EINVAL;
> +
> +	if (param->flags & ~known_open_flags)
> +		return -EINVAL;
> +
> +	if (param->version && param->version != DRM_XE_EUDEBUG_VERSION)
> +		return -EINVAL;
> +
> +	/* XXX: You get all for now */
> +	if (param->events)
> +		return -EINVAL;
> +
> +	if (param->extensions)
> +		return -EINVAL;
> +
> +	param->version = DRM_XE_EUDEBUG_VERSION;
> +
> +	if (!xe->eudebug.available)
> +		return -ENOTSUPP;
> +
> +	d = kzalloc(sizeof(*d), GFP_KERNEL);
> +	if (!d)
> +		return -ENOMEM;
> +
> +	kref_init(&d->ref);
> +	mutex_init(&d->lock);
> +	init_waitqueue_head(&d->events.write_done);
> +
> +	spin_lock_init(&d->events.lock);
> +	INIT_KFIFO(d->events.fifo);
> +
> +	d->res = xe_eudebug_resources_alloc();
> +	if (!d->res) {
> +		err = -ENOMEM;
> +		goto err_free;
> +	}
> +
> +	d->target_task = find_get_target(param->pid);
> +	if (!d->target_task) {
> +		err = -ENOENT;
> +		goto err_free_res;
> +	}
> +
> +	allowed = ptrace_may_access(d->target_task,
> +				    PTRACE_MODE_READ_REALCREDS);
> +	if (!allowed) {
> +		err = -EACCES;
> +		goto err_put_task;
> +	}
> +
> +	t = xe_eudebug_for_task_get(xe, d->target_task);
> +	if (t) {
> +		err = -EBUSY;
> +		goto err_put_task;
> +	}
> +
> +	d->xe = xe;
> +
> +	fd = anon_inode_getfd("[xe_eudebug]", &fops, d, f_flags);
> +	if (fd < 0) {
> +		err = fd;
> +		goto err_put_task;
> +	}
> +
> +	spin_lock(&xe->eudebug.lock);
> +	/* XXX handle the overflow without bailing out */
> +	if (xe->eudebug.session_count + 1 == 0) {
> +		spin_unlock(&xe->eudebug.lock);
> +		drm_err(&xe->drm, "debugger connections exhausted. (you need module reload)\n");
> +		err = -EBUSY;
> +		goto err_put_task;
> +	}
> +
> +	d->session = ++xe->eudebug.session_count;
> +	kref_get(&d->ref);
> +	list_add_tail_rcu(&d->connection_link, &xe->eudebug.list);
> +	spin_unlock(&xe->eudebug.lock);
> +
> +	eu_dbg(d, "connected session %lld", d->session);
> +
> +	return fd;
> +
> +err_put_task:
> +	if (t)
> +		xe_eudebug_put(t);
> +
> +	put_task_struct(d->target_task);
> +err_free_res:
> +	xe_eudebug_resources_free(d);
> +err_free:
> +	kfree(d);
> +
> +	return err;
> +}
> +
> +int xe_eudebug_connect_ioctl(struct drm_device *dev,
> +			     void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct drm_xe_eudebug_connect_param * const param = data;
> +	int ret = 0;
> +
> +	ret = xe_eudebug_connect(xe, param);
> +
> +	return ret;
> +}
> +
> +void xe_eudebug_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	spin_lock_init(&xe->eudebug.lock);
> +	INIT_LIST_HEAD(&xe->eudebug.list);
> +	xa_init_flags(&xe->clients.xa, XA_FLAGS_ALLOC1);
> +
> +	ret = drmm_mutex_init(&xe->drm, &xe->clients.lock);
> +	if (ret)
> +		drm_warn(&xe->drm,
> +			 "eudebug init failed: %d, debugger unavailable\n",
> +			 ret);
> +
> +	xe->eudebug.available = ret == 0;
> +}
> +
> +void xe_eudebug_fini(struct xe_device *xe)
> +{
> +	XE_WARN_ON(!list_empty_careful(&xe->eudebug.list));
> +	mutex_destroy(&xe->clients.lock);
> +}
> +
> +#define struct_member(T, member) (((T *)0)->member)
> +
> +#define write_member(T_out, ptr, member, value) { \
> +	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
> +	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
> +		     offsetof(typeof(T_out), member)); \
> +	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
> +	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
> +	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
> +	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \
> +	(ptr)->member = (value); \
> +	}
> +
> +static int send_open_event(struct xe_eudebug *d, u32 flags, const u64 handle)
> +{
> +	struct xe_eudebug_event *event;
> +	struct xe_eudebug_event_open *eo;
> +
> +	if (!handle)
> +		return -EINVAL;
> +
> +	if (XE_WARN_ON((long)handle >= INT_MAX))
> +		return -EINVAL;
> +
> +	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_OPEN,
> +					flags, sizeof(*eo), GFP_KERNEL);
> +	if (!event)
> +		return -ENOMEM;
> +
> +	eo = from_event(eo, event);
> +
> +	write_member(struct drm_xe_eudebug_event_client, eo,
> +		     client_handle, handle);
> +
> +	return xe_eudebug_queue_event(d, event);
> +}
> +
> +static int client_create_event(struct xe_eudebug *d, struct xe_file *xef)
> +{
> +	int ret;
> +
> +	ret = xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
> +
> +	if (ret > 0)
> +		ret = send_open_event(d, DRM_XE_EUDEBUG_EVENT_CREATE, ret);
> +
> +	return ret;
> +}
> +
> +static int client_destroy_event(struct xe_eudebug *d, struct xe_file *xef)
> +{
> +	int ret;
> +
> +	ret = xe_eudebug_remove_handle(d, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
> +	if (ret > 0)
> +		ret = send_open_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY, ret);
> +
> +	return ret;
> +}
> +
> +void xe_eudebug_file_open(struct xe_file *xef)
> +{
> +	struct xe_eudebug *d;
> +	int err;
> +
> +	d = xe_eudebug_get(xef);
> +	if (!d)
> +		return;
> +
> +	err = client_create_event(d, xef);
> +	if (err == -EEXIST)
> +		err = 0;
> +
> +	if (err) {
> +		eu_err(d, "error %d on eudebug_file_open, disconnecting", err);
> +		xe_eudebug_disconnect(d, err);
> +	}
> +
> +	xe_eudebug_put(d);
> +}
> +
> +void xe_eudebug_file_close(struct xe_file *xef)
> +{
> +	struct xe_eudebug *d;
> +	int err;
> +
> +	d = xe_eudebug_get(xef);
> +	if (!d)
> +		return;
> +
> +	err = client_destroy_event(d, xef);
> +	if (err) {
> +		eu_err(d, "error %d on eudebug_file_close, disconnecting", err);
> +		xe_eudebug_disconnect(d, err);
> +	}
> +
> +	xe_eudebug_put(d);
> +}
> +
> +static int send_vm_event(struct xe_eudebug *d, u32 flags,
> +			 const u64 client_handle,
> +			 const u64 vm_handle)
> +{
> +	struct xe_eudebug_event *event;
> +	struct xe_eudebug_event_vm *e;
> +
> +	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM,
> +					flags, sizeof(*e), GFP_KERNEL);
> +	if (!event)
> +		return -ENOMEM;
> +
> +	e = from_event(e, event);
> +
> +	write_member(struct drm_xe_eudebug_event_vm, e, client_handle, client_handle);
> +	write_member(struct drm_xe_eudebug_event_vm, e, vm_handle, vm_handle);
> +
> +	return xe_eudebug_queue_event(d, event);
> +}
> +
> +static int vm_create_event(struct xe_eudebug *d,
> +			   struct xe_file *xef, struct xe_vm *vm)
> +{
> +	int h_c, h_vm;
> +
> +	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
> +	if (h_c < 0)
> +		return h_c;
> +
> +	h_vm = xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm);
> +	if (h_vm < 0)
> +		return h_vm;
> +
> +	XE_WARN_ON(!h_c);
> +	XE_WARN_ON(!h_vm);
> +
> +	return send_vm_event(d, DRM_XE_EUDEBUG_EVENT_CREATE, h_c, h_vm);
> +}
> +
> +static int vm_destroy_event(struct xe_eudebug *d,
> +			    struct xe_file *xef, struct xe_vm *vm)
> +{
> +	int h_c, h_vm;
> +
> +	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
> +	if (h_c < 0) {
> +		XE_WARN_ON("no client found for vm");
> +		eu_warn(d, "no client found for vm");
> +		return h_c;
> +	}
> +
> +	h_vm = xe_eudebug_remove_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm);
> +	if (h_vm < 0)
> +		return h_vm;
> +
> +	XE_WARN_ON(!h_c);
> +	XE_WARN_ON(!h_vm);
> +
> +	return send_vm_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY, h_c, h_vm);
> +}
> +
> +void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm)
> +{
> +	struct xe_eudebug *d;
> +	int err;
> +
> +	d = xe_eudebug_get(xef);
> +	if (!d)
> +		return;
> +
> +	err = vm_create_event(d, xef, vm);
> +	if (err == -EEXIST || err == -ENOTCONN)
> +		err = 0;
> +
> +	if (err) {
> +		eu_err(d, "error %d on eudebug_vm_create, disconnecting", err);
> +		xe_eudebug_disconnect(d, err);
> +	}
> +
> +	xe_eudebug_put(d);
> +}
> +
> +void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
> +{
> +	struct xe_eudebug *d;
> +	int err;
> +
> +	d = xe_eudebug_get(xef);
> +	if (!d)
> +		return;
> +
> +	err = vm_destroy_event(d, xef, vm);
> +	if (err) {
> +		eu_err(d, "error %d on eudebug_vm_destroy, disconnecting", err);
> +		xe_eudebug_disconnect(d, err);
> +	}
> +
> +	xe_eudebug_put(d);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
> new file mode 100644
> index 000000000000..df577b581364
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eudebug.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_EUDEBUG_H_
> +
> +struct drm_device;
> +struct drm_file;
> +struct xe_device;
> +struct xe_file;
> +struct xe_vm;
> +
> +int xe_eudebug_connect_ioctl(struct drm_device *dev,
> +			     void *data,
> +			     struct drm_file *file);
> +
> +void xe_eudebug_init(struct xe_device *xe);
> +void xe_eudebug_fini(struct xe_device *xe);
> +
> +void xe_eudebug_file_open(struct xe_file *xef);
> +void xe_eudebug_file_close(struct xe_file *xef);
> +
> +void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm);
> +void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
> new file mode 100644
> index 000000000000..45dcb82a4cf0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
> @@ -0,0 +1,166 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_EUDEBUG_TYPES_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/kref.h>
> +#include <linux/kfifo.h>
> +#include <linux/completion.h>
> +#include <linux/wait.h>
> +#include <linux/xarray.h>
> +#include <linux/rbtree.h>
> +#include <linux/rhashtable.h>
> +
> +#include <uapi/drm/xe_drm.h>
> +
> +struct xe_device;
> +struct task_struct;
> +struct xe_eudebug_event;
> +
> +#define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 32
> +
> +/**
> + * struct xe_eudebug_event - Internal base event struct for eudebug
> + */
> +struct xe_eudebug_event {
> +	/** @ext: extensions for this event */
> +	struct xe_user_extension ext;
> +
> +	/** @type: message type */
> +	u32 type;
> +
> +	/** @flags: message flags */
> +	u32 flags;
> +
> +	/** @seqno: sequence number for ordering */
> +	u64 seqno;
> +
> +	/** @size: size of this event, including payload */
> +	u64 size;
> +
> +	/** @data: payload bytes */
> +	u8 data[];
> +} __packed;
> +
> +/**
> + * struct xe_eudebug_event_open - Internal event for client open/close
> + */
> +struct xe_eudebug_event_open {
> +	/** @base: base event */
> +	struct xe_eudebug_event base;
> +
> +	/** @client_handle: opaque handle for client */
> +	u64 client_handle;
> +} __packed;
> +
> +/**
> + * struct xe_eudebug_event_vm - Internal event for vm open/close
> + */
> +struct xe_eudebug_event_vm {
> +	/** @base: base event */
> +	struct xe_eudebug_event base;
> +
> +	/** @client_handle: client containing the vm open/close */
> +	u64 client_handle;
> +
> +	/** @vm_handle: vm handle it's open/close */
> +	u64 vm_handle;
> +} __packed;
> +
> +/**
> + * struct xe_eudebug_handle - eudebug resource handle
> + */
> +struct xe_eudebug_handle {
> +	/** @key: key value in rhashtable <key:id> */
> +	u64 key;
> +
> +	/** @id: opaque handle id for xarray <id:key> */
> +	int id;
> +
> +	/** @rh_head: rhashtable head */
> +	struct rhash_head rh_head;
> +};
> +
> +/**
> + * struct xe_eudebug_resource - Resource map for one resource
> + */
> +struct xe_eudebug_resource {
> +	/** @xa: xarrays for <id->key> */
> +	struct xarray xa;
> +
> +	/** @rh rhashtable for <key->id> */
> +	struct rhashtable rh;
> +};
> +
> +#define XE_EUDEBUG_RES_TYPE_CLIENT 0
> +#define XE_EUDEBUG_RES_TYPE_VM     1
> +#define XE_EUDEBUG_RES_TYPE_COUNT  (XE_EUDEBUG_RES_TYPE_VM + 1)
> +
> +/**
> + * struct xe_eudebug_resources - eudebug resources for all types
> + */
> +struct xe_eudebug_resources {
> +	/** @lock: guards access into rt */
> +	struct mutex lock;
> +
> +	/** @rt: resource maps for all types */
> +	struct xe_eudebug_resource rt[XE_EUDEBUG_RES_TYPE_COUNT];
> +};
> +
> +/**
> + * struct xe_eudebug - Top level struct for eudebug: the connection
> + */
> +struct xe_eudebug {
> +	/** @ref: kref counter for this struct */
> +	struct kref ref;
Should it even need a ref if we simply kill it on driver unload?
> +
> +	/** @rcu: rcu_head for rcu destruction */
> +	struct rcu_head rcu;
> +
> +	/** @connection_link: our link into the xe_device:eudebug.list */
> +	struct list_head connection_link;
> +
> +	/** @lock: guards access to last_error */
> +	struct mutex lock;
> +
> +	/** @last_error: the error that resulted in disconnect */
> +	int last_error;
> +
> +	/** @xe: the parent device we are serving */
> +	struct xe_device *xe;
> +
> +	/** @closed: if debug connection is closed (one way) */
> +	bool closed;
> +
> +	/** @target_task: the task that we are debugging */
> +	struct task_struct *target_task;
> +
> +	/** @res: the resource maps we track for target_task */
> +	struct xe_eudebug_resources *res;
> +
> +	/** @session: session number for this connection (for logs) */
> +	u64 session;
> +
> +	/** @events: kfifo queue of to-be-delivered events */
> +	struct {
> +		/** @lock: guards access to fifo */
> +		struct spinlock_t lock;
> +
> +		/** @fifo: queue of events pending */
> +		DECLARE_KFIFO(fifo,
> +			      struct xe_eudebug_event *,
> +			      CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE);
> +
> +		/** @write_done: waitqueue for signalling write to fifo */
> +		wait_queue_head_t write_done;
> +
> +		/** @event_seqno: seqno counter to stamp events for fifo */
> +		atomic_long_t seqno;
> +	} events;
> +
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bdf82d34eb66..93ffe7575655 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -27,6 +27,7 @@
>   #include "xe_res_cursor.h"
>   #include "xe_sync.h"
>   #include "xe_trace.h"
> +#include "xe_eudebug.h"
>   
>   #define TEST_VM_ASYNC_OPS_ERROR
>   
> @@ -1905,6 +1906,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, GEN8_PAGE_SIZE);
>   #endif
>   
> +	xe_eudebug_vm_create(xef, vm);
> +
>   	return 0;
>   }
>   
> @@ -1928,6 +1931,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>   	if (XE_IOCTL_ERR(xe, vm->preempt.num_engines))
>   		return -EBUSY;
>   
> +	xe_eudebug_vm_destroy(xef, vm);
> +
>   	mutex_lock(&xef->vm.lock);
>   	xa_erase(&xef->vm.xa, args->vm_id);
>   	mutex_unlock(&xef->vm.lock);
> diff --git a/include/uapi/drm/xe_drm_tmp.h b/include/uapi/drm/xe_drm_tmp.h
> new file mode 100644
> index 000000000000..9829cd724075
> --- /dev/null
> +++ b/include/uapi/drm/xe_drm_tmp.h
> @@ -0,0 +1,76 @@
> +#ifndef _UAPI_XE_DRM_TMP_H_
> +#define _UAPI_XE_DRM_TMP_H_
> +
> +#include "xe_drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +#define DRM_XE_EUDEBUG_CONNECT			0x5f
> +
> +#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect_param)
> +
> +/**
> + * Do a eudebug event read for a debugger connection.
> + *
> + * This ioctl is available in debug version 1.
> + */
> +#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT _IO('j', 0x0)
> +
> +/* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
> +struct drm_xe_eudebug_event {
> +	struct xe_user_extension ext;
> +
> +	__u32 type;
> +#define DRM_XE_EUDEBUG_EVENT_NONE     0
> +#define DRM_XE_EUDEBUG_EVENT_READ     1
> +#define DRM_XE_EUDEBUG_EVENT_OPEN     2
> +#define DRM_XE_EUDEBUG_EVENT_VM	      3
> +#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT DRM_XE_EUDEBUG_EVENT_VM
> +
> +	__u32 flags;
> +#define DRM_XE_EUDEBUG_EVENT_CREATE	(1 << 0)
> +#define DRM_XE_EUDEBUG_EVENT_DESTROY	(1 << 1)
> +#define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE (1 << 2)
> +
> +	__u64 seqno;
> +	__u64 size;
> +} __attribute__((packed));
> +
> +struct drm_xe_eudebug_event_client {
> +	struct drm_xe_eudebug_event base; /* .flags = CREATE/DESTROY */
> +
> +	__u64 client_handle; /* This is unique per debug connection */
> +} __attribute__((packed));
> +
> +struct drm_xe_eudebug_event_vm {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 vm_handle;
> +} __attribute__((packed));
> +
> +/*
> + * Debugger ABI (ioctl and events) Version History:
> + * 0 - No debugger available
> + * 1 - Initial version
> + */
> +#define DRM_XE_EUDEBUG_VERSION 1
> +
> +struct drm_xe_eudebug_connect_param {
> +	struct xe_user_extension ext;
> +
> +	__u64 pid; /* input: Target process ID */
> +	__u32 flags;
> +
> +	__u32 version; /* output: current ABI (ioctl / events) version */
> +	__u64 events;  /* input: event types to subscribe to */
> +	__u64 extensions; /* MBZ */
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _UAPI_XE_DRM_TMP_H_ */
