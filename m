Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65841606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n7WB8DaX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FE889496;
	Mon, 23 Nov 2026 13:11:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583C889496
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 13:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795439512; x=1826975512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HY41BO6qMY7RubjwSmn0aul51cnaThpzDzj9QXu+uUA=;
 b=n7WB8DaXYw0mRLKWbVqse2yEfzzVlDG/YkzKkgoRlHjmKkAPpRi0qwSF
 rE43G3WPT0QSxbLccrs6M2MAPkJQKTEhxU1l6kUUvxeYFSRXaIX/BO1V0
 vCMa2W4tg2YgVRsK1h1rPvfHY/l1Ly0kh4oH2IHrMrumvFUyegt9pX2o3
 yPiExgYz+CyGo91wgnrCqS/Vwn6p+VUiuZlxS+80VWSLu6c1QB+dXnwuX
 znXEEkn5DHWb6fUP8XEWoCbuh5EOw+0MmYtpXcbbrqpjDytnj3bJxz61C
 8dIhfgavo1xsyA6ygwdeVxrAZKUvkvV6UNmir9TN038RwUEQE6kfg6Spt w==;
X-CSE-ConnectionGUID: tMTCmjyLTTejte1o4Y6aRw==
X-CSE-MsgGUID: +GwcfOt9SM2XDzEnEl0rdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4227788"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4227788"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 05:11:52 -0800
X-CSE-ConnectionGUID: wL7vDq48QvuNve0Bt+Osyg==
X-CSE-MsgGUID: 6OUUynzuQ2eKerVY3d1lJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11453546"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.251])
 ([10.245.244.251])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 05:11:50 -0800
Message-ID: <4ffe5baf-6ff6-4c61-a8bb-caf400900a8b@intel.com>
Date: Mon, 23 Nov 2026 13:11:48 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Scale suspend wait timeout with preempt
 timeout
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20261123123436.2114961-3-himal.prasad.ghimiray@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261123123436.2114961-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 12:34, Himal Prasad Ghimiray wrote:
> The suspend wait uses a fixed 5s timeout, but preempt_timeout_us can be
> set up to 10s via sysfs, causing queues to be banned while GuC is still
> legitimately preempting. Extend the timeout by preempt_timeout_us and
> min_run_period_ms.
> 
> v2:
> - Use long for ret to match wait_event_*_timeout() return type (Sashiko)
> - Skip preempt_timeout_us for multi-queue secondaries (Matt Auld)
> 
> Fixes: 627c961d672d ("drm/xe: Add timeout to preempt fences")
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 23 ++++++++++++++++++-----
>   1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 38069be11aa5..0e64b581f51a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2569,7 +2569,20 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
> -	int ret;
> +	long timeout;
> +	long ret;
> +
> +	/*
> +	 * The SUSPEND worker may sleep up to min_run_period_ms before disabling,
> +	 * and GuC may then take up to preempt_timeout_us (sysfs tunable up to
> +	 * XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX) to preempt the context. Keep the
> +	 * historical 5s as slack on top of both.
> +	 */
> +	timeout = HZ * 5;
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		timeout += usecs_to_jiffies(READ_ONCE(q->sched_props.preempt_timeout_us));
> +	if (q->vm)
> +		timeout += msecs_to_jiffies(q->vm->preempt.min_run_period_ms);
>   
>   	/*
>   	 * A kill does not clear suspend_pending, the queue may still be running
> @@ -2583,16 +2596,16 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
>   retry:
>   	if (blocking) {
>   		if (IS_SRIOV_VF(xe))
> -			ret = wait_event_timeout(guc->ct.wq, WAIT_COND, HZ * 5);
> +			ret = wait_event_timeout(guc->ct.wq, WAIT_COND, timeout);
>   		else
>   			ret = wait_event_timeout(q->guc->suspend_wait, WAIT_COND,
> -						 HZ * 5);
> +						 timeout);
>   	} else if (IS_SRIOV_VF(xe)) {
>   		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
> -						       vf_recovery(guc), HZ * 5);
> +						       vf_recovery(guc), timeout);
>   	} else {
>   		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
> -						       WAIT_COND, HZ * 5);
> +						       WAIT_COND, timeout);
>   	}
>   
>   	if (!blocking && vf_recovery(guc) && !xe_wedged(xe))

