Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B2ECE8E7E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 14:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1CD10E94C;
	Thu, 24 Oct 2024 14:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X45HYyBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6748C10E94A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729779850; x=1761315850;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=bfjkPtiiL0liSxxn5SyBOiFq7+diqbFXvYYdyfjxJHE=;
 b=X45HYyBeV3NhITux5aAn2fEfWDTAMX6zY33/GnHd/DuuK6RjEmVcU5I4
 6wM4kKR6pRgj3w6GIFXTnbV+7+hViAEgm1REGUasZm5+KVNCCLYSWNYMx
 vMuKkljI1M8QRMgEk+JU6P92n0kTdi6T03LMaeCj0cACRyhrizsdyYHcj
 tAghLMks3r1BQPhBHGSVOxbE5YEKUuG8TDIXsgFglkPujrFKXGMMyV/YE
 ZMxCFjin+Ym452h/mFix9xhDm8xP+CRM9EPlYAvQXPdjzrDGAjft1aeHs
 mwpNoPPfws/esa7Ie0i6CnJOJH29VKqtetgfrmSTyQz8uEBPcxLv6x5ge Q==;
X-CSE-ConnectionGUID: Mr09kUteTVeA1WzHN6bHyQ==
X-CSE-MsgGUID: RV/8ulqcRNGWuMb7Jg70EQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="40779476"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208,217";a="40779476"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 07:24:10 -0700
X-CSE-ConnectionGUID: hc+guZ6pRdKtkUzF7+t0nw==
X-CSE-MsgGUID: Zm6s1lOhQY6aHGJgG4JBUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208,217";a="80257610"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.128.192])
 ([10.245.128.192])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 07:24:06 -0700
Content-Type: multipart/alternative;
 boundary="------------xyrYQW5IEfUlN1PmYdjrqKMs"
Message-ID: <d0b2a205-a595-430c-a8f1-aecb3730894b@linux.intel.com>
Date: Thu, 24 Oct 2024 16:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 19/19] drm/xe/eudebug: Support EU online debug on pagefault
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, matthew.brost@intel.com, stuart.summers@intel.com,
 christoph.manszewski@intel.com, mika.kuoppala@linux.intel.com,
 dominik.grzegorzek@intel.com, andrzej.hajda@intel.com,
 maciej.patelczyk@intel.com
References: <20241021095904.439555-1-gwan-gyeong.mun@intel.com>
 <20241021095904.439555-20-gwan-gyeong.mun@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241021095904.439555-20-gwan-gyeong.mun@intel.com>
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

This is a multi-part message in MIME format.
--------------xyrYQW5IEfUlN1PmYdjrqKMs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(Just looking at this patch not the whole series)

On 10/21/2024 11:58 AM, Gwan-gyeong Mun wrote:
> When the EU debugger is connected, if a page fault occurs,
> the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event is passed to the client
> connected to the debugger after handling the pagefault WA.
>
> The pagefault WA is a mechanism that allows a stalled EU thread to enter
> SIP mode by installing a temporary page in the page table for the ppgtt
> address where the pagefault occurred.
>
> The pagefault eudebug event passed to the client follows the newly added
> struct drm_xe_eudebug_event_pagefault type.
> When a pagefault occurs, it prevents to send the
> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION event to the client during
> pagefault WA processing.

This patch is big and contains two functionality, event passing to debugger and page fault handling when

debugger is attach. I think this should be split into 2 or more patches.

>
> The page fault event delivery follows the below policy.
> (1) If EU Debugger discovery has been completed, pagefault handler delivers
>     pagefault event directly.
> (2) If a pagefault occurs during eu debugger discovery process, pagefault
>     handler queues a pagefault event and sends the queued event when
>     discovery is completed
>
> The thread where the pagefault occurred will be notified only once,
> for an event with the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event type.
>
> Information about EU threads where a pagefault occurred is passed to the
> client only once for each event with the
> DRM_XE_EUDEBUG_EVENT_PAGEFAULT event type.
> Of course, if a pagefault occurs for a new thread, a new pagefault event
> will be passed to the client. It is also possible that a pagefault WA for
> multiple EU threads is processed and delivered for a single pagefault event
>
> The eu attention event is sent by the attention workqueue whenever the
> attention bit is turned on, and the eu attention event is also delivered
> to the client when the attention bit is turned on by a pagefault event.
> In this case, the pagefault event is always processed before
> the eu attention event.
>
> And when the client receives the eu attention event, the client can
> spot the thread where the page fault occurred as a previously
> delivered event, so it can spot that the attention bit is turned on by
> the breakpoint for threads other than the thread where the page fault
> occurred.
>
> Adding a temporary null page follows [1].
>
> A brief description of the page fault handling mechanism flow between KMD
> and the eu thread is as follows
>
> (1) EU Thread accesses unallocated memory
> (2) Pagefault occurs, EU Thread is stopped
> (3) XE kmd set an force EU Thread exception to allow the running EU Thread
>     to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
>     TD_CTL register)
>     EU Threads that are not stopped enter SIP mode
> (4) XE kmd installs temporary page at the address where pagefault occurred
>     of ppgtt pagetable
> (5) XE kmd replies Pagefault message to GUC
> (6) stopped EU Thread resumes when pagefault is resolved
> (7) resumed eu thread enters SIP mode due to force exception set by (3)
>
> [1] https://patchwork.freedesktop.org/patch/555097
>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_eudebug.c       | 254 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_eudebug.h       |  17 ++
>  drivers/gpu/drm/xe/xe_eudebug_types.h |  66 ++++++
>  drivers/gpu/drm/xe/xe_gt_debug.c      |  48 +++++
>  drivers/gpu/drm/xe/xe_gt_debug.h      |  13 ++
>  drivers/gpu/drm/xe/xe_gt_pagefault.c  | 281 +++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_vm.c            |  21 ++
>  drivers/gpu/drm/xe/xe_vm.h            |   2 +
>  include/uapi/drm/xe_drm_eudebug.h     |  12 ++
>  9 files changed, 706 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index 5ec9dac9edd5..4538fa28e755 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -236,10 +236,17 @@ static void xe_eudebug_free(struct kref *ref)
>  {
>  	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
>  	struct xe_eudebug_event *event;
> +	struct xe_eudebug_pagefault *pf, *pf_temp;
>  
>  	while (kfifo_get(&d->events.fifo, &event))
>  		kfree(event);
>  
> +	/* Since it's the last reference no race here */
> +	list_for_each_entry_safe(pf, pf_temp, &d->pagefaults, list) {
> +		xe_exec_queue_put(pf->q);
> +		kfree(pf);
> +	}
> +
>  	xe_eudebug_destroy_resources(d);
>  	put_task_struct(d->target_task);
>  
> @@ -590,6 +597,12 @@ xe_eudebug_get(struct xe_file *xef)
>  	return d;
>  }
>  
> +struct xe_eudebug *
> +xe_eudebug_get_for_debugger(struct xe_file *xef)
> +{
> +	return _xe_eudebug_get(xef);
> +}
> +
>  static int xe_eudebug_queue_event(struct xe_eudebug *d,
>  				  struct xe_eudebug_event *event)
>  {
> @@ -1064,6 +1077,7 @@ static int do_eu_control(struct xe_eudebug *d,
>  	struct xe_device *xe = d->xe;
>  	u8 *bits = NULL;
>  	unsigned int hw_attn_size, attn_size;
> +	struct dma_fence *pagefault_fence;
>  	struct xe_exec_queue *q;
>  	struct xe_file *xef;
>  	struct xe_lrc *lrc;
> @@ -1129,6 +1143,23 @@ static int do_eu_control(struct xe_eudebug *d,
>  
>  	ret = -EINVAL;
>  	mutex_lock(&d->eu_lock);
> +	rcu_read_lock();
> +	pagefault_fence = dma_fence_get_rcu_safe(&d->pagefault_fence);
> +	rcu_read_unlock();
> +
> +	while (pagefault_fence) {
> +		mutex_unlock(&d->eu_lock);
> +		ret = dma_fence_wait(pagefault_fence, true);
> +		dma_fence_put(pagefault_fence);
> +
> +		if (ret)
> +			goto out_free;
> +
> +		mutex_lock(&d->eu_lock);
> +		rcu_read_lock();
> +		pagefault_fence = dma_fence_get_rcu_safe(&d->pagefault_fence);
> +		rcu_read_unlock();
> +	}
>  
>  	switch (arg->cmd) {
>  	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL:
> @@ -2008,6 +2039,8 @@ xe_eudebug_connect(struct xe_device *xe,
>  	kref_init(&d->ref);
>  	spin_lock_init(&d->connection.lock);
>  	mutex_init(&d->eu_lock);
> +	mutex_init(&d->pf_lock);
> +	INIT_LIST_HEAD(&d->pagefaults);
>  	init_waitqueue_head(&d->events.write_done);
>  	init_waitqueue_head(&d->events.read_done);
>  	init_completion(&d->discovery);
> @@ -3359,6 +3392,8 @@ static void discover_clients(struct xe_device *xe, struct xe_eudebug *d)
>  	}
>  }
>  
> +static int xe_eudebug_handle_pagefault_list(struct xe_eudebug *d);
> +
>  static void discovery_work_fn(struct work_struct *work)
>  {
>  	struct xe_eudebug *d = container_of(work, typeof(*d),
> @@ -3383,6 +3418,8 @@ static void discovery_work_fn(struct work_struct *work)
>  
>  	up_write(&xe->eudebug.discovery_lock);
>  
> +	xe_eudebug_handle_pagefault_list(d);
> +
>  	xe_eudebug_put(d);
>  }
>  
> @@ -3888,6 +3925,223 @@ xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg)
>  	return ret;
>  }
>  
> +struct xe_exec_queue *
> +xe_eudebug_runalone_active_debuggable_queue_get(struct xe_gt *gt, int *lrc_idx)
> +{
> +	struct xe_exec_queue *q;
> +	int idx;
> +
> +	q = runalone_active_queue_get(gt, &idx);
> +	if (IS_ERR(q))
> +		return q;
> +
> +	if (!xe_exec_queue_is_debuggable(q)) {
> +		xe_exec_queue_put(q);
> +		return ERR_PTR(-EPERM);
> +	}
> +
> +	*lrc_idx = idx;
> +
> +	return q;
> +}
> +
> +void xe_eudebug_attention_scan_pause(struct xe_gt *gt)
> +{
> +	attention_scan_cancel(gt_to_xe(gt));
> +}
> +
> +void xe_eudebug_attention_scan_resume(struct xe_gt *gt)
> +{
> +	attention_scan_flush(gt_to_xe(gt));
> +}
> +
> +static int send_pagefault_event(struct xe_eudebug *d, struct xe_eudebug_pagefault *pf)
> +{
> +	struct xe_eudebug_event_pagefault *ep;
> +	struct xe_eudebug_event *event;
> +	int h_c, h_queue, h_lrc;
> +	u32 size = xe_gt_eu_attention_bitmap_size(pf->q->gt) * 3;
> +	u32 sz = struct_size(ep, bitmask, size);
> +
> +	XE_WARN_ON(pf->lrc_idx < 0 || pf->lrc_idx >= pf->q->width);
> +
> +	XE_WARN_ON(!xe_exec_queue_is_debuggable(pf->q));
> +
> +	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, pf->q->vm->xef);
> +	if (h_c < 0)
> +		return h_c;
> +
> +	h_queue = find_handle(d->res, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, pf->q);
> +	if (h_queue < 0)
> +		return h_queue;
> +
> +	h_lrc = find_handle(d->res, XE_EUDEBUG_RES_TYPE_LRC, pf->q->lrc[pf->lrc_idx]);
> +	if (h_lrc < 0)
> +		return h_lrc;
> +
> +	event = __xe_eudebug_create_event(d, 0, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
> +					  0, sz, GFP_KERNEL);
> +
> +	if (!event)
> +		return -ENOSPC;
> +
> +	ep = cast_event(ep, event);
> +	write_member(struct xe_eudebug_event_pagefault, ep, client_handle, (u64)h_c);
> +	write_member(struct xe_eudebug_event_pagefault, ep, exec_queue_handle, (u64)h_queue);
> +	write_member(struct xe_eudebug_event_pagefault, ep, lrc_handle, (u64)h_lrc);
> +	write_member(struct xe_eudebug_event_pagefault, ep, bitmask_size, size);
> +	write_member(struct xe_eudebug_event_pagefault, ep, page_fault_address, pf->fault.addr);
> +
> +	memcpy(ep->bitmask, pf->attentions.before.att, pf->attentions.before.size);
> +	memcpy(ep->bitmask + pf->attentions.before.size,
> +	       pf->attentions.after.att, pf->attentions.after.size);
> +	memcpy(ep->bitmask + pf->attentions.before.size + pf->attentions.after.size,
> +	       pf->attentions.resolved.att, pf->attentions.resolved.size);
> +
> +	event->seqno = atomic_long_inc_return(&d->events.seqno);
> +
> +	return xe_eudebug_queue_event(d, event);
> +}
> +
> +static int xe_eudebug_queue_page_fault(struct xe_gt *gt, struct xe_eudebug_pagefault *pf)
> +{
> +	struct xe_eudebug *d;
> +	struct xe_exec_queue *q;
> +	int ret, lrc_idx;
> +
> +	if (list_empty_careful(&gt_to_xe(gt)->eudebug.list))
> +		return -ENOTCONN;
> +
> +	q = runalone_active_queue_get(gt, &lrc_idx);
> +	if (IS_ERR(q))
> +		return PTR_ERR(q);
> +
> +	if (!xe_exec_queue_is_debuggable(q)) {
> +		ret = -EPERM;
> +		goto out_exec_queue_put;
> +	}
> +
> +	d = _xe_eudebug_get(q->vm->xef);
> +	if (!d) {
> +		ret = -ENOTCONN;
> +		goto out_exec_queue_put;
> +	}
> +
> +	if (!completion_done(&d->discovery)) {
> +		eu_dbg(d, "discovery not yet done\n");
> +		ret = -EBUSY;
> +		goto out_eudebug_put;
> +	}
> +
> +	ret = send_pagefault_event(d, pf);
> +	if (ret)
> +		xe_eudebug_disconnect(d, ret);
> +
> +out_eudebug_put:
> +	xe_eudebug_put(d);
> +out_exec_queue_put:
> +	xe_exec_queue_put(q);
> +
> +	return ret;
> +}
> +
> +static int xe_eudebug_add_pagefault_list(struct xe_gt *gt, struct xe_eudebug_pagefault *pf)
> +{
> +	struct xe_eudebug *d;
> +
> +	if (list_empty_careful(&gt_to_xe(gt)->eudebug.list))
> +		return -ENOTCONN;
> +
> +	d = _xe_eudebug_get(pf->q->vm->xef);
> +	if (IS_ERR_OR_NULL(d))
> +		return -EINVAL;
> +
> +	mutex_lock(&d->pf_lock);
> +	list_add_tail(&pf->list, &d->pagefaults);
> +	mutex_unlock(&d->pf_lock);
> +
> +	xe_eudebug_put(d);
> +
> +	return 0;
> +}
> +
> +static int xe_eudebug_handle_pagefault_list(struct xe_eudebug *d)
> +{
> +	struct xe_eudebug_pagefault *pf, *pf_temp;
> +	int ret = 0;
> +
> +	mutex_lock(&d->pf_lock);
> +	list_for_each_entry_safe(pf, pf_temp, &d->pagefaults, list) {
> +		struct xe_gt *gt =pf->q->gt;
> +
> +		ret = xe_eudebug_queue_page_fault(gt, pf);
> +		/* decrease the reference count of xe_exec_queue obtained from pagefault handler */
> +		xe_exec_queue_put(pf->q);
> +		list_del(&pf->list);
> +		kfree(pf);
> +
> +		if (ret)
> +			break;
> +	}
> +	mutex_unlock(&d->pf_lock);
> +
> +	return ret;
> +}
> +
> +int xe_eudebug_handle_page_fault(struct xe_gt *gt, struct xe_eudebug_pagefault *pf)
> +{
> +	int ret;
> +
> +	ret = xe_eudebug_queue_page_fault(gt, pf);
> +
> +	/* if debugger discovery is not completed, queue pagefault */
> +	if (ret == -EBUSY) {
> +		ret = xe_eudebug_add_pagefault_list(gt, pf);
> +		if (!ret)
> +			goto out;
> +	}
> +
> +	xe_exec_queue_put(pf->q);
> +	kfree(pf);
> +
> +out:
> +	return ret;
> +}
> +
> +static const char *
> +eudebug_pagefault_get_driver_name(struct dma_fence *dma_fence)
> +{
> +	return "xe";
> +}
> +
> +static const char *
> +eudebug_pagefault_fence_get_timeline_name(struct dma_fence *dma_fence)
> +{
> +	return "eudebug_pagefault_fence";
> +}
> +
> +static const struct dma_fence_ops eudebug_pagefault_fence_ops = {
> +	.get_driver_name = eudebug_pagefault_get_driver_name,
> +	.get_timeline_name = eudebug_pagefault_fence_get_timeline_name,
> +};
> +
> +struct xe_eudebug_pagefault_fence *
> +xe_eudebug_pagefault_fence_create(void)
> +{
> +	struct xe_eudebug_pagefault_fence *fence;
> +
> +	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
> +	if (fence == NULL)
> +		return NULL;
> +
> +	spin_lock_init(&fence->lock);
> +	dma_fence_init(&fence->base, &eudebug_pagefault_fence_ops,
> +		       &fence->lock,
> +		       dma_fence_context_alloc(1), 1);
> +
> +	return fence;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>  #include "tests/xe_eudebug.c"
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
> index 403f52148da3..0a969cf8e515 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug.h
> @@ -11,6 +11,7 @@ struct drm_device;
>  struct drm_file;
>  struct xe_device;
>  struct xe_file;
> +struct xe_gt;
>  struct xe_vm;
>  struct xe_vma;
>  struct xe_exec_queue;
> @@ -18,6 +19,8 @@ struct xe_hw_engine;
>  struct xe_user_fence;
>  struct xe_debug_metadata;
>  struct drm_gpuva_ops;
> +struct xe_eudebug_pagefault;
> +struct xe_eudebug_pagefault_fence;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
>  
> @@ -48,11 +51,18 @@ void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct xe_file *xef, s
>  void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
>  
>  struct xe_eudebug *xe_eudebug_get(struct xe_file *xef);
> +struct xe_eudebug *xe_eudebug_get_for_debugger(struct xe_file *xef);
>  void xe_eudebug_put(struct xe_eudebug *d);
>  
>  void xe_eudebug_debug_metadata_create(struct xe_file *xef, struct xe_debug_metadata *m);
>  void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_metadata *m);
>  
> +struct xe_exec_queue *xe_eudebug_runalone_active_debuggable_queue_get(struct xe_gt *gt, int *lrc_idx);
> +void xe_eudebug_attention_scan_pause(struct xe_gt *gt);
> +void xe_eudebug_attention_scan_resume(struct xe_gt *gt);
> +int xe_eudebug_handle_page_fault(struct xe_gt *gt, struct xe_eudebug_pagefault *d_pf);
> +struct xe_eudebug_pagefault_fence *xe_eudebug_pagefault_fence_create(void);
> +
>  #else
>  
>  static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
> @@ -83,11 +93,18 @@ static inline void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct x
>  static inline void xe_eudebug_ufence_fini(struct xe_user_fence *ufence) { }
>  
>  static inline struct xe_eudebug *xe_eudebug_get(struct xe_file *xef) { return NULL; }
> +static inline struct xe_eudebug *xe_eudebug_get_for_debugger(struct xe_file *xef) { return NULL; }
>  static inline void xe_eudebug_put(struct xe_eudebug *d) { }
>  
>  static inline void xe_eudebug_debug_metadata_create(struct xe_file *xef, struct xe_debug_metadata *m) { }
>  static inline void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_metadata *m) { }
>  
> +static inline struct xe_exec_queue *xe_eudebug_runalone_active_debuggable_queue_get(struct xe_gt *gt, int *lrc_idx) { return NULL; }
> +static inline void xe_eudebug_attention_scan_pause(struct xe_gt *gt) { }
> +static inline void xe_eudebug_attention_scan_resume(struct xe_gt *gt) { }
> +static inline int xe_eudebug_handle_page_fault(struct xe_gt *gt, struct xe_eudebug_pagefault *d_pf) { return 0; }
> +static inline struct xe_eudebug_pagefault_fence *xe_eudebug_pagefault_fence_create(void) { return NULL; }
> +
>  #endif /* CONFIG_DRM_XE_EUDEBUG */
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
> index b79d4c078216..7c05abf19f26 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug_types.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
> @@ -16,6 +16,8 @@
>  
>  #include <uapi/drm/xe_drm.h>
>  
> +#include "xe_gt_debug.h"
> +
>  struct xe_device;
>  struct task_struct;
>  struct xe_eudebug;
> @@ -161,6 +163,10 @@ struct xe_eudebug {
>  
>  	/** @ops operations for eu_control */
>  	struct xe_eudebug_eu_control_ops *ops;
> +
> +	struct mutex pf_lock;
> +	struct list_head pagefaults;
> +	struct dma_fence __rcu *pagefault_fence;
>  };
>  
>  /**
> @@ -325,4 +331,64 @@ struct xe_eudebug_event_vm_bind_op_metadata {
>  	u64 metadata_cookie;
>  };
>  
> +/**
> + * struct xe_eudebug_event_pagefault - Internal event for EU Pagefault
> + */
> +struct xe_eudebug_event_pagefault {
> +	/** @base: base event */
> +	struct xe_eudebug_event base;
> +
> +	/** @client_handle: client for the Pagefault */
> +	u64 client_handle;
> +
> +	/** @exec_queue_handle: handle of exec_queue which raised Pagefault */
> +	u64 exec_queue_handle;
> +
> +	/** @lrc_handle: lrc handle of the workload which raised Pagefault */
> +	u64 lrc_handle;
> +
> +	/** @flags: eu Pagefault event flags, currently MBZ */
> +	u32 flags;
> +
> +	/**
> +	 * @bitmask_size: sum of size before/after/resolved att bits.
> +	 * It has three times the size of xe_eudebug_event_eu_attention.bitmask_size.
> +	 */
> +	u32 bitmask_size;
> +
> +	/** @page_fault_address: The ppgtt address where the Pagefault occurred */
> +	u64 page_fault_address;
> +
> +	/**
> +	 * @bitmask: Bitmask of thread attentions starting from natural,
> +	 * hardware order of DSS=0, eu=0, 8 attention bits per eu.
> +	 * The order of the bitmask array is before, after, resolved.
> +	 */
> +	u8 bitmask[];
> +};
> +
> +struct xe_eudebug_pagefault {
> +	struct list_head list;
> +	struct xe_exec_queue *q;
> +	int lrc_idx;
> +
> +	struct {
> +		u64 addr;
> +		int type;
> +		int level;
> +		int access;
> +	} fault;
> +
> +	struct {
> +		struct xe_eu_attentions before;
> +		struct xe_eu_attentions after;
> +		struct xe_eu_attentions resolved;
> +	} attentions;
> +};
> +
> +struct xe_eudebug_pagefault_fence {
> +	struct dma_fence base;
> +	spinlock_t lock;
> +};
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
> index 25013e902cbe..07bb0364abf8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debug.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debug.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <linux/delay.h>
>  #include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -149,3 +150,50 @@ int xe_gt_eu_threads_needing_attention(struct xe_gt *gt)
>  
>  	return err < 0 ? 0 : err;
>  }
> +
> +static inline unsigned int
> +xe_eu_attentions_count(const struct xe_eu_attentions *a)
> +{
> +	return bitmap_weight((void *)a->att, a->size * BITS_PER_BYTE);
> +}
> +
> +void xe_gt_eu_attentions_read(struct xe_gt *gt,
> +			      struct xe_eu_attentions *a,
> +			      const unsigned int settle_time_ms)
> +{
> +	unsigned int prev = 0;
> +	ktime_t end, now;
> +
> +	now = ktime_get_raw();
> +	end = ktime_add_ms(now, settle_time_ms);
> +
> +	a->ts = 0;
> +	a->size = min_t(int,
> +			xe_gt_eu_attention_bitmap_size(gt),
> +			sizeof(a->att));
> +
> +	do {
> +		unsigned int attn;
> +
> +		xe_gt_eu_attention_bitmap(gt, a->att, a->size);
> +		attn = xe_eu_attentions_count(a);
> +
> +		now = ktime_get_raw();
> +
> +		if (a->ts == 0)
> +			a->ts = now;
> +		else if (attn && attn != prev)
> +			a->ts = now;
> +
> +		prev = attn;
> +
> +		if (settle_time_ms)
> +			udelay(5);
> +
> +		/*
> +		 * XXX We are gathering data for production SIP to find
> +		 * the upper limit of settle time. For now, we wait full
> +		 * timeout value regardless.
> +		 */
> +	} while (ktime_before(now, end));
> +}
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
> index 342082699ff6..3123c15775bc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debug.h
> +++ b/drivers/gpu/drm/xe/xe_gt_debug.h
> @@ -12,6 +12,15 @@
>  
>  #define XE_GT_ATTENTION_TIMEOUT_MS 100
>  
> +struct xe_eu_attentions {
> +#define XE_MAX_EUS 1024
> +#define XE_MAX_THREADS 8
> +
> +	u8 att[XE_MAX_EUS * XE_MAX_THREADS / BITS_PER_BYTE];
> +	unsigned int size;
> +	ktime_t ts;
> +};
> +
>  int xe_gt_eu_threads_needing_attention(struct xe_gt *gt);
>  int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
>  				     int (*fn)(struct xe_gt *gt,
> @@ -24,4 +33,8 @@ int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
>  int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
>  			      unsigned int bitmap_size);
>  
> +void xe_gt_eu_attentions_read(struct xe_gt *gt,
> +			      struct xe_eu_attentions *a,
> +			      const unsigned int settle_time_ms);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 79c426dc2505..aa3e2f1b0b43 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -7,14 +7,23 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/circ_buf.h>
> +#include <linux/delay.h>
> +#include <linux/dma-fence.h>
>  
>  #include <drm/drm_exec.h>
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  
>  #include "abi/guc_actions_abi.h"
> +#include "regs/xe_gt_regs.h"
>  #include "xe_bo.h"
> +#include "xe_exec_queue.h"
> +#include "xe_eudebug.h"
> +#include "xe_eudebug_types.h"
> +#include "xe_force_wake.h"
>  #include "xe_gt.h"
> +#include "xe_gt_debug.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
> @@ -200,12 +209,206 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
>  	return vm;
>  }
>  
> -static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> +static struct xe_eudebug_pagefault *
> +get_eudebug_pagefault(struct xe_gt *gt, struct xe_vm *vm, struct pagefault *pf)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_eudebug_pagefault_fence *pagefault_fence;
> +	struct xe_eudebug_pagefault *eudebug_pagefault;
> +	struct xe_vma *vma = NULL;
> +	struct xe_exec_queue *q;
> +	struct dma_fence *fence;
> +	struct xe_eudebug *d;
> +	unsigned int fw_ref;
> +	int lrc_idx;
> +	u32 td_ctl;
> +
> +	down_read(&vm->lock);
> +	vma = lookup_vma(vm, pf->page_addr);
> +	up_read(&vm->lock);
> +
> +	if (vma)
> +		return NULL;
> +
> +	d = xe_eudebug_get_for_debugger(vm->xef);
> +	if (!d)
> +		return NULL;
> +
> +	q = xe_eudebug_runalone_active_debuggable_queue_get(gt, &lrc_idx);
> +	if (IS_ERR(q))
> +		goto err_put_eudebug;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), q->hwe->domain);
> +	if (!fw_ref)
> +		goto err_put_exec_queue;
> +
> +	/*
> +	 * If there is no debug functionality (TD_CTL_GLOBAL_DEBUG_ENABLE, etc.),
> +	 * don't proceed pagefault routine for eu debugger.
> +	 */
> +
> +	td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
> +	if (!td_ctl)
> +		goto err_put_fw;
> +
> +	eudebug_pagefault = kzalloc(sizeof(*eudebug_pagefault), GFP_KERNEL);
> +	if (!eudebug_pagefault)
> +		goto err_put_fw;
> +
> +	xe_eudebug_attention_scan_pause(gt);
> +
> +	mutex_lock(&d->eu_lock);
> +	rcu_read_lock();
> +	fence = dma_fence_get_rcu_safe(&d->pagefault_fence);
> +	rcu_read_unlock();
> +
> +	if (fence) {
> +		/*
> +		 * TODO: If the new incoming pagefaulted address is different
> +		 * from the pagefaulted address it is currently handling on the
> +		 * same ASID, it needs a routine to wait here and then do the
> +		 * following pagefault.
> +		 */
> +		dma_fence_put(fence);
> +		goto err_unlock_eu_lock;
> +	}
> +
> +	pagefault_fence = xe_eudebug_pagefault_fence_create();
> +	if (!pagefault_fence) {
> +		goto err_unlock_eu_lock;
> +	}
> +
> +	d->pagefault_fence = &pagefault_fence->base;
> +	mutex_unlock(&d->eu_lock);
> +
> +	INIT_LIST_HEAD(&eudebug_pagefault->list);
> +
> +	xe_gt_eu_attentions_read(gt, &eudebug_pagefault->attentions.before, 0);
> +
> +	/* Halt on next thread dispatch */
> +	while (!(td_ctl & TD_CTL_FORCE_EXTERNAL_HALT)) {
> +		xe_gt_mcr_multicast_write(gt, TD_CTL,
> +					  td_ctl | TD_CTL_FORCE_EXTERNAL_HALT);
> +		/*
> +		 * The sleep is needed because some interrupts are ignored
> +		 * by the HW, hence we allow the HW some time to acknowledge
> +		 * that.
> +		 */
> +		udelay(200);
> +		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
> +	}
> +
> +	/* Halt regardless of thread dependencies */
> +	while (!(td_ctl & TD_CTL_FORCE_EXCEPTION)) {
> +		xe_gt_mcr_multicast_write(gt, TD_CTL,
> +					  td_ctl | TD_CTL_FORCE_EXCEPTION);
> +		udelay(200);
> +		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
> +	}
> +
> +	xe_gt_eu_attentions_read(gt, &eudebug_pagefault->attentions.after,
> +				 XE_GT_ATTENTION_TIMEOUT_MS);
> +
> +	/*
> +	 * xe_exec_queue_put() will be called from release_eudebug_pagefault()
> +	 * or xe_eudebug_handle_page_fault()
> +	 */
> +	eudebug_pagefault->q = q;
> +	eudebug_pagefault->lrc_idx = lrc_idx;
> +	eudebug_pagefault->fault.addr = pf->page_addr;
> +	eudebug_pagefault->fault.type = pf->fault_type;
> +	eudebug_pagefault->fault.level = pf->fault_level;
> +	eudebug_pagefault->fault.access = pf->access_type;
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_eudebug_put(d);
> +
> +	return eudebug_pagefault;
> +
> +err_unlock_eu_lock:
> +	mutex_unlock(&d->eu_lock);
> +	xe_eudebug_attention_scan_resume(gt);
> +	kfree(eudebug_pagefault);
> +err_put_fw:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +err_put_exec_queue:
> +	xe_exec_queue_put(q);
> +err_put_eudebug:
> +	xe_eudebug_put(d);
> +
> +	return NULL;
> +}
> +
> +static void
> +release_eudebug_pagefault(struct xe_gt *gt, struct xe_vm *vm,
> +			  struct xe_eudebug_pagefault *eudebug_pagefault,
> +			  bool send_event)
> +{
> +	struct xe_eudebug *d;
> +	unsigned int fw_ref;
> +	u32 td_ctl;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), eudebug_pagefault->q->hwe->domain);
> +	if (!fw_ref) {
> +		struct xe_device *xe = gt_to_xe(gt);
> +		drm_warn(&xe->drm, "Forcewake fail: Can not recover TD_CTL");
> +	} else {
> +		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
> +		xe_gt_mcr_multicast_write(gt, TD_CTL, td_ctl &
> +					  ~(TD_CTL_FORCE_EXTERNAL_HALT | TD_CTL_FORCE_EXCEPTION));
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	}
> +
> +	if (send_event)
> +		xe_eudebug_handle_page_fault(gt, eudebug_pagefault);
> +
> +	d = xe_eudebug_get_for_debugger(vm->xef);
> +	if (d) {
> +		struct dma_fence *fence;
> +
> +		mutex_lock(&d->eu_lock);
> +		rcu_read_lock();
> +		fence = dma_fence_get_rcu_safe(&d->pagefault_fence);
> +		rcu_read_unlock();
> +
> +		if (fence) {
> +			if (send_event)
> +				dma_fence_signal(fence);
> +
> +			dma_fence_put(fence); /* deref for dma_fence_get_rcu_safe() */
> +			dma_fence_put(fence); /* defef for dma_fence_init() */
> +		}
> +
> +		d->pagefault_fence = NULL;
> +		mutex_unlock(&d->eu_lock);
> +
> +		xe_eudebug_put(d);
> +	}
> +
> +	if (!send_event) {
> +		xe_exec_queue_put(eudebug_pagefault->q);
> +		kfree(eudebug_pagefault);
> +	}
> +
> +	xe_eudebug_attention_scan_resume(gt);
> +}
> +
> +static void
> +handle_eu_debug_pagefault(struct xe_gt *gt, struct xe_eudebug_pagefault *d_pf)
> +{
> +	xe_gt_eu_attentions_read(gt, &d_pf->attentions.resolved,
> +				 XE_GT_ATTENTION_TIMEOUT_MS);
> +}
> +
> +static int handle_pagefault_start(struct xe_gt *gt, struct pagefault *pf,
> +				  struct xe_vm **pf_vm,
> +				  struct xe_eudebug_pagefault **d_pf)
> +{
> +	struct xe_eudebug_pagefault *eudebug_pf;
>  	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_vm *vm;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	bool  rel_eudebug_pf = false;
>  	struct xe_vma *vma = NULL;
> +	struct xe_vm *vm;
>  	int err;
>  
>  	/* SW isn't expected to handle TRTT faults */
> @@ -216,6 +419,8 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> +	eudebug_pf = get_eudebug_pagefault(gt, vm, pf);
> +
>  	/*
>  	 * TODO: Change to read lock? Using write lock for simplicity.
>  	 */
> @@ -228,8 +433,27 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  
>  	vma = lookup_vma(vm, pf->page_addr);
>  	if (!vma) {
> -		err = -EINVAL;
> -		goto unlock_vm;
> +		if (eudebug_pf)
> +			vma = xe_vm_create_scratch_vma(vm, pf->page_addr);
> +
> +
> +		if (IS_ERR_OR_NULL(vma)) {
> +			err = -EINVAL;
> +			if (eudebug_pf)
> +				rel_eudebug_pf = true;
> +
> +			goto unlock_vm;
> +		}
> +	} else {
> +		/*
> +		 * When creating an instance of eudebug_pagefault, there was
> +		 * no vma containing the ppgtt address where the pagefault occurred,
> +		 * but when reacquiring vm->lock, there is.
> +		 * During not aquiring the vm->lock from this context,
> +		 * but vma corresponding to the address where the pagefault occurred
> +		 * in another context has allocated.*/
> +		if (eudebug_pf)
> +			rel_eudebug_pf = true;
>  	}
>  
>  	err = handle_vma_pagefault(tile, pf, vma);
> @@ -238,11 +462,44 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	if (!err)
>  		vm->usm.last_fault_vma = vma;
>  	up_write(&vm->lock);
> -	xe_vm_put(vm);
> +
> +	if (rel_eudebug_pf) {
> +		release_eudebug_pagefault(gt, vm, eudebug_pf, false);
> +		*d_pf = NULL;
> +	} else {
> +		*d_pf = eudebug_pf;
> +	}
> +
> +	/* For the lifetime of the eudebug pagefault instance, keep the VM instance.*/
> +	if (!*d_pf) {
> +		xe_vm_put(vm);
> +		*pf_vm = NULL;
> +	}
> +	else {
> +		*pf_vm = vm;
> +	}
>  
>  	return err;
>  }
>  
> +static void handle_pagefault_end(struct xe_gt *gt, struct xe_vm *pf_vm,
> +				 struct xe_eudebug_pagefault *d_pf)
> +{
> +	/* if there no eudebug_pagefault then return */
> +	if (!d_pf)
> +		return;
> +
> +	handle_eu_debug_pagefault(gt, d_pf);
> +
> +	/*
> +	 * TODO: Remove VMA added to handle eudebug pagefault
> +	 */
> +
> +	release_eudebug_pagefault(gt, pf_vm, d_pf, true);
> +
> +	xe_vm_put(pf_vm);
> +}
> +
>  static int send_pagefault_reply(struct xe_guc *guc,
>  				struct xe_guc_pagefault_reply *reply)
>  {
> @@ -368,7 +625,10 @@ static void pf_queue_work_func(struct work_struct *w)
>  	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>  
>  	while (get_pagefault(pf_queue, &pf)) {
> -		ret = handle_pagefault(gt, &pf);
> +		struct xe_eudebug_pagefault *d_pf = NULL;
> +		struct xe_vm *pf_vm = NULL;
> +
> +		ret = handle_pagefault_start(gt, &pf, &pf_vm, &d_pf);

I would move eu debug page fault handling code to a different files and here do:

    if (debugger_attched)

        ret = handle_pagefault_with_debugger_attach()

else

ret = handle_pagefault()

This keep code clean, easy to read and modify.

>  		if (unlikely(ret)) {
>  			print_pagefault(xe, &pf);
>  			pf.fault_unsuccessful = 1;
> @@ -386,7 +646,12 @@ static void pf_queue_work_func(struct work_struct *w)
>  			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
>  			FIELD_PREP(PFR_PDATA, pf.pdata);
>  
> -		send_pagefault_reply(&gt->uc.guc, &reply);
> +		ret = send_pagefault_reply(&gt->uc.guc, &reply);
> +		if (unlikely(ret)) {
> +			drm_dbg(&xe->drm, "GuC Pagefault reply failed: %d\n", ret);
> +		}
> +
> +		handle_pagefault_end(gt, pf_vm, d_pf);
>  
>  		if (time_after(jiffies, threshold) &&
>  		    pf_queue->tail != pf_queue->head) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e3e8bce11e3d..bbbff17b90f9 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3555,3 +3555,24 @@ int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
>  	up_read(&vm->userptr.notifier_lock);
>  	return ret;
>  }
> +
> +struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr)
> +{
> +	struct xe_vma *vma;
> +	int err;
> +
> +	if (xe_vm_is_closed_or_banned(vm))
> +		return ERR_PTR(-ENOENT);
> +
> +	vma = xe_vma_create(vm, NULL, 0, addr, addr + SZ_64K - 1, 0, VMA_CREATE_FLAG_IS_NULL);

SZ_64K vs SZ_4K should be checked with the vm flags otherwise it will overwrite other pages. 

Regards,
Nirmoy

> +	if (IS_ERR_OR_NULL(vma))
> +		return vma;
> +
> +	err = xe_vm_insert_vma(vm, vma);
> +	if (err) {
> +		xe_vma_destroy_late(vma);
> +		return ERR_PTR(err);
> +	}
> +
> +	return vma;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 99b9a9b011de..3ac446cd3b89 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -284,3 +284,5 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
>  
>  int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
>  		   void *buf, u64 len, bool write);
> +
> +struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr);
> diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
> index 2ebf21e15f5b..47856ca215ef 100644
> --- a/include/uapi/drm/xe_drm_eudebug.h
> +++ b/include/uapi/drm/xe_drm_eudebug.h
> @@ -37,6 +37,7 @@ struct drm_xe_eudebug_event {
>  #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
>  #define DRM_XE_EUDEBUG_EVENT_METADATA		9
>  #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
> +#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		11
>  
>  	__u16 flags;
>  #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
> @@ -218,6 +219,17 @@ struct drm_xe_eudebug_event_vm_bind_op_metadata {
>  	__u64 metadata_cookie;
>  };
>  
> +struct drm_xe_eudebug_event_pagefault {
> +	struct drm_xe_eudebug_event base;
> +	__u64 client_handle;
> +	__u64 exec_queue_handle;
> +	__u64 lrc_handle;
> +	__u32 flags;
> +	__u32 bitmask_size;
> +	__u64 pagefault_address;
> +	__u8 bitmask[];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
--------------xyrYQW5IEfUlN1PmYdjrqKMs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>(Just looking at this patch not the whole series)<br>
    </p>
    <div class="moz-cite-prefix">On 10/21/2024 11:58 AM, Gwan-gyeong Mun
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241021095904.439555-20-gwan-gyeong.mun@intel.com">
      <pre wrap="" class="moz-quote-pre">When the EU debugger is connected, if a page fault occurs,
the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event is passed to the client
connected to the debugger after handling the pagefault WA.

The pagefault WA is a mechanism that allows a stalled EU thread to enter
SIP mode by installing a temporary page in the page table for the ppgtt
address where the pagefault occurred.

The pagefault eudebug event passed to the client follows the newly added
struct drm_xe_eudebug_event_pagefault type.
When a pagefault occurs, it prevents to send the
DRM_XE_EUDEBUG_EVENT_EU_ATTENTION event to the client during
pagefault WA processing.</pre>
    </blockquote>
    <p>This patch is big and contains two functionality, event passing
      to debugger and page fault handling when</p>
    <p>debugger is attach. I think this should be split into 2 or more
      patches.<br>
    </p>
    <blockquote type="cite"
      cite="mid:20241021095904.439555-20-gwan-gyeong.mun@intel.com">
      <pre wrap="" class="moz-quote-pre">

The page fault event delivery follows the below policy.
(1) If EU Debugger discovery has been completed, pagefault handler delivers
    pagefault event directly.
(2) If a pagefault occurs during eu debugger discovery process, pagefault
    handler queues a pagefault event and sends the queued event when
    discovery is completed

The thread where the pagefault occurred will be notified only once,
for an event with the DRM_XE_EUDEBUG_EVENT_PAGEFAULT event type.

Information about EU threads where a pagefault occurred is passed to the
client only once for each event with the
DRM_XE_EUDEBUG_EVENT_PAGEFAULT event type.
Of course, if a pagefault occurs for a new thread, a new pagefault event
will be passed to the client. It is also possible that a pagefault WA for
multiple EU threads is processed and delivered for a single pagefault event

The eu attention event is sent by the attention workqueue whenever the
attention bit is turned on, and the eu attention event is also delivered
to the client when the attention bit is turned on by a pagefault event.
In this case, the pagefault event is always processed before
the eu attention event.

And when the client receives the eu attention event, the client can
spot the thread where the page fault occurred as a previously
delivered event, so it can spot that the attention bit is turned on by
the breakpoint for threads other than the thread where the page fault
occurred.

Adding a temporary null page follows [1].

A brief description of the page fault handling mechanism flow between KMD
and the eu thread is as follows

(1) EU Thread accesses unallocated memory
(2) Pagefault occurs, EU Thread is stopped
(3) XE kmd set an force EU Thread exception to allow the running EU Thread
    to enter SIP mode (kmd set ForceException / ForceExternalHalt bit of
    TD_CTL register)
    EU Threads that are not stopped enter SIP mode
(4) XE kmd installs temporary page at the address where pagefault occurred
    of ppgtt pagetable
(5) XE kmd replies Pagefault message to GUC
(6) stopped EU Thread resumes when pagefault is resolved
(7) resumed eu thread enters SIP mode due to force exception set by (3)

[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/555097">https://patchwork.freedesktop.org/patch/555097</a>

Signed-off-by: Gwan-gyeong Mun <a class="moz-txt-link-rfc2396E" href="mailto:gwan-gyeong.mun@intel.com">&lt;gwan-gyeong.mun@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_eudebug.c       | 254 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h       |  17 ++
 drivers/gpu/drm/xe/xe_eudebug_types.h |  66 ++++++
 drivers/gpu/drm/xe/xe_gt_debug.c      |  48 +++++
 drivers/gpu/drm/xe/xe_gt_debug.h      |  13 ++
 drivers/gpu/drm/xe/xe_gt_pagefault.c  | 281 +++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_vm.c            |  21 ++
 drivers/gpu/drm/xe/xe_vm.h            |   2 +
 include/uapi/drm/xe_drm_eudebug.h     |  12 ++
 9 files changed, 706 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 5ec9dac9edd5..4538fa28e755 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -236,10 +236,17 @@ static void xe_eudebug_free(struct kref *ref)
 {
 	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
 	struct xe_eudebug_event *event;
+	struct xe_eudebug_pagefault *pf, *pf_temp;
 
 	while (kfifo_get(&amp;d-&gt;events.fifo, &amp;event))
 		kfree(event);
 
+	/* Since it's the last reference no race here */
+	list_for_each_entry_safe(pf, pf_temp, &amp;d-&gt;pagefaults, list) {
+		xe_exec_queue_put(pf-&gt;q);
+		kfree(pf);
+	}
+
 	xe_eudebug_destroy_resources(d);
 	put_task_struct(d-&gt;target_task);
 
@@ -590,6 +597,12 @@ xe_eudebug_get(struct xe_file *xef)
 	return d;
 }
 
+struct xe_eudebug *
+xe_eudebug_get_for_debugger(struct xe_file *xef)
+{
+	return _xe_eudebug_get(xef);
+}
+
 static int xe_eudebug_queue_event(struct xe_eudebug *d,
 				  struct xe_eudebug_event *event)
 {
@@ -1064,6 +1077,7 @@ static int do_eu_control(struct xe_eudebug *d,
 	struct xe_device *xe = d-&gt;xe;
 	u8 *bits = NULL;
 	unsigned int hw_attn_size, attn_size;
+	struct dma_fence *pagefault_fence;
 	struct xe_exec_queue *q;
 	struct xe_file *xef;
 	struct xe_lrc *lrc;
@@ -1129,6 +1143,23 @@ static int do_eu_control(struct xe_eudebug *d,
 
 	ret = -EINVAL;
 	mutex_lock(&amp;d-&gt;eu_lock);
+	rcu_read_lock();
+	pagefault_fence = dma_fence_get_rcu_safe(&amp;d-&gt;pagefault_fence);
+	rcu_read_unlock();
+
+	while (pagefault_fence) {
+		mutex_unlock(&amp;d-&gt;eu_lock);
+		ret = dma_fence_wait(pagefault_fence, true);
+		dma_fence_put(pagefault_fence);
+
+		if (ret)
+			goto out_free;
+
+		mutex_lock(&amp;d-&gt;eu_lock);
+		rcu_read_lock();
+		pagefault_fence = dma_fence_get_rcu_safe(&amp;d-&gt;pagefault_fence);
+		rcu_read_unlock();
+	}
 
 	switch (arg-&gt;cmd) {
 	case DRM_XE_EUDEBUG_EU_CONTROL_CMD_INTERRUPT_ALL:
@@ -2008,6 +2039,8 @@ xe_eudebug_connect(struct xe_device *xe,
 	kref_init(&amp;d-&gt;ref);
 	spin_lock_init(&amp;d-&gt;connection.lock);
 	mutex_init(&amp;d-&gt;eu_lock);
+	mutex_init(&amp;d-&gt;pf_lock);
+	INIT_LIST_HEAD(&amp;d-&gt;pagefaults);
 	init_waitqueue_head(&amp;d-&gt;events.write_done);
 	init_waitqueue_head(&amp;d-&gt;events.read_done);
 	init_completion(&amp;d-&gt;discovery);
@@ -3359,6 +3392,8 @@ static void discover_clients(struct xe_device *xe, struct xe_eudebug *d)
 	}
 }
 
+static int xe_eudebug_handle_pagefault_list(struct xe_eudebug *d);
+
 static void discovery_work_fn(struct work_struct *work)
 {
 	struct xe_eudebug *d = container_of(work, typeof(*d),
@@ -3383,6 +3418,8 @@ static void discovery_work_fn(struct work_struct *work)
 
 	up_write(&amp;xe-&gt;eudebug.discovery_lock);
 
+	xe_eudebug_handle_pagefault_list(d);
+
 	xe_eudebug_put(d);
 }
 
@@ -3888,6 +3925,223 @@ xe_eudebug_vm_open_ioctl(struct xe_eudebug *d, unsigned long arg)
 	return ret;
 }
 
+struct xe_exec_queue *
+xe_eudebug_runalone_active_debuggable_queue_get(struct xe_gt *gt, int *lrc_idx)
+{
+	struct xe_exec_queue *q;
+	int idx;
+
+	q = runalone_active_queue_get(gt, &amp;idx);
+	if (IS_ERR(q))
+		return q;
+
+	if (!xe_exec_queue_is_debuggable(q)) {
+		xe_exec_queue_put(q);
+		return ERR_PTR(-EPERM);
+	}
+
+	*lrc_idx = idx;
+
+	return q;
+}
+
+void xe_eudebug_attention_scan_pause(struct xe_gt *gt)
+{
+	attention_scan_cancel(gt_to_xe(gt));
+}
+
+void xe_eudebug_attention_scan_resume(struct xe_gt *gt)
+{
+	attention_scan_flush(gt_to_xe(gt));
+}
+
+static int send_pagefault_event(struct xe_eudebug *d, struct xe_eudebug_pagefault *pf)
+{
+	struct xe_eudebug_event_pagefault *ep;
+	struct xe_eudebug_event *event;
+	int h_c, h_queue, h_lrc;
+	u32 size = xe_gt_eu_attention_bitmap_size(pf-&gt;q-&gt;gt) * 3;
+	u32 sz = struct_size(ep, bitmask, size);
+
+	XE_WARN_ON(pf-&gt;lrc_idx &lt; 0 || pf-&gt;lrc_idx &gt;= pf-&gt;q-&gt;width);
+
+	XE_WARN_ON(!xe_exec_queue_is_debuggable(pf-&gt;q));
+
+	h_c = find_handle(d-&gt;res, XE_EUDEBUG_RES_TYPE_CLIENT, pf-&gt;q-&gt;vm-&gt;xef);
+	if (h_c &lt; 0)
+		return h_c;
+
+	h_queue = find_handle(d-&gt;res, XE_EUDEBUG_RES_TYPE_EXEC_QUEUE, pf-&gt;q);
+	if (h_queue &lt; 0)
+		return h_queue;
+
+	h_lrc = find_handle(d-&gt;res, XE_EUDEBUG_RES_TYPE_LRC, pf-&gt;q-&gt;lrc[pf-&gt;lrc_idx]);
+	if (h_lrc &lt; 0)
+		return h_lrc;
+
+	event = __xe_eudebug_create_event(d, 0, DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
+					  0, sz, GFP_KERNEL);
+
+	if (!event)
+		return -ENOSPC;
+
+	ep = cast_event(ep, event);
+	write_member(struct xe_eudebug_event_pagefault, ep, client_handle, (u64)h_c);
+	write_member(struct xe_eudebug_event_pagefault, ep, exec_queue_handle, (u64)h_queue);
+	write_member(struct xe_eudebug_event_pagefault, ep, lrc_handle, (u64)h_lrc);
+	write_member(struct xe_eudebug_event_pagefault, ep, bitmask_size, size);
+	write_member(struct xe_eudebug_event_pagefault, ep, page_fault_address, pf-&gt;fault.addr);
+
+	memcpy(ep-&gt;bitmask, pf-&gt;attentions.before.att, pf-&gt;attentions.before.size);
+	memcpy(ep-&gt;bitmask + pf-&gt;attentions.before.size,
+	       pf-&gt;attentions.after.att, pf-&gt;attentions.after.size);
+	memcpy(ep-&gt;bitmask + pf-&gt;attentions.before.size + pf-&gt;attentions.after.size,
+	       pf-&gt;attentions.resolved.att, pf-&gt;attentions.resolved.size);
+
+	event-&gt;seqno = atomic_long_inc_return(&amp;d-&gt;events.seqno);
+
+	return xe_eudebug_queue_event(d, event);
+}
+
+static int xe_eudebug_queue_page_fault(struct xe_gt *gt, struct xe_eudebug_pagefault *pf)
+{
+	struct xe_eudebug *d;
+	struct xe_exec_queue *q;
+	int ret, lrc_idx;
+
+	if (list_empty_careful(&amp;gt_to_xe(gt)-&gt;eudebug.list))
+		return -ENOTCONN;
+
+	q = runalone_active_queue_get(gt, &amp;lrc_idx);
+	if (IS_ERR(q))
+		return PTR_ERR(q);
+
+	if (!xe_exec_queue_is_debuggable(q)) {
+		ret = -EPERM;
+		goto out_exec_queue_put;
+	}
+
+	d = _xe_eudebug_get(q-&gt;vm-&gt;xef);
+	if (!d) {
+		ret = -ENOTCONN;
+		goto out_exec_queue_put;
+	}
+
+	if (!completion_done(&amp;d-&gt;discovery)) {
+		eu_dbg(d, "discovery not yet done\n");
+		ret = -EBUSY;
+		goto out_eudebug_put;
+	}
+
+	ret = send_pagefault_event(d, pf);
+	if (ret)
+		xe_eudebug_disconnect(d, ret);
+
+out_eudebug_put:
+	xe_eudebug_put(d);
+out_exec_queue_put:
+	xe_exec_queue_put(q);
+
+	return ret;
+}
+
+static int xe_eudebug_add_pagefault_list(struct xe_gt *gt, struct xe_eudebug_pagefault *pf)
+{
+	struct xe_eudebug *d;
+
+	if (list_empty_careful(&amp;gt_to_xe(gt)-&gt;eudebug.list))
+		return -ENOTCONN;
+
+	d = _xe_eudebug_get(pf-&gt;q-&gt;vm-&gt;xef);
+	if (IS_ERR_OR_NULL(d))
+		return -EINVAL;
+
+	mutex_lock(&amp;d-&gt;pf_lock);
+	list_add_tail(&amp;pf-&gt;list, &amp;d-&gt;pagefaults);
+	mutex_unlock(&amp;d-&gt;pf_lock);
+
+	xe_eudebug_put(d);
+
+	return 0;
+}
+
+static int xe_eudebug_handle_pagefault_list(struct xe_eudebug *d)
+{
+	struct xe_eudebug_pagefault *pf, *pf_temp;
+	int ret = 0;
+
+	mutex_lock(&amp;d-&gt;pf_lock);
+	list_for_each_entry_safe(pf, pf_temp, &amp;d-&gt;pagefaults, list) {
+		struct xe_gt *gt =pf-&gt;q-&gt;gt;
+
+		ret = xe_eudebug_queue_page_fault(gt, pf);
+		/* decrease the reference count of xe_exec_queue obtained from pagefault handler */
+		xe_exec_queue_put(pf-&gt;q);
+		list_del(&amp;pf-&gt;list);
+		kfree(pf);
+
+		if (ret)
+			break;
+	}
+	mutex_unlock(&amp;d-&gt;pf_lock);
+
+	return ret;
+}
+
+int xe_eudebug_handle_page_fault(struct xe_gt *gt, struct xe_eudebug_pagefault *pf)
+{
+	int ret;
+
+	ret = xe_eudebug_queue_page_fault(gt, pf);
+
+	/* if debugger discovery is not completed, queue pagefault */
+	if (ret == -EBUSY) {
+		ret = xe_eudebug_add_pagefault_list(gt, pf);
+		if (!ret)
+			goto out;
+	}
+
+	xe_exec_queue_put(pf-&gt;q);
+	kfree(pf);
+
+out:
+	return ret;
+}
+
+static const char *
+eudebug_pagefault_get_driver_name(struct dma_fence *dma_fence)
+{
+	return "xe";
+}
+
+static const char *
+eudebug_pagefault_fence_get_timeline_name(struct dma_fence *dma_fence)
+{
+	return "eudebug_pagefault_fence";
+}
+
+static const struct dma_fence_ops eudebug_pagefault_fence_ops = {
+	.get_driver_name = eudebug_pagefault_get_driver_name,
+	.get_timeline_name = eudebug_pagefault_fence_get_timeline_name,
+};
+
+struct xe_eudebug_pagefault_fence *
+xe_eudebug_pagefault_fence_create(void)
+{
+	struct xe_eudebug_pagefault_fence *fence;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (fence == NULL)
+		return NULL;
+
+	spin_lock_init(&amp;fence-&gt;lock);
+	dma_fence_init(&amp;fence-&gt;base, &amp;eudebug_pagefault_fence_ops,
+		       &amp;fence-&gt;lock,
+		       dma_fence_context_alloc(1), 1);
+
+	return fence;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_eudebug.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 403f52148da3..0a969cf8e515 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -11,6 +11,7 @@ struct drm_device;
 struct drm_file;
 struct xe_device;
 struct xe_file;
+struct xe_gt;
 struct xe_vm;
 struct xe_vma;
 struct xe_exec_queue;
@@ -18,6 +19,8 @@ struct xe_hw_engine;
 struct xe_user_fence;
 struct xe_debug_metadata;
 struct drm_gpuva_ops;
+struct xe_eudebug_pagefault;
+struct xe_eudebug_pagefault_fence;
 
 #if IS_ENABLED(CONFIG_DRM_XE_EUDEBUG)
 
@@ -48,11 +51,18 @@ void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct xe_file *xef, s
 void xe_eudebug_ufence_fini(struct xe_user_fence *ufence);
 
 struct xe_eudebug *xe_eudebug_get(struct xe_file *xef);
+struct xe_eudebug *xe_eudebug_get_for_debugger(struct xe_file *xef);
 void xe_eudebug_put(struct xe_eudebug *d);
 
 void xe_eudebug_debug_metadata_create(struct xe_file *xef, struct xe_debug_metadata *m);
 void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_metadata *m);
 
+struct xe_exec_queue *xe_eudebug_runalone_active_debuggable_queue_get(struct xe_gt *gt, int *lrc_idx);
+void xe_eudebug_attention_scan_pause(struct xe_gt *gt);
+void xe_eudebug_attention_scan_resume(struct xe_gt *gt);
+int xe_eudebug_handle_page_fault(struct xe_gt *gt, struct xe_eudebug_pagefault *d_pf);
+struct xe_eudebug_pagefault_fence *xe_eudebug_pagefault_fence_create(void);
+
 #else
 
 static inline int xe_eudebug_connect_ioctl(struct drm_device *dev,
@@ -83,11 +93,18 @@ static inline void xe_eudebug_ufence_init(struct xe_user_fence *ufence, struct x
 static inline void xe_eudebug_ufence_fini(struct xe_user_fence *ufence) { }
 
 static inline struct xe_eudebug *xe_eudebug_get(struct xe_file *xef) { return NULL; }
+static inline struct xe_eudebug *xe_eudebug_get_for_debugger(struct xe_file *xef) { return NULL; }
 static inline void xe_eudebug_put(struct xe_eudebug *d) { }
 
 static inline void xe_eudebug_debug_metadata_create(struct xe_file *xef, struct xe_debug_metadata *m) { }
 static inline void xe_eudebug_debug_metadata_destroy(struct xe_file *xef, struct xe_debug_metadata *m) { }
 
+static inline struct xe_exec_queue *xe_eudebug_runalone_active_debuggable_queue_get(struct xe_gt *gt, int *lrc_idx) { return NULL; }
+static inline void xe_eudebug_attention_scan_pause(struct xe_gt *gt) { }
+static inline void xe_eudebug_attention_scan_resume(struct xe_gt *gt) { }
+static inline int xe_eudebug_handle_page_fault(struct xe_gt *gt, struct xe_eudebug_pagefault *d_pf) { return 0; }
+static inline struct xe_eudebug_pagefault_fence *xe_eudebug_pagefault_fence_create(void) { return NULL; }
+
 #endif /* CONFIG_DRM_XE_EUDEBUG */
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
index b79d4c078216..7c05abf19f26 100644
--- a/drivers/gpu/drm/xe/xe_eudebug_types.h
+++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
@@ -16,6 +16,8 @@
 
 #include &lt;uapi/drm/xe_drm.h&gt;
 
+#include "xe_gt_debug.h"
+
 struct xe_device;
 struct task_struct;
 struct xe_eudebug;
@@ -161,6 +163,10 @@ struct xe_eudebug {
 
 	/** @ops operations for eu_control */
 	struct xe_eudebug_eu_control_ops *ops;
+
+	struct mutex pf_lock;
+	struct list_head pagefaults;
+	struct dma_fence __rcu *pagefault_fence;
 };
 
 /**
@@ -325,4 +331,64 @@ struct xe_eudebug_event_vm_bind_op_metadata {
 	u64 metadata_cookie;
 };
 
+/**
+ * struct xe_eudebug_event_pagefault - Internal event for EU Pagefault
+ */
+struct xe_eudebug_event_pagefault {
+	/** @base: base event */
+	struct xe_eudebug_event base;
+
+	/** @client_handle: client for the Pagefault */
+	u64 client_handle;
+
+	/** @exec_queue_handle: handle of exec_queue which raised Pagefault */
+	u64 exec_queue_handle;
+
+	/** @lrc_handle: lrc handle of the workload which raised Pagefault */
+	u64 lrc_handle;
+
+	/** @flags: eu Pagefault event flags, currently MBZ */
+	u32 flags;
+
+	/**
+	 * @bitmask_size: sum of size before/after/resolved att bits.
+	 * It has three times the size of xe_eudebug_event_eu_attention.bitmask_size.
+	 */
+	u32 bitmask_size;
+
+	/** @page_fault_address: The ppgtt address where the Pagefault occurred */
+	u64 page_fault_address;
+
+	/**
+	 * @bitmask: Bitmask of thread attentions starting from natural,
+	 * hardware order of DSS=0, eu=0, 8 attention bits per eu.
+	 * The order of the bitmask array is before, after, resolved.
+	 */
+	u8 bitmask[];
+};
+
+struct xe_eudebug_pagefault {
+	struct list_head list;
+	struct xe_exec_queue *q;
+	int lrc_idx;
+
+	struct {
+		u64 addr;
+		int type;
+		int level;
+		int access;
+	} fault;
+
+	struct {
+		struct xe_eu_attentions before;
+		struct xe_eu_attentions after;
+		struct xe_eu_attentions resolved;
+	} attentions;
+};
+
+struct xe_eudebug_pagefault_fence {
+	struct dma_fence base;
+	spinlock_t lock;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.c b/drivers/gpu/drm/xe/xe_gt_debug.c
index 25013e902cbe..07bb0364abf8 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.c
+++ b/drivers/gpu/drm/xe/xe_gt_debug.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include &lt;linux/delay.h&gt;
 #include "regs/xe_gt_regs.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
@@ -149,3 +150,50 @@ int xe_gt_eu_threads_needing_attention(struct xe_gt *gt)
 
 	return err &lt; 0 ? 0 : err;
 }
+
+static inline unsigned int
+xe_eu_attentions_count(const struct xe_eu_attentions *a)
+{
+	return bitmap_weight((void *)a-&gt;att, a-&gt;size * BITS_PER_BYTE);
+}
+
+void xe_gt_eu_attentions_read(struct xe_gt *gt,
+			      struct xe_eu_attentions *a,
+			      const unsigned int settle_time_ms)
+{
+	unsigned int prev = 0;
+	ktime_t end, now;
+
+	now = ktime_get_raw();
+	end = ktime_add_ms(now, settle_time_ms);
+
+	a-&gt;ts = 0;
+	a-&gt;size = min_t(int,
+			xe_gt_eu_attention_bitmap_size(gt),
+			sizeof(a-&gt;att));
+
+	do {
+		unsigned int attn;
+
+		xe_gt_eu_attention_bitmap(gt, a-&gt;att, a-&gt;size);
+		attn = xe_eu_attentions_count(a);
+
+		now = ktime_get_raw();
+
+		if (a-&gt;ts == 0)
+			a-&gt;ts = now;
+		else if (attn &amp;&amp; attn != prev)
+			a-&gt;ts = now;
+
+		prev = attn;
+
+		if (settle_time_ms)
+			udelay(5);
+
+		/*
+		 * XXX We are gathering data for production SIP to find
+		 * the upper limit of settle time. For now, we wait full
+		 * timeout value regardless.
+		 */
+	} while (ktime_before(now, end));
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/xe_gt_debug.h b/drivers/gpu/drm/xe/xe_gt_debug.h
index 342082699ff6..3123c15775bc 100644
--- a/drivers/gpu/drm/xe/xe_gt_debug.h
+++ b/drivers/gpu/drm/xe/xe_gt_debug.h
@@ -12,6 +12,15 @@
 
 #define XE_GT_ATTENTION_TIMEOUT_MS 100
 
+struct xe_eu_attentions {
+#define XE_MAX_EUS 1024
+#define XE_MAX_THREADS 8
+
+	u8 att[XE_MAX_EUS * XE_MAX_THREADS / BITS_PER_BYTE];
+	unsigned int size;
+	ktime_t ts;
+};
+
 int xe_gt_eu_threads_needing_attention(struct xe_gt *gt);
 int xe_gt_foreach_dss_group_instance(struct xe_gt *gt,
 				     int (*fn)(struct xe_gt *gt,
@@ -24,4 +33,8 @@ int xe_gt_eu_attention_bitmap_size(struct xe_gt *gt);
 int xe_gt_eu_attention_bitmap(struct xe_gt *gt, u8 *bits,
 			      unsigned int bitmap_size);
 
+void xe_gt_eu_attentions_read(struct xe_gt *gt,
+			      struct xe_eu_attentions *a,
+			      const unsigned int settle_time_ms);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 79c426dc2505..aa3e2f1b0b43 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -7,14 +7,23 @@
 
 #include &lt;linux/bitfield.h&gt;
 #include &lt;linux/circ_buf.h&gt;
+#include &lt;linux/delay.h&gt;
+#include &lt;linux/dma-fence.h&gt;
 
 #include &lt;drm/drm_exec.h&gt;
 #include &lt;drm/drm_managed.h&gt;
 #include &lt;drm/ttm/ttm_execbuf_util.h&gt;
 
 #include "abi/guc_actions_abi.h"
+#include "regs/xe_gt_regs.h"
 #include "xe_bo.h"
+#include "xe_exec_queue.h"
+#include "xe_eudebug.h"
+#include "xe_eudebug_types.h"
+#include "xe_force_wake.h"
 #include "xe_gt.h"
+#include "xe_gt_debug.h"
+#include "xe_gt_mcr.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -200,12 +209,206 @@ static struct xe_vm *asid_to_vm(struct xe_device *xe, u32 asid)
 	return vm;
 }
 
-static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
+static struct xe_eudebug_pagefault *
+get_eudebug_pagefault(struct xe_gt *gt, struct xe_vm *vm, struct pagefault *pf)
 {
-	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_eudebug_pagefault_fence *pagefault_fence;
+	struct xe_eudebug_pagefault *eudebug_pagefault;
+	struct xe_vma *vma = NULL;
+	struct xe_exec_queue *q;
+	struct dma_fence *fence;
+	struct xe_eudebug *d;
+	unsigned int fw_ref;
+	int lrc_idx;
+	u32 td_ctl;
+
+	down_read(&amp;vm-&gt;lock);
+	vma = lookup_vma(vm, pf-&gt;page_addr);
+	up_read(&amp;vm-&gt;lock);
+
+	if (vma)
+		return NULL;
+
+	d = xe_eudebug_get_for_debugger(vm-&gt;xef);
+	if (!d)
+		return NULL;
+
+	q = xe_eudebug_runalone_active_debuggable_queue_get(gt, &amp;lrc_idx);
+	if (IS_ERR(q))
+		goto err_put_eudebug;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), q-&gt;hwe-&gt;domain);
+	if (!fw_ref)
+		goto err_put_exec_queue;
+
+	/*
+	 * If there is no debug functionality (TD_CTL_GLOBAL_DEBUG_ENABLE, etc.),
+	 * don't proceed pagefault routine for eu debugger.
+	 */
+
+	td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+	if (!td_ctl)
+		goto err_put_fw;
+
+	eudebug_pagefault = kzalloc(sizeof(*eudebug_pagefault), GFP_KERNEL);
+	if (!eudebug_pagefault)
+		goto err_put_fw;
+
+	xe_eudebug_attention_scan_pause(gt);
+
+	mutex_lock(&amp;d-&gt;eu_lock);
+	rcu_read_lock();
+	fence = dma_fence_get_rcu_safe(&amp;d-&gt;pagefault_fence);
+	rcu_read_unlock();
+
+	if (fence) {
+		/*
+		 * TODO: If the new incoming pagefaulted address is different
+		 * from the pagefaulted address it is currently handling on the
+		 * same ASID, it needs a routine to wait here and then do the
+		 * following pagefault.
+		 */
+		dma_fence_put(fence);
+		goto err_unlock_eu_lock;
+	}
+
+	pagefault_fence = xe_eudebug_pagefault_fence_create();
+	if (!pagefault_fence) {
+		goto err_unlock_eu_lock;
+	}
+
+	d-&gt;pagefault_fence = &amp;pagefault_fence-&gt;base;
+	mutex_unlock(&amp;d-&gt;eu_lock);
+
+	INIT_LIST_HEAD(&amp;eudebug_pagefault-&gt;list);
+
+	xe_gt_eu_attentions_read(gt, &amp;eudebug_pagefault-&gt;attentions.before, 0);
+
+	/* Halt on next thread dispatch */
+	while (!(td_ctl &amp; TD_CTL_FORCE_EXTERNAL_HALT)) {
+		xe_gt_mcr_multicast_write(gt, TD_CTL,
+					  td_ctl | TD_CTL_FORCE_EXTERNAL_HALT);
+		/*
+		 * The sleep is needed because some interrupts are ignored
+		 * by the HW, hence we allow the HW some time to acknowledge
+		 * that.
+		 */
+		udelay(200);
+		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+	}
+
+	/* Halt regardless of thread dependencies */
+	while (!(td_ctl &amp; TD_CTL_FORCE_EXCEPTION)) {
+		xe_gt_mcr_multicast_write(gt, TD_CTL,
+					  td_ctl | TD_CTL_FORCE_EXCEPTION);
+		udelay(200);
+		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+	}
+
+	xe_gt_eu_attentions_read(gt, &amp;eudebug_pagefault-&gt;attentions.after,
+				 XE_GT_ATTENTION_TIMEOUT_MS);
+
+	/*
+	 * xe_exec_queue_put() will be called from release_eudebug_pagefault()
+	 * or xe_eudebug_handle_page_fault()
+	 */
+	eudebug_pagefault-&gt;q = q;
+	eudebug_pagefault-&gt;lrc_idx = lrc_idx;
+	eudebug_pagefault-&gt;fault.addr = pf-&gt;page_addr;
+	eudebug_pagefault-&gt;fault.type = pf-&gt;fault_type;
+	eudebug_pagefault-&gt;fault.level = pf-&gt;fault_level;
+	eudebug_pagefault-&gt;fault.access = pf-&gt;access_type;
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_eudebug_put(d);
+
+	return eudebug_pagefault;
+
+err_unlock_eu_lock:
+	mutex_unlock(&amp;d-&gt;eu_lock);
+	xe_eudebug_attention_scan_resume(gt);
+	kfree(eudebug_pagefault);
+err_put_fw:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+err_put_exec_queue:
+	xe_exec_queue_put(q);
+err_put_eudebug:
+	xe_eudebug_put(d);
+
+	return NULL;
+}
+
+static void
+release_eudebug_pagefault(struct xe_gt *gt, struct xe_vm *vm,
+			  struct xe_eudebug_pagefault *eudebug_pagefault,
+			  bool send_event)
+{
+	struct xe_eudebug *d;
+	unsigned int fw_ref;
+	u32 td_ctl;
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), eudebug_pagefault-&gt;q-&gt;hwe-&gt;domain);
+	if (!fw_ref) {
+		struct xe_device *xe = gt_to_xe(gt);
+		drm_warn(&amp;xe-&gt;drm, "Forcewake fail: Can not recover TD_CTL");
+	} else {
+		td_ctl = xe_gt_mcr_unicast_read_any(gt, TD_CTL);
+		xe_gt_mcr_multicast_write(gt, TD_CTL, td_ctl &amp;
+					  ~(TD_CTL_FORCE_EXTERNAL_HALT | TD_CTL_FORCE_EXCEPTION));
+		xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	}
+
+	if (send_event)
+		xe_eudebug_handle_page_fault(gt, eudebug_pagefault);
+
+	d = xe_eudebug_get_for_debugger(vm-&gt;xef);
+	if (d) {
+		struct dma_fence *fence;
+
+		mutex_lock(&amp;d-&gt;eu_lock);
+		rcu_read_lock();
+		fence = dma_fence_get_rcu_safe(&amp;d-&gt;pagefault_fence);
+		rcu_read_unlock();
+
+		if (fence) {
+			if (send_event)
+				dma_fence_signal(fence);
+
+			dma_fence_put(fence); /* deref for dma_fence_get_rcu_safe() */
+			dma_fence_put(fence); /* defef for dma_fence_init() */
+		}
+
+		d-&gt;pagefault_fence = NULL;
+		mutex_unlock(&amp;d-&gt;eu_lock);
+
+		xe_eudebug_put(d);
+	}
+
+	if (!send_event) {
+		xe_exec_queue_put(eudebug_pagefault-&gt;q);
+		kfree(eudebug_pagefault);
+	}
+
+	xe_eudebug_attention_scan_resume(gt);
+}
+
+static void
+handle_eu_debug_pagefault(struct xe_gt *gt, struct xe_eudebug_pagefault *d_pf)
+{
+	xe_gt_eu_attentions_read(gt, &amp;d_pf-&gt;attentions.resolved,
+				 XE_GT_ATTENTION_TIMEOUT_MS);
+}
+
+static int handle_pagefault_start(struct xe_gt *gt, struct pagefault *pf,
+				  struct xe_vm **pf_vm,
+				  struct xe_eudebug_pagefault **d_pf)
+{
+	struct xe_eudebug_pagefault *eudebug_pf;
 	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_vm *vm;
+	struct xe_device *xe = gt_to_xe(gt);
+	bool  rel_eudebug_pf = false;
 	struct xe_vma *vma = NULL;
+	struct xe_vm *vm;
 	int err;
 
 	/* SW isn't expected to handle TRTT faults */
@@ -216,6 +419,8 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
+	eudebug_pf = get_eudebug_pagefault(gt, vm, pf);
+
 	/*
 	 * TODO: Change to read lock? Using write lock for simplicity.
 	 */
@@ -228,8 +433,27 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	vma = lookup_vma(vm, pf-&gt;page_addr);
 	if (!vma) {
-		err = -EINVAL;
-		goto unlock_vm;
+		if (eudebug_pf)
+			vma = xe_vm_create_scratch_vma(vm, pf-&gt;page_addr);
+
+
+		if (IS_ERR_OR_NULL(vma)) {
+			err = -EINVAL;
+			if (eudebug_pf)
+				rel_eudebug_pf = true;
+
+			goto unlock_vm;
+		}
+	} else {
+		/*
+		 * When creating an instance of eudebug_pagefault, there was
+		 * no vma containing the ppgtt address where the pagefault occurred,
+		 * but when reacquiring vm-&gt;lock, there is.
+		 * During not aquiring the vm-&gt;lock from this context,
+		 * but vma corresponding to the address where the pagefault occurred
+		 * in another context has allocated.*/
+		if (eudebug_pf)
+			rel_eudebug_pf = true;
 	}
 
 	err = handle_vma_pagefault(tile, pf, vma);
@@ -238,11 +462,44 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (!err)
 		vm-&gt;usm.last_fault_vma = vma;
 	up_write(&amp;vm-&gt;lock);
-	xe_vm_put(vm);
+
+	if (rel_eudebug_pf) {
+		release_eudebug_pagefault(gt, vm, eudebug_pf, false);
+		*d_pf = NULL;
+	} else {
+		*d_pf = eudebug_pf;
+	}
+
+	/* For the lifetime of the eudebug pagefault instance, keep the VM instance.*/
+	if (!*d_pf) {
+		xe_vm_put(vm);
+		*pf_vm = NULL;
+	}
+	else {
+		*pf_vm = vm;
+	}
 
 	return err;
 }
 
+static void handle_pagefault_end(struct xe_gt *gt, struct xe_vm *pf_vm,
+				 struct xe_eudebug_pagefault *d_pf)
+{
+	/* if there no eudebug_pagefault then return */
+	if (!d_pf)
+		return;
+
+	handle_eu_debug_pagefault(gt, d_pf);
+
+	/*
+	 * TODO: Remove VMA added to handle eudebug pagefault
+	 */
+
+	release_eudebug_pagefault(gt, pf_vm, d_pf, true);
+
+	xe_vm_put(pf_vm);
+}
+
 static int send_pagefault_reply(struct xe_guc *guc,
 				struct xe_guc_pagefault_reply *reply)
 {
@@ -368,7 +625,10 @@ static void pf_queue_work_func(struct work_struct *w)
 	threshold = jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
 
 	while (get_pagefault(pf_queue, &amp;pf)) {
-		ret = handle_pagefault(gt, &amp;pf);
+		struct xe_eudebug_pagefault *d_pf = NULL;
+		struct xe_vm *pf_vm = NULL;
+
+		ret = handle_pagefault_start(gt, &amp;pf, &amp;pf_vm, &amp;d_pf);</pre>
    </blockquote>
    <p>I would move eu debug page fault handling code to a different
      files and here do: <br>
    </p>
    <p>    if (debugger_attched)</p>
    <p>        ret = <span style="white-space: pre-wrap">handle_pagefault_with_debugger_attach()</span></p>
    <p><span style="white-space: pre-wrap">else</span></p>
    <p><span style="white-space: pre-wrap">      </span>ret = <span
      style="white-space: pre-wrap">handle_pagefault()</span></p>
    <p>This keep code clean, easy to read and modify. <br>
    </p>
    <blockquote type="cite"
      cite="mid:20241021095904.439555-20-gwan-gyeong.mun@intel.com">
      <pre wrap="" class="moz-quote-pre">
 		if (unlikely(ret)) {
 			print_pagefault(xe, &amp;pf);
 			pf.fault_unsuccessful = 1;
@@ -386,7 +646,12 @@ static void pf_queue_work_func(struct work_struct *w)
 			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
 			FIELD_PREP(PFR_PDATA, pf.pdata);
 
-		send_pagefault_reply(&amp;gt-&gt;uc.guc, &amp;reply);
+		ret = send_pagefault_reply(&amp;gt-&gt;uc.guc, &amp;reply);
+		if (unlikely(ret)) {
+			drm_dbg(&amp;xe-&gt;drm, "GuC Pagefault reply failed: %d\n", ret);
+		}
+
+		handle_pagefault_end(gt, pf_vm, d_pf);
 
 		if (time_after(jiffies, threshold) &amp;&amp;
 		    pf_queue-&gt;tail != pf_queue-&gt;head) {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e3e8bce11e3d..bbbff17b90f9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3555,3 +3555,24 @@ int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
 	up_read(&amp;vm-&gt;userptr.notifier_lock);
 	return ret;
 }
+
+struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr)
+{
+	struct xe_vma *vma;
+	int err;
+
+	if (xe_vm_is_closed_or_banned(vm))
+		return ERR_PTR(-ENOENT);
+
+	vma = xe_vma_create(vm, NULL, 0, addr, addr + SZ_64K - 1, 0, VMA_CREATE_FLAG_IS_NULL);</pre>
    </blockquote>
    <br>
    <pre wrap="" class="moz-quote-pre">SZ_64K vs SZ_4K should be checked with the vm flags otherwise it will overwrite other pages. 

Regards,
Nirmoy
</pre>
    <blockquote type="cite"
      cite="mid:20241021095904.439555-20-gwan-gyeong.mun@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	if (IS_ERR_OR_NULL(vma))
+		return vma;
+
+	err = xe_vm_insert_vma(vm, vma);
+	if (err) {
+		xe_vma_destroy_late(vma);
+		return ERR_PTR(err);
+	}
+
+	return vma;
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 99b9a9b011de..3ac446cd3b89 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -284,3 +284,5 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
 
 int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
 		   void *buf, u64 len, bool write);
+
+struct xe_vma *xe_vm_create_scratch_vma(struct xe_vm *vm, u64 addr);
diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
index 2ebf21e15f5b..47856ca215ef 100644
--- a/include/uapi/drm/xe_drm_eudebug.h
+++ b/include/uapi/drm/xe_drm_eudebug.h
@@ -37,6 +37,7 @@ struct drm_xe_eudebug_event {
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE	8
 #define DRM_XE_EUDEBUG_EVENT_METADATA		9
 #define DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA 10
+#define DRM_XE_EUDEBUG_EVENT_PAGEFAULT		11
 
 	__u16 flags;
 #define DRM_XE_EUDEBUG_EVENT_CREATE		(1 &lt;&lt; 0)
@@ -218,6 +219,17 @@ struct drm_xe_eudebug_event_vm_bind_op_metadata {
 	__u64 metadata_cookie;
 };
 
+struct drm_xe_eudebug_event_pagefault {
+	struct drm_xe_eudebug_event base;
+	__u64 client_handle;
+	__u64 exec_queue_handle;
+	__u64 lrc_handle;
+	__u32 flags;
+	__u32 bitmask_size;
+	__u64 pagefault_address;
+	__u8 bitmask[];
+};
+
 #if defined(__cplusplus)
 }
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------xyrYQW5IEfUlN1PmYdjrqKMs--
