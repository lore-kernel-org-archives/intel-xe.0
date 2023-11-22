Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0ADC61D97
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 13:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B7410E635;
	Wed, 22 Nov 2023 13:36:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1925610E635
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700660208; x=1732196208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pJZzYGeC8w2S5ZxclIsXmMA4BPBcNG9zaFq2qNuvkR0=;
 b=N+7VwsOHh3UOmqULsI0J5Yhl2ovrQSPCP3KU8QV3g8X6bqEzHCKgyye0
 ZA1LhInFkBuCNKeq8ydmVrwEsDi+yvLxNBgCdTze4oB2vYwo9BtIsA9Z6
 4uf+3CbQL153CtTfMat/LOfyVy8kDXDSzoI8Galhr999/nFKPLmE0dWK2
 Pni4At956dImX8x20J4hvZYXItgJELdiCPEmWEKL6k2ifuEvBjxjhWaCD
 nhHlK3JvmP5iD29ESn+FYqJl9JWCOMdQGoJ2LlhXgNVXFSfeQLp0pBp3g
 iaYA60+qw17zfCO947dmXpUvSx0/y+4aSp2k3kEGsDluRt0LO3fjXD8Ak g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382450366"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="382450366"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 05:36:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="833013581"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="833013581"
Received: from aconradi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.221.156])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 05:36:45 -0800
Date: Wed, 22 Nov 2023 14:36:42 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <ZV4D6lGJpt5jUv4-@ashyti-mobl2.lan>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
 <20231106111845.2333093-2-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106111845.2333093-2-mika.kuoppala@linux.intel.com>
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

Hi Mika,

On Mon, Nov 06, 2023 at 01:18:21PM +0200, Mika Kuoppala wrote:
...
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

please loop me in.

...

> @@ -74,7 +76,15 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
>  
>  	file->driver_priv = xef;
> -	return 0;
> +
> +	ret = xa_alloc(&xe->clients.xa, &xef->client_id, xef, xa_limit_32b, GFP_KERNEL);
> +
> +	if (!ret)
> +		xe_eudebug_file_open(xef);
> +	else
> +		kfree(xef);

why do we need to fail here? Just disable the debugger. Just set
eudebug->available = false.

> +
> +	return ret;
>  }
>  
>  static void device_kill_persistent_exec_queues(struct xe_device *xe,
> @@ -88,6 +98,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	struct xe_exec_queue *q;
>  	unsigned long idx;
>  
> +	xe_eudebug_file_close(xef);
> +
> +	mutex_lock(&xe->clients.lock);
> +	xa_erase(&xe->clients.xa, xef->client_id);
> +	mutex_unlock(&xe->clients.lock);

xa_erase does loc already, do we need the mutexes?

>  	mutex_lock(&xef->exec_queue.lock);
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>  		xe_exec_queue_kill(q);

...

> +	struct {
> +		/** @lock: protects the xa */
> +		struct mutex lock;
> +		/** @xa: xarray of xe_files currently open */
> +		struct xarray xa;

most of the operations on xa are already protected, do we really
need the lock?

> +	} clients;
> +

...

> +/*
> + * If there is no event being read in this time (for example gdb stuck)
> + * connection is forcibly disconnected. This releases the client as it was
> + * waiting to get space for event in fifo.
> + */

This comment is misleading... which time? Do you mean for a
"certain amount of time"?

> +#define XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS (10 * 1000)
> +
> +#define for_each_debugger_rcu(debugger, head) \
> +	list_for_each_entry_rcu((debugger), (head), connection_link)
> +
> +#define from_event(T, event) container_of((event), typeof(*(T)), base)

from event to what? I would call this cast_event()

> +#define to_event(e) (&(e)->base)

...

> +#define write_member(T_out, ptr, member, value) { \
> +	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
> +	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
> +		     offsetof(typeof(T_out), member)); \
> +	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
> +	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
> +	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
> +	/* memcpy(&ptr->member, &(value), sizeof(ptr->member));	*/ \

some spurious commenting here

/* ... */

> +	(ptr)->member = (value); \
> +	}

Is this really necessary? This is in the category of "extremely
safe" programming, but it's adding quite a lot of complexity for
just overwriting an '=' assignment operator

Besides, this piece of define does not belong to this file and if
you really really want it, please add a good comment with a
convincing explanation that this is needed.

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

I don't see much benefit on this wrapper either. Using directly
kfifo_peek() should be enough. Also because you still check the
return value of event_fifo_pending, so that you replace 3 lines
of code with 3 lines of code.

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

Same here.

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
> +	XE_WARN_ON(t < 0);
> +	XE_WARN_ON(t >= XE_EUDEBUG_RES_TYPE_COUNT);
> +
> +	return &res->rt[t];
> +}

same here? At this point this wrapper is completely useless.

> +static struct xe_eudebug_resources *
> +xe_eudebug_resources_alloc(void)
> +{
> +	struct xe_eudebug_resources *res;
> +	int err;
> +	int i;
> +
> +	res = kzalloc(sizeof(*res), GFP_KERNEL);
> +	if (!res)
> +		return ERR_PTR(-ENOMEM);
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

this can be

	if (err)
		goto out;

and the while destroy can be in the exit path.

> +	}
> +
> +out:
> +	if (err) {
> +		kfree(res);
> +		return ERR_PTR(err);
> +	}
> +
> +	return res;

this exit path is a bit complex I think you meant:

		for (i = 0... ) {
			int err;

			xa_init_flags()
			err = rhashtable_init(...)
			if (err)
				goto out;
		}

		return res;

	out
		while (i--) {
			xa_destroy(...);
			rhashtable_destroy(...);
		}

		kfree(res);

		return ERR_PTR(err);

Otherwise there is not even need for the goto at all, just break :-)

> +}
> +
> +static void res_free_fn(void *ptr, void *arg)
> +{
> +	XE_WARN_ON(ptr);

no need for the WARN_ON here.

> +	kfree(ptr);
> +}
> +
> +static void
> +xe_eudebug_resources_free(struct xe_eudebug *d)

xe_eudebug_destroy_resources() ?

> +{
> +	struct xe_eudebug_resources *res = d->res;
> +	struct xe_eudebug_handle *h;

...

> +static void xe_eudebug_free(struct kref *ref)

xe_eudebug_destroy() ?

free sounds more like "free memory", but here we are actually
destroying the session.

> +{
> +	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
> +	struct xe_eudebug_event *event;
> +
> +	while (kfifo_get(&d->events.fifo, &event))
> +		kfree(event);
> +
> +	xe_eudebug_resources_free(d);
> +	put_task_struct(d->target_task);
> +	mutex_destroy(&d->lock);
> +
> +	XE_WARN_ON(kfifo_len(&d->events.fifo));

I think this is an overkill.

> +	kfree_rcu(d, rcu);
> +}

...

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

why isn't this inside the previous 'if'?

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

...

> +static int _xe_eudebug_queue_event(struct xe_eudebug *d,
> +				   struct xe_eudebug_event *event,
> +				   gfp_t gfp)

is there anything different from GFP_KERNEL?

> +{
> +	u64 start_t;
> +	int ret;
> +
> +	XE_WARN_ON(event->len <= sizeof(struct xe_eudebug_event));
> +	XE_WARN_ON(!event->type);
> +	XE_WARN_ON(event->type == DRM_XE_EUDEBUG_EVENT_READ);
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

if (!ret)?

> +			break;
> +
> +		blocking = event_fifo_pending(d);
> +
> +		msleep(1 + 1 * event_fifo_num_events_peek(d));

fsleep()?

> +		/* restart timeout if we see progress on fifo */
> +		if (blocking && blocking != event_fifo_pending(d))
> +			start_t = ktime_get();
> +
> +		if (ktime_ms_delta(ktime_get(), start_t) >=
> +		    XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS)
> +			ret = -ETIMEDOUT;

this should still be -ENOSPC. Even though ENOSPC is more referred
to a device, rather than a list.

> +	}
> +
> +	if (ret) {
> +		eu_warn(d, "event %llu queue failed (blocked %lld ms), disconnecting with %d",
> +			event ? event->seqno : 0,
> +			ktime_ms_delta(ktime_get(), start_t),
> +			ret);
> +		xe_eudebug_disconnect(d, ret);

warn or err? we are disconnecting the debugger after this.

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

no, please, don't fool the 'const'. Just don't declare it as
const in the parameter list.

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
> +		XE_WARN_ON((int)h->id < 0);
> +		XE_WARN_ON(h != xa_load(&r->xa, h->id));

I find all these warnings unnecessary and this function too.

> +	}
> +
> +	return h;
> +}

...

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

this check should be made at the beginning of the function, just
to avoid allocating/de-allocating.

> +		err = xa_alloc(&r->xa, &h->id, h, xa_limit_31b, GFP_KERNEL);
> +
> +		if (h->id >= INT_MAX) {

how can an integer be higher than an integer?

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
> +	XE_WARN_ON(h->id == 0);

unnecessary.

> +	return h->id;
> +}

...

> +static long xe_eudebug_read_event(struct xe_eudebug *d,
> +				  const u64 arg,
> +				  const bool wait)
> +{
> +	struct drm_xe_eudebug_event __user * const user_orig =
> +		u64_to_user_ptr(arg);
> +	struct drm_xe_eudebug_event user_event;
> +	struct xe_eudebug_event *event;
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
> +	if (user_event.len < sizeof(*user_orig))
> +		return -EINVAL;
> +
> +	if (user_event.flags)
> +		return -EINVAL;
> +
> +	if (user_event.reserved)
> +		return -EINVAL;
> +
> +	if (wait)
> +		ret = wait_event_interruptible_timeout(d->events.write_done,
> +						       event_fifo_num_events_peek(d),
> +						       msecs_to_jiffies(10*10000));
> +	else
> +		ret = 0;

please initialize it at the declaration.

> +
> +	if (ret < 0)
> +		return ret;

...

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

available = !!ret;

> +}

...

> +static int send_open_event(struct xe_eudebug *d, u32 flags, const u64 handle)
> +{
> +	struct xe_eudebug_event *event;
> +	struct xe_eudebug_event_open *eo;
> +
> +	if (!handle)
> +		return -EINVAL;
> +
> +	if (XE_WARN_ON((long)handle >= INT_MAX))

just don't declare it as const.

> +		return -EINVAL;

...

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

'if (err && err != -EEXIST)' looks clearer. And it's valid for
all coming below.

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

eu_warn()?

> +		xe_eudebug_disconnect(d, err);
> +	}
> +
> +	xe_eudebug_put(d);
> +}

Andi
