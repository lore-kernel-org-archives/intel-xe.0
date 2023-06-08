Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCBAC7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 14:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C8E10E241;
	Thu,  8 Jun 2023 14:45:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC2B10E241
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686235526; x=1717771526;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OF6n1mJ+0ChgqESZYlYvarbbGbnKPrMjcTiU7k7vReM=;
 b=Ty695/MylD8hBex+fliAgoKMj4lL9nS8bG42gLoi5gDWT53DUHEoQH/V
 2xrTu5GvoZ13mrsVVVPTcJDlcbWYj84nJ3dYE3LKwo6tnhxzrIbJq3p+s
 f5hO69iiqMglGdOSHx/mn3RQwUCEbQEirivpFfWxj+cLJLvKIfBpfDTMV
 o12+S58+E6kxNhGEv4d4OkccsPBtNppQgH1IUgOJVES8JiyYTmzMfTQ1B
 CMgd8QEMwMrgjQeKbksfGxsxO+p3VBWtst1Nn0mVgzYOUtSbEn3Q++IfJ
 T4jFxV51b9nvhYtHQ4dAj0Im52lPih7+c+9dZiXOLBtr6zgQogyFqXDw7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="360672642"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="360672642"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:45:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="710012094"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="710012094"
Received: from cutzinge-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.251.211.208])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:45:23 -0700
Date: Thu, 8 Jun 2023 16:45:15 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <ZIHpexbIwGG/+91q@ashyti-mobl2.lan>
References: <20230502103550.1601556-1-mika.kuoppala@linux.intel.com>
 <20230502103550.1601556-2-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502103550.1601556-2-mika.kuoppala@linux.intel.com>
Subject: Re: [Intel-xe] [RFC 1/2] drm/xe/eudebug: Introduce eudebug support
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

Hi Mika,

On Tue, May 02, 2023 at 01:35:49PM +0300, Mika Kuoppala wrote:
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
> v2: - event printer removed (Maarten)
>     - trim down kfifo accessors (Maarten)
>     - xa_alloc spurious locking removed (Maarten)
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

please keep me in the loop.

[...]

>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
> +	struct xe_device *xe = to_xe_device(dev);
>  	struct xe_file *xef;
> +	int err;
>  
>  	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
>  	if (!xef)
> @@ -50,7 +54,15 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	xa_init_flags(&xef->engine.xa, XA_FLAGS_ALLOC1);
>  
>  	file->driver_priv = xef;
> -	return 0;
> +
> +	err = xa_alloc(&xe->clients.xa, &xef->client_id, xef, xa_limit_32b, GFP_KERNEL);
> +
> +	if (!err)
> +		xe_eudebug_file_open(xef);
> +	else
> +		kfree(xef);
> +
> +	return err;

this is an unusual error route. Normally it would be:

	err = xa_alloc(&xe->clients.xa, &xef->client_id, xef, xa_limit_32b, GFP_KERNEL);
	if (err) {
		kfree(xef);
		return err;
	}

	xe_eudebug_file_open(xef);

	return err;

Your choice.

>  }
>  
>  static void device_kill_persistent_engines(struct xe_device *xe,
> @@ -79,6 +91,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	mutex_unlock(&xef->vm.lock);
>  	mutex_destroy(&xef->vm.lock);
>  
> +	xe_eudebug_file_close(xef);
> +
> +	mutex_lock(&xe->clients.lock);
> +	xa_erase(&xe->clients.xa, xef->client_id);
> +	mutex_unlock(&xe->clients.lock);

do we need to lock here? xa_erase() is protected by spinlocks.

> +
>  	kfree(xef);
>  }

[...]

>  	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>  	bool d3cold_allowed;
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

xa should already have its own spinlock. Do we really need a
mutex here?

> +		/** @xa: xarray of xe_files currently open */
> +		struct xarray xa;
> +	} clients;
> +
>  	/* private: */
>  

[...]

> +/*
> + * This is racy as we dont take the lock for read but all the
> + * callsites can handle the race so we can live without lock.
> + */
> +__no_kcsan
> +static unsigned int
> +event_fifo_num_events_peek(const struct xe_eudebug * const d)

can you please use "locked" suffix to make it clear?

> +{
> +	return kfifo_len(&d->events.fifo);
> +}

[...]

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
> +	}

you could put this inside the "if (err)" above and return NULL
directly there without needing any extra "out:" label.

Or you could put everything outside here.

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

a bit difficult sometimes to follow with variables called t, h,
d, r... maybe a more meaningful name sould help.

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

[...]

> +static struct xe_eudebug *
> +xe_eudebug_get(struct xe_file *xef)
> +{
> +	struct xe_device *xe = xef_to_xe(xef);
> +	struct task_struct *task;
> +	struct xe_eudebug *d = NULL;
> +
> +	task = find_task_get(xef->drm->pid);

   if (!task)
   	return NULL;

and you don't need to initialize and the rest gets also easier.

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

[...]

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

as this parametric, you could use fsleep().

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

please, drop the const, it's not const at the caller and you
"lose" it at the cast.

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

[...]

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

where did you fish enotconn? Isn't this for networks? Maybe
einval would be more appropriate?

> +
> +	h = alloc_handle(type, p);
> +	if (!h)
> +		return -ENOMEM;

[...]

> +	spin_lock(&d->events.lock);
> +	event = event_fifo_pending(d);
> +	if (event) {
> +		if (user_event.size < event->size) {
> +			ret = -EMSGSIZE;

-EINVAL?

> +		} else if (!access_ok(user_orig, event->size)) {
> +			ret = -EFAULT;
> +		} else if (!kfifo_get(&d->events.fifo, &event)) {
> +			eu_warn(d, "internal fifo corruption");
> +			ret = -ENOTCONN;
> +		} else {
> +			ret = 0;
> +		}

[...]

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

just return xe_eudebug....()

Quite a bit to digest... it was just a quick look.

Andi
