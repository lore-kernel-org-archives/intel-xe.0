Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948F7C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 17:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F5510EA73;
	Thu, 18 Jul 2024 17:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkYxU2ix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7129510E16B
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721322735; x=1752858735;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E0R68w84wvSUXwelpgyCPe6PKw8jrvzj9YwO30ZHxh8=;
 b=IkYxU2ixPM/unbLGDzGtO+iiO4yf8isAUWQmnRXfiOKK1x2tDT/NY2HP
 YuW6zxgllf/DvOCOMQqgvIa/a77jvqytpNOX43sb+t6tDr0+7bC4KYNSg
 rO72r7FhOOqHKveF3hLP7Vf6AhhFMRh64u6GKb72SorCU9A09xUraLry4
 uZtE1fox3z07WUbqGztVWAZqY3QbiB/WjNLtnUmW1PMkDx5pCOLK96afL
 zTvxc9qoe5XHUmhv8iunieJOpo/H7D6D1uivBK8JWyeVBUhFmqKyPhby9
 wb7ywNZGJHIVVORXKD0lXQNGCS/T6PbE9zTcfXXkyvfRB8pOK/CW00Y0A Q==;
X-CSE-ConnectionGUID: 1uAxGqnlRk+0zryDgQqhLQ==
X-CSE-MsgGUID: xJBdfiKZR2G7yUWWUdgxdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="41428537"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="41428537"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 10:12:14 -0700
X-CSE-ConnectionGUID: A/vLdppQSlKAiyvpf3Arsg==
X-CSE-MsgGUID: 9yCpLAgPQS+jUac9E5oQ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="55692832"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.207])
 ([10.245.244.207])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 10:12:12 -0700
Message-ID: <c91620c5-f7db-470b-b24b-c399bf02ad7a@intel.com>
Date: Thu, 18 Jul 2024 18:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe: Build PM into GuC CT layer
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, rodrigo.vivi@intel.com
References: <20240718155245.1481788-1-matthew.brost@intel.com>
 <20240718155245.1481788-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240718155245.1481788-2-matthew.brost@intel.com>
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

On 18/07/2024 16:52, Matthew Brost wrote:
> Take PM ref when a G2H is outstanding, drop when it is received.
> 
> To safely ensure we have PM ref when in the GuC CT layer, a PM ref needs
> to be held when scheduler messages are pending too.
> 
> v2:
>   - Add outer PM protections to xe_file_close (CI)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c     | 4 ++++
>   drivers/gpu/drm/xe/xe_guc_ct.c     | 5 +++++
>   drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++++
>   3 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 06cebaffb451..b68ab474e1a0 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -101,6 +101,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   	struct xe_exec_queue *q;
>   	unsigned long idx;
>   
> +	xe_pm_runtime_get(xe);
> +
>   	/*
>   	 * No need for exec_queue.lock here as there is no contention for it
>   	 * when FD is closing as IOCTLs presumably can't be modifying the
> @@ -126,6 +128,8 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   
>   	xe_drm_client_put(xef->client);
>   	kfree(xef);
> +
> +	xe_pm_runtime_put(xe);
>   }
>   
>   static const struct drm_ioctl_desc xe_ioctls[] = {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 7d2e937da1d8..560f7e4bf290 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -327,6 +327,8 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>   	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
>   		     state == XE_GUC_CT_STATE_STOPPED);
>   
> +	while (ct->g2h_outstanding--)
> +		xe_pm_runtime_put(ct_to_xe(ct));
>   	ct->g2h_outstanding = 0;
>   	ct->state = state;
>   
> @@ -501,6 +503,8 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>   
>   		ct->ctbs.g2h.info.space -= g2h_len;
>   		ct->g2h_outstanding += num_g2h;
> +		while (num_g2h--)
> +			xe_pm_runtime_get_noresume(ct_to_xe(ct));

Could potentially just grab on the 0->1 and only release on the 1->0? 
There is a device level lock being grabbed in the rpm code on every 
call, but not sure how big of a deal that is here.

>   	}
>   }
>   
> @@ -512,6 +516,7 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>   
>   	ct->ctbs.g2h.info.space += g2h_len;
>   	--ct->g2h_outstanding;
> +	xe_pm_runtime_put(ct_to_xe(ct));
>   }
>   
>   static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 860405527115..993d0344dc88 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1402,6 +1402,8 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>   	default:
>   		XE_WARN_ON("Unknown message type");
>   	}
> +
> +	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
>   }
>   
>   static const struct drm_sched_backend_ops drm_sched_ops = {
> @@ -1492,6 +1494,8 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>   static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
>   				   u32 opcode)
>   {
> +	xe_pm_runtime_get_noresume(guc_to_xe(exec_queue_to_guc(q)));
> +
>   	INIT_LIST_HEAD(&msg->link);
>   	msg->opcode = opcode;
>   	msg->private_data = q;
