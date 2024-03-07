Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480A8C48BF6
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 10:53:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1222E113774;
	Thu,  7 Mar 2024 10:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7bUUoUl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D86113774
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 10:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709808793; x=1741344793;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kzbLJwqOZMr6O69Q9Pjs4DNerTKvS8gWmYlunDPpZrI=;
 b=W7bUUoUl1WQg2/1uwFhhJzYAxoqAPW3xWN7/RQOIutLQhFNN7Kej3C7j
 uSe57MToAdnts6yWRz3kDqdIxd39dSlyK9JPqo91fXzG50ObTrE9dbid3
 gSiN3Lv5HqGKiu6rfwk+5voIcyBNJ4ybedldwRFFZrQd64BbObOvUSwwm
 gW38uc8L3tVhDBFXpu0VlVRLiQD46cIl6YbHAD+djl4kZAt7AKVGsJGym
 pqf6J4JaCg+tCFwMdHgzu1oZUrBs3dNwedIfOkC9IYyY+7fd9QGRFDz09
 HadR/rRGJ7Zk7BcKkbkY54ee9vlJSqDrtEiKF/9uaYilCM6SfSlQ1HbR2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="29913544"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="29913544"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="10625867"
Received: from cpetrove-mobl.ger.corp.intel.com (HELO [10.249.46.111])
 ([10.249.46.111])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 02:53:10 -0800
Message-ID: <ce222fff-d962-4c65-9d84-9306ea91353d@linux.intel.com>
Date: Thu, 7 Mar 2024 11:53:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe/devcoredump: Lock snap_mutex earlier
Content-Language: en-US
To: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240304140514.24768-1-jose.souza@intel.com>
 <20240304140514.24768-3-jose.souza@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240304140514.24768-3-jose.souza@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hey,

On 2024-03-04 15:05, José Roberto de Souza wrote:
> In case job gets signaled while snapshot capture is running this
> prevents UMD from unbind VMAs that needs to be captured.
How does this protect things exactly?

It could still have happened before devcoredump_snapshot is called. I 
think we should focus on protecting VM data only, if it happens to 
unbind, it could have happened before devcoredump_snapshot was ever 
called. All we can do its ensure that we dump without causing security 
issues, which the current code already does.

Cheers,
~Maarten

> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c | 7 +++++++
>   drivers/gpu/drm/xe/xe_vm.c          | 2 --
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 4ab0feca55cdd..24d27f1c9efc6 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -162,6 +162,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   	int i;
>   	bool cookie;
>   
> +	if (q->vm)
> +		mutex_lock(&q->vm->snap_mutex);
> +
>   	ss->snapshot_time = ktime_get_real();
>   	ss->boot_time = ktime_get_boottime();
>   
> @@ -197,6 +200,10 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   	queue_work(system_unbound_wq, &ss->work);
>   
>   	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> +
> +	if (q->vm)
> +		mutex_unlock(&q->vm->snap_mutex);
> +
>   	dma_fence_end_signalling(cookie);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f7d20bf9b33a9..544907b09289a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3328,7 +3328,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>   	if (!vm)
>   		return NULL;
>   
> -	mutex_lock(&vm->snap_mutex);
>   	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
>   		if (gpuva->flags & XE_VMA_DUMPABLE)
>   			num_snaps++;
> @@ -3373,7 +3372,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>   	}
>   
>   out_unlock:
> -	mutex_unlock(&vm->snap_mutex);
>   	return snap;
>   }
>   
