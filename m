Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D5160A5BE8
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RbNFCTPi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637E0112AD8;
	Fri, 20 Nov 2026 17:21:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F44B112AD8
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 17:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795195256; x=1826731256;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p7LFtYSUAtTOjkILkaiYABX8Usx12mGPKASZOaSFhkY=;
 b=RbNFCTPisQoR0WAlh/qwhr/UERBVKKggqAb0oxYvzT1cjeI7NwyPj1+v
 raN62De+pHpX6CNCewB8a/+kNnagqZiFSJpuAMyndv5AF9+rnQSEwZAAG
 HI//yCPcgsoYJPe0KkNrxMjnTS+0cDaZWgdU+Wf6oVgfBRjFKR0+Tcc3J
 Exl5Q1ukBEmi+30R2XBF9+3+qrWFE8SSrXQlqQs56F3xiWtkfvbNdF63X
 iYX6mte9FDGHXh+crOvF3wL82gKgzIe6yAIFcxzL7ttQFUSrCMRNtLvnw
 lBhXiUZMTT7xxxR6xa9O9CINFCPE7zcs8JIBiWUyLfQB+UYbE0e8Q/zBx w==;
X-CSE-ConnectionGUID: LU6oWX7lTm+W0lPMEC+Iag==
X-CSE-MsgGUID: 8Vna/nnMRWqWbz/s0SG+Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4087480"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4087480"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 09:20:56 -0800
X-CSE-ConnectionGUID: 1lBsiJxgTpuv4cTMKVUXKg==
X-CSE-MsgGUID: ex5CbWYLQ2CBGc02audZtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11321499"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.23])
 ([10.245.244.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 09:20:55 -0800
Message-ID: <c2a0f66e-f6f0-419d-8fa2-e10339808394@intel.com>
Date: Fri, 20 Nov 2026 17:20:53 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/guc: Scale suspend wait timeout with preempt
 timeout
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20261120160826.2045426-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261120160826.2045426-2-himal.prasad.ghimiray@intel.com>
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

On 20/11/2026 16:08, Himal Prasad Ghimiray wrote:
> The suspend wait uses a fixed 5s timeout, but preempt_timeout_us can be
> set up to 10s via sysfs, causing queues to be banned while GuC is still
> legitimately preempting. Extend the timeout by preempt_timeout_us and
> min_run_period_ms.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e7c2778029c..0898ee29f460 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2532,8 +2532,20 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
> +	long timeout;
>   	int ret;
>   
> +	/*
> +	 * The SUSPEND worker may sleep up to min_run_period_ms before disabling,
> +	 * and GuC may then take up to preempt_timeout_us (sysfs tunable up to
> +	 * XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX) to preempt the context. Keep the
> +	 * historical 5s as slack on top of both.
> +	 */
> +	timeout = HZ * 5 +
> +		usecs_to_jiffies(READ_ONCE(q->sched_props.preempt_timeout_us));

Does it makes sense to apply the preempt_timeout for 
xe_exec_queue_is_multi_queue_secondary()? It sounds like in theory that 
is more a sw thing wrt to completing the suspend/preempt? It rather 
happens via primary?

> +	if (q->vm)
> +		timeout += msecs_to_jiffies(q->vm->preempt.min_run_period_ms);
> +
>   	/*
>   	 * A kill does not clear suspend_pending, the queue may still be running
>   	 * on the hardware, so exec_queue_killed() is what ends the wait in that
> @@ -2546,16 +2558,16 @@ static int guc_exec_queue_wait_suspend_done(struct xe_exec_queue *q, bool blocki
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

