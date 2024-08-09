Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7542DC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 19:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5C710E9F6;
	Fri,  9 Aug 2024 19:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fl/2kyjv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DD010E9F6
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 19:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723233064; x=1754769064;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=iXYUKZqabGz/x1mxi71l3qDro11hMbbWOeR1G8baI/w=;
 b=Fl/2kyjv8ZSnBBprVBetDD0G9nZJ0FwajkTHbL2NnVmTKqd+/s7YpaRf
 hP8XjdWVvcBAHe2MQji6iTj0uesilF1eaHjwg3o2B7k2DmFc1cVUz7xjc
 hg6UyeZut86HDyIWTLt5VUldYfX+RMBtXK4unyEqkLHnIkEoKCQugVE2z
 DQ6udzjc5KsZuzGWOYE/zrABVUPFsvVUfDKF7fM8Yisnb4PEPj59fSs9N
 vCnVl+vc6N7Ns87v1LKOkj6U5JpWrW9sqY/CGW41TAMmKKUtL4hzn3zjI
 9eZc4UfV7N9AZgRAZ3arNTDTcCzt1ZY44/ieOBBhDUM5aIXKP+yaOF1Y+ g==;
X-CSE-ConnectionGUID: uu+4BasFRnS+0kkMXXWLDg==
X-CSE-MsgGUID: gydx2YBLSnWPJiXyWCsH7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="43941661"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="43941661"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:51:03 -0700
X-CSE-ConnectionGUID: AS6EntzDRfe2rGTVI/iZRg==
X-CSE-MsgGUID: G97kepBJRXGXWnKQWlFuWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; d="scan'208";a="62313719"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.192])
 ([10.245.245.192])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 12:51:02 -0700
Message-ID: <5e48b665-dd7f-4707-a963-9d5e8fd53e14@linux.intel.com>
Date: Fri, 9 Aug 2024 21:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Move VM dma-resv lock from xe_exec_queue_create
 to __xe_exec_queue_init
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240724152831.1848325-1-matthew.brost@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240724152831.1848325-1-matthew.brost@intel.com>
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2024-07-24 kl. 17:28, skrev Matthew Brost:
> The critical section which requires the VM dma-resv is the call
> xe_lrc_create in __xe_exec_queue_init. Move this lock to
> __xe_exec_queue_init holding it just around xe_lrc_create. Not only is
> good practice, this also fixes a locking double of the VM dma-resv in
> the error paths of __xe_exec_queue_init as xe_lrc_put tries to acquire
> this too resulting in a deadlock.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matthw Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 69867a7b7c77..0d72846af9bf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -105,22 +105,35 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>   
>   static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   {
> +	struct xe_vm *vm = q->vm;
>   	int i, err;
>   
> +	if (vm) {
> +		err = xe_vm_lock(vm, true);
> +		if (err)
> +			return err;
> +	}
> +
>   	for (i = 0; i < q->width; ++i) {
>   		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K);
>   		if (IS_ERR(q->lrc[i])) {
>   			err = PTR_ERR(q->lrc[i]);
> -			goto err_lrc;
> +			goto err_unlock;
>   		}
>   	}
>   
> +	if (vm)
> +		xe_vm_unlock(vm);
> +
>   	err = q->ops->init(q);
>   	if (err)
>   		goto err_lrc;
>   
>   	return 0;
>   
> +err_unlock:
> +	if (vm)
> +		xe_vm_unlock(vm);
>   err_lrc:
>   	for (i = i - 1; i >= 0; --i)
>   		xe_lrc_put(q->lrc[i]);
> @@ -140,15 +153,7 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
>   	if (IS_ERR(q))
>   		return q;
>   
> -	if (vm) {
> -		err = xe_vm_lock(vm, true);
> -		if (err)
> -			goto err_post_alloc;
> -	}
> -
>   	err = __xe_exec_queue_init(q);
> -	if (vm)
> -		xe_vm_unlock(vm);
>   	if (err)
>   		goto err_post_alloc;
>   

