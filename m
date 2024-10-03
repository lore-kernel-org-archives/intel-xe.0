Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F1ECF855E
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 07:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805A210E7C6;
	Thu,  3 Oct 2024 07:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mAhKTS5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CC510E7BF
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Oct 2024 07:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727941090; x=1759477090;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GUgMgKojgYKUX8uEEpP91IGlT7XCgDX63bpbVAMEaA4=;
 b=mAhKTS5vbYfdF3DCXX7Ftq4Aeii9Z59gjX3WW7IsIVaPwBheOrsYGJDy
 QfiFoPTyt+D4W9lukZQJy40/FfqIdl23Q2EPueC+3Y590QQ/3yqClwIF+
 akfjwoAIu27Bns9dbK4nYxIyG/AbIJ7SgPxY7yFdNLhC76NZ7ivJgpuHd
 aU2zoc4fqrbhck7vuqaLlJrvdzcE72PF/JH1XXQgMtSs/3cbnbI8niG3x
 iDSHqSZWmg2zZn8dcqUHo29t9BiLy27Fbp1BD3ObsFF3zHO2nspu7ehu7
 /uP7GkvmgDHBIJHCLj3GuiAvropjBHKS/OtS09CvGVT/NtYCagpAusd0S A==;
X-CSE-ConnectionGUID: KeHxnhRrSjqLzMZCclZFSA==
X-CSE-MsgGUID: jnm0Wh9kREy3OXqDU6Xzkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26596666"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="26596666"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 00:38:09 -0700
X-CSE-ConnectionGUID: 5/i+XNlPSXOnpzoOUSUIWw==
X-CSE-MsgGUID: LdbFbKwrQkumOo0kpLWg4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="111729824"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 00:38:08 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 03/18] drm/xe/eudebug: Introduce discovery for resources
In-Reply-To: <Zv3oMj4rkhZHw5JZ@DUT025-TGLU.fm.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-4-mika.kuoppala@linux.intel.com>
 <Zv3oMj4rkhZHw5JZ@DUT025-TGLU.fm.intel.com>
Date: Thu, 03 Oct 2024 10:27:52 +0300
Message-ID: <87wmiphchz.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
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

> On Tue, Oct 01, 2024 at 05:42:51PM +0300, Mika Kuoppala wrote:
>> Debugger connection can happen way after the client has
>> created and destroyed arbitrary number of resources.
>> 
>> We need to playback all currently existing resources for the
>> debugger. The client is held until this so called discovery
>> process, executed by workqueue, is complete.
>> 
>> This patch is based on discovery work by Maciej Patelczyk
>> for i915 driver.
>> 
>> v2: - use rw_semaphore to block drm_ioctls during discovery (Matthew)
>>     - only lock according to ioctl at play (Dominik)
>> 
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Co-developed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c        |  10 +-
>>  drivers/gpu/drm/xe/xe_device.h        |  34 +++++++
>>  drivers/gpu/drm/xe/xe_device_types.h  |   6 ++
>>  drivers/gpu/drm/xe/xe_eudebug.c       | 135 +++++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_eudebug_types.h |   7 ++
>>  5 files changed, 185 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 5615e2c23bf6..ec5eedbbf320 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -215,8 +215,11 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>>  		return -ECANCELED;
>>  
>>  	ret = xe_pm_runtime_get_ioctl(xe);
>> -	if (ret >= 0)
>> +	if (ret >= 0) {
>> +		xe_eudebug_discovery_lock(xe, cmd);
>>  		ret = drm_ioctl(file, cmd, arg);
>> +		xe_eudebug_discovery_unlock(xe, cmd);
>> +	}
>>  	xe_pm_runtime_put(xe);
>>  
>>  	return ret;
>> @@ -233,8 +236,11 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
>>  		return -ECANCELED;
>>  
>>  	ret = xe_pm_runtime_get_ioctl(xe);
>> -	if (ret >= 0)
>> +	if (ret >= 0) {
>> +		xe_eudebug_discovery_lock(xe, cmd);
>>  		ret = drm_compat_ioctl(file, cmd, arg);
>> +		xe_eudebug_discovery_unlock(xe, cmd);
>> +	}
>>  	xe_pm_runtime_put(xe);
>>  
>>  	return ret;
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 4c3f0ebe78a9..b2fc85b1d26e 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -7,6 +7,7 @@
>>  #define _XE_DEVICE_H_
>>  
>>  #include <drm/drm_util.h>
>> +#include <drm/drm_ioctl.h>
>>  
>>  #include "xe_device_types.h"
>>  #include "xe_gt_types.h"
>> @@ -191,4 +192,37 @@ void xe_device_declare_wedged(struct xe_device *xe);
>>  struct xe_file *xe_file_get(struct xe_file *xef);
>>  void xe_file_put(struct xe_file *xef);
>>  
>> +#if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
>> +static inline int xe_eudebug_needs_lock(const unsigned int cmd)
>> +{
>> +	const unsigned int xe_cmd = DRM_IOCTL_NR(cmd) - DRM_COMMAND_BASE;
>> +
>> +	switch (xe_cmd) {
>> +	case DRM_XE_VM_CREATE:
>> +	case DRM_XE_VM_DESTROY:
>> +	case DRM_XE_VM_BIND:
>> +	case DRM_XE_EXEC_QUEUE_CREATE:
>> +	case DRM_XE_EXEC_QUEUE_DESTROY:
>> +	case DRM_XE_EUDEBUG_CONNECT:
>> +		return 1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static inline void xe_eudebug_discovery_lock(struct xe_device *xe, unsigned int cmd)
>> +{
>> +	if (xe_eudebug_needs_lock(cmd))
>> +		down_read(&xe->eudebug.discovery_lock);
>> +}
>> +static inline void xe_eudebug_discovery_unlock(struct xe_device *xe, unsigned int cmd)
>> +{
>> +	if (xe_eudebug_needs_lock(cmd))
>> +		up_read(&xe->eudebug.discovery_lock);
>> +}
>> +#else
>> +static inline void xe_eudebug_discovery_lock(struct xe_device *xe, unsigned int cmd) { }
>> +static inline void xe_eudebug_discovery_unlock(struct xe_device *xe, unsigned int cmd) { }
>> +#endif /* CONFIG_DRM_XE_EUDEBUG */
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index cb4b52888a4b..54ceeee7cf75 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -542,6 +542,12 @@ struct xe_device {
>>  
>>  		/** @available: is the debugging functionality available */
>>  		bool available;
>> +
>> +		/** @ordered_wq: used to discovery */
>> +		struct workqueue_struct *ordered_wq;
>> +
>> +		/** discovery_lock: used for discovery to block xe ioctls */
>> +		struct rw_semaphore discovery_lock;
>>  	} eudebug;
>>  #endif
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
>> index ea0cfd7697aa..c294e2c6152b 100644
>> --- a/drivers/gpu/drm/xe/xe_eudebug.c
>> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
>> @@ -299,6 +299,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
>>  	}
>>  	spin_unlock(&d->connection.lock);
>>  
>> +	flush_work(&d->discovery_work);
>> +
>>  	if (!detached)
>>  		return false;
>>  
>> @@ -409,7 +411,7 @@ static struct task_struct *find_task_get(struct xe_file *xef)
>>  }
>>  
>>  static struct xe_eudebug *
>> -xe_eudebug_get(struct xe_file *xef)
>> +_xe_eudebug_get(struct xe_file *xef)
>>  {
>>  	struct task_struct *task;
>>  	struct xe_eudebug *d;
>> @@ -433,6 +435,24 @@ xe_eudebug_get(struct xe_file *xef)
>>  	return d;
>>  }
>>  
>> +static struct xe_eudebug *
>> +xe_eudebug_get(struct xe_file *xef)
>> +{
>> +	struct xe_eudebug *d;
>> +
>> +	lockdep_assert_held(&xef->xe->eudebug.discovery_lock);
>> +
>> +	d = _xe_eudebug_get(xef);
>> +	if (d) {
>> +		if (!completion_done(&d->discovery)) {
>> +			xe_eudebug_put(d);
>> +			d = NULL;
>> +		}
>> +	}
>> +
>> +	return d;
>> +}
>> +
>>  static int xe_eudebug_queue_event(struct xe_eudebug *d,
>>  				  struct xe_eudebug_event *event)
>>  {
>> @@ -810,6 +830,10 @@ static long xe_eudebug_ioctl(struct file *file,
>>  	struct xe_eudebug * const d = file->private_data;
>>  	long ret;
>>  
>> +	if (cmd != DRM_XE_EUDEBUG_IOCTL_READ_EVENT &&
>> +	    !completion_done(&d->discovery))
>> +		return -EBUSY;
>> +
>>  	switch (cmd) {
>>  	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
>>  		ret = xe_eudebug_read_event(d, arg,
>> @@ -832,6 +856,8 @@ static const struct file_operations fops = {
>>  	.unlocked_ioctl	= xe_eudebug_ioctl,
>>  };
>>  
>> +static void discovery_work_fn(struct work_struct *work);
>> +
>>  static int
>>  xe_eudebug_connect(struct xe_device *xe,
>>  		   struct drm_xe_eudebug_connect *param)
>> @@ -866,9 +892,11 @@ xe_eudebug_connect(struct xe_device *xe,
>>  	spin_lock_init(&d->connection.lock);
>>  	init_waitqueue_head(&d->events.write_done);
>>  	init_waitqueue_head(&d->events.read_done);
>> +	init_completion(&d->discovery);
>>  
>>  	spin_lock_init(&d->events.lock);
>>  	INIT_KFIFO(d->events.fifo);
>> +	INIT_WORK(&d->discovery_work, discovery_work_fn);
>>  
>>  	d->res = xe_eudebug_resources_alloc();
>>  	if (IS_ERR(d->res)) {
>> @@ -886,6 +914,9 @@ xe_eudebug_connect(struct xe_device *xe,
>>  		goto err_detach;
>>  	}
>>  
>> +	kref_get(&d->ref);
>> +	queue_work(xe->eudebug.ordered_wq, &d->discovery_work);
>> +
>>  	eu_dbg(d, "connected session %lld", d->session);
>>  
>>  	return fd;
>> @@ -918,13 +949,18 @@ void xe_eudebug_init(struct xe_device *xe)
>>  	spin_lock_init(&xe->eudebug.lock);
>>  	INIT_LIST_HEAD(&xe->eudebug.list);
>>  	INIT_LIST_HEAD(&xe->clients.list);
>> +	init_rwsem(&xe->eudebug.discovery_lock);
>>  
>> -	xe->eudebug.available = true;
>> +	xe->eudebug.ordered_wq = alloc_ordered_workqueue("xe-eudebug-ordered-wq", 0);
>> +	xe->eudebug.available = !!xe->eudebug.ordered_wq;
>>  }
>>  
>>  void xe_eudebug_fini(struct xe_device *xe)
>>  {
>>  	xe_assert(xe, list_empty_careful(&xe->eudebug.list));
>> +
>> +	if (xe->eudebug.ordered_wq)
>> +		destroy_workqueue(xe->eudebug.ordered_wq);
>>  }
>>  
>>  static int send_open_event(struct xe_eudebug *d, u32 flags, const u64 handle,
>> @@ -990,21 +1026,25 @@ void xe_eudebug_file_open(struct xe_file *xef)
>>  	struct xe_eudebug *d;
>>  
>>  	INIT_LIST_HEAD(&xef->eudebug.client_link);
>> +
>> +	down_read(&xef->xe->eudebug.discovery_lock);
>> +
>>  	spin_lock(&xef->xe->clients.lock);
>>  	list_add_tail(&xef->eudebug.client_link, &xef->xe->clients.list);
>>  	spin_unlock(&xef->xe->clients.lock);
>>  
>>  	d = xe_eudebug_get(xef);
>
> This looks like this could deadlock.
>
> - discovery_work_fn is queued with &d->discovery not complete
> - This function runs and grabs &xef->xe->eudebug.discovery_lock in read
>   mode
> - completion_done(&d->discovery) is waited on xe_eudebug_get

If the completion is not done we just return NULL immediately.

Yes, previously when we actually used wait_for_completion() here
it was a problem. But in this version completion_done() does
not wait. Looking at completion_done(), the not done path is just
!READ_ONCE(x->done). Did you mean the taking the spinlock to
sync against the complete()?

-Mika

> - discovery_work_fn can't complete d->discovery) on
>   &xef->xe->eudebug.discovery_lock in write mode
>
> The summary is - it not safe to wait on '&d->discovery' while holding
> &xef->xe->eudebug.discovery_lock.
>
> Matt
>
>> -	if (!d)
>> -		return;
>> +	if (d)
>> +		xe_eudebug_event_put(d, client_create_event(d, xef));
>>  
>> -	xe_eudebug_event_put(d, client_create_event(d, xef));
>> +	up_read(&xef->xe->eudebug.discovery_lock);
>>  }
>>  
>>  void xe_eudebug_file_close(struct xe_file *xef)
>>  {
>>  	struct xe_eudebug *d;
>>  
>> +	down_read(&xef->xe->eudebug.discovery_lock);
>>  	d = xe_eudebug_get(xef);
>>  	if (d)
>>  		xe_eudebug_event_put(d, client_destroy_event(d, xef));
>> @@ -1012,6 +1052,8 @@ void xe_eudebug_file_close(struct xe_file *xef)
>>  	spin_lock(&xef->xe->clients.lock);
>>  	list_del_init(&xef->eudebug.client_link);
>>  	spin_unlock(&xef->xe->clients.lock);
>> +
>> +	up_read(&xef->xe->eudebug.discovery_lock);
>>  }
>>  
>>  static int send_vm_event(struct xe_eudebug *d, u32 flags,
>> @@ -1112,3 +1154,86 @@ void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
>>  
>>  	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
>>  }
>> +
>> +static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
>> +{
>> +	struct xe_vm *vm;
>> +	unsigned long i;
>> +	int err;
>> +
>> +	err = client_create_event(d, xef);
>> +	if (err)
>> +		return err;
>> +
>> +	xa_for_each(&xef->vm.xa, i, vm) {
>> +		err = vm_create_event(d, xef, vm);
>> +		if (err)
>> +			break;
>> +	}
>> +
>> +	return err;
>> +}
>> +
>> +static bool xe_eudebug_task_match(struct xe_eudebug *d, struct xe_file *xef)
>> +{
>> +	struct task_struct *task;
>> +	bool match;
>> +
>> +	task = find_task_get(xef);
>> +	if (!task)
>> +		return false;
>> +
>> +	match = same_thread_group(d->target_task, task);
>> +
>> +	put_task_struct(task);
>> +
>> +	return match;
>> +}
>> +
>> +static void discover_clients(struct xe_device *xe, struct xe_eudebug *d)
>> +{
>> +	struct xe_file *xef;
>> +	int err;
>> +
>> +	list_for_each_entry(xef, &xe->clients.list, eudebug.client_link) {
>> +		if (xe_eudebug_detached(d))
>> +			break;
>> +
>> +		if (xe_eudebug_task_match(d, xef))
>> +			err = discover_client(d, xef);
>> +		else
>> +			err = 0;
>> +
>> +		if (err) {
>> +			eu_dbg(d, "discover client %p: %d\n", xef, err);
>> +			break;
>> +		}
>> +	}
>> +}
>> +
>> +static void discovery_work_fn(struct work_struct *work)
>> +{
>> +	struct xe_eudebug *d = container_of(work, typeof(*d),
>> +					    discovery_work);
>> +	struct xe_device *xe = d->xe;
>> +
>> +	if (xe_eudebug_detached(d)) {
>> +		complete_all(&d->discovery);
>> +		xe_eudebug_put(d);
>> +		return;
>> +	}
>> +
>> +	down_write(&xe->eudebug.discovery_lock);
>> +
>> +	eu_dbg(d, "Discovery start for %lld\n", d->session);
>> +
>> +	discover_clients(xe, d);
>> +
>> +	eu_dbg(d, "Discovery end for %lld\n", d->session);
>> +
>> +	complete_all(&d->discovery);
>> +
>> +	up_write(&xe->eudebug.discovery_lock);
>> +
>> +	xe_eudebug_put(d);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
>> index a5185f18f640..080a821db3e4 100644
>> --- a/drivers/gpu/drm/xe/xe_eudebug_types.h
>> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
>> @@ -19,6 +19,7 @@
>>  struct xe_device;
>>  struct task_struct;
>>  struct xe_eudebug_event;
>> +struct workqueue_struct;
>>  
>>  #define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
>>  
>> @@ -96,6 +97,12 @@ struct xe_eudebug {
>>  	/** @session: session number for this connection (for logs) */
>>  	u64 session;
>>  
>> +	/** @discovery: completion to wait for discovery */
>> +	struct completion discovery;
>> +
>> +	/** @discovery_work: worker to discover resources for target_task */
>> +	struct work_struct discovery_work;
>> +
>>  	/** @events: kfifo queue of to-be-delivered events */
>>  	struct {
>>  		/** @lock: guards access to fifo */
>> -- 
>> 2.34.1
>> 
