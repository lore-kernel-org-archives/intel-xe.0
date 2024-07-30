Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669ACC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 14:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F58F10E533;
	Tue, 30 Jul 2024 14:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpU8Lnoi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0987C10E533
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722348864; x=1753884864;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BhM2k4iQtNA9rhJUjnNUZCRo2SqahM3SqC8e6rNwWKU=;
 b=EpU8LnoiwG9XO2Xo8TCIa6F8F/Fse2kxXTTOmeTtjccA7y2iD2r3hR7J
 DGN8TrrE11NslzTvuGQt58q3ENXzSyO8rOkmwJjEqPTbF716HtHPuXd4A
 5KCaNEwBg4uathBLm7zinBHgAEn1KlixKlfK342KS/JKY3lCvBwQdeyTd
 P+uUMe+S00v/hMKbY3VVOpX+NZM/0t8+4fKsdqIuEXdaomeo9zsQnIf5+
 znv2miyL6qGcc1djuJQ6cHWgXMmmRU7OH2PTNcHRCs/CxzH1RDyUgwlj+
 2w1Ioy5tECRJh4yh7M3bIAg4wrzclWEONFQ7RByK60PP3mqbe5Fnj1D+k g==;
X-CSE-ConnectionGUID: pTEFcbe7QrCSsseaBac7cg==
X-CSE-MsgGUID: kYwA6POzS8mwVkwGAu3oBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23956133"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23956133"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 07:14:23 -0700
X-CSE-ConnectionGUID: hfigLCf3T7e7kmIhK47Xcg==
X-CSE-MsgGUID: p+8uie/uSHuCg+DHITe7IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="55155701"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 07:14:22 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 13/21] drm/xe/eudebug: Add UFENCE events with acks
In-Reply-To: <ZqRB/aJGEiGWml+s@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-14-mika.kuoppala@linux.intel.com>
 <ZqRB/aJGEiGWml+s@DUT025-TGLU.fm.intel.com>
Date: Tue, 30 Jul 2024 17:05:30 +0300
Message-ID: <87plqvt1p1.fsf@mkuoppal-desk>
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

> On Fri, Jul 26, 2024 at 05:08:10PM +0300, Mika Kuoppala wrote:
>> When vma is in place, debugger needs to intercept before
>> userspace proceeds with the workload. For example to install
>> a breakpoint in a eu shader.
>> 
>> Attach debugger in xe_user_fence, send UFENCE event
>> and stall normal user fence signal path to yield if
>> there is debugger attached to ufence.
>> 
>> When ack (ioctl) is received for the corresponding seqno,
>> signal ufence.
>> 
>> v2: ufence worker in own workqueue
>> 
>
> Not a complete review again, just a couple of quick comments.
>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_eudebug.c       | 239 +++++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_eudebug.h       |   6 +
>>  drivers/gpu/drm/xe/xe_eudebug_types.h |  12 ++
>>  drivers/gpu/drm/xe/xe_exec.c          |   2 +-
>>  drivers/gpu/drm/xe/xe_sync.c          |  49 ++++--
>>  drivers/gpu/drm/xe/xe_sync.h          |   8 +-
>>  drivers/gpu/drm/xe/xe_sync_types.h    |  26 ++-
>>  drivers/gpu/drm/xe/xe_vm.c            |   4 +-
>>  include/uapi/drm/xe_drm_eudebug.h     |  15 +-
>>  9 files changed, 333 insertions(+), 28 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
>> index 8f0e6a56a65e..5dcb7c9464e9 100644
>> --- a/drivers/gpu/drm/xe/xe_eudebug.c
>> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
>> @@ -35,6 +35,7 @@
>>  #include "xe_vm.h"
>>  #include "xe_wa.h"
>>  #include "xe_force_wake.h"
>> +#include "xe_sync.h"
>>  
>>  /*
>>   * If there is no detected event read by userspace, during this period, assume
>> @@ -240,11 +241,115 @@ static void xe_eudebug_free(struct kref *ref)
>>  	kfree_rcu(d, rcu);
>>  }
>>  
>> -static void xe_eudebug_put(struct xe_eudebug *d)
>> +void xe_eudebug_put(struct xe_eudebug *d)
>>  {
>>  	kref_put(&d->ref, xe_eudebug_free);
>>  }
>>  
>> +struct xe_eudebug_ack {
>> +	struct rb_node rb_node;
>> +	u64 seqno;
>
> Here we have a seqno but then an RB tree for search which is a bit
> incongruent. Let me explain, seqno typically mean something which
> signals sequentially in order. But then you have RB tree for searching,
> if everything signaled in order a list would be sufficient.
>
> So without looking too much I think we want one of two things.
>
> 1. seqno + list
> 2. key + rb tree
>
> Make sense?
>
> Kinda a nit but naming matters in this case as a name implies in-order
> vs out-of-order signaling.

This is the seqno of event that was associated with ufence. If userspace
does multiple binds with ufences, it can then pinpoint, with ack ioctl,
the particular bind it wants to be released, with this seqno.

And userspace can ack out of sequence. As it can potentially
receive events out of sequence.

Would it help if it would be event_seqno instead of just seqno?

-Mika

>
> Matt
>
>> +	u64 ts_insert;
>> +	struct xe_user_fence *ufence;
>> +};
>> +
>> +#define fetch_ack(x) rb_entry(x, struct xe_eudebug_ack, rb_node)
>> +
>> +static int compare_ack(const u64 a, const u64 b)
>> +{
>> +	if (a < b)
>> +		return -1;
>> +	else if (a > b)
>> +		return 1;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ack_insert_cmp(struct rb_node * const node,
>> +			  const struct rb_node * const p)
>> +{
>> +	return compare_ack(fetch_ack(node)->seqno,
>> +			   fetch_ack(p)->seqno);
>> +}
>> +
>> +static int ack_lookup_cmp(const void * const key,
>> +			  const struct rb_node * const node)
>> +{
>> +	return compare_ack(*(const u64 *)key,
>> +			   fetch_ack(node)->seqno);
>> +}
>> +
>> +static struct xe_eudebug_ack *remove_ack(struct xe_eudebug *d, u64 seqno)
>> +{
>> +	struct rb_root * const root = &d->acks.tree;
>> +	struct rb_node *node;
>> +
>> +	spin_lock(&d->acks.lock);
>> +	node = rb_find(&seqno, root, ack_lookup_cmp);
>> +	if (node)
>> +		rb_erase(node, root);
>> +	spin_unlock(&d->acks.lock);
>> +
>> +	if (!node)
>> +		return NULL;
>> +
>> +	return rb_entry_safe(node, struct xe_eudebug_ack, rb_node);
>> +}
>> +
>> +static void ufence_signal_worker(struct work_struct *w)
>> +{
>> +	struct xe_user_fence * const ufence =
>> +		container_of(w, struct xe_user_fence, eudebug.worker);
>> +
>> +	if (READ_ONCE(ufence->signalled))
>> +		xe_sync_ufence_signal(ufence);
>> +
>> +	xe_sync_ufence_put(ufence);
>> +}
>> +
>> +static void kick_ufence_worker(struct xe_user_fence *f)
>> +{
>> +	INIT_WORK(&f->eudebug.worker, ufence_signal_worker);
>> +	queue_work(f->xe->eudebug.ordered_wq, &f->eudebug.worker);
>> +}
>> +
>> +static void handle_ack(struct xe_eudebug *d, struct xe_eudebug_ack *ack,
>> +		       bool on_disconnect)
>> +{
>> +	struct xe_user_fence *f = ack->ufence;
>> +	u64 signaller_ack, signalled_by;
>> +
>> +	signaller_ack = cmpxchg64(&f->eudebug.signalled_seqno, 0, ack->seqno);
>> +	signalled_by = f->eudebug.signalled_seqno;
>> +
>> +	if (!signaller_ack)
>> +		kick_ufence_worker(f);
>> +	else
>> +		xe_sync_ufence_put(f);
>> +
>> +	eu_dbg(d, "ACK: seqno=%llu: %ssignalled by %s (%llu) (held %lluus)",
>> +	       ack->seqno, signaller_ack ? "already " : "",
>> +	       on_disconnect ? "disconnect" : "debugger",
>> +	       signalled_by,
>> +	       ktime_us_delta(ktime_get(), ack->ts_insert));
>> +
>> +	kfree(ack);
>> +}
>> +
>> +static void release_acks(struct xe_eudebug *d)
>> +{
>> +	struct xe_eudebug_ack *ack, *n;
>> +	struct rb_root root;
>> +
>> +	spin_lock(&d->acks.lock);
>> +	root = d->acks.tree;
>> +	d->acks.tree = RB_ROOT;
>> +	spin_unlock(&d->acks.lock);
>> +
>> +	rbtree_postorder_for_each_entry_safe(ack, n, &root, rb_node)
>> +		handle_ack(d, ack, true);
>> +}
>> +
>>  static struct task_struct *find_get_target(const pid_t nr)
>>  {
>>  	struct task_struct *task;
>> @@ -328,6 +433,8 @@ static bool xe_eudebug_detach(struct xe_device *xe,
>>  
>>  	eu_dbg(d, "session %lld detached with %d", d->session, err);
>>  
>> +	release_acks(d);
>> +
>>  	/* Our ref with the connection_link */
>>  	xe_eudebug_put(d);
>>  
>> @@ -428,7 +535,7 @@ static struct task_struct *find_task_get(struct xe_file *xef)
>>  	return task;
>>  }
>>  
>> -static struct xe_eudebug *
>> +struct xe_eudebug *
>>  xe_eudebug_get(struct xe_file *xef)
>>  {
>>  	struct task_struct *task;
>> @@ -889,6 +996,44 @@ static long xe_eudebug_read_event(struct xe_eudebug *d,
>>  	return ret;
>>  }
>>  
>> +static long
>> +xe_eudebug_ack_event_ioctl(struct xe_eudebug *d,
>> +			   const unsigned int cmd,
>> +			   const u64 arg)
>> +{
>> +	struct drm_xe_eudebug_ack_event __user * const user_ptr =
>> +		u64_to_user_ptr(arg);
>> +	struct drm_xe_eudebug_ack_event user_arg;
>> +	struct xe_eudebug_ack *ack;
>> +	struct xe_device *xe = d->xe;
>> +
>> +	if (XE_IOCTL_DBG(xe, _IOC_SIZE(cmd) < sizeof(user_arg)))
>> +		return -EINVAL;
>> +
>> +	/* Userland write */
>> +	if (XE_IOCTL_DBG(xe, !(_IOC_DIR(cmd) & _IOC_WRITE)))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, copy_from_user(&user_arg,
>> +					    user_ptr,
>> +					    sizeof(user_arg))))
>> +		return -EFAULT;
>> +
>> +	if (XE_IOCTL_DBG(xe, user_arg.flags))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, xe_eudebug_detached(d)))
>> +		return -ENOTCONN;
>> +
>> +	ack = remove_ack(d, user_arg.seqno);
>> +	if (XE_IOCTL_DBG(xe, !ack))
>> +		return -EINVAL;
>> +
>> +	handle_ack(d, ack, false);
>> +
>> +	return 0;
>> +}
>> +
>>  static int do_eu_control(struct xe_eudebug *d,
>>  			 const struct drm_xe_eudebug_eu_control * const arg,
>>  			 struct drm_xe_eudebug_eu_control __user * const user_ptr)
>> @@ -1070,7 +1215,10 @@ static long xe_eudebug_ioctl(struct file *file,
>>  		ret = xe_eudebug_eu_control(d, arg);
>>  		eu_dbg(d, "ioctl cmd=EU_CONTROL ret=%ld\n", ret);
>>  		break;
>> -
>> +	case DRM_XE_EUDEBUG_IOCTL_ACK_EVENT:
>> +		ret = xe_eudebug_ack_event_ioctl(d, cmd, arg);
>> +		eu_dbg(d, "ioctl cmd=EVENT_ACK ret=%ld\n", ret);
>> +		break;
>>  	default:
>>  		ret = -EINVAL;
>>  	}
>> @@ -1759,6 +1907,9 @@ xe_eudebug_connect(struct xe_device *xe,
>>  	INIT_KFIFO(d->events.fifo);
>>  	INIT_WORK(&d->discovery_work, discovery_work_fn);
>>  
>> +	spin_lock_init(&d->acks.lock);
>> +	d->acks.tree = RB_ROOT;
>> +
>>  	d->res = xe_eudebug_resources_alloc();
>>  	if (IS_ERR(d->res)) {
>>  		err = PTR_ERR(d->res);
>> @@ -2337,6 +2488,70 @@ static int vm_bind_op(struct xe_eudebug *d, struct xe_vm *vm,
>>  	return 0;
>>  }
>>  
>> +static int xe_eudebug_track_ufence(struct xe_eudebug *d,
>> +				   struct xe_user_fence *f,
>> +				   u64 seqno)
>> +{
>> +	struct xe_eudebug_ack *ack;
>> +	struct rb_node *old;
>> +
>> +	ack = kzalloc(sizeof(*ack), GFP_KERNEL);
>> +	if (!ack)
>> +		return -ENOMEM;
>> +
>> +	ack->seqno = seqno;
>> +	ack->ts_insert = ktime_get();
>> +
>> +	spin_lock(&d->acks.lock);
>> +	old = rb_find_add(&ack->rb_node,
>> +			  &d->acks.tree, ack_insert_cmp);
>> +	if (!old) {
>> +		kref_get(&f->refcount);
>> +		ack->ufence = f;
>> +	}
>> +	spin_unlock(&d->acks.lock);
>> +
>> +	if (old) {
>> +		eu_dbg(d, "ACK: seqno=%llu: already exists", seqno);
>> +		kfree(ack);
>> +		return -EEXIST;
>> +	}
>> +
>> +	eu_dbg(d, "ACK: seqno=%llu: tracking started", seqno);
>> +
>> +	return 0;
>> +}
>> +
>> +static int vm_bind_ufence_event(struct xe_eudebug *d,
>> +				struct xe_user_fence *ufence)
>> +{
>> +	struct xe_eudebug_event *event;
>> +	struct xe_eudebug_event_vm_bind_ufence *e;
>> +	const u32 sz = sizeof(*e);
>> +	const u32 flags = DRM_XE_EUDEBUG_EVENT_CREATE |
>> +		DRM_XE_EUDEBUG_EVENT_NEED_ACK;
>> +	u64 seqno;
>> +	int ret;
>> +
>> +	seqno = atomic_long_inc_return(&d->events.seqno);
>> +
>> +	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
>> +					seqno, flags, sz, GFP_KERNEL);
>> +	if (!event)
>> +		return -ENOMEM;
>> +
>> +	e = cast_event(e, event);
>> +
>> +	write_member(struct drm_xe_eudebug_event_vm_bind_ufence,
>> +		     e, vm_bind_ref_seqno, ufence->eudebug.bind_ref_seqno);
>> +
>> +	ret = xe_eudebug_track_ufence(d, ufence, seqno);
>> +	if (!ret)
>> +		ret = xe_eudebug_queue_event(d, event);
>> +
>> +	return ret;
>> +}
>> +
>>  void xe_eudebug_vm_bind_start(struct xe_vm *vm)
>>  {
>>  	struct xe_eudebug *d;
>> @@ -2507,6 +2722,24 @@ void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int bind_err)
>>  		xe_eudebug_put(d);
>>  }
>>  
>> +int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence)
>> +{
>> +	struct xe_eudebug *d;
>> +	int err;
>> +
>> +	d = ufence->eudebug.debugger;
>> +	if (!d || xe_eudebug_detached(d))
>> +		return -ENOTCONN;
>> +
>> +	err = vm_bind_ufence_event(d, ufence);
>> +	if (err) {
>> +		eu_err(d, "error %d on %s", err, __func__);
>> +		xe_eudebug_disconnect(d, err);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int discover_client(struct xe_eudebug *d, struct xe_file *xef)
>>  {
>>  	struct xe_exec_queue *q;
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
>> index 2cab90773b21..3de54802a6ca 100644
>> --- a/drivers/gpu/drm/xe/xe_eudebug.h
>> +++ b/drivers/gpu/drm/xe/xe_eudebug.h
>> @@ -15,6 +15,7 @@ struct xe_vm;
>>  struct xe_vma;
>>  struct xe_exec_queue;
>>  struct xe_hw_engine;
>> +struct xe_user_fence;
>>  
>>  int xe_eudebug_connect_ioctl(struct drm_device *dev,
>>  			     void *data,
>> @@ -38,4 +39,9 @@ void xe_eudebug_vm_bind_start(struct xe_vm *vm);
>>  void xe_eudebug_vm_bind_op_add(struct xe_vm *vm, u32 op, u64 addr, u64 range);
>>  void xe_eudebug_vm_bind_end(struct xe_vm *vm, bool has_ufence, int err);
>>  
>> +int xe_eudebug_vm_bind_ufence(struct xe_user_fence *ufence);
>> +
>> +struct xe_eudebug *xe_eudebug_get(struct xe_file *xef);
>> +void xe_eudebug_put(struct xe_eudebug *d);
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
>> index 1ffe33f15409..a32c51416b5f 100644
>> --- a/drivers/gpu/drm/xe/xe_eudebug_types.h
>> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
>> @@ -86,6 +86,7 @@ struct xe_eudebug_eu_control_ops {
>>  	int (*stopped)(struct xe_eudebug *e, struct xe_exec_queue *q,
>>  		       struct xe_lrc *lrc, u8 *bitmap, unsigned int bitmap_size);
>>  };
>> +
>>  /**
>>   * struct xe_eudebug - Top level struct for eudebug: the connection
>>   */
>> @@ -149,6 +150,12 @@ struct xe_eudebug {
>>  		atomic_long_t seqno;
>>  	} events;
>>  
>> +	/* user fences tracked by this debugger */
>> +	struct {
>> +		spinlock_t lock;
>> +		struct rb_root tree;
>> +	} acks;
>> +
>>  	/** @ops operations for eu_control */
>>  	struct xe_eudebug_eu_control_ops *ops;
>>  };
>> @@ -286,4 +293,9 @@ struct xe_eudebug_event_vm_bind_op {
>>  	u64 range; /* Zero for unmap all ? */
>>  };
>>  
>> +struct xe_eudebug_event_vm_bind_ufence {
>> +	struct xe_eudebug_event base;
>> +	u64 vm_bind_ref_seqno;
>> +};
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>> index f36980aa26e6..400cb576f3b9 100644
>> --- a/drivers/gpu/drm/xe/xe_exec.c
>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>> @@ -157,7 +157,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>  	vm = q->vm;
>>  
>>  	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
>> -		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
>> +		err = xe_sync_entry_parse(xe, xef, vm, &syncs[num_syncs],
>>  					  &syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC |
>>  					  (xe_vm_in_lr_mode(vm) ?
>>  					   SYNC_PARSE_FLAG_LR_MODE : 0));
>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>> index 533246f42256..52d56bfdf932 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.c
>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>> @@ -18,17 +18,7 @@
>>  #include "xe_exec_queue.h"
>>  #include "xe_macros.h"
>>  #include "xe_sched_job_types.h"
>> -
>> -struct xe_user_fence {
>> -	struct xe_device *xe;
>> -	struct kref refcount;
>> -	struct dma_fence_cb cb;
>> -	struct work_struct worker;
>> -	struct mm_struct *mm;
>> -	u64 __user *addr;
>> -	u64 value;
>> -	int signalled;
>> -};
>> +#include "xe_eudebug.h"
>>  
>>  static void user_fence_destroy(struct kref *kref)
>>  {
>> @@ -36,6 +26,10 @@ static void user_fence_destroy(struct kref *kref)
>>  						 refcount);
>>  
>>  	mmdrop(ufence->mm);
>> +
>> +	if (ufence->eudebug.debugger)
>> +		xe_eudebug_put(ufence->eudebug.debugger);
>> +
>>  	kfree(ufence);
>>  }
>>  
>> @@ -49,7 +43,10 @@ static void user_fence_put(struct xe_user_fence *ufence)
>>  	kref_put(&ufence->refcount, user_fence_destroy);
>>  }
>>  
>> -static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>> +static struct xe_user_fence *user_fence_create(struct xe_device *xe,
>> +					       struct xe_file *xef,
>> +					       struct xe_vm *vm,
>> +					       u64 addr,
>>  					       u64 value)
>>  {
>>  	struct xe_user_fence *ufence;
>> @@ -58,7 +55,7 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>>  	if (!access_ok(ptr, sizeof(ptr)))
>>  		return ERR_PTR(-EFAULT);
>>  
>> -	ufence = kmalloc(sizeof(*ufence), GFP_KERNEL);
>> +	ufence = kzalloc(sizeof(*ufence), GFP_KERNEL);
>>  	if (!ufence)
>>  		return ERR_PTR(-ENOMEM);
>>  
>> @@ -69,12 +66,17 @@ static struct xe_user_fence *user_fence_create(struct xe_device *xe, u64 addr,
>>  	ufence->mm = current->mm;
>>  	mmgrab(ufence->mm);
>>  
>> +	if (vm->eudebug_bind.ref) {
>> +		ufence->eudebug.debugger = xe_eudebug_get(xef);
>> +		ufence->eudebug.bind_ref_seqno = vm->eudebug_bind.ref;
>> +	}
>> +
>>  	return ufence;
>>  }
>>  
>> -static void user_fence_worker(struct work_struct *w)
>> +void xe_sync_ufence_signal(struct xe_user_fence *ufence)
>>  {
>> -	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
>> +	XE_WARN_ON(!ufence->signalled);
>>  
>>  	if (mmget_not_zero(ufence->mm)) {
>>  		kthread_use_mm(ufence->mm);
>> @@ -85,7 +87,20 @@ static void user_fence_worker(struct work_struct *w)
>>  	}
>>  
>>  	wake_up_all(&ufence->xe->ufence_wq);
>> +}
>> +
>> +static void user_fence_worker(struct work_struct *w)
>> +{
>> +	struct xe_user_fence *ufence = container_of(w, struct xe_user_fence, worker);
>> +	int ret;
>> +
>>  	WRITE_ONCE(ufence->signalled, 1);
>> +
>> +	/* Lets see if debugger wants to track this */
>> +	ret = xe_eudebug_vm_bind_ufence(ufence);
>> +	if (ret)
>> +		xe_sync_ufence_signal(ufence);
>> +
>>  	user_fence_put(ufence);
>>  }
>>  
>> @@ -104,6 +119,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>>  }
>>  
>>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>> +			struct xe_vm *vm,
>>  			struct xe_sync_entry *sync,
>>  			struct drm_xe_sync __user *sync_user,
>>  			unsigned int flags)
>> @@ -185,7 +201,8 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>>  		if (exec) {
>>  			sync->addr = sync_in.addr;
>>  		} else {
>> -			sync->ufence = user_fence_create(xe, sync_in.addr,
>> +			sync->ufence = user_fence_create(xe, xef, vm,
>> +							 sync_in.addr,
>>  							 sync_in.timeline_value);
>>  			if (XE_IOCTL_DBG(xe, IS_ERR(sync->ufence)))
>>  				return PTR_ERR(sync->ufence);
>> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
>> index 256ffc1e54dc..f5bec2b1b4f6 100644
>> --- a/drivers/gpu/drm/xe/xe_sync.h
>> +++ b/drivers/gpu/drm/xe/xe_sync.h
>> @@ -9,8 +9,12 @@
>>  #include "xe_sync_types.h"
>>  
>>  struct xe_device;
>> -struct xe_exec_queue;
>>  struct xe_file;
>> +struct xe_exec_queue;
>> +struct drm_syncobj;
>> +struct dma_fence;
>> +struct dma_fence_chain;
>> +struct drm_xe_sync;
>>  struct xe_sched_job;
>>  struct xe_vm;
>>  
>> @@ -19,6 +23,7 @@ struct xe_vm;
>>  #define SYNC_PARSE_FLAG_DISALLOW_USER_FENCE	BIT(2)
>>  
>>  int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>> +			struct xe_vm *vm,
>>  			struct xe_sync_entry *sync,
>>  			struct drm_xe_sync __user *sync_user,
>>  			unsigned int flags);
>> @@ -40,5 +45,6 @@ struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
>>  struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
>>  void xe_sync_ufence_put(struct xe_user_fence *ufence);
>>  int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
>> +void xe_sync_ufence_signal(struct xe_user_fence *ufence);
>>  
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sync_types.h b/drivers/gpu/drm/xe/xe_sync_types.h
>> index 30ac3f51993b..907c601a6d8c 100644
>> --- a/drivers/gpu/drm/xe/xe_sync_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sync_types.h
>> @@ -7,12 +7,28 @@
>>  #define _XE_SYNC_TYPES_H_
>>  
>>  #include <linux/types.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/kref.h>
>> +#include <linux/dma-fence-array.h>
>>  
>> -struct drm_syncobj;
>> -struct dma_fence;
>> -struct dma_fence_chain;
>> -struct drm_xe_sync;
>> -struct user_fence;
>> +struct xe_eudebug;
>> +
>> +struct xe_user_fence {
>> +	struct xe_device *xe;
>> +	struct kref refcount;
>> +	struct dma_fence_cb cb;
>> +	struct work_struct worker;
>> +	struct mm_struct *mm;
>> +	u64 __user *addr;
>> +	u64 value;
>> +	int signalled;
>> +	struct {
>> +		struct xe_eudebug *debugger;
>> +		u64 bind_ref_seqno;
>> +		u64 signalled_seqno;
>> +		struct work_struct worker;
>> +	} eudebug;
>> +};
>>  
>>  struct xe_sync_entry {
>>  	struct drm_syncobj *syncobj;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 657a54b74eea..b117a892e386 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3049,9 +3049,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>  		}
>>  	}
>>  
>> +	xe_eudebug_vm_bind_start(vm);
>> +
>>  	syncs_user = u64_to_user_ptr(args->syncs);
>>  	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
>> -		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
>> +		err = xe_sync_entry_parse(xe, xef, vm, &syncs[num_syncs],
>>  					  &syncs_user[num_syncs],
>>  					  (xe_vm_in_lr_mode(vm) ?
>>  					   SYNC_PARSE_FLAG_LR_MODE : 0) |
>> diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
>> index 789c8aa81c09..1875192e92bd 100644
>> --- a/include/uapi/drm/xe_drm_eudebug.h
>> +++ b/include/uapi/drm/xe_drm_eudebug.h
>> @@ -17,6 +17,7 @@ extern "C" {
>>   */
>>  #define DRM_XE_EUDEBUG_IOCTL_READ_EVENT		_IO('j', 0x0)
>>  #define DRM_XE_EUDEBUG_IOCTL_EU_CONTROL		_IOWR('j', 0x2, struct drm_xe_eudebug_eu_control)
>> +#define DRM_XE_EUDEBUG_IOCTL_ACK_EVENT		_IOW('j', 0x4, struct drm_xe_eudebug_ack_event)
>>  
>>  /* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
>>  struct drm_xe_eudebug_event {
>> @@ -31,7 +32,8 @@ struct drm_xe_eudebug_event {
>>  #define DRM_XE_EUDEBUG_EVENT_EU_ATTENTION	5
>>  #define DRM_XE_EUDEBUG_EVENT_VM_BIND		6
>>  #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP		7
>> -#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_VM_BIND_OP
>> +#define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
>> +#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE
>>  
>>  	__u16 flags;
>>  #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
>> @@ -158,6 +160,17 @@ struct drm_xe_eudebug_event_vm_bind_op {
>>  	__u64 range; /* XXX: Zero for unmap all? */
>>  };
>>  
>> +struct drm_xe_eudebug_event_vm_bind_ufence {
>> +	struct drm_xe_eudebug_event base;
>> +	__u64 vm_bind_ref_seqno; /* *_event_vm_bind.base.seqno */
>> +};
>> +
>> +struct drm_xe_eudebug_ack_event {
>> +	__u32 type;
>> +	__u32 flags; /* MBZ */
>> +	__u64 seqno;
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>> -- 
>> 2.34.1
>> 
