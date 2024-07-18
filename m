Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541C4C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 18:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D3B10EAB9;
	Thu, 18 Jul 2024 18:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUIG6N0Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1431C10EAB9
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721328422; x=1752864422;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mBlxzJeLpS2PqTVP/hPVRNUFY6rwmuEAvBcpiwyseFU=;
 b=VUIG6N0YJ5uEa/yCbIp4xlRR1eJdLHsLfwiMr53y0a3eW3BnjYvhNMK0
 726IkyV4oBR81W9SikKrxCXesFZpUWUG8SLrflY1KHL0ZJF4FA7bYPg3C
 dxwFSYttXgWfTRzYZj7WTnPYda4tHiZtQOfYKtKrv6SX0nF103+g7yfK8
 dHtNxY9FVM8A+7/B7H8x6nmDewf0CvDIV+QeQECrWRz0sDYqfJ3Dh3kGq
 H5PsqdUS7RzYJ+PqE0amIjuauxZl3q2ZtDOpGQa6720b00w6TlbUS9QDX
 Hrsz7jY5KeH00oP/DnirS+FRL5+xDxhw1CmlzRYuVcU34zKltA2KJcpOs g==;
X-CSE-ConnectionGUID: dl3fBCgaRLyZA1ygzb24Pg==
X-CSE-MsgGUID: ZfRKm14pTXKS/7Q7hbN+Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="29526160"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="29526160"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:47:01 -0700
X-CSE-ConnectionGUID: Zs84kzD4SoanWmVr4UdcSg==
X-CSE-MsgGUID: STitByugTl6nYbJQsRlm0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="56019052"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 11:47:00 -0700
Message-ID: <a49fd80e-a772-43b4-acc4-b2f15ca873e5@linux.intel.com>
Date: Thu, 18 Jul 2024 20:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe: Build PM into GuC CT layer
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, nirmoy.das@intel.com, rodrigo.vivi@intel.com
References: <20240718173445.1490455-1-matthew.brost@intel.com>
 <20240718173445.1490455-2-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240718173445.1490455-2-matthew.brost@intel.com>
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


On 7/18/2024 7:34 PM, Matthew Brost wrote:
> Take PM ref when any G2H are outstanding, drop when none are
> outstanding.
>
> To safely ensure we have PM ref when in the GuC CT layer, a PM ref needs
> to be held when scheduler messages are pending too.
>
> v2:
>   - Add outer PM protections to xe_file_close (CI)
> v3:
>   - Only take PM ref 0->1 and drop on 1->0 (Matthew Auld)
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_device.c     | 4 ++++
>   drivers/gpu/drm/xe/xe_guc_ct.c     | 8 +++++++-
>   drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++++
>   3 files changed, 15 insertions(+), 1 deletion(-)
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
> index 7d2e937da1d8..e1d179fb7f43 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -327,6 +327,8 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>   	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
>   		     state == XE_GUC_CT_STATE_STOPPED);
>   
> +	if (ct->g2h_outstanding)
> +		xe_pm_runtime_put(ct_to_xe(ct));
>   	ct->g2h_outstanding = 0;
>   	ct->state = state;
>   
> @@ -499,6 +501,9 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
>   	if (g2h_len) {
>   		lockdep_assert_held(&ct->fast_lock);
>   
> +		if (!ct->g2h_outstanding)
> +			xe_pm_runtime_get_noresume(ct_to_xe(ct));
> +
>   		ct->ctbs.g2h.info.space -= g2h_len;
>   		ct->g2h_outstanding += num_g2h;
>   	}
> @@ -511,7 +516,8 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
>   		     ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
>   
>   	ct->ctbs.g2h.info.space += g2h_len;
> -	--ct->g2h_outstanding;
> +	if (!--ct->g2h_outstanding)
> +		xe_pm_runtime_put(ct_to_xe(ct));
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
