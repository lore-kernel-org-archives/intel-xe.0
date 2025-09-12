Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FAD8CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 10:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C8210EBFB;
	Fri, 12 Sep 2025 10:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pf8Z3aOE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A14210EBFB
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757672735; x=1789208735;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RFsgzYdmaqCpdyeXjPDtUuLCKAnS7YtGd68F7wVaRYA=;
 b=Pf8Z3aOEsThepnEKAmyWGR+zKW8m3ln4U6kn16LEX6A4tK+LvMtz5gGt
 1khwILEhB+wnTPWwqXBhb6MV2KJEpMpGCJMKCrXG801dq0wqo+FjKYHje
 24YLZtfKQFTaqKe/HQjFWc55Hx1kjin+/EkQ/9P3ZvC8yucJLmfakQU74
 XLFfSds7xXkTSGOXT7Y7vfYv5/mpMy8MntO4QiVbvzEhcnb0kWIHL9/ri
 gK3sK9GNjAap2PnINXXXI0AoI7O7qvlqw4QbrQbxrbOwhvwpV1HOWPzCj
 119ZSuC2JhT49TQQDCmCWaC57RyC1Uklp3Zh9YU405b+v3yOBGZxHrw1X w==;
X-CSE-ConnectionGUID: 53TnOKnoS5yt9Y0Ez4SKhg==
X-CSE-MsgGUID: ynkMNshLQn6wJMpjyTbNwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59952529"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="59952529"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 03:25:35 -0700
X-CSE-ConnectionGUID: yCw2uqjbQUSGVYsHELxnmw==
X-CSE-MsgGUID: zmvKovesRD2Qs1qJEuqZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="204927189"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.134])
 ([10.245.244.134])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 03:25:33 -0700
Message-ID: <0540896a-7286-4535-878e-c23451b1f734@intel.com>
Date: Fri, 12 Sep 2025 11:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] Add a Kconfig option for GPU work period
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, carlos.santa@intel.com
References: <20250912090354.2619418-1-aakash.deep.sarkar@intel.com>
 <20250912090354.2619418-8-aakash.deep.sarkar@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250912090354.2619418-8-aakash.deep.sarkar@intel.com>
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

On 12/09/2025 10:03, Aakash Deep Sarkar wrote:
> Since this requirement is intended only for Android, there's
> no reason to have it enabled by default in other distributions.
> So, better to have it guarded by a Kconfig option.
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>

I assume we will at least want this enabled in CI? Or is this already 
the case? There is quite a lot of stuff here so I think makes sense that 
this is part of CI going forward. For now it might be that you need to 
add a hack patch at the last patch in the series to turn this on so CI 
will test this. But might then need some way to ensure that this is 
always turned on by default in: https://gitlab.freedesktop.org/drm/xe/ci

> ---
>   drivers/gpu/drm/xe/Makefile        |   2 +-
>   drivers/gpu/drm/xe/xe_device.c     | 116 +++++++++++++++--------------
>   drivers/gpu/drm/xe/xe_exec_queue.c |   9 ++-
>   drivers/gpu/drm/xe/xe_user.h       |  13 ++++
>   drivers/gpu/trace/Kconfig          |  12 +++
>   5 files changed, 94 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 89212fc7ef44..9cc8743b8d7f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -325,7 +325,7 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>   
>   	xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
>   
> -	xe-y += xe_user.o
> +	xe-$(CONFIG_TRACE_GPU_WORK_PERIOD) += xe_user.o
>   
>   	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   		i915-display/intel_display_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b4692d45c7e9..569f3890bde2 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -110,64 +110,69 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   
>   	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
>   	if (task) {
> -		cred = get_task_cred(task);
> -		if (cred) {
> -			uid = (unsigned int) cred->euid.val;
> -			put_cred(cred);
> +		if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
> +			cred = get_task_cred(task);
> +			if (cred) {
> +				uid = (unsigned int) cred->euid.val;
> +				put_cred(cred);
> +			}
>   		}
>   		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
>   		xef->pid = task->pid;
>   		put_task_struct(task);
>   	}
>   
> -	if (uid < 0)
> -		return -ENOENT;
> +	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
> +		if (uid < 0)
> +			return -ENOENT;
>   
> -	INIT_LIST_HEAD(&xef->user_link);
> -	/*
> -	 * Check if the calling process/uid has already been registered
> -	 * with the xe device during a previous open call. If so then
> -	 * take a reference to this xe user and add this xe file to the
> -	 * filelist belonging to this xe user
> -	 */
> -	user = xe_user_lookup(xe, uid);
> -	if (!user) {
> +		INIT_LIST_HEAD(&xef->user_link);
>   		/*
> -		 * We couldn't find an existing xe user for the calling process.
> -		 * Allocate a new struct xe_user and register it with this xe
> -		 * device
> +		 * Check if the calling process/uid has already been registered
> +		 * with the xe device during a previous open call. If so then
> +		 * take a reference to this xe user and add this xe file to the
> +		 * filelist belonging to this xe user
>   		 */
> -		user = xe_user_alloc();
> -		if (!user)
> -			return -ENOMEM;
> -
> -		user->uid = uid;
> -		user->last_timestamp_ns = ktime_get_raw_ns();
> -		user->xe = xe;
> -
> -		ret = xa_alloc(&xe->work_period.users, &idx, user, xa_limit_32b, GFP_KERNEL);
> -		if (ret < 0)
> -			return ret;
> -
> -		user->id = idx;
> -		drm_dev_get(&xe->drm);
> -
> -		xe_user_get(user);
> -		if (!schedule_delayed_work(&user->delay_work,
> +		user = xe_user_lookup(xe, uid);
> +		if (!user) {
> +			/*
> +			 * We couldn't find an existing xe user for the calling process.
> +			 * Allocate a new struct xe_user and register it with this xe
> +			 * device
> +			 */
> +			user = xe_user_alloc();
> +			if (!user)
> +				return -ENOMEM;
> +
> +			user->uid = uid;
> +			user->last_timestamp_ns = ktime_get_raw_ns();
> +			user->xe = xe;
> +
> +			ret = xa_alloc(&xe->work_period.users, &idx, user,
> +					xa_limit_32b, GFP_KERNEL);
> +			if (ret < 0)
> +				return ret;
> +
> +			user->id = idx;
> +			drm_dev_get(&xe->drm);
> +
> +			xe_user_get(user);
> +			if (!schedule_delayed_work(&user->delay_work,
>   					msecs_to_jiffies(XE_WORK_PERIOD_INTERVAL)))
> -			xe_user_put(user);
> -	}
> +				xe_user_put(user);
> +		}
>   
> -	mutex_lock(&user->lock);
> -	list_add(&xef->user_link, &user->filelist);
> -	mutex_unlock(&user->lock);
> +		mutex_lock(&user->lock);
> +		list_add(&xef->user_link, &user->filelist);
> +		mutex_unlock(&user->lock);
>   
> -	/*
> -	 * We have already taken a reference to the xe_user in
> -	 * xe_user_lookup in case this xe file doesn't own the
> -	 * pointer to the xe_user.
> -	 */
> -	xef->user = user;
> +		/*
> +		 * We have already taken a reference to the xe_user in
> +		 * xe_user_lookup, in case this xe file doesn't own the
> +		 * pointer to the xe_user.
> +		 */
> +		xef->user = user;
> +	} // CONFIG_TRACE_GPU_WORK_PERIOD
>   	return 0;
>   }
>   
> @@ -183,11 +188,13 @@ static void xe_file_destroy(struct kref *ref)
>   	xe_drm_client_put(xef->client);
>   	kfree(xef->process_name);
>   
> -	if (xef->user) {
> -		mutex_lock(&xef->user->lock);
> -		list_del(&xef->user_link);
> -		xe_user_put(xef->user);
> -		mutex_unlock(&xef->user->lock);
> +	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
> +		if (xef->user) {
> +			mutex_lock(&xef->user->lock);
> +			list_del(&xef->user_link);
> +			xe_user_put(xef->user);
> +			mutex_unlock(&xef->user->lock);
> +		}
>   	}
>   	kfree(xef);
>   }
> @@ -523,9 +530,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   
>   	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>   
> -	xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
> -
> -	mutex_init(&xe->work_period.lock);
> +	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
> +		xa_init_flags(&xe->work_period.users, XA_FLAGS_ALLOC1);
> +		mutex_init(&xe->work_period.lock);
> +	}
>   
>   	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>   		/* Trigger a large asid and an early asid wrap. */
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2ee8a475f5ed..6a24463e13a4 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -907,9 +907,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>   	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>   	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>   
> -	// Accumulate the runtime in nanosec for this queue into the xe file.
> -	q->xef->active_duration_ns +=
> -		xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
> +	if (IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)) {
> +
> +		// Accumulate the runtime in ns for this queue
> +		q->xef->active_duration_ns +=
> +			xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
> +	}
>   
>   	drm_dev_exit(idx);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_user.h b/drivers/gpu/drm/xe/xe_user.h
> index 80948199e743..7c30bf470aa7 100644
> --- a/drivers/gpu/drm/xe/xe_user.h
> +++ b/drivers/gpu/drm/xe/xe_user.h
> @@ -72,8 +72,21 @@ struct xe_user {
>   	u64 last_timestamp_ns;
>   };
>   
> +#if IS_ENABLED(CONFIG_TRACE_GPU_WORK_PERIOD)
> +
>   struct xe_user *xe_user_alloc(void);
>   struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid);
> +#else
> +static inline struct xe_user *xe_user_alloc(void)
> +{
> +	return NULL;
> +}
> +
> +static inline struct xe_user *xe_user_lookup(struct xe_device *xe, u32 uid)
> +{
> +	return NULL;
> +}
> +#endif // CONFIG_TRACE_GPU_WORK_PERIOD
>   
>   static inline struct xe_user *
>   xe_user_get_unless_zero(struct xe_user *user)
> diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
> index cd3d19c4a201..34f2e08cf1be 100644
> --- a/drivers/gpu/trace/Kconfig
> +++ b/drivers/gpu/trace/Kconfig
> @@ -11,3 +11,15 @@ config TRACE_GPU_MEM
>   	  Tracepoint availability varies by GPU driver.
>   
>   	  If in doubt, say "N".
> +
> +config TRACE_GPU_WORK_PERIOD
> +	bool "Enable GPU work period tracepoint"
> +	default n
> +	help
> +	  Choose this option to enable tracepoint for tracking
> +	  GPU usage based on the UID. Intended for performance
> +	  profiling and required for Android.
> +
> +	  Tracepoint availability varies by GPU driver.
> +
> +	  If in doubt, say "N".

