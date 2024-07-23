Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FC5C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 10:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E9610E546;
	Tue, 23 Jul 2024 10:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OF8phpAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A9410E546
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 10:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721729228; x=1753265228;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cgUaTq0KO6a1WOd41GI+2JHh+dm0l/vUQ50BfHzYmYQ=;
 b=OF8phpAFn4pRGrs2q+x3b0a04msqYm+w7TywOOjRzWU6mfOTGYgkhKZn
 +Xdt9Nk/lRIxQa2ivtx2muYL1JcuxqThWuNyGdXE+IW8oyUQvn0zjo0wC
 e+IQGhg73+1sHso92kw+9B1aR/uC2kn91frWzp2GY2VLAhpFoFN+91gNt
 sED4/MPs9eqnEwbuxnUmTrlWvKH6WC/2ecSL2R3cuoV7L/F1D8GnTxUlL
 W82duhRk5yMEt6hhOTDI5iwXAAZRxjYViGkYvfoNPBQjdTGAYlDwxlCeq
 175t6dbhJFKfS/VYW97X7XIsYBxAPawUl3hBFMz6P0MalitS4LMWInRXY A==;
X-CSE-ConnectionGUID: ojgTlyOAR36ZzdVDWsFWRw==
X-CSE-MsgGUID: 4G0Re6IyQ265hSB+jcJpDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19478279"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="19478279"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 03:07:07 -0700
X-CSE-ConnectionGUID: lWiEG62WR5iPP6WLXzpNRA==
X-CSE-MsgGUID: +MOgZDYxSNa19NDRaioCEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="57024874"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.253])
 ([10.245.245.253])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 03:07:07 -0700
Message-ID: <d430a711-1e0c-4d49-81e8-bb34d7e831e5@intel.com>
Date: Tue, 23 Jul 2024 11:07:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Store process name and pid in xe file
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240723042428.1701998-1-matthew.brost@intel.com>
 <20240723042428.1701998-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240723042428.1701998-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 23/07/2024 05:24, Matthew Brost wrote:
> An xe file can outlive the associated process as the GPU cleanup is just
> triggered upon file close (process kill) and completes sometime later.
> If the file close triggers error conditions (GPU hangs) the process
> cannot be safely referenced to retrieve the name and pid for debug
> information. Store the process name and pid directly in the xe file to
> be safe.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Also if you look at drm_file_update_pid(), things look pretty scary, so 
this sounds very sensible to me.

> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c  | 10 ++--------
>   drivers/gpu/drm/xe/xe_device.c       |  9 +++++++++
>   drivers/gpu/drm/xe/xe_device_types.h | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_guc_submit.c   | 10 ++--------
>   4 files changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 62c2b10fbf1d..d8d8ca2c19d3 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -171,7 +171,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   	u32 adj_logical_mask = q->logical_mask;
>   	u32 width_mask = (0x1 << q->width) - 1;
>   	const char *process_name = "no process";
> -	struct task_struct *task = NULL;
>   
>   	int i;
>   	bool cookie;
> @@ -179,14 +178,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   	ss->snapshot_time = ktime_get_real();
>   	ss->boot_time = ktime_get_boottime();
>   
> -	if (q->vm && q->vm->xef) {
> -		task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
> -		if (task)
> -			process_name = task->comm;
> -	}
> +	if (q->vm && q->vm->xef)
> +		process_name = q->vm->xef->process_name;
>   	strscpy(ss->process_name, process_name);
> -	if (task)
> -		put_task_struct(task);
>   
>   	ss->gt = q->gt;
>   	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b677608eb592..5a7b66703aa1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -64,6 +64,7 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   	struct xe_drm_client *client;
>   	struct xe_file *xef;
>   	int ret = -ENOMEM;
> +	struct task_struct *task = NULL;
>   
>   	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
>   	if (!xef)
> @@ -92,6 +93,13 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   	file->driver_priv = xef;
>   	kref_init(&xef->refcount);
>   
> +	task = get_pid_task(file->pid, PIDTYPE_PID);

We should probably access file->pid with rcu_access_pointer() here. In 
practice it shouldn't really matter here, but the pointer is annotated 
with __rcu so we should respect that.

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +	if (task) {
> +		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
> +		xef->pid = task->pid;
> +		put_task_struct(task);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -110,6 +118,7 @@ static void xe_file_destroy(struct kref *ref)
>   	spin_unlock(&xe->clients.lock);
>   
>   	xe_drm_client_put(xef->client);
> +	kfree(xef->process_name);
>   	kfree(xef);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 36252d5b1663..5b7292a9a66d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -582,6 +582,18 @@ struct xe_file {
>   	/** @client: drm client */
>   	struct xe_drm_client *client;
>   
> +	/**
> +	 * @process_name: process name for file handle, used to safely output
> +	 * during error situations where xe file can outlive process
> +	 */
> +	char *process_name;
> +
> +	/**
> +	 * @pid: pid for file handle, used to safely output uring error
> +	 * situations where xe file can outlive process
> +	 */
> +	pid_t pid;
> +
>   	/** @refcount: ref count of this xe file */
>   	struct kref refcount;
>   };
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index da2ead86b9ae..a4570631926f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1072,7 +1072,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	const char *process_name = "no process";
> -	struct task_struct *task = NULL;
>   	int err = -ETIME;
>   	pid_t pid = -1;
>   	int i = 0;
> @@ -1172,17 +1171,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	}
>   
>   	if (q->vm && q->vm->xef) {
> -		task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);
> -		if (task) {
> -			process_name = task->comm;
> -			pid = task->pid;
> -		}
> +		process_name = q->vm->xef->process_name;
> +		pid = q->vm->xef->pid;
>   	}
>   	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
>   		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>   		     q->guc->id, q->flags, process_name, pid);
> -	if (task)
> -		put_task_struct(task);
>   
>   	trace_xe_sched_job_timedout(job);
>   
