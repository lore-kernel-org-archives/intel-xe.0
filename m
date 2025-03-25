Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE12C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 10:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E56E10E064;
	Tue, 25 Mar 2025 10:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HaF5VTcA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DF110E064
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742898335; x=1774434335;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JE0BSjhoVsEGjUJagTQ29pzRrWmKQx0DyQ6Jh8X6xBo=;
 b=HaF5VTcAlL5iOz+Y3NwlcjZS8UTJgPDBQ2WFn6YTUbiNbJ13qZYC4VSs
 z/16Pgg/wfmaVsZC+q0YW62XJO3c7J4+sdDgg6kO+lmwYs9MuZPM/fGyD
 aQFOt54SZdghIM+XqvVsiGW+VBOJd8ieYWSsJZ0t60GoLidFZ3ETSN1VZ
 14Xx1mXt9tONBAxbLS1+hCMYX+UDeUywGKbbu0qSu96e3uoinCl2N0kLi
 PR6H89YMDP65YfN22N3hrmg5VP8wa3qvVOxbQ+hs12rZMwFrjrjC2J8K1
 3WSGVYGbgaBOsOMGar53w2/dogShZ1OwA7U6s2C3TFQQknxrAWqRBes4O A==;
X-CSE-ConnectionGUID: RqvXhlPyRBy5DB9z6Uyt4g==
X-CSE-MsgGUID: R9yNCZetTImOqpMOzWEUXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="61661079"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="61661079"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:25:35 -0700
X-CSE-ConnectionGUID: N82Pm5AgSVObUhEElrfCQg==
X-CSE-MsgGUID: 3YzBgYMpTRSCe3URi/2Xlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124367148"
Received: from savramon-mobl1 (HELO [10.245.244.111]) ([10.245.244.111])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:25:34 -0700
Message-ID: <1bf95838-054f-4a9c-97fb-960be8c2562e@linux.intel.com>
Date: Tue, 25 Mar 2025 11:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] drm/xe: Implement
 DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, carlos.santa@intel.com
References: <20250320192831.3842138-1-matthew.brost@intel.com>
 <20250320192831.3842138-10-matthew.brost@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250320192831.3842138-10-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 2025-03-20 20:28, Matthew Brost wrote:
> Implement DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE which sets the exec
> queue default state to user data passed in. The intent is for a Mesa
> tool to use this replay GPU hangs.
> 
> v2:
>  - Enable the flag DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE
>  - Fix the page size math calculation to avoid a crash
> 
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 32 ++++++++++++++++--
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
>  drivers/gpu/drm/xe/xe_execlist.c         |  2 +-
>  drivers/gpu/drm/xe/xe_lrc.c              | 42 +++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_lrc.h              |  3 +-
>  5 files changed, 67 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 606922d9dd73..4d8c0aae6f55 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -47,6 +47,7 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>  	if (q->xef)
>  		xe_file_put(q->xef);
>  
> +	kvfree(q->replay_state);
>  	kfree(q);
>  }
>  
> @@ -139,7 +140,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>  	}
>  
>  	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> +		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> +					  SZ_16K, q->msix_vec, flags);
>  		if (IS_ERR(q->lrc[i])) {
>  			err = PTR_ERR(q->lrc[i]);
>  			goto err_unlock;
> @@ -460,6 +462,30 @@ exec_queue_set_pxp_type(struct xe_device *xe, struct xe_exec_queue *q, u64 value
>  	return xe_pxp_exec_queue_set_type(xe->pxp, q, DRM_XE_PXP_TYPE_HWDRM);
>  }
>  
> +static int exec_queue_set_hang_replay_state(struct xe_device *xe,
> +					    struct xe_exec_queue *q,
> +					    u64 value)
> +{
> +	size_t size = xe_gt_lrc_hang_replay_size(q->gt, q->class);
> +	u64 __user *address = u64_to_user_ptr(value);
> +	void *ptr;
> +	int err;
> +
> +	ptr = kvmalloc(size, GFP_KERNEL);
> +	if (!ptr)
> +		return -ENOMEM;
> +
> +	err = __copy_from_user(ptr, address, size);
> +	if (XE_IOCTL_DBG(xe, err)) {
> +		kvfree(ptr);
> +		return -EFAULT;
> +	}
> +
> +	q->replay_state = ptr;

Seems this can be replaced with a call to vmemdup_user ?

With the changes to this patch, stolen mem and ack from userspace side:

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Best regards,
~Maarten
