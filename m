Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A07C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 21:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5710D10E1C0;
	Tue,  9 May 2023 21:05:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F65D10E1C0
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 21:05:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61A0F60FD2;
 Tue,  9 May 2023 21:05:00 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 3BD46C433D2;
 Tue,  9 May 2023 21:04:57 +0000 (UTC)
Date: Tue, 9 May 2023 17:04:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZFq1d1MB/d4UeZqz@rdvivi-mobl4>
References: <20230508210825.1405432-1-rodrigo.vivi@intel.com>
 <20230508210825.1405432-7-rodrigo.vivi@intel.com>
 <ZFm1KV4Ulw7cmHeK@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFm1KV4Ulw7cmHeK@DUT025-TGLU.fm.intel.com>
Subject: Re: [Intel-xe] [PATCH v3 07/11] drm/xe: Convert GuC Engine print to
 snapshot capture and print.
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 02:51:21AM +0000, Matthew Brost wrote:
> On Mon, May 08, 2023 at 05:08:21PM -0400, Rodrigo Vivi wrote:
> > The goal is to allow for a snapshot capture to be taken at the time
> > of the crash, while the print out can happen at a later time through
> > the exposed devcoredump virtual device.
> > 
> > v2: Handle memory allocation failures. (Matthew)
> > Do not use GFP_ATOMIC on cases like debugfs prints. (Matthew)
> > v3: checkpatch
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c              |   2 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 251 +++++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_guc_submit.h       |  11 +-
> >  drivers/gpu/drm/xe/xe_guc_submit_types.h |  91 ++++++++
> >  4 files changed, 310 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 985f6e901ee4..dc891ad1d367 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -857,5 +857,5 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
> >  	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >  
> >  	xe_guc_ct_print(&guc->ct, p, false);
> > -	xe_guc_submit_print(guc, p);
> > +	xe_guc_submit_print(guc, p, false);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 250e56ee2e75..b5ec1aa55451 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -718,7 +718,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> >  		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> >  }
> >  
> > -static void guc_engine_print(struct xe_engine *e, struct drm_printer *p);
> > +static void guc_engine_print(struct xe_engine *e, struct drm_printer *p,
> > +			     bool atomic);
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
> >  static void simple_error_capture(struct xe_engine *e)
> > @@ -746,7 +747,7 @@ static void simple_error_capture(struct xe_engine *e)
> >  
> >  		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> >  		xe_guc_ct_print(&guc->ct, &p, true);
> > -		guc_engine_print(e, &p);
> > +		guc_engine_print(e, &p, true);
> >  		for_each_hw_engine(hwe, guc_to_gt(guc), id) {
> >  			if (hwe->class != e->hwe->class ||
> >  			    !(BIT(hwe->logical_instance) & adj_logical_mask))
> > @@ -1596,76 +1597,240 @@ int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >  	return 0;
> >  }
> >  
> > -static void guc_engine_wq_print(struct xe_engine *e, struct drm_printer *p)
> > +static void
> > +guc_engine_wq_snapshot_capture(struct xe_engine *e,
> > +			       struct xe_guc_submit_engine_snapshot *snapshot)
> >  {
> >  	struct xe_guc *guc = engine_to_guc(e);
> >  	struct xe_device *xe = guc_to_xe(guc);
> >  	struct iosys_map map = xe_lrc_parallel_map(e->lrc);
> >  	int i;
> >  
> > +	snapshot->guc.wqi_head = e->guc->wqi_head;
> > +	snapshot->guc.wqi_tail = e->guc->wqi_tail;
> > +	snapshot->parallel.wq_desc.head = parallel_read(xe, map, wq_desc.head);
> > +	snapshot->parallel.wq_desc.tail = parallel_read(xe, map, wq_desc.tail);
> > +	snapshot->parallel.wq_desc.status = parallel_read(xe, map,
> > +							  wq_desc.wq_status);
> > +
> > +	if (snapshot->parallel.wq_desc.head !=
> > +	    snapshot->parallel.wq_desc.tail) {
> > +		for (i = snapshot->parallel.wq_desc.head;
> > +		     i != snapshot->parallel.wq_desc.tail;
> > +		     i = (i + sizeof(u32)) % WQ_SIZE)
> > +			snapshot->parallel.wq[i / sizeof(u32)] =
> > +				parallel_read(xe, map, wq[i / sizeof(u32)]);
> > +	}
> > +}
> > +
> > +static void
> > +guc_engine_wq_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> > +			     struct drm_printer *p)
> > +{
> > +	int i;
> > +
> >  	drm_printf(p, "\tWQ head: %u (internal), %d (memory)\n",
> > -		   e->guc->wqi_head, parallel_read(xe, map, wq_desc.head));
> > +		   snapshot->guc.wqi_head, snapshot->parallel.wq_desc.head);
> >  	drm_printf(p, "\tWQ tail: %u (internal), %d (memory)\n",
> > -		   e->guc->wqi_tail, parallel_read(xe, map, wq_desc.tail));
> > -	drm_printf(p, "\tWQ status: %u\n",
> > -		   parallel_read(xe, map, wq_desc.wq_status));
> > -	if (parallel_read(xe, map, wq_desc.head) !=
> > -	    parallel_read(xe, map, wq_desc.tail)) {
> > -		for (i = parallel_read(xe, map, wq_desc.head);
> > -		     i != parallel_read(xe, map, wq_desc.tail);
> > +		   snapshot->guc.wqi_tail, snapshot->parallel.wq_desc.tail);
> > +	drm_printf(p, "\tWQ status: %u\n", snapshot->parallel.wq_desc.status);
> > +
> > +	if (snapshot->parallel.wq_desc.head !=
> > +	    snapshot->parallel.wq_desc.tail) {
> > +		for (i = snapshot->parallel.wq_desc.head;
> > +		     i != snapshot->parallel.wq_desc.tail;
> >  		     i = (i + sizeof(u32)) % WQ_SIZE)
> >  			drm_printf(p, "\tWQ[%zu]: 0x%08x\n", i / sizeof(u32),
> > -				   parallel_read(xe, map, wq[i / sizeof(u32)]));
> > +				   snapshot->parallel.wq[i / sizeof(u32)]);
> >  	}
> >  }
> >  
> > -static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
> > +/**
> > + * xe_guc_engine_snapshot_capture - Take a quick snapshot of the GuC Engine.
> > + * @e: Xe Engine.
> > + * @atomic: Boolean to indicate if this is called from atomic context like
> > + * reset or from some regular path like debugfs.
> > + *
> > + * This can be printed out in a later stage like during dev_coredump
> > + * analysis.
> > + *
> > + * Returns: a GuC Submit Engine snapshot object that must be freed by the
> > + * caller, using `xe_guc_engine_snapshot_free`.
> > + */
> > +struct xe_guc_submit_engine_snapshot *
> > +xe_guc_engine_snapshot_capture(struct xe_engine *e, bool atomic)
> >  {
> > +	struct xe_guc *guc = engine_to_guc(e);
> > +	struct xe_device *xe = guc_to_xe(guc);
> >  	struct drm_gpu_scheduler *sched = &e->guc->sched;
> >  	struct xe_sched_job *job;
> > +	struct xe_guc_submit_engine_snapshot *snapshot;
> > +	int i;
> > +
> > +	snapshot = kzalloc(sizeof(*snapshot), atomic ? GFP_ATOMIC : GFP_KERNEL);
> > +
> > +	if (!snapshot) {
> > +		drm_err(&xe->drm, "Skipping GuC Engine snapshot entirely.\n");
> > +		return NULL;
> > +	}
> > +
> > +	snapshot->guc.id = e->guc->id;
> > +	memcpy(&snapshot->name, &e->name, sizeof(snapshot->name));
> > +	snapshot->class = e->class;
> > +	snapshot->logical_mask = e->logical_mask;
> > +	snapshot->width = e->width;
> > +	snapshot->refcount = kref_read(&e->refcount);
> > +	snapshot->sched_timeout = sched->timeout;
> > +	snapshot->sched_props.timeslice_us = e->sched_props.timeslice_us;
> > +	snapshot->sched_props.preempt_timeout_us =
> > +		e->sched_props.preempt_timeout_us;
> > +
> > +	snapshot->lrc = kmalloc_array(e->width, sizeof(struct lrc_snapshot),
> > +				      atomic ? GFP_ATOMIC : GFP_KERNEL);
> > +
> > +	if (!snapshot->lrc) {
> > +		drm_err(&xe->drm, "Skipping GuC Engine LRC snapshot.\n");
> > +	} else {
> > +		for (i = 0; i < e->width; ++i) {
> > +			struct xe_lrc *lrc = e->lrc + i;
> > +
> > +			snapshot->lrc[i].context_desc =
> > +				lower_32_bits(xe_lrc_ggtt_addr(lrc));
> > +			snapshot->lrc[i].head = xe_lrc_ring_head(lrc);
> > +			snapshot->lrc[i].tail.internal = lrc->ring.tail;
> > +			snapshot->lrc[i].tail.memory =
> > +				xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> > +			snapshot->lrc[i].start_seqno = xe_lrc_start_seqno(lrc);
> > +			snapshot->lrc[i].seqno = xe_lrc_seqno(lrc);
> > +		}
> > +	}
> > +
> > +	snapshot->schedule_state = atomic_read(&e->guc->state);
> > +	snapshot->engine_flags = e->flags;
> > +
> > +	snapshot->parallel_execution = xe_engine_is_parallel(e);
> > +	if (snapshot->parallel_execution)
> > +		guc_engine_wq_snapshot_capture(e, snapshot);
> > +
> > +	spin_lock(&sched->job_list_lock);
> > +	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
> > +	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
> > +					       sizeof(struct pending_list_snapshot),
> > +					       atomic ? GFP_ATOMIC : GFP_KERNEL);
> 
> This allocation is under a spin lock, it has to be GFP_ATOMIC.

ouch, indeed... I blindly converted those...

> Use
> should get a splat do the following command:
> 
> cat /sys/kernel/debug/dri/0/gt0/uc/guc_info
> 
> Can you make sure this works in the next rev?
> 
> Other than that LGTM.

Well, It looks like the safest way here is to make it entirely atomic.
Although the debugfs case is not atomic, if we use GFP_KERNEL for
snapshot it looks we might have a problem:

(unless I'm forgetting some annotation somewhere)

[  139.829507] ======================================================
[  139.835716] WARNING: possible circular locking dependency detected
[  139.841923] 6.3.0+ #4 Tainted: G     U     OE     
[  139.846739] ------------------------------------------------------
[  139.852946] cat/2841 is trying to acquire lock:
[  139.857497] ffffffff9ae6e580 (fs_reclaim){+.+.}-{0:0}, at: __kmem_cache_alloc_node+0x3a/0x2c0
[  139.866061] 
               but task is already holding lock:
[  139.871922] ffff8cb5af344c40 (&guc->submission_state.lock){+.+.}-{4:4}, at: xe_guc_submit_print+0x49/0xc0 [xe]
[  139.882019] 
               which lock already depends on the new lock.

[  139.890232] 
               the existing dependency chain (in reverse order) is:
[  139.897750] 
               -> #1 (&guc->submission_state.lock){+.+.}-{4:4}:
[  139.904917]        __mutex_lock+0xb2/0xbf0
[  139.909034]        xe_guc_submit_init+0x10f/0x180 [xe]
[  139.914240]        xe_gt_init+0x14c/0x3a0 [xe]
[  139.918764]        xe_device_probe+0x240/0x2c0 [xe]
[  139.923699]        xe_pci_probe+0x251/0x3b0 [xe]
[  139.928384]        local_pci_probe+0x3e/0x90
[  139.932672]        pci_device_probe+0xb3/0x220
[  139.937138]        really_probe+0x19f/0x400
[  139.941340]        __driver_probe_device+0x78/0x170
[  139.946240]        driver_probe_device+0x1f/0x90
[  139.950880]        __driver_attach+0xd2/0x1c0
[  139.955256]        bus_for_each_dev+0x74/0xb0
[  139.959636]        bus_add_driver+0x115/0x210
[  139.964012]        driver_register+0x55/0x100
[  139.968390]        do_one_initcall+0x6d/0x290
[  139.972766]        do_init_module+0x4a/0x220
[  139.977057]        __do_sys_finit_module+0x93/0xf0
[  139.981870]        do_syscall_64+0x58/0x80
[  139.985986]        entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  139.991584] 
               -> #0 (fs_reclaim){+.+.}-{0:0}:
[  139.997271]        __lock_acquire+0x175c/0x24d0
[  140.001821]        lock_acquire+0xcd/0x2c0
[  140.005938]        fs_reclaim_acquire+0xa5/0xe0
[  140.010490]        __kmem_cache_alloc_node+0x3a/0x2c0
[  140.015565]        kmalloc_trace+0x26/0xb0
[  140.019682]        xe_guc_submit_print+0x83/0xc0 [xe]
[  140.024815]        guc_info+0x53/0x70 [xe]
[  140.028966]        seq_read_iter+0x127/0x490
[  140.033258]        seq_read+0xc0/0xe0
[  140.036937]        full_proxy_read+0x53/0x80
[  140.041226]        vfs_read+0xba/0x310
[  140.044994]        ksys_read+0x64/0xe0
[  140.048762]        do_syscall_64+0x58/0x80
[  140.052878]        entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  140.058476] 
               other info that might help us debug this:

[  140.066515]  Possible unsafe locking scenario:

[  140.072462]        CPU0                    CPU1
[  140.077014]        ----                    ----
[  140.081566]   lock(&guc->submission_state.lock);
[  140.086206]                                lock(fs_reclaim);
[  140.091891]                                lock(&guc->submission_state.lock);
[  140.099059]   lock(fs_reclaim);
[  140.102216] 
                *** DEADLOCK ***

But this doesn't happen if I only allocate with GFP_ATOMIC...

am I missing something? or let's simply convert to atomic?

> 
> Matt
> 
> > +
> > +	if (!snapshot->pending_list) {
> > +		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
> > +	} else {
> > +		i = 0;
> > +		list_for_each_entry(job, &sched->pending_list, drm.list) {
> > +			snapshot->pending_list[i].seqno =
> > +				xe_sched_job_seqno(job);
> > +			snapshot->pending_list[i].fence =
> > +				dma_fence_is_signaled(job->fence) ? 1 : 0;
> > +			snapshot->pending_list[i].finished =
> > +				dma_fence_is_signaled(&job->drm.s_fence->finished)
> > +				? 1 : 0;
> > +			i++;
> > +		}
> > +	}
> > +
> > +	spin_unlock(&sched->job_list_lock);
> > +
> > +	return snapshot;
> > +}
> > +
> > +/**
> > + * xe_guc_engine_snapshot_print - Print out a given GuC Engine snapshot.
> > + * @snapshot: GuC Submit Engine snapshot object.
> > + * @p: drm_printer where it will be printed out.
> > + *
> > + * This function prints out a given GuC Submit Engine snapshot object.
> > + */
> > +void
> > +xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> > +			     struct drm_printer *p)
> > +{
> >  	int i;
> >  
> > -	drm_printf(p, "\nGuC ID: %d\n", e->guc->id);
> > -	drm_printf(p, "\tName: %s\n", e->name);
> > -	drm_printf(p, "\tClass: %d\n", e->class);
> > -	drm_printf(p, "\tLogical mask: 0x%x\n", e->logical_mask);
> > -	drm_printf(p, "\tWidth: %d\n", e->width);
> > -	drm_printf(p, "\tRef: %d\n", kref_read(&e->refcount));
> > -	drm_printf(p, "\tTimeout: %ld (ms)\n", sched->timeout);
> > -	drm_printf(p, "\tTimeslice: %u (us)\n", e->sched_props.timeslice_us);
> > +	if (!snapshot)
> > +		return;
> > +
> > +	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
> > +	drm_printf(p, "\tName: %s\n", snapshot->name);
> > +	drm_printf(p, "\tClass: %d\n", snapshot->class);
> > +	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
> > +	drm_printf(p, "\tWidth: %d\n", snapshot->width);
> > +	drm_printf(p, "\tRef: %d\n", snapshot->refcount);
> > +	drm_printf(p, "\tTimeout: %ld (ms)\n", snapshot->sched_timeout);
> > +	drm_printf(p, "\tTimeslice: %u (us)\n",
> > +		   snapshot->sched_props.timeslice_us);
> >  	drm_printf(p, "\tPreempt timeout: %u (us)\n",
> > -		   e->sched_props.preempt_timeout_us);
> > -	for (i = 0; i < e->width; ++i ) {
> > -		struct xe_lrc *lrc = e->lrc + i;
> > +		   snapshot->sched_props.preempt_timeout_us);
> >  
> > +	for (i = 0; snapshot->lrc && i < snapshot->width; ++i) {
> >  		drm_printf(p, "\tHW Context Desc: 0x%08x\n",
> > -			   lower_32_bits(xe_lrc_ggtt_addr(lrc)));
> > +			   snapshot->lrc[i].context_desc);
> >  		drm_printf(p, "\tLRC Head: (memory) %u\n",
> > -			   xe_lrc_ring_head(lrc));
> > +			   snapshot->lrc[i].head);
> >  		drm_printf(p, "\tLRC Tail: (internal) %u, (memory) %u\n",
> > -			   lrc->ring.tail,
> > -			   xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL));
> > +			   snapshot->lrc[i].tail.internal,
> > +			   snapshot->lrc[i].tail.memory);
> >  		drm_printf(p, "\tStart seqno: (memory) %d\n",
> > -			   xe_lrc_start_seqno(lrc));
> > -		drm_printf(p, "\tSeqno: (memory) %d\n", xe_lrc_seqno(lrc));
> > +			   snapshot->lrc[i].start_seqno);
> > +		drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->lrc[i].seqno);
> >  	}
> > -	drm_printf(p, "\tSchedule State: 0x%x\n", atomic_read(&e->guc->state));
> > -	drm_printf(p, "\tFlags: 0x%lx\n", e->flags);
> > -	if (xe_engine_is_parallel(e))
> > -		guc_engine_wq_print(e, p);
> > +	drm_printf(p, "\tSchedule State: 0x%x\n", snapshot->schedule_state);
> > +	drm_printf(p, "\tFlags: 0x%lx\n", snapshot->engine_flags);
> >  
> > -	spin_lock(&sched->job_list_lock);
> > +	if (snapshot->parallel_execution)
> > +		guc_engine_wq_snapshot_print(snapshot, p);
> >  
> > -	list_for_each_entry(job, &sched->pending_list, drm.list)
> > +	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
> > +	     i++)
> >  		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
> > -			   xe_sched_job_seqno(job),
> > -			   dma_fence_is_signaled(job->fence) ? 1 : 0,
> > -			   dma_fence_is_signaled(&job->drm.s_fence->finished) ?
> > -			   1 : 0);
> > -	spin_unlock(&sched->job_list_lock);
> > +			   snapshot->pending_list[i].seqno,
> > +			   snapshot->pending_list[i].fence,
> > +			   snapshot->pending_list[i].finished);
> > +}
> > +
> > +/**
> > + * xe_guc_engine_snapshot_free - Free all allocated objects for a given
> > + * snapshot.
> > + * @snapshot: GuC Submit Engine snapshot object.
> > + *
> > + * This function free all the memory that needed to be allocated at capture
> > + * time.
> > + */
> > +void xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot)
> > +{
> > +	if (!snapshot)
> > +		return;
> > +
> > +	kfree(snapshot->lrc);
> > +	kfree(snapshot->pending_list);
> > +	kfree(snapshot);
> > +}
> > +
> > +static void guc_engine_print(struct xe_engine *e, struct drm_printer *p,
> > +			     bool atomic)
> > +{
> > +	struct xe_guc_submit_engine_snapshot *snapshot;
> > +
> > +	snapshot = xe_guc_engine_snapshot_capture(e, atomic);
> > +	xe_guc_engine_snapshot_print(snapshot, p);
> > +	xe_guc_engine_snapshot_free(snapshot);
> >  }
> >  
> > -void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
> > +/**
> > + * xe_guc_submit_print - GuC Submit Print.
> > + * @guc: GuC.
> > + * @p: drm_printer where it will be printed out.
> > + * @atomic: Boolean to indicate if this is called from atomic context like
> > + * reset or from some regular path like debugfs.
> > + *
> > + * This function capture and prints snapshots of **all** GuC Engines.
> > + */
> > +void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p, bool atomic)
> >  {
> >  	struct xe_engine *e;
> >  	unsigned long index;
> > @@ -1675,6 +1840,6 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
> >  
> >  	mutex_lock(&guc->submission_state.lock);
> >  	xa_for_each(&guc->submission_state.engine_lookup, index, e)
> > -		guc_engine_print(e, p);
> > +		guc_engine_print(e, p, atomic);
> >  	mutex_unlock(&guc->submission_state.lock);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> > index 8002734d6f24..0ac50702f600 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> > @@ -13,7 +13,6 @@ struct xe_engine;
> >  struct xe_guc;
> >  
> >  int xe_guc_submit_init(struct xe_guc *guc);
> > -void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> >  
> >  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
> >  void xe_guc_submit_reset_wait(struct xe_guc *guc);
> > @@ -27,4 +26,14 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
> >  					   u32 len);
> >  int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
> >  
> > +struct xe_guc_submit_engine_snapshot *
> > +xe_guc_engine_snapshot_capture(struct xe_engine *e, bool atomic);
> > +void
> > +xe_guc_engine_snapshot_print(struct xe_guc_submit_engine_snapshot *snapshot,
> > +			     struct drm_printer *p);
> > +void
> > +xe_guc_engine_snapshot_free(struct xe_guc_submit_engine_snapshot *snapshot);
> > +void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p,
> > +			 bool atomic);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > index d23759959be9..88e855dae056 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > @@ -61,4 +61,95 @@ struct guc_submit_parallel_scratch {
> >  	u32 wq[WQ_SIZE / sizeof(u32)];
> >  };
> >  
> > +struct lrc_snapshot {
> > +	u32 context_desc;
> > +	u32 head;
> > +	struct {
> > +		u32 internal;
> > +		u32 memory;
> > +	} tail;
> > +	u32 start_seqno;
> > +	u32 seqno;
> > +};
> > +
> > +struct pending_list_snapshot {
> > +	u32 seqno;
> > +	bool fence;
> > +	bool finished;
> > +};
> > +
> > +/**
> > + * struct xe_guc_submit_engine_snapshot - Snapshot for devcoredump
> > + */
> > +struct xe_guc_submit_engine_snapshot {
> > +	/** @name: name of this engine */
> > +	char name[MAX_FENCE_NAME_LEN];
> > +	/** @class: class of this engine */
> > +	enum xe_engine_class class;
> > +	/**
> > +	 * @logical_mask: logical mask of where job submitted to engine can run
> > +	 */
> > +	u32 logical_mask;
> > +	/** @width: width (number BB submitted per exec) of this engine */
> > +	u16 width;
> > +	/** @refcount: ref count of this engine */
> > +	u32 refcount;
> > +	/**
> > +	 * @sched_timeout: the time after which a job is removed from the
> > +	 * scheduler.
> > +	 */
> > +	long sched_timeout;
> > +
> > +	/** @sched_props: scheduling properties */
> > +	struct {
> > +		/** @timeslice_us: timeslice period in micro-seconds */
> > +		u32 timeslice_us;
> > +		/** @preempt_timeout_us: preemption timeout in micro-seconds */
> > +		u32 preempt_timeout_us;
> > +	} sched_props;
> > +
> > +	/** @lrc: LRC Snapshot */
> > +	struct lrc_snapshot *lrc;
> > +
> > +	/** @schedule_state: Schedule State at the moment of Crash */
> > +	u32 schedule_state;
> > +	/** @engine_flags: Flags of the faulty engine */
> > +	unsigned long engine_flags;
> > +
> > +	/** @guc: GuC Engine Snapshot */
> > +	struct {
> > +		/** @wqi_head: work queue item head */
> > +		u32 wqi_head;
> > +		/** @wqi_tail: work queue item tail */
> > +		u32 wqi_tail;
> > +		/** @id: GuC id for this xe_engine */
> > +		u16 id;
> > +	} guc;
> > +
> > +	/**
> > +	 * @parallel_execution: Indication if the failure was during parallel
> > +	 * execution
> > +	 */
> > +	bool parallel_execution;
> > +	/** @parallel: snapshot of the useful parallel scratch */
> > +	struct {
> > +		/** @wq_desc: Workqueue description */
> > +		struct {
> > +			/** @head: Workqueue Head */
> > +			u32 head;
> > +			/** @tail: Workqueue Tail */
> > +			u32 tail;
> > +			/** @status: Workqueue Status */
> > +			u32 status;
> > +		} wq_desc;
> > +		/** @wq: Workqueue Items */
> > +		u32 wq[WQ_SIZE / sizeof(u32)];
> > +	} parallel;
> > +
> > +	/** @pending_list_size: Size of the pending list snapshot array */
> > +	int pending_list_size;
> > +	/** @pending_list: snapshot of the pending list info */
> > +	struct pending_list_snapshot *pending_list;
> > +};
> > +
> >  #endif
> > -- 
> > 2.39.2
> > 
